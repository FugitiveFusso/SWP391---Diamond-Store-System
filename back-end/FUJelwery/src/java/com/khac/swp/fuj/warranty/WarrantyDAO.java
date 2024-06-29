package com.khac.swp.fuj.warranty;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WarrantyDAO {

    public List<WarrantyDTO> getAllWarranty(String keyword, String sortCol) {
        List<WarrantyDTO> list = new ArrayList<WarrantyDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select warrantyID, warrantyName, warrantyImage, warrantyMonth, warrantyDescription, warrantyType, startDate, endDate, termsAndConditions from Warranty where isDeleted = 'active'  ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += "and (warrantyName like ? or warrantyMonth like ? or startDate like ? or endDate like ? or termsAndConditions like ?) ";
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

                    int id = rs.getInt("warrantyID");
                    String name = rs.getString("warrantyName");
                    String image = rs.getString("warrantyImage");
                    int month = rs.getInt("warrantyMonth");
                    String description = rs.getString("warrantyDescription");
                    String type = rs.getString("warrantyType");
                    String startdate = rs.getString("startDate");
                    String enddate = rs.getString("endDate");
                    String tac = rs.getString("termsAndConditions");

                    WarrantyDTO warranty = new WarrantyDTO();
                    warranty.setId(id);
                    warranty.setName(name);
                    warranty.setImage(image);
                    warranty.setMonth(month);
                    warranty.setDescription(description);
                    warranty.setType(type);
                    warranty.setStartdate(startdate);
                    warranty.setEnddate(enddate);
                    warranty.setTermsandconditions(tac);
                    list.add(warranty);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public WarrantyDTO load(int warrantyID) {

        String sql = "select warrantyID, warrantyName, warrantyImage, warrantyMonth, warrantyDescription, warrantyType, startDate, endDate, termsAndConditions from Warranty where warrantyID = ? and isDeleted = 'active'";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, warrantyID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int id = rs.getInt("warrantyID");
                String name = rs.getString("warrantyName");
                String image = rs.getString("warrantyImage");
                int month = rs.getInt("warrantyMonth");
                String description = rs.getString("warrantyDescription");
                String type = rs.getString("warrantyType");
                String startdate = rs.getString("startDate");
                String enddate = rs.getString("endDate");
                String tac = rs.getString("termsAndConditions");

                WarrantyDTO warranty = new WarrantyDTO();
                warranty.setId(id);
                warranty.setName(name);
                warranty.setImage(image);
                warranty.setMonth(month);
                warranty.setDescription(description);
                warranty.setType(type);
                warranty.setStartdate(startdate);
                warranty.setEnddate(enddate);
                warranty.setTermsandconditions(tac);
                return warranty;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(WarrantyDTO warranty) {
        String sql = "INSERT INTO [Warranty] (warrantyName, warrantyImage, warrantyMonth, warrantyDescription, warrantyType, startDate, termsAndConditions, isDeleted) VALUES (?, ?, ?, ?, ?, ?, ?, 'active')";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, warranty.getName());
            ps.setString(2, warranty.getImage());
            ps.setInt(3, warranty.getMonth());
            ps.setString(4, warranty.getDescription());
            ps.setString(5, warranty.getType());
            ps.setString(6, warranty.getStartdate());
            ps.setString(7, warranty.getTermsandconditions());

            ps.executeUpdate();
            conn.close();
            return warranty.getId();
        } catch (SQLException ex) {
            System.out.println("Insert Warranty error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(WarrantyDTO warranty) {
        String sql = "UPDATE [Warranty] SET warrantyName = ?, warrantyImage = ?, warrantyMonth = ?, warrantyDescription = ?, warrantyType = ?, startDate = ?, termsAndConditions = ? WHERE warrantyID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(8, warranty.getId());
            ps.setString(1, warranty.getName());
            ps.setString(2, warranty.getImage());
            ps.setInt(3, warranty.getMonth());
            ps.setString(4, warranty.getDescription());
            ps.setString(5, warranty.getType());
            ps.setString(6, warranty.getStartdate());
            ps.setString(7, warranty.getTermsandconditions());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Warranty error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "UPDATE [Warranty] set isDeleted = 'deleted' WHERE warrantyID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Warranty error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
    
    public WarrantyDTO checkWarrantyExistByName(String warrantyName) {

        String sql = "select warrantyName, warrantyImage, warrantyMonth, warrantyDescription, warrantyType, startDate, endDate, termsAndConditions from Warranty where warrantyName like ? and isDeleted = 'active'";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, warrantyName);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                WarrantyDTO warranty = new WarrantyDTO();
                warranty.setName(rs.getString("warrantyName"));
                warranty.setImage(rs.getString("warrantyImage"));
                warranty.setMonth(rs.getInt("warrantyMonth"));
                warranty.setDescription(rs.getString("warrantyDescription"));
                warranty.setType(rs.getString("warrantyType"));
                warranty.setStartdate(rs.getString("startDate"));
                warranty.setEnddate(rs.getString("endDate"));
                warranty.setTermsandconditions(rs.getString("termsAndConditions"));
                return warranty;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
