## CREATION OF THE DATABASE ##
CREATE DATABASE db_project;
USE db_project;

## CREATION OF THE TABLES ##

CREATE TABLE `users` (
  `email` varchar(255) PRIMARY KEY,
  `type` ENUM ('superadmin', 'admin', 'employe', 'proprietaire'),
  `pwd` varchar(255),
  `full_name` varchar(255),
  `birthdate` timestamp,
  `address_id` int
);

CREATE TABLE `addresses` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `number` int,
  `street` varchar(255),
  `zip` int,
  `city` varchar(255),
  `country` varchar(255)
);

CREATE TABLE `stables` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `address_id` int
);

CREATE TABLE `horses` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `birthdate` datetime,
  `stable_id` int
);

CREATE TABLE `events` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255),
  `comment` varchar(255),
  `discipline` ENUM ('jumping', 'dressage', 'hunter', 'cross', 'other'),
  `start_date` datetime,
  `end_date` datetime,
  `type` ENUM ('lesson', 'competition', 'other'),
  `is_checked` boolean,
  `price` int,
  `max_subscribers` int,
  `creator_email` varchar(255),
  `location_id` int,
  `stable_id` int
);

CREATE TABLE `invoices` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `invoice_date` datetime,
  `is_paid` boolean,
  `payment_method` varchar(255),
  `due_to_email` varchar(255)
);

CREATE TABLE `location` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

## CONSTRAINTS ##

ALTER TABLE users ADD FOREIGN KEY (address_id) REFERENCES addresses(id);
ALTER TABLE horses ADD FOREIGN KEY (stable_id) REFERENCES stables(id);
ALTER TABLE stables ADD FOREIGN KEY (address_id) REFERENCES addresses(id);
ALTER TABLE `events` ADD FOREIGN KEY (stable_id) REFERENCES stables(id);
ALTER TABLE `events` ADD FOREIGN KEY (creator_email) REFERENCES users(email);
ALTER TABLE invoices ADD FOREIGN KEY (due_to_email) REFERENCES users(email);
ALTER TABLE `events` ADD FOREIGN KEY (location_id) REFERENCES location(id);

CREATE TABLE invoices_events (
	invoices_id int NOT NULL,
    events_id int NOT NULL,
    PRIMARY KEY (invoices_id, events_id)
);
ALTER TABLE invoices_events ADD FOREIGN KEY (invoices_id) REFERENCES invoices(id);
ALTER TABLE invoices_events ADD FOREIGN KEY (events_id) REFERENCES `events`(id);

CREATE TABLE horses_users(
	horses_id int NOT NULL,
    users_email varchar(255) NOT NULL,
    PRIMARY KEY (horses_id, users_email)
);
ALTER TABLE horses_users ADD FOREIGN KEY (horses_id) REFERENCES horses(id);
ALTER TABLE horses_users ADD FOREIGN KEY (users_email) REFERENCES users(email);

CREATE TABLE events_subscribers(
	events_id int NOT NULL,
    users_email varchar(255) NOT NULL, 
    subscription_date datetime,
    PRIMARY KEY (events_id, users_email )
);
ALTER TABLE events_subscribers ADD FOREIGN KEY (events_id) REFERENCES `events`(id);
ALTER TABLE events_subscribers ADD FOREIGN KEY (users_email) REFERENCES users(email);