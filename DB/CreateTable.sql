USE master
CREATE DATABASE DiamondStoreSystem

USE DiamondStoreSystem

CREATE TABLE [Role](
	roleID int NOT NULL primary key,
	roleName varchar(255) NOT NULL
);

CREATE TABLE [Certificate](
	certificateID int IDENTITY(1,1) NOT NULL primary key,
	certificateImage varchar(8000),
	[description] varchar(8000),
	isDeleted varchar(10)
);

CREATE TABLE [DiamondPrice](
	dpID int IDENTITY(1,1) NOT NULL primary key,
	diamondSize float,
	caratWeight float,
	color varchar(255),
	clarity varchar(255),
	cut varchar(255),
	price bigint,
	isDeleted varchar(10)
);

CREATE TABLE [Diamond](
	diamondID int IDENTITY(1,1) NOT NULL primary key,
	diamondName varchar(255) NOT NULL,
	diamondImage varchar(8000) NOT NULL,
	origin varchar(255) NOT NULL,
	isDeleted varchar(10),
	dpID int foreign key REFERENCES [DiamondPrice](dpID),
	certificateID int foreign key REFERENCES [Certificate](certificateID)
);


CREATE TABLE [Collection](
	collectionID int IDENTITY(1,1) NOT NULL primary key,
	collectionName varchar(255) NOT NULL,
	collectionImage varchar(8000) NOT NULL,
	[description] varchar(8000),
	isDeleted varchar(10)
);

CREATE TABLE [Category](
	categoryID int IDENTITY(1,1) NOT NULL primary key,
	categoryName varchar(255) NOT NULL,
    categoryImage varchar(8000) NOT NULL,
	isDeleted varchar(10)
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
	[status] varchar(10), 
    roleID int NOT NULL,
	isDeleted varchar(10),
    FOREIGN KEY (roleID) REFERENCES [Role](roleID)
);

CREATE TABLE [RingPlacementPrice](
	rpID int IDENTITY(1,1) primary key,
	rName varchar(800),
	material varchar(255),
	color varchar(255),
	rpPrice bigint,
	isDeleted varchar(10)
);

CREATE TABLE [Ring](
	ringID int IDENTITY(1,1) NOT NULL primary key,
	rpID int foreign key REFERENCES [RingPlacementPrice](rpID),
	ringName varchar(255) NOT NULL,
	ringImage varchar(8000) NOT NULL,
	diamondID int NOT NULL foreign key REFERENCES [Diamond](diamondID),
	price bigint NOT NULL,
	collectionID int NOT NULL foreign key REFERENCES [Collection](collectionID),
	categoryID int NOT NULL foreign key REFERENCES [Category](categoryID),
	isDeleted varchar(10)
);

CREATE TABLE [Voucher](
	voucherID int IDENTITY(1,1) NOT NULL primary key,
	voucherName varchar(255) NOT NULL,
	voucherImage varchar(8000) NOT NULL,
	createdDate date not null,
	createdBy varchar(255) not null,
	[description] varchar(8000),
	coupon varchar(255) NOT NULL,
	percentage int NOT NULL,
	isDeleted varchar(10)
);

CREATE TABLE [Warranty] (
    warrantyID int IDENTITY(1,1) NOT NULL PRIMARY KEY,        
    warrantyName varchar(255) NOT NULL,                  
    warrantyImage varchar(8000),                              
    warrantyMonth int NOT NULL CHECK (warrantyMonth > 0),     
    warrantyDescription text,                                 
    warrantyType varchar(255),                                
    startDate date NOT NULL,                                  
    endDate AS DATEADD(month, warrantyMonth, startDate),      
    termsAndConditions text,
	isDeleted varchar(10)
);

CREATE TABLE [Order](
	orderID int NOT NULL primary key,
	userID int NOT NULL foreign key REFERENCES [User](userID),
	orderDate varchar(255),
	ringID int NOT NULL foreign key REFERENCES [Ring](ringID),
	voucherID int foreign key REFERENCES [Voucher](voucherID),
	warrantyID int foreign key REFERENCES [Warranty](warrantyID),
	ringSize int,
	purchaseMethod varchar(50),
	[status] varchar(255)
);

CREATE TABLE [Bill](
	billID int NOT NULL primary key,
	userID int NOT NULL foreign key REFERENCES [User](userID),
	orderID int NOT NULL foreign key REFERENCES [Order](orderID),
	certificateID int NOT NULL foreign key REFERENCES [Certificate](certificateID),
	warrantyID int NOT NULL foreign key REFERENCES [Warranty](warrantyID),
);

CREATE TABLE [Post](
	postID int IDENTITY(1,1) NOT NULL primary key,
	postName varchar(8000) NOT NULL,
	postImage varchar(8000) NOT NULL,
    postDate date not null,
	author varchar(255) not null,
	description varchar(max) NOT NULL, 
	postText varchar(max),
	isDeleted varchar(10)
);