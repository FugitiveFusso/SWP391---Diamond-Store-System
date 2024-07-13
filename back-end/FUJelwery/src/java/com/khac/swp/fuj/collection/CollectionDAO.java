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

    public List<CollectionDTO> list(String keyword, String sortCol, int page, int pageSize) {
        List<CollectionDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM [Collection] WHERE isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND collectionName LIKE ?";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC";
            } else {
                sql += " ORDER BY collectionID ASC"; // Default sorting by collectionID
            }

            sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement stmt = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(paramIndex++, "%" + keyword + "%");
            }

            stmt.setInt(paramIndex++, (page - 1) * pageSize);
            stmt.setInt(paramIndex, pageSize);

            ResultSet rs = stmt.executeQuery();
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

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalCollectionCount(String keyword) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM [Collection] WHERE isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND collectionName LIKE ?";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
            }

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return total;
    }

    public CollectionDTO load(int collectionID) {

        String sql = "select * from Collection where collectionID = ? and isDeleted = 'active'";

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
        String sql = "UPDATE [Collection] SET isDeleted = 'deleted' WHERE collectionID = ? ";
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

    public List<CollectionDTO> listStatistics() {
        List<CollectionDTO> list = new ArrayList<CollectionDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "WITH CollectionSummary AS (\n"
                    + "    SELECT \n"
                    + "        c.collectionID, \n"
                    + "        c.collectionName, \n"
                    + "        COUNT(r.ringID) AS NumberOfRings, \n"
                    + "        SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) AS TotalCollectionPrice\n"
                    + "    FROM \n"
                    + "        [Collection] c \n"
                    + "        LEFT JOIN [Ring] r ON c.collectionID = r.collectionID AND r.isDeleted = 'active'\n"
                    + "        LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID \n"
                    + "        LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID \n"
                    + "        LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "    WHERE \n"
                    + "        c.isDeleted = 'active' \n"
                    + "    GROUP BY \n"
                    + "        c.collectionID, \n"
                    + "        c.collectionName\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    TOP 5 \n"
                    + "    cs.collectionID, \n"
                    + "    (SELECT COUNT(*) FROM [Collection] WHERE isDeleted = 'active') AS NumberOfCollections, \n"
                    + "    cs.collectionName, \n"
                    + "    cs.NumberOfRings, \n"
                    + "    FORMAT(cs.TotalCollectionPrice, 'N0') AS TotalCollectionPrice\n"
                    + "FROM \n"
                    + "    CollectionSummary cs \n"
                    + "WHERE \n"
                    + "    cs.NumberOfRings > 0 -- Select collections with more than 0 rings\n"
                    + "ORDER BY \n"
                    + "    cs.TotalCollectionPrice DESC;";
            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int id = rs.getInt("collectionID");
                    int numberOfCollections = rs.getInt("NumberOfCollections");
                    String collectionName = rs.getString("collectionName");
                    int numberOfRings = rs.getInt("NumberOfRings");
                    String totalCollectionPrice = rs.getString("TotalCollectionPrice");

                    CollectionDTO collection = new CollectionDTO();
                    collection.setCollectionID(id);
                    collection.setNumberOfCollections(numberOfCollections);
                    collection.setCollectionName(collectionName);
                    collection.setNumberOfRings(numberOfRings);
                    collection.setTotalCollectionPrice(totalCollectionPrice);
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
}
