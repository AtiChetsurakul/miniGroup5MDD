DROP DATABASE IF EXISTS airbnbmock;
CREATE DATABASE airbnbmock;
USE airbnbmock;
-- CREATE BY member of group 5 FOR miniproject on MDD course AT AIT thailand ON AUG 22
CREATE TABLE `user`(
`id` BIGINT NOT NULL AUTO_INCREMENT,
`userName` varchar(50) DEFAULT NULL ,
`email` varchar(50) NOT NULL ,
`phone_Number`varchar(50) NOT NULL ,
`passport_number` varchar(50) NULL,
`firstName` varchar(50) DEFAULT NULL,
`lastName` varchar(50) DEFAULT NULL,
`role` ENUM('renter','host','admin') DEFAULT 'renter',
`registerAt` DATETIME DEFAULT NOW(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`phone_Number`),
  UNIQUE KEY `userName` (`userName`),
  UNIQUE KEY `passport_number` (`passport_number`)
); -- ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `listing`(
`id` BIGINT NOT NULL AUTO_INCREMENT , 
`type` ENUM('flat','house','condo','else') DEFAULT 'house',
 `share_space`  ENUM('share_space' , 'wholeplace') DEFAULT 'wholeplace',
 `location` varchar(50) NOT NULL ,
 max_occupancy INT(100)  DEFAULT NULL, 
 no_of_bedroom INT(100)  DEFAULT 3 , 
 no_of_bathroom INT(100)  DEFAULT 1, 
 has_tv BOOL DEFAULT TRUE, 
 has_ac BOOL DEFAULT TRUE,
 has_heater BOOL DEFAULT TRUE, 
 has_internet BOOL DEFAULT TRUE, 
 createdAt DATETIME DEFAULT NOW(), 
 updatedAt DATETIME DEFAULT NULL,
 hostId BIGINT NOT NULL, 
 address text  NOT NULL,
 latitude Decimal(8,6) NULL, 
 longitude Decimal(9,6) NULL,
 rate_per_day DECIMAL(10,2) DEFAULT NULL,
 `status` ENUM('suspend','list') DEFAULT 'list',
 approval_status ENUM('y','n','new') DEFAULT 'new' ,
 PRIMARY KEY (`id`),
 KEY `fk_list_by` (`hostId`),
 CONSTRAINT `fk_list_by` FOREIGN KEY (`hostId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
 );

 CREATE TABLE booking (
 `id` BIGINT NOT NULL AUTO_INCREMENT ,
 user_id BIGINT NOT NULL,
 listing_id BIGINT NOT NULL,
booking_date DATETIME DEFAULT NOW(),
no_of_days INT(100)  DEFAULT 1,
start_date DATETIME NOT NULL,
end_date DATETIME NOT NULL,
no_of_people INT(100)  DEFAULT 1,
amount DECIMAL(10,2) NOT NULL, 
`reserve_status` ENUM('approved','rejected','pending'),
`billing_status` ENUM('paid','pending','canceled'),
payment_medium varchar(50) DEFAULT NULL,
paid_to_host DECIMAL(10,2) NOT NULL, 
fee_to_company DECIMAL(10,2) NOT NULL, 
PRIMARY KEY (`id`),
KEY `fk_rent_by` (`user_id`),
KEY `fk_list_id` (`listing_id`),
CONSTRAINT `fk_rent_by` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_list_id` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE)
;

CREATE TABLE review (
id BIGINT NOT NULL AUTO_INCREMENT,
bookingId BIGINT NOT NULL,
Rating ENUM('1','2','3','4','5'),
`comment` text  NULL,
PRIMARY KEY (`id`),
KEY `fk_booking_id` (`bookingId`),
CONSTRAINT `fk_booking_id` FOREIGN KEY (`bookingId`) REFERENCES `booking` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE message(
id BIGINT NOT NULL AUTO_INCREMENT,
sourceId BIGINT NOT NULL,
 targetId BIGINT NOT NULL,
 message text NOT NULL,
 createdAt DATETIME DEFAULT NOW(),
`status` ENUM('received' , 'read'),
updatedAt DATETIME DEFAULT NULL,
PRIMARY KEY (`id`),
KEY `fk_source_id` (`sourceId`),
KEY `fk_target_id` (`targetId`),
CONSTRAINT `fk_source_id` FOREIGN KEY (`sourceId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `fk_target_id` FOREIGN KEY (`targetId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 0 row(s) affected, 2 warning(s): 1681 Integer display width is deprecated and will be removed in a future release. 1681 Integer display width is deprecated and will be removed in a future release.

