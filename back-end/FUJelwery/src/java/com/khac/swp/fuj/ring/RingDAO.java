package com.khac.swp.fuj.ring;

import com.khac.swp.fuj.diamond.DiamondDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RingDAO {

    Connection conn = DBUtils.getConnection();
    ResultSet rs = null;

    public List<RingDTO> list(String keyword, String sortCol, int page, int pageSize) {
        List<RingDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT r.warrantyID, r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, FORMAT(r.price , 'N0') AS ringPrice, "
                    + "FORMAT(((r.price + rp.rpPrice + dp.price)*1.02) , 'N0') AS totalPrice, r.collectionID, r.categoryID, "
                    + "rp.rName, rp.material, rp.color AS [ringColor], FORMAT(rp.rpPrice , 'N0') AS rpPrice, d.diamondName, "
                    + "d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], "
                    + "dp.clarity, dp.cut, FORMAT(dp.price , 'N0') AS [diamondShapePrice] "
                    + "FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID "
                    + "LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID "
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID WHERE r.status = 'active' ";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND r.ringName LIKE ? ";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC ";
            } else {
                sql += " ORDER BY r.ringID ASC"; // Default sorting by ringID
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
                int warrantyID = rs.getInt("warrantyID");
                int ringID = rs.getInt("ringID");
                int rpID = rs.getInt("rpID");
                String ringName = rs.getString("ringName");
                String ringImage = rs.getString("ringImage");
                int diamondID = rs.getInt("diamondID");
                String price = rs.getString("ringPrice");
                int collectionID = rs.getInt("collectionID");
                int categoryID = rs.getInt("categoryID");

                String rName = rs.getString("rName");
                String material = rs.getString("material");
                String ringColor = rs.getString("ringColor");
                String rpPrice = rs.getString("rpPrice");

                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int certificateID = rs.getInt("certificateID");

                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("diamondColor");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                String diamondPrice = rs.getString("diamondShapePrice");
                String totalPrice = rs.getString("totalPrice");

                RingDTO ring = new RingDTO();

                ring.setWarrantyID(warrantyID);
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
                ring.setTotalPrice(totalPrice);

                list.add(ring);
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalRingCount(String keyword) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM [Ring] WHERE status = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND ringName LIKE ?";
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

    public RingDTO load(int ringID) {

        String sql = "SELECT r.warrantyID, r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, FORMAT(r.price , 'N0') AS ringPrice, FORMAT(((r.price + rp.rpPrice + dp.price)*1.02) , 'N0') AS totalPrice, r.collectionID, r.categoryID, rp.rName, rp.material, rp.color AS [ringColor], FORMAT(rp.rpPrice , 'N0') AS rpPrice, d.diamondName, d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], dp.clarity, dp.cut, FORMAT(dp.price , 'N0') AS [diamondShapePrice]"
                + " FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID WHERE r.ringID = ? and r.status = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ringID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int rpID = rs.getInt("rpID");
                String ringName = rs.getString("ringName");
                String ringImage = rs.getString("ringImage");
                int diamondID = rs.getInt("diamondID");
                String price = rs.getString("ringPrice");
                int collectionID = rs.getInt("collectionID");
                int categoryID = rs.getInt("categoryID");

                String rName = rs.getString("rName");
                String material = rs.getString("material");
                String ringColor = rs.getString("ringColor");
                String rpPrice = rs.getString("rpPrice");

                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int certificateID = rs.getInt("certificateID");

                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("diamondColor");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                String diamondPrice = rs.getString("diamondShapePrice");
                String totalPrice = rs.getString("totalPrice");
                int warrantyID = rs.getInt("warrantyID");

                RingDTO ring = new RingDTO();
                ring.setWarrantyID(warrantyID);

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
                ring.setTotalPrice(totalPrice);
                return ring;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(RingDTO ring) {
        String sql = "INSERT INTO [Ring] (rpID, ringName, ringImage, diamondID, price, collectionID, categoryID, warrantyID, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'active' )";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, ring.getRpID());
            ps.setString(2, ring.getRingName());
            ps.setString(3, ring.getRingImage());
            ps.setInt(4, ring.getDiamondID());
            ps.setString(5, ring.getPrice());
            ps.setInt(6, ring.getCollectionID());
            ps.setInt(7, ring.getCategoryID());
            ps.setInt(8, ring.getWarrantyID());

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
            ps.setString(5, ring.getPrice());
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

    public boolean delete(int id) {
        String sql = "UPDATE [Ring] SET status = 'deleted' WHERE ringID = ? ";
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

    public RingDTO checkRingExistbyName(String ringName) {

        String sql = "SELECT r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, FORMAT(r.price , 'N0') AS ringPrice, FORMAT(((r.price + rp.rpPrice + dp.price)*1.02) , 'N0') AS totalPrice, r.collectionID, r.categoryID, rp.rName, rp.material, rp.color AS [ringColor], FORMAT(rp.rpPrice , 'N0') AS rpPrice, d.diamondName, d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], dp.clarity, dp.cut, FORMAT(dp.price , 'N0') AS [diamondShapePrice]"
                + " FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID WHERE r.ringName = ? and r.status = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, ringName);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ringID = rs.getInt("ringID");
                int rpID = rs.getInt("rpID");
                String ringImage = rs.getString("ringImage");
                int diamondID = rs.getInt("diamondID");
                String price = rs.getString("ringPrice");
                int collectionID = rs.getInt("collectionID");
                int categoryID = rs.getInt("categoryID");

                String rName = rs.getString("rName");
                String material = rs.getString("material");
                String ringColor = rs.getString("ringColor");
                String rpPrice = rs.getString("rpPrice");

                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int certificateID = rs.getInt("certificateID");

                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("diamondColor");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                String diamondPrice = rs.getString("diamondShapePrice");
                String totalPrice = rs.getString("totalPrice");

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
                ring.setTotalPrice(totalPrice);

                return ring;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public RingDTO checkRingExistbyRpID(int ringPID) {

        String sql = "SELECT rp.rpID from [RingPlacementPrice] rp WHERE rp.rpID = ?  and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ringPID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int rpID = rs.getInt("rpID");

                RingDTO ring = new RingDTO();

                ring.setRpID(rpID);

                return ring;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public RingDTO checkRingExistbyDiamondID(int diamondID) {

        String sql = "select diamondID from Diamond WHERE diamondID = ? and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, diamondID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int dID = rs.getInt("diamondID");

                RingDTO ring = new RingDTO();

                ring.setDiamondID(dID);

                return ring;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public RingDTO checkRingExistbyCategoryID(int categoryID) {

        String sql = "select categoryID from Category WHERE categoryID = ? and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int caID = rs.getInt("categoryID");

                RingDTO ring = new RingDTO();

                ring.setCategoryID(caID);

                return ring;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public RingDTO checkRingExistbyCollectionID(int collectionID) {

        String sql = "select collectionID from Collection where collectionID = ? and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, collectionID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int coID = rs.getInt("collectionID");

                RingDTO ring = new RingDTO();

                ring.setCollectionID(coID);

                return ring;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public List<RingDTO> listByCollection(int collectionID, int page, int pageSize) {
        List<RingDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, FORMAT(r.price , 'N0') AS ringPrice, "
                    + "FORMAT(((r.price + rp.rpPrice + dp.price)*1.02) , 'N0') AS totalPrice, r.collectionID, r.categoryID, "
                    + "rp.rName, rp.material, rp.color AS [ringColor], FORMAT(rp.rpPrice , 'N0') AS rpPrice, d.diamondName, "
                    + "d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], "
                    + "dp.clarity, dp.cut, FORMAT(dp.price , 'N0') AS [diamondShapePrice] "
                    + "FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID "
                    + "LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID "
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID "
                    + "WHERE r.collectionID = ? AND r.status = 'active' "
                    + "ORDER BY r.ringID ASC "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, collectionID);
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ringID = rs.getInt("ringID");
                int rpID = rs.getInt("rpID");
                String ringName = rs.getString("ringName");
                String ringImage = rs.getString("ringImage");
                int diamondID = rs.getInt("diamondID");
                String price = rs.getString("ringPrice");
                int categoryID = rs.getInt("categoryID");

                String rName = rs.getString("rName");
                String material = rs.getString("material");
                String ringColor = rs.getString("ringColor");
                String rpPrice = rs.getString("rpPrice");

                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int certificateID = rs.getInt("certificateID");

                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("diamondColor");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                String diamondPrice = rs.getString("diamondShapePrice");
                String totalPrice = rs.getString("totalPrice");

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
                ring.setTotalPrice(totalPrice);

                list.add(ring);
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalRingCountByCollection(int collectionID) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM [Ring] WHERE collectionID = ? AND status = 'active'";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, collectionID);

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

    public List<RingDTO> listByCategory(int categoryID, int page, int pageSize) {
        List<RingDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, FORMAT(r.price , 'N0') AS ringPrice, "
                    + "FORMAT(((r.price + rp.rpPrice + dp.price)*1.02) , 'N0') AS totalPrice, r.collectionID, r.categoryID, "
                    + "rp.rName, rp.material, rp.color AS [ringColor], FORMAT(rp.rpPrice , 'N0') AS rpPrice, d.diamondName, "
                    + "d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], "
                    + "dp.clarity, dp.cut, FORMAT(dp.price , 'N0') AS [diamondShapePrice] "
                    + "FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID "
                    + "LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID "
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID "
                    + "WHERE r.categoryID = ? AND r.status = 'active' "
                    + "ORDER BY r.ringID ASC "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, categoryID);
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int ringID = rs.getInt("ringID");
                int rpID = rs.getInt("rpID");
                String ringName = rs.getString("ringName");
                String ringImage = rs.getString("ringImage");
                int diamondID = rs.getInt("diamondID");
                String price = rs.getString("ringPrice");
                int collectionID = rs.getInt("collectionID");

                String rName = rs.getString("rName");
                String material = rs.getString("material");
                String ringColor = rs.getString("ringColor");
                String rpPrice = rs.getString("rpPrice");

                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int certificateID = rs.getInt("certificateID");

                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("diamondColor");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                String diamondPrice = rs.getString("diamondShapePrice");
                String totalPrice = rs.getString("totalPrice");

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
                ring.setTotalPrice(totalPrice);

                list.add(ring);
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalRingCountByCategory(int categoryID) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM [Ring] WHERE categoryID = ? AND status = 'active'";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, categoryID);

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

    public List<RingDTO> listHighest() {
        List<RingDTO> list = new ArrayList<RingDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "WITH RingPrices AS (\n"
                    + "    SELECT \n"
                    + "        r.ringID, \n"
                    + "        r.ringName, \n"
                    + "        r.ringImage, \n"
                    + "        FORMAT(((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02), 'N0') AS totalPrice,\n"
                    + "        ROW_NUMBER() OVER (ORDER BY ((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) DESC) AS RankHighest\n"
                    + "    FROM [Ring] r\n"
                    + "    LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID\n"
                    + "    LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID\n"
                    + "    LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "    WHERE r.status = 'active'\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    ringID, \n"
                    + "    ringName, \n"
                    + "    ringImage, \n"
                    + "    totalPrice\n"
                    + "FROM RingPrices\n"
                    + "WHERE RankHighest <= 5\n"
                    + "ORDER BY RankHighest ASC; ";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    String ringImage = rs.getString("ringImage");
                    String totalPrice = rs.getString("totalPrice");

                    RingDTO ring = new RingDTO();

                    ring.setRingID(ringID);
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
                    ring.setTotalPrice(totalPrice);

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

    public List<RingDTO> listLowest() {
        List<RingDTO> list = new ArrayList<RingDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "WITH RingPrices AS (\n"
                    + "    SELECT \n"
                    + "        r.ringID, \n"
                    + "        r.ringName, \n"
                    + "        r.ringImage, \n"
                    + "        FORMAT(((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02), 'N0') AS totalPrice,\n"
                    + "        ROW_NUMBER() OVER (ORDER BY ((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) ASC) AS RankLowest\n"
                    + "    FROM [Ring] r\n"
                    + "    LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID\n"
                    + "    LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID\n"
                    + "    LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "    WHERE r.status = 'active'\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    ringID, \n"
                    + "    ringName, \n"
                    + "    ringImage, \n"
                    + "    totalPrice\n"
                    + "FROM RingPrices\n"
                    + "WHERE RankLowest <= 5\n"
                    + "ORDER BY RankLowest ASC;";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    String ringImage = rs.getString("ringImage");
                    String totalPrice = rs.getString("totalPrice");

                    RingDTO ring = new RingDTO();

                    ring.setRingID(ringID);
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
                    ring.setTotalPrice(totalPrice);

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

    public List<RingDTO> listTopSales() {
        List<RingDTO> list = new ArrayList<RingDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "WITH TopRankedRings AS (\n"
                    + "    SELECT\n"
                    + "        r.ringID,\n"
                    + "        r.ringName,\n"
                    + "        r.ringImage,\n"
                    + "        COUNT(o.orderID) AS PurchaseCount,\n"
                    + "        FORMAT(((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02), 'N0') AS priceOfEachRings,\n"
                    + "        YEAR(TRY_CONVERT(datetime, o.orderDate, 105)) AS OrderYear,\n"
                    + "        MONTH(TRY_CONVERT(datetime, o.orderDate, 105)) AS OrderMonth,\n"
                    + "        DATENAME(MONTH, TRY_CONVERT(datetime, o.orderDate, 105)) AS MonthName,\n"
                    + "        ROW_NUMBER() OVER (PARTITION BY YEAR(TRY_CONVERT(datetime, o.orderDate, 105)), MONTH(TRY_CONVERT(datetime, o.orderDate, 105))\n"
                    + "                           ORDER BY COUNT(o.orderID) DESC) AS RowNum\n"
                    + "    FROM [Order] o\n"
                    + "    LEFT JOIN [Ring] r ON o.ringID = r.ringID\n"
                    + "    LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID\n"
                    + "    LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID\n"
                    + "    LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "    WHERE r.status = 'active'\n"
                    + "      AND o.status IN ('verified', 'shipping', 'purchased', 'delivered', 'received at store')\n"
                    + "      AND TRY_CONVERT(datetime, o.orderDate, 105) IS NOT NULL\n"
                    + "    GROUP BY r.ringID, r.ringName, r.ringImage, YEAR(TRY_CONVERT(datetime, o.orderDate, 105)), \n"
                    + "             MONTH(TRY_CONVERT(datetime, o.orderDate, 105)), DATENAME(MONTH, TRY_CONVERT(datetime, o.orderDate, 105)),\n"
                    + "             r.price, rp.rpPrice, dp.price\n"
                    + ")\n"
                    + "SELECT\n"
                    + "    ringID,\n"
                    + "    ringName,\n"
                    + "    ringImage,\n"
                    + "    PurchaseCount,\n"
                    + "    priceOfEachRings,\n"
                    + "    OrderYear,\n"
                    + "    OrderMonth,\n"
                    + "    MonthName\n"
                    + "FROM TopRankedRings\n"
                    + "WHERE RowNum <= 5\n"
                    + "ORDER BY OrderYear DESC, OrderMonth DESC, RowNum;";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    String ringImage = rs.getString("ringImage");
                    int purchaseCount = rs.getInt("PurchaseCount");
                    String totalPrice = rs.getString("priceOfEachRings");
                    int orderYear = rs.getInt("OrderYear");
                    int orderMonth = rs.getInt("OrderMonth");
                    String monthName = rs.getString("MonthName");

                    RingDTO ring = new RingDTO();

                    ring.setRingID(ringID);
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
                    ring.setPurchaseCount(purchaseCount);
                    ring.setTotalPrice(totalPrice);

                    ring.setOrderYear(orderYear);
                    ring.setOrderMonth(orderMonth);
                    ring.setMonthName(monthName);
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

    public RingDTO loadTotalRings() {

        String sql = "SELECT COUNT(*) as totalRings\n"
                + "FROM Ring \n"
                + "WHERE status = 'active'; ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int totalRings = rs.getInt("totalRings");

                RingDTO ring = new RingDTO();

                ring.setTotalRings(totalRings);

                return ring;
            }
        } catch (SQLException ex) {
            System.out.println("Query Rings error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
