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
    public List<OrderDTO> list(String keyword, String sortCol) {
        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " select o.orderID, u.userID, u.userName, o.orderDate, r.ringID, r.ringName, v.voucherID, v.voucherName, o.ringSize, ((r.price + rp.rpPrice + dp.price)*1.02) AS [totalPrice], o.status, o.delivery ";
                   sql += " from [Order] o left join [User] u left join [Ring] r LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID  left join [Voucher] v ";
                   sql += " WHERE o.orderID = ?";
                   
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
                    boolean delivered = rs.getBoolean("delivered");
                    
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

    
    public Integer insert(OrderDTO order) {
        String sql = "INSERT INTO [Order] (orderID, userID, orderDate, ringID, voucherID, ringSize, status, delivery) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
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
            ps.setBoolean(8, order.isDelivered());

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

            ps.setInt(1, order.getOrderID());
            ps.setInt(2, order.getUserID());
            ps.setString(3, order.getOrderDate());
            ps.setInt(4, order.getRingID());
            ps.setInt(5, order.getVoucherID());
            ps.setString(6, order.getStatus());
            ps.setBoolean(7, order.isDelivered());

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
}
