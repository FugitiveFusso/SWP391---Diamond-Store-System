/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.diamond;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class DiamondDAO{
    Connection conn = DBUtils.getConnection();
    ResultSet rs = null;
    
    public List<DiamondDTO> getAllDiamond () throws SQLException{
        List<DiamondDTO> list = new ArrayList<>();
        String query = "SELECT * FROM Diamond ";
        try{
            PreparedStatement ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            list.add(new DiamondDTO(rs.getInt("diamondID"),
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
    
    public List<DiamondDTO> listDiamond (String diamondKeyword, String sortCol) throws SQLException{
        List<DiamondDTO> list = new ArrayList<>();
        String query = "SELECT * FROM Diamond WHERE ";
        if(diamondKeyword != null && !diamondKeyword.isEmpty()){
            query += "diamondName like ? ";
        }
        if (sortCol != null && !sortCol.isEmpty()) {
            query += " ORDER BY " + sortCol + " ASC ";
        }
        
        try{
            PreparedStatement ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            list.add(new DiamondDTO(rs.getInt("diamondID"),
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
    
    public void insertDiamond (int id, String diamondName, String diamondImage, String origin, int caratWeight, String cut, String color, String clarity){
        String query = "INSERT INTO Diamond \n" +
                "(diamondID, diamondName, diamondImage, origin, caratWeight, cut, color, clarity) \n"+
                "VALUES(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, diamondName);
            ps.setString(3, diamondImage);
            ps.setString(4, origin);
            ps.setInt(5, caratWeight);
            ps.setString(6, cut);
            ps.setString(7, color);
            ps.setString(8, clarity);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void deleteDiamond(String id) {
        String query = "DELETE FROM Diamond\n"
                + "where diamondID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void editDiamond(String diamondName, String diamondImage, String origin, int caratWeight, String cut, String color, String clarity, int id) {
        String query = "UPDATE Diamond\n"
                + "SET diamondName = ?,\n"
                + "diamondImage = ?,\n"
                + "origin = ?,\n"
                + "caratWeight = ?,\n"
                + "cut = ?\n"
                + "color = ?\n"
                + "clarity = ?\n"
                + "where diamondID = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, diamondName);
            ps.setString(2, diamondImage);
            ps.setString(3, origin);
            ps.setInt(4, caratWeight);
            ps.setString(5, cut);
            ps.setString(6, color);
            ps.setString(7, clarity);
            ps.setInt(8, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
