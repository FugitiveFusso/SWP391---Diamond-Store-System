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
            String sql = "SELECT r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, r.price AS [ringPrice], r.collectionID, r.categoryID, rp.rName, rp.material, rp.color AS [ringColor], rp.rpPrice, d.diamondName, d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], dp.clarity, dp.cut, dp.price AS [diamondShapePrice]"
                    + " FROM [Ring] r FULL JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID ";
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
                    int rpID = rs.getInt("rpID");
                    String ringName = rs.getString("ringName");
                    String ringImage = rs.getString("ringImage");
                    int diamondID = rs.getInt("diamondID");
                    int price = rs.getInt("ringPrice");
                    int collectionID = rs.getInt("collectionID");
                    int categoryID = rs.getInt("categoryID");
                    
                    String rName = rs.getString("rName");
                    String material = rs.getString("material");
                    String ringColor = rs.getString("ringColor");
                    int rpPrice = rs.getInt("rpPrice");
                    
                    String diamondName = rs.getString("diamondName");
                    String diamondImage = rs.getString("diamondImage");
                    String origin = rs.getString("origin");
                    int certificateID = rs.getInt("certificateID");
                    
                    double diamondSize = rs.getDouble("diamondSize");
                    double caratWeight = rs.getDouble("caratWeight");
                    String color = rs.getString("diamondColor");
                    String clarity = rs.getString("clarity");
                    String cut = rs.getString("cut");
                    int diamondPrice = rs.getInt("diamondShapePrice");

                    RingDTO ring = new RingDTO();
                    
                    ring.setRingID(ringID);
                    ring.setRpID(rpID);
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
                    ring.setDiamondID(diamondID);
                    ring.setPrice(price);
                    ring.setCategoryID(categoryID);
                    ring.setCollectionID(collectionID);
                    ring.setRingPlacementName(rName);
                    ring.setMaterial(material);
                    ring.setRingColor(ringColor);
                    ring.setRpPrice(rpPrice);
                    
                    ring.setDiamondName(diamondName);
                    ring.setDiamondImage(diamondImage);
                    ring.setOrigin(origin);
                    ring.setCertificateID(certificateID);
                    
                    ring.setDiamondSize(diamondSize);
                    ring.setCaratWeight(caratWeight);
                    ring.setColor(color);
                    ring.setClarity(clarity);
                    ring.setCut(cut);
                    ring.setDiamondPrice(diamondPrice);
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

        String sql = "SELECT r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, r.price AS [ringPrice], r.collectionID, r.categoryID, rp.rName, rp.material, rp.color AS [ringColor], rp.rpPrice, d.diamondName, d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], dp.clarity, dp.cut, dp.price AS [diamondShapePrice] "
                + " FROM [Ring] r FULL JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID WHERE r.ringID = ? ";

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
                    int price = rs.getInt("ringPrice");
                    int collectionID = rs.getInt("collectionID");
                    int categoryID = rs.getInt("categoryID");
                    
                    String rName = rs.getString("rName");
                    String material = rs.getString("material");
                    String ringColor = rs.getString("ringColor");
                    int rpPrice = rs.getInt("rpPrice");
                    
                    String diamondName = rs.getString("diamondName");
                    String diamondImage = rs.getString("diamondImage");
                    String origin = rs.getString("origin");
                    int certificateID = rs.getInt("certificateID");
                    
                    double diamondSize = rs.getDouble("diamondSize");
                    double caratWeight = rs.getDouble("caratWeight");
                    String color = rs.getString("diamondColor");
                    String clarity = rs.getString("clarity");
                    String cut = rs.getString("cut");
                    int diamondPrice = rs.getInt("diamondShapePrice");

                RingDTO ring = new RingDTO();
                ring.setRingID(ID);
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
                    ring.setDiamondID(diamondID);
                    ring.setPrice(price);
                    ring.setCategoryID(categoryID);
                    ring.setCollectionID(collectionID);
                    ring.setRingPlacementName(rName);
                    ring.setMaterial(material);
                    ring.setRingColor(ringColor);
                    ring.setRpPrice(rpPrice);
                    
                    ring.setDiamondName(diamondName);
                    ring.setDiamondImage(diamondImage);
                    ring.setOrigin(origin);
                    ring.setCertificateID(certificateID);
                    
                    ring.setDiamondSize(diamondSize);
                    ring.setCaratWeight(caratWeight);
                    ring.setColor(color);
                    ring.setClarity(clarity);
                    ring.setCut(cut);
                    ring.setDiamondPrice(diamondPrice);
                return ring;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(RingDTO ring) {
        String sql = "INSERT INTO [Ring] (ringID, rpID, ringName, ringImage, diamondID, price, collectionID, categoryID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, ring.getRingID());
            ps.setInt(2, ring.getRpID());
            ps.setString(3, ring.getRingName());
            ps.setString(4, ring.getRingImage());
            ps.setInt(5, ring.getDiamondID());
            ps.setInt(6, ring.getPrice());
            ps.setInt(7, ring.getCollectionID());
            ps.setInt(8, ring.getCategoryID());

            ps.executeUpdate();
            conn.close();
            return ring.getRingID();
        } catch (SQLException ex) {
            System.out.println("Insert Ring error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(RingDTO ring) {
        String sql = "UPDATE [Ring] SET rpID = ?, ringName = ?, ringImage = ?, diamondID = ?, price = ?, categoryID = ?, collectionID = ? WHERE ringID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, ring.getRpID());
            ps.setString(2, ring.getRingName());
            ps.setString(3, ring.getRingImage());
            ps.setInt(4, ring.getDiamondID());
            ps.setInt(5, ring.getPrice());
            ps.setInt(6, ring.getCollectionID());
            ps.setInt(7, ring.getCategoryID());
            ps.setInt(8, ring.getRingID());

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
