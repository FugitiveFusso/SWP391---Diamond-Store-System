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
                sql += " WHERE ringName like ? ";
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
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
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
    
    public RingDTO load(int ringID) {

        String sql = "SELECT r.ringID, r.ringName, r.ringImage, r.diamondID, r.gender, r.price, r.quantity, r.categoryID, r.collectionID, d.diamondName, d.diamondImage, d.origin, d.caratWeight, d.cut, d.color, d.clarity FROM [Ring] r FULL JOIN [Diamond] d ON d.diamondID = r.diamondID WHERE r.ringID = ? ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ringID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ID = rs.getInt("ringID");
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
                    int caratWeight = rs.getInt("caratWeight");
                    String cut = rs.getString("cut");
                    String color = rs.getString("color");
                    String clarity = rs.getString("clarity");

                    RingDTO ring = new RingDTO();
                    ring.setRingID(ID);
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
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
                return ring;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(RingDTO ring) {
        String sql = "INSERT INTO [Ring] (ringID, ringName, ringImage, diamondID, gender, price, quantity, categoryID, collectionID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, ring.getRingID());
            ps.setString(2, ring.getRingName());
            ps.setString(3, ring.getRingImage());
            ps.setInt(4, ring.getDiamondID());
            ps.setString(5, ring.getGender());
            ps.setDouble(6, ring.getPrice());
            ps.setInt(7, ring.getQuantity());
            ps.setInt(8, ring.getCategoryID());
            ps.setInt(9, ring.getCollectionID());

            ps.executeUpdate();
            conn.close();
            return ring.getRingID();
        } catch (SQLException ex) {
            System.out.println("Insert Post error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(RingDTO ring) {
        String sql = "UPDATE [Ring] SET ringName = ?, ringImage = ?, diamondID = ?, gender = ?, price = ?, quantity = ?, categoryID = ?, collectionID = ? WHERE ringID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, ring.getRingName());
            ps.setString(2, ring.getRingImage());
            ps.setInt(3, ring.getDiamondID());
            ps.setString(4, ring.getGender());
            ps.setDouble(5, ring.getPrice());
            ps.setInt(6, ring.getQuantity());
            ps.setInt(7, ring.getCategoryID());
            ps.setInt(8, ring.getCollectionID());
            ps.setInt(9, ring.getRingID());
            
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Ring error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    /*
    Delete student 
     */
    public boolean delete(int id) {
        String sql = "DELETE [Ring] WHERE ringID = ? ";
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
}
