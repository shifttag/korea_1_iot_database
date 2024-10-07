DROP DATABASE `YAMYAM`;
CREATE DATABASE `YAMYAM`;
USE `YAMYAM`;

CREATE TABLE `membership` (
	`user_number`	INT	PRIMARY KEY AUTO_INCREMENT,
	`user_id`	VARCHAR(255)	NOT NULL,
	`user_pw`	VARCHAR(255)	NOT NULL,
	`user_name`	VARCHAR(255)	NOT NULL,
	`user_tel`	VARCHAR(255)	NOT NULL,
	`user_email`	VARCHAR(255)	NOT NULL,
	`user_birth`	VARCHAR(255)	NOT NULL,
    `user_phonenumber` VARCHAR(255) NOT NULL,
	`user_business_number`	INT	NOT NULL,
	`user_privacy_policy`	BOOLEAN	NOT NULL,
	`user_marketing`	BOOLEAN	NULL
);

CREATE TABLE `store` (
	`store_number`	INT	PRIMARY KEY AUTO_INCREMENT,
	`user_number`	INT	NOT NULL	COMMENT 'AUTO_INCREMENT',
	`store_name`	VARCHAR(255)	NOT NULL,
	`store_logo`	VARCHAR(255)	NOT NULL	COMMENT 'url 받아옴',
	`store_category` ENUM('한식', '중식', '일식', '양식', '분식', '카페/베이커리'),
	`store_open_time`	TIME	NOT NULL,
	`store_close_time`	TIME	NOT NULL,
	`store_break_start`	TIME	NULL,
	`store_break_end`	TIME	NULL,
	`store_address`	VARCHAR(255)	NULL	,
	`store_description`	TEXT	NULL,
    FOREIGN KEY (USER_NUMBER) REFERENCES `membership` (USER_NUMBER)
    
);


CREATE TABLE `Categories` (
	`category_number`	INT PRIMARY KEY AUTO_INCREMENT	,
	`store_number`	INT	NOT NULL	,
	`category`	VARCHAR(255)	NOT NULL,
    FOREIGN KEY (STORE_NUMBER) REFERENCES `STORE` (STORE_NUMBER)
);

CREATE TABLE `Menus` (
	`menu_number`	INT	PRIMARY KEY AUTO_INCREMENT,
	`category_number`	INT	NOT NULL	,
	`menu_name`	VARCHAR(255)	NULL,
	`menu_img`	VARCHAR(255)	NULL,
	`menu_category`	VARCHAR(255)	NULL,
	`menu_content`	VARCHAR(255)	NULL,
    FOREIGN KEY (CATEGORY_NUMBER) REFERENCES `CATEGORIES` (CATEGORY_NUMBER)
);

CREATE TABLE `Orders` (
	`order_number`	INT	PRIMARY KEY AUTO_INCREMENT,
    `store_number`	INT NOT NULL,
	`order_address`	VARCHAR(255)	NOT NULL,
	`order_total_price`	INT	NOT NULL,
	`order_date`	DATE	NOT NULL,
    `order_state`	INT		NOT NULL,
    FOREIGN KEY (STORE_NUMBER) REFERENCES `STORE` (STORE_NUMBER)
);

CREATE TABLE `order_detail` (
	`order_detail_number`	INT	PRIMARY KEY AUTO_INCREMENT,
	`order_number`	INT	NOT NULL,
	`order_product_name`	VARCHAR(255)	NOT NULL,
	`order_quantity`	INT	NOT NULL,
    FOREIGN KEY (ORDER_NUMBER) REFERENCES `ORDERS` (ORDER_NUMBER)
);

CREATE TABLE `reviews` (
	`review_number`	INT	PRIMARY KEY AUTO_INCREMENT,
	`order_number`	INT	NOT NULL,
	`user_id`	VARCHAR(255)	NOT NULL,
	`review _rating`	INT	NULL,
	`review_date`	DATE	NOT NULL,
	`review_comments`	TEXT	NULL,
	`review_report`	BOOLEAN	NOT NULL,
    FOREIGN KEY (ORDER_NUMBER) REFERENCES `ORDERS` (ORDER_NUMBER)
);

CREATE TABLE `reviews_photos` (
	`review_number` INT	PRIMARY KEY AUTO_INCREMENT,
	`order_number`	INT,
	`review_photo`	VARCHAR(255)	NULL,
    FOREIGN KEY (REVIEW_NUMBER) REFERENCES `REVIEWS` (REVIEW_NUMBER)
);

CREATE TABLE `REVIEW_EVENT_NOTICE` (
	`STORE_NUMBER` INT,
	`REVIEW_NOTICE_PHOTO` VARCHAR(255) NULL,
    `REVIEW_NOTICE_TEXT`	TEXT	NULL,
	FOREIGN KEY (STORE_NUMBER) REFERENCES `STORE` (STORE_NUMBER)
);

# CREATE TABLE `period` (
# 	`period_number`	INT	PRIMARY KEY AUTO_INCREMENT,
# 	`daily_date`	DATE	NULL,
# 	`daily_sales`	INT	NULL
# );

# CREATE TABLE `period1` (
# 	`period_number`	INT	PRIMARY KEY AUTO_INCREMENT,
# 	`period_number2`	INT	NOT NULL,
# 	`month_sales`	DATE	NULL,
# 	`month_date`	DATE	NULL
# );

