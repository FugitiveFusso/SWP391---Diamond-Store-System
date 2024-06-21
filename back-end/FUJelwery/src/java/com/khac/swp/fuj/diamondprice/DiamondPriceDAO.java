package com.khac.swp.fuj.diamondprice;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiamondPriceDAO {

    public List<DiamondPriceDTO> getAllDiamondPrice(String keyword, String sortCol) {
        List<DiamondPriceDTO> list = new ArrayList<DiamondPriceDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT dpID, diamondSize, caratWeight, color, clarity, cut, FORMAT(price, 'N0') AS price FROM DiamondPrice WHERE isDeleted = 'active' ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " and ( diamondSize like ? or caratWeight like ? or color like ? or clarity like ? or price like ?) ";
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

            }
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

    public List<DiamondPriceDTO> getAllDiamondPriceBy036() {
        List<DiamondPriceDTO> list = new ArrayList<DiamondPriceDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT dpID, diamondSize, caratWeight, color, clarity, cut, FORMAT(price, 'N0') AS price FROM DiamondPrice WHERE isDeleted = 'active' and caratWeight = 0.36 ";

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
            String sql = " SELECT dpID, diamondSize, caratWeight, color, clarity, cut, FORMAT(price, 'N0') AS price FROM DiamondPrice WHERE isDeleted = 'active' and caratWeight = 0.7 ";

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

        String sql = "select dpID, diamondSize, caratWeight, color, clarity, cut, FORMAT(price, 'N0') AS price from DiamondPrice where dpID = ?";

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
        String sql = "UPDATE [DiamondPrice] SET isDeleted = 'delete' WHERE dpID = ? ";
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
}
