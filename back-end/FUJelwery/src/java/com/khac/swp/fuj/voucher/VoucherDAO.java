/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.voucher;

import com.khac.swp.fuj.voucher.VoucherDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phucu
 */
public class VoucherDAO {

    public List<VoucherDTO> getAllVoucher(String keyword, String sortCol) {
        List<VoucherDTO> list = new ArrayList<VoucherDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select voucherID, voucherName, voucherImage, description, coupon, percentage from Voucher ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " where voucherName like ? ";
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

                    int voucherid = rs.getInt("voucherID");
                    String vouchername = rs.getString("voucherName");
                    String voucherimage = rs.getString("voucherImage");
                    String description = rs.getString("description");
                    String coupon = rs.getString("coupon");
                    int percentage = rs.getInt("percentage");

                    VoucherDTO voucher = new VoucherDTO();
                    voucher.setId(voucherid);
                    voucher.setName(vouchername);
                    voucher.setImage(voucherimage);
                    voucher.setDescription(description);
                    voucher.setCoupon(coupon);
                    voucher.setPercentage(percentage);
                    list.add(voucher);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public VoucherDTO load(int voucherID) {

        String sql = "select voucherID, voucherName, voucherImage, description, coupon, percentage from Voucher where voucherID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, voucherID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int voucherid = rs.getInt("voucherID");
                String vouchername = rs.getString("voucherName");
                String voucherimage = rs.getString("voucherImage");
                String description = rs.getString("description");
                String coupon = rs.getString("coupon");
                int percentage = rs.getInt("percentage");

                VoucherDTO voucher = new VoucherDTO();
                voucher.setId(voucherid);
                voucher.setName(vouchername);
                voucher.setImage(voucherimage);
                voucher.setDescription(description);
                voucher.setCoupon(coupon);
                voucher.setPercentage(percentage);
                return voucher;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(VoucherDTO voucher) {
        String sql = "INSERT INTO [Voucher] (voucherID, voucherName, voucherImage, description, coupon, percentage) VALUES (?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, voucher.getId());
            ps.setString(2, voucher.getName());
            ps.setString(3, voucher.getImage());
            ps.setString(4, voucher.getDescription());
            ps.setString(5, voucher.getCoupon());
            ps.setInt(6, voucher.getPercentage());

            ps.executeUpdate();
            conn.close();
            return voucher.getId();
        } catch (SQLException ex) {
            System.out.println("Insert Voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(VoucherDTO voucher) {
        String sql = "UPDATE [Voucher] SET voucherName = ?, voucherImage = ?, description = ?, coupon = ?, percentage = ? WHERE voucherID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(6, voucher.getId());
            ps.setString(1, voucher.getName());
            ps.setString(2, voucher.getImage());
            ps.setString(3, voucher.getDescription());
            ps.setString(4, voucher.getCoupon());
            ps.setInt(5, voucher.getPercentage());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    /*
    Delete student 
     */
    public boolean delete(int id) {
        String sql = "DELETE [Voucher] WHERE voucherID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
}
