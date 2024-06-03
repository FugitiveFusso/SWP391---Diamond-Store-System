/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.ringplacementprice;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RingPlacementPriceDAO {

    public List<RingPlacementPriceDTO> getAllRingPlacementPrice(String keyword, String sortCol) {
        List<RingPlacementPriceDTO> list = new ArrayList<RingPlacementPriceDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select rpID, rName, material, color, rpPrice from RingPlacementPrice ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " where rName like ? or material like ? or color like ? or rpPrice like ? ";
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

            }
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int rpid = rs.getInt("rpID");
                    String name = rs.getString("rName");
                    String material = rs.getString("material");
                    String color = rs.getString("color");
                    int price = rs.getInt("rpPrice");

                    RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                    rp.setId(rpid);
                    rp.setName(name);
                    rp.setMaterial(material);
                    rp.setColor(color);
                    rp.setPrice(price);

                    list.add(rp);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public RingPlacementPriceDTO load(int rpID) {

        String sql = " select rpID, rName, material, color, rpPrice from RingPlacementPrice where rpID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, rpID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int rpid = rs.getInt("rpID");
                String name = rs.getString("rName");
                String material = rs.getString("material");
                String color = rs.getString("color");
                int price = rs.getInt("rpPrice");

                RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                rp.setId(rpid);
                rp.setName(name);
                rp.setMaterial(material);
                rp.setColor(color);
                rp.setPrice(price);
                return rp;
            }
        } catch (SQLException ex) {
            System.out.println("Query DiamonPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(RingPlacementPriceDTO rp) {
        String sql = "INSERT INTO [RingPlacementPrice] (rpID, rName, material, color, rpPrice) "
                + "VALUES (?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, rp.getId());
            ps.setString(2, rp.getName());
            ps.setString(3, rp.getMaterial());
            ps.setString(4, rp.getColor());
            ps.setInt(5, rp.getPrice());

            ps.executeUpdate();
            conn.close();
            return rp.getId();
        } catch (SQLException ex) {
            System.out.println("Insert RingPlacementPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(RingPlacementPriceDTO rp) {
        String sql = "UPDATE [RingPlacementPrice] SET rName = ?, material = ?, color = ?, rpPrice = ? WHERE rpID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, rp.getName());
            ps.setString(2, rp.getMaterial());
            ps.setString(3, rp.getColor());
            ps.setInt(4, rp.getPrice());
            ps.setInt(5, rp.getId());
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update RingPlacementPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "DELETE [RingPlacementPrice] WHERE rpID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete RingPlacementPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public RingPlacementPriceDTO checkRPPByID(int rpID) {

        String sql = " select rpID, rName, material, color, rpPrice from RingPlacementPrice where rpID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, rpID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                rp.setId(rs.getInt("rpID"));
                rp.setName(rs.getString("rName"));
                rp.setMaterial(rs.getString("material"));
                rp.setColor(rs.getString("color"));
                rp.setPrice(rs.getInt("rpPrice"));
                return rp;
            }
        } catch (SQLException ex) {
            System.out.println("Query DiamonPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
