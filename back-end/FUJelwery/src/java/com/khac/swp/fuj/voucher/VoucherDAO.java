package com.khac.swp.fuj.voucher;

import com.khac.swp.fuj.voucher.VoucherDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VoucherDAO {

    public List<VoucherDTO> getAllVoucher(String keyword, String sortCol) {
        List<VoucherDTO> list = new ArrayList<VoucherDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select voucherID, voucherName, voucherImage, createdDate, createdBy, description, coupon, percentage from Voucher where isDeleted = 'active'  ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " and ( voucherName like ? or createdBy like ?)";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC ";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");

            }
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int voucherid = rs.getInt("voucherID");
                    String vouchername = rs.getString("voucherName");
                    String voucherimage = rs.getString("voucherImage");
                    String createddate = rs.getString("createdDate");
                    String createdby = rs.getString("createdBy");
                    String description = rs.getString("description");
                    String coupon = rs.getString("coupon");
                    int percentage = rs.getInt("percentage");

                    VoucherDTO voucher = new VoucherDTO();
                    voucher.setId(voucherid);
                    voucher.setName(vouchername);
                    voucher.setImage(voucherimage);
                    voucher.setCreateddate(createddate);
                    voucher.setCreatedby(createdby);
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

        String sql = "select voucherID, voucherName, voucherImage, createdDate, createdBy, description, coupon, percentage from Voucher where voucherID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, voucherID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int voucherid = rs.getInt("voucherID");
                String vouchername = rs.getString("voucherName");
                String voucherimage = rs.getString("voucherImage");
                String createddate = rs.getString("createdDate");
                String createdby = rs.getString("createdBy");
                String description = rs.getString("description");
                String coupon = rs.getString("coupon");
                int percentage = rs.getInt("percentage");

                VoucherDTO voucher = new VoucherDTO();
                voucher.setId(voucherid);
                voucher.setName(vouchername);
                voucher.setImage(voucherimage);
                voucher.setCreateddate(createddate);
                voucher.setCreatedby(createdby);
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
        String sql = "INSERT INTO [Voucher] (voucherName, voucherImage, createdDate, createdBy, description, coupon, percentage, isDeleted) VALUES (?, ?, ?, ?, ?, ?, ?, 'active')";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, voucher.getName());
            ps.setString(2, voucher.getImage());
            ps.setString(3, voucher.getCreateddate());
            ps.setString(4, voucher.getCreatedby());
            ps.setString(5, voucher.getDescription());
            ps.setString(6, voucher.getCoupon());
            ps.setInt(7, voucher.getPercentage());

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
        String sql = "UPDATE [Voucher] SET voucherName = ?, voucherImage = ?, createdDate = ?, createdBy = ?, description = ?, coupon = ?, percentage = ? WHERE voucherID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(8, voucher.getId());
            ps.setString(1, voucher.getName());
            ps.setString(2, voucher.getImage());
            ps.setString(3, voucher.getCreateddate());
            ps.setString(4, voucher.getCreatedby());
            ps.setString(5, voucher.getDescription());
            ps.setString(6, voucher.getCoupon());
            ps.setInt(7, voucher.getPercentage());

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
        String sql = "Update [Voucher] set isDeleted = 'delete' WHERE voucherID = ? ";
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

    public VoucherDTO checkVoucherExistByName(String voucherName) {

        String sql = "select voucherID, voucherName, voucherImage, description, coupon, percentage from Voucher where voucherName like ? and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,voucherName);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                VoucherDTO voucher = new VoucherDTO();
                voucher.setName(rs.getString("voucherName"));
                voucher.setImage(rs.getString("voucherImage"));
                voucher.setDescription(rs.getString("description"));
                voucher.setCoupon(rs.getString("coupon"));
                voucher.setPercentage(rs.getInt("percentage"));
                return voucher;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
