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
public class DiamondDAO {

    Connection conn = DBUtils.getConnection();
    ResultSet rs = null;

    public List<DiamondDTO> list(String keyword, String sortCol) {
        List<DiamondDTO> list = new ArrayList<DiamondDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM [Diamond] ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE diamondName like ?";
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

                    int diamondID = rs.getInt("diamondID");
                    String diamondName = rs.getString("diamondName");
                    String diamondImage = rs.getString("diamondImage");
                    String origin = rs.getString("origin");
                    double caratWeight = rs.getDouble("caratWeight");
                    String cut = rs.getString("cut");
                    String color = rs.getString("color");
                    String clarity = rs.getString("clarity");
                    int certificateID = rs.getInt("certificateID");

                    DiamondDTO diamond = new DiamondDTO();
                    diamond.setDiamondID(diamondID);
                    diamond.setDiamondName(diamondName);
                    diamond.setDiamondImage(diamondImage);
                    diamond.setOrigin(origin);
                    diamond.setCaratWeight(caratWeight);
                    diamond.setCut(cut);
                    diamond.setColor(color);
                    diamond.setClarity(clarity);
                    diamond.setCertificateID(certificateID);
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

        String sql = "select diamondID, diamondName, diamondImage, origin, caratWeight, cut, color, clarity, certificateID from Diamond where diamondID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, diamondID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ID = rs.getInt("diamondID");
                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                double caratWeight = rs.getDouble("caratWeight");
                String cut = rs.getString("cut");
                String color = rs.getString("color");
                String clarity = rs.getString("clarity");
                int certificateID = rs.getInt("certificateID");

                DiamondDTO diamond = new DiamondDTO();
                diamond.setDiamondID(ID);
                diamond.setDiamondName(diamondName);
                diamond.setDiamondImage(diamondImage);
                diamond.setOrigin(origin);
                diamond.setCaratWeight(caratWeight);
                diamond.setCut(cut);
                diamond.setColor(color);
                diamond.setClarity(clarity);
                diamond.setCertificateID(certificateID);
                return diamond;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(DiamondDTO diamond) {
        String sql = "INSERT INTO [Diamond] (diamondID, diamondName, diamondImage, origin, caratWeight, cut, color, clarity, certificateID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, diamond.getDiamondID());
            ps.setString(2, diamond.getDiamondName());
            ps.setString(3, diamond.getDiamondImage());
            ps.setString(4, diamond.getOrigin());
            ps.setDouble(5, diamond.getCaratWeight());
            ps.setString(6, diamond.getCut());
            ps.setString(7, diamond.getColor());
            ps.setString(8, diamond.getClarity());
            ps.setInt(9, diamond.getCertificateID());

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
        String sql = "UPDATE [Diamond] SET diamondName = ?, diamondImage = ?, origin = ?, caratWeight = ?, cut = ?, color = ?, clarity = ?, certificateID = ? WHERE diamondID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, diamond.getDiamondName());
            ps.setString(2, diamond.getDiamondImage());
            ps.setString(3, diamond.getOrigin());
            ps.setDouble(4, diamond.getCaratWeight());
            ps.setString(5, diamond.getCut());
            ps.setString(6, diamond.getColor());
            ps.setString(7, diamond.getClarity());
            ps.setInt(8, diamond.getCertificateID());
            ps.setInt(9, diamond.getDiamondID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Diamond error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    /*
    Delete student 
     */
    public boolean delete(int id) {
        String sql = "DELETE [Diamond] WHERE diamondID = ? ";
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
    public static void main(String[] args) {
        DiamondDAO dao = new DiamondDAO();
        List<DiamondDTO> list = dao.list("", "");
        for (DiamondDTO diamondDTO : list) {
            System.out.println(diamondDTO);
        }
    }
}
