/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.order;

import com.khac.swp.fuj.order.OrderDTO;
import com.khac.swp.fuj.utils.DBUtils;
import com.khac.swp.fuj.voucher.VoucherDTO;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
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
                    + "(SELECT COUNT(DISTINCT o2.orderID) FROM [OrderDetails] o2 WHERE o2.userID = ? AND o2.status = 'pending') AS totalOrders\n"
                    + "FROM [OrderDetails] o LEFT JOIN [User] u ON o.userID = u.userID LEFT JOIN [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID \n"
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
        String query = "SELECT FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0' )  AS totalPrice FROM [OrderDetails] o LEFT JOIN [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON r.diamondID = d.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID WHERE o.userID = ? AND o.status = 'pending';";

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
        String sql = "UPDATE [User] set point = point + ((SELECT SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100))  AS totalPrice FROM [OrderDetails] o LEFT JOIN [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON r.diamondID = d.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID WHERE o.userID = ? AND o.status = 'pending') / 1000000) where userID = ? ";
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

    public List<OrderDTO> listHistoryReceiveAtStore(int userID, int page, int pageSize) {
        List<OrderDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT o.orderCode, o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, "
                    + "v.voucherID, v.voucherName, o.ringSize, "
                    + "FORMAT((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * "
                    + "((100.0 - COALESCE(v.percentage, 0)) / 100), 'N0') AS totalPrice, o.status "
                    + "FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID "
                    + "LEFT JOIN [Diamond] d ON r.diamondID = d.diamondID "
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "WHERE o.userID = ? "
                    + "AND o.status NOT IN ('pending', 'shipping', 'delivered') "
                    + "AND o.purchaseMethod = 'Received at store' "
                    + "ORDER BY o.orderID "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, (page - 1) * pageSize); // OFFSET
            ps.setInt(3, pageSize); // FETCH NEXT

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String orderCode = rs.getString("orderCode");
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
                    order.setOrderCode(orderCode);
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

    public int getTotalOrderHistoryReceiveAtStore(int userID) {
        int totalOrders = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) AS totalOrders FROM [OrderDetails] o "
                    + "WHERE o.userID = ? "
                    + "AND o.status NOT IN ('pending', 'shipping', 'delivered') "
                    + "AND o.purchaseMethod = 'Received at store'";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt("totalOrders");
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return totalOrders;
    }

    public List<OrderDTO> listHistoryDelivery(int userID, int page, int pageSize) {
        List<OrderDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT o.orderCode, o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, "
                    + "v.voucherID, v.voucherName, o.ringSize, "
                    + "FORMAT((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * "
                    + "((100.0 - COALESCE(v.percentage, 0)) / 100), 'N0') AS totalPrice, o.status "
                    + "FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID "
                    + "LEFT JOIN [Diamond] d ON r.diamondID = d.diamondID "
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "WHERE o.userID = ? "
                    + "AND o.status NOT IN ('pending') "
                    + "AND o.purchaseMethod = 'Door-to-door delivery service' "
                    + "ORDER BY o.orderID "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, (page - 1) * pageSize); // OFFSET
            ps.setInt(3, pageSize); // FETCH NEXT

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String orderCode = rs.getString("orderCode");
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
                    order.setOrderCode(orderCode);
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

    public int getTotalOrderHistoryDelivery(int userID) {
        int totalOrders = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) AS totalOrders FROM [OrderDetails] o "
                    + "WHERE o.userID = ? "
                    + "AND o.status NOT IN ('pending') "
                    + "AND o.purchaseMethod = 'Door-to-door delivery service'";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt("totalOrders");
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return totalOrders;
    }

    public List<OrderDTO> listPastPurchase(int userID, int page, int pageSize) {
        List<OrderDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT o.orderCode, o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, "
                    + "FORMAT((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100), 'N0') AS totalPrice, o.status "
                    + "FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID "
                    + "LEFT JOIN [Diamond] d ON r.diamondID = d.diamondID "
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "WHERE o.userID = ? AND o.status NOT IN ('pending', 'purchased', 'verified', 'shipping') "
                    + "ORDER BY o.orderID ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, (page - 1) * pageSize);
            ps.setInt(3, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                String orderCode = rs.getString("orderCode");
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
                order.setOrderCode(orderCode);
                list.add(order);
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalPastPurchaseCount(int userID) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM [OrderDetails] o "
                    + "WHERE o.userID = ? AND o.status NOT IN ('pending', 'purchased', 'verified', 'shipping')";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, userID);

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

    public List<OrderDTO> listForSales(String keyword_a, int page, int pageSize) {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT \n"
                    + "    o.orderID, \n"
                    + "    o.userID, \n"
                    + "    o.orderCode, \n"
                    + "    u.userName, \n"
                    + "    u.address, \n"
                    + "    o.orderDate, \n"
                    + "    r.ringID, \n"
                    + "    r.ringName, \n"
                    + "    COALESCE(v.voucherID, 0) AS voucherID, \n"
                    + "    COALESCE(v.voucherName, 'n/a') AS voucherName, \n"
                    + "    COALESCE(r.warrantyID, 0) AS warrantyID, \n"
                    + "    w.warrantyName, \n"
                    + "    o.ringSize, \n"
                    + "    FORMAT(SUM(COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100), 'N0') AS totalPrice, \n"
                    + "    o.status\n"
                    + "FROM [OrderDetails] o\n"
                    + "LEFT JOIN [User] u ON o.userID = u.userID\n"
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID\n"
                    + "LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID\n"
                    + "LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID\n"
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID\n"
                    + "LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID\n"
                    + "WHERE o.status = 'purchased' ";

            if (keyword_a != null && !keyword_a.isEmpty()) {
                sql += " AND (o.orderCode like ? OR u.userName LIKE ? OR u.address LIKE ? OR o.orderDate LIKE ? OR r.ringName LIKE ?) ";
            }

            sql += "GROUP BY \n"
                    + "    o.orderID, \n"
                    + "    o.userID, \n"
                    + "    o.orderCode, \n"
                    + "    u.userName, \n"
                    + "    u.address, \n"
                    + "    o.orderDate, \n"
                    + "    r.ringID, \n"
                    + "    r.ringName, \n"
                    + "    v.voucherID, \n"
                    + "    v.voucherName, \n"
                    + "    v.percentage, \n"
                    + "    r.warrantyID, \n"
                    + "    w.warrantyName, \n"
                    + "    o.ringSize, \n"
                    + "    o.status\n"
                    + "ORDER BY o.orderID ASC\n"
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";

            PreparedStatement ps = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword_a != null && !keyword_a.isEmpty()) {
                String keywordParam = "%" + keyword_a + "%";
                ps.setString(paramIndex++, keywordParam);
                ps.setString(paramIndex++, keywordParam);
                ps.setString(paramIndex++, keywordParam);
                ps.setString(paramIndex++, keywordParam);
                ps.setString(paramIndex++, keywordParam);
            }

            // Set pagination parameters
            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex, pageSize);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String orderCode = rs.getString("orderCode");
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
                    order.setOrderCode(orderCode);
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
                    order.setWarrantyName(warrantyName);

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

    public int getTotalOrder(String keyword_a) {
        int totalOrders = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) AS total FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "WHERE o.status = 'purchased' ";

            if (keyword_a != null && !keyword_a.isEmpty()) {
                sql += "AND (o.orderCode like ? or u.userName LIKE ? OR u.address LIKE ? OR o.orderDate LIKE ? OR r.ringName LIKE ?)";
            }

            PreparedStatement ps = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword_a != null && !keyword_a.isEmpty()) {
                ps.setString(paramIndex++, "%" + keyword_a + "%");
                ps.setString(paramIndex++, "%" + keyword_a + "%");
                ps.setString(paramIndex++, "%" + keyword_a + "%");
                ps.setString(paramIndex++, "%" + keyword_a + "%");
                ps.setString(paramIndex, "%" + keyword_a + "%");
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt("total");
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return totalOrders;
    }

    public List<OrderDTO> receivedAtStore(String keyword_b, int page, int pageSize) {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT o.orderID, o.userID, o.orderCode, u.userName, u.address, o.orderDate, r.ringID, r.ringName, \n"
                    + "COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName, 'n/a') AS [voucherName], \n"
                    + "COALESCE(r.warrantyID, 0) AS [warrantyID], w.warrantyName, COALESCE(w.warrantyName, 'n/a') AS [warrantyName], o.ringSize,\n"
                    + "FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0') AS [totalPrice], o.status \n"
                    + "FROM [OrderDetails] o \n"
                    + "LEFT JOIN [User] u ON o.userID = u.userID \n"
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID \n"
                    + "LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID \n"
                    + "LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID \n"
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID \n"
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID \n"
                    + "LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID \n"
                    + "WHERE o.status = 'verified' AND o.purchaseMethod = 'Received at store'";

            if (keyword_b != null && !keyword_b.isEmpty()) {
                sql += "AND (o.orderCode like ? or u.userName LIKE ? OR u.address LIKE ? OR o.orderDate LIKE ? OR r.ringName LIKE ?) ";
            }

            sql += "GROUP BY o.orderID, o.userID, o.orderCode, u.userName, u.address, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, "
                    + "v.percentage, r.warrantyID, w.warrantyName, o.ringSize, o.status, o.purchaseMethod "
                    + "ORDER BY o.orderID ASC "
                    + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword_b != null && !keyword_b.isEmpty()) {
                ps.setString(paramIndex++, "%" + keyword_b + "%");
                ps.setString(paramIndex++, "%" + keyword_b + "%");
                ps.setString(paramIndex++, "%" + keyword_b + "%");
                ps.setString(paramIndex++, "%" + keyword_b + "%");
                ps.setString(paramIndex++, "%" + keyword_b + "%");
            }

            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex, pageSize);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String orderCode = rs.getString("orderCode");
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
                    order.setOrderCode(orderCode);
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

    public int getTotalOrderReceivedAtStore(String keyword_b) {
        int totalOrders = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) AS total "
                    + "FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID "
                    + "WHERE o.status = 'verified' AND o.purchaseMethod = 'Received at store' ";

            if (keyword_b != null && !keyword_b.isEmpty()) {
                sql += "AND (o.orderCode like ? or u.userName LIKE ? OR u.address LIKE ? OR o.orderDate LIKE ? OR r.ringName LIKE ?)";
            }

            PreparedStatement ps = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword_b != null && !keyword_b.isEmpty()) {
                ps.setString(paramIndex++, "%" + keyword_b + "%");
                ps.setString(paramIndex++, "%" + keyword_b + "%");
                ps.setString(paramIndex++, "%" + keyword_b + "%");
                ps.setString(paramIndex++, "%" + keyword_b + "%");
                ps.setString(paramIndex, "%" + keyword_b + "%");
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalOrders = rs.getInt("total");
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return totalOrders;
    }

    public List<OrderDTO> listForDelivery(String keyword, int page, int pageSize) {
        List<OrderDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();

            String sql = "SELECT "
                    + "o.orderID, "
                    + "o.userID, "
                    + "o.orderCode, "
                    + "u.userName, "
                    + "u.address, "
                    + "o.orderDate, "
                    + "r.ringID, "
                    + "r.ringName, "
                    + "COALESCE(v.voucherID, 0) AS voucherID, "
                    + "COALESCE(v.voucherName,'n/a') AS voucherName, "
                    + "COALESCE(r.warrantyID, 0) AS warrantyID, "
                    + "COALESCE(w.warrantyName, 'n/a') AS warrantyName, "
                    + "o.ringSize, "
                    + "FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0') AS totalPrice, "
                    + "o.status "
                    + "FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID "
                    + "LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID "
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID "
                    + "WHERE (o.purchaseMethod = 'Door-to-door delivery service' AND o.status IN ('shipping', 'verified'))";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (o.orderCode like ? or u.userName LIKE ? OR r.ringName LIKE ? OR CONVERT(VARCHAR, o.orderDate, 103) LIKE ? OR u.address LIKE ?)";
            }

            sql += " GROUP BY o.orderID, o.orderCode, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, v.percentage, r.warrantyID, o.ringSize, o.status, w.warrantyName"
                    + " ORDER BY o.orderID ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
            }

            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex++, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("orderID");
                int userID = rs.getInt("userID");
                String orderCode = rs.getString("orderCode");
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
                order.setOrderCode(orderCode);
                order.setOrderID(orderID);
                order.setUserID(userID);
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

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalDeliveryOrderCount_A(String keyword) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID "
                    + "WHERE o.purchaseMethod = 'Door-to-door delivery service' AND o.status IN ('shipping', 'verified')";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (o.orderCode like ? or u.userName LIKE ? OR r.ringName LIKE ? OR CONVERT(VARCHAR, o.orderDate, 103) LIKE ? OR u.address LIKE ?)";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
                stmt.setString(3, "%" + keyword + "%");
                stmt.setString(4, "%" + keyword + "%");
                stmt.setString(5, "%" + keyword + "%");
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

    public List<OrderDTO> deliveryHistory(String keyword, int page, int pageSize) {
        List<OrderDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();

            String sql = "SELECT o.orderCode, o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, "
                    + "COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName, 'n/a') AS [voucherName], "
                    + "COALESCE(r.warrantyID, 0) AS [warrantyID], COALESCE(w.warrantyName, 'n/a') AS [warrantyName], "
                    + "o.ringSize, FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * "
                    + "((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0') AS [totalPrice], o.status "
                    + "FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID "
                    + "LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID "
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID "
                    + "GROUP BY o.orderCode, o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, "
                    + "v.voucherID, v.voucherName, v.percentage, r.warrantyID, o.ringSize, o.status, o.purchaseMethod, w.warrantyName "
                    + "HAVING o.status = 'delivered'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (o.orderCode like ? or u.userName LIKE ? OR r.ringName LIKE ? OR o.orderDate LIKE ? OR u.address LIKE ?)";
            }

            sql += " ORDER BY o.orderID ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
            }

            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex++, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String orderCode = rs.getString("orderCode");
                int orderID = rs.getInt("orderID");
                int userID = rs.getInt("userID");
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
                order.setOrderCode(orderCode);
                order.setOrderID(orderID);
                order.setUserID(userID);
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

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalDeliveryOrderCount(String keyword) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID "
                    + "WHERE o.status = 'delivered'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (o.orderCode like ? or u.userName LIKE ? OR r.ringName LIKE ? OR o.orderDate LIKE ? OR u.address LIKE ?)";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
                stmt.setString(3, "%" + keyword + "%");
                stmt.setString(4, "%" + keyword + "%");
                stmt.setString(5, "%" + keyword + "%");
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

    public List<OrderDTO> salesHistory(String keyword, int page, int pageSize) {
        List<OrderDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();

            String sql = "SELECT o.orderCode, o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, "
                    + "COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName, 'n/a') AS [voucherName], "
                    + "COALESCE(r.warrantyID, 0) AS [warrantyID], COALESCE(w.warrantyName, 'n/a') AS [warrantyName], "
                    + "o.ringSize, FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * "
                    + "((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0') AS [totalPrice], o.status "
                    + "FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID "
                    + "LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID "
                    + "LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID "
                    + "GROUP BY o.orderCode, o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, "
                    + "v.voucherID, v.voucherName, v.percentage, r.warrantyID, o.ringSize, o.status, o.purchaseMethod, w.warrantyName "
                    + "HAVING (o.status = 'received at store' OR o.status = 'shipping' OR o.status = 'delivered')";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (o.orderCode like ? or u.userName LIKE ? OR r.ringName LIKE ? OR o.orderDate LIKE ? OR u.address LIKE ?)";
            }

            sql += " ORDER BY o.orderID ASC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement ps = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
                ps.setString(paramIndex++, "%" + keyword + "%");
            }

            ps.setInt(paramIndex++, (page - 1) * pageSize);
            ps.setInt(paramIndex++, pageSize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String orderCode = rs.getString("orderCode");
                int orderID = rs.getInt("orderID");
                int userID = rs.getInt("userID");
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
                order.setOrderCode(orderCode);
                order.setOrderID(orderID);
                order.setUserID(userID);
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

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalOrderCount(String keyword) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM [OrderDetails] o "
                    + "LEFT JOIN [User] u ON o.userID = u.userID "
                    + "LEFT JOIN [Ring] r ON o.ringID = r.ringID "
                    + "LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID "
                    + "LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID "
                    + "WHERE (o.status = 'received at store' OR o.status = 'shipping' OR o.status = 'delivered')";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (o.orderCode like ? or u.userName LIKE ? OR r.ringName LIKE ? OR o.orderDate LIKE ? OR u.address LIKE ?)";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
                stmt.setString(3, "%" + keyword + "%");
                stmt.setString(4, "%" + keyword + "%");
                stmt.setString(5, "%" + keyword + "%");
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

    public OrderDTO load(int orderID) {

        String sql = " select o.orderID, u.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, FORMAT( ((r.price + rp.rpPrice + dp.price)*1.02), 'N0') AS [totalPrice], o.status, o.delivered ";
        sql += " from [OrderDetails] o left join [User] u ON o.userID = u.userID left join [Ring] r ON r.ringID = o.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID";
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

        String sql = "SELECT u.firstName + ' ' + u.lastName as fullName, o.orderID, o.userID, u.userName, u.address, o.orderDate, o.purchaseMethod, r.ringID, r.ringName, r.ringImage, r.warrantyID, w.warrantyName, w.warrantyMonth, CAST(w.warrantyDescription AS VARCHAR(255)) AS [warrantyDescription], w.warrantyType, w.startDate, w.endDate, CAST(w.termsAndConditions AS VARCHAR(255)) AS [termsAndConditions], w.warrantyImage, c.certificateImage, COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName, 'n/a') AS [voucherName], COALESCE(c.certificateID, 0) AS [certificateID], COALESCE(c.description, 'n/a') AS [certificateName], o.ringSize, FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0') AS [totalPrice], o.status FROM [OrderDetails] o LEFT JOIN [User] u ON o.userID = u.userID LEFT JOIN [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID LEFT JOIN [Voucher] v ON o.voucherID = v.voucherID LEFT JOIN [Warranty] w ON r.warrantyID = w.warrantyID LEFT JOIN [Certificate] c ON d.certificateID = c.certificateID WHERE o.orderID = ? AND o.status <> 'pending' GROUP BY o.orderID, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, r.ringImage, r.warrantyID, w.warrantyName, w.warrantyMonth, CAST(w.warrantyDescription AS VARCHAR(255)), w.warrantyType, w.startDate, w.endDate, CAST(w.termsAndConditions AS VARCHAR(255)), w.warrantyImage, c.certificateImage, v.voucherID, v.voucherName, c.certificateID, c.description, o.ringSize, o.status, o.purchaseMethod, u.firstName, u.lastName";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                String fullName = rs.getString("fullName");
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
                int certificateID = rs.getInt("certificateID");
                String certificateName = rs.getString("certificateName");
                String certificateImage = rs.getString("certificateImage");
                int warrantyID = rs.getInt("warrantyID");
                String warrantyName = rs.getString("warrantyName");
                String warrantyImage = rs.getString("warrantyImage");
                String warrantyType = rs.getString("warrantyType");
                int warrantyMonth = rs.getInt("warrantyMonth");
                String warrantyDescription = rs.getString("warrantyDescription");
                String warrantyStartDate = rs.getString("startDate");
                String warrantyEndDate = rs.getString("endDate");
                String warrantyTerms = rs.getString("termsAndConditions");
                int ringSize = rs.getInt("ringSize");
                String totalPrice = rs.getString("totalPrice");
                String status = rs.getString("status");

                OrderDTO order = new OrderDTO();

                order.setFullName(fullName);
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
                order.setWarrantyImage(warrantyImage);
                order.setWarrantyType(warrantyType);
                order.setWarrantyMonth(warrantyMonth);
                order.setWarrantyDescription(warrantyDescription);
                order.setWarrantyStartDate(warrantyStartDate);
                order.setWarrantyEndDate(warrantyEndDate);
                order.setWarrantyTerms(warrantyTerms);
                order.setCertificateID(certificateID);
                order.setCertificateName(certificateName);
                order.setCertificateImage(certificateImage);
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

    public OrderDTO loadBillProcessDetails(int orderID) {

        String sql = "select o.orderID, o.orderCode, o.userID, u.userName, u.address, o.orderDate, o.purchaseMethod, r.ringID, r.ringName, r.ringImage, COALESCE(v.voucherID, 0) AS [voucherID], COALESCE(v.voucherName,'n/a') AS [voucherName], o.ringSize, FORMAT(SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02 * ((100.0 - COALESCE(v.percentage, 0)) / 100)), 'N0' ) AS [totalPrice], o.status from [OrderDetails] o left join [User] u ON o.userID = u.userID left join [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID WHERE o.orderID = ? AND o.status <> 'pending' group by o.orderID, o.orderCode, o.userID, u.userName, u.address, o.orderDate, r.ringID, r.ringName, r.ringImage, v.voucherID, v.voucherName, v.percentage, o.ringSize, o.status, o.purchaseMethod ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                String orderCode = rs.getString("orderCode");
                int ID = rs.getInt("orderID");
                int userID = rs.getInt("userID");
                String userName = rs.getString("userName");
                String orderDate = rs.getString("orderDate");
                int ringID = rs.getInt("ringID");
                String ringName = rs.getString("ringName");
                String ringImage = rs.getString("ringImage");
                int voucherID = rs.getInt("voucherID");
                String voucherName = rs.getString("voucherName");
                int ringSize = rs.getInt("ringSize");
                String totalPrice = rs.getString("totalPrice");
                String status = rs.getString("status");

                OrderDTO order = new OrderDTO();

                order.setOrderCode(orderCode);
                order.setOrderID(ID);
                order.setUserID(userID);
                order.setUserName(userName);
                order.setOrderDate(orderDate);
                order.setRingID(ringID);
                order.setRingName(ringName);
                order.setRingImage(ringImage);
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
        String sql = "INSERT INTO [OrderDetails] (orderID, userID, orderDate, ringID, ringSize, status) VALUES (?, ?, ?, ?, ?, ?)";
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

    public String checkRingActive(int ringID) {

        String sql = "select status from [Ring] where ringID = ? ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ringID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                String status = rs.getString("status");
                return status;

            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer checkRingActiveInCart(int userID) {

        String sql = "select r.ringID from [Ring] r JOIN [OrderDetails] o ON r.ringID = o.ringID where o.userID = ? and r.status = 'outOfStock' and o.status = 'pending'";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ringID = rs.getInt("ringID");
                return ringID;

            }
        } catch (SQLException ex) {
            System.out.println("Query Ring error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer isInCart(int ringID, int userID) {
        try (
                Connection conn = DBUtils.getConnection();) {
            String query = "SELECT orderID FROM [OrderDetails] WHERE ringID = ? AND userID = ?";
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setInt(1, ringID);
                statement.setInt(2, userID);
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    int orderID = rs.getInt("orderID");
                    return orderID;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean update(OrderDTO order) {
        String sql = "UPDATE [OrderDetails] SET ringID = ?, voucherID = ?, ringSize = ?, status = ? WHERE orderID = ? ";
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

    public boolean outOfStockRing(int userID) {
        String sql = "UPDATE [Ring] SET [status] = 'outOfStock' FROM [Ring] r  JOIN [OrderDetails] o  ON o.ringID = r.ringID WHERE o.userID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, userID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Purchase error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean isCodeDuplicate(String orderCode) {
        try (
                Connection conn = DBUtils.getConnection();) {
            String query = "SELECT COUNT(*) FROM [OrderDetails] WHERE orderCode = ?";
            try (PreparedStatement statement = conn.prepareStatement(query)) {
                statement.setString(1, orderCode);
                ResultSet resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean purchase(String orderCode, String paymentMethod, int userID, String purchasedDate) {
        String sql = "UPDATE [OrderDetails] SET orderCode = ?, orderDate = ?, purchaseMethod = ?, status = 'purchased' WHERE userID = ? AND status = 'pending' ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, orderCode);
            ps.setString(2, purchasedDate);
            ps.setString(3, paymentMethod);
            ps.setInt(4, userID);

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
        String sql = "SELECT orderID FROM [OrderDetails] WHERE warrantyID = ? ";
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
        String sql = "UPDATE [OrderDetails] SET voucherID = ? WHERE userID = ? AND status = 'pending' ";
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
        String sql = "UPDATE [OrderDetails] SET voucherID = null WHERE userID = ? AND status = 'pending' ";
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
        String sql = "UPDATE [OrderDetails] SET warrantyID = ? WHERE orderID = ? ";
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
        String sql = "UPDATE [OrderDetails] SET status = 'verified' WHERE orderID = ? ";
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
        String sql = "UPDATE [OrderDetails] SET status = 'received at store' WHERE orderID = ? ";
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

    public boolean updateWarranty(String purchaseDate, int ringID) {
        String sql = "UPDATE [Warranty] SET startDate = ? FROM [Ring] r JOIN [Warranty] w ON r.warrantyID = w.warrantyID WHERE r.ringID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, purchaseDate);
            ps.setInt(2, ringID);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Adding voucher error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean deliveringOrder(int orderID) {
        String sql = "UPDATE [OrderDetails] SET status = 'shipping' WHERE orderID = ? ";
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
        String sql = "UPDATE [OrderDetails] SET status = 'delivered' WHERE orderID = ? ";
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
        String sql = "DELETE [OrderDetails] WHERE orderID = ?";
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

    public List<OrderDTO> listStatisticA() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "SELECT \n"
                    + "    DATENAME(MONTH, CONVERT(date, orderDate, 103)) AS MonthName,\n"
                    + "    DATEPART(YEAR, CONVERT(date, orderDate, 103)) AS Year,\n"
                    + "    purchaseMethod,\n"
                    + "    COUNT(orderID) AS OrderCount\n"
                    + "FROM [OrderDetails]\n"
                    + "WHERE [status] IN ('purchased', 'verified', 'shipping', 'delivered', 'received at store')\n"
                    + "    AND purchaseMethod IN ('Door-to-door delivery service', 'Received at store')\n"
                    + "GROUP BY DATENAME(MONTH, CONVERT(date, orderDate, 103)), DATEPART(YEAR, CONVERT(date, orderDate, 103)), DATEPART(MONTH, CONVERT(date, orderDate, 103)), purchaseMethod\n"
                    + "ORDER BY Year, DATEPART(MONTH, CONVERT(date, orderDate, 103)), purchaseMethod; ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    String monthName = rs.getString("MonthName");
                    int year = rs.getInt("Year");
                    String purchaseMethod = rs.getString("purchaseMethod");
                    int orderCount = rs.getInt("OrderCOunt");

                    OrderDTO order = new OrderDTO();

                    order.setMonthName(monthName);
                    order.setYear(year);
                    order.setPurchaseMethod(purchaseMethod);
                    order.setOrderCount(orderCount);
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

    public List<OrderDTO> listStatisticB() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "SELECT \n"
                    + "    DATENAME(MONTH, CONVERT(date, orderDate, 103)) AS MonthName,\n"
                    + "    DATEPART(MONTH, CONVERT(date, orderDate, 103)) AS MonthNumber,\n"
                    + "    DATEPART(YEAR, CONVERT(date, orderDate, 103)) AS Year,\n"
                    + "    COUNT(orderID) AS OrderCount\n"
                    + "FROM [OrderDetails]\n"
                    + "WHERE \n"
                    + "    [status] IN ('purchased', 'verified', 'shipping', 'delivered', 'received at store')\n"
                    + "    AND purchaseMethod IN ('Door-to-door delivery service', 'Received at store')\n"
                    + "GROUP BY \n"
                    + "    DATENAME(MONTH, CONVERT(date, orderDate, 103)), \n"
                    + "    DATEPART(MONTH, CONVERT(date, orderDate, 103)), \n"
                    + "    DATEPART(YEAR, CONVERT(date, orderDate, 103))\n"
                    + "ORDER BY \n"
                    + "    Year, \n"
                    + "    MonthNumber; ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    String monthName = rs.getString("MonthName");
                    int monthNumber = rs.getInt("MonthNumber");
                    int year = rs.getInt("Year");
                    int orderCount = rs.getInt("OrderCOunt");

                    OrderDTO order = new OrderDTO();

                    order.setMonthName(monthName);
                    order.setYear(year);
                    order.setMonthNumber(monthNumber);
                    order.setOrderCount(orderCount);
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

    public List<OrderDTO> listStatisticC() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "SELECT \n"
                    + "    DATEPART(WEEK, CONVERT(date, orderDate, 103)) AS WeekNumber,\n"
                    + "    DATEPART(YEAR, CONVERT(date, orderDate, 103)) AS Year,\n"
                    + "    COUNT(orderID) AS OrderCount\n"
                    + "FROM [OrderDetails]\n"
                    + "WHERE [status] IN ('purchased', 'verified', 'shipping', 'delivered', 'received at store')\n"
                    + "GROUP BY DATEPART(WEEK, CONVERT(date, orderDate, 103)), DATEPART(YEAR, CONVERT(date, orderDate, 103))\n"
                    + "ORDER BY Year, WeekNumber; ";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int weekNumber = rs.getInt("WeekNumber");
                    int year = rs.getInt("Year");
                    int orderCount = rs.getInt("OrderCount");

                    OrderDTO order = new OrderDTO();

                    order.setWeekNumber(weekNumber);
                    order.setYear(year);
                    order.setOrderCount(orderCount);
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

    public List<OrderDTO> listStatisticD() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "SELECT \n"
                    + "    ISNULL(CASE WHEN od.orderCode IS NULL THEN 'N/A' ELSE od.orderCode END, 'N/A') AS orderCode,\n"
                    + "    ISNULL(CASE WHEN od.orderID IS NULL THEN '0' ELSE CONVERT(varchar(10), od.orderID) END, '0') AS orderID,\n"
                    + "    ISNULL(CASE WHEN od.userID IS NULL THEN '0' ELSE CONVERT(varchar(10), od.userID) END, '0') AS userID,\n"
                    + "    ISNULL(CASE WHEN u.lastName IS NULL THEN 'N/A' ELSE u.lastName END, 'N/A') AS lastName,\n"
                    + "    ISNULL(CASE WHEN u.firstName IS NULL THEN 'N/A' ELSE u.firstName END, 'N/A') AS firstName,\n"
                    + "    ISNULL(CASE WHEN u.lastName IS NULL OR u.firstName IS NULL THEN 'N/A' ELSE u.lastName + ' ' + u.firstName END, 'N/A') AS fullName,\n"
                    + "    ISNULL(CASE WHEN od.orderDate IS NULL THEN 'N/A' ELSE CONVERT(varchar(10), od.orderDate, 103) END, 'N/A') AS OrderDate,\n"
                    + "    ISNULL(CASE WHEN od.ringID IS NULL THEN '0' ELSE CONVERT(varchar(10), od.ringID) END, '0') AS ringID,\n"
                    + "    ISNULL(r.ringName, 'N/A') AS ringName\n"
                    + "FROM (\n"
                    + "    SELECT \n"
                    + "        od.orderCode,\n"
                    + "        od.orderID,\n"
                    + "        od.userID,\n"
                    + "        CONVERT(date, od.orderDate, 103) AS orderDate,\n"
                    + "        od.ringID\n"
                    + "    FROM [OrderDetails] od\n"
                    + "    WHERE od.[status] IN ('delivered', 'received at store')\n"
                    + "        AND DATEDIFF(DAY, CONVERT(date, od.orderDate, 103), GETDATE()) <= 7\n"
                    + "\n"
                    + "    UNION ALL\n"
                    + "\n"
                    + "    SELECT \n"
                    + "        NULL AS orderCode,\n"
                    + "        NULL AS orderID,\n"
                    + "        NULL AS userID,\n"
                    + "        NULL AS orderDate,\n"
                    + "        NULL AS ringID\n"
                    + "    WHERE NOT EXISTS (\n"
                    + "        SELECT 1 FROM [OrderDetails]\n"
                    + "        WHERE [status] IN ('delivered', 'received at store')\n"
                    + "        AND DATEDIFF(DAY, CONVERT(date, orderDate, 103), GETDATE()) <= 7\n"
                    + "    )\n"
                    + ") AS od\n"
                    + "LEFT JOIN [User] u ON od.userID = u.userID\n"
                    + "LEFT JOIN [Ring] r ON od.ringID = r.ringID\n"
                    + "ORDER BY od.orderDate;";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String ringName = rs.getString("ringName");
                    String orderCode = rs.getString("orderCode");
                    String fullName = rs.getString("fullName");
                    int orderID = rs.getInt("orderID");
                    int userID1 = rs.getInt("userID");
                    String orderDate = rs.getString("orderDate");
                    int ringID = rs.getInt("ringID");

                    OrderDTO order = new OrderDTO();
                    order.setRingName(ringName);
                    order.setOrderCode(orderCode);
                    order.setFullName(fullName);
                    order.setOrderID(orderID);
                    order.setUserID(userID1);
                    order.setOrderDate(orderDate);
                    order.setRingID(ringID);

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

    public List<OrderDTO> listStatisticE() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "WITH WeeklyRevenue AS (\n"
                    + "    SELECT \n"
                    + "        DATEPART(YEAR, CONVERT(date, orderDate, 103)) AS Year,\n"
                    + "        DATEPART(WEEK, CONVERT(date, orderDate, 103)) AS WeekNumber,\n"
                    + "        SUM((r.price + rp.rpPrice + dp.price) * 1.02) AS TotalRevenue\n"
                    + "    FROM [OrderDetails] o\n"
                    + "    JOIN [Ring] r ON o.ringID = r.ringID\n"
                    + "    JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID\n"
                    + "    JOIN [Diamond] d ON d.diamondID = r.diamondID\n"
                    + "    JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "    WHERE o.[status] IN ('delivered', 'received at store')\n"
                    + "    GROUP BY DATEPART(YEAR, CONVERT(date, orderDate, 103)), DATEPART(WEEK, CONVERT(date, orderDate, 103))\n"
                    + "),\n"
                    + "CurrentWeekData AS (\n"
                    + "    SELECT \n"
                    + "        DATEPART(YEAR, GETDATE()) AS Year,\n"
                    + "        DATEPART(WEEK, GETDATE()) AS WeekNumber\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    CurrentWeekData.Year AS Year,\n"
                    + "    CurrentWeekData.WeekNumber AS CurrentWeek,\n"
                    + "    FORMAT(ISNULL(CurrentWeek.TotalRevenue, 0), 'N0') AS CurrentWeekRevenue,\n"
                    + "    FORMAT(ISNULL(PreviousWeek.TotalRevenue, 0), 'N0') AS PreviousWeekRevenue,\n"
                    + "    CASE \n"
                    + "        WHEN PreviousWeek.TotalRevenue IS NULL OR PreviousWeek.TotalRevenue = 0 THEN '0.00'\n"
                    + "        ELSE FORMAT(((CAST(ISNULL(CurrentWeek.TotalRevenue, 0) AS decimal(18,2)) - CAST(ISNULL(PreviousWeek.TotalRevenue, 0) AS decimal(18,2))) / CAST(ISNULL(PreviousWeek.TotalRevenue, 0) AS decimal(18,2))) * 100, 'N2')\n"
                    + "    END AS PercentageChange\n"
                    + "FROM CurrentWeekData\n"
                    + "LEFT JOIN WeeklyRevenue AS CurrentWeek\n"
                    + "    ON CurrentWeekData.Year = CurrentWeek.Year\n"
                    + "    AND CurrentWeekData.WeekNumber = CurrentWeek.WeekNumber\n"
                    + "LEFT JOIN WeeklyRevenue AS PreviousWeek\n"
                    + "    ON CurrentWeekData.Year = PreviousWeek.Year\n"
                    + "    AND CurrentWeekData.WeekNumber = PreviousWeek.WeekNumber + 1;";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int currentWeek = rs.getInt("CurrentWeek");
                    int year = rs.getInt("Year");
                    String currentWeekRevenue = rs.getString("CurrentWeekRevenue");
                    String previousWeekRevenue = rs.getString("PreviousWeekRevenue");
                    double percentageChange = rs.getDouble("PercentageChange");

                    OrderDTO order = new OrderDTO();

                    order.setCurrentWeekRevenue(currentWeekRevenue);
                    order.setYear(year);
                    order.setCurrentWeek(currentWeek);
                    order.setPreviousWeekRevenue(previousWeekRevenue);
                    order.setPercentageChange(percentageChange);
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

    public List<OrderDTO> listStatisticF() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "WITH MonthlyRevenue AS (\n"
                    + "    SELECT \n"
                    + "        DATEPART(YEAR, CONVERT(date, orderDate, 103)) AS Year,\n"
                    + "        DATEPART(MONTH, CONVERT(date, orderDate, 103)) AS MonthNumber,\n"
                    + "        DATENAME(MONTH, DATEFROMPARTS(YEAR(GETDATE()), DATEPART(MONTH, CONVERT(date, orderDate, 103)), 1)) AS MonthName,\n"
                    + "        SUM((r.price + rp.rpPrice + dp.price) * 1.02) AS TotalRevenue\n"
                    + "    FROM [OrderDetails] o\n"
                    + "    JOIN [Ring] r ON o.ringID = r.ringID\n"
                    + "    JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID\n"
                    + "    JOIN [Diamond] d ON d.diamondID = r.diamondID\n"
                    + "    JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "    WHERE o.[status] IN ('delivered', 'received at store')\n"
                    + "    GROUP BY DATEPART(YEAR, CONVERT(date, orderDate, 103)), DATEPART(MONTH, CONVERT(date, orderDate, 103))\n"
                    + "),\n"
                    + "CurrentMonthData AS (\n"
                    + "    SELECT \n"
                    + "        DATEPART(YEAR, GETDATE()) AS Year,\n"
                    + "        DATEPART(MONTH, GETDATE()) AS MonthNumber,\n"
                    + "        DATENAME(MONTH, GETDATE()) AS MonthName\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    CurrentMonthData.Year AS Year,\n"
                    + "    CurrentMonthData.MonthNumber AS MonthNumber,\n"
                    + "    CurrentMonthData.MonthName AS MonthName,\n"
                    + "    ISNULL(FORMAT(CurrentMonth.TotalRevenue, 'N0'), '0') AS CurrentMonthRevenue,\n"
                    + "    ISNULL(FORMAT(PreviousMonth.TotalRevenue, 'N0'), '0') AS PreviousMonthRevenue,\n"
                    + "    CASE \n"
                    + "        WHEN PreviousMonth.TotalRevenue IS NULL OR PreviousMonth.TotalRevenue = 0 THEN '0.00'\n"
                    + "        ELSE FORMAT(((CAST(REPLACE(FORMAT(CurrentMonth.TotalRevenue, 'N0'), ',', '') AS decimal(18,2)) - CAST(REPLACE(FORMAT(PreviousMonth.TotalRevenue, 'N0'), ',', '') AS decimal(18,2))) / CAST(REPLACE(FORMAT(PreviousMonth.TotalRevenue, 'N0'), ',', '') AS decimal(18,2))) * 100, 'N2')\n"
                    + "    END AS PercentageChange\n"
                    + "FROM CurrentMonthData\n"
                    + "LEFT JOIN MonthlyRevenue AS CurrentMonth\n"
                    + "    ON CurrentMonthData.Year = CurrentMonth.Year\n"
                    + "    AND CurrentMonthData.MonthNumber = CurrentMonth.MonthNumber\n"
                    + "LEFT JOIN MonthlyRevenue AS PreviousMonth\n"
                    + "    ON CurrentMonthData.Year = PreviousMonth.Year\n"
                    + "    AND CurrentMonthData.MonthNumber = PreviousMonth.MonthNumber + 1;";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int monthNumber = rs.getInt("MonthNumber");
                    int year = rs.getInt("Year");
                    String monthName = rs.getString("MonthName");
                    String currentMonthRevenue = rs.getString("CurrentMonthRevenue");
                    String previousMonthRevenue = rs.getString("PreviousMonthRevenue");
                    double percentageChange = rs.getDouble("PercentageChange");

                    OrderDTO order = new OrderDTO();

                    order.setCurrentMonthRevenue(currentMonthRevenue);
                    order.setYear(year);
                    order.setMonthNumber(monthNumber);
                    order.setPreviousMonthRevenue(previousMonthRevenue);
                    order.setPercentageChange(percentageChange);
                    order.setMonthName(monthName);
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

    public List<OrderDTO> listStatisticG() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "WITH WeeklyRevenue AS (\n"
                    + "    SELECT \n"
                    + "        DATEPART(YEAR, CONVERT(date, orderDate, 103)) AS Year,\n"
                    + "        DATEPART(WEEK, CONVERT(date, orderDate, 103)) AS WeekNumber,\n"
                    + "        SUM((r.price + rp.rpPrice + dp.price) * 1.02) AS TotalRevenue\n"
                    + "    FROM [OrderDetails] o\n"
                    + "    JOIN [Ring] r ON o.ringID = r.ringID\n"
                    + "    JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID\n"
                    + "    JOIN [Diamond] d ON d.diamondID = r.diamondID\n"
                    + "    JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "    WHERE o.[status] IN ('delivered', 'received at store')\n"
                    + "    GROUP BY DATEPART(YEAR, CONVERT(date, orderDate, 103)), DATEPART(WEEK, CONVERT(date, orderDate, 103))\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    Year,\n"
                    + "    WeekNumber,\n"
                    + "    TotalRevenue\n"
                    + "FROM WeeklyRevenue\n"
                    + "ORDER BY Year, WeekNumber;";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int year = rs.getInt("Year");
                    int weekNumber = rs.getInt("weekNumber");
                    BigDecimal totalRevenue = rs.getBigDecimal("TotalRevenue");

                    OrderDTO order = new OrderDTO();

                    order.setWeekNumber(weekNumber);
                    order.setYear(year);
                    order.setTotalRevenue(totalRevenue);
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

    public List<OrderDTO> listStatisticH() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "WITH MonthlyRevenue AS (\n"
                    + "    SELECT \n"
                    + "        DATEPART(YEAR, CONVERT(date, orderDate, 103)) AS Year,\n"
                    + "        DATEPART(MONTH, CONVERT(date, orderDate, 103)) AS MonthNumber,\n"
                    + "        DATENAME(MONTH, DATEFROMPARTS(DATEPART(YEAR, CONVERT(date, orderDate, 103)), DATEPART(MONTH, CONVERT(date, orderDate, 103)), 1)) AS MonthName,\n"
                    + "        SUM((r.price + rp.rpPrice + dp.price) * 1.02) AS TotalRevenue\n"
                    + "    FROM [OrderDetails] o\n"
                    + "    JOIN [Ring] r ON o.ringID = r.ringID\n"
                    + "    JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID\n"
                    + "    JOIN [Diamond] d ON d.diamondID = r.diamondID\n"
                    + "    JOIN [DiamondPrice] dp ON d.dpID = dp.dpID\n"
                    + "    WHERE o.[status] IN ('delivered', 'received at store')\n"
                    + "    GROUP BY DATEPART(YEAR, CONVERT(date, orderDate, 103)), DATEPART(MONTH, CONVERT(date, orderDate, 103))\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    Year,\n"
                    + "    MonthNumber,\n"
                    + "    MonthName,\n"
                    + "    TotalRevenue\n"
                    + "FROM MonthlyRevenue\n"
                    + "ORDER BY Year, MonthNumber;";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int monthNumber = rs.getInt("MonthNumber");
                    int year = rs.getInt("Year");
                    String monthName = rs.getString("MonthName");
                    BigDecimal totalRevenue = rs.getBigDecimal("TotalRevenue");
                    OrderDTO order = new OrderDTO();

                    order.setYear(year);
                    order.setMonthNumber(monthNumber);
                    order.setTotalRevenue(totalRevenue);
                    order.setMonthName(monthName);
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

    public List<OrderDTO> listStatisticI() {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = "SELECT \n"
                    + "    DATENAME(MONTH, CONVERT(date, orderDate, 103)) AS MonthName,\n"
                    + "    DATEPART(MONTH, CONVERT(date, orderDate, 103)) AS MonthNumber,\n"
                    + "    DATEPART(YEAR, CONVERT(date, orderDate, 103)) AS Year,\n"
                    + "    COUNT(CASE WHEN PurchaseMethod = 'Received at store' THEN orderID ELSE NULL END) AS StoreOrderCount,\n"
                    + "    COUNT(CASE WHEN PurchaseMethod = 'Door-to-door delivery service' THEN orderID ELSE NULL END) AS DeliveryOrderCount\n"
                    + "FROM [OrderDetails]\n"
                    + "WHERE [status] IN ('purchased', 'verified', 'shipping', 'delivered', 'received at store')\n"
                    + "GROUP BY \n"
                    + "    DATENAME(MONTH, CONVERT(date, orderDate, 103)), \n"
                    + "    DATEPART(MONTH, CONVERT(date, orderDate, 103)), \n"
                    + "    DATEPART(YEAR, CONVERT(date, orderDate, 103))\n"
                    + "ORDER BY Year, MonthNumber;";

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    String monthName = rs.getString("MonthName");
                    int monthNumber = rs.getInt("MonthNumber");
                    int year = rs.getInt("Year");
                    int storeOrderCount = rs.getInt("StoreOrderCount");
                    int deliveryOrderCount = rs.getInt("DeliveryOrderCount");

                    OrderDTO order = new OrderDTO();

                    order.setMonthName(monthName);
                    order.setYear(year);
                    order.setMonthNumber(monthNumber);
                    order.setStoreOrderCount(storeOrderCount);
                    order.setDeliveryOrderCount(deliveryOrderCount);
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
}
