package com.khac.swp.fuj.category;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {

    public List<CategoryDTO> list(String keyword, String sortCol) {
        List<CategoryDTO> list = new ArrayList<CategoryDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT categoryID, categoryName FROM [Category] where isDeleted = 'active' ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " and categoryName like ?";
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

        String sql = " select categoryID, categoryName from Category where categoryID = ? ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ID = rs.getInt("categoryID");
                String categoryName = rs.getString("categoryName");

                CategoryDTO category = new CategoryDTO();
                category.setCategoryID(ID);
                category.setCategoryName(categoryName);
                return category;
            }
        } catch (SQLException ex) {
            System.out.println("Query Category error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(CategoryDTO category) {
        String sql = "INSERT INTO [Category] (categoryName, isDeleted) VALUES (?, 'active' )";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, category.getCategoryName());

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
            ps.setInt(2, category.getCategoryID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Category error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "UPDATE [Category] SET isDeleted = 'delete' WHERE categoryID = ? ";
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
    
    public CategoryDTO checkCategoryExistByName(String categoryName) {

        String sql = "select categoryID, categoryName from Category where categoryName like ? and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, categoryName);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                CategoryDTO category = new CategoryDTO();
                category.setCategoryID(rs.getInt("categoryID"));
                category.setCategoryName(rs.getString("categoryName"));;
                return category;
            }
        } catch (SQLException ex) {
            System.out.println("Query Category error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
