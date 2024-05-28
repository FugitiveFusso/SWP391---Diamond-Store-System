INSERT INTO [Role] VALUES (1,'Adminstrator'), (2,'Manager'), (3,'Sales Staff'), (4,'Delivery Staff'), (5,'Customer')
SELECT * FROM [Role]

INSERT INTO [User] VALUES 
(1, 'cuong', '1','Cuong','Nguyen Phu','0898876512','cuongnp123@gmail.com','Vo Van Ngan gi gi do',0,2),
(2, 'an', '1','An','Do Dinh','0937368003','andd1282@gmail.com','Quang Truong Thong Nhat',0,1),
(3, 'khoa', '1','Khoa','Le Anh','0563098372','khoalac12nam@gmail.com','Dau do o Sai Gon',0,3),
(4, 'hoang', '1','Hoang','Nguyen Minh','0487354221','hoangnv0912@gmail.com','Ben Thanh',0,4),
(5, 'kien', '1','Kien','Ngo Chi','032033471','kiennc666@yahoo.com.vn','O gan day',0,5),
(6, 'huy', '1','Huy','Pham Phu','075776871','phuhuydaydoi@gmail.com','Gan dau do',0,5)

INSERT INTO [Category] VALUES 
(1, '12K Gold'),
(2, '14K Gold')

INSERT INTO [Collection] VALUES 
(1, 'EST. 2020','https://www.uniqlo.com/catalog-2021ss/vn/img/hero_sp.jpg','New additions'),
(2, 'FA FOREVER','https://www.uniqlo.com/jp/ja/contents/collaboration/uniqlo-u/24ss/common/imgs/lookbookItems/lookbook-2.jpg','Another new additions')

INSERT INTO [Voucher] VALUES
(1, 'https://bluenile-blog.r2net.com/wp-content/uploads/Ring-Spacing-Hero.jpg', 'GRAND OPENING SALE', 'SALE MO CUA HANG FUJ, SAN SALE KHUYEN MAI 20% VAO TUAN DAU TIEN, BA CON OI MAI DO MAI DO!!!! THOI LUONG CO HAN!!!', '2BA', 20)

INSERT INTO [Post] VALUES
(1,'HELLO THERE!!','https://bluenile-blog.r2net.com/wp-content/uploads/Ring-Spacing-Hero.jpg', 'One of the most flexible, useful and crucial pieces of jewelry can look simple enough. A small band that’s no bigger than 2.5mm wide might not seem like an impactful piece of jewelry, but these rings are considered essential for many stacking styles.
Thin rings, also known as ring spacers or spacer bands, are narrow and low-profile bands that are designed to fit perfectly in larger band stacks or sets. They are worn alongside at least two other rings. These thin rings can be some of the most important jewelry pieces when you’re wearing multiple rings together. ')

INSERT INTO [Certificate] VALUES
(1,'https://atticgold.com/cdn/shop/articles/ATTIC_GIA_Report.jpg','0.36 Carat Round Cut Diamond Certificate'),
(2,'https://mygemma.com/cdn/shop/products/099157-stamp_16839a53-25af-4206-974b-8910e35d9b28_1200x.jpg','0.50 Carat Emerald Cut Diamond'),
(3,'https://mygemma.com/cdn/shop/products/104966-stamp_1200x.jpg','0.70 ct SI1 - Round Cut Diamond')

INSERT INTO [Diamond] VALUES
(1,'0.36 Carat Round Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/round-cut-diamond.jpg','Vietnam',0.36,'Round','White','S12',1),
(2,'0.50 Carat Emerald Cut Diamond','https://temple-and-grace.mo.cloudinary.net/mdopt/images/prod-large/diamonds/emerald-cut-diamond.jpg','Finland',0.5,'Emerald','White','VS2',2),
(3,'0.70 ct SI1 - Round Cut Diamond','https://vancouverdiamonds.ca/wp-content/uploads/2018/11/diamond-round.jpg','South Africa',0.7,'Brilliant Round','White','GH4',3)

INSERT INTO [Ring] VALUES
(1,'18ct Rose Gold Diamond Solitaire Engagement Ring','https://www.berrysjewellers.co.uk/cdn/shop/products/1620389070-28905700.jpg',1,'M',200,1,1),
(2,'Diamond Ring 45','https://gemspavilion.com/wp-content/uploads/2021/03/1RF0245D.jpg',2,'F',300,2,2),
(3,'Platinum Princess Cut Solitaire Diamond Ring','https://www.berrysjewellers.co.uk/cdn/shop/products/1558439715-97310600.png',3,'F',250,2,1)