package com.khac.swp.fuj.posts;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {

    public List<PostDTO> getAllPost(String keyword, String sortCol) {
        List<PostDTO> list = new ArrayList<PostDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select postID, postName, postDate, author, postImage, description, postText from Post where isDeleted = 'active' ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " and (postName like ? or author like ?)";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC ";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");

            }
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int postid = rs.getInt("postID");
                    String postname = rs.getString("postName");
                    String postimage = rs.getString("postImage");
                    String postdate = rs.getString("postDate");
                    String author = rs.getString("author");
                    String description = rs.getString("description");
                    String posttext = rs.getString("postText");

                    PostDTO post = new PostDTO();
                    post.setId(postid);
                    post.setName(postname);
                    post.setImage(postimage);
                    post.setDate(postdate);
                    post.setAuthor(author);
                    post.setDescription(description);
                    post.setText(posttext);

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

        String sql = "select postID, postName, postImage, postDate, author, description, postText from Post where postID = ? and isDeleted = 'active'";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, postID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int postid = rs.getInt("postID");
                String postname = rs.getString("postName");
                String postimage = rs.getString("postImage");
                String postdate = rs.getString("postDate");
                String author = rs.getString("author");
                String description = rs.getString("description");
                String posttext = rs.getString("postText");

                PostDTO post = new PostDTO();
                post.setId(postid);
                post.setName(postname);
                post.setImage(postimage);
                post.setDate(postdate);
                post.setAuthor(author);
                post.setDescription(description);
                post.setText(posttext);
                return post;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(PostDTO post) {
        String sql = "INSERT INTO [Post] (postName, postImage, postDate, author, description, postText, isDeleted) VALUES (?, ?, ?, ?, ?, ?, 'active')";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, post.getName());
            ps.setString(2, post.getImage());
            ps.setString(3, post.getDate());
            ps.setString(4, post.getAuthor());
            ps.setString(5, post.getDescription());
            ps.setString(6, post.getText());
            ps.executeUpdate();
            conn.close();
            return post.getId();
        } catch (SQLException ex) {
            System.out.println("Insert Post error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(PostDTO post) {
        String sql = "UPDATE [Post] SET postName = ?, postImage = ?, postDate = ?, author = ?, description = ?, postText = ? WHERE postID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(7, post.getId());
            ps.setString(1, post.getName());
            ps.setString(2, post.getImage());
            ps.setString(3, post.getDate());
            ps.setString(4, post.getAuthor());
            ps.setString(5, post.getDescription());
            ps.setString(6, post.getText());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Post error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "UPDATE [Post] set isDeleted = 'delete' WHERE postID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Post error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public PostDTO checkPostExistByName(String postName) {

        String sql = "select postName from Post where postName like ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, postName);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                PostDTO post = new PostDTO();
                post.setName(rs.getString("postName"));
                return post;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public PostDTO loadStatistics() {
        String sql = "SELECT COUNT(*) AS TotalNumberOfActivePosts, COUNT(DISTINCT Author) AS TotalNumberOfAuthors, COUNT(DISTINCT PostDate) AS TotalNumberOfPostDays,\n"
                + "MIN(PostDate) AS EarliestPostDate, MAX(PostDate) AS LatestPostDate\n"
                + "FROM Post WHERE isDeleted = 'active';";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int totalNumberOfActivePosts = rs.getInt("totalNumberOfActivePosts");
                int totalNumberOfAuthors = rs.getInt("totalNumberOfAuthors");
                int totalNumberOfPostDays = rs.getInt("totalNumberOfPostDays");
                String earliestPostDate = rs.getString("earliestPostDate");
                String latestPostDate = rs.getString("latestPostDate");

                PostDTO post = new PostDTO();
                post.setTotalNumberOfActivePosts(totalNumberOfActivePosts);
                post.setTotalNumberOfAuthors(totalNumberOfAuthors);
                post.setTotalNumberOfPostDays(totalNumberOfPostDays);
                post.setEarliestPostDate(earliestPostDate);
                post.setLatestPostDate(latestPostDate);
                return post;
            }
        } catch (SQLException ex) {
            System.out.println("Query Statistics error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

}
