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

    public List<RingDTO> list(String keyword, String sortCol) {
        List<RingDTO> list = new ArrayList<RingDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, FORMAT(r.price , 'N0') AS ringPrice, FORMAT(((r.price + rp.rpPrice + dp.price)*1.02) , 'N0') AS totalPrice, r.collectionID, r.categoryID, rp.rName, rp.material, rp.color AS [ringColor], FORMAT(rp.rpPrice , 'N0') AS rpPrice, d.diamondName, d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], dp.clarity, dp.cut, FORMAT(dp.price , 'N0') AS [diamondShapePrice]"
                    + " FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID where r.isDeleted = 'active' ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " and ringName like ? ";
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
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public RingDTO load(int ringID) {

        String sql = "SELECT r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, FORMAT(r.price , 'N0') AS ringPrice, FORMAT(((r.price + rp.rpPrice + dp.price)*1.02) , 'N0') AS totalPrice, r.collectionID, r.categoryID, rp.rName, rp.material, rp.color AS [ringColor], FORMAT(rp.rpPrice , 'N0') AS rpPrice, d.diamondName, d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], dp.clarity, dp.cut, FORMAT(dp.price , 'N0') AS [diamondShapePrice]"
                + " FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID WHERE r.ringID = ? and r.isDeleted = 'active' ";

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

    public Integer insert(RingDTO ring) {
        String sql = "INSERT INTO [Ring] (rpID, ringName, ringImage, diamondID, price, collectionID, categoryID, isDeleted) VALUES (?, ?, ?, ?, ?, ?, ?, 'active' )";
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
        String sql = "UPDATE [Ring] SET isDeleted = 'deleted' WHERE ringID = ? ";
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
                + " FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID WHERE r.ringName = ? and r.isDeleted = 'active' ";

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

    public List<RingDTO> listByCollection(int collectionID) {
        List<RingDTO> list = new ArrayList<RingDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, FORMAT(r.price , 'N0') AS ringPrice, FORMAT(((r.price + rp.rpPrice + dp.price)*1.02) , 'N0') AS totalPrice, r.collectionID, r.categoryID, rp.rName, rp.material, rp.color AS [ringColor], FORMAT(rp.rpPrice , 'N0') AS rpPrice, d.diamondName, d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], dp.clarity, dp.cut, FORMAT(dp.price , 'N0') AS [diamondShapePrice]"
                    + " FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID where r.collectionID = ? and r.isDeleted = 'active' ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, collectionID);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
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
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public List<RingDTO> listByCategory(int categoryID) {
        List<RingDTO> list = new ArrayList<RingDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT r.ringID, r.rpID, r.ringName, r.ringImage, r.diamondID, FORMAT(r.price , 'N0') AS ringPrice, FORMAT(((r.price + rp.rpPrice + dp.price)*1.02) , 'N0') AS totalPrice, r.collectionID, r.categoryID, rp.rName, rp.material, rp.color AS [ringColor], FORMAT(rp.rpPrice , 'N0') AS rpPrice, d.diamondName, d.diamondImage, d.origin, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color AS [diamondColor], dp.clarity, dp.cut, FORMAT(dp.price , 'N0') AS [diamondShapePrice]"
                    + " FROM [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID where r.categoryID = ? and r.isDeleted = 'active' ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryID);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
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
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
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
                    + "    WHERE r.isDeleted = 'active'\n"
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
                    + "    WHERE r.isDeleted = 'active'\n"
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
            String sql = "WITH Top5MostBoughtRings AS (\n"
                    + "    SELECT TOP 5 r.ringID, r.ringName, r.ringImage, COUNT(o.orderID) AS PurchaseCount, FORMAT(((r.price + rp.rpPrice + dp.price) * 1.02), 'N0') AS priceOfEachRings\n"
                    + "    FROM [Order] o\n"
                    + "    LEFT JOIN [Ring] r ON o.ringID = r.ringID\n"
                    + "    LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID\n"
                    + "    LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID\n"
                    + "    LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "    WHERE r.isDeleted = 'active'\n"
                    + "    GROUP BY r.ringID, r.ringName, r.price, rp.rpPrice, dp.price, r.ringImage\n"
                    + "    ORDER BY PurchaseCount DESC\n"
                    + ")\n"
                    + "\n"
                    + "SELECT\n"
                    + "    ringID,\n"
                    + "    ringName,\n"
                    + "	ringImage,\n"
                    + "    PurchaseCount,\n"
                    + "    priceOfEachRings\n"
                    + "FROM Top5MostBoughtRings;";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    String ringImage = rs.getString("ringImage");
                    int purchaseCount = rs.getInt("PurchaseCount");
                    String totalPrice = rs.getString("priceOfEachRings");

                    RingDTO ring = new RingDTO();

                    ring.setRingID(ringID);
                    ring.setRingName(ringName);
                    ring.setRingImage(ringImage);
                    ring.setPurchaseCount(purchaseCount);
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
}
