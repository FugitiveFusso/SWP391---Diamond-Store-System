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

    public List<DiamondDTO> list(String keyword, String sortCol) {
        List<DiamondDTO> list = new ArrayList<DiamondDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT d.diamondID, d.diamondName, d.diamondImage, d.origin, d.dpID, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color, dp.clarity, dp.cut, FORMAT(dp.price, 'N0') AS price FROM Diamond d LEFT JOIN DiamondPrice dp ON d.dpID = dp.dpID where d.isDeleted = 'active' ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " and ( d.diamondName like ? or dp.diamondSize like ? or dp.caratWeight like ? or dp.color like ? or dp.clarity like ? or dp.price like ?) ";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC ";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
                stmt.setString(3, "%" + keyword + "%");
                stmt.setString(4, "%" + keyword + "%");
                stmt.setString(5, "%" + keyword + "%");
                stmt.setString(6, "%" + keyword + "%");

            }
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int diamondID = rs.getInt("diamondID");
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

                    DiamondDTO diamond = new DiamondDTO();
                    diamond.setDiamondID(diamondID);
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

    public DiamondDTO load(int diamondID) {

        String sql = "SELECT d.diamondID, d.diamondName, d.diamondImage, d.origin, d.dpID, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color, dp.clarity, dp.cut, FORMAT(dp.price, 'N0') AS price FROM Diamond d LEFT JOIN DiamondPrice dp ON d.dpID = dp.dpID where diamondID = ? and d.isDeleted = 'active'";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, diamondID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

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

                DiamondDTO diamond = new DiamondDTO();
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

    public DiamondDTO loadStatistics() {

        String sql = "WITH OriginCounts AS (\n"
                + "SELECT origin, COUNT(*) AS originCount FROM Diamond GROUP BY origin),\n"
                + "TopOrigins AS (\n"
                + "SELECT origin, originCount FROM (\n"
                + "SELECT origin, originCount, ROW_NUMBER() OVER (ORDER BY originCount DESC) AS rowNum FROM OriginCounts) ranked WHERE rowNum <= 5),\n"
                + "DiamondUsage AS (\n"
                + "SELECT d.diamondID, d.diamondName, CASE WHEN r.ringID IS NOT NULL THEN 'Used' ELSE 'Not Used' END AS usageStatus, d.isDeleted\n"
                + "FROM Diamond d LEFT JOIN Ring r ON d.diamondID = r.diamondID),\n"
                + "Summary AS (\n"
                + "SELECT COUNT(*) AS totalDiamonds, SUM(CASE WHEN isDeleted = 'active' THEN 1 ELSE 0 END) AS activeDiamonds,\n"
                + "SUM(CASE WHEN isDeleted = 'deleted' THEN 1 ELSE 0 END) AS deletedDiamonds,\n"
                + "SUM(CASE WHEN usageStatus = 'Used' THEN 1 ELSE 0 END) AS diamondsUsedInRing,\n"
                + "SUM(CASE WHEN usageStatus = 'Not Used' THEN 1 ELSE 0 END) AS diamondsNotUsedInRing,\n"
                + "ROUND(CAST(SUM(CASE WHEN usageStatus = 'Used' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS percentageDiamondsUsed,\n"
                + "ROUND(CAST(SUM(CASE WHEN usageStatus = 'Not Used' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS percentageDiamondsNotUsed,\n"
                + "STRING_AGG(CASE WHEN usageStatus = 'Not Used' AND isDeleted = 'active' THEN CAST(diamondID AS VARCHAR) ELSE NULL END, ', ') AS activeDiamondsNotUsedList,\n"
                + "STRING_AGG(CASE WHEN usageStatus = 'Used' AND isDeleted = 'active' THEN CAST(diamondID AS VARCHAR) ELSE NULL END, ', ') AS activeDiamondsUsedList\n"
                + "FROM DiamondUsage)\n"
                + "SELECT\n"
                + "    s.totalDiamonds,\n"
                + "    s.activeDiamonds,\n"
                + "    s.deletedDiamonds,\n"
                + "    s.diamondsUsedInRing,\n"
                + "    s.diamondsNotUsedInRing,\n"
                + "    s.percentageDiamondsUsed,\n"
                + "    s.percentageDiamondsNotUsed,\n"
                + "    s.activeDiamondsNotUsedList,\n"
                + "    s.activeDiamondsUsedList,\n"
                + "        STRING_AGG(CAST(t.origin AS VARCHAR) + ' - ' + CAST(t.originCount AS VARCHAR), ' diamonds, ') AS topOrigins\n"
                + "FROM Summary s CROSS JOIN TopOrigins t\n"
                + "GROUP BY\n"
                + "    s.totalDiamonds,\n"
                + "    s.activeDiamonds,\n"
                + "    s.deletedDiamonds,\n"
                + "    s.diamondsUsedInRing,\n"
                + "    s.diamondsNotUsedInRing,\n"
                + "    s.percentageDiamondsUsed,\n"
                + "    s.percentageDiamondsNotUsed,\n"
                + "    s.activeDiamondsNotUsedList,\n"
                + "    s.activeDiamondsUsedList;";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int totalDiamonds = rs.getInt("totalDiamonds");
                int activeDiamonds = rs.getInt("activeDiamonds");
                int deletedDiamonds = rs.getInt("deletedDiamonds");
                int diamondsUsedInRing = rs.getInt("diamondsUsedInRing");
                int diamondsNotUsedInRing = rs.getInt("diamondsNotUsedInRing");

                double percentageDiamondsUsed = rs.getDouble("percentageDiamondsUsed");
                double percentageDiamondsNotUsed = rs.getDouble("percentageDiamondsNotUsed");

                String activeDiamondsNotUsedList = rs.getString("activeDiamondsNotUsedList");
                String activeDiamondsUsedList = rs.getString("activeDiamondsUsedList");
                String topOrigins = rs.getString("topOrigins");

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
                diamond.setTopOrigins(topOrigins);
                
                return diamond;
            }
        } catch (SQLException ex) {
            System.out.println("Query Diamonds error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

}
