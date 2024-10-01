create database korea_iot;

use korea_iot;

create table user (
	id int auto_increment primary key,
    name varchar(50),
    email varchar(50)
);

insert into user (name, email)
values
	('홍동현', 'abc@example.com'),
	('가나다', 'bcd@example.com'),
	('라마바', 'cde@example.com'),
	('사아자', 'def@example.com'),
	('차카타', 'efg@example.com');