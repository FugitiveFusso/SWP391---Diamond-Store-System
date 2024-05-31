INSERT INTO [Role] VALUES (1,'Adminstrator'), (2,'Manager'), (3,'Sales Staff'), (4,'Delivery Staff'), (5,'Customer')
SELECT * FROM [Role]

INSERT INTO [User] VALUES 
('cuong', '1','Cuong','Nguyen Phu','0898876512','cuongnp123@gmail.com','Vo Van Ngan gi gi do',0,2),
('an', '1','An','Do Dinh','0937368003','andd1282@gmail.com','Quang Truong Thong Nhat',0,1),
('khoa', '1','Khoa','Le Anh','0563098372','khoalac12nam@gmail.com','Dau do o Sai Gon',0,3),
('hoang', '1','Hoang','Nguyen Minh','0487354221','hoangnv0912@gmail.com','Ben Thanh',0,4),
('kien', '1','Kien','Ngo Chi','032033471','kiennc666@yahoo.com.vn','O gan day',0,5),
('huy', '1','Huy','Pham Phu','075776871','phuhuydaydoi@gmail.com','Gan dau do',0,5)

INSERT INTO [Category] VALUES 
(1, '5K Gold'),
(2, '12K Gold'),
(3, '14K Gold'),
(4, '18K Gold'),
(5, '20K Gold')

INSERT INTO [Collection] VALUES 
(1, 'EST. 2020','https://www.uniqlo.com/catalog-2021ss/vn/img/hero_sp.jpg','New additions'),
(2, 'FA FOREVER','https://www.uniqlo.com/jp/ja/contents/collaboration/uniqlo-u/24ss/common/imgs/lookbookItems/lookbook-2.jpg','Another new additions')

INSERT INTO [Voucher] VALUES
(1, 'GRAND OPENING SALE', 'https://bluenile-blog.r2net.com/wp-content/uploads/Ring-Spacing-Hero.jpg',  'SALE MO CUA HANG FUJ, SAN SALE KHUYEN MAI 20% VAO TUAN DAU TIEN, BA CON OI MAI DO MAI DO!!!! THOI LUONG CO HAN!!!', '2BA', 20)

INSERT INTO [Post] VALUES
(1,'HELLO THERE!!','https://bluenile-blog.r2net.com/wp-content/uploads/Ring-Spacing-Hero.jpg', 'One of the most flexible, useful and crucial pieces of jewelry can look simple enough. A small band that’s no bigger than 2.5mm wide might not seem like an impactful piece of jewelry, but these rings are considered essential for many stacking styles.
Thin rings, also known as ring spacers or spacer bands, are narrow and low-profile bands that are designed to fit perfectly in larger band stacks or sets. They are worn alongside at least two other rings. These thin rings can be some of the most important jewelry pieces when you’re wearing multiple rings together. ')

INSERT INTO [Certificate] VALUES
(1,'https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate'),
(2,'https://mygemma.com/cdn/shop/products/099157-stamp_16839a53-25af-4206-974b-8910e35d9b28_1200x.jpg','0.50 Carat Emerald Cut Diamond'),
(3,'https://mygemma.com/cdn/shop/products/104966-stamp_1200x.jpg','0.70 ct SI1 - Round Cut Diamond')

INSERT INTO [DiamondPrice] VALUES
(1, 3.1, 0.36, 'D','IF','ROUND BRILLIANT',20433000),
(2, 3.1, 0.36, 'D','VVS1','ROUND BRILLIANT',16147000),
(3, 3.1, 0.36, 'D','VVS2','ROUND BRILLIANT',15289000),
(4, 3.1, 0.36, 'D','VS1','ROUND BRILLIANT',12311000),
(5, 3.1, 0.36, 'D','VS2','ROUND BRILLIANT',11635000),
(6, 3.1, 0.36, 'E','IF','ROUND BRILLIANT',19576000),
(7, 3.1, 0.36, 'E','VVS1','ROUND BRILLIANT',15289000),
(8, 3.1, 0.36, 'E','VVS2','ROUND BRILLIANT',14432000),
(9, 3.1, 0.36, 'E','VS1','ROUND BRILLIANT',11635000),
(10, 3.1, 0.36, 'E','VS2','ROUND BRILLIANT',10913000),
(11, 3.1, 0.36, 'F','IF','ROUND BRILLIANT',18718000),
(12, 3.1, 0.36, 'F','VVS1','ROUND BRILLIANT',14432000),
(13, 3.1, 0.36, 'F','VVS2','ROUND BRILLIANT',13575000),
(14, 3.1, 0.36, 'F','VS1','ROUND BRILLIANT',10913000),
(15, 3.1, 0.36, 'F','VS2','ROUND BRILLIANT',10191000),
(16, 3.1, 0.36, 'J','IF','ROUND BRILLIANT',10200000),
(17, 3.1, 0.36, 'J','VVS1','ROUND BRILLIANT',9800000),
(18, 3.1, 0.36, 'J','VVS2','ROUND BRILLIANT',9100000),
(19, 3.1, 0.36, 'J','VS1','ROUND BRILLIANT',7100000),
(20, 3.1, 0.36, 'J','VS2','ROUND BRILLIANT',6000000),

(21, 6.2, 0.36, 'D','IF','ROUND BRILLIANT',192300000),
(22, 6.2, 0.36, 'D','VVS1','ROUND BRILLIANT',188100000),
(23, 6.2, 0.36, 'D','VVS2','ROUND BRILLIANT',183600000),
(24, 6.2, 0.36, 'D','VS1','ROUND BRILLIANT',166600000),
(25, 6.2, 0.36, 'D','VS2','ROUND BRILLIANT',162000000),
(26, 6.2, 0.36, 'E','IF','ROUND BRILLIANT',190600000),
(27, 6.2, 0.36, 'E','VVS1','ROUND BRILLIANT',186400000),
(28, 6.2, 0.36, 'E','VVS2','ROUND BRILLIANT',182600000),
(29, 6.2, 0.36, 'E','VS1','ROUND BRILLIANT',164300000),
(30, 6.2, 0.36, 'E','VS2','ROUND BRILLIANT',160100000),
(31, 6.2, 0.36, 'F','IF','ROUND BRILLIANT',188800000),
(32, 6.2, 0.36, 'F','VVS1','ROUND BRILLIANT',183200000),
(33, 6.2, 0.36, 'F','VVS2','ROUND BRILLIANT',180000000),
(34, 6.2, 0.36, 'F','VS1','ROUND BRILLIANT',180000000),
(35, 6.2, 0.36, 'F','VS2','ROUND BRILLIANT',158800000),
(36, 6.2, 0.36, 'J','IF','ROUND BRILLIANT',102600000),
(37, 6.2, 0.36, 'J','VVS1','ROUND BRILLIANT',98000000),
(38, 6.2, 0.36, 'J','VVS2','ROUND BRILLIANT',85000000),
(39, 6.2, 0.36, 'J','VS1','ROUND BRILLIANT',72200000),
(40, 6.2, 0.36, 'J','VS2','ROUND BRILLIANT',60500000)



INSERT INTO [Diamond] VALUES
(1,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',1,1),
(2,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',2,1),
(3,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',3,1),
(4,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',4,1),
(5,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',5,1),
(6,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',6,1),
(7,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',7,1),
(8,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',8,1),
(9,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',9,1),
(10,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',10,1),
(11,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',11,1),
(12,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',12,1),
(13,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',13,1),
(14,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',14,1),
(15,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',15,1),
(16,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',16,1),
(17,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',17,1),
(18,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',18,1),
(19,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',19,1),
(20,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',20,1),
(21,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',21,1),
(22,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',22,1),
(23,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',23,1),
(24,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',24,1),
(25,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',25,1),
(26,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',26,1),
(27,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',27,1),
(28,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',28,1),
(29,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',29,1),
(30,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',30,1),
(31,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',31,1),
(32,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',32,1),
(33,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',33,1),
(34,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',34,1),
(35,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',35,1),
(36,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',36,1),
(37,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',37,1),
(38,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',38,1),
(39,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',39,1),
(40,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',40,1)

INSERT INTO [RingPlacementPrice] VALUES
(1,'Pure Platinum','Platinum','Silver',25000000),
(2,'12K Pink Gold','Gold','Pink',30000000),
(3,'18K Gold','Gold','Yellow Gold',350000000),
(4,'12K White Gold','Gold, Nickle','White',20000000)

INSERT INTO [Ring] VALUES
(1,1,'18ct Diamond Solitaire Ring','https://www.berrysjewellers.co.uk/cdn/shop/products/1620389070-28905700.jpg',1,20000000,1,1),
(2,2,'18ct Diamond Solitaire Ring','https://www.berrysjewellers.co.uk/cdn/shop/products/1620389070-28905700.jpg',1,20000000,1,1),
(3,3,'18ct Diamond Solitaire Ring','https://www.berrysjewellers.co.uk/cdn/shop/products/1620389070-28905700.jpg',1,20000000,1,1),
(4,4,'18ct Diamond Solitaire Ring','https://www.berrysjewellers.co.uk/cdn/shop/products/1620389070-28905700.jpg',1,20000000,1,1)

SELECT * FROM DiamondPrice