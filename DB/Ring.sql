USE master
CREATE DATABASE DiamondStoreSystem

USE DiamondStoreSystem

CREATE TABLE [Role](
	roleID int NOT NULL primary key,
	roleName varchar(255) NOT NULL
);

CREATE TABLE [Diamond](
	diamondID int NOT NULL primary key,
	diamondName varchar NOT NULL,
	origin varchar NOT NULL,
	caratWeight int NOT NULL,
	cut varchar NOT NULL,
	color varchar NOT NULL,
	clarity varchar NOT NULL
);

CREATE TABLE [Collection](
	collectionID int NOT NULL primary key,
	collectionName varchar NOT NULL
);

CREATE TABLE [Category](
	categoryID int NOT NULL primary key,
	categoryName varchar NOT NULL
);

CREATE TABLE [User](
	userID int NOT NULL primary key,
	userName varchar NOT NULL,
	[password] varchar NOT NULL,
	firstName varchar NOT NULL,
	lastName varchar NOT NULL,
	phoneNumber varchar NOT NULL,
	email varchar NOT NULL,
	[address] text NOT NULL,
	point int NOT NULL,
	roleID int NOT NULL foreign key REFERENCES [Role](roleID)
);

CREATE TABLE [Ring](
	ringID int NOT NULL primary key,
	ringName varchar NOT NULL,
	diamondID int NOT NULL foreign key REFERENCES [Diamond](diamondID),
	gender varchar NOT NULL,
	price float NOT NULL,
	quantity int NOT NULL,
	collectionID int NOT NULL foreign key REFERENCES [Collection](collectionID),
	categoryID int NOT NULL foreign key REFERENCES [Category](categoryID)
);

CREATE TABLE [Certificate](
	certificateID int NOT NULL primary key,
	diamondID int NOT NULL foreign key REFERENCES [Diamond](diamondID)
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
	delivered varchar
);

CREATE TABLE [OrderDetails](
	orderID int NOT NULL foreign key REFERENCES [Order](orderID),
	ringID int NOT NULL foreign key REFERENCES [Ring](ringID),
	diamondID int NOT NULL,
	voucherID int NOT NULL,
	totalPrice float NOT NULL
);

CREATE TABLE [ProcessOrder](
	processID int NOT NULL primary key,
	orderID int NOT NULL foreign key REFERENCES [Order](orderID),
	userID int NOT NULL foreign key REFERENCES [User](userID)
);

CREATE TABLE [Voucher](
	voucherID int NOT NULL primary key,
	voucherName varchar(255) NOT NULL,
	[description] varchar(max) NOT NULL,
	coupon varchar(255) NOT NULL,
	percentage int NOT NULL
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
	certificateID int NOT NULL foreign key REFERENCES [Certificate](certificateID)
);

CREATE TABLE [Post](
	postName varchar(255) NOT NULL,
	description varchar(max) NOT NULL,
	postImage image NOT NULL
);





