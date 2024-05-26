/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.posts;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phucu
 */
public class PostDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<PostDTO> getAllPost(){
        List<PostDTO> list = new ArrayList<>();
        String query = " select * from Post";
        try {
            conn = new DBUtils().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()){
                list.add(new PostDTO(rs.getInt(1), 
                                     rs.getString(2), 
                                     rs.getString(3), 
                                     rs.getString(4)));
            }
        } catch (Exception e) {
        }
        
        return list;
    } 
    
    public static void main(String[] args) {
        PostDAO dao = new PostDAO();
        List<PostDTO> list = dao.getAllPost();
        for (PostDTO o : list) {
            System.out.println(o);
        }
    }
    
}
