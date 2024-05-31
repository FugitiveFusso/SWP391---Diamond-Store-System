USE master
CREATE DATABASE DiamondStoreSystem

USE DiamondStoreSystem

CREATE TABLE [Role](
	roleID int NOT NULL primary key,
	roleName varchar(255) NOT NULL
);

CREATE TABLE [Certificate](
	certificateID int NOT NULL primary key,
	certificateImage varchar(8000),
	[description] varchar(8000)
);

CREATE TABLE [DiamondPrice](
	dpID int primary key,
	diamondSize float,
	caratWeight float,
	color varchar(255),
	clarity varchar(255),
	cut varchar(255),
	price bigint
);

CREATE TABLE [Diamond](
	diamondID int NOT NULL primary key,
	diamondName varchar(255) NOT NULL,
	diamondImage varchar(8000) NOT NULL,
	origin varchar(255) NOT NULL,
	dpID int foreign key REFERENCES [DiamondPrice](dpID),
	certificateID int foreign key REFERENCES [Certificate](certificateID)
);


CREATE TABLE [Collection](
	collectionID int NOT NULL primary key,
	collectionName varchar(255) NOT NULL,
	collectionImage varchar(8000) NOT NULL,
	[description] varchar(8000)
);

CREATE TABLE [Category](
	categoryID int NOT NULL primary key,
	categoryName varchar(255) NOT NULL
);

CREATE TABLE [User](
    userID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    userName varchar(255) NOT NULL,
    [password] varchar(255) NOT NULL,
    firstName varchar(255) NOT NULL,
    lastName varchar(255) NOT NULL,
    phoneNumber varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    [address] varchar(8000) NOT NULL,
    point int NOT NULL,
    roleID int NOT NULL,
    FOREIGN KEY (roleID) REFERENCES [Role](roleID)
);

CREATE TABLE [RingPlacementPrice](
	rpID int primary key,
	rName varchar(800),
	material varchar(255),
	color varchar(255),
	rpPrice bigint
);

CREATE TABLE [Ring](
	ringID int NOT NULL primary key,
	rpID int foreign key REFERENCES [RingPlacementPrice](rpID),
	ringName varchar(255) NOT NULL,
	ringImage varchar(8000) NOT NULL,
	diamondID int NOT NULL foreign key REFERENCES [Diamond](diamondID),
	price bigint NOT NULL,
	collectionID int NOT NULL foreign key REFERENCES [Collection](collectionID),
	categoryID int NOT NULL foreign key REFERENCES [Category](categoryID)
);

CREATE TABLE [Voucher](
	voucherID int NOT NULL primary key,
	voucherName varchar(255) NOT NULL,
	voucherImage varchar(8000) NOT NULL,
	[description] varchar(8000),
	coupon varchar(255) NOT NULL,
	percentage int NOT NULL
);

CREATE TABLE [RingSize](
	ringID int foreign key REFERENCES [Ring](ringID),
	size8 int NOT NULL,
	size9 int NOT NULL,
	size10 int NOT NULL,
	size11 int NOT NULL
);
CREATE TABLE [Order](
	orderID int NOT NULL primary key,
	userID int NOT NULL foreign key REFERENCES [User](userID),
	orderDate date NOT NULL,
	status bit,
	delivered varchar(255)
);

CREATE TABLE [OrderDetails](
	orderDetailsID int primary key NOT NULL, 
	orderID int NOT NULL foreign key REFERENCES [Order](orderID),
	ringID int NOT NULL foreign key REFERENCES [Ring](ringID),
	diamondID int NOT NULL foreign key REFERENCES [Diamond](diamondID),
	voucherID int NOT NULL foreign key REFERENCES [Voucher](voucherID),
	totalPrice bigint NOT NULL
);

CREATE TABLE [ProcessOrder](
	processID int NOT NULL primary key,
	orderID int NOT NULL foreign key REFERENCES [Order](orderID),
	userID int NOT NULL foreign key REFERENCES [User](userID)
);

CREATE TABLE [Warranty](
	warrantyID int NOT NULL primary key,
	warrantyName varchar(255),
	warrantyImage varchar(8000),
	warrantyMonth int NOT NULL
);

CREATE TABLE [Bill](
	billID int NOT NULL primary key,
	userID int NOT NULL foreign key REFERENCES [User](userID),
	orderID int NOT NULL foreign key REFERENCES [Order](orderID),
	certificateID int NOT NULL foreign key REFERENCES [Certificate](certificateID),
	warrantyID int NOT NULL foreign key REFERENCES [Warranty](warrantyID),
);

CREATE TABLE [Post](
	postID int NOT NULL primary key,
	postName varchar(8000) NOT NULL,
	postImage varchar(8000) NOT NULL,
	description varchar(max) NOT NULL
	
);





