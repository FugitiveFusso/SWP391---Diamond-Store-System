package com.khac.swp.fuj.certificate;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CertificateDAO {

    Connection conn = DBUtils.getConnection();
    ResultSet rs = null;

    public List<CertificateDTO> list(String keyword, String sortCol) {
        List<CertificateDTO> list = new ArrayList<CertificateDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM [Certificate] ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE description like ?";
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

                    int certificateID = rs.getInt("certificateID");
                    String certificateImage = rs.getString("certificateImage");
                    String certificateDescription = rs.getString("description");

                    CertificateDTO certificate = new CertificateDTO();
                    certificate.setCertificateID(certificateID);
                    certificate.setCertificateImage(certificateImage);
                    certificate.setCertificateDescription(certificateDescription);
                    list.add(certificate);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public CertificateDTO load(int certificateID) {

        String sql = "select * from Certificate where certificateID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, certificateID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int ID = rs.getInt("certificateID");
                String certificateImage = rs.getString("certificateImage");
                String certificateDescription = rs.getString("description");

                CertificateDTO certificate = new CertificateDTO();
                certificate.setCertificateID(ID);
                certificate.setCertificateImage(certificateImage);
                certificate.setCertificateDescription(certificateDescription);
                return certificate;
            }
        } catch (SQLException ex) {
            System.out.println("Query Certificate error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(CertificateDTO certificate) {
        String sql = "INSERT INTO [Certificate] (certificateID, certificateImage, description) VALUES (?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, certificate.getCertificateID());
            ps.setString(3, certificate.getCertificateImage());
            ps.setString(4, certificate.getCertificateDescription());

            ps.executeUpdate();
            conn.close();
            return certificate.getCertificateID();
        } catch (SQLException ex) {
            System.out.println("Insert Certificate error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(CertificateDTO certificate) {
        String sql = "UPDATE [Certificate] SET certificateImage = ?, description = ? WHERE certificateID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, certificate.getCertificateImage());
            ps.setString(2, certificate.getCertificateDescription());
            ps.setInt(3, certificate.getCertificateID());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Certificate error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    /*
    Delete student 
     */
    public boolean delete(int id) {
        String sql = "DELETE [Certificate] WHERE certificateID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Certficate error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
}
