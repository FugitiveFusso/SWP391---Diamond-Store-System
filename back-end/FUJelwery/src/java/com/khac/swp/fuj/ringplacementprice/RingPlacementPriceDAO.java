/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.ringplacementprice;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RingPlacementPriceDAO {

    public List<RingPlacementPriceDTO> getAllRingPlacementPrice(String keyword, String sortCol, int page, int pageSize) {
        List<RingPlacementPriceDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT rpID, rName, material, color, FORMAT(rpPrice, 'N0') AS rpPrice "
                    + "FROM RingPlacementPrice WHERE isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (rName LIKE ? OR material LIKE ? OR color LIKE ? OR rpPrice LIKE ?)";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC";
            } else {
                sql += " ORDER BY rpID ASC"; // Default sorting by rpID
            }

            sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement stmt = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(paramIndex++, "%" + keyword + "%");
                stmt.setString(paramIndex++, "%" + keyword + "%");
                stmt.setString(paramIndex++, "%" + keyword + "%");
                stmt.setString(paramIndex++, "%" + keyword + "%");
            }

            stmt.setInt(paramIndex++, (page - 1) * pageSize);
            stmt.setInt(paramIndex, pageSize);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int rpid = rs.getInt("rpID");
                String name = rs.getString("rName");
                String material = rs.getString("material");
                String color = rs.getString("color");
                String price = rs.getString("rpPrice");

                RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                rp.setId(rpid);
                rp.setName(name);
                rp.setMaterial(material);
                rp.setColor(color);
                rp.setPrice(price);

                list.add(rp);
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalRingPlacementPriceCount(String keyword) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM RingPlacementPrice WHERE isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (rName LIKE ? OR material LIKE ? OR color LIKE ? OR rpPrice LIKE ?)";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
                stmt.setString(3, "%" + keyword + "%");
                stmt.setString(4, "%" + keyword + "%");
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

    public RingPlacementPriceDTO load(int rpID) {

        String sql = " select rpID, rName, material, color, FORMAT(rpPrice, 'N0') AS rpPrice from RingPlacementPrice where rpID = ? and isDeleted = 'active'";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, rpID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int rpid = rs.getInt("rpID");
                String name = rs.getString("rName");
                String material = rs.getString("material");
                String color = rs.getString("color");
                String price = rs.getString("rpPrice");

                RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                rp.setId(rpid);
                rp.setName(name);
                rp.setMaterial(material);
                rp.setColor(color);
                rp.setPrice(price);
                return rp;
            }
        } catch (SQLException ex) {
            System.out.println("Query RP Price error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(RingPlacementPriceDTO rp) {
        String sql = "INSERT INTO [RingPlacementPrice] (rName, material, color, rpPrice, isDeleted) "
                + "VALUES (?, ?, ?, ?, 'active')";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, rp.getName());
            ps.setString(2, rp.getMaterial());
            ps.setString(3, rp.getColor());
            ps.setString(4, rp.getPrice());

            ps.executeUpdate();
            conn.close();
            return rp.getId();
        } catch (SQLException ex) {
            System.out.println("Insert RingPlacementPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(RingPlacementPriceDTO rp) {
        String sql = "UPDATE [RingPlacementPrice] SET rName = ?, material = ?, color = ?, rpPrice = ? WHERE rpID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, rp.getName());
            ps.setString(2, rp.getMaterial());
            ps.setString(3, rp.getColor());
            ps.setString(4, rp.getPrice());
            ps.setInt(5, rp.getId());
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update RingPlacementPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "Update [RingPlacementPrice] set isDeleted = 'deleted' WHERE rpID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete RingPlacementPrice error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public RingPlacementPriceDTO checkRPExist(String rName, String material, String color) {

        String sql = " select rpID, rName, material, color, rpPrice from RingPlacementPrice"
                + " where rName like ? and material = ? and color = ? ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, rName);
            ps.setString(2, material);
            ps.setString(3, color);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                rp.setId(rs.getInt("rpID"));
                rp.setName(rs.getString("rName"));
                rp.setMaterial(rs.getString("material"));
                rp.setColor(rs.getString("color"));
                rp.setPrice(rs.getString("rpPrice"));
                return rp;
            }
        } catch (SQLException ex) {
            System.out.println("Query RP Price error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public RingPlacementPriceDTO loadStatisticsA() {

        String sql = "SELECT COUNT(*) AS TotalRingPlacements, FORMAT(AVG(rpPrice), 'N0') AS AveragePrice FROM [RingPlacementPrice] WHERE isDeleted = 'active'; ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int totalRingPlacements = rs.getInt("TotalRingPlacements");
                String averagePrice = rs.getString("AveragePrice");

                RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                rp.setTotalRp(totalRingPlacements);
                rp.setAveragePrice(averagePrice);
                return rp;
            }
        } catch (SQLException ex) {
            System.out.println("Query RP Price error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public List<RingPlacementPriceDTO> getStatisticsA() {
        List<RingPlacementPriceDTO> list = new ArrayList<RingPlacementPriceDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " WITH MaterialCounts AS (\n"
                    + "    SELECT \n"
                    + "        material, \n"
                    + "        COUNT(*) AS RingPlacementsByMaterial, \n"
                    + "        FORMAT(SUM(rpPrice), 'N0') AS TotalMaterialPrice,\n"
                    + "        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rowNum\n"
                    + "    FROM [RingPlacementPrice] \n"
                    + "    WHERE isDeleted = 'active' \n"
                    + "    GROUP BY material\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    material, \n"
                    + "    RingPlacementsByMaterial, \n"
                    + "    TotalMaterialPrice\n"
                    + "FROM MaterialCounts\n"
                    + "WHERE rowNum <= 5\n"
                    + "ORDER BY RingPlacementsByMaterial DESC; ";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int ringPlacementsByMaterial = rs.getInt("RingPlacementsByMaterial");
                    String totalMaterialPrice = rs.getString("TotalMaterialPrice");
                    String material = rs.getString("material");

                    RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                    rp.setRingPlacementsByMaterial(ringPlacementsByMaterial);
                    rp.setTotalMaterialPrice(totalMaterialPrice);
                    rp.setMaterial(material);

                    list.add(rp);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public List<RingPlacementPriceDTO> getStatisticsB() {
        List<RingPlacementPriceDTO> list = new ArrayList<RingPlacementPriceDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " WITH ColorCounts AS (\n"
                    + "    SELECT \n"
                    + "        color, \n"
                    + "        COUNT(*) AS RingPlacementsByColor, \n"
                    + "        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rowNum\n"
                    + "    FROM [RingPlacementPrice] \n"
                    + "    WHERE isDeleted = 'active' \n"
                    + "    GROUP BY color\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    color, \n"
                    + "    RingPlacementsByColor\n"
                    + "FROM ColorCounts\n"
                    + "WHERE rowNum <= 5\n"
                    + "ORDER BY RingPlacementsByColor DESC; ";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int ringPlacementsByColor = rs.getInt("RingPlacementsByColor");
                    String color = rs.getString("color");

                    RingPlacementPriceDTO rp = new RingPlacementPriceDTO();
                    rp.setRingPlacementsByColor(ringPlacementsByColor);
                    rp.setColor(color);

                    list.add(rp);
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
