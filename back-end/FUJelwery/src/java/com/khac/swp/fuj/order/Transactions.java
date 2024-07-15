/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.order;

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
public class Transactions {
    
    public boolean updateOrder(String paymentMethod,String purchasedDate, int userID) {
        String sql = "UPDATE [Order] SET orderDate = ?, purchaseMethod = ? WHERE userID = ? AND status = 'pending' ";
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
    
    public boolean purchaseOrder(int userID) {
        String sql = "UPDATE [Order] SET status = 'purchased' WHERE userID = ? AND status = 'pending' ";
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
    
    public Integer insert(int transactionID, int userID, String totalPrice, String purchaseDate) {
        String sql = "INSERT INTO [Transactions] (transactionID, userID, paymentDate, totalPrice) VALUES (?,?,?,?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, transactionID);
            ps.setInt(2, userID);
            ps.setString(3, purchaseDate);
            ps.setString(4, totalPrice);

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Insert Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
    
    public List<TransactionDTO> listTransaction(){
        List<TransactionDTO> list = new ArrayList<TransactionDTO>();
       String sql = "SELECT t.transactionID, t.userID, u.userName, t.paymentDate, t.totalPrice FROM [Transactions] t LEFT JOIN [User] u ON t.userID = u.userID ";
       try{
           Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if (rs != null) {
                while (rs.next()) {
                    int transactionID = rs.getInt("transactionID");
                    int userID1 = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String paymentDate = rs.getString("paymentDate");
                    String totalPrice = rs.getString("totalPrice");
                    
                    TransactionDTO dto = new TransactionDTO();
                    dto.setTransactionID(transactionID);
                    dto.setUserID(userID1);
                    dto.setUserName(userName);
                    dto.setPaymentDate(paymentDate);
                    dto.setTotalPrice(totalPrice);
                    
                    list.add(dto);
                }
            }
            
       } catch (SQLException ex) {
            System.out.println("Insert Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
       return list;
    }
    
    public TransactionDTO loadTransaction(int transactionID){
        
        String sql = "SELECT t.transactionID, t.userID, u.userName, t.paymentDate, t.totalPrice FROM [Transactions] t LEFT JOIN [User] u ON t.userID = u.userID WHERE t.transactionID = ? ";
        try{
           Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, transactionID);
            ResultSet rs = ps.executeQuery();
            
            if (rs != null) {
                while (rs.next()) {
                    int transactionID1 = rs.getInt("transactionID");
                    int userID1 = rs.getInt("userID");
                    String userName = rs.getString("userName");
                    String paymentDate = rs.getString("paymentDate");
                    String totalPrice = rs.getString("totalPrice");
                    
                    TransactionDTO dto = new TransactionDTO();
                    
                    dto.setTransactionID(transactionID1);
                    dto.setUserID(userID1);
                    dto.setUserName(userName);
                    dto.setPaymentDate(paymentDate);
                    dto.setTotalPrice(totalPrice);
                    
                    return dto;
                }
            }
            
       } catch (SQLException ex) {
            System.out.println("Insert Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
}
