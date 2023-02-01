create database hotel_reservationdb;

use hotel_reservationdb;

CREATE TABLE room (
	room_number INT NOT NULL,
	type INT,
	room_assigned_status BOOLEAN NOT NULL,
	assigned INT,
	PRIMARY KEY (room_number)
);

create table users(
	id int AUTO_INCREMENT,
	fname varchar(60),
	phno varchar(255),
	user_name varchar(30) UNIQUE,
	password varchar(30),
	PRIMARY KEY(id, phno)
);

CREATE TABLE customer (
	id INT NOT NULL AUTO_INCREMENT,
	name TEXT NOT NULL,
	phone_number VARCHAR(255) UNIQUE,
	checkin_date DATE,
	checkout_date DATE,
	room_number INT,
	PRIMARY KEY (id)
);

create table receptionist(
	id int NOT NULL AUTO_INCREMENT,
	fname varchar(60),
	phno varchar(255),
	user_name varchar(30) UNIQUE,
	password varchar(30),
	PRIMARY KEY(id)
);

CREATE TABLE room_type (
	id INT NOT NULL AUTO_INCREMENT,
	room_type VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

ALTER table users ADD index(phno);

ALTER TABLE customer ADD FOREIGN KEY(phone_number) REFERENCES users(phno);

ALTER TABLE room ADD CONSTRAINT room_fk0 FOREIGN KEY (type) REFERENCES room_type(id);

ALTER TABLE room ADD CONSTRAINT room_fk1 FOREIGN KEY (assigned) REFERENCES customer(id) on delete set null;

ALTER TABLE customer ADD CONSTRAINT customer_fk0 FOREIGN KEY (room_number) REFERENCES room(room_number);


insert into room_type(room_type) values ('Premium Suit');
insert into room_type(room_type) values ('VIP Suit');
insert into room_type(room_type) values ('Connecting room');
insert into room_type(room_type) values ('Double');
insert into room_type(room_type) values ('Single');

insert into room(room_number, type, room_assigned_status) values (101,5,false);
insert into room(room_number, type, room_assigned_status) values (102,5,false);
insert into room(room_number, type, room_assigned_status) values (103,5,false);
insert into room(room_number, type, room_assigned_status) values (201,1,false);
insert into room(room_number, type, room_assigned_status) values (202,1,false);
insert into room(room_number, type, room_assigned_status) values (203,2,false);
insert into room(room_number, type, room_assigned_status) values (301,3,false);
insert into room(room_number, type, room_assigned_status) values (302,4,false);
insert into room(room_number, type, room_assigned_status) values (303,4,false);

insert into receptionist(fname,phno,user_name,password) values('albert',12345,'person1','password');
insert into receptionist(fname,phno,user_name,password) values('byan',12346,'person2','password');
insert into receptionist(fname,phno,user_name,password) values('cameron',12347,'person3','password');

