/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.category;

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
public class CategoryDAO {
    public List<CategoryDTO> list(String keyword, String sortCol) {
        List<CategoryDTO> list = new ArrayList<CategoryDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM [Category] ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE categoryName like ?";
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

                    int categoryID = rs.getInt("categoryID");
                    String categoryName = rs.getString("categoryName");
                    

                    CategoryDTO category = new CategoryDTO();
                    category.setCategoryID(categoryID);
                    category.setCategoryName(categoryName);
                    list.add(category);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public CategoryDTO load(int categoryID) {

        String sql = "select * from Category where categoryID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ID = rs.getInt("categoryID");
                    String categoryName = rs.getString("categoryName");

                CategoryDTO category = new CategoryDTO();
                    category.setCategoryID(categoryID);
                    category.setCategoryName(categoryName);;
                return category;
            }
        } catch (SQLException ex) {
            System.out.println("Query Category error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(CategoryDTO category) {
        String sql = "INSERT INTO [Category] (categoryID, categoryName) VALUES (?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, category.getCategoryID());
            ps.setString(2, category.getCategoryName());

            ps.executeUpdate();
            conn.close();
            return category.getCategoryID();
        } catch (SQLException ex) {
            System.out.println("Insert Category error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(CategoryDTO category) {
        String sql = "UPDATE [Category] SET categoryName = ? WHERE categoryID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, category.getCategoryName());
            ps.setInt(4, category.getCategoryID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Category error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    /*
    Delete student 
     */
    public boolean delete(int id) {
        String sql = "DELETE [Category] WHERE categoryID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Category error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
}
