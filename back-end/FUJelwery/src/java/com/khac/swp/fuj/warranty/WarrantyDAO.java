package com.khac.swp.fuj.warranty;

import com.khac.swp.fuj.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WarrantyDAO {

    public List<WarrantyDTO> getAllWarranties(String keyword, String sortCol, int page, int pageSize) {
        List<WarrantyDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT warrantyID, warrantyName, warrantyImage, warrantyMonth, warrantyDescription, warrantyType, startDate, endDate, termsAndConditions "
                    + "FROM Warranty WHERE isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (warrantyName LIKE ? OR warrantyMonth LIKE ? OR startDate LIKE ? OR endDate LIKE ? OR termsAndConditions LIKE ?)";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC";
            } else {
                sql += " ORDER BY warrantyID ASC"; // Default sorting by warrantyID
            }

            sql += " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            PreparedStatement stmt = con.prepareStatement(sql);

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                String likePattern = "%" + keyword + "%";
                stmt.setString(paramIndex++, likePattern);
                stmt.setString(paramIndex++, likePattern);
                stmt.setString(paramIndex++, likePattern);
                stmt.setString(paramIndex++, likePattern);
                stmt.setString(paramIndex++, likePattern);
            }

            stmt.setInt(paramIndex++, (page - 1) * pageSize);
            stmt.setInt(paramIndex, pageSize);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("warrantyID");
                String name = rs.getString("warrantyName");
                String image = rs.getString("warrantyImage");
                int month = rs.getInt("warrantyMonth");
                String description = rs.getString("warrantyDescription");
                String type = rs.getString("warrantyType");
                String startdate = rs.getString("startDate");
                String enddate = rs.getString("endDate");
                String tac = rs.getString("termsAndConditions");

                WarrantyDTO warranty = new WarrantyDTO();
                warranty.setId(id);
                warranty.setName(name);
                warranty.setImage(image);
                warranty.setMonth(month);
                warranty.setDescription(description);
                warranty.setType(type);
                warranty.setStartdate(startdate);
                warranty.setEnddate(enddate);
                warranty.setTermsandconditions(tac);

                list.add(warranty);
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public int getTotalWarranties(String keyword) {
        int total = 0;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT COUNT(*) FROM Warranty WHERE isDeleted = 'active'";

            if (keyword != null && !keyword.isEmpty()) {
                sql += " AND (warrantyName LIKE ? OR warrantyMonth LIKE ? OR startDate LIKE ? OR endDate LIKE ? OR termsAndConditions LIKE ?)";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                String likePattern = "%" + keyword + "%";
                stmt.setString(1, likePattern);
                stmt.setString(2, likePattern);
                stmt.setString(3, likePattern);
                stmt.setString(4, likePattern);
                stmt.setString(5, likePattern);
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

    public WarrantyDTO load(int warrantyID) {

        String sql = "SELECT \n"
                + "    w.warrantyID, \n"
                + "    w.warrantyName, \n"
                + "    w.warrantyImage, \n"
                + "    w.warrantyMonth, \n"
                + "    w.warrantyDescription, \n"
                + "    w.warrantyType, \n"
                + "    w.startDate, \n"
                + "    w.endDate, \n"
                + "    w.termsAndConditions,\n"
                + "    ISNULL(o.orderID, 0) AS orderID,\n"
                + "    CASE \n"
                + "        WHEN o.orderID IS NOT NULL THEN 'Applied'\n"
                + "        ELSE 'Not Applied'\n"
                + "    END AS [status]\n"
                + "FROM \n"
                + "    Warranty w\n"
                + "LEFT JOIN \n"
                + "    [Order] o ON w.warrantyID = o.warrantyID\n"
                + "WHERE \n"
                + "    w.warrantyID = ? \n"
                + "    AND w.isDeleted = 'active';";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, warrantyID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int id = rs.getInt("warrantyID");
                String name = rs.getString("warrantyName");
                String image = rs.getString("warrantyImage");
                int month = rs.getInt("warrantyMonth");
                String description = rs.getString("warrantyDescription");
                String type = rs.getString("warrantyType");
                String startdate = rs.getString("startDate");
                String enddate = rs.getString("endDate");
                String tac = rs.getString("termsAndConditions");
                int orderID = rs.getInt("orderID");
                String status = rs.getString("status");

                WarrantyDTO warranty = new WarrantyDTO();
                warranty.setId(id);
                warranty.setName(name);
                warranty.setImage(image);
                warranty.setMonth(month);
                warranty.setDescription(description);
                warranty.setType(type);
                warranty.setStartdate(startdate);
                warranty.setEnddate(enddate);
                warranty.setTermsandconditions(tac);
                warranty.setOrderID(orderID);
                warranty.setStatus(status);
                return warranty;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(WarrantyDTO warranty) {
        String sql = "INSERT INTO [Warranty] (warrantyName, warrantyImage, warrantyMonth, warrantyDescription, warrantyType, startDate, termsAndConditions, isDeleted) VALUES (?, ?, ?, ?, ?, ?, ?, 'active')";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, warranty.getName());
            ps.setString(2, warranty.getImage());
            ps.setInt(3, warranty.getMonth());
            ps.setString(4, warranty.getDescription());
            ps.setString(5, warranty.getType());
            ps.setString(6, warranty.getStartdate());
            ps.setString(7, warranty.getTermsandconditions());

            ps.executeUpdate();
            conn.close();
            return warranty.getId();
        } catch (SQLException ex) {
            System.out.println("Insert Warranty error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean update(WarrantyDTO warranty) {
        String sql = "UPDATE [Warranty] SET warrantyName = ?, warrantyImage = ?, warrantyMonth = ?, warrantyDescription = ?, warrantyType = ?, startDate = ?, termsAndConditions = ? WHERE warrantyID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(8, warranty.getId());
            ps.setString(1, warranty.getName());
            ps.setString(2, warranty.getImage());
            ps.setInt(3, warranty.getMonth());
            ps.setString(4, warranty.getDescription());
            ps.setString(5, warranty.getType());
            ps.setString(6, warranty.getStartdate());
            ps.setString(7, warranty.getTermsandconditions());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Warranty error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    public boolean delete(int id) {
        String sql = "UPDATE [Warranty] set isDeleted = 'deleted' WHERE warrantyID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete Warranty error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public WarrantyDTO checkWarrantyExistByName(String warrantyName) {

        String sql = "select warrantyName, warrantyImage, warrantyMonth, warrantyDescription, warrantyType, startDate, endDate, termsAndConditions from Warranty where warrantyName like ? and isDeleted = 'active'";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, warrantyName);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                WarrantyDTO warranty = new WarrantyDTO();
                warranty.setName(rs.getString("warrantyName"));
                warranty.setImage(rs.getString("warrantyImage"));
                warranty.setMonth(rs.getInt("warrantyMonth"));
                warranty.setDescription(rs.getString("warrantyDescription"));
                warranty.setType(rs.getString("warrantyType"));
                warranty.setStartdate(rs.getString("startDate"));
                warranty.setEnddate(rs.getString("endDate"));
                warranty.setTermsandconditions(rs.getString("termsAndConditions"));
                return warranty;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public WarrantyDTO loadStatistics() {

        String sql = "WITH ActiveWarrantyStats AS (\n"
                + "    SELECT \n"
                + "        COUNT(*) AS totalWarranties,\n"
                + "        SUM(CASE WHEN usageCount > 0 THEN 1 ELSE 0 END) AS usedActiveWarranties,\n"
                + "        SUM(CASE WHEN usageCount = 0 THEN 1 ELSE 0 END) AS unusedActiveWarranties,\n"
                + "        FORMAT(SUM(CASE WHEN usageCount > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 'N2') AS percentageUsedActive,\n"
                + "        FORMAT(SUM(CASE WHEN usageCount = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 'N2') AS percentageUnusedActive,\n"
                + "        COUNT(CASE WHEN warrantyType = 'Manufacturer Warranty' THEN 1 END) AS manufacturerWarranties,\n"
                + "        COUNT(CASE WHEN warrantyType = 'Extended Warranty' THEN 1 END) AS extendedWarranties,\n"
                + "        COUNT(CASE WHEN warrantyType = 'Limited Warranty' THEN 1 END) AS limitedWarranties,\n"
                + "        COUNT(CASE WHEN warrantyType = 'Lifetime Warranty' THEN 1 END) AS lifetimeWarranties,\n"
                + "        COUNT(CASE WHEN warrantyType = 'Retailer Warranty' THEN 1 END) AS retailerWarranties,\n"
                + "        MIN(startDate) AS earliestStartDate,\n"
                + "        MAX(startDate) AS latestStartDate,\n"
                + "        AVG(warrantyMonth) AS avgWarrantyDurationMonths,\n"
                + "        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS activeWarranties,\n"
                + "        COUNT(CASE WHEN isDeleted = 'deleted' THEN 1 END) AS deletedWarranties,\n"
                + "        MIN(endDate) AS earliestEndDate,\n"
                + "        MAX(endDate) AS latestEndDate,\n"
                + "        STUFF((\n"
                + "            SELECT ', ' + CAST(warrantyID AS VARCHAR(10))\n"
                + "            FROM Warranty\n"
                + "            WHERE isDeleted = 'active'\n"
                + "            AND NOT EXISTS (\n"
                + "                SELECT 1 FROM [Order] WHERE [Order].warrantyID = Warranty.warrantyID\n"
                + "            )\n"
                + "            FOR XML PATH('')\n"
                + "        ), 1, 2, '') AS UnusedActiveWarrantyIds\n"
                + "    FROM (\n"
                + "        SELECT \n"
                + "            w.*, \n"
                + "            COUNT(o.orderID) OVER (PARTITION BY w.warrantyID) AS usageCount \n"
                + "        FROM \n"
                + "            Warranty w\n"
                + "        LEFT JOIN \n"
                + "            [Order] o ON w.warrantyID = o.warrantyID\n"
                + "        WHERE \n"
                + "            w.isDeleted = 'active'\n"
                + "    ) AS ActiveWarrantyUsage\n"
                + ")\n"
                + "\n"
                + "SELECT \n"
                + "    totalWarranties,\n"
                + "    usedActiveWarranties,\n"
                + "    unusedActiveWarranties,\n"
                + "    percentageUsedActive  AS percentageUsedActive,\n"
                + "    percentageUnusedActive AS percentageUnusedActive,\n"
                + "    manufacturerWarranties,\n"
                + "    extendedWarranties,\n"
                + "    limitedWarranties,\n"
                + "    lifetimeWarranties,\n"
                + "    retailerWarranties,\n"
                + "    earliestStartDate,\n"
                + "    latestStartDate,\n"
                + "    avgWarrantyDurationMonths,\n"
                + "    activeWarranties,\n"
                + "    deletedWarranties,\n"
                + "    earliestEndDate,\n"
                + "    latestEndDate,\n"
                + "    FORMAT(manufacturerWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageManufacturerWarranties,\n"
                + "    FORMAT(extendedWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageExtendedWarranties,\n"
                + "    FORMAT(limitedWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageLimitedWarranties,\n"
                + "    FORMAT(lifetimeWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageLifetimeWarranties,\n"
                + "    FORMAT(retailerWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageRetailerWarranties,\n"
                + "    UnusedActiveWarrantyIds\n"
                + "FROM \n"
                + "    ActiveWarrantyStats;";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int totalWarranties = rs.getInt("totalWarranties");
                int usedActiveWarranties = rs.getInt("usedActiveWarranties");
                int unusedActiveWarranties = rs.getInt("unusedActiveWarranties");
                double percentageUsedActive = rs.getDouble("percentageUsedActive");
                double percentageUnusedActive = rs.getDouble("percentageUnusedActive");
                int retailerWarranties = rs.getInt("retailerWarranties");
                int manufacturerWarranties = rs.getInt("manufacturerWarranties");
                int extendedWarranties = rs.getInt("extendedWarranties");
                int limitedWarranties = rs.getInt("limitedWarranties");
                int lifetimeWarranties = rs.getInt("lifetimeWarranties");
                String earliestStartDate = rs.getString("earliestStartDate");
                String latestStartDate = rs.getString("latestStartDate");
                int avgWarrantyDurationMonths = rs.getInt("avgWarrantyDurationMonths");
                int activeWarranties = rs.getInt("activeWarranties");
                int deletedWarranties = rs.getInt("deletedWarranties");
                String earliestEndDate = rs.getString("earliestEndDate");
                String latestEndDate = rs.getString("latestEndDate");
                String unusedActiveWarrantyIds = rs.getString("UnusedActiveWarrantyIds");
                String percentageManufacturerWarranties = rs.getString("percentageManufacturerWarranties");
                String percentageExtendedWarranties = rs.getString("percentageExtendedWarranties");
                String percentageLimitedWarranties = rs.getString("percentageLimitedWarranties");
                String percentageLifetimeWarranties = rs.getString("percentageLifetimeWarranties");
                String percentageRetailerWarranties = rs.getString("percentageRetailerWarranties");

                WarrantyDTO warranty = new WarrantyDTO();
                warranty.setTotalWarranties(totalWarranties);
                warranty.setUsedActiveWarranties(usedActiveWarranties);
                warranty.setUnusedActiveWarranties(unusedActiveWarranties);
                warranty.setPercentageUsedActive(percentageUsedActive);
                warranty.setPercentageUnusedActive(percentageUnusedActive);
                warranty.setManufacturerWarranties(manufacturerWarranties);
                warranty.setExtendedWarranties(extendedWarranties);
                warranty.setLimitedWarranties(limitedWarranties);
                warranty.setLifetimeWarranties(lifetimeWarranties);
                warranty.setRetailerWarranties(retailerWarranties);
                warranty.setEarliestStartDate(earliestStartDate);
                warranty.setLatestStartDate(latestStartDate);
                warranty.setEarliestEndDate(earliestEndDate);
                warranty.setLatestEndDate(latestEndDate);
                warranty.setAvgWarrantyDurationMonths(avgWarrantyDurationMonths);
                warranty.setActiveWarranties(activeWarranties);
                warranty.setDeletedWarranties(deletedWarranties);
                warranty.setUnusedActiveWarrantyIds(unusedActiveWarrantyIds);
                warranty.setPercentageManufacturerWarranties(percentageManufacturerWarranties);
                warranty.setPercentageExtendedWarranties(percentageExtendedWarranties);
                warranty.setPercentageLimitedWarranties(percentageLimitedWarranties);
                warranty.setPercentageLifetimeWarranties(percentageLifetimeWarranties);
                warranty.setPercentageRetailerWarranties(percentageRetailerWarranties);

                return warranty;
            }
        } catch (SQLException ex) {
            System.out.println("Query User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

}
