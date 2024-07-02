-- Users
SELECT r.roleName,
       COUNT(u.userID) AS TotalUsers,
       SUM(CASE WHEN u.[status] = 'active' THEN 1 ELSE 0 END) AS ActiveUserCount,
       SUM(CASE WHEN u.[status] = 'banned' THEN 1 ELSE 0 END) AS BannedUserCount
FROM [Role] r
LEFT JOIN [User] u ON r.roleID = u.roleID
GROUP BY r.roleName, u.isDeleted
HAVING u.isDeleted = 'active'
ORDER BY r.roleName;
-- listStaffs
SELECT u.firstName + ' ' + u.lastName as fullName, r.roleName
FROM [User] u
JOIN [Role] r ON u.roleID = r.roleID
WHERE r.roleName != 'Customer' and u.isDeleted = 'active';

-- Categories
SELECT categoryID, TotalCategories, ActiveCategories, DeletedCategories, Top3CategoryNames, Top3CategoryRingCounts FROM
            (SELECT c.categoryID,
            (SELECT COUNT(*) FROM [Category]) AS TotalCategories,
            (SELECT SUM(CASE WHEN isDeleted = 'active' THEN 1 ELSE 0 END) FROM [Category]) AS ActiveCategories,
            (SELECT SUM(CASE WHEN isDeleted = 'deleted' THEN 1 ELSE 0 END) FROM [Category]) AS DeletedCategories,
            STRING_AGG(c.categoryName, ', ') AS Top3CategoryNames,
            STRING_AGG(CAST(CategoryRingCounts.NumberOfRings AS VARCHAR), ', ') AS Top3CategoryRingCounts
        FROM [Category] c LEFT JOIN (
            SELECT r.categoryID, COUNT(*) AS NumberOfRings FROM [Ring] r
            GROUP BY r.categoryID) AS CategoryRingCounts ON c.categoryID = CategoryRingCounts.categoryID
        WHERE c.categoryName IN (SELECT TOP 3 categoryName FROM [Category] c JOIN [Ring] r ON c.categoryID = r.categoryID
        GROUP BY categoryName, c.categoryID ORDER BY COUNT(*) DESC)
        GROUP BY CategoryRingCounts.categoryID, c.categoryID) AS CombinedResults;

-- Collections
WITH CollectionSummary AS (
SELECT c.collectionID, c.collectionName, COUNT(r.ringID) AS NumberOfRings, SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) AS TotalCollectionPrice
FROM [Collection] c LEFT JOIN [Ring] r ON c.collectionID = r.collectionID AND r.isDeleted = 'active'
LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID
WHERE c.isDeleted = 'active' GROUP BY c.collectionID, c.collectionName)

SELECT cs.collectionID, (SELECT COUNT(*) FROM [Collection] WHERE isDeleted = 'active') AS NumberOfCollections, cs.collectionName, cs.NumberOfRings, FORMAT(cs.TotalCollectionPrice, 'N0') AS TotalCollectionPrice
FROM CollectionSummary cs WHERE cs.NumberOfRings > 0 -- Select collections with more than 0 rings
ORDER BY cs.TotalCollectionPrice DESC;

-- Vouchers
WITH VoucherUsage AS (
   SELECT v.voucherName, v.createdDate, COUNT(o.orderID) AS totalOrdersUsingVoucher
   FROM [Voucher] v LEFT JOIN [Order] o ON v.voucherID = o.voucherID WHERE v.isDeleted = 'active'
   GROUP BY v.voucherName, v.createdDate
)
SELECT vu.voucherName, vu.createdDate, vu.totalOrdersUsingVoucher, av.activeVouchersCount
FROM VoucherUsage vu CROSS JOIN (SELECT COUNT(*) AS activeVouchersCount FROM [Voucher] WHERE isDeleted = 'active') av
ORDER BY vu.totalOrdersUsingVoucher DESC, createdDate ASC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

-- Posts
SELECT COUNT(*) AS TotalNumberOfActivePosts, COUNT(DISTINCT Author) AS TotalNumberOfAuthors, COUNT(DISTINCT PostDate) AS TotalNumberOfPostDays,
MIN(PostDate) AS EarliestPostDate, MAX(PostDate) AS LatestPostDate
FROM Post WHERE isDeleted = 'active';

-- Certificates
WITH CertificateStats AS (
SELECT COUNT(c.certificateID) AS totalCertificates, 
SUM(CASE WHEN c.isDeleted = 'active' THEN 1 ELSE 0 END) AS activeCertificates,
SUM(CASE WHEN c.isDeleted = 'deleted' THEN 1 ELSE 0 END) AS deletedCertificates,
COUNT(DISTINCT CASE WHEN d.certificateID IS NOT NULL THEN c.certificateID END) AS usedCertificates,
COUNT(DISTINCT CASE WHEN d.certificateID IS NULL THEN c.certificateID END) AS unusedCertificates
FROM Certificate c LEFT JOIN Diamond d ON c.certificateID = d.certificateID),
UnusedCertificates AS (
SELECT c.certificateID, c.description FROM Certificate c LEFT JOIN Diamond d ON c.certificateID = d.certificateID
WHERE d.certificateID IS NULL and c.isDeleted = 'active')
SELECT s.totalCertificates, s.activeCertificates, s.deletedCertificates, s.usedCertificates, s.unusedCertificates,
ROUND((CAST(s.usedCertificates AS FLOAT) / s.totalCertificates) * 100, 2) AS usedPercentage,
ROUND((CAST(s.unusedCertificates AS FLOAT) / s.totalCertificates) * 100, 2) AS unusedPercentage, u.certificateID, u.description
FROM CertificateStats s LEFT JOIN UnusedCertificates u ON 1=1;

-- DiamondPrices
WITH DiamondStats AS (
SELECT COUNT(dp.dpID) AS totalDiamondsPrice, AVG(dp.price) AS averagePrice, MAX(dp.price) AS highestPrice, MIN(dp.price) AS lowestPrice,
SUM(CASE WHEN dp.isDeleted = 'active' THEN 1 ELSE 0 END) AS activeDiamondsPrice,
SUM(CASE WHEN dp.isDeleted = 'deleted' THEN 1 ELSE 0 END) AS deletedDiamondsPrice,
STUFF(( SELECT DISTINCT ', ' + CAST(dp_inner.diamondSize AS VARCHAR) FROM DiamondPrice dp_inner WHERE dp_inner.isDeleted = 'active'FOR XML PATH('')), 1, 2, '') AS allDiamondSizes,
STUFF((SELECT DISTINCT ', ' + CAST(dp_inner.caratWeight AS VARCHAR) FROM DiamondPrice dp_inner WHERE dp_inner.isDeleted = 'active' FOR XML PATH('')), 1, 2, '') AS allCaratWeights,
STUFF((SELECT DISTINCT ', ' + dp_inner.color FROM DiamondPrice dp_inner WHERE dp_inner.isDeleted = 'active' FOR XML PATH('')), 1, 2, '') AS allColors,
STUFF((SELECT DISTINCT ', ' + dp_inner.clarity FROM DiamondPrice dp_inner WHERE dp_inner.isDeleted = 'active' FOR XML PATH('')), 1, 2, '') AS allClarities
FROM DiamondPrice dp WHERE dp.isDeleted = 'active'
)
SELECT totalDiamondsPrice, FORMAT(averagePrice, 'N0') AS averagePrice, FORMAT(highestPrice, 'N0') AS highestPrice, FORMAT(lowestPrice, 'N0') AS lowestPrice, 
activeDiamondsPrice, deletedDiamondsPrice, allDiamondSizes, allCaratWeights, allColors, allClarities FROM DiamondStats;

-- Diamonds
WITH OriginCounts AS (
    SELECT origin, COUNT(*) AS originCount 
    FROM Diamond 
    GROUP BY origin
),
TopOrigins AS (
    SELECT origin, originCount 
    FROM (
        SELECT origin, originCount, ROW_NUMBER() OVER (ORDER BY originCount DESC) AS rowNum 
        FROM OriginCounts
    ) ranked 
    WHERE rowNum <= 5
),
DiamondUsage AS (
    SELECT d.diamondID, d.diamondName, 
           CASE WHEN r.ringID IS NOT NULL THEN 'Used' ELSE 'Not Used' END AS usageStatus, 
           d.isDeleted
    FROM Diamond d 
    LEFT JOIN Ring r ON d.diamondID = r.diamondID
),
Summary AS (
    SELECT 
        COUNT(*) AS totalDiamonds, 
        SUM(CASE WHEN isDeleted = 'active' THEN 1 ELSE 0 END) AS activeDiamonds,
        SUM(CASE WHEN isDeleted = 'deleted' THEN 1 ELSE 0 END) AS deletedDiamonds,
        SUM(CASE WHEN usageStatus = 'Used' THEN 1 ELSE 0 END) AS diamondsUsedInRing,
        SUM(CASE WHEN usageStatus = 'Not Used' THEN 1 ELSE 0 END) AS diamondsNotUsedInRing,
        ROUND(CAST(SUM(CASE WHEN usageStatus = 'Used' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS percentageDiamondsUsed,
        ROUND(CAST(SUM(CASE WHEN usageStatus = 'Not Used' THEN 1 ELSE 0 END) AS FLOAT) / COUNT(*) * 100, 2) AS percentageDiamondsNotUsed,
        STRING_AGG(CASE WHEN usageStatus = 'Not Used' AND isDeleted = 'active' THEN CAST(diamondID AS VARCHAR) ELSE NULL END, ', ') AS activeDiamondsNotUsedList,
        STRING_AGG(CASE WHEN usageStatus = 'Used' AND isDeleted = 'active' THEN CAST(diamondID AS VARCHAR) ELSE NULL END, ', ') AS activeDiamondsUsedList
    FROM DiamondUsage
)
SELECT 
    s.totalDiamonds,
    s.activeDiamonds,
    s.deletedDiamonds,
    s.diamondsUsedInRing,
    s.diamondsNotUsedInRing,
    s.percentageDiamondsUsed,
    s.percentageDiamondsNotUsed,
    s.activeDiamondsNotUsedList,
    s.activeDiamondsUsedList,
    t.origin AS country,
    t.originCount AS diamondCount
FROM 
    Summary s 
CROSS JOIN 
    TopOrigins t
ORDER BY 
    t.originCount DESC;


-- RingPlacementsPrices
SELECT COUNT(*) AS TotalRingPlacements, FORMAT(AVG(rpPrice), 'N0') AS AveragePrice FROM [RingPlacementPrice] WHERE isDeleted = 'active';
WITH MaterialCounts AS (
    SELECT 
        material, 
        COUNT(*) AS RingPlacementsByMaterial, 
        FORMAT(SUM(rpPrice), 'N0') AS TotalMaterialPrice,
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rowNum
    FROM [RingPlacementPrice] 
    WHERE isDeleted = 'active' 
    GROUP BY material
)
SELECT 
    material, 
    RingPlacementsByMaterial, 
    TotalMaterialPrice
FROM MaterialCounts
WHERE rowNum <= 5
ORDER BY RingPlacementsByMaterial DESC;

WITH ColorCounts AS (
    SELECT 
        color, 
        COUNT(*) AS RingPlacementsByColor, 
        ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rowNum
    FROM [RingPlacementPrice] 
    WHERE isDeleted = 'active' 
    GROUP BY color
)
SELECT 
    color, 
    RingPlacementsByColor
FROM ColorCounts
WHERE rowNum <= 5
ORDER BY RingPlacementsByColor DESC;

-- Warranties
WITH ActiveWarrantyStats AS (
    SELECT 
        COUNT(*) AS totalWarranties,
        SUM(CASE WHEN usageCount > 0 THEN 1 ELSE 0 END) AS usedActiveWarranties,
        SUM(CASE WHEN usageCount = 0 THEN 1 ELSE 0 END) AS unusedActiveWarranties,
        FORMAT(SUM(CASE WHEN usageCount > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 'N2') AS percentageUsedActive,
        FORMAT(SUM(CASE WHEN usageCount = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 'N2') AS percentageUnusedActive,
        COUNT(CASE WHEN warrantyType = 'Manufacturer Warranty' THEN 1 END) AS manufacturerWarranties,
        COUNT(CASE WHEN warrantyType = 'Extended Warranty' THEN 1 END) AS extendedWarranties,
        COUNT(CASE WHEN warrantyType = 'Limited Warranty' THEN 1 END) AS limitedWarranties,
        COUNT(CASE WHEN warrantyType = 'Lifetime Warranty' THEN 1 END) AS lifetimeWarranties,
        COUNT(CASE WHEN warrantyType = 'Retailer Warranty' THEN 1 END) AS retailerWarranties,
        MIN(startDate) AS earliestStartDate,
        MAX(startDate) AS latestStartDate,
        AVG(warrantyMonth) AS avgWarrantyDurationMonths,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS activeWarranties,
        COUNT(CASE WHEN isDeleted = 'deleted' THEN 1 END) AS deletedWarranties,
        MIN(endDate) AS earliestEndDate,
        MAX(endDate) AS latestEndDate,
        STUFF((
            SELECT ', ' + CAST(warrantyID AS VARCHAR(10))
            FROM Warranty
            WHERE isDeleted = 'active'
            AND NOT EXISTS (
                SELECT 1 FROM [Order] WHERE [Order].warrantyID = Warranty.warrantyID
            )
            FOR XML PATH('')
        ), 1, 2, '') AS UnusedActiveWarrantyIds
    FROM (
        SELECT 
            w.*, 
            COUNT(o.orderID) OVER (PARTITION BY w.warrantyID) AS usageCount 
        FROM 
            Warranty w
        LEFT JOIN 
            [Order] o ON w.warrantyID = o.warrantyID
        WHERE 
            w.isDeleted = 'active'
    ) AS ActiveWarrantyUsage
)

SELECT 
    totalWarranties,
    usedActiveWarranties,
    unusedActiveWarranties,
    percentageUsedActive + '%' AS percentageUsedActive,
    percentageUnusedActive + '%' AS percentageUnusedActive,
    manufacturerWarranties,
    extendedWarranties,
    limitedWarranties,
    lifetimeWarranties,
    retailerWarranties,
    earliestStartDate,
    latestStartDate,
    avgWarrantyDurationMonths,
    activeWarranties,
    deletedWarranties,
    earliestEndDate,
    latestEndDate,
    FORMAT(manufacturerWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageManufacturerWarranties,
    FORMAT(extendedWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageExtendedWarranties,
    FORMAT(limitedWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageLimitedWarranties,
    FORMAT(lifetimeWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageLifetimeWarranties,
    FORMAT(retailerWarranties * 100.0 / totalWarranties, 'N2') + '%' AS percentageRetailerWarranties,
    UnusedActiveWarrantyIds
FROM 
    ActiveWarrantyStats;

-- Rings

-- Highest
WITH RingPrices AS (
    SELECT 
        r.ringID, 
        r.ringName, 
        r.ringImage, 
        FORMAT(((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02), 'N0') AS totalPrice,
        ROW_NUMBER() OVER (ORDER BY ((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) DESC) AS RankHighest
    FROM [Ring] r
    LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID
    LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID
    LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID
    WHERE r.isDeleted = 'active'
)
SELECT 
    ringID, 
    ringName, 
    ringImage, 
    totalPrice
FROM RingPrices
WHERE RankHighest <= 5
ORDER BY RankHighest ASC;
-- Lowest
WITH RingPrices AS (
    SELECT 
        r.ringID, 
        r.ringName, 
        r.ringImage, 
        FORMAT(((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02), 'N0') AS totalPrice,
        ROW_NUMBER() OVER (ORDER BY ((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) ASC) AS RankLowest
    FROM [Ring] r
    LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID
    LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID
    LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID
    WHERE r.isDeleted = 'active'
)
SELECT 
    ringID, 
    ringName, 
    ringImage, 
    totalPrice
FROM RingPrices
WHERE RankLowest <= 5
ORDER BY RankLowest ASC;

-- Top5Sales
WITH TopRankedRings AS (
    SELECT
        r.ringID,
        r.ringName,
        r.ringImage,
        COUNT(o.orderID) AS PurchaseCount,
        FORMAT(((r.price + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02), 'N0') AS priceOfEachRings,
        YEAR(TRY_CONVERT(datetime, o.orderDate, 105)) AS OrderYear,
        MONTH(TRY_CONVERT(datetime, o.orderDate, 105)) AS OrderMonth,
        DATENAME(MONTH, TRY_CONVERT(datetime, o.orderDate, 105)) AS MonthName,
        ROW_NUMBER() OVER (PARTITION BY YEAR(TRY_CONVERT(datetime, o.orderDate, 105)), MONTH(TRY_CONVERT(datetime, o.orderDate, 105))
                           ORDER BY COUNT(o.orderID) DESC) AS RowNum
    FROM [Order] o
    LEFT JOIN [Ring] r ON o.ringID = r.ringID
    LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID
    LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID
    LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID
    WHERE r.isDeleted = 'active'
      AND o.status IN ('verified', 'shipping', 'purchased', 'delivered', 'received at store')
      AND TRY_CONVERT(datetime, o.orderDate, 105) IS NOT NULL
    GROUP BY r.ringID, r.ringName, r.ringImage, YEAR(TRY_CONVERT(datetime, o.orderDate, 105)), 
             MONTH(TRY_CONVERT(datetime, o.orderDate, 105)), DATENAME(MONTH, TRY_CONVERT(datetime, o.orderDate, 105)),
             r.price, rp.rpPrice, dp.price
)
SELECT
    ringID,
    ringName,
    ringImage,
    PurchaseCount,
    priceOfEachRings,
    OrderYear,
    OrderMonth,
    MonthName
FROM TopRankedRings
WHERE RowNum <= 5
ORDER BY OrderYear DESC, OrderMonth DESC, RowNum;


