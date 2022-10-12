USE db_project;

## CREATE ADDRESSES ##
INSERT INTO addresses VALUES (1, 2000, "Alton Parkway", 92606, "Irvine", "United States of America");
INSERT INTO addresses VALUES (2, 1001, "Claremont Street", 92606, "Irvine", "United States of America");
INSERT INTO addresses VALUES (3, 25200, "Trabuco Rd", 92630, "Lake Forest", "United States of America");
INSERT INTO addresses VALUES (4, 1, "Irvine Park Rd", 92869, "Orange", "United States of America");


## CREATE USERS ##
INSERT INTO users VALUES ("victor@gmail.com", "admin", "thisisapassword", "Victor ROBIC", "2002-10-05", 1);
INSERT INTO users VALUES ("jean@gmail.com", "proprietaire", "otherpassword", "Jean-Baptiste ABRASSART", "2002-11-20", 2);

## CREATE STABLES ##
INSERT INTO stables VALUES (1, "Serrano Creek Ranch Equestrian", 3);
INSERT INTO stables VAlUES (2, "Peacock Hill Equestrian Center", 4);

## CREATE LOCATION ##
INSERT INTO location VALUES (1, "Principal Area");
INSERT INTO location VALUES (2, "Secondary Area");

## CREATE HORSES ##
INSERT INTO horses VALUES (1, "Vagabond", "2011-08-01", 2);
INSERT INTO horses VALUES (2, "Star", "2013-09-11", 1);

## CREATE LINK BETWEEN horses and users ##
INSERT INTO horses_users VALUES (1, "jean@gmail.com");
INSERT INTO horses_users VALUES (2, "victor@gmail.com");

## CREATE EVENTS ##
INSERT INTO `events` VALUES (1, "Jumping Lesson", "Limited to 3 riders", "jumping","2022-10-25 11:00:00", "2022-10-25 12:00:00", "lesson", false, "30", 3, "victor@gmail.com", 1, 1);
INSERT INTO `events` VALUES (2, "Dressage Lesson", "Limited to 2 riders", "dressage","2022-10-27 09:00:00", "2022-10-27 10:30:00", "lesson", true, "45", 2, "jean@gmail.com", 1, 2);

## CREATE LINK BETWEEN events and subscribers ##
INSERT INTO events_subscribers VALUES (1, "victor@gmail.com", "2022-10-11 18:45:00");
INSERT INTO events_subscribers VALUES (1, "jean@gmail.com", "2022-10-13 17:50:00");
INSERT INTO events_subscribers VALUES (2, "jean@gmail.com", "2022-10-13 17:55:00");

## CREATE INVOICES ##
INSERT INTO invoices VALUES (1, "2022-10-01", false, "CB", "victor@gmail.com");
INSERT INTO invoices VALUES (2, "2022-10-01", false, "CASH", "jean@gmail.com");

## CREATE LINK BETWEEN invoices and events ##
INSERT INTO invoices_events VALUES (1, 1);
INSERT INTO invoices_events VALUES (2, 1);
INSERT INTO invoices_events VALUES (2, 2);


