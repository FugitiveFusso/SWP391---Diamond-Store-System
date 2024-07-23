package com.khac.swp.fuj.diamondprice;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiamondPriceDAO {

    public List<DiamondPriceDTO> getAllDiamondPrice(String keyword, String sortCol, int page, int pageSize) {
        List<DiamondPriceDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT dpID, diamondSize, caratWeight, color, clarity, cut, FORMAT(price, 'N0') AS price "
                    + "FROM DiamondPrice WHERE isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (diamondSize LIKE ? OR caratWeight LIKE ? OR color LIKE ? OR clarity LIKE ? OR price LIKE ?)";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC";
            } else {
                sql += " ORDER BY dpID ASC"; // Default sorting by dpID
            }

            sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement stmt = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(paramIndex++, "%" + keyword + "%");
                stmt.setString(paramIndex++, "%" + keyword + "%");
                stmt.setString(paramIndex++, "%" + keyword + "%");
                stmt.setString(paramIndex++, "%" + keyword + "%");
                stmt.setString(paramIndex++, "%" + keyword + "%");
            }

            stmt.setInt(paramIndex++, (page - 1) * pageSize);
            stmt.setInt(paramIndex, pageSize);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int dpid = rs.getInt("dpID");
                double size = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("color");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                String price = rs.getString("price");

                DiamondPriceDTO dp = new DiamondPriceDTO();
                dp.setId(dpid);
                dp.setSize(size);
                dp.setCaratWeight(caratWeight);
                dp.setColor(color);
                dp.setClarity(clarity);
                dp.setCut(cut);
                dp.setPrice(price);

                list.add(dp);
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalDiamondPriceCount(String keyword) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM DiamondPrice WHERE isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (diamondSize LIKE ? OR caratWeight LIKE ? OR color LIKE ? OR clarity LIKE ? OR price LIKE ?)";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
                stmt.setString(3, "%" + keyword + "%");
                stmt.setString(4, "%" + keyword + "%");
                stmt.setString(5, "%" + keyword + "%");
            }

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return total;
    }

    public List<DiamondPriceDTO> getAllDiamondPriceBy036() {
        List<DiamondPriceDTO> list = new ArrayList<DiamondPriceDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT dpID, diamondSize, caratWeight, color, clarity, cut, FORMAT(price, 'N0') AS price FROM DiamondPrice WHERE isDeleted = 'active' and caratWeight = 0.36 order by diamondSize ASC, color ASC, price DESC, clarity ASC";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int dpid = rs.getInt("dpID");
                    double size = rs.getDouble("diamondSize");
                    double caratWeight = rs.getDouble("caratWeight");
                    String color = rs.getString("color");
                    String clarity = rs.getString("clarity");
                    String cut = rs.getString("cut");
                    String price = rs.getString("price");

                    DiamondPriceDTO dp = new DiamondPriceDTO();
                    dp.setId(dpid);
                    dp.setSize(size);
                    dp.setCaratWeight(caratWeight);
                    dp.setColor(color);
                    dp.setClarity(clarity);
                    dp.setCut(cut);
                    dp.setPrice(price);

                    list.add(dp);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public List<DiamondPriceDTO> getAllDiamondPriceBy07() {
        List<DiamondPriceDTO> list = new ArrayList<DiamondPriceDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT dpID, diamondSize, caratWeight, color, clarity, cut, FORMAT(price, 'N0') AS price FROM DiamondPrice WHERE isDeleted = 'active' and caratWeight = 0.7 order by diamondSize ASC, color ASC, price DESC, clarity ASC ";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int dpid = rs.getInt("dpID");
                    double size = rs.getDouble("diamondSize");
                    double caratWeight = rs.getDouble("caratWeight");
                    String color = rs.getString("color");
                    String clarity = rs.getString("clarity");
                    String cut = rs.getString("cut");
                    String price = rs.getString("price");

                    DiamondPriceDTO dp = new DiamondPriceDTO();
                    dp.setId(dpid);
                    dp.setSize(size);
                    dp.setCaratWeight(caratWeight);
                    dp.setColor(color);
                    dp.setClarity(clarity);
                    dp.setCut(cut);
                    dp.setPrice(price);

                    list.add(dp);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public DiamondPriceDTO load(int dpID) {

        String sql = "select dpID, diamondSize, caratWeight, color, clarity, cut, FORMAT(price, 'N0') AS price from DiamondPrice where dpID = ? and isDeleted = 'active'";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, dpID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int dpid = rs.getInt("dpID");
                double size = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("color");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                String price = rs.getString("price");

                DiamondPriceDTO dp = new DiamondPriceDTO();
                dp.setId(dpid);
                dp.setSize(size);
                dp.setCaratWeight(caratWeight);
                dp.setColor(color);
                dp.setClarity(clarity);
                dp.setCut(cut);
                dp.setPrice(price);
                return dp;
            }
        } catch (SQLException ex) {
            System.out.println("Query DiamonPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(DiamondPriceDTO dp) {
        String sql = "INSERT INTO [DiamondPrice] (diamondSize, caratWeight, color, clarity, cut, price, isDeleted) "
                + "VALUES (?, ?, ?, ?, ?, ?, 'active')";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setDouble(1, dp.getSize());
            ps.setDouble(2, dp.getCaratWeight());
            ps.setString(3, dp.getColor());
            ps.setString(4, dp.getClarity());
            ps.setString(5, dp.getCut());
            ps.setString(6, dp.getPrice());

            ps.executeUpdate();
            conn.close();
            return dp.getId();
        } catch (SQLException ex) {
            System.out.println("Insert DiamondPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(DiamondPriceDTO dp) {
        String sql = "UPDATE [DiamondPrice] SET diamondSize = ?, caratWeight = ?, color = ? , clarity = ?, cut = ?, price = ? WHERE dpID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setDouble(1, dp.getSize());
            ps.setDouble(2, dp.getCaratWeight());
            ps.setString(3, dp.getColor());
            ps.setString(4, dp.getClarity());
            ps.setString(5, dp.getCut());
            ps.setString(6, dp.getPrice());
            ps.setInt(7, dp.getId());
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update DiamondPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "UPDATE [DiamondPrice] SET isDeleted = 'deleted' WHERE dpID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete DiamondPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public DiamondPriceDTO checkDPExist(double size, double weight, String color, String clarity, String cut) {

        String sql = "select dpID, diamondSize, caratWeight, color, clarity, cut, price from DiamondPrice where diamondSize = ? "
                + " and caratWeight = ? and clarity = ? and color = ? and cut = ? ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, size);
            ps.setDouble(2, weight);
            ps.setString(3, clarity);
            ps.setString(4, color);
            ps.setString(5, cut);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                DiamondPriceDTO dp = new DiamondPriceDTO();
                dp.setId(rs.getInt("dpID"));
                dp.setSize(rs.getDouble("diamondSize"));
                dp.setCaratWeight(rs.getDouble("caratWeight"));
                dp.setColor(rs.getString("color"));
                dp.setClarity(rs.getString("clarity"));
                dp.setCut(rs.getString("cut"));
                dp.setPrice(rs.getString("price"));
                return dp;
            }
        } catch (SQLException ex) {
            System.out.println("Query DiamonPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public DiamondPriceDTO loadStatistics() {

        String sql = "WITH DiamondStats AS (\n"
                + "SELECT COUNT(dp.dpID) AS totalDiamondsPrice, AVG(dp.price) AS averagePrice, MAX(dp.price) AS highestPrice, MIN(dp.price) AS lowestPrice,\n"
                + "SUM(CASE WHEN dp.isDeleted = 'active' THEN 1 ELSE 0 END) AS activeDiamondsPrice,\n"
                + "SUM(CASE WHEN dp.isDeleted = 'deleted' THEN 1 ELSE 0 END) AS deletedDiamondsPrice,\n"
                + "STUFF(( SELECT DISTINCT ', ' + CAST(dp_inner.diamondSize AS VARCHAR) FROM DiamondPrice dp_inner WHERE dp_inner.isDeleted = 'active'FOR XML PATH('')), 1, 2, '') AS allDiamondSizes,\n"
                + "STUFF((SELECT DISTINCT ', ' + CAST(dp_inner.caratWeight AS VARCHAR) FROM DiamondPrice dp_inner WHERE dp_inner.isDeleted = 'active' FOR XML PATH('')), 1, 2, '') AS allCaratWeights,\n"
                + "STUFF((SELECT DISTINCT ', ' + dp_inner.color FROM DiamondPrice dp_inner WHERE dp_inner.isDeleted = 'active' FOR XML PATH('')), 1, 2, '') AS allColors,\n"
                + "STUFF((SELECT DISTINCT ', ' + dp_inner.clarity FROM DiamondPrice dp_inner WHERE dp_inner.isDeleted = 'active' FOR XML PATH('')), 1, 2, '') AS allClarities\n"
                + "FROM DiamondPrice dp WHERE dp.isDeleted = 'active'\n"
                + ")\n"
                + "SELECT totalDiamondsPrice, FORMAT(averagePrice, 'N0') AS averagePrice, FORMAT(highestPrice, 'N0') AS highestPrice, FORMAT(lowestPrice, 'N0') AS lowestPrice, \n"
                + "activeDiamondsPrice, deletedDiamondsPrice, allDiamondSizes, allCaratWeights, allColors, allClarities FROM DiamondStats;";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int totalDiamondsPrice = rs.getInt("totalDiamondsPrice");
                int activeDiamondsPrice = rs.getInt("activeDiamondsPrice");
                int deletedDiamondsPrice = rs.getInt("deletedDiamondsPrice");
                String allDiamondSizes = rs.getString("allDiamondSizes");
                String allCaratWeights = rs.getString("allCaratWeights");
                String allColors = rs.getString("allColors");
                String allClarities = rs.getString("allClarities");
                String averagePrice = rs.getString("averagePrice");
                String highestPrice = rs.getString("highestPrice");
                String lowestPrice = rs.getString("lowestPrice");

                DiamondPriceDTO dp = new DiamondPriceDTO();
                dp.setTotalDiamondsPrice(totalDiamondsPrice);
                dp.setActiveDiamondsPrice(activeDiamondsPrice);
                dp.setDeletedDiamondsPrice(deletedDiamondsPrice);
                dp.setAllDiamondSizes(allDiamondSizes);
                dp.setAllCaratWeights(allCaratWeights);
                dp.setAllColors(allColors);
                dp.setAllClarities(allClarities);
                dp.setAveragePrice(averagePrice);
                dp.setHighestPrice(highestPrice);
                dp.setLowestPrice(lowestPrice);
                return dp;
            }
        } catch (SQLException ex) {
            System.out.println("Query DiamonPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
