package com.khac.swp.fuj.diamond;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DiamondDAO {

    Connection conn = DBUtils.getConnection();
    ResultSet rs = null;

    public List<DiamondDTO> list(String keyword, String sortCol) {
        List<DiamondDTO> list = new ArrayList<DiamondDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT d.diamondID, d.diamondName, d.diamondImage, d.origin, d.dpID, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color, dp.clarity, dp.cut, dp.price FROM Diamond d LEFT JOIN DiamondPrice dp ON d.dpID = dp.dpID ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE d.diamondName like ? or dp.diamondSize like ? or dp.caratWeight like ? or dp.color like ? or dp.clarity like ? or dp.price like ?";
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
                stmt.setString(6, "%" + keyword + "%");

            }
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int diamondID = rs.getInt("diamondID");
                    String diamondName = rs.getString("diamondName");
                    String diamondImage = rs.getString("diamondImage");
                    String origin = rs.getString("origin");
                    int dpID = rs.getInt("dpID");
                    int certificateID = rs.getInt("certificateID");
                    double diamondSize = rs.getDouble("diamondSize");
                    double caratWeight = rs.getDouble("caratWeight");
                    String color = rs.getString("color");
                    String clarity = rs.getString("clarity");
                    String cut = rs.getString("cut");
                    int price = rs.getInt("price");

                    DiamondDTO diamond = new DiamondDTO();
                    diamond.setDiamondID(diamondID);
                    diamond.setDiamondName(diamondName);
                    diamond.setDiamondImage(diamondImage);
                    diamond.setOrigin(origin);
                    diamond.setDpID(dpID);
                    diamond.setCertificateID(certificateID);
                    diamond.setDiamondSize(diamondSize);
                    diamond.setCaratWeight(caratWeight);
                    diamond.setColor(color);
                    diamond.setClarity(clarity);
                    diamond.setCut(cut);
                    diamond.setDiamondPrice(price);
                    list.add(diamond);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public DiamondDTO load(int diamondID) {

        String sql = "SELECT d.diamondID, d.diamondName, d.diamondImage, d.origin, d.dpID, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color, dp.clarity, dp.cut, dp.price FROM Diamond d LEFT JOIN DiamondPrice dp ON d.dpID = dp.dpID where diamondID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, diamondID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int diamondid = rs.getInt("diamondID");
                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int dpID = rs.getInt("dpID");
                int certificateID = rs.getInt("certificateID");
                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("color");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                int price = rs.getInt("price");

                DiamondDTO diamond = new DiamondDTO();
                diamond.setDiamondID(diamondid);
                diamond.setDiamondName(diamondName);
                diamond.setDiamondImage(diamondImage);
                diamond.setOrigin(origin);
                diamond.setDpID(dpID);
                diamond.setCertificateID(certificateID);
                diamond.setDiamondSize(diamondSize);
                diamond.setCaratWeight(caratWeight);
                diamond.setColor(color);
                diamond.setClarity(clarity);
                diamond.setCut(cut);
                diamond.setDiamondPrice(price);
                return diamond;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(DiamondDTO diamond) {
        String sql = "INSERT INTO [Diamond] (diamondID, diamondName, diamondImage, origin, dpID, certificateID) VALUES (?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, diamond.getDiamondID());
            ps.setString(2, diamond.getDiamondName());
            ps.setString(3, diamond.getDiamondImage());
            ps.setString(4, diamond.getOrigin());
            ps.setInt(5, diamond.getDpID());
            ps.setInt(6, diamond.getCertificateID());

            ps.executeUpdate();
            conn.close();
            return diamond.getDiamondID();
        } catch (SQLException ex) {
            System.out.println("Insert Diamond error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(DiamondDTO diamond) {
        String sql = "UPDATE [Diamond] SET diamondName = ?, diamondImage = ?, origin = ?, dpID = ?, certificateID = ? WHERE diamondID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, diamond.getDiamondName());
            ps.setString(2, diamond.getDiamondImage());
            ps.setString(3, diamond.getOrigin());
            ps.setInt(4, diamond.getDpID());
            ps.setInt(5, diamond.getCertificateID());
            ps.setInt(6, diamond.getDiamondID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Diamond error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    /*
    Delete student 
     */
    public boolean delete(int id) {
        String sql = "DELETE [Diamond] WHERE diamondID = ? ";
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

    public DiamondDTO checkDiamondExistByID(int diamondID) {

        String sql = "SELECT d.diamondID, d.diamondName, d.diamondImage, d.origin, d.dpID, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color, dp.clarity, dp.cut, dp.price FROM Diamond d LEFT JOIN DiamondPrice dp ON d.dpID = dp.dpID where diamondID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, diamondID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int diamondid = rs.getInt("diamondID");
                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int dpID = rs.getInt("dpID");
                int certificateID = rs.getInt("certificateID");
                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("color");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                int price = rs.getInt("price");

                DiamondDTO diamond = new DiamondDTO();
                diamond.setDiamondID(diamondid);
                diamond.setDiamondName(diamondName);
                diamond.setDiamondImage(diamondImage);
                diamond.setOrigin(origin);
                diamond.setDpID(dpID);
                diamond.setCertificateID(certificateID);
                diamond.setDiamondSize(diamondSize);
                diamond.setCaratWeight(caratWeight);
                diamond.setColor(color);
                diamond.setClarity(clarity);
                diamond.setCut(cut);
                diamond.setDiamondPrice(price);
                return diamond;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public DiamondDTO checkDiamondExistByDiamondPrice(int dpriceID) {

        String sql = "SELECT d.diamondID, d.diamondName, d.diamondImage, d.origin, d.dpID, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color, dp.clarity, dp.cut, dp.price FROM Diamond d LEFT JOIN DiamondPrice dp ON d.dpID = dp.dpID where d.dpID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, dpriceID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int diamondid = rs.getInt("diamondID");
                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int dpID = rs.getInt("dpID");
                int certificateID = rs.getInt("certificateID");
                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("color");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                int price = rs.getInt("price");

                DiamondDTO diamond = new DiamondDTO();
                diamond.setDiamondID(diamondid);
                diamond.setDiamondName(diamondName);
                diamond.setDiamondImage(diamondImage);
                diamond.setOrigin(origin);
                diamond.setDpID(dpID);
                diamond.setCertificateID(certificateID);
                diamond.setDiamondSize(diamondSize);
                diamond.setCaratWeight(caratWeight);
                diamond.setColor(color);
                diamond.setClarity(clarity);
                diamond.setCut(cut);
                diamond.setDiamondPrice(price);
                return diamond;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public DiamondDTO checkDiamondExistByDiamondCertificate(int cID) {

        String sql = "SELECT d.diamondID, d.diamondName, d.diamondImage, d.origin, d.dpID, d.certificateID, dp.diamondSize, dp.caratWeight, dp.color, dp.clarity, dp.cut, dp.price FROM Diamond d LEFT JOIN DiamondPrice dp ON d.dpID = dp.dpID where d.certificateID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, cID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int diamondid = rs.getInt("diamondID");
                String diamondName = rs.getString("diamondName");
                String diamondImage = rs.getString("diamondImage");
                String origin = rs.getString("origin");
                int dpID = rs.getInt("dpID");
                int certificateID = rs.getInt("certificateID");
                double diamondSize = rs.getDouble("diamondSize");
                double caratWeight = rs.getDouble("caratWeight");
                String color = rs.getString("color");
                String clarity = rs.getString("clarity");
                String cut = rs.getString("cut");
                int price = rs.getInt("price");

                DiamondDTO diamond = new DiamondDTO();
                diamond.setDiamondID(diamondid);
                diamond.setDiamondName(diamondName);
                diamond.setDiamondImage(diamondImage);
                diamond.setOrigin(origin);
                diamond.setDpID(dpID);
                diamond.setCertificateID(certificateID);
                diamond.setDiamondSize(diamondSize);
                diamond.setCaratWeight(caratWeight);
                diamond.setColor(color);
                diamond.setClarity(clarity);
                diamond.setCut(cut);
                diamond.setDiamondPrice(price);
                return diamond;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
    
}
