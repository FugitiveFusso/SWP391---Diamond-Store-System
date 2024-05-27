/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.ring;
import com.khac.swp.fuj.diamond.DiamondDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class RingDAO {
    Connection conn = DBUtils.getConnection();
    ResultSet rs = null;
    
    public List<RingDTO> list(String keyword, String sortCol) {
        List<RingDTO> list = new ArrayList<RingDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM [Ring] r FULL JOIN [Diamond] d ON d.diamondID = r.diamondID ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE ringName like ?";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC ";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");

            }
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    
                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    String ringImage = rs.getString("ringImage");
                    int diamondID = rs.getInt("diamondID");
                    String gender = rs.getString("gender");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    int categoryID = rs.getInt("categoryID");
                    int collectionID = rs.getInt("collectionID");
                    String diamondName = rs.getString("diamondName");
                    String diamondImage = rs.getString("diamondImage");
                    String origin = rs.getString("origin");
                    int caratWeight = Integer.parseInt(rs.getString("caratWeight"));
                    String cut = rs.getString("cut");
                    String color = rs.getString("color");
                    String clarity = rs.getString("clarity");

                    RingDTO ring = new RingDTO();
                    ring.setRingID(ringID);
                    ring.setDiamondName(ringName);
                    ring.setDiamondID(diamondID);
                    ring.setGender(gender);
                    ring.setPrice(price);
                    ring.setQuantity(quantity);
                    ring.setCategoryID(categoryID);
                    ring.setCollectionID(collectionID);
                    ring.setDiamondName(diamondName);
                    ring.setDiamondImage(diamondImage);
                    ring.setOrigin(origin);
                    ring.setCaratWeight(caratWeight);
                    ring.setCut(cut);
                    ring.setColor(color);
                    ring.setClarity(clarity);
                    list.add(ring);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }
    
    public void insertDiamond (int ringID, String ringName, String ringImage, int diamondID, String gender, double price, int quantity, int categoryID, int collectionID){
        String query = "INSERT INTO Ring \n" +
                "(ringID, ringName, ringImage, diamondID, gender, price, quantity, categoryID, collectionID) \n"+
                "VALUES(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, ringID);
            ps.setString(2, ringName);
            ps.setString(3, ringImage);
            ps.setInt(4, diamondID);
            ps.setString(5, gender);
            ps.setDouble(6, price);
            ps.setInt(7, quantity);
            ps.setInt(8, categoryID);
            ps.setInt(9, collectionID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void deleteDiamond(String ringID) {
        String query = "DELETE FROM Ring\n"
                + "where ringID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, ringID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void editDiamond(String ringName, String ringImage, int diamondID, String gender, double price, int quantity, int categoryID, int collectionID, int ringID) {
        String query = "UPDATE Ring\n"
                + "SET ringName = ?,\n"
                + "ringImage = ?,\n"
                + "diamondID = ?,\n"
                + "gender = ?,\n"
                + "price = ?\n"
                + "quantity = ?\n"
                + "categoryID = ?\n"
                + "collectionID = ?\n"
                + "where ringID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, ringName);
            ps.setString(2, ringImage);
            ps.setInt(3, diamondID);
            ps.setString(4, gender);
            ps.setDouble(5, price);
            ps.setInt(6, quantity);
            ps.setInt(7, categoryID);
            ps.setInt(8, collectionID);
            ps.setInt(9, ringID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
