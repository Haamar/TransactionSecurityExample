DROP DATABASE if EXISTS EXAMPLE;
CREATE DATABASE EXAMPLE;
USE EXAMPLE;

DROP table if EXISTS orders ;
CREATE TABLE `example`.`orders` ( `orderNumber` INT NOT NULL , `orderDate` DATE NOT NULL , `requiredDate` DATE NULL , `shippedDate` DATE NULL , `customerNumber` INT NOT NULL , PRIMARY KEY (`orderNumber`));

DROP table if EXISTS orderdetails;
CREATE TABLE `example`.`orderdetails` ( `orderNumber` INT NOT NULL , `productCode` TEXT NOT NULL , `quantity` INT NOT NULL , `price` INT NOT NULL , PRIMARY KEY (`orderNumber`, `productCode`(4)));