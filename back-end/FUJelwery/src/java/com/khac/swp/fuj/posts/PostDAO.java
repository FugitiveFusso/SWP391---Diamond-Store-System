/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.posts;

import com.khac.swp.fuj.users.UserDTO;
import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phucu
 */
public class PostDAO {

    public List<PostDTO> getAllPost(String keyword, String sortCol) {
        List<PostDTO> list = new ArrayList<PostDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select postID, postName, postImage, description from Post ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " where postName like ? ";
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

                    int postid = rs.getInt("postID");
                    String postname = rs.getString("postName");
                    String postimage = rs.getString("postImage");
                    String description = rs.getString("description");

                    PostDTO post = new PostDTO();
                    post.setId(postid);
                    post.setName(postname);
                    post.setImage(postimage);
                    post.setDescription(description);

                    list.add(post);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public PostDTO load(int postID) {

        String sql = "select postID, postName, postImage, description from Post where postID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, postID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int postid = rs.getInt("postID");
                String postname = rs.getString("postName");
                String postimage = rs.getString("postImage");
                String description = rs.getString("description");

                PostDTO post = new PostDTO();
                post.setId(postid);
                post.setName(postname);
                post.setImage(postimage);
                post.setDescription(description);
                return post;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }


}
