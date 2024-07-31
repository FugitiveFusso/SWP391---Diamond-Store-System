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

    public List<CertificateDTO> listCertificates(String keyword, String sortCol, int page, int pageSize) {
        List<CertificateDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT c.certificateID, c.certificateImage, c.description "
                    + "FROM [Certificate] c WHERE c. isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND description LIKE ?";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC";
            } else {
                sql += " ORDER BY certificateID ASC"; // Default sorting by certificateID
            }

            sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement stmt = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(paramIndex++, "%" + keyword + "%");
            }

            stmt.setInt(paramIndex++, (page - 1) * pageSize);
            stmt.setInt(paramIndex, pageSize);

            ResultSet rs = stmt.executeQuery();
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

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalCertificates(String keyword) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM [Certificate] WHERE isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND description LIKE ?";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
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

    public CertificateDTO load(int certificateID) {

        String sql = "SELECT \n"
                + "    c.certificateID, d.diamondName, \n"
                + "    c.certificateImage, \n"
                + "    c.description, \n"
                + "    ISNULL(d.diamondID, 0) AS diamondID, \n"
                + "    CASE \n"
                + "        WHEN c.isDeleted = 'deleted' THEN 'Deleted' \n"
                + "        WHEN d.diamondID IS NOT NULL THEN 'Applied' \n"
                + "        ELSE 'Not Applied' \n"
                + "    END AS [status] \n"
                + "FROM \n"
                + "    Certificate c \n"
                + "LEFT JOIN \n"
                + "    Diamond d ON c.certificateID = d.certificateID \n"
                + "WHERE \n"
                + "    c.certificateID = ? \n";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, certificateID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String diamondName = rs.getString("diamondName");
                int ID = rs.getInt("certificateID");
                String certificateImage = rs.getString("certificateImage");
                String certificateDescription = rs.getString("description");
                int diamondID = rs.getInt("diamondID");
                String status = rs.getString("status");

                CertificateDTO certificate = new CertificateDTO();
                certificate.setDiamondName(diamondName);
                certificate.setCertificateID(ID);
                certificate.setCertificateImage(certificateImage);
                certificate.setCertificateDescription(certificateDescription);
                certificate.setDiamondID(diamondID);
                certificate.setStatus(status);
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
