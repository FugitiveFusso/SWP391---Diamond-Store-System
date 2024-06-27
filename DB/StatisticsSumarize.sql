-- User
SELECT r.roleName,
       COUNT(u.userID) AS TotalUsers,
       SUM(CASE WHEN u.[status] = 'active' THEN 1 ELSE 0 END) AS ActiveUserCount,
       SUM(CASE WHEN u.[status] = 'banned' THEN 1 ELSE 0 END) AS BannedUserCount
FROM [Role] r
LEFT JOIN [User] u ON r.roleID = u.roleID
GROUP BY r.roleName, u.isDeleted
HAVING u.isDeleted = 'active'
ORDER BY r.roleName;

-- Category
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

-- Collection
WITH CollectionSummary AS (
    SELECT c.collectionID, c.collectionName, COUNT(r.ringID) AS NumberOfRings, SUM((COALESCE(r.price, 0) + COALESCE(rp.rpPrice, 0) + COALESCE(dp.price, 0)) * 1.02) AS TotalCollectionPrice
    FROM [Collection] c LEFT JOIN [Ring] r ON c.collectionID = r.collectionID AND r.isDeleted = 'active'
    LEFT JOIN [RingPlacementPrice] rp ON r.rpID = rp.rpID LEFT JOIN [Diamond] d ON d.diamondID = r.diamondID
    LEFT JOIN [DiamondPrice] dp ON d.dpID = dp.dpID
    WHERE c.isDeleted = 'active' GROUP BY c.collectionID, c.collectionName
)

SELECT (SELECT COUNT(*) FROM [Collection] WHERE isDeleted = 'active') AS NumberOfCollections, cs.collectionName, cs.NumberOfRings, FORMAT(cs.TotalCollectionPrice, 'N0') AS TotalCollectionPrice
FROM CollectionSummary cs ORDER BY cs.NumberOfRings DESC, cs.TotalCollectionPrice DESC;