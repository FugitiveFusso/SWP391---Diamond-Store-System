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
            String sql = "SELECT o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, r.ringImage, v.voucherID, v.voucherName, o.ringSize, FORMAT(((SUM(COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0') AS [totalPrice], o.status,\n"
                    + "(SELECT COUNT(DISTINCT o2.orderID) FROM [Order] o2 WHERE o2.userID = ? AND o2.status = 'pending') AS totalOrders\n"
                    + "FROM [Order] o LEFT JOIN [User] u ON o.userID = u.userID LEFT JOIN [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID \n"
                    + "GROUP BY o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, v.percentage,  o.ringSize, o.status, r.ringImage\n"
                    + "HAVING o.userID = ? AND o.status = 'pending'";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, userID);
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
                    String totalPrice = rs.getString("totalPrice");
                    String status = rs.getString("status");
                    String image = rs.getString("ringImage");
                    int totalOfOrders = rs.getInt("totalOrders");

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
                    order.setImage(image);
                    order.setNumberOfThings(totalOfOrders);

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

    public String totalAllProduct(int userID) throws SQLException {
        Connection connection = DBUtils.getConnection();
        String query = "SELECT FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0' )  AS totalPrice FROM [Order] o LEFT JOIN [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON r.diamondID = d.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID WHERE o.userID = ? AND o.status = 'pending';";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userID);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {  // Move to the first row, if it exists
                    return resultSet.getString("totalPrice");
                } else {
                    // Handle the case when no rows are returned
                    throw new SQLException("No data found for user ID: " + userID);
                }
            }
        }
    }

    public boolean updateScore(int userID) {
        String sql = "UPDATE [User] set point = point + ((SELECT SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100))  AS totalPrice FROM [Order] o LEFT JOIN [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON r.diamondID = d.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID WHERE o.userID = ? AND o.status = 'pending') / 1000000) where userID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userID);
            ps.setInt(2, userID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Purchase error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public List<OrderDTO> listHistoryReceiveAtStore(int userID) {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, FORMAT((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100), 'N0') AS totalPrice, o.status FROM [Order] o LEFT JOIN [User] u ON o.userID = u.userID LEFT JOIN [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON r.diamondID = d.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID WHERE o.userID = ? AND o.status <> 'pending' AND o.purchaseMethod = 'received at store' ";

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
                    String totalPrice = rs.getString("totalPrice");
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
    
    public List<OrderDTO> listHistoryDelivery(int userID) {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, FORMAT((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100), 'N0') AS totalPrice, o.status FROM [Order] o LEFT JOIN [User] u ON o.userID = u.userID LEFT JOIN [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON r.diamondID = d.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID WHERE o.userID = ? AND o.status <> 'pending' AND o.purchaseMethod = 'Door-to-door delivery service' ";

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
                    String totalPrice = rs.getString("totalPrice");
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

    public List<OrderDTO> listForSales() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "select o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName,'n/a') AS [voucherName], COALESCE(o.warrantyID, 0) AS [warrantyID],o.ringSize, FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0' ) AS [totalPrice], o.status from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID group by o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, v.percentage, o.warrantyID, o.ringSize, o.status HAVING o.status = 'purchased'";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String address = rs.getString("address");
                    String orderDate = rs.getString("orderDate");
                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    int voucherID = rs.getInt("voucherID");
                    String voucherName = rs.getString("voucherName");
                    int warrantyID = rs.getInt("warrantyID");
                    int ringSize = rs.getInt("ringSize");
                    String totalPrice = rs.getString("totalPrice");
                    String status = rs.getString("status");

                    OrderDTO order = new OrderDTO();

                    order.setOrderID(orderID);
                    order.setUserID(userID1);
                    order.setUserName(userName);
                    order.setAddress(address);
                    order.setOrderDate(orderDate);
                    order.setRingID(ringID);
                    order.setRingName(ringName);
                    order.setVoucherID(voucherID);
                    order.setVoucherName(voucherName);
                    order.setWarrantyID(warrantyID);
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

    public List<OrderDTO> receivedAtStore() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "select o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName,'n/a') AS [voucherName], COALESCE(o.warrantyID, 0) AS [warrantyID], COALESCE(w.warrantyName, 'n/a') AS [warrantyName], o.ringSize, FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0' ) AS [totalPrice], o.status from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID LEFT JOIN [Warranty] w ON o.warrantyID = w.warrantyID group by o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, v.percentage, o.warrantyID, o.ringSize, o.status, o.purchaseMethod, w.warrantyName HAVING o.status = 'verified' AND o.purchaseMethod = 'Received at store' ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String address = rs.getString("address");
                    String orderDate = rs.getString("orderDate");
                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    int voucherID = rs.getInt("voucherID");
                    String voucherName = rs.getString("voucherName");
                    int warrantyID = rs.getInt("warrantyID");
                    String warrantyName = rs.getString("warrantyName");
                    int ringSize = rs.getInt("ringSize");
                    String totalPrice = rs.getString("totalPrice");
                    String status = rs.getString("status");

                    OrderDTO order = new OrderDTO();

                    order.setOrderID(orderID);
                    order.setUserID(userID1);
                    order.setUserName(userName);
                    order.setAddress(address);
                    order.setOrderDate(orderDate);
                    order.setRingID(ringID);
                    order.setRingName(ringName);
                    order.setVoucherID(voucherID);
                    order.setVoucherName(voucherName);
                    order.setWarrantyID(warrantyID);
                    order.setWarrantyName(warrantyName);
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

    public List<OrderDTO> listForDelivery() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();

            String sql = "select o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName,'n/a') AS [voucherName], COALESCE(o.warrantyID, 0) AS [warrantyID], COALESCE(w.warrantyName, 'n/a') AS [warrantyName], o.ringSize, FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0' ) AS [totalPrice], o.status from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID LEFT JOIN [Warranty] w ON o.warrantyID = w.warrantyID group by o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, v.percentage, o.warrantyID, o.ringSize, o.status, o.purchaseMethod, w.warrantyName HAVING o.status = 'verified' AND o.status = 'shipping' AND o.purchaseMethod = 'Door-to-door delivery service' ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String address = rs.getString("address");
                    String orderDate = rs.getString("orderDate");
                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    int voucherID = rs.getInt("voucherID");
                    String voucherName = rs.getString("voucherName");
                    int warrantyID = rs.getInt("warrantyID");
                    String warrantyName = rs.getString("warrantyName");
                    int ringSize = rs.getInt("ringSize");
                    String totalPrice = rs.getString("totalPrice");
                    String status = rs.getString("status");

                    OrderDTO order = new OrderDTO();

                    order.setOrderID(orderID);
                    order.setUserID(userID1);
                    order.setUserName(userName);
                    order.setAddress(address);
                    order.setOrderDate(orderDate);
                    order.setRingID(ringID);
                    order.setRingName(ringName);
                    order.setVoucherID(voucherID);
                    order.setVoucherName(voucherName);
                    order.setWarrantyID(warrantyID);
                    order.setWarrantyName(warrantyName);
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

    public List<OrderDTO> deliveryHistory() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();

            String sql = "select o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName,'n/a') AS [voucherName], COALESCE(o.warrantyID, 0) AS [warrantyID], COALESCE(w.warrantyName, 'n/a') AS [warrantyName], o.ringSize, FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0' ) AS [totalPrice], o.status from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID LEFT JOIN [Warranty] w ON o.warrantyID = w.warrantyID group by o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, v.percentage, o.warrantyID, o.ringSize, o.status, o.purchaseMethod, w.warrantyName HAVING o.status = 'delivered'  ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String address = rs.getString("address");
                    String orderDate = rs.getString("orderDate");
                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    int voucherID = rs.getInt("voucherID");
                    String voucherName = rs.getString("voucherName");
                    int warrantyID = rs.getInt("warrantyID");
                    String warrantyName = rs.getString("warrantyName");
                    int ringSize = rs.getInt("ringSize");
                    String totalPrice = rs.getString("totalPrice");
                    String status = rs.getString("status");

                    OrderDTO order = new OrderDTO();

                    order.setOrderID(orderID);
                    order.setUserID(userID1);
                    order.setUserName(userName);
                    order.setAddress(address);
                    order.setOrderDate(orderDate);
                    order.setRingID(ringID);
                    order.setRingName(ringName);
                    order.setVoucherID(voucherID);
                    order.setVoucherName(voucherName);
                    order.setWarrantyID(warrantyID);
                    order.setWarrantyName(warrantyName);
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

        String sql = " select o.orderID, u.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, FORMAT( ((r.price + rp.rpPrice + dp.price)*1.02), 'N0') AS [totalPrice], o.status, o.delivered ";
        sql += " from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON r.ringID = o.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID";
        sql += " WHERE o.orderID = ? AND o.status = 'pending' r.isDeleted = 'active'";

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
                String totalPrice = rs.getString("totalPrice");
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
    
    public OrderDTO loadBillDetail(int orderID) {

        String sql = "select o.orderID, o.userID, u.userName, u.address, o.orderDate, o.purchaseMethod, r.ringID, r.ringName, r.ringImage, COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName,'n/a') AS [voucherName], COALESCE(o.warrantyID, 0) AS [warrantyID], COALESCE(w.warrantyName, 'n/a') AS [warrantyName], o.ringSize, FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0' ) AS [totalPrice], o.status from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID LEFT JOIN [Warranty] w ON o.warrantyID = w.warrantyID WHERE o.orderID = ? AND o.status <> 'pending' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int orderID1 = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String address = rs.getString("address");
                    String orderDate = rs.getString("orderDate");
                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    String ringImage = rs.getString("ringImage");
                    int voucherID = rs.getInt("voucherID");
                    String voucherName = rs.getString("voucherName");
                    int warrantyID = rs.getInt("warrantyID");
                    String warrantyName = rs.getString("warrantyName");
                    int ringSize = rs.getInt("ringSize");
                    String totalPrice = rs.getString("totalPrice");
                    String status = rs.getString("status");

                    OrderDTO order = new OrderDTO();

                    order.setOrderID(orderID1);
                    order.setUserID(userID1);
                    order.setUserName(userName);
                    order.setAddress(address);
                    order.setOrderDate(orderDate);
                    order.setRingID(ringID);
                    order.setRingName(ringName);
                    order.setRingImage(ringImage);
                    order.setVoucherID(voucherID);
                    order.setVoucherName(voucherName);
                    order.setWarrantyID(warrantyID);
                    order.setWarrantyName(warrantyName);
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

    public boolean purchase(String paymentMethod, int userID, String purchasedDate) {
        String sql = "UPDATE [Order] SET orderDate = ?, purchaseMethod = ?, status = 'purchased' WHERE userID = ? AND status = 'pending' ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, purchasedDate);
            ps.setString(2, paymentMethod);
            ps.setInt(3, userID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Purchase error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }
    
    public int checkWarrantyActive(int warrantyID) {
        int warrantyID1 = 0;
        String sql = "SELECT warrantyID FROM [Warranty] WHERE warrantyID = ? AND isDeleted = 'active' ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, warrantyID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                warrantyID1 = rs.getInt("warrantyID");
                return warrantyID1;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return warrantyID1;
    }
    
    public int checkWarranty(int warrantyID) {
        int orderID = 0;
        String sql = "SELECT orderID FROM [Order] WHERE warrantyID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, warrantyID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                orderID = rs.getInt("orderID");
                return orderID;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return orderID;
    }

    public int searchVoucherID(String code) {
        String sql = "SELECT voucherID FROM [Voucher] WHERE coupon = ? AND isDeleted = 'active'";
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

    public boolean addWarranty(int warrantyID, int orderID) {
        String sql = "UPDATE [Order] SET warrantyID = ? WHERE orderID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, warrantyID);
            ps.setInt(2, orderID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Adding warranty error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean acceptOrder(int orderID) {
        String sql = "UPDATE [Order] SET status = 'verified' WHERE orderID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, orderID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Adding voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean receivedOrder(int orderID) {
        String sql = "UPDATE [Order] SET status = 'received at store' WHERE orderID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, orderID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Adding voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deliveringOrder(int orderID) {
        String sql = "UPDATE [Order] SET status = 'shipping' WHERE orderID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, orderID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Change delivering error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deliveredOrder(int orderID) {
        String sql = "UPDATE [Order] SET status = 'delivered' WHERE orderID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, orderID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Change delivered error!" + ex.getMessage());
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
