/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.order;

import com.khac.swp.fuj.order.OrderDTO;
import com.khac.swp.fuj.utils.DBUtils;
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
            String sql = " select o.orderID, o.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, ((r.price + rp.rpPrice + dp.price)*1.02) AS [totalPrice], o.status, o.delivered from [Order] o left join [User] u ON o.userID = u.userID left join [Ring] r ON o.ringID = r.ringID LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ON o.voucherID = v.voucherID WHERE o.userID = ?";

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
                    double totalPrice = rs.getDouble("totalPrice");
                    String status = rs.getString("status");
                    String delivered = rs.getString("delivered");
                    
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
                    order.setDelivered(delivered);
                    
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
    
    public List<OrderDTO> listToCart(String keyword, String sortCol) {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " select o.orderID, u.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, (((r.price + rp.rpPrice + dp.price)*1.02)*((100-v.percentage)/100)) AS [totalPrice], o.status, o.delivery ";
                   sql += " from [Order] o left join [User] u left join [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ";
                   sql += " WHERE o.orderID = ? AND o.status = 'pending' ";
                   
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE ringName = ?";
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
                    int orderID = rs.getInt("orderID");
                    int userID = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String orderDate = rs.getString("orderDate");
                    int ringID = rs.getInt("ringID");
                    String ringName = rs.getString("ringName");
                    int voucherID = rs.getInt("voucherID");
                    String voucherName = rs.getString("voucherName");
                    int ringSize = rs.getInt("ringSize");
                    double totalPrice = rs.getDouble("totalPrice");
                    String status = rs.getString("status");
                    String delivered = rs.getString("delivered");
                    
                    OrderDTO order = new OrderDTO();
                    
                    order.setOrderID(orderID);
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
                    order.setDelivered(delivered);
                    
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

        String sql = " select o.orderID, u.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, ((r.price + rp.rpPrice + dp.price)*1.02) AS [totalPrice], o.status, o.delivery ";
                   sql += " from [Order] o left join [User] u left join [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ";
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
                    double totalPrice = rs.getDouble("totalPrice");
                    String status = rs.getString("status");
                    String delivered = rs.getString("delivered");
                    
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
                    order.setDelivered(delivered);
                    return order;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
    
    public Integer insert(OrderDTO order) {
        String sql = "INSERT INTO [Order] (orderID, userID, orderDate, ringID, voucherID, ringSize, status, delivered) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, order.getOrderID());
            ps.setInt(2, order.getUserID());
            ps.setString(3, order.getOrderDate());
            ps.setInt(4, order.getRingID());
            ps.setInt(5, order.getVoucherID());
            ps.setInt(6,order.getRingSize());
            ps.setString(7, order.getStatus());
            ps.setString(8, order.getDelivered());

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
        String sql = "UPDATE [Order] SET ringID = ?, voucherID = ?, ringSize = ?, status = ?, delivery = ? WHERE orderID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, order.getRingID());
            ps.setInt(2, order.getVoucherID());
            ps.setInt(3, order.getRingSize());
            ps.setInt(4, order.getVoucherID());
            ps.setString(5, order.getStatus());
            ps.setString(6, order.getDelivered());
            ps.setInt(7, order.getOrderID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Order error!" + ex.getMessage());
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
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<OrderDTO> list = dao.list(0);
        for (OrderDTO orderDTO : list) {
            System.out.println(orderDTO);
        }
    }
}
