/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.order;

import com.khac.swp.fuj.order.OrderDTO;
import com.khac.swp.fuj.utils.DBUtils;
import com.khac.swp.fuj.voucher.VoucherDTO;
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
public class OrderDAO {

    public List<OrderDTO> list(int userID) {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "select o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, ((SUM(COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) * ((100.0 - COALESCE(v.percentage, 0)) / 100)) AS [totalPrice], o.status from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID group by o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, v.percentage, o.ringSize, o.status HAVING o.userID = ? AND o.status = 'pending' ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String orderDate = rs.getString("orderDate");
                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    int voucherID = rs.getInt("voucherID");
                    String voucherName = rs.getString("voucherName");
                    int ringSize = rs.getInt("ringSize");
                    int totalPrice = rs.getInt("totalPrice");
                    String status = rs.getString("status");

                    OrderDTO order = new OrderDTO();

                    order.setOrderID(orderID);
                    order.setUserID(userID1);
                    order.setUserName(userName);
                    order.setOrderDate(orderDate);
                    order.setRingID(ringID);
                    order.setRingName(ringName);
                    order.setVoucherID(voucherID);
                    order.setVoucherName(voucherName);
                    order.setRingSize(ringSize);
                    order.setTotalPrice(totalPrice);
                    order.setStatus(status);

                    list.add(order);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int totalAllProduct(int userID) throws SQLException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT \n"
                + "    SUM(\n"
                + "        (COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)\n"
                + "    ) AS totalPrice\n"
                + "FROM \n"
                + "    [Order] o \n"
                + "LEFT JOIN \n"
                + "    [Ring] r ON o.ringID = r.ringID \n"
                + "LEFT JOIN \n"
                + "    [RingPlacementPrice] rp ON r.rpID = rp.rpID \n"
                + "LEFT JOIN \n"
                + "    [Diamond] d ON r.diamondID = d.diamondID \n"
                + "LEFT JOIN \n"
                + "    [DiamondPrice] dp ON d.dpID = dp.dpID \n"
                + "LEFT JOIN \n"
                + "    [Voucher] v ON o.voucherID = v.voucherID \n"
                + "WHERE \n"
                + "	o.userID = ? AND\n"
                + "    o.status = 'pending';";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {  // Move to the first row, if it exists
                    return resultSet.getInt("totalPrice");
                } else {
                    // Handle the case when no rows are returned
                    throw new SQLException("No data found for user ID: " + userID);
                }
            }
        }
    }

    public List<OrderDTO> listHistory(int userID) {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " select o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, ((r.price + rp.rpPrice + dp.price)*1.02) AS [totalPrice], o.status from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID WHERE o.userID = ? AND o.status = 'purchase' AND 'received' ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String orderDate = rs.getString("orderDate");
                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    int voucherID = rs.getInt("voucherID");
                    String voucherName = rs.getString("voucherName");
                    int ringSize = rs.getInt("ringSize");
                    int totalPrice = rs.getInt("totalPrice");
                    String status = rs.getString("status");

                    OrderDTO order = new OrderDTO();

                    order.setOrderID(orderID);
                    order.setUserID(userID1);
                    order.setUserName(userName);
                    order.setOrderDate(orderDate);
                    order.setRingID(ringID);
                    order.setRingName(ringName);
                    order.setVoucherID(voucherID);
                    order.setVoucherName(voucherName);
                    order.setRingSize(ringSize);
                    order.setTotalPrice(totalPrice);
                    order.setStatus(status);

                    list.add(order);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public OrderDTO load(int orderID) {

        String sql = " select o.orderID, u.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, ((r.price + rp.rpPrice + dp.price)*1.02) AS [totalPrice], o.status, o.delivered ";
        sql += " from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON r.ringID = o.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID";
        sql += " WHERE o.orderID = ? AND o.status = 'pending' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ID = rs.getInt("orderID");
                int userID = rs.getInt("userID");
                String userName = rs.getString("userName");
                String orderDate = rs.getString("orderDate");
                int ringID = rs.getInt("ringID");
                String ringName = rs.getString("ringName");
                int voucherID = rs.getInt("voucherID");
                String voucherName = rs.getString("voucherName");
                int ringSize = rs.getInt("ringSize");
                int totalPrice = rs.getInt("totalPrice");
                String status = rs.getString("status");

                OrderDTO order = new OrderDTO();

                order.setOrderID(ID);
                order.setUserID(userID);
                order.setUserName(userName);
                order.setOrderDate(orderDate);
                order.setRingID(ringID);
                order.setRingName(ringName);
                order.setVoucherID(voucherID);
                order.setVoucherName(voucherName);
                order.setRingSize(ringSize);
                order.setTotalPrice(totalPrice);
                order.setStatus(status);
                return order;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(OrderDTO order) {
        String sql = "INSERT INTO [Order] (orderID, userID, orderDate, ringID, ringSize, status) VALUES (?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, order.getOrderID());
            ps.setInt(2, order.getUserID());
            ps.setString(3, order.getOrderDate());
            ps.setInt(4, order.getRingID());
            ps.setInt(5, order.getRingSize());
            ps.setString(6, order.getStatus());

            ps.executeUpdate();
            conn.close();
            return order.getOrderID();
        } catch (SQLException ex) {
            System.out.println("Insert Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(OrderDTO order) {
        String sql = "UPDATE [Order] SET ringID = ?, voucherID = ?, ringSize = ?, status = ? WHERE orderID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, order.getRingID());
            ps.setInt(2, order.getVoucherID());
            ps.setInt(3, order.getRingSize());
            ps.setInt(4, order.getVoucherID());
            ps.setString(5, order.getStatus());
            ps.setInt(6, order.getOrderID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean purchase(String paymentMethod, int userID) {
        String sql = "UPDATE [Order] SET purchaseMethod = ?, status = 'purchased' WHERE userID = ? AND status = 'pending' ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, paymentMethod);
            ps.setInt(2, userID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Purchase error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public String searchVoucher(String code) {
        String sql = "SELECT voucherName FROM [Voucher] WHERE coupon = ?";
        String voucherName = null;
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    voucherName = rs.getString("voucherName");
                    return voucherName;
                }
            }
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Get Voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return voucherName;
    }

    public int searchVoucherID(String code) {
        String sql = "SELECT voucherID FROM [Voucher] WHERE coupon = ?";
        int voucherID = 0;
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, code);
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    voucherID = rs.getInt("voucherID");
                    return voucherID;
                }
            }
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Get Voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return voucherID;
    }

    public boolean applyVoucher(int voucherID, int userID) {
        String sql = "UPDATE [Order] SET voucherID = ? WHERE userID = ? AND status = 'pending' ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, voucherID);
            ps.setInt(2, userID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Adding voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean removeVoucher(int userID) {
        String sql = "UPDATE [Order] SET voucherID = null WHERE userID = ? AND status = 'pending' ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Remove voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "DELETE [Order] WHERE orderID = ?";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Order error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

}
