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

-- Categories
SELECT TotalCategories, ActiveCategories, DeletedCategories, Top3CategoryNames, Top3CategoryRingCounts FROM
            (SELECT 
            (SELECT COUNT(*) FROM [Category]) AS TotalCategories,
            (SELECT SUM(CASE WHEN isDeleted = 'active' THEN 1 ELSE 0 END) FROM [Category]) AS ActiveCategories,
            (SELECT SUM(CASE WHEN isDeleted = 'deleted' THEN 1 ELSE 0 END) FROM [Category]) AS DeletedCategories,
            STRING_AGG(c.categoryName, ', ') AS Top3CategoryNames,
            STRING_AGG(CAST(CategoryRingCounts.NumberOfRings AS VARCHAR), ', ') AS Top3CategoryRingCounts
        FROM [Category] c LEFT JOIN (
            SELECT r.categoryID, COUNT(*) AS NumberOfRings FROM [Ring] r
            GROUP BY r.categoryID) AS CategoryRingCounts ON c.categoryID = CategoryRingCounts.categoryID
        WHERE c.categoryName IN (SELECT TOP 3 categoryName FROM [Category] c JOIN [Ring] r ON c.categoryID = r.categoryID
        GROUP BY categoryName ORDER BY COUNT(*) DESC)
        GROUP BY CategoryRingCounts.categoryID) AS CombinedResults;

-- Collections
WITH CollectionSummary AS (
SELECT c.collectionID, c.collectionName, COUNT(r.ringID) AS NumberOfRings, SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) AS TotalCollectionPrice
FROM [Collection] c LEFT JOIN [Ring] r ON c.collectionID = r.collectionID AND r.isDeleted = 'active'
LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID
WHERE c.isDeleted = 'active' GROUP BY c.collectionID, c.collectionName)

SELECT (SELECT COUNT(*) FROM [Collection] WHERE isDeleted = 'active') AS NumberOfCollections, cs.collectionName, cs.NumberOfRings, FORMAT(cs.TotalCollectionPrice, 'N0') AS TotalCollectionPrice
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


