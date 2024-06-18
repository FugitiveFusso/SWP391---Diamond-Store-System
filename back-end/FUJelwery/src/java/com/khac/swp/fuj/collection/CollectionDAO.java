package com.khac.swp.fuj.collection;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CollectionDAO {

    Connection conn = DBUtils.getConnection();
    ResultSet rs = null;

    public List<CollectionDTO> list(String keyword, String sortCol) {
        List<CollectionDTO> list = new ArrayList<CollectionDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM [Collection] where isDeleted = 'active' ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " and collectionName like ?";
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

                    int collectionID = rs.getInt("collectionID");
                    String collectionName = rs.getString("collectionName");
                    String collectionImage = rs.getString("collectionImage");
                    String collectionDescription = rs.getString("description");

                    CollectionDTO collection = new CollectionDTO();
                    collection.setCollectionID(collectionID);
                    collection.setCollectionName(collectionName);
                    collection.setCollectionImage(collectionImage);
                    collection.setCollectionDescription(collectionDescription);
                    list.add(collection);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public CollectionDTO load(int collectionID) {

        String sql = "select * from Collection where collectionID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, collectionID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ID = rs.getInt("collectionID");
                String collectionName = rs.getString("collectionName");
                String collectionImage = rs.getString("collectionImage");
                String collectionDescription = rs.getString("description");

                CollectionDTO collection = new CollectionDTO();
                collection.setCollectionID(ID);
                collection.setCollectionName(collectionName);
                collection.setCollectionImage(collectionImage);
                collection.setCollectionDescription(collectionDescription);
                return collection;
            }
        } catch (SQLException ex) {
            System.out.println("Query Collection error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(CollectionDTO collection) {
        String sql = "INSERT INTO [Collection] (collectionName, collectionImage, description, isDeleted) VALUES (?, ?, ?, 'active' )";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, collection.getCollectionName());
            ps.setString(2, collection.getCollectionImage());
            ps.setString(3, collection.getCollectionDescription());

            ps.executeUpdate();
            conn.close();
            return collection.getCollectionID();
        } catch (SQLException ex) {
            System.out.println("Insert Collection error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(CollectionDTO collection) {
        String sql = "UPDATE [Collection] SET collectionName = ?, collectionImage = ?, description = ? WHERE collectionID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, collection.getCollectionName());
            ps.setString(2, collection.getCollectionImage());
            ps.setString(3, collection.getCollectionDescription());
            ps.setInt(4, collection.getCollectionID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Collection error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    /*
    Delete student 
     */
    public boolean delete(int id) {
        String sql = "UPDATE [Collection] SET isDeleted = 'delete' WHERE collectionID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Collection error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
    
    public CollectionDTO checkCollectionExistByName(String collectionName) {

        String sql = "select collectionID, collectionName, collectionImage,[description] from [Collection] where collectionName like ? and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, collectionName);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                CollectionDTO collection = new CollectionDTO();
                collection.setCollectionID(rs.getInt("collectionID"));
                collection.setCollectionName(rs.getString("collectionName"));
                collection.setCollectionImage(rs.getString("collectionImage"));
                collection.setCollectionDescription(rs.getString("description"));
                return collection;
            }
        } catch (SQLException ex) {
            System.out.println("Query Collection error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
