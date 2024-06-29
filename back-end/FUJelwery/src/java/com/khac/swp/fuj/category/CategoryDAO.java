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
            String sql = " SELECT categoryID, categoryName, categoryImage FROM [Category] where isDeleted = 'active' ";
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
                    String image = rs.getString("categoryImage");

                    CategoryDTO category = new CategoryDTO();
                    category.setCategoryID(categoryID);
                    category.setCategoryName(categoryName);
                    category.setImage(image);
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

        String sql = " select categoryID, categoryName, categoryImage from Category where categoryID = ? and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ID = rs.getInt("categoryID");
                String categoryName = rs.getString("categoryName");
                String image = rs.getString("categoryImage");

                CategoryDTO category = new CategoryDTO();
                category.setCategoryID(ID);
                category.setCategoryName(categoryName);
                category.setImage(image);

                return category;
            }
        } catch (SQLException ex) {
            System.out.println("Query Category error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(CategoryDTO category) {
        String sql = "INSERT INTO [Category] (categoryName, categoryImage, isDeleted) VALUES (?, ?, 'active' )";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, category.getCategoryName());
            ps.setString(2, category.getImage());

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
        String sql = "UPDATE [Category] SET categoryName = ?, categoryImage = ? WHERE categoryID = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, category.getCategoryName());
            ps.setString(2, category.getImage());
            ps.setInt(3, category.getCategoryID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Category error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "UPDATE [Category] SET isDeleted = 'deleted' WHERE categoryID = ? ";
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

    public List<CategoryDTO> listStatistics() {
        List<CategoryDTO> list = new ArrayList<CategoryDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT TotalCategories, ActiveCategories, DeletedCategories, Top3CategoryNames, Top3CategoryRingCounts FROM\n"
                    + "            (SELECT \n"
                    + "            (SELECT COUNT(*) FROM [Category]) AS TotalCategories,\n"
                    + "            (SELECT SUM(CASE WHEN isDeleted = 'active' THEN 1 ELSE 0 END) FROM [Category]) AS ActiveCategories,\n"
                    + "            (SELECT SUM(CASE WHEN isDeleted = 'deleted' THEN 1 ELSE 0 END) FROM [Category]) AS DeletedCategories,\n"
                    + "            STRING_AGG(c.categoryName, ', ') AS Top3CategoryNames,\n"
                    + "            STRING_AGG(CAST(CategoryRingCounts.NumberOfRings AS VARCHAR), ', ') AS Top3CategoryRingCounts\n"
                    + "        FROM [Category] c LEFT JOIN (\n"
                    + "            SELECT r.categoryID, COUNT(*) AS NumberOfRings FROM [Ring] r\n"
                    + "            GROUP BY r.categoryID) AS CategoryRingCounts ON c.categoryID = CategoryRingCounts.categoryID\n"
                    + "        WHERE c.categoryName IN (SELECT TOP 3 categoryName FROM [Category] c JOIN [Ring] r ON c.categoryID = r.categoryID\n"
                    + "        GROUP BY categoryName ORDER BY COUNT(*) DESC)\n"
                    + "        GROUP BY CategoryRingCounts.categoryID) AS CombinedResults;";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int totalCategories = rs.getInt("TotalCategories");
                    int activeCategories = rs.getInt("ActiveCategories");
                    int deletedCategories = rs.getInt("DeletedCategories");
                    int top3CategoryRingCounts = rs.getInt("Top3CategoryRingCounts");

                    String top3CategoryNames = rs.getString("Top3CategoryNames");

                    CategoryDTO category = new CategoryDTO();
                    category.setTotalCategories(totalCategories);
                    category.setActiveCategories(activeCategories);
                    category.setDeletedCategories(deletedCategories);
                    category.setTop3CategoryRingCounts(top3CategoryRingCounts);
                    category.setTop3CategoryNames(top3CategoryNames);
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

}
