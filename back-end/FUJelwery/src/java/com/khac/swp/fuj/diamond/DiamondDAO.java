package com.khac.swp.fuj.diamond;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiamondDAO {

    Connection conn = DBUtils.getConnection();
    ResultSet rs = null;

    public List<DiamondDTO> list(String keyword, String sortCol, int page, int pageSize) {
        List<DiamondDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT d.diamondID, d.diamondName, d.diamondImage, d.origin, d.dpID, d.certificateID, "
                    + "dp.diamondSize, dp.caratWeight, dp.color, dp.clarity, dp.cut, FORMAT(dp.price, 'N0') AS price "
                    + "FROM Diamond d LEFT JOIN DiamondPrice dp ON d.dpID = dp.dpID "
                    + "WHERE d.isDeleted = 'active' ";

            // Append conditions based on keyword
            if (keyword != null && !keyword.isEmpty()) {
                sql += "AND (d.diamondName LIKE ? OR dp.diamondSize LIKE ? OR dp.caratWeight LIKE ? OR dp.color LIKE ? OR dp.clarity LIKE ? OR dp.price LIKE ?) ";
            }

            // Append sorting
            if (sortCol != null && !sortCol.isEmpty()) {
                // Check if sortCol contains both column name and direction (e.g., "columnName ASC")
                if (sortCol.contains(" ")) {
                    sql += "ORDER BY " + sortCol;
                } else {
                    sql += "ORDER BY " + sortCol + " ASC ";
                }
            } else {
                // Default sorting if none provided
                sql += "ORDER BY d.diamondID ASC ";
            }

            // Pagination: OFFSET and FETCH NEXT
            sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement stmt = con.prepareStatement(sql);

            // Set parameters
            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                String likeParam = "%" + keyword + "%";
                stmt.setString(paramIndex++, likeParam);
                stmt.setString(paramIndex++, likeParam);
                stmt.setString(paramIndex++, likeParam);
                stmt.setString(paramIndex++, likeParam);
                stmt.setString(paramIndex++, likeParam);
                stmt.setString(paramIndex++, likeParam);
            }

            stmt.setInt(paramIndex++, (page - 1) * pageSize); // Calculate offset
            stmt.setInt(paramIndex, pageSize); // Set number of rows to fetch

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                // Retrieve data from result set and create DiamondDTO objects
                DiamondDTO diamond = new DiamondDTO();
                diamond.setDiamondID(rs.getInt("diamondID"));
                diamond.setDiamondName(rs.getString("diamondName"));
                diamond.setDiamondImage(rs.getString("diamondImage"));
                diamond.setOrigin(rs.getString("origin"));
                diamond.setDpID(rs.getInt("dpID"));
                diamond.setCertificateID(rs.getInt("certificateID"));
                diamond.setDiamondSize(rs.getDouble("diamondSize"));
                diamond.setCaratWeight(rs.getDouble("caratWeight"));
                diamond.setColor(rs.getString("color"));
                diamond.setClarity(rs.getString("clarity"));
                diamond.setCut(rs.getString("cut"));
                diamond.setDiamondPrice(rs.getString("price"));

                list.add(diamond);
            }

            // Close resources
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalDiamonds(String keyword) {
        int total = 0;
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM Diamond d WHERE d.isDeleted = 'active' ";

            // Append conditions based on keyword
            if (keyword != null && !keyword.isEmpty()) {
                sql += "AND (d.diamondName LIKE ? OR d.origin LIKE ?)";
            }

            stmt = con.prepareStatement(sql);

            // Set parameters for keyword search
            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
            }

            rs = stmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println("Error in retrieving total diamonds count. Details:" + ex.getMessage());
            ex.printStackTrace();
        } finally {
            // Close resources in a finally block to ensure they are always closed
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error closing resources. Details:" + ex.getMessage());
                ex.printStackTrace();
            }
        }
        return total;
    }

    public DiamondDTO load(int diamondID) {

        String sql = "SELECT \n"
                + " COALESCE(r.ringID, 0) AS ringID,  \n"
                + " d.diamondID, \n"
                + " d.diamondName, \n"
                + " d.diamondImage, \n"
                + " d.origin, \n"
                + " d.dpID, \n"
                + " d.certificateID, \n"
                + " dp.diamondSize, \n"
                + " dp.caratWeight, \n"
                + " dp.color, \n"
                + " dp.clarity, \n"
                + " dp.cut, \n"
                + " c.description,\n"
                + " r.ringName,\n"
                + " FORMAT(dp.price, 'N0') AS price, \n"
                + " d.isDeleted \n"
                + " FROM \n"
                + " Diamond d \n"
                + " LEFT JOIN DiamondPrice dp ON d.dpID = dp.dpID \n"
                + " LEFT JOIN Ring r ON d.diamondID = r.diamondID \n"
                + " LEFT JOIN Certificate c on d.certificateID = c.certificateID\n"
                + " WHERE \n"
                + " d.diamondID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, diamondID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String ringName = rs.getString("ringName");
                String certificateName = rs.getString("description");
                int ringID = rs.getInt("ringID");
                int diamondid = rs.getInt("diamondID");
                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int dpID = rs.getInt("dpID");
                int certificateID = rs.getInt("certificateID");
                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("color");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                String price = rs.getString("price");
                String status = rs.getString("isDeleted");

                DiamondDTO diamond = new DiamondDTO();
                diamond.setRingID(ringID);
                diamond.setRingName(ringName);
                diamond.setCertificateName(certificateName);
                diamond.setDiamondID(diamondid);
                diamond.setDiamondName(diamondName);
                diamond.setDiamondImage(diamondImage);
                diamond.setOrigin(origin);
                diamond.setDpID(dpID);
                diamond.setCertificateID(certificateID);
                diamond.setDiamondSize(diamondSize);
                diamond.setCaratWeight(caratWeight);
                diamond.setColor(color);
                diamond.setClarity(clarity);
                diamond.setCut(cut);
                diamond.setDiamondPrice(price);
                diamond.setStatus(status);
                return diamond;
            }
        } catch (SQLException ex) {
            System.out.println("Query Diamonds error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(DiamondDTO diamond) {
        String sql = "INSERT INTO [Diamond] (diamondName, diamondImage, origin, dpID, certificateID, isDeleted) VALUES (?, ?, ?, ?, ?, 'active' )";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, diamond.getDiamondName());
            ps.setString(2, diamond.getDiamondImage());
            ps.setString(3, diamond.getOrigin());
            ps.setInt(4, diamond.getDpID());
            ps.setInt(5, diamond.getCertificateID());

            ps.executeUpdate();
            conn.close();
            return diamond.getDiamondID();
        } catch (SQLException ex) {
            System.out.println("Insert Diamond error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(DiamondDTO diamond) {
        String sql = "UPDATE [Diamond] SET diamondName = ?, diamondImage = ?, origin = ?, dpID = ?, certificateID = ? WHERE diamondID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, diamond.getDiamondName());
            ps.setString(2, diamond.getDiamondImage());
            ps.setString(3, diamond.getOrigin());
            ps.setInt(4, diamond.getDpID());
            ps.setInt(5, diamond.getCertificateID());
            ps.setInt(6, diamond.getDiamondID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Diamond error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "UPDATE [Diamond] SET isDeleted = 'deleted' WHERE diamondID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Diamond error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public DiamondDTO checkDiamondExistByDiamondPrice(int dpriceID) {

        String sql = "SELECT dpID from DiamondPrice where dpID = ? and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, dpriceID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int dpID = rs.getInt("dpID");
                DiamondDTO diamond = new DiamondDTO();
                diamond.setDpID(dpID);
                return diamond;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public DiamondDTO checkDiamondExistByDiamondCertificate(int cID) {

        String sql = " SELECT c.certificateID FROM Certificate c LEFT JOIN Diamond d ON c.certificateID = d.certificateID AND d.isDeleted = 'active' WHERE c.isDeleted = 'active' AND c.certificateID = ? AND d.certificateID IS NULL ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int certificateID = rs.getInt("certificateID");
                DiamondDTO diamond = new DiamondDTO();
                diamond.setCertificateID(certificateID);
                return diamond;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public List<DiamondDTO> listStatistics() {
        List<DiamondDTO> list = new ArrayList<DiamondDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "WITH OriginCounts AS (\n"
                    + "    SELECT origin, COUNT(*) AS originCount \n"
                    + "    FROM Diamond \n"
                    + "    GROUP BY origin\n"
                    + "),\n"
                    + "TopOrigins AS (\n"
                    + "    SELECT origin, originCount \n"
                    + "    FROM (\n"
                    + "        SELECT origin, originCount, ROW_NUMBER() OVER (ORDER BY originCount DESC) AS rowNum \n"
                    + "        FROM OriginCounts\n"
                    + "    ) ranked \n"
                    + "    WHERE rowNum <= 5\n"
                    + "),\n"
                    + "DiamondUsage AS (\n"
                    + "    SELECT d.diamondID, d.diamondName, \n"
                    + "           CASE WHEN r.ringID IS NOT NULL THEN 'Used' ELSE 'Not Used' END AS usageStatus, \n"
                    + "           d.isDeleted\n"
                    + "    FROM Diamond d \n"
                    + "    LEFT JOIN Ring r ON d.diamondID = r.diamondID\n"
                    + "),\n"
                    + "Summary AS (\n"
                    + "    SELECT \n"
                    + "        COUNT(*) AS totalDiamonds, \n"
                    + "        SUM(CASE WHEN isDeleted = 'active' THEN 1 ELSE 0 END) AS activeDiamonds,\n"
                    + "        SUM(CASE WHEN isDeleted = 'deleted' THEN 1 ELSE 0 END) AS deletedDiamonds,\n"
                    + "        SUM(CASE WHEN usageStatus = 'Used' THEN 1 ELSE 0 END) AS diamondsUsedInRing,\n"
                    + "        SUM(CASE WHEN usageStatus = 'Not Used' THEN 1 ELSE 0 END) AS diamondsNotUsedInRing,\n"
                    + "        ROUND(CAST(SUM(CASE WHEN usageStatus = 'Used' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS percentageDiamondsUsed,\n"
                    + "        ROUND(CAST(SUM(CASE WHEN usageStatus = 'Not Used' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS percentageDiamondsNotUsed,\n"
                    + "        STRING_AGG(CASE WHEN usageStatus = 'Not Used' AND isDeleted = 'active' THEN CAST(diamondID AS VARCHAR) ELSE NULL END, ', ') AS activeDiamondsNotUsedList,\n"
                    + "        STRING_AGG(CASE WHEN usageStatus = 'Used' AND isDeleted = 'active' THEN CAST(diamondID AS VARCHAR) ELSE NULL END, ', ') AS activeDiamondsUsedList\n"
                    + "    FROM DiamondUsage\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    s.totalDiamonds,\n"
                    + "    s.activeDiamonds,\n"
                    + "    s.deletedDiamonds,\n"
                    + "    s.diamondsUsedInRing,\n"
                    + "    s.diamondsNotUsedInRing,\n"
                    + "    s.percentageDiamondsUsed,\n"
                    + "    s.percentageDiamondsNotUsed,\n"
                    + "    s.activeDiamondsNotUsedList,\n"
                    + "    s.activeDiamondsUsedList,\n"
                    + "    t.origin AS country,\n"
                    + "    t.originCount AS diamondCount\n"
                    + "FROM \n"
                    + "    Summary s \n"
                    + "CROSS JOIN \n"
                    + "    TopOrigins t\n"
                    + "ORDER BY \n"
                    + "    t.originCount DESC; ";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int totalDiamonds = rs.getInt("totalDiamonds");
                    int activeDiamonds = rs.getInt("activeDiamonds");
                    int deletedDiamonds = rs.getInt("deletedDiamonds");
                    int diamondsUsedInRing = rs.getInt("diamondsUsedInRing");
                    int diamondsNotUsedInRing = rs.getInt("diamondsNotUsedInRing");

                    double percentageDiamondsUsed = rs.getDouble("percentageDiamondsUsed");
                    double percentageDiamondsNotUsed = rs.getDouble("percentageDiamondsNotUsed");

                    String activeDiamondsNotUsedList = rs.getString("activeDiamondsNotUsedList");
                    String activeDiamondsUsedList = rs.getString("activeDiamondsUsedList");
                    String country = rs.getString("country");
                    int diamondCount = rs.getInt("diamondCount");

                    DiamondDTO diamond = new DiamondDTO();
                    diamond.setTotalDiamonds(totalDiamonds);
                    diamond.setActiveDiamonds(activeDiamonds);
                    diamond.setDeletedDiamonds(deletedDiamonds);
                    diamond.setDiamondsUsedInRing(diamondsUsedInRing);
                    diamond.setDiamondsNotUsedInRing(diamondsNotUsedInRing);
                    diamond.setPercentageDiamondsUsed(percentageDiamondsUsed);
                    diamond.setPercentageDiamondsNotUsed(percentageDiamondsNotUsed);
                    diamond.setDiamondsUsedListbyID(activeDiamondsUsedList);
                    diamond.setDiamondsNotUsedListByID(activeDiamondsNotUsedList);
                    diamond.setCountry(country);
                    diamond.setDiamondCount(diamondCount);

                    list.add(diamond);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

}
