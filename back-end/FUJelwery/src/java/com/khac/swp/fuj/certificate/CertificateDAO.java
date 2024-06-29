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
            String sql = "SELECT * FROM [Certificate] where isDeleted = 'active' ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " and description like ?";
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

        String sql = "select * from Certificate where certificateID = ? and isDeleted = 'active'";

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
        String sql = "INSERT INTO [Certificate] (certificateImage, description, isDeleted) VALUES (?, ?, 'active' )";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, certificate.getCertificateImage());
            ps.setString(2, certificate.getCertificateDescription());

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

    public boolean delete(int id) {
        String sql = "UPDATE [Certificate] set isDeleted = 'deleted' WHERE certificateID = ? ";
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

    public CertificateDTO checkCertificateExistByDescription(String description) {

        String sql = "select certificateID, certificateImage, [description] from [Certificate] where [description] like ? and isDeleted = 'active' ";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, description);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                CertificateDTO certificate = new CertificateDTO();
                certificate.setCertificateID(rs.getInt("certificateID"));
                certificate.setCertificateImage(rs.getString("certificateImage"));
                certificate.setCertificateDescription(rs.getString("description"));
                return certificate;
            }
        } catch (SQLException ex) {
            System.out.println("Query Certificate error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public List<CertificateDTO> listStatistics() {
        List<CertificateDTO> list = new ArrayList<CertificateDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "WITH CertificateStats AS (\n"
                    + "SELECT COUNT(c.certificateID) AS totalCertificates, \n"
                    + "SUM(CASE WHEN c.isDeleted = 'active' THEN 1 ELSE 0 END) AS activeCertificates,\n"
                    + "SUM(CASE WHEN c.isDeleted = 'deleted' THEN 1 ELSE 0 END) AS deletedCertificates,\n"
                    + "COUNT(DISTINCT CASE WHEN d.certificateID IS NOT NULL THEN c.certificateID END) AS usedCertificates,\n"
                    + "COUNT(DISTINCT CASE WHEN d.certificateID IS NULL THEN c.certificateID END) AS unusedCertificates\n"
                    + "FROM Certificate c LEFT JOIN Diamond d ON c.certificateID = d.certificateID),\n"
                    + "UnusedCertificates AS (\n"
                    + "SELECT c.certificateID, c.description FROM Certificate c LEFT JOIN Diamond d ON c.certificateID = d.certificateID\n"
                    + "WHERE d.certificateID IS NULL and c.isDeleted = 'active')\n"
                    + "SELECT s.totalCertificates, s.activeCertificates, s.deletedCertificates, s.usedCertificates, s.unusedCertificates,\n"
                    + "ROUND((CAST(s.usedCertificates AS FLOAT) / s.totalCertificates) * 100, 2) AS usedPercentage,\n"
                    + "ROUND((CAST(s.unusedCertificates AS FLOAT) / s.totalCertificates) * 100, 2) AS unusedPercentage, u.certificateID, u.description\n"
                    + "FROM CertificateStats s LEFT JOIN UnusedCertificates u ON 1=1;\n"
                    + "";

            PreparedStatement stmt = con.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int certificateID = rs.getInt("certificateID");
                    int totalCertificates = rs.getInt("totalCertificates");
                    int activeCertificates = rs.getInt("activeCertificates");
                    int deletedCertificates = rs.getInt("deletedCertificates");
                    int usedCertificates = rs.getInt("usedCertificates");
                    int unusedCertificates = rs.getInt("unusedCertificates");
                    double usedPercentage = rs.getDouble("usedPercentage");
                    double unusedPercentage = rs.getDouble("unusedPercentage");
                    String certificateDescription = rs.getString("description");

                    CertificateDTO certificate = new CertificateDTO();
                    certificate.setCertificateID(certificateID);
                    certificate.setTotalCertificates(totalCertificates);
                    certificate.setActiveCertificates(activeCertificates);
                    certificate.setDeletedCertificates(deletedCertificates);
                    certificate.setUsedCertificates(usedCertificates);
                    certificate.setUnusedCertificates(unusedCertificates);
                    certificate.setUsedPercentage(usedPercentage);
                    certificate.setUnusedPercentage(unusedPercentage);
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
}
