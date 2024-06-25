WITH
-- Role Table
RoleStats AS (
    SELECT 
        COUNT(*) AS total_roles
    FROM 
        [Role]
),
-- Certificate Table
CertificateStats AS (
    SELECT 
        COUNT(*) AS total_certificates,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_certificates
    FROM 
        [Certificate]
),
-- DiamondPrice Table
DiamondPriceStats AS (
    SELECT 
        COUNT(*) AS total_diamond_prices,
        AVG(CASE WHEN isDeleted = 'active' THEN price END) AS average_active_price
    FROM 
        [DiamondPrice]
),
-- Diamond Table
DiamondStats AS (
    SELECT 
        COUNT(*) AS total_diamonds,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_diamonds
    FROM 
        [Diamond]
),
-- Collection Table
CollectionStats AS (
    SELECT 
        COUNT(*) AS total_collections,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_collections
    FROM 
        [Collection]
),
-- Category Table
CategoryStats AS (
    SELECT 
        COUNT(*) AS total_categories,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_categories
    FROM 
        [Category]
),
-- User Table
UserStats AS (
    SELECT 
            COUNT(*) AS total_users,
    COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_users,
    AVG(point) AS average_points
    FROM 
        [User]
),
-- RingPlacementPrice Table
RingPlacementPriceStats AS (
    SELECT 
        COUNT(*) AS total_ring_placement_prices,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_ring_placement_prices
    FROM 
        [RingPlacementPrice]
),
-- Ring Table
RingStats AS (
    SELECT 
        COUNT(*) AS total_rings,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_rings
    FROM 
        [Ring]
),
-- Voucher Table
VoucherStats AS (
    SELECT 
        COUNT(*) AS total_vouchers,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_vouchers
    FROM 
        [Voucher]
),
-- Warranty Table
WarrantyStats AS (
    SELECT 
        COUNT(*) AS total_warranties,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_warranties
    FROM 
        [Warranty]
),
-- Post Table
PostStats AS (
    SELECT 
        COUNT(*) AS total_posts,
        COUNT(CASE WHEN isDeleted = 'active' THEN 1 END) AS active_posts
    FROM 
        [Post]
)

-- Combine all statistics into a single result set
SELECT
    (SELECT total_roles FROM RoleStats) AS total_roles,
    (SELECT total_certificates FROM CertificateStats) AS total_certificates,
    (SELECT active_certificates FROM CertificateStats) AS active_certificates,
    (SELECT total_diamond_prices FROM DiamondPriceStats) AS total_diamond_prices,
    (SELECT average_active_price FROM DiamondPriceStats) AS average_active_price,
    (SELECT total_diamonds FROM DiamondStats) AS total_diamonds,
    (SELECT active_diamonds FROM DiamondStats) AS active_diamonds,
    (SELECT total_collections FROM CollectionStats) AS total_collections,
    (SELECT active_collections FROM CollectionStats) AS active_collections,
    (SELECT total_categories FROM CategoryStats) AS total_categories,
    (SELECT active_categories FROM CategoryStats) AS active_categories,
    (SELECT total_users FROM UserStats) AS total_users,
    (SELECT active_users FROM UserStats) AS active_users,
	(SELECT average_points from UserStats) AS average_points,
    (SELECT total_ring_placement_prices FROM RingPlacementPriceStats) AS total_ring_placement_prices,
    (SELECT active_ring_placement_prices FROM RingPlacementPriceStats) AS active_ring_placement_prices,
    (SELECT total_rings FROM RingStats) AS total_rings,
    (SELECT active_rings FROM RingStats) AS active_rings,
    (SELECT total_vouchers FROM VoucherStats) AS total_vouchers,
    (SELECT active_vouchers FROM VoucherStats) AS active_vouchers,
    (SELECT total_warranties FROM WarrantyStats) AS total_warranties,
    (SELECT active_warranties FROM WarrantyStats) AS active_warranties,
    (SELECT total_posts FROM PostStats) AS total_posts,
    (SELECT active_posts FROM PostStats) AS active_posts
