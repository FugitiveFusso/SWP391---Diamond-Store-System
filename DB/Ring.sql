USE master
CREATE DATABASE DiamondStoreSystem

USE DiamondStoreSystem

CREATE TABLE [Role](
	roleID int NOT NULL primary key,
	roleName varchar(255) NOT NULL
);

CREATE TABLE [Diamond](
	diamondID int NOT NULL primary key,
	diamondName varchar(255) NOT NULL,
	diamondImage varchar(8000) NOT NULL,
	origin varchar(255) NOT NULL,
	caratWeight int NOT NULL,
	cut varchar(255) NOT NULL,
	color varchar(255) NOT NULL,
	clarity varchar(255) NOT NULL
);

CREATE TABLE [Collection](
	collectionID int NOT NULL primary key,
	collectionName varchar(255) NOT NULL
);

CREATE TABLE [Category](
	categoryID int NOT NULL primary key,
	categoryName varchar(255) NOT NULL
);

CREATE TABLE [User](
	userID int NOT NULL primary key,
	userName varchar(255) NOT NULL,
	[password] varchar(255) NOT NULL,
	firstName varchar(255) NOT NULL,
	lastName varchar(255) NOT NULL,
	phoneNumber varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	[address] varchar(8000) NOT NULL,
	point int NOT NULL,
	roleID int NOT NULL foreign key REFERENCES [Role](roleID)
);

CREATE TABLE [Ring](
	ringID int NOT NULL primary key,
	ringName varchar NOT NULL,
	ringImage varchar(8000) NOT NULL,
	diamondID int NOT NULL foreign key REFERENCES [Diamond](diamondID),
	gender varchar NOT NULL,
	price float NOT NULL,
	quantity int NOT NULL,
	collectionID int NOT NULL foreign key REFERENCES [Collection](collectionID),
	categoryID int NOT NULL foreign key REFERENCES [Category](categoryID)
);

CREATE TABLE [Certificate](
	certificateID int NOT NULL primary key,
	certificateDescription varchar(8000),
	diamondID int NOT NULL foreign key REFERENCES [Diamond](diamondID)
);

CREATE TABLE [Voucher](
	voucherID int NOT NULL primary key,
	voucherName varchar(255) NOT NULL,
	voucherImage varchar(8000) NOT NULL,
	[description] varchar(max) NOT NULL,
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
	orderID int NOT NULL foreign key REFERENCES [Order](orderID),
	ringID int NOT NULL foreign key REFERENCES [Ring](ringID),
	diamondID int NOT NULL foreign key REFERENCES [Diamond](diamondID),
	voucherID int NOT NULL foreign key REFERENCES [Voucher](voucherID),
	totalPrice float NOT NULL
);

CREATE TABLE [ProcessOrder](
	processID int NOT NULL primary key,
	orderID int NOT NULL foreign key REFERENCES [Order](orderID),
	userID int NOT NULL foreign key REFERENCES [User](userID)
);

CREATE TABLE [Warranty](
	warrantyID int NOT NULL primary key,
	warrantyName varchar(255),
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




