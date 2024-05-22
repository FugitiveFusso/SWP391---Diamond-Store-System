/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.users;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author phucu
 */
public class UserDAO {

    public UserDTO login(String username, String password, int roleid) {
        UserDTO user = null;
        try {

            Connection con = DBUtils.getConnection();
            String sql = " select userName, firstName, userID from [User] ";
            sql += " WHERE roleID = ? AND password = ? AND userName = ?";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, roleid);
            stmt.setString(2, password);
            stmt.setString(3, username);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                if (rs.next()) {

                    user = new UserDTO();
                    user.setUsername(rs.getString("userName"));
                    user.setFirstname(rs.getString("firstName"));
                    user.setUserid(rs.getInt("userID"));
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return user;
    }
}
