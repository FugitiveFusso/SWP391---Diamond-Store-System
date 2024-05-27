/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.ring;

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
    
    public List<RingDTO> listRing (String ringKeyword, String sortCol) throws SQLException{
        List<RingDTO> list = new ArrayList<>();
        
        String query = "SELECT * FROM Ring r FULL JOIN Diamond d ON r.diamondID = d.diamondID WHERE ";
        if(ringKeyword != null && !ringKeyword.isEmpty()){
            query += " ringName like ? ";
        }
        if (sortCol != null && !sortCol.isEmpty()) {
            query += " ORDER BY " + sortCol + " ASC ";
        }
        
        PreparedStatement ps = conn.prepareStatement(query);
        
        if (ringKeyword != null && !ringKeyword.isEmpty()) {
                ps.setString(1, "%" + ringKeyword + "%");
            }
        
        try{
            
            rs = ps.executeQuery();
            list.add(new RingDTO(rs.getInt("ringID"),
                                    rs.getString("ringName"),
                                    rs.getString("ringImage"),
                                    rs.getInt("diamondID"),
                                    rs.getString("gender"),
                                    rs.getDouble("price"),
                                    rs.getInt("quantity"),
                                    rs.getInt("categoryID"),
                                    rs.getInt("collectionID"),
                                    rs.getString("diamondName"),
                                    rs.getString("diamondImage"),
                                    rs.getString("origin"),
                                    rs.getInt("caratWeight"),
                                    rs.getString("cut"),
                                    rs.getString("color"),
                                    rs.getString("clarity")));
        } catch (Exception e) {
            System.out.println(e);
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
