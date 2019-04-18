/*
 Navicat Premium Data Transfer

 Source Server         : local_db
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : bidfax

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 04/18/2019 14:56:43 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `airbag`
-- ----------------------------
DROP TABLE IF EXISTS `airbag`;
CREATE TABLE `airbag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `airbag`
-- ----------------------------
BEGIN;
INSERT INTO `airbag` VALUES ('1', 'intact'), ('2', 'deployed');
COMMIT;

-- ----------------------------
--  Table structure for `auction`
-- ----------------------------
DROP TABLE IF EXISTS `auction`;
CREATE TABLE `auction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `selling_branch` varchar(50) DEFAULT NULL,
  `auction_type_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) NOT NULL,
  `buy_now_price` bigint(6) DEFAULT NULL,
  `pre_bid_price` bigint(6) DEFAULT NULL,
  `final_bid` bigint(6) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `sold_on_auction_type_id` int(11) DEFAULT NULL,
  `sold_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auction_type_id` (`auction_type_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `currency_id` (`currency_id`),
  KEY `sold_on_auction_type_id` (`sold_on_auction_type_id`),
  KEY `sold_status_id` (`sold_status_id`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`auction_type_id`) REFERENCES `auction_type` (`id`),
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `auction_ibfk_3` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  CONSTRAINT `auction_ibfk_4` FOREIGN KEY (`sold_on_auction_type_id`) REFERENCES `auction_type` (`id`),
  CONSTRAINT `auction_ibfk_5` FOREIGN KEY (`sold_status_id`) REFERENCES `sold_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auction`
-- ----------------------------
BEGIN;
INSERT INTO `auction` VALUES ('1', '2018-12-13 15:00:00', 'Texas', 'Texas selling branch', '1', '1', '5000', '3700', null, '1', null, null), ('2', '2018-12-20 14:00:00', 'NY', 'NY selling branch', '2', '2', '7400', '4000', null, '1', null, null), ('3', '2018-12-14 00:00:00', 'NY', 'NY selling branch', '1', '3', '8100', '6000', null, '1', null, null), ('4', '2018-12-27 10:00:00', 'Texas', 'Texas selling branch', '1', '4', '25000', '15000', null, '1', null, null), ('5', '2018-12-24 17:30:00', 'Texas', 'Texas selling branch', '2', '5', '23000', '14500', null, '1', null, null), ('6', '2018-12-12 15:45:00', 'Texas', 'Texas selling branch', '1', '6', '3000', '2200', null, '1', null, null), ('7', '2018-12-15 12:15:00', 'NY', 'NY selling branch', '2', '7', '18500', '15300', null, '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `auction_type`
-- ----------------------------
DROP TABLE IF EXISTS `auction_type`;
CREATE TABLE `auction_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auction_type`
-- ----------------------------
BEGIN;
INSERT INTO `auction_type` VALUES ('1', 'Live auction'), ('2', 'Timed auction'), ('3', 'Buy now');
COMMIT;

-- ----------------------------
--  Table structure for `body_style`
-- ----------------------------
DROP TABLE IF EXISTS `body_style`;
CREATE TABLE `body_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `body_style`
-- ----------------------------
BEGIN;
INSERT INTO `body_style` VALUES ('1', 'Atv'), ('2', 'Cab Chassis 2 Door'), ('3', 'Cab Chassis 4 Door'), ('4', 'Cargo Van'), ('5', 'Convertible 2 Door'), ('6', 'Coupe 2 Door'), ('7', 'Coupe 3 Door'), ('8', 'Cruiser'), ('9', 'Cutaway 2 Door'), ('10', 'Dirt Bike'), ('11', 'Enduro'), ('12', 'Hatchback 2 Door'), ('13', 'Hatchback 4 Door'), ('14', 'Incomplete Pickup 2 Door'), ('15', 'Pickup 2 Door'), ('16', 'Pickup 4 Door'), ('17', 'Scooter'), ('18', 'Sedan 4 Door'), ('19', 'Side By Side'), ('20', 'Sport'), ('21', 'Sport Utility Vehicle'), ('22', 'Sport Utility Vehicle 2 Door'), ('23', 'Sport Utility Vehicle 4 Door'), ('24', 'Straight Truck'), ('25', 'Straight Truck 2 Dr'), ('26', 'Suv 4 Door'), ('27', 'Touring'), ('28', 'Tractor Trk (diesel)'), ('29', 'Tractor Truck'), ('30', 'Traditional'), ('31', 'Van'), ('32', 'Van Cargo 3 Door'), ('33', 'Van Cargo 4 Door'), ('34', 'Van Cargo 5 Door'), ('35', 'Van Passenger 3 Door'), ('36', 'Van Passenger 4 Door'), ('37', 'Van Passenger 5 Door'), ('38', 'Wagon 2 Door'), ('39', 'Wagon 4 Door');
COMMIT;

-- ----------------------------
--  Table structure for `country_of_origin`
-- ----------------------------
DROP TABLE IF EXISTS `country_of_origin`;
CREATE TABLE `country_of_origin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `country_of_origin`
-- ----------------------------
BEGIN;
INSERT INTO `country_of_origin` VALUES ('1', 'Austria'), ('2', 'Belgium'), ('3', 'Canada'), ('4', 'Finland'), ('5', 'Germany'), ('6', 'India'), ('7', 'Indonesia'), ('8', 'Italy'), ('9', 'Japan'), ('10', 'Korea, Republic Of'), ('11', 'Mexico'), ('12', 'Sweden'), ('13', 'Taiwan (republic Of China)'), ('14', 'Thailand'), ('15', 'United Kingdom'), ('16', 'United States'), ('17', 'Unknown'), ('18', 'Vietnam'), ('19', 'China, People\'s Republic Of'), ('20', 'Korea, Democratic People\'s Republic Of');
COMMIT;

-- ----------------------------
--  Table structure for `currency`
-- ----------------------------
DROP TABLE IF EXISTS `currency`;
CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(10) NOT NULL,
  `sign` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `currency`
-- ----------------------------
BEGIN;
INSERT INTO `currency` VALUES ('1', 'United States Dollar', 'USD', '$');
COMMIT;

-- ----------------------------
--  Table structure for `damage`
-- ----------------------------
DROP TABLE IF EXISTS `damage`;
CREATE TABLE `damage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `damage`
-- ----------------------------
BEGIN;
INSERT INTO `damage` VALUES ('1', 'All Over'), ('2', 'Bio Hazard'), ('3', 'Cash-4-clunker'), ('4', 'Electrical'), ('5', 'Engine Burn'), ('6', 'Engine Damage'), ('7', 'Exterior Burn'), ('8', 'Flood'), ('9', 'Frame'), ('10', 'Fresh Water'), ('11', 'Front & Rear'), ('12', 'Front End'), ('13', 'Hail'), ('14', 'Interior Burn'), ('15', 'Left & Right'), ('16', 'Left Front'), ('17', 'Left Rear'), ('18', 'Left Side'), ('19', 'Mechanical'), ('20', 'None'), ('21', 'Rear'), ('22', 'Repossession'), ('23', 'Right Front'), ('24', 'Right Rear'), ('25', 'Right Side'), ('26', 'Rollover'), ('27', 'Roof'), ('28', 'Storm Damage'), ('29', 'Strip'), ('30', 'Suspension'), ('31', 'Theft'), ('32', 'Total Burn'), ('33', 'Transmission'), ('34', 'Undercarriage'), ('35', 'Unknown'), ('36', 'Vandalized'), ('37', 'Collision');
COMMIT;

-- ----------------------------
--  Table structure for `distance_measure`
-- ----------------------------
DROP TABLE IF EXISTS `distance_measure`;
CREATE TABLE `distance_measure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `distance_measure`
-- ----------------------------
BEGIN;
INSERT INTO `distance_measure` VALUES ('1', 'mi'), ('2', 'km');
COMMIT;

-- ----------------------------
--  Table structure for `drive_line_type`
-- ----------------------------
DROP TABLE IF EXISTS `drive_line_type`;
CREATE TABLE `drive_line_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `drive_line_type`
-- ----------------------------
BEGIN;
INSERT INTO `drive_line_type` VALUES ('1', 'All-wheel Drive'), ('2', 'Four Wheel Drive'), ('3', 'Front Wheel Drive'), ('4', 'Rear Wheel Drive');
COMMIT;

-- ----------------------------
--  Table structure for `engine_volume`
-- ----------------------------
DROP TABLE IF EXISTS `engine_volume`;
CREATE TABLE `engine_volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `engine_volume`
-- ----------------------------
BEGIN;
INSERT INTO `engine_volume` VALUES ('1', '0.4'), ('2', '0.5'), ('3', '0.6'), ('4', '0.7'), ('5', '0.8'), ('6', '0.9'), ('7', '1'), ('8', '1.1'), ('9', '1.2'), ('10', '1.3'), ('11', '1.4'), ('12', '1.5'), ('13', '1.6'), ('14', '1.7'), ('15', '1.8'), ('16', '1.9'), ('17', '2'), ('18', '2.1'), ('19', '2.2'), ('20', '2.3'), ('21', '2.4'), ('22', '2.5'), ('23', '2.6'), ('24', '2.7'), ('25', '2.8'), ('26', '2.9'), ('27', '3'), ('28', '3.1'), ('29', '3.2'), ('30', '3.3'), ('31', '3.4'), ('32', '3.5'), ('33', '3.6'), ('34', '3.7'), ('35', '3.8'), ('36', '3.9'), ('37', '4'), ('38', '4.1'), ('39', '4.2'), ('40', '4.3'), ('41', '4.4'), ('42', '4.5'), ('43', '4.6'), ('44', '4.7'), ('45', '4.8'), ('46', '4.9'), ('47', '5'), ('48', '5.1'), ('49', '5.2'), ('50', '5.3'), ('51', '5.4'), ('52', '5.5'), ('53', '5.6'), ('54', '5.7'), ('55', '5.8'), ('56', '5.9'), ('57', '6'), ('58', '6.1'), ('59', '6.2'), ('60', '6.3'), ('61', '6.4'), ('62', '6.5'), ('63', '6.6'), ('64', '6.7'), ('65', '6.8'), ('66', '6.9'), ('67', '7'), ('68', '7.1'), ('69', '7.2'), ('70', '7.3'), ('71', '7.4'), ('72', '7.5'), ('73', '7.6'), ('74', '7.7'), ('75', '7.8'), ('76', '7.9'), ('77', '8'), ('78', '8.1'), ('79', '8.2'), ('80', '8.3'), ('81', '8.4'), ('82', '8.5'), ('83', '8.6'), ('84', '8.7'), ('85', '8.8'), ('86', '8.9'), ('87', '9'), ('88', '9.1'), ('89', '9.2'), ('90', '9.3'), ('91', '9.4'), ('92', '9.5'), ('93', '9.6'), ('94', '9.7'), ('95', '9.8'), ('96', '9.9'), ('97', '10'), ('98', '10.1'), ('99', '10.2'), ('100', '10.3'), ('101', '10.4'), ('102', '10.5'), ('103', '10.6'), ('104', '10.7'), ('105', '10.8'), ('106', '10.9'), ('107', '11'), ('108', '11.1'), ('109', '11.2'), ('110', '11.3'), ('111', '11.4'), ('112', '11.5'), ('113', '11.6'), ('114', '11.7'), ('115', '11.8'), ('116', '11.9'), ('117', '12'), ('118', '0');
COMMIT;

-- ----------------------------
--  Table structure for `exterior_color`
-- ----------------------------
DROP TABLE IF EXISTS `exterior_color`;
CREATE TABLE `exterior_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `exterior_color`
-- ----------------------------
BEGIN;
INSERT INTO `exterior_color` VALUES ('1', 'Beige'), ('2', 'Black'), ('3', 'Blue'), ('4', 'Brown'), ('5', 'Burgundy'), ('6', 'Champagne'), ('7', 'Cream'), ('8', 'Dark Blue'), ('9', 'Gold'), ('10', 'Gray'), ('11', 'Green'), ('12', 'Light Blue'), ('13', 'Maroon'), ('14', 'Navy'), ('15', 'Orange'), ('16', 'Pewter'), ('17', 'Purple'), ('18', 'Red'), ('19', 'Silver'), ('20', 'Tan'), ('21', 'Teal'), ('22', 'Turquoise'), ('23', 'White'), ('24', 'Yellow');
COMMIT;

-- ----------------------------
--  Table structure for `fuel_type`
-- ----------------------------
DROP TABLE IF EXISTS `fuel_type`;
CREATE TABLE `fuel_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `fuel_type`
-- ----------------------------
BEGIN;
INSERT INTO `fuel_type` VALUES ('1', 'Diesel'), ('2', 'Electric'), ('3', 'Flexible Fuel'), ('4', 'Gasoline'), ('5', 'Hybrid'), ('6', 'Other'), ('7', 'Unknown');
COMMIT;

-- ----------------------------
--  Table structure for `interior_color`
-- ----------------------------
DROP TABLE IF EXISTS `interior_color`;
CREATE TABLE `interior_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `interior_color`
-- ----------------------------
BEGIN;
INSERT INTO `interior_color` VALUES ('1', 'Beige'), ('2', 'Black'), ('3', 'Blue'), ('4', 'Brown'), ('5', 'Burgundy'), ('6', 'Champagne'), ('7', 'Cream'), ('8', 'Dark Brown'), ('9', 'Gray'), ('10', 'Green'), ('11', 'Maroon'), ('12', 'Red'), ('13', 'Silver'), ('14', 'Tan'), ('15', 'Teal'), ('16', 'White'), ('17', 'Yellow');
COMMIT;

-- ----------------------------
--  Table structure for `keys_presence`
-- ----------------------------
DROP TABLE IF EXISTS `keys_presence`;
CREATE TABLE `keys_presence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `presence` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `keys_presence`
-- ----------------------------
BEGIN;
INSERT INTO `keys_presence` VALUES ('1', 'Present'), ('2', 'Absent');
COMMIT;

-- ----------------------------
--  Table structure for `make`
-- ----------------------------
DROP TABLE IF EXISTS `make`;
CREATE TABLE `make` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `priority` enum('1','0') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `make`
-- ----------------------------
BEGIN;
INSERT INTO `make` VALUES ('1', '1988', null), ('2', '2-g', null), ('3', '4 Star', null), ('4', '5 Star', null), ('5', '5th Wheel', null), ('6', 'Action Equipment', null), ('7', 'Acura', '1'), ('8', 'Adly', null), ('9', 'Advance', null), ('10', 'Aero Cub', null), ('11', 'Aerolite', null), ('12', 'Airstream', null), ('13', 'Albin', null), ('14', 'Alfa Romeo', '1'), ('15', 'Aliner', null), ('16', 'Aljo', null), ('17', 'Allegro', null), ('18', 'Alpenlite', null), ('19', 'Alpine', null), ('20', 'Alumasky', null), ('21', 'Alumatech', null), ('22', 'Alumaweld', null), ('23', 'Aluminum', null), ('24', 'Am General', null), ('25', 'American General', null), ('26', 'American Motors', null), ('27', 'Amf', null), ('28', 'Anderson', null), ('29', 'Apr15', null), ('30', 'Aprilia', null), ('31', 'Arctic Cat', null), ('32', 'Argosy', null), ('33', 'Arising', null), ('34', 'Artic Cat', null), ('35', 'Aspen Trail', null), ('36', 'Aston Martin', '1'), ('37', 'Atc', null), ('38', 'Audi', '1'), ('39', 'Bad Boy Off Road', null), ('40', 'Bashan', null), ('41', 'Bayliner', null), ('42', 'Beachcraft', null), ('43', 'Belshe', null), ('44', 'Beneteau', null), ('45', 'Bennche', null), ('46', 'Benson Truck Bodies', null), ('47', 'Bentley', '1'), ('48', 'Bison', null), ('49', 'Blue Bird', null), ('50', 'Blue Star', null), ('51', 'Bmw', '1'), ('52', 'Bobcat', null), ('53', 'Bombardier', null), ('54', 'Boss Hoss', null), ('55', 'Brenner Tank Inc', null), ('56', 'British', null), ('57', 'Broce Sweeper', null), ('58', 'Bsa', null), ('59', 'Buell', null), ('60', 'Buick', '1'), ('61', 'Buick Envision', null), ('62', 'Butler', null), ('63', 'C/s Trailer', null), ('64', 'Cadillac', '1'), ('65', 'Cajun', null), ('66', 'Can-am', null), ('67', 'Cape Craft', null), ('68', 'Cap-horn', null), ('69', 'Caravan', null), ('70', 'Carolina Skiff', null), ('71', 'Carry On', null), ('72', 'Carson', null), ('73', 'Case', null), ('74', 'Case-international', null), ('75', 'Catalina', null), ('76', 'Caterpillar', null), ('77', 'Cavalier', null), ('78', 'Cedar Creek', null), ('79', 'Centurion', null), ('80', 'Century', null), ('81', 'Chaparral', null), ('82', 'Chapparal', null), ('83', 'Cherokee', null), ('84', 'Chevrolet', '1'), ('85', 'Chevy', null), ('86', 'Chief Ez Liner', null), ('87', 'Chris Craft', null), ('88', 'Chrysler', null), ('89', 'Circ', null), ('90', 'Citation', null), ('91', 'Clipper', null), ('92', 'Club Car', null), ('93', 'Coachman', null), ('94', 'Coachmen', null), ('95', 'Coachmen R', null), ('96', 'Coleman', null), ('97', 'Comfad', null), ('98', 'Conquest', null), ('99', 'Cougar', null), ('100', 'Covered Wagon', null), ('101', 'Crest Iii', null), ('102', 'Crestliner', null), ('103', 'Crossroads', null), ('104', 'Crownline', null), ('105', 'Cruiser', null), ('106', 'Cruisers Yachts', null), ('107', 'Custom', null), ('108', 'Cynergy', null), ('109', 'Daewoo', '1'), ('110', 'Datsun', null), ('111', 'Dct', null), ('112', 'Delta Manufacturing Inc', null), ('113', 'Diamond', null), ('114', 'Diamond Builder', null), ('115', 'Dodge', '1'), ('116', 'Doepker Inds Itd', null), ('117', 'Dominatorx', null), ('118', 'Dorsey Trailers', null), ('119', 'Doubletree', null), ('120', 'Dragon Esp Ltd', null), ('121', 'Ducati', '1'), ('122', 'Duracraft', null), ('123', 'Dutchman', null), ('124', 'Dutchmen', null), ('125', 'Eagle', null), ('126', 'Ebbtide', null), ('127', 'Eclipse', null), ('128', 'Edgemarine', null), ('129', 'Equipment', null), ('130', 'Equipment Pro Inc', null), ('131', 'Evergreen Rv', null), ('132', 'Everlite Inc', null), ('133', 'Evinrude', null), ('134', 'Evobus', null), ('135', 'E-z Dumper', null), ('136', 'Ez Go', null), ('137', 'Ez-go', null), ('138', 'Fabbro Marine', null), ('139', 'Fabrique', null), ('140', 'Fan', null), ('141', 'Featherlite Mfg Inc', null), ('142', 'Ferrari', '1'), ('143', 'Fiat', null), ('144', 'Fift', null), ('145', 'Fisher', null), ('146', 'Flagstaff', null), ('147', 'Flee', null), ('148', 'Fleetwood', null), ('149', 'Fontaine Trailer Co', null), ('150', 'Ford', '1'), ('151', 'Fore', null), ('152', 'Forest Riv', null), ('153', 'Forest River', null), ('154', 'Forest Rvr', null), ('155', 'Formula', null), ('156', 'Four Winns', null), ('157', 'Frame', null), ('158', 'Frame Machine', null), ('159', 'Freedom', null), ('160', 'Freestlye', null), ('161', 'Freightliner', null), ('162', 'Freightliner', null), ('163', 'Frontier', null), ('164', 'Fruehauf', null), ('165', 'G3', null), ('166', 'Gator', null), ('167', 'Gekko Sport', null), ('168', 'Genesis', null), ('169', 'Genie', null), ('170', 'Genuine Scooter Co.', null), ('171', 'Geo', null), ('172', 'Georgie Boy', null), ('173', 'Glendale', null), ('174', 'Global Electric Motors', null), ('175', 'Gm', null), ('176', 'Gmc', null), ('177', 'Godfrey', null), ('178', 'Golf Cart', null), ('179', 'Grady White', null), ('180', 'Grand Design', null), ('181', 'Grand Desn', null), ('182', 'Great Dane Trailers', null), ('183', 'Gtr', null), ('184', 'Gulfstream', null), ('185', 'H&h', null), ('186', 'Harbor Freight Utility', null), ('187', 'Harley', null), ('188', 'Harley Davidson', '1'), ('189', 'Harley-davidson', '0'), ('190', 'Harris', null), ('191', 'Haul Mark Ind', null), ('192', 'Hawke', null), ('193', 'Hawkeye', null), ('194', 'Heartland', null), ('195', 'Heil Co', null), ('196', 'Herth', null), ('197', 'Hino', null), ('198', 'Holiday Rambler', null), ('199', 'Homemade', null), ('200', 'Honda', '1'), ('201', 'Hornet', null), ('202', 'Horse Creek Mfg', null), ('203', 'Hudson Bros Trailer Mfg', null), ('204', 'Hummer', '1'), ('205', 'Hurricane', null), ('206', 'Husqvarna', null), ('207', 'Hyd', null), ('208', 'Hydra-sports', null), ('209', 'Hyosung', null), ('210', 'Hyster', null), ('211', 'Hyundai', '1'), ('212', 'Hyundai Steel Industries', null), ('213', 'Ic Corporation', null), ('214', 'Imperial', null), ('215', 'Imperial Tr Ser', null), ('216', 'Indian Motorcycle Co.', null), ('217', 'Infiniti', '1'), ('218', 'Innovative', null), ('219', 'Integrity', null), ('220', 'International', null), ('221', 'Intrv', null), ('222', 'Iron Panther', null), ('223', 'Isuzu', null), ('224', 'Italica', null), ('225', 'Itasca', null), ('226', 'Jaguar', '1'), ('227', 'Jayco', null), ('228', 'Jeep', '1'), ('229', 'Jiangsu Baodiao', null), ('230', 'Jig', null), ('231', 'John Deere', null), ('232', 'Johnway', null), ('233', 'Kamran', null), ('234', 'Kaufman', null), ('235', 'Kawasaki', null), ('236', 'Kawaskai', null), ('237', 'Kawk', null), ('238', 'Kendon', null), ('239', 'Kentucky Mfg', null), ('240', 'Kenworth', null), ('241', 'Key West', null), ('242', 'Keys', null), ('243', 'Keystone', null), ('244', 'Keystone Rv', null), ('245', 'Keystone Sprinter', null), ('246', 'Kg Sports', null), ('247', 'Kia', '1'), ('248', 'Kingston', null), ('249', 'Knight', null), ('250', 'Kodiak', null), ('251', 'Komfort', null), ('252', 'Ktm', null), ('253', 'Kymco Usa Inc', null), ('254', 'Kz', null), ('255', 'Kz Inc', null), ('256', 'K-z Inc', null), ('257', 'Lamborghini', '1'), ('258', 'Lance', null), ('259', 'Land Rover', '1'), ('260', 'Laredo', null), ('261', 'Lark', null), ('262', 'Larson', null), ('263', 'Layto', null), ('264', 'Layton', null), ('265', 'Lazy Daze', null), ('266', 'Lexus', '1'), ('267', 'Liberty', null), ('268', 'Lincoln', null), ('269', 'Load King', null), ('270', 'Long', null), ('271', 'Look', null), ('272', 'Look Trailers', null), ('273', 'Lotus', null), ('274', 'M. V. Agusta', null), ('275', 'Mack', null), ('276', 'Magic Tilt Boat Trailer', null), ('277', 'Magnolia', null), ('278', 'Magnum', null), ('279', 'Mako', null), ('280', 'Malibu', null), ('281', 'Mariah', null), ('282', 'Maserati', '1'), ('283', 'Maxum', null), ('284', 'Mazda', '1'), ('285', 'Mckenzie', null), ('286', 'Mclaren Automotive', null), ('287', 'Mega', null), ('288', 'Mercedes', '1'), ('289', 'Mercedes Benz', null), ('290', 'Mercedes-benz', null), ('291', 'Mercury', null), ('292', 'Miami Choppers', null), ('293', 'Migi', null), ('294', 'Military Truck', null), ('295', 'Millennium', null), ('296', 'Mini', null), ('297', 'Mirage', null), ('298', 'Misty Harbor', null), ('299', 'Mitsubishi', '1'), ('300', 'Mitsubishi Fuso Truck', null), ('301', 'Mobile Sweep', null), ('302', 'Monaco', null), ('303', 'Monon', null), ('304', 'Monterey', null), ('305', 'Moomba', null), ('306', 'Motor Coach Industries', null), ('307', 'Mtb', null), ('308', 'Nash', null), ('309', 'Neo', null), ('310', 'New Holland', null), ('311', 'Newmar', null), ('312', 'Nissan', '1'), ('313', 'Nissan Diesel', null), ('314', 'Northland', null), ('315', 'Norton', null), ('316', 'Novae Corp', null), ('317', 'Nu-wa', null), ('318', 'Oldsmobile', null), ('319', 'Open Range', null), ('320', 'Opnrd', null), ('321', 'Oshkosh Motor Truck Co.', null), ('322', 'Other', null), ('323', 'Pace American', null), ('324', 'Pace Arrow', null), ('325', 'Palo', null), ('326', 'Palomino', null), ('327', 'Passport', null), ('328', 'Peabody Itl Cor', null), ('329', 'Pearson', null), ('330', 'Performance', null), ('331', 'Peterbilt', null), ('332', 'Piaggio', null), ('333', 'Pierce Mfg. Inc.', null), ('334', 'Pihslang', null), ('335', 'Pilgrim', null), ('336', 'Pioneer', null), ('337', 'Pj', null), ('338', 'Pj 20ft Utility Traler', null), ('339', 'Plymouth', null), ('340', 'Polaris', null), ('341', 'Pontiac', '1'), ('342', 'Pontoon', null), ('343', 'Pontoone', null), ('344', 'Porsche', '1'), ('345', 'Prevost', null), ('346', 'Prinoth', null), ('347', 'Pro-liner', null), ('348', 'Prowler', null), ('349', 'Puma', null), ('350', 'Ram', null), ('351', 'Ranger', null), ('352', 'Raven', null), ('353', 'Ravens Metal Products Inc', null), ('354', 'Raymond', null), ('355', 'Rc', null), ('356', 'Red Oak', null), ('357', 'Redwood', null), ('358', 'Reliance Trailer Mfg', null), ('359', 'Rinker', null), ('360', 'Riviera Cruiser', null), ('361', 'Riya', null), ('362', 'Roadmaster Rail', null), ('363', 'Rockwood', null), ('364', 'Roketa', null), ('365', 'Roll Groover', null), ('366', 'Rolls Royce', null), ('367', 'Rolls-royce', null), ('368', 'Royal', null), ('369', 'Royal Enfield Motors', null), ('370', 'R-vision', null), ('371', 'Saab', null), ('372', 'Salem', null), ('373', 'Salvation Trailers', null), ('374', 'Sandpiper', null), ('375', 'Saturn', null), ('376', 'Scion', null), ('377', 'Scissor Lift', null), ('378', 'Sea Ray', null), ('379', 'Sea Sprite', null), ('380', 'Seadoo', null), ('381', 'Serro', null), ('382', 'Sgac', null), ('383', 'Shallow Sport Boat', null), ('384', 'Shasta', null), ('385', 'Silver Eagle', null), ('386', 'Skeeter', null), ('387', 'Ski-doo', null), ('388', 'Skyline', null), ('389', 'Slp', null), ('390', 'Smart', null), ('391', 'South Ga Cargo', null), ('392', 'Southwind', null), ('393', 'Sparta', null), ('394', 'Spartan', null), ('395', 'Spartan Motors', null), ('396', 'Spcn', null), ('397', 'Specially Constructed', null), ('398', 'Sportcraft', null), ('399', 'Springdale', null), ('400', 'Sprint', null), ('401', 'Sprinter', null), ('402', 'Starcraft', null), ('403', 'Stehl Tow', null), ('404', 'Sterling', null), ('405', 'Sterling Truck', null), ('406', 'Stewart & Stevenson', null), ('407', 'Stone', null), ('408', 'Stoner Super Cat', null), ('409', 'Stoughton Trailers Inc', null), ('410', 'Subaru', '1'), ('411', 'Summit', null), ('412', 'Sun Lite', null), ('413', 'Suncoast', null), ('414', 'Sundance', null), ('415', 'Sundowner', null), ('416', 'Sunnybrook', null), ('417', 'Sunset', null), ('418', 'Superior', null), ('419', 'Suzuki', '1'), ('420', 'Sylvan', null), ('421', 'Sym', null), ('422', 'Tango', null), ('423', 'Tao Tao', null), ('424', 'Terry', null), ('425', 'Tesla', '1'), ('426', 'Teton', null), ('427', 'Thermo Scientific', null), ('428', 'Thomas', null), ('429', 'Thor', null), ('430', 'Tige', null), ('431', 'Tigercat', null), ('432', 'Timber Creek', null), ('433', 'Time', null), ('434', 'Timpte', null), ('435', 'Top Hat', null), ('436', 'Toro', null), ('437', 'Tow', null), ('438', 'Toyota', '1'), ('439', 'Tracker', null), ('440', 'Trail Harbor', null), ('441', 'Trail King', null), ('442', 'Trailer', null), ('443', 'Trailer Boat', null), ('444', 'Trail-eze', null), ('445', 'Trail-lite', null), ('446', 'Trailmobile', null), ('447', 'Transcraft Corp', null), ('448', 'Triumph', null), ('449', 'Triumph Motorcycle', null), ('450', 'Trl', null), ('451', 'Tundra', null), ('452', 'Ud', null), ('453', 'U-haul International', null), ('454', 'United Express', null), ('455', 'United Express Line Inc', null), ('456', 'Universal Trail', null), ('457', 'Unverferth', null), ('458', 'Ural', null), ('459', 'Usts Mfg', null), ('460', 'Utility', null), ('461', 'Utility Trailer Mfg', null), ('462', 'Van Hool', null), ('463', 'Vanderhall', null), ('464', 'Vantage Dump Trailers', null), ('465', 'Venture', null), ('466', 'Vermeer', null), ('467', 'Vermeer Mfg. Co.', null), ('468', 'Vespa', null), ('469', 'Victory Motorcycles', null), ('470', 'Viking', null), ('471', 'Vip', null), ('472', 'Volkswagen', '1'), ('473', 'Volkswagon', null), ('474', 'Volvo', null), ('475', 'Wabash National Corp', null), ('476', 'Wanco', null), ('477', 'Weldcraft', null), ('478', 'Wellcraft', null), ('479', 'Wells', null), ('480', 'Wells Cargo', null), ('481', 'Western Star', null), ('482', 'Western Star/auto Car', null), ('483', 'Westward', null), ('484', 'White/gmc', null), ('485', 'Wilderness', null), ('486', 'Wildwood', null), ('487', 'Willys', null), ('488', 'Wilson Trailer Co', null), ('489', 'Winnebago', null), ('490', 'Wolf Island', null), ('491', 'Workhorse', null), ('492', 'Workhorse Custom Chassis', null), ('493', 'Xpress', null), ('494', 'Yacht', null), ('495', 'Yama', null), ('496', 'Yamaha', '1'), ('497', 'Yiben', null), ('498', 'Zero Motorcycles Inc', null), ('499', 'Zhng', null), ('500', 'Zieman', null), ('501', 'Zinger', null), ('502', 'Znen', null), ('503', 'Zodiac', null);
COMMIT;

-- ----------------------------
--  Table structure for `model`
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `make_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `make_id` (`make_id`),
  CONSTRAINT `model_ibfk_1` FOREIGN KEY (`make_id`) REFERENCES `make` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2031 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `model`
-- ----------------------------
BEGIN;
INSERT INTO `model` VALUES ('1', 'Grand Banks', '1'), ('2', 'Boat Trailer', '2'), ('3', 'Trailer', '3'), ('4', 'Frame Machine', '4'), ('5', 'Wrlf8289ws', '5'), ('6', 'Xlr Nitro36ti5', '5'), ('7', 'Utilty Trailer', '6'), ('8', '2.3cl', '7'), ('9', '2.5tl', '7'), ('10', '3.0cl', '7'), ('11', '3.2cl', '7'), ('12', '3.2tl', '7'), ('13', '3.5rl', '7'), ('14', 'Ilx', '7'), ('15', 'Integra', '7'), ('16', 'Legend', '7'), ('17', 'Mdx', '7'), ('18', 'Rdx', '7'), ('19', 'Rl', '7'), ('20', 'Rlx', '7'), ('21', 'Rsx', '7'), ('22', 'Slx', '7'), ('23', 'Tl', '7'), ('24', 'Tlx', '7'), ('25', 'Tsx', '7'), ('26', 'Vigor', '7'), ('27', 'Fox 50', '8'), ('28', 'Trailer', '9'), ('29', '160 Cub', '10'), ('30', 'Zoom 716fd', '11'), ('31', '26/so', '12'), ('32', '28', '12'), ('33', 'Excella', '12'), ('34', 'Flying Cloud', '12'), ('35', 'International', '12'), ('36', 'Other', '12'), ('37', 'Seren 23fb', '12'), ('38', 'Trailer', '12'), ('39', 'Travel Trailer', '12'), ('40', 'Alden Zephyr', '13'), ('41', 'Giulia', '14'), ('42', 'Gt', '14'), ('43', 'Milano', '14'), ('44', '250 Lt', '16'), ('45', 'Motor Home', '17'), ('46', '29rkdl', '18'), ('47', '6810', '20'), ('48', 'End Dump', '21'), ('49', 'Power Boat', '22'), ('50', 'Boat Trailer', '23'), ('51', 'Hummer', '24'), ('52', 'H1', '25'), ('53', 'Jeep', '26'), ('54', 'Sunfish', '27'), ('55', 'Trailer', '28'), ('56', 'Amigo', '29'), ('57', 'Rsv4\nShiver\nTuono', '30'), ('58', 'Shiver', '30'), ('59', 'Tuono', '30'), ('60', '400', '31'), ('61', 'Atv', '31'), ('62', 'F800 Th Rr', '31'), ('63', 'Prowler', '31'), ('64', 'Snowmobile', '31'), ('65', 'Vlx 700', '31'), ('66', 'Wildcat', '31'), ('67', 'Wildcat Trail Xt', '31'), ('68', 'Z580', '31'), ('69', 'Zr 800', '31'), ('70', '25ft', '32'), ('71', 'Enclosed Cargo', '33'), ('72', 'Trailer', '33'), ('73', 'Hdx Atv 700cc', '34'), ('74', 'At2780rlswe16', '35'), ('75', 'Db9', '36'), ('76', 'Qstab8516', '37'), ('77', '100', '38'), ('78', '4000', '38'), ('79', 'A3', '38'), ('80', 'A4', '38'), ('81', 'A4 Allroad', '38'), ('82', 'A5', '38'), ('83', 'A6', '38'), ('84', 'A7', '38'), ('85', 'A8', '38'), ('86', 'Allroad', '38'), ('87', 'New S4', '38'), ('88', 'Q3', '38'), ('89', 'Q5', '38'), ('90', 'Q7', '38'), ('91', 'R8', '38'), ('92', 'S3', '38'), ('93', 'S4', '38'), ('94', 'S5', '38'), ('95', 'S6', '38'), ('96', 'Tt', '38'), ('97', 'Stampede', '39'), ('98', 'Boat', '41'), ('99', 'Rendezvous', '41'), ('100', 'Trophy', '41'), ('101', 'Boat', '42'), ('102', 'Trailer', '43'), ('103', 'Spire', '45'), ('104', 'Flatbed', '46'), ('105', 'Continental', '47'), ('106', '310 Me', '48'), ('107', 'School Bus / Tran', '49'), ('108', 'Bus', '49'), ('109', '16x76 Tandum Axl', '50'), ('110', '128', '51'), ('111', '135', '51'), ('112', '2002', '51'), ('113', '228', '51'), ('114', '230xi', '51'), ('115', '318', '51'), ('116', '320', '51'), ('117', '323', '51'), ('118', '325', '51'), ('119', '328', '51'), ('120', '330', '51'), ('121', '335', '51'), ('122', '340', '51'), ('123', '428', '51'), ('124', '430i', '51'), ('125', '430xi', '51'), ('126', '435', '51'), ('127', '440i', '51'), ('128', '440xi', '51'), ('129', '525', '51'), ('130', '528', '51'), ('131', '528 Rims', '51'), ('132', '530', '51'), ('133', '535', '51'), ('134', '540', '51'), ('135', '545', '51'), ('136', '550', '51'), ('137', '640', '51'), ('138', '645', '51'), ('139', '650', '51'), ('140', '735', '51'), ('141', '740', '51'), ('142', '745', '51'), ('143', '750', '51'), ('144', '760', '51'), ('145', 'Activehybrid 3', '51'), ('146', 'F650', '51'), ('147', 'G650', '51'), ('148', 'I8', '51'), ('149', 'K1200', '51'), ('150', 'K1600', '51'), ('151', 'K75', '51'), ('152', 'M235i', '51'), ('153', 'M240i', '51'), ('154', 'M3', '51'), ('155', 'M4', '51'), ('156', 'M5', '51'), ('157', 'M6', '51'), ('158', 'R100', '51'), ('159', 'R1150', '51'), ('160', 'R1200', '51'), ('161', 'R80', '51'), ('162', 'S 1000', '51'), ('163', 'X1', '51'), ('164', 'X2', '51'), ('165', 'X3', '51'), ('166', 'X5', '51'), ('167', 'X6', '51'), ('168', 'Z3', '51'), ('169', 'Z4', '51'), ('170', 'S570 Skid Steer Loader', '52'), ('171', 'T590', '52'), ('172', 'T870', '52'), ('173', 'Sea Doo Gti', '53'), ('174', 'Outlander', '53'), ('175', 'Bhc-9', '54'), ('176', 'Tank', '55'), ('177', 'Mg', '56'), ('178', 'Jt350', '57'), ('179', 'Royal Star A50 R', '58'), ('180', 'Firebolt', '59'), ('181', 'Blast', '59'), ('182', 'Cascada', '60'), ('183', 'Century', '60'), ('184', 'Electra', '60'), ('185', 'Enclave', '60'), ('186', 'Encore', '60'), ('187', 'Envision', '60'), ('188', 'Lacrosse', '60'), ('189', 'Lesabre', '60'), ('190', 'Lucerne', '60'), ('191', 'Park Avenue', '60'), ('192', 'Rainier', '60'), ('193', 'Regal', '60'), ('194', 'Rendezvous', '60'), ('195', 'Riviera', '60'), ('196', 'Roadmaster', '60'), ('197', 'Skylark', '60'), ('198', 'Somerset', '60'), ('199', 'Special', '60'), ('200', 'Terraza', '60'), ('201', 'Verano', '60'), ('202', 'Misc Parts', '61'), ('203', 'Tanker', '62'), ('204', 'Allante', '64'), ('205', 'Ats', '64'), ('206', 'Brougham', '64'), ('207', 'Catera', '64'), ('208', 'Commercial Chassi', '64'), ('209', 'Ct6', '64'), ('210', 'Cts', '64'), ('211', 'Cts-v', '64'), ('212', 'Deville', '64'), ('213', 'Dts', '64'), ('214', 'Eldorado', '64'), ('215', 'Escalade', '64'), ('216', 'Seville', '64'), ('217', 'Srx', '64'), ('218', 'Sts', '64'), ('219', 'Sts-v', '64'), ('220', 'Xlr', '64'), ('221', 'Xt5', '64'), ('222', 'Xts', '64'), ('223', 'Boat', '65'), ('224', 'Commander', '66'), ('225', 'Commander Max', '66'), ('226', 'Defender', '66'), ('227', 'Maverick', '66'), ('228', 'Maverick Max', '66'), ('229', 'Maverick X3', '66'), ('230', 'Outlander', '66'), ('231', 'Spyder Roadster', '66'), ('232', 'Boat Trailer', '69'), ('233', 'Carolina Skiff 18\' J', '70'), ('234', '1 Axle', '71'), ('235', 'Trailerr', '71'), ('236', '26ft', '72'), ('237', 'Funr223fd', '72'), ('238', 'Cx31b', '73'), ('239', 'Tr270 Loader', '73'), ('240', '7120', '74'), ('241', 'Coachman', '75'), ('242', '211lc', '76'), ('243', '349fl', '76'), ('244', 'Gulf Stream', '77'), ('245', 'Silverback Gii', '78'), ('246', 'Concourse', '79'), ('247', 'Vortex', '81'), ('248', 'Cckt29bh', '83'), ('249', '4x4 Crewcab', '84'), ('250', 'Astro', '84'), ('251', 'Avalanche', '84'), ('252', 'Aveo', '84'), ('253', 'Beretta', '84'), ('254', 'Blazer', '84'), ('255', 'C10', '84'), ('256', 'C20', '84'), ('257', 'C30', '84'), ('258', 'C3500', '84'), ('259', 'C4500', '84'), ('260', 'C5500', '84'), ('261', 'Camaro', '84'), ('262', 'Caprice', '84'), ('263', 'Caprice / Impala', '84'), ('264', 'Captiva', '84'), ('265', 'Cavalier', '84'), ('266', 'Celebrity', '84'), ('267', 'City Express', '84'), ('268', 'Classic', '84'), ('269', 'Cobalt', '84'), ('270', 'Colorado', '84'), ('271', 'Corsica', '84'), ('272', 'Corvair', '84'), ('273', 'Corvette', '84'), ('274', 'Cruze', '84'), ('275', 'Cruze Limited', '84'), ('276', 'C-series', '84'), ('277', 'D30', '84'), ('278', 'El Camino', '84'), ('279', 'Equinox', '84'), ('280', 'Express G1500', '84'), ('281', 'Express G2500', '84'), ('282', 'Express G3500', '84'), ('283', 'Fleetline', '84'), ('284', 'G10', '84'), ('285', 'G20', '84'), ('286', 'G30', '84'), ('287', 'G3500', '84'), ('288', 'Geo Prizm', '84'), ('289', 'Gmt-400', '84'), ('290', 'Hhr', '84'), ('291', 'Impala', '84'), ('292', 'Impala Limited', '84'), ('293', 'K10', '84'), ('294', 'K1500 4x4 Crewcab', '84'), ('295', 'K20', '84'), ('296', 'K2500 Silverado', '84'), ('297', 'K3500 4x4 Crewcab', '84'), ('298', 'K3500 Silverado', '84'), ('299', 'Lumina', '84'), ('300', 'Malibu', '84'), ('301', 'Malibu Limited', '84'), ('302', 'Metro', '84'), ('303', 'Monte Carlo', '84'), ('304', 'Nova', '84'), ('305', 'P30', '84'), ('306', 'P30', '84'), ('307', 'Pick Up', '84'), ('308', 'R10', '84'), ('309', 'R30', '84'), ('310', 'S Truck', '84'), ('311', 'Silverado', '84'), ('312', 'Silverado 1500', '84'), ('313', 'Silverado Ld', '84'), ('314', 'Sonic', '84'), ('315', 'Spark', '84'), ('316', 'Spark Ev', '84'), ('317', 'Ss', '84'), ('318', 'Ssr', '84'), ('319', 'Suburban', '84'), ('320', 'Tahoe', '84'), ('321', 'Tahoe C1500', '84'), ('322', 'Tilt Master W5s042', '84'), ('323', 'Tracker', '84'), ('324', 'Trailblazer', '84'), ('325', 'Traverse', '84'), ('326', 'Trax', '84'), ('327', 'Uplander', '84'), ('328', 'V10', '84'), ('329', 'V20', '84'), ('330', 'Van', '84'), ('331', 'Venture', '84'), ('332', 'Volt', '84'), ('333', 'Corvette', '85'), ('334', 'Van', '85'), ('335', 'Frame Machine', '86'), ('336', '20\'-10\"', '87'), ('337', 'Sprint Sport', '166'), ('338', '200', '88'), ('339', '300', '88'), ('340', '300c', '88'), ('341', '300m', '88'), ('342', 'Aspen', '88'), ('343', 'Cirrus', '88'), ('344', 'Concorde', '88'), ('345', 'Crossfire', '88'), ('346', 'Fifth Avenue', '88'), ('347', 'Intrepid', '88'), ('348', 'Lebaron', '88'), ('349', 'Lhs', '88'), ('350', 'New Yorker', '88'), ('351', 'Pacifica', '88'), ('352', 'Prowler', '88'), ('353', 'Pt Cruiser', '88'), ('354', 'Sebring', '88'), ('355', 'Town & Country', '88'), ('356', 'Voyager', '88'), ('357', '12ft', '89'), ('358', '37z', '90'), ('359', 'Trailer', '91'), ('360', 'Golf Cart', '92'), ('361', 'Ds Electric', '92'), ('362', 'Std', '92'), ('363', 'Onward', '92'), ('364', 'Catalina', '93'), ('365', 'Clipm107ls', '93'), ('366', 'Shasta', '93'), ('367', 'Apex', '94'), ('368', 'Catalina', '94'), ('369', 'Catalina Travel Trailers', '94'), ('370', 'Chaparral', '94'), ('371', 'F550', '94'), ('372', 'Freedom Express', '94'), ('373', 'Travel Trailer', '94'), ('374', '285rk', '95'), ('375', '16cmptlr', '96'), ('376', 'Camper', '96'), ('377', 'Cheyenne', '96'), ('378', 'Flee 17ft', '96'), ('379', 'Latern', '96'), ('380', 'Man Fleetwood', '96'), ('381', 'Other', '96'), ('382', 'Santa Fe Fleetwood', '96'), ('383', 'Utility', '97'), ('384', 'Gulf Stream', '98'), ('385', 'C281efs', '99'), ('386', 'Pontoon', '101'), ('387', '1750 Fish Hawk', '102'), ('388', 'Pontoon', '102'), ('389', '30zinger', '103'), ('390', 'Kingston', '103'), ('391', 'Sunset27rb', '103'), ('392', 'Zinger Zt-250-rb', '103'), ('393', '225 Br', '104'), ('394', 'Fun Finder Fxs189fbr', '105'), ('395', 'Custom Built Motorcycle', '107'), ('396', 'Motorcycle', '107'), ('397', 'Trailer', '107'), ('398', 'Cargo Trailer', '108'), ('399', 'Lanos', '109'), ('400', 'Leganza', '109'), ('401', '710', '110'), ('402', 'As1610', '111'), ('403', 'Flatbed', '112'), ('404', '8.5 X 18ta\n8.5 X 18ta', '113'), ('405', '6x10', '114'), ('406', '3500 4x4 Crewcab', '115'), ('407', 'Avenger', '115'), ('408', 'B250 Ram Vans', '115'), ('409', 'Caliber', '115'), ('410', 'Caravan', '115'), ('411', 'Challenger', '115'), ('412', 'Charger', '115'), ('413', 'Coronet', '115'), ('414', 'Dakota', '115'), ('415', 'Dart', '115'), ('416', 'D-series', '115'), ('417', 'Durango', '115'), ('418', 'Grand Caravan', '115'), ('419', 'Intrepid', '115'), ('420', 'Journey', '115'), ('421', 'Magnum', '115'), ('422', 'Monaco', '115'), ('423', 'Neon', '115'), ('424', 'Nitro', '115'), ('425', 'Omni', '115'), ('426', 'Ram 1500', '115'), ('427', 'Ram 2500', '115'), ('428', 'Ram 3500', '115'), ('429', 'Ram 50', '115'), ('430', 'Ram 5500', '115'), ('431', 'Ram Van', '115'), ('432', 'Ram Wagon', '115'), ('433', 'Ramcharger', '115'), ('434', 'Spirit', '115'), ('435', 'Sprinter', '115'), ('436', 'Stratus', '115'), ('437', 'Trailer', '115'), ('438', 'Viper', '115'), ('439', 'W-series', '115'), ('440', 'Trailer', '116'), ('441', '800cc', '117'), ('442', 'Van', '118'), ('443', 'Mobile Suites', '119'), ('444', 'Dump', '120'), ('445', '750', '121'), ('446', '848', '121'), ('447', '999', '121'), ('448', 'Diavel', '121'), ('449', 'Hypermotard', '121'), ('450', 'M600', '121'), ('451', 'Monster', '121'), ('452', 'Multistrada', '121'), ('453', 'Panigale', '121'), ('454', 'Scrambler', '121'), ('455', 'Superbike', '121'), ('456', 'Xdiavel', '121'), ('457', '6x12 Trailer', '122'), ('458', 'Camper', '123'), ('459', '24qff', '124'), ('460', 'Aspen Trail', '124'), ('461', 'Cts 16', '124'), ('462', 'M1001', '124'), ('463', 'Sport', '124'), ('464', 'Travel Trailer', '124'), ('465', 'Victory Lane 5th Whl', '124'), ('466', 'Milan', '127'), ('467', 'Marlin', '128'), ('468', 'Gse 90d20p', '129'), ('469', 'Spirit', '130'), ('470', 'Igo', '131'), ('471', 'Dump', '132'), ('472', 'Boat', '133'), ('473', 'Setra', '134'), ('474', 'Ez 610dx', '135'), ('475', 'Golfcart', '136'), ('476', 'Golf Cart', '137'), ('477', 'Cape Horn', '138'), ('478', 'Carry On', '139'), ('479', 'Endura Max', '139'), ('480', 'Camp Trlr', '140'), ('481', 'California', '142'), ('482', '500', '143'), ('483', '500l', '143'), ('484', '500x', '143'), ('485', 'Spider', '143'), ('486', 'H Wheel Keystone 280 Rls', '144'), ('487', 'Camper', '148'), ('488', 'Caribou', '148'), ('489', 'Coleman Sunridge', '148'), ('490', 'Other', '148'), ('491', 'Pop Up', '148'), ('492', 'Popup', '148'), ('493', 'Prowler', '148'), ('494', 'Storm (ford F53)', '148'), ('495', 'Triumph', '148'), ('496', 'Tucson', '148'), ('497', 'Wild 8x25', '148'), ('498', 'Wilderness', '148'), ('499', 'Wilderness Travel Tr', '148'), ('500', 'Yukon 24x8', '148'), ('501', 'F350', '149'), ('502', 'Flatbed', '149'), ('503', '4 Door Sedan', '150'), ('504', 'Aerostar', '150'), ('505', 'Aspire', '150'), ('506', 'Bronco', '150'), ('507', 'Bronco Ii', '150'), ('508', 'C-max', '150'), ('509', 'Contour', '150'), ('510', 'Crown Victoria', '150'), ('511', 'Cutaway Van', '150'), ('512', 'E150', '150'), ('513', 'E350', '150'), ('514', 'E450', '150'), ('515', 'E550', '150'), ('516', 'Econoline', '150'), ('517', 'Ecosport', '150'), ('518', 'Edge', '150'), ('519', 'Escape', '150'), ('520', 'Escort', '150'), ('521', 'Excursion', '150'), ('522', 'Expedition', '150'), ('523', 'Explorer', '150'), ('524', 'Explorer Sport Tr', '150'), ('525', 'Explorer Sport Trac', '150'), ('526', 'F', '150'), ('527', 'F100', '150'), ('528', 'F150', '150'), ('529', 'F-150 Heritage', '150'), ('530', 'F250', '150'), ('531', 'F250/8ft/singleaxle', '150'), ('532', 'F350', '150'), ('533', 'F350 4x4', '150'), ('534', 'F350 4x4 Crewcab', '150'), ('535', 'F450', '150'), ('536', 'F450 4x4 Crewcab', '150'), ('537', 'F450 Crewcab', '150'), ('538', 'F530', '150'), ('539', 'F550', '150'), ('540', 'F550 4x4 Crewcab', '150'), ('541', 'F600', '150'), ('542', 'F61', '150'), ('543', 'F650', '150'), ('544', 'F700', '150'), ('545', 'F750', '150'), ('546', 'Fairmont', '150'), ('547', 'Fiesta', '150'), ('548', 'Five Hundred', '150'), ('549', 'Flex', '150'), ('550', 'Focus', '150'), ('551', 'Freestar', '150'), ('552', 'Freestyle', '150'), ('553', 'Fusion', '150'), ('554', 'Galaxie', '150'), ('555', 'Granada', '150'), ('556', 'Ln700', '150'), ('557', 'Low Cab Forward', '150'), ('558', 'L-series', '150'), ('559', 'Ltd', '150'), ('560', 'Mustang', '150'), ('561', 'Other', '150'), ('562', 'Probe', '150'), ('563', 'Ranger', '150'), ('564', 'Salem25rks', '150'), ('565', 'Srw Super Duty', '150'), ('566', 'T-350', '150'), ('567', 'Taurus', '150'), ('568', 'Taurus X', '150'), ('569', 'Tempo', '150'), ('570', 'Thunderbir', '150'), ('571', 'Thunderbird', '150'), ('572', 'Torino', '150'), ('573', 'Tractor', '150'), ('574', 'Transit', '150'), ('575', 'Transit Connect', '150'), ('576', 'Windstar', '150'), ('577', '29ft', '151'), ('578', '34ft', '152'), ('579', 'Grey Wolfe', '152'), ('580', '21wp Cherokee', '153'), ('581', '23', '153'), ('582', '255rr Cherokee', '153'), ('583', '26rr', '153'), ('584', '27flbs Shasta Revere', '153'), ('585', '27rkss Salem', '153'), ('586', '29bhss Puma', '153'), ('587', '31qbts', '153'), ('588', '368rlbhk Salem Hemis', '153'), ('589', '8x30 Salem', '153'), ('590', 'Cardinal Le Fifth Wheel T', '153'), ('591', 'Cedar Creek', '153'), ('592', 'Cherokee', '153'), ('593', 'Cherokee Lite', '153'), ('594', 'Cherokee M28a+', '153'), ('595', 'Coachmen Catalina', '153'), ('596', 'Flagstaff', '153'), ('597', 'Grey Wolf', '153'), ('598', 'M-346rk', '153'), ('599', 'Other', '153'), ('600', 'Palomino Puma', '153'), ('601', 'Puma', '153'), ('602', 'Rockwood 22 Foot Long', '153'), ('603', 'Rockwood Ultra Light', '153'), ('604', 'Rockwood Ultra Lite', '153'), ('605', 'Sabre', '153'), ('606', 'Salem', '153'), ('607', 'Salem Cruise Lite', '153'), ('608', 'Salem Hemisphere', '153'), ('609', 'Sierra', '153'), ('610', 'Sierra M-365saqb', '153'), ('611', 'Surveyor Cadet', '153'), ('612', 'Tw714ta2', '153'), ('613', 'Wildcat', '153'), ('614', 'Wildwood', '153'), ('615', 'Wildwood H', '153'), ('616', 'Wildwood Heritage Glen', '153'), ('617', 'Wolf Pup', '153'), ('618', 'Wildwood', '154'), ('619', 'Boat', '155'), ('620', 'Boat Trailer Only', '156'), ('621', 'Machine', '157'), ('622', 'V Nose Trailer', '159'), ('623', 'Freedsa', '160'), ('624', 'Boat', '165'), ('625', '114sd', '161'), ('626', '2500 Sprinter', '161'), ('627', '3500 Sprinter', '161'), ('628', 'Cascadia 125', '161'), ('629', 'Cascadia 126', '161'), ('630', 'Century Classic', '161'), ('631', 'Chassis', '161'), ('632', 'Chassis', '161'), ('633', 'Columbia', '161'), ('634', 'Conventional', '161'), ('635', 'Coronado Glider', '161'), ('636', 'Fl60', '161'), ('637', 'Fld', '161'), ('638', 'Fld120', '161'), ('639', 'M2', '161'), ('640', 'Medium Convention', '161'), ('641', 'Sprinter', '161'), ('642', 'St120', '161'), ('643', 'Explorer', '163'), ('644', 'Bulk Trailer', '164'), ('645', 'Dump', '164'), ('646', 'Bulk Trailer', '164'), ('647', 'Dump', '164'), ('648', 'G80', '168'), ('649', 'Manlift', '169'), ('650', 'Buddy', '170'), ('651', 'Roughhouse', '170'), ('652', 'Prizm', '171'), ('653', 'Tracker', '171'), ('654', 'Metro', '171'), ('655', 'Cruise Master (f550)', '172'), ('656', 'Pursuit Motorhome', '172'), ('657', 'Golden Falcon', '173'), ('658', 'E2', '174'), ('659', 'Palm Beach', '175'), ('660', 'Sierra', '176'), ('661', 'Terrain', '176'), ('662', 'New Sierra', '176'), ('663', 'Envoy', '176'), ('664', 'Acadia', '176'), ('665', 'Boat', '177'), ('666', 'Hurricane', '177'), ('667', 'Golf Cart', '178'), ('668', 'Imagine', '180'), ('669', 'Ref308bhts', '180'), ('670', 'Reflection M-230rl', '180'), ('671', 'Reflection', '181'), ('672', 'Van', '182'), ('673', 'Reefer', '182'), ('674', 'Dry Van', '182'), ('675', 'Xuv', '183'), ('676', '15bh', '184'), ('677', '8x24', '184'), ('678', 'Cavalier', '184'), ('679', 'I279qbl', '184'), ('680', 'Kingsley', '184'), ('681', 'Other', '184'), ('682', 'Streamlite Ss28bks', '184'), ('683', 'Travel Trailer', '184'), ('684', 'Vintage Cruiser', '184'), ('685', '720 Lb Trailer', '186'), ('686', 'Harley', '187'), ('687', 'Fiberglass Ext. Saddlebag', '188'), ('688', 'Fld', '188'), ('689', 'Flhp', '188'), ('690', 'Flhpi', '188'), ('691', 'Flhr', '188'), ('692', 'Flhrc', '188'), ('693', 'Flhrci', '188'), ('694', 'Flhri', '188'), ('695', 'Flhrs', '188'), ('696', 'Flhrsi', '188'), ('697', 'Flht', '188'), ('698', 'Flhtc', '188'), ('699', 'Flhtci', '188'), ('700', 'Flhtcu', '188'), ('701', 'Flhtcui', '188'), ('702', 'Flhtcutg', '188'), ('703', 'Flhti', '188'), ('704', 'Flhtk', '188'), ('705', 'Flhtkse', '188'), ('706', 'Flhtp', '188'), ('707', 'Flhx', '188'), ('708', 'Flhxi', '188'), ('709', 'Flhxs', '188'), ('710', 'Flhxse', '188'), ('711', 'Flrt', '188'), ('712', 'Fls', '188'), ('713', 'Flss', '188'), ('714', 'Flstc', '188'), ('715', 'Flstci', '188'), ('716', 'Flstf', '188'), ('717', 'Flstfb', '188'), ('718', 'Flstfi', '188'), ('719', 'Flstfse', '188'), ('720', 'Flstn', '188'), ('721', 'Flstni', '188'), ('722', 'Flsts', '188'), ('723', 'Flstsb', '188'), ('724', 'Fltr', '188'), ('725', 'Fltru', '188'), ('726', 'Fltruse', '188'), ('727', 'Fltrx', '188'), ('728', 'Fltrxs', '188'), ('729', 'Fxcwc', '188'), ('730', 'Fxd', '188'), ('731', 'Fxdb', '188'), ('732', 'Fxdbi', '188'), ('733', 'Fxdc', '188'), ('734', 'Fxdf', '188'), ('735', 'Fxdl', '188'), ('736', 'Fxdli', '188'), ('737', 'Fxdls', '188'), ('738', 'Fxds', '188'), ('739', 'Fxdwg', '188'), ('740', 'Fxdwgi', '188'), ('741', 'Fxfbs', '188'), ('742', 'Fxr', '188'), ('743', 'Fxs', '188'), ('744', 'Fxsb', '188'), ('745', 'Fxst', '188'), ('746', 'Fxstb', '188'), ('747', 'Softail Standard', '188'), ('748', 'Unknown', '188'), ('749', 'Vrsca', '188'), ('750', 'Vrscdx', '188'), ('751', 'Vrscf', '188'), ('752', 'Vrscxa', '188'), ('753', 'Xg750', '188'), ('754', 'Xl1200', '188'), ('755', 'Xl883', '188'), ('756', 'Xlh1200', '188'), ('757', 'Xlh883', '188'), ('758', 'Xls', '188'), ('759', 'Flote Dek', '190'), ('760', 'Enclosed Cargo', '191'), ('761', 'Transport', '191'), ('762', 'Utility Trailer', '191'), ('763', '6x12x10k Trailer', '192'), ('764', 'Horse Trailer', '193'), ('765', '', '194'), ('766', '40ft', '194'), ('767', 'Bh280 Pioneer', '194'), ('768', 'Bigh3610r', '194'), ('769', 'Cyclone', '194'), ('770', 'Mallard', '194'), ('771', 'North Trail', '194'), ('772', 'Nthco29rks', '194'), ('773', 'Prowler', '194'), ('774', 'Qb300 Pioneer', '194'), ('775', 'Rg26 Pioneer', '194'), ('776', 'Rl250 Pioneer', '194'), ('777', 'Sundance', '194'), ('778', 'Trail Runner', '194'), ('779', 'Wilderness', '194'), ('780', 'Tank', '195'), ('781', 'Moped', '196'), ('782', '268', '197'), ('783', '155', '197'), ('784', '258/268', '197'), ('785', '258', '197'), ('786', '338', '197'), ('787', '34', '198'), ('788', 'F53', '198'), ('789', 'Savoy', '198'), ('790', 'Trailer Hitch', '198'), ('791', 'Vacationer (f550)', '198'), ('792', 'Trailer', '199'), ('793', 'Flatbed', '199'), ('794', 'Horse/stock Trailer', '199'), ('795', 'Accord', '200'), ('796', 'Accord Crosstour', '200'), ('797', 'Aquatrax', '200'), ('798', 'Atv', '200'), ('799', 'Cb1100', '200'), ('800', 'Cb250', '200'), ('801', 'Cb300', '200'), ('802', 'Cb450', '200'), ('803', 'Cb500', '200'), ('804', 'Cb650', '200'), ('805', 'Cb750', '200'), ('806', 'Cb900', '200'), ('807', 'Cbr1000', '200'), ('808', 'Cbr1100', '200'), ('809', 'Cbr250', '200'), ('810', 'Cbr300', '200'), ('811', 'Cbr500', '200'), ('812', 'Cbr600', '200'), ('813', 'Cbr650', '200'), ('814', 'Cbr900', '200'), ('815', 'Ch80', '200'), ('816', 'Chf50', '200'), ('817', 'Civic', '200'), ('818', 'Clarity', '200'), ('819', 'Cmx250', '200'), ('820', 'Cmx300', '200'), ('821', 'Cmx500', '200'), ('822', 'Cn250', '200'), ('823', 'Crf1000', '200'), ('824', 'Crf150', '200'), ('825', 'Crf250', '200'), ('826', 'Crosstour', '200'), ('827', 'Cr-v', '200'), ('828', 'Cr-z', '200'), ('829', 'Ctx1300', '200'), ('830', 'Ctx700', '200'), ('831', 'Element', '200'), ('832', 'Fit', '200'), ('833', 'Gl1100', '200'), ('834', 'Gl1200', '200'), ('835', 'Gl1500', '200'), ('836', 'Gl1800', '200'), ('837', 'Gl500', '200'), ('838', 'Grom', '200'), ('839', 'Hawk Cb400a', '200'), ('840', 'Hr-v', '200'), ('841', 'Insight', '200'), ('842', 'Motorcycle', '200'), ('843', 'Nch50', '200'), ('844', 'Nps50', '200'), ('845', 'Nss250', '200'), ('846', 'Nt650', '200'), ('847', 'Odyssey', '200'), ('848', 'On Road', '200'), ('849', 'Passport', '200'), ('850', 'Pcx', '200'), ('851', 'Pilot', '200'), ('852', 'Prelude', '200'), ('853', 'Ridgeline', '200'), ('854', 'Rvt1000', '200'), ('855', 'S2000', '200'), ('856', 'Sxs700', '200'), ('857', 'Trx250', '200'), ('858', 'Trx350', '200'), ('859', 'Trx400', '200'), ('860', 'Trx420', '200'), ('861', 'Trx450', '200'), ('862', 'Trx500', '200'), ('863', 'Vf500', '200'), ('864', 'Vf750', '200'), ('865', 'Vfr750', '200'), ('866', 'Vfr800', '200'), ('867', 'Vt1100', '200'), ('868', 'Vt1300', '200'), ('869', 'Vt600', '200'), ('870', 'Vt700', '200'), ('871', 'Vt750', '200'), ('872', 'Vtr1000f', '200'), ('873', 'Vtx1300', '200'), ('874', 'Vtx1800', '200'), ('875', 'Hideout', '201'), ('876', 'Flatbed', '202'), ('877', 'Utility Trailer', '203'), ('878', 'H3', '204'), ('879', 'H2', '204'), ('880', 'H2 Sut', '204'), ('881', 'Henriques 35', '205'), ('882', 'Supermoto 701', '206'), ('883', 'E0s 22v', '207'), ('884', '15 Ft.', '208'), ('885', 'Gv650', '209'), ('886', 'Forklift', '210'), ('887', 'Accent', '211'), ('888', 'Azera', '211'), ('889', 'Elantra', '211'), ('890', 'Elantra Coupe', '211'), ('891', 'Elantra Gt', '211'), ('892', 'Elantra Touring', '211'), ('893', 'Entourage', '211'), ('894', 'Equus', '211'), ('895', 'Genesis', '211'), ('896', 'Genesis Coupe', '211'), ('897', 'Ioniq', '211'), ('898', 'Kona', '211'), ('899', 'Santa Fe', '211'), ('900', 'Santa Fe Sport', '211'), ('901', 'Sonata', '211'), ('902', 'Tiburon', '211'), ('903', 'Tucson', '211'), ('904', 'Van', '211'), ('905', 'Veloster', '211'), ('906', 'Veracruz', '211'), ('907', 'Xg', '211'), ('908', 'Van', '212'), ('909', '3000', '213'), ('910', 'Vc230 23\'', '214'), ('911', 'Scout', '216'), ('912', 'Roadmaster', '216'), ('913', 'Chief', '216'), ('914', 'Chieftain', '216'), ('915', 'Ex35', '217'), ('916', 'Fx35', '217'), ('917', 'Fx37', '217'), ('918', 'Fx45', '217'), ('919', 'Fx50', '217'), ('920', 'G20', '217'), ('921', 'G25', '217'), ('922', 'G35', '217'), ('923', 'G37', '217'), ('924', 'I30', '217'), ('925', 'I35', '217'), ('926', 'J30', '217'), ('927', 'Jx35', '217'), ('928', 'M35', '217'), ('929', 'M37', '217'), ('930', 'M45', '217'), ('931', 'Q40', '217'), ('932', 'Q45', '217'), ('933', 'Q50', '217'), ('934', 'Q60', '217'), ('935', 'Q70', '217'), ('936', 'Q70l', '217'), ('937', 'Qx30', '217'), ('938', 'Qx4', '217'), ('939', 'Qx50', '217'), ('940', 'Qx56', '217'), ('941', 'Qx60', '217'), ('942', 'Qx70', '217'), ('943', 'Qx80', '217'), ('944', 'Shopbuilt 5\'x18\'', '218'), ('945', 'Horse Trailor', '219'), ('946', '3000', '220'), ('947', '3000 School Bus', '220'), ('948', '3200 Bus', '220'), ('949', '4000', '220'), ('950', '4200', '220'), ('951', '4300', '220'), ('952', '4400', '220'), ('953', '4600', '220'), ('954', '4700', '220'), ('955', '4900', '220'), ('956', '7000', '220'), ('957', '7120', '220'), ('958', '7400', '220'), ('959', '8000', '220'), ('960', '8600', '220'), ('961', '9000', '220'), ('962', '9200', '220'), ('963', '9400', '220'), ('964', '9670', '220'), ('965', 'Auto Hauler', '220'), ('966', 'Cf', '220'), ('967', 'F-2674', '220'), ('968', 'Prostar', '220'), ('969', 'Prostar Premium', '220'), ('970', 'S-series', '220'), ('971', 'Terrastar', '220'), ('972', '1050', '221'), ('973', 'Trailer', '222'), ('974', 'Ascender', '223'), ('975', 'Conventional', '223'), ('976', 'Frr', '223'), ('977', 'Hombre', '223'), ('978', 'Npr', '223'), ('979', 'Npr Hd', '223'), ('980', 'Nqr', '223'), ('981', 'Nrr', '223'), ('982', 'Oasis', '223'), ('983', 'Pup', '223'), ('984', 'Rodeo', '223'), ('985', 'Trooper', '223'), ('986', 'It50qt', '224'), ('987', '27sr/mh', '225'), ('988', 'Suncruiser(2013 F550)', '225'), ('989', 'F-pace', '226'), ('990', 'F-type', '226'), ('991', 'S-type', '226'), ('992', 'Vandenplas', '226'), ('993', 'Xe', '226'), ('994', 'Xf', '226'), ('995', 'Xj', '226'), ('996', 'Xj12', '226'), ('997', 'Xj6', '226'), ('998', 'Xj8', '226'), ('999', 'Xjl', '226'), ('1000', 'Xjr', '226'), ('1001', 'Xjs', '226'), ('1002', 'Xk', '226'), ('1003', 'Xk8', '226'), ('1004', 'Xkr', '226'), ('1005', 'X-type', '226'), ('1006', '330rsts Eagle', '227'), ('1007', '33rbts Jay Flight', '227'), ('1008', '8x31 5th', '227'), ('1009', 'Designer', '227'), ('1010', 'Eagle Sl', '227'), ('1011', 'Greyhawk(2012 E450)', '227'), ('1012', 'Jay Flght 32bhds', '227'), ('1013', 'Jay Flight', '227'), ('1014', 'Jayfl184bh', '227'), ('1015', 'Jayflight', '227'), ('1016', 'Kiwi', '227'), ('1017', 'M263 Rks', '227'), ('1018', 'Qwest', '227'), ('1019', 'Qwest 8w', '227'), ('1020', 'Trailer', '227'), ('1021', '2 Door', '228'), ('1022', 'Cherokee', '228'), ('1023', 'Comanche', '228'), ('1024', 'Commander', '228'), ('1025', 'Commando', '228'), ('1026', 'Compass', '228'), ('1027', 'Grand Cherokee', '228'), ('1028', 'Liberty', '228'), ('1029', 'Patriot', '228'), ('1030', 'Renegade', '228'), ('1031', 'Wrangler', '228'), ('1032', 'Wrangler / Tj', '228'), ('1033', 'Wrangler / Yj', '228'), ('1034', 'Wrangler Unlimite', '228'), ('1035', 'Wrangler Unlimited', '228'), ('1036', 'Scooter', '229'), ('1037', 'Egret Boat', '230'), ('1038', '2155', '231'), ('1039', 'Ct322', '231'), ('1040', 'Gator', '231'), ('1041', 'Gator 620i', '231'), ('1042', 'Gator 850i', '231'), ('1043', 'Yy50qt-6', '232'), ('1044', 'Frame Mach', '233'), ('1045', 'Na', '234'), ('1046', 'Br125', '235'), ('1047', 'En450', '235'), ('1048', 'En500', '235'), ('1049', 'En650', '235'), ('1050', 'Er650', '235'), ('1051', 'Ex250', '235'), ('1052', 'Ex300', '235'), ('1053', 'Ex400', '235'), ('1054', 'Ex500', '235'), ('1055', 'Ex650', '235'), ('1056', 'Kaf400', '235'), ('1057', 'Kl650', '235'), ('1058', 'Kle300', '235'), ('1059', 'Krf-750', '235'), ('1060', 'Krt800', '235'), ('1061', 'Ksv700', '235'), ('1062', 'Kvf650', '235'), ('1063', 'Kvf750', '235'), ('1064', 'Kz550', '235'), ('1065', 'Ninja Zx', '235'), ('1066', 'Personal Watercraft', '235'), ('1067', 'Vn1500', '235'), ('1068', 'Vn1600', '235'), ('1069', 'Vn1700', '235'), ('1070', 'Vn2000', '235'), ('1071', 'Vn750', '235'), ('1072', 'Vn800', '235'), ('1073', 'Vn900', '235'), ('1074', 'Vulcan 2000', '235'), ('1075', 'Zg1200', '235'), ('1076', 'Zg1400', '235'), ('1077', 'Zn700', '235'), ('1078', 'Zr750', '235'), ('1079', 'Zr900', '235'), ('1080', 'Zx1000', '235'), ('1081', 'Zx1200', '235'), ('1082', 'Zx1400', '235'), ('1083', 'Zx600', '235'), ('1084', 'Zx636', '235'), ('1085', 'Zx750', '235'), ('1086', 'Kawasaki Jtt50he0069', '236'), ('1087', 'Mcyc', '237'), ('1088', 'Trailer', '238'), ('1089', 'Van', '239'), ('1090', 'Construction', '240'), ('1091', 'T300', '240'), ('1092', 'T370', '240'), ('1093', 'T660', '240'), ('1094', 'T680', '240'), ('1095', 'T800', '240'), ('1096', 'W900', '240'), ('1097', 'Passport', '242'), ('1098', 'Bobc293ebs', '243'), ('1099', 'Bullet', '243'), ('1100', 'Carbon', '243'), ('1101', 'Challenger', '243'), ('1102', 'Coleman', '243'), ('1103', 'Copper Canyon', '243'), ('1104', 'Cougar', '243'), ('1105', 'Everest', '243'), ('1106', 'Everest 343l 5th Wheel', '243'), ('1107', 'Fuzion 371', '243'), ('1108', 'Hideout', '243'), ('1109', 'Hornet M29rl', '243'), ('1110', 'Hornet M-33f', '243'), ('1111', 'Impact', '243'), ('1112', 'Mo3455sa10', '243'), ('1113', 'Montana', '243'), ('1114', 'Montana 34rl', '243'), ('1115', 'Montana M-3400rl', '243'), ('1116', 'Mountaineer', '243'), ('1117', 'Outback', '243'), ('1118', 'Outback 28', '243'), ('1119', 'Springdale', '243'), ('1120', 'Sprinter', '243'), ('1121', 'Summerland', '243'), ('1122', 'Ultra Light', '243'), ('1123', '28\' 5th Wheel Camper', '243'), ('1124', 'All Terrain', '248'), ('1125', '267bhlgl', '244'), ('1126', '35ft', '244'), ('1127', '3790rd16 Montana', '244'), ('1128', '8x31', '244'), ('1129', 'Hideout', '244'), ('1130', 'Laredo Travel Trailers', '244'), ('1131', 'Other', '244'), ('1132', 'Passport', '244'), ('1133', 'Passport Ultra Lite Trave', '244'), ('1134', 'Springdale', '244'), ('1135', 'Sprinter', '244'), ('1136', 'Summerland', '244'), ('1137', 'Summerland Travel Trailer', '244'), ('1138', 'Zinger', '244'), ('1139', '5th Wheel', '245'), ('1140', 'Trailer', '246'), ('1141', 'Amanti', '247'), ('1142', 'Borrego', '247'), ('1143', 'Cadenza', '247'), ('1144', 'Forte', '247'), ('1145', 'New Spectra', '247'), ('1146', 'New Sportage', '247'), ('1147', 'Niro', '247'), ('1148', 'Optima', '247'), ('1149', 'Rio', '247'), ('1150', 'Rondo', '247'), ('1151', 'Sedona', '247'), ('1152', 'Sephia', '247'), ('1153', 'Sorento', '247'), ('1154', 'Soul', '247'), ('1155', 'Spectra', '247'), ('1156', 'Spectra5', '247'), ('1157', 'Sportage', '247'), ('1158', 'Stinger', '247'), ('1159', 'Trailer', '248'), ('1160', 'Adventure', '249'), ('1161', 'Camper', '250'), ('1162', 'Camper', '251'), ('1163', '1190', '252'), ('1164', '390', '252'), ('1165', '1290', '252'), ('1166', '500', '252'), ('1167', '690', '252'), ('1168', 'Agility', '253'), ('1169', 'Compagno', '253'), ('1170', 'Kymco Atv', '253'), ('1171', 'Like', '253'), ('1172', 'People', '253'), ('1173', 'Sento', '253'), ('1174', 'Sportsman', '254'), ('1175', 'Sportsmen', '254'), ('1176', 'Sportsmen 293rl', '255'), ('1177', 'Sportsman', '256'), ('1178', 'Huracan', '257'), ('1179', 'Travel Trailer', '258'), ('1180', 'Truck Bed Camper Insert', '258'), ('1181', 'Discovery', '259'), ('1182', 'Discovery Ii', '259'), ('1183', 'Discovery Sport', '259'), ('1184', 'Freelander', '259'), ('1185', 'Lr2', '259'), ('1186', 'Lr3', '259'), ('1187', 'Lr4', '259'), ('1188', 'Range Rover', '259'), ('1189', 'Range Rover Evoqu', '259'), ('1190', 'Range Rover Evoque', '259'), ('1191', 'Range Rover Sport', '259'), ('1192', 'Range Rover Velar', '259'), ('1193', 'Keystone', '260'), ('1194', 'Trailer', '261'), ('1195', 'Boat', '262'), ('1196', '32 Ft. Trailer', '263'), ('1197', 'Travel Trailer', '264'), ('1198', 'G-p', '265'), ('1199', 'Ct', '266'), ('1200', 'Es', '266'), ('1201', 'Gs', '266'), ('1202', 'Gs Generation 200', '266'), ('1203', 'Gx', '266'), ('1204', 'Hs', '266'), ('1205', 'Is', '266'), ('1206', 'Ls', '266'), ('1207', 'Lx', '266'), ('1208', 'Nx', '266'), ('1209', 'Rc', '266'), ('1210', 'Rx', '266'), ('1211', 'Sc', '266'), ('1212', 'Travalong', '267'), ('1213', 'Aviator', '268'), ('1214', 'Continental', '268'), ('1215', 'Convertible', '268'), ('1216', 'Ls', '268'), ('1217', 'Mark Lt', '268'), ('1218', 'Mark Viii', '268'), ('1219', 'Mkc', '268'), ('1220', 'Mks', '268'), ('1221', 'Mkt', '268'), ('1222', 'Mkx', '268'), ('1223', 'Mkz', '268'), ('1224', 'Navigator', '268'), ('1225', 'Town Car', '268'), ('1226', 'Zephyr', '268'), ('1227', 'S580', '269'), ('1228', '2460 Tractor', '270'), ('1229', 'Trailer', '271'), ('1230', 'Enclosed Cargo', '272'), ('1231', 'Elise', '273'), ('1232', 'Mv Agusta/b3', '274'), ('1233', 'Mv Agusta/f3', '274'), ('1234', '600', '275'), ('1235', 'Chu613', '275'), ('1236', 'Cv713', '275'), ('1237', 'Cxu613', '275'), ('1238', 'Mr688s', '275'), ('1239', 'Rd688s', '275'), ('1240', 'Rd690s', '275'), ('1241', 'Boat Trailer', '276'), ('1242', 'Log Trailer', '277'), ('1243', 'Utility Light Tower', '278'), ('1244', 'Malibu Axis T23', '280'), ('1245', 'Bow Rider', '281'), ('1246', 'Ghibli', '282'), ('1247', 'Granturismo', '282'), ('1248', 'Quattroporte', '282'), ('1249', 'Gransport', '282'), ('1250', 'Levante', '282'), ('1251', '2400/sc', '283'), ('1252', '3', '284'), ('1253', '323', '284'), ('1254', '5', '284'), ('1255', '6', '284'), ('1256', '626', '284'), ('1257', 'B2200', '284'), ('1258', 'B2300', '284'), ('1259', 'B2500', '284'), ('1260', 'B3000', '284'), ('1261', 'B4000', '284'), ('1262', 'Cx-3', '284'), ('1263', 'Cx-5', '284'), ('1264', 'Cx-7', '284'), ('1265', 'Cx-9', '284'), ('1266', 'Mazda2', '284'), ('1267', 'Millenia', '284'), ('1268', 'Mpv', '284'), ('1269', 'Mx-5 Miata', '284'), ('1270', 'Mx-6', '284'), ('1271', 'Protege', '284'), ('1272', 'Rx8', '284'), ('1273', 'Speed', '284'), ('1274', 'Tribute', '284'), ('1275', 'Lakota', '285'), ('1276', '650s', '286'), ('1277', 'Mega Stand Tank', '287'), ('1278', '450 Sl C', '288'), ('1279', '250 C', '288'), ('1280', '280e', '288'), ('1281', '450sl', '289'), ('1282', '190', '290'), ('1283', '240', '290'), ('1284', '300', '290'), ('1285', '350', '290'), ('1286', '380', '290'), ('1287', '400', '290'), ('1288', '420', '290'), ('1289', '450', '290'), ('1290', '450sl', '290'), ('1291', '500', '290'), ('1292', '560', '290'), ('1293', 'C', '290'), ('1294', 'C Generation 2006', '290'), ('1295', 'Cl', '290'), ('1296', 'Cla', '290'), ('1297', 'Clk', '290'), ('1298', 'Cls', '290'), ('1299', 'E', '290'), ('1300', 'G', '290'), ('1301', 'Gl', '290'), ('1302', 'Gla', '290'), ('1303', 'Glc', '290'), ('1304', 'Glc Coupe', '290'), ('1305', 'Gle', '290'), ('1306', 'Gle Coupe', '290'), ('1307', 'Glk', '290'), ('1308', 'Gls', '290'), ('1309', 'Metris', '290'), ('1310', 'Ml', '290'), ('1311', 'R', '290'), ('1312', 'S', '290'), ('1313', 'S550', '290'), ('1314', 'Sl', '290'), ('1315', 'Sl500', '290'), ('1316', 'Sl500r', '290'), ('1317', 'Slk', '290'), ('1318', 'Sprinter', '290'), ('1319', 'Capri', '291'), ('1320', 'Cougar', '291'), ('1321', 'Grand Marquis', '291'), ('1322', 'Grande Marquis', '291'), ('1323', 'Mariner', '291'), ('1324', 'Milan', '291'), ('1325', 'Monarch', '291'), ('1326', 'Montego', '291'), ('1327', 'Monterey', '291'), ('1328', 'Motor', '291'), ('1329', 'Mountaineer', '291'), ('1330', 'Mystique', '291'), ('1331', 'Quicksilver', '291'), ('1332', 'Sable', '291'), ('1333', 'Topaz', '291'), ('1334', 'Tracer', '291'), ('1335', 'Villager', '291'), ('1336', 'Bagger', '292'), ('1337', 'Daytona', '293'), ('1338', 'Deuce And A Half', '294'), ('1339', '8x15 Trailer', '295'), ('1340', 'Cooper', '296'), ('1341', 'Cooper Roadster', '296'), ('1342', 'Mxl 1200', '297'), ('1343', '2285cs Biscayne Bay', '298'), ('1344', '3000 Gt', '299'), ('1345', 'Diamante', '299'), ('1346', 'Eclipse', '299'), ('1347', 'Endeavor', '299'), ('1348', 'Galant', '299'), ('1349', 'Lancer', '299'), ('1350', 'Mighty Max / S', '299'), ('1351', 'Mirage', '299'), ('1352', 'Montero', '299'), ('1353', 'Outlander', '299'), ('1354', 'Outlander Sport', '299'), ('1355', 'Raider', '299'), ('1356', 'Fe', '300'), ('1357', 'Fh', '300'), ('1358', 'Lg3500 Trailer Flatbed', '301'), ('1359', 'Van', '303'), ('1360', '102a3 Transit Bus', '306'), ('1361', 'Challenger', '307'), ('1362', 'Nash', '308'), ('1363', 'Nas287tr', '309'), ('1364', '555e', '310'), ('1365', '575', '310'), ('1366', 'Mountain Aire', '311'), ('1367', '2 Door', '312'), ('1368', '200sx', '312'), ('1369', '240sx', '312'), ('1370', '300zx', '312'), ('1371', '350z', '312'), ('1372', '370z', '312'), ('1373', '720', '312'), ('1374', 'Altima', '312'), ('1375', 'Armada', '312'), ('1376', 'Cube', '312'), ('1377', 'D21', '312'), ('1378', 'Frontier', '312'), ('1379', 'Gt-r', '312'), ('1380', 'Juke', '312'), ('1381', 'Kicks', '312'), ('1382', 'Leaf', '312'), ('1383', 'Maxima', '312'), ('1384', 'Micra', '312'), ('1385', 'Murano', '312'), ('1386', 'Nv', '312'), ('1387', 'Nv200', '312'), ('1388', 'Pathfinder', '312'), ('1389', 'Quest', '312'), ('1390', 'Rogue', '312'), ('1391', 'Rogue Select', '312'), ('1392', 'Rogue Sport', '312'), ('1393', 'Sentra', '312'), ('1394', 'Stanza', '312'), ('1395', 'Titan', '312'), ('1396', 'Titan Xd', '312'), ('1397', 'Truck', '312'), ('1398', 'Ud1400', '312'), ('1399', 'Ud2300', '312'), ('1400', 'Versa', '312'), ('1401', 'Versa Note', '312'), ('1402', 'Versa Sedan', '312'), ('1403', 'Xterra', '312'), ('1404', 'Ud1400', '313'), ('1405', 'Ud2300', '313'), ('1406', 'Camper', '314'), ('1407', 'Commando', '315'), ('1408', 'Trailer', '316'), ('1409', 'Hitchhiker 2', '317'), ('1410', '88', '318'), ('1411', '98', '318'), ('1412', 'Achieva', '318'), ('1413', 'Alero', '318'), ('1414', 'Aurora', '318'), ('1415', 'Bravada', '318'), ('1416', 'Ciera', '318'), ('1417', 'Cutlass', '318'), ('1418', 'Cutlass Ciera', '318'), ('1419', 'Cutlass Cruiser', '318'), ('1420', 'Cutlass Supreme', '318'), ('1421', 'Intrigue', '318'), ('1422', 'Lss', '318'), ('1423', 'Silhouette', '318'), ('1424', 'Vista Cruiser', '318'), ('1425', 'Light', '319'), ('1426', 'Roamer Rt331bhs', '319'), ('1427', 'Chassis', '321'), ('1428', '6x10', '323'), ('1429', 'Motorhome', '324'), ('1430', 'P30', '324'), ('1431', 'Tl', '325'), ('1432', '15ft', '326'), ('1433', 'B1200', '326'), ('1434', 'Other', '326'), ('1435', 'Pony283', '326'), ('1436', 'Puma 30rkss', '326'), ('1437', '17ft Boat', '329'), ('1438', 'Utility Trailer', '330'), ('1439', '335', '331'), ('1440', '337', '331'), ('1441', '348', '331'), ('1442', '357', '331'), ('1443', '379', '331'), ('1444', '384', '331'), ('1445', '385', '331'), ('1446', '386', '331'), ('1447', '387', '331'), ('1448', '388', '331'), ('1449', '389', '331'), ('1450', '587', '331'), ('1451', 'Glider', '331'), ('1452', 'Mp3', '332'), ('1453', 'Bv', '332'), ('1454', 'Fire Engine', '333'), ('1455', 'Pierce', '333'), ('1456', 'Personal Scooter', '334'), ('1457', 'T Route 66', '335'), ('1458', '18ck', '336'), ('1459', 'Flat Bed', '337'), ('1460', 'Trailer', '337'), ('1461', 'Trailer', '338'), ('1462', 'Breeze', '339'), ('1463', 'Fury', '339'), ('1464', 'Grand Voyager', '339'), ('1465', 'Neon', '339'), ('1466', 'Reliant', '339'), ('1467', 'Satelite', '339'), ('1468', 'Valiant', '339'), ('1469', 'Voyager', '339'), ('1470', 'Ace', '340'), ('1471', 'General', '340'), ('1472', 'Personal Watercraft', '340'), ('1473', 'Predator', '340'), ('1474', 'Ranger', '340'), ('1475', 'Rzr', '340'), ('1476', 'Scrambler', '340'), ('1477', 'Slingshot', '340'), ('1478', 'Sportsman', '340'), ('1479', 'Trail Blazer', '340'), ('1480', 'Aztek', '341'), ('1481', 'Bonneville', '341'), ('1482', 'Fiero', '341'), ('1483', 'Firebird', '341'), ('1484', 'G3', '341'), ('1485', 'G5', '341'), ('1486', 'G6', '341'), ('1487', 'G8', '341'), ('1488', 'Grand Am', '341'), ('1489', 'Grand Prix', '341'), ('1490', 'Gto', '341'), ('1491', 'Montana', '341'), ('1492', 'Montana / Trans S', '341'), ('1493', 'Parisienne', '341'), ('1494', 'Silverstreak', '341'), ('1495', 'Solstice', '341'), ('1496', 'Sunbird', '341'), ('1497', 'Sunfire', '341'), ('1498', 'Torrent', '341'), ('1499', 'Trans Sport', '341'), ('1500', 'Vibe', '341'), ('1501', 'Boat', '343'), ('1502', '911', '344'), ('1503', '924', '344'), ('1504', '928', '344'), ('1505', '944', '344'), ('1506', 'Boxster', '344'), ('1507', 'Cayenne', '344'), ('1508', 'Cayman', '344'), ('1509', 'Macan', '344'), ('1510', 'Panamera', '344'), ('1511', 'Bus', '345'), ('1512', 'T16 Panther', '346'), ('1513', 'Frame Machine', '347'), ('1514', 'Rt', '348'), ('1515', 'Palomino', '349'), ('1516', 'Flatbed', '353'), ('1517', '1500', '350'), ('1518', '1500 Classic', '350'), ('1519', '2500', '350'), ('1520', '3500', '350'), ('1521', '3500 4x4 Crewcab', '350'), ('1522', '4500', '350'), ('1523', '5500', '350'), ('1524', 'Promaster 1500', '350'), ('1525', 'Promaster 2500', '350'), ('1526', 'Promaster City', '350'), ('1527', 'Tradesman', '350'), ('1528', 'R72 - Sport', '351'), ('1529', 'Forklift', '354'), ('1530', 'Design Gra', '355'), ('1531', 'Flatbed', '356'), ('1532', 'Redwood', '357'), ('1533', 'Trailer', '358'), ('1534', 'Captiva', '359'), ('1535', '150', '361'), ('1536', 'Dyanaster', '362'), ('1537', 'Monocoque', '362'), ('1538', 'Straight Rail', '362'), ('1539', '8240ss', '363'), ('1540', 'M-18', '363'), ('1541', 'Other', '363'), ('1542', 'Sul8310ss', '363'), ('1543', 'Roketa Moped', '364'), ('1544', 'Cv83pd', '365'), ('1545', 'Silver Shadow', '366'), ('1546', 'Ghost', '367'), ('1547', 'Wraith', '367'), ('1548', '53&#39; Trailer', '368'), ('1549', 'Continental Gt', '369'), ('1550', 'Supersport', '370'), ('1551', 'Trailex 27fuss', '370'), ('1552', '9-3', '371'), ('1553', '9-5', '371'), ('1554', '900', '371'), ('1555', '9-7x', '371'), ('1556', '9-2', '371'), ('1557', 'Hem356qb', '372'), ('1558', 'Other', '372'), ('1559', 'Sbt 299re', '372'), ('1560', 'Enclosed Cargo', '373'), ('1561', '28', '374'), ('1562', 'Astra', '375'), ('1563', 'Aura', '375'), ('1564', 'Ion', '375'), ('1565', 'L100', '375'), ('1566', 'L200', '375'), ('1567', 'L300', '375'), ('1568', 'Ls1', '375'), ('1569', 'Ls2', '375'), ('1570', 'Lw2', '375'), ('1571', 'Lw300', '375'), ('1572', 'Outlook', '375'), ('1573', 'Relay', '375'), ('1574', 'Sc1', '375'), ('1575', 'Sc2', '375'), ('1576', 'Sky', '375'), ('1577', 'Sl', '375'), ('1578', 'Sl1', '375'), ('1579', 'Sl2', '375'), ('1580', 'Sw2', '375'), ('1581', 'Vue', '375'), ('1582', 'Tc', '376'), ('1583', 'Fr-s', '376'), ('1584', 'Tower', '377'), ('1585', '175 Bow Rider Xl(**) Bow', '378'), ('1586', 'Boat Only', '378'), ('1587', 'Boat Only (no Trailer)', '378'), ('1588', 'Bow Rider 185', '378'), ('1589', 'Other', '378'), ('1590', 'Waa366695 And Trailer', '378'), ('1591', 'Runabout', '379'), ('1592', 'Challenger 2000(*) Sport', '380'), ('1593', 'Other', '380'), ('1594', 'Sea Doo Gtx', '380'), ('1595', 'Seadoo Gtx', '380'), ('1596', 'Seadoo Gtx155', '380'), ('1597', 'Seadoo Sp', '380'), ('1598', 'Scotty', '381'), ('1599', '8.5x24 Enc', '382'), ('1600', 'Sz', '383'), ('1601', 'Flite', '384'), ('1602', 'P30', '385'), ('1603', 'Fx170', '386'), ('1604', 'Mx Z 600', '387'), ('1605', '25ft', '388'), ('1606', 'Nomad', '388'), ('1607', 'Rampage', '388'), ('1608', 'Walkabout', '388'), ('1609', 'Fifth Wheel Trai', '389'), ('1610', 'Fortwo', '390'), ('1611', 'Cargo Trailer', '391'), ('1612', 'Enclosed', '391'), ('1613', 'Motorhome(chev P30)', '392'), ('1614', 'Cargo Trail 12x6', '393'), ('1615', 'Trailer', '394'), ('1616', 'Motorhome', '395'), ('1617', 'Mountain Master', '395'), ('1618', 'Motorcycle', '396'), ('1619', 'Heavy Duty Trucks', '397'), ('1620', 'Pontoon', '398'), ('1621', '286 Dc Pro & Trailer', '400'), ('1622', '2500 Sprinter', '401'), ('1623', '3500 Sprinter', '401'), ('1624', '5th Wheel', '401'), ('1625', '12ft', '402'), ('1626', '19cmp', '402'), ('1627', '2700bh', '402'), ('1628', '6x12', '402'), ('1629', '8x17 Rd Ar-one', '402'), ('1630', 'Ar-one', '402'), ('1631', 'Ar-one Extreme', '402'), ('1632', 'Starcraft', '402'), ('1633', 'Travel Star', '402'), ('1634', 'St80td', '403'), ('1635', 'Lt', '405'), ('1636', 'Acterra', '405'), ('1637', 'At', '405'), ('1638', 'L7500', '405'), ('1639', 'L9500', '405'), ('1640', 'M1078 4x4', '406'), ('1641', 'Safe Stop', '407'), ('1642', '190', '408'), ('1643', 'Van', '409'), ('1644', 'B9 Tribeca', '410'), ('1645', 'Baja', '410'), ('1646', 'Brz', '410'), ('1647', 'Crosstrek', '410'), ('1648', 'Forester', '410'), ('1649', 'Gl', '410'), ('1650', 'Impreza', '410'), ('1651', 'Legacy', '410'), ('1652', 'Outback', '410'), ('1653', 'Tribeca', '410'), ('1654', 'Wrx', '410'), ('1655', 'Xv Crosstrek', '410'), ('1656', 'Flatbed Trailer', '411'), ('1657', 'Oth', '412'), ('1658', 'Auto Hauler', '413'), ('1659', 'Livestock Trailer', '415'), ('1660', 'M26cks', '416'), ('1661', 'Solanta 2709', '416'), ('1662', 'M-298bh', '417'), ('1663', 'Sunset Reserve', '417'), ('1664', '14 Ft', '418'), ('1665', 'Aerio', '419'), ('1666', 'An400', '419'), ('1667', 'An650', '419'), ('1668', 'C50', '419'), ('1669', 'C90', '419'), ('1670', 'Dl1000', '419'), ('1671', 'Dl650', '419'), ('1672', 'Dr200', '419'), ('1673', 'Dr650', '419'), ('1674', 'Dr-z400', '419'), ('1675', 'Esteem', '419'), ('1676', 'Forenza', '419'), ('1677', 'Grand Vitara', '419'), ('1678', 'Gs500', '419'), ('1679', 'Gsx1300', '419'), ('1680', 'Gsx600', '419'), ('1681', 'Gsx650', '419'), ('1682', 'Gsx750', '419'), ('1683', 'Gsx-r1000', '419'), ('1684', 'Gsx-r600', '419'), ('1685', 'Gsx-r750', '419'), ('1686', 'Gsx-s1000f', '419'), ('1687', 'Gsx-s750', '419'), ('1688', 'Gv1200', '419'), ('1689', 'Gw250', '419'), ('1690', 'Kizashi', '419'), ('1691', 'Ls650', '419'), ('1692', 'Lt-a700', '419'), ('1693', 'M109r / Vzr1800', '419'), ('1694', 'M50', '419'), ('1695', 'Reno', '419'), ('1696', 'Samurai', '419'), ('1697', 'Sfv650', '419'), ('1698', 'Sidekick', '419'), ('1699', 'Sv650', '419'), ('1700', 'Sx4', '419'), ('1701', 'Tl1000', '419'), ('1702', 'Ts250', '419'), ('1703', 'Uh200', '419'), ('1704', 'Verona', '419'), ('1705', 'Vitara', '419'), ('1706', 'Vl1500', '419'), ('1707', 'Vl800', '419'), ('1708', 'Vlr1800', '419'), ('1709', 'Vs1400', '419'), ('1710', 'Vs800', '419'), ('1711', 'Vz1500', '419'), ('1712', 'Vz1600', '419'), ('1713', 'Vz800', '419'), ('1714', 'Vzr1800', '419'), ('1715', 'Xl7', '419'), ('1716', 'Citycom', '420'), ('1717', 'Fiddle Iii', '420'), ('1718', 'Tango 256r', '422'), ('1719', '50cc', '423'), ('1720', 'Atm-50a1', '423'), ('1721', 'Moped', '423'), ('1722', '35v', '424'), ('1723', 'Terry 22h', '424'), ('1724', 'Model S', '425'), ('1725', 'Model 3', '425'), ('1726', 'Model X', '425'), ('1727', 'Heratherm Oven', '427'), ('1728', 'Bus (2011 Chev 3500)', '428'), ('1729', 'School Bus (frtlnr)', '428'), ('1730', '2870', '429'), ('1731', 'Dutchmen', '429'), ('1732', 'Jazz', '429'), ('1733', 'Summit', '429'), ('1734', 'Rz4', '430'), ('1735', 'Travel Trailer', '431'), ('1736', '14ft', '433'), ('1737', 'Hopper', '434'), ('1738', 'Flatbed 16ft', '435'), ('1739', 'Workman', '436'), ('1740', 'Dolly', '437'), ('1741', '4runner', '438'), ('1742', '86', '438'), ('1743', 'Avalon', '438'), ('1744', 'Camry', '438'), ('1745', 'Camry New Generat', '438'), ('1746', 'Camry New Generation', '438'), ('1747', 'Camry Solara', '438'), ('1748', 'Celica', '438'), ('1749', 'C-hr', '438'), ('1750', 'Corolla', '438'), ('1751', 'Corolla Im', '438'), ('1752', 'Corolla Matrix', '438'), ('1753', 'Cressida', '438'), ('1754', 'Echo', '438'), ('1755', 'Fj Cruiser', '438'), ('1756', 'Highlander', '438'), ('1757', 'Land Cruiser', '438'), ('1758', 'Mr2', '438'), ('1759', 'Pickup', '438'), ('1760', 'Pickup / Cab Chassis', '438'), ('1761', 'Previa', '438'), ('1762', 'Prius', '438'), ('1763', 'Prius C', '438'), ('1764', 'Prius Plug-in', '438'), ('1765', 'Prius Prime', '438'), ('1766', 'Prius V', '438'), ('1767', 'Rav4', '438'), ('1768', 'Rav4 Hv', '438'), ('1769', 'Scion', '438'), ('1770', 'Scion Fr-s', '438'), ('1771', 'Scion Ia', '438'), ('1772', 'Scion Im', '438'), ('1773', 'Scion Iq', '438'), ('1774', 'Scion Tc', '438'), ('1775', 'Scion Xa', '438'), ('1776', 'Scion Xb', '438'), ('1777', 'Scion Xd', '438'), ('1778', 'Sequoia', '438'), ('1779', 'Sienna', '438'), ('1780', 'Supra', '438'), ('1781', 'T100', '438'), ('1782', 'Tacoma', '438'), ('1783', 'Tercel', '438'), ('1784', 'Tundra', '438'), ('1785', 'Van Wagon', '438'), ('1786', 'Venza', '438'), ('1787', 'Yaris', '438'), ('1788', 'Yaris Ia', '438'), ('1789', 'Boat', '439'), ('1790', 'Pro Team 175 Txw W/60elpt', '439'), ('1791', 'Travel Trailer', '440'), ('1792', 'Transfer', '441'), ('1793', 'Of R Visin', '445'), ('1794', 'Reefer', '446'), ('1795', 'Flatbed', '447'), ('1796', 'America', '449'), ('1797', 'Bonneville', '449'), ('1798', 'Daytona', '449'), ('1799', 'Rocket Iii', '449'), ('1800', 'Scrambler', '449'), ('1801', 'Speedmaster', '449'), ('1802', 'Street Triple', '449'), ('1803', 'Street Twin', '449'), ('1804', 'Thruxton', '449'), ('1805', 'Thunderbird', '449'), ('1806', 'Tiger', '449'), ('1807', 'Trophy', '449'), ('1808', 'Sunnybrook', '450'), ('1809', 'Tundra 5th Wheel', '451'), ('1810', 'Ud1800', '452'), ('1811', 'Auto Hauler', '453'), ('1812', 'Enclosed Cargo', '454'), ('1813', 'United Uxt-8.522ta70', '455'), ('1814', '85x20wt3', '456'), ('1815', 'Gw-630', '457'), ('1816', 'Tourist/patrol/gear Up W/', '458'), ('1817', 'Dump', '459'), ('1818', '5x8 Trailer', '460'), ('1819', 'Flatbed', '460'), ('1820', 'Trailer', '460'), ('1821', 'Reefer', '461'), ('1822', 'Van', '461'), ('1823', 'Rollover', '461'), ('1824', 'Utility', '461'), ('1825', 'T2100', '462'), ('1826', 'Venice', '463'), ('1827', 'Dump\nDump', '464'), ('1828', 'Travel Trailer', '465'), ('1829', 'Gts', '468'), ('1830', 'Lx', '468'), ('1831', 'Primavera', '468'), ('1832', 'Sprint', '468'), ('1833', 'Cross Country', '469'), ('1834', 'Cross Roads', '469'), ('1835', 'Gunner', '469'), ('1836', 'High-ball', '469'), ('1837', 'Kingpin', '469'), ('1838', 'Octane', '469'), ('1839', 'Vegas', '469'), ('1840', 'Vx', '469'), ('1841', 'Future Champion', '471'), ('1842', 'Atlas', '472'), ('1843', 'Beetle', '472'), ('1844', 'Cabrio', '472'), ('1845', 'Cc', '472'), ('1846', 'City Golf', '472'), ('1847', 'E-golf', '472'), ('1848', 'Eos', '472'), ('1849', 'Eurovan', '472'), ('1850', 'Gli', '472'), ('1851', 'Golf', '472'), ('1852', 'Golf Alltrack', '472'), ('1853', 'Golf Sportwagen', '472'), ('1854', 'Gti', '472'), ('1855', 'Jetta', '472'), ('1856', 'New Beetle', '472'), ('1857', 'New Gti', '472'), ('1858', 'New Jetta', '472'), ('1859', 'Passat', '472'), ('1860', 'Phaeton', '472'), ('1861', 'Rabbit', '472'), ('1862', 'Routan', '472'), ('1863', 'Tiguan', '472'), ('1864', 'Tiguan Limited', '472'), ('1865', 'Touareg', '472'), ('1866', 'Touareg 2', '472'), ('1867', 'Transporter (can)', '472'), ('1868', 'Rabbit', '473'), ('1869', '240', '474'), ('1870', '244', '474'), ('1871', '740', '474'), ('1872', '760', '474'), ('1873', '850', '474'), ('1874', '940', '474'), ('1875', '960', '474'), ('1876', 'C30', '474'), ('1877', 'C70', '474'), ('1878', 'L90 D Fuel Inj Pump', '474'), ('1879', 'L90c', '474'), ('1880', 'L90d', '474'), ('1881', 'L90e', '474'), ('1882', 'S40', '474'), ('1883', 'S60', '474'), ('1884', 'S70', '474'), ('1885', 'S80', '474'), ('1886', 'S90', '474'), ('1887', 'V40', '474'), ('1888', 'V50', '474'), ('1889', 'V60', '474'), ('1890', 'V60 Cross Country', '474'), ('1891', 'V70', '474'), ('1892', 'Vn', '474'), ('1893', 'Vnl', '474'), ('1894', 'Vnm', '474'), ('1895', 'Wg', '474'), ('1896', 'Xc60', '474'), ('1897', 'Xc70', '474'), ('1898', 'Xc90', '474'), ('1899', 'Van', '475'), ('1900', 'Reefer', '475'), ('1901', 'Dry Van', '475'), ('1902', '53ft', '475'), ('1903', 'Message Noard', '476'), ('1904', '230 Aft Ca', '477'), ('1905', 'Cargo 4 X6 Enclosed Trail', '479'), ('1906', 'Utility', '479'), ('1907', 'Utility', '480'), ('1908', '4700', '482'), ('1909', '4900', '482'), ('1910', 'Intercepter', '483'), ('1911', 'Wg', '484'), ('1912', 'C7500', '485'), ('1913', '171rbxl', '486'), ('1914', 'Jeepster', '487'), ('1915', 'Hopper', '488'), ('1916', 'Livestock', '488'), ('1917', '30res', '489'), ('1918', 'Winnebago', '489'), ('1919', 'Moped', '490'), ('1920', 'Motorhome Chassis', '491'), ('1921', 'Azure Bus', '491'), ('1922', 'Commercial Chassi', '491'), ('1923', 'Motorhome Chassis', '492'), ('1924', 'Commercial Chassi', '492'), ('1925', 'Boat', '493'), ('1926', 'H22b', '493'), ('1927', 'Wc112', '494'), ('1928', 'Cart', '495'), ('1929', 'Fj09', '496'), ('1930', 'Fjr1300', '496'), ('1931', 'Fx-1', '496'), ('1932', 'Fz07', '496'), ('1933', 'Fz09', '496'), ('1934', 'Fz1', '496'), ('1935', 'Fz10', '496'), ('1936', 'Fz6', '496'), ('1937', 'Fzx700', '496'), ('1938', 'Mt07', '496'), ('1939', 'Outboard Motor 150', '496'), ('1940', 'Personal Watercraft', '496'), ('1941', 'Vmx12', '496'), ('1942', 'Waverunner', '496'), ('1943', 'Wr250', '496'), ('1944', 'Wr450', '496'), ('1945', 'Xc125', '496'), ('1946', 'Xc50', '496'), ('1947', 'Xj700', '496'), ('1948', 'Xsr900', '496'), ('1949', 'Xt225', '496'), ('1950', 'Xv1600', '496'), ('1951', 'Xv1700', '496'), ('1952', 'Xv1900', '496'), ('1953', 'Xv250', '496'), ('1954', 'Xvs1100', '496'), ('1955', 'Xvs1300', '496'), ('1956', 'Xvs65', '496'), ('1957', 'Xvs650', '496'), ('1958', 'Xvs950', '496'), ('1959', 'Xvz13', '496'), ('1960', 'Yamaha Jetski', '496'), ('1961', 'Yfm550', '496'), ('1962', 'Yfm700', '496'), ('1963', 'Yfz450', '496'), ('1964', 'Yj125', '496'), ('1965', 'Yp400', '496'), ('1966', 'Yw125', '496'), ('1967', 'Yw50', '496'), ('1968', 'Yxm700', '496'), ('1969', 'Yxr450', '496'), ('1970', 'Yxr660', '496'), ('1971', 'Yxz1000', '496'), ('1972', 'Yz250', '496'), ('1973', 'Yzfr1', '496'), ('1974', 'Yzfr1s', '496'), ('1975', 'Yzfr3', '496'), ('1976', 'Yzfr6', '496'), ('1977', 'Scooter', '497'), ('1978', 'Fx', '498'), ('1979', 'Gmwv150', '499'), ('1980', 'Trailer', '500'), ('1981', 'Crossroad', '501'), ('1982', 'Zn150t-7a', '502'), ('1983', 'Fj09', '496'), ('1984', 'Fjr1300', '496'), ('1985', 'Fx-1', '496'), ('1986', 'Fz07', '496'), ('1987', 'Fz09', '496'), ('1988', 'Fz1', '496'), ('1989', 'Fz10', '496'), ('1990', 'Fz6', '496'), ('1991', 'Fzx700', '496'), ('1992', 'Mt07', '496'), ('1993', 'Outboard Motor 150', '496'), ('1994', 'Personal Watercraft', '496'), ('1995', 'Vmx12', '496'), ('1996', 'Waverunner', '496'), ('1997', 'Wr250', '496'), ('1998', 'Wr450', '496'), ('1999', 'Xc125', '496'), ('2000', 'Xc50', '496'), ('2001', 'Xj700', '496'), ('2002', 'Xsr900', '496'), ('2003', 'Xt225', '496'), ('2004', 'Xv1600', '496'), ('2005', 'Xv1700', '496'), ('2006', 'Xv1900', '496'), ('2007', 'Xv250', '496'), ('2008', 'Xvs1100', '496'), ('2009', 'Xvs1300', '496'), ('2010', 'Xvs65', '496'), ('2011', 'Xvs650', '496'), ('2012', 'Xvs950', '496'), ('2013', 'Xvz13', '496'), ('2014', 'Yamaha Jetski', '496'), ('2015', 'Yfm550', '496'), ('2016', 'Yfm700', '496'), ('2017', 'Yfz450', '496'), ('2018', 'Yj125', '496'), ('2019', 'Yp400', '496'), ('2020', 'Yw125', '496'), ('2021', 'Yw50', '496'), ('2022', 'Yxm700', '496'), ('2023', 'Yxr450', '496'), ('2024', 'Yxr660', '496'), ('2025', 'Yxz1000', '496'), ('2026', 'Yz250', '496'), ('2027', 'Yzfr1', '496'), ('2028', 'Yzfr1s', '496'), ('2029', 'Yzfr3', '496'), ('2030', 'Yzfr6', '496');
COMMIT;

-- ----------------------------
--  Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `request_time` bigint(11) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `continent_code` varchar(2) DEFAULT NULL,
  `continent_name` varchar(15) DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `region_code` varchar(10) DEFAULT NULL,
  `region_name` varchar(50) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `zip` varchar(7) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `phpsessid` varchar(50) DEFAULT NULL,
  `local_ip_addr` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sessions`
-- ----------------------------
BEGIN;
INSERT INTO `sessions` VALUES ('1', '1', '20181027110701', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', null, null, null, null, null, null, null, null, null, null, '99h61vdlrhtvsst325gp43dj35', '192.168.1.180', null, null), ('2', '1', '20181027111626', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', '99h61vdlrhtvsst325gp43dj35', '192.168.1.180', null, null), ('3', '1', '20181027111651', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', '99h61vdlrhtvsst325gp43dj35', '192.168.1.180', null, null), ('4', '2', '20181027111743', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', '99h61vdlrhtvsst325gp43dj35', '192.168.1.180', null, null), ('5', '2', '20181027111744', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', '99h61vdlrhtvsst325gp43dj35', '192.168.1.180', null, null), ('6', '2', '20181027111748', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', '99h61vdlrhtvsst325gp43dj35', '192.168.1.180', null, null), ('7', '2', '20181027111900', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', '99h61vdlrhtvsst325gp43dj35', '192.168.1.180', null, null), ('8', '2', '20181027114121', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', '99h61vdlrhtvsst325gp43dj35', '192.168.1.180', null, null), ('9', '2', '20181027121054', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', 'rp03lergciqk34dfub1o9g6ulo', '192.168.1.180', null, null), ('10', '2', '20181027121107', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', 'rp03lergciqk34dfub1o9g6ulo', '192.168.1.180', null, null), ('11', '2', '20181027121132', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', 'rp03lergciqk34dfub1o9g6ulo', '192.168.1.180', null, null), ('12', '2', '20181027121203', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', 'rp03lergciqk34dfub1o9g6ulo', '192.168.1.180', null, null), ('13', '2', '20181027121210', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', 'rp03lergciqk34dfub1o9g6ulo', '192.168.1.180', null, null), ('14', '2', '20181027121212', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', 'rp03lergciqk34dfub1o9g6ulo', '192.168.1.180', null, null), ('15', '2', '20181027121231', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', 'rp03lergciqk34dfub1o9g6ulo', '192.168.1.180', null, null), ('16', '2', '20181027121945', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:63.0) Gecko/20100101 Firefox/63.0', '', '', '', '', '', '', '', '', '', '', '0', '192.168.1.180', null, null), ('17', '2', '20181027134319', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36 OPR/56.0.3051.52', '', '', '', '', '', '', '', '', '', '', '', '192.168.1.180', null, null), ('18', '2', '20181027143605', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', null, '192.168.1.180', null, null), ('19', '2', '1540643296', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:63.0) Gecko/20100101 Firefox/63.0', '', '', '', '', '', '', '', '', '', '', null, '192.168.1.180', '2018-10-27 15:28:16', '2018-10-27 15:28:16'), ('20', '2', '1540644343', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', null, '192.168.1.180', '2018-10-27 15:45:44', '2018-10-27 15:45:44'), ('21', '1', '1540646234', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:63.0) Gecko/20100101 Firefox/63.0', '', '', '', '', '', '', '', '', '', '', 'ngc3mbshfvc3878j3d9mvge20a', '192.168.1.180', '2018-10-27 16:17:14', '2018-10-27 16:19:55'), ('22', '2', '1541930225', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/604.5.6 (KHTML, like Gecko) Version/11.0.3 Safari/604.5.6', '', '', '', '', '', '', '', '', '', '', '2l94433jn33s0an97kgv7vjb0i', '192.168.1.180', '2018-11-11 11:57:06', '2018-11-23 11:47:24');
COMMIT;

-- ----------------------------
--  Table structure for `sold_status`
-- ----------------------------
DROP TABLE IF EXISTS `sold_status`;
CREATE TABLE `sold_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sold_status`
-- ----------------------------
BEGIN;
INSERT INTO `sold_status` VALUES ('1', 'sold'), ('2', 'on approval');
COMMIT;

-- ----------------------------
--  Table structure for `start_code`
-- ----------------------------
DROP TABLE IF EXISTS `start_code`;
CREATE TABLE `start_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `start_code`
-- ----------------------------
BEGIN;
INSERT INTO `start_code` VALUES ('1', 'Can\'t test'), ('2', 'Didn\'t test'), ('3', 'Engine damage'), ('4', 'Starts w/jump'), ('5', 'Vehicle starts'), ('6', 'Won\'t start'), ('7', 'Run & Drive');
COMMIT;

-- ----------------------------
--  Table structure for `title`
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `title`
-- ----------------------------
BEGIN;
INSERT INTO `title` VALUES ('1', 'Bill Of Sale'), ('2', 'Clear'), ('3', 'Junk'), ('4', 'Non-repairable'), ('5', 'Original'), ('6', 'Other'), ('7', 'Salvage');
COMMIT;

-- ----------------------------
--  Table structure for `transmission`
-- ----------------------------
DROP TABLE IF EXISTS `transmission`;
CREATE TABLE `transmission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `transmission`
-- ----------------------------
BEGIN;
INSERT INTO `transmission` VALUES ('1', 'Automatic'), ('2', 'Manual'), ('3', 'Undefined');
COMMIT;

-- ----------------------------
--  Table structure for `us_state`
-- ----------------------------
DROP TABLE IF EXISTS `us_state`;
CREATE TABLE `us_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records of `us_state`
-- ----------------------------
BEGIN;
INSERT INTO `us_state` VALUES ('1', 'Arizona'), ('2', 'California'), ('3', 'Colorado'), ('4', 'Connecticut'), ('5', 'Florida'), ('6', 'Georgia'), ('7', 'Hawaii'), ('8', 'Illinois'), ('9', 'Indiana'), ('10', 'Iowa'), ('11', 'Kansas'), ('12', 'Louisiana'), ('13', 'Maryland'), ('14', 'Massachusetts'), ('15', 'Minnesota'), ('16', 'Nevada'), ('17', 'New Hampshire'), ('18', 'New Jersey'), ('19', 'New York'), ('20', 'North Carolina'), ('21', 'Ohio'), ('22', 'Oregon'), ('23', 'Pennsylvania'), ('24', 'South Dakota'), ('25', 'Texas'), ('26', 'Virginia'), ('27', 'Washington');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `activated` decimal(10,0) NOT NULL DEFAULT '0',
  `date_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'anya_simonova@yahoo.comm', 'sdfghj', '$2y$11$ZDNlNmI3ZTNmZTBmN2MyNu0fLxnpQriYjqdaix5Epr0TWi5xn8KRO', '2018-10-26 16:52:02', '1', '2018-10-23 00:29:11'), ('2', 'anya_simonova@yahoo.commm', 'simonova', '$2y$11$MzJjZGY0YzA5NmRhMDY5OOe6IPHrq1kA9nZ4arA5tamrZRCXVta.a', '2018-10-26 17:12:33', '1', '2018-10-23 12:55:15'), ('20', 'simonova.ganna@gmail.com', 'simonova', '$2y$11$NzA5NGU2YzEwMGFhOTdjZOcQnhn0erIu2vDWDuAME0B.FVSdQGA6m', '2018-10-26 18:16:11', '1', '2018-10-26 18:24:37'), ('21', 'anya_simonova@yahoo.con', 'simonova', '$2y$11$MTk3MGI0ZGZhMjg3ODlmMuykLcAR0S.k.lGjBZcNFlY7UWX206znW', '2018-11-29 00:28:56', '0', '2018-11-29 00:28:56'), ('22', 'anya_simonova@yahoo.com', 'simonova', '$2y$11$NTZhYWEzYjA3MjI5MzI5Z.azQYLP1MBQ.s4mrhZa6NM3YfaTvtQne', '2018-11-29 00:45:40', '1', '2018-11-29 00:45:40'), ('23', 'anya_simonova@yahooo.com', 'simonova', '$2y$11$NGNjNzkyZWJjNzZiNzViNuvP1FafL5t8.6.XtOsXsduBbNT7mynq.', '2018-11-29 00:49:26', '0', '2018-11-29 00:49:26'), ('24', 's.imonovaganna@gmail.com', 'simonova', '$2y$11$ZGQ2ZGUxNjY1YzFkOTJlNuGg05J17.m6cr4mSmmXpuaY1fC.3uVYm', '2018-12-06 17:33:41', '0', '2018-12-06 17:33:41'), ('25', 'gannas.imonova@gmail.com', 'simonova', '$2y$11$MzU3ZjVmZjJhMGUyZWZlMOGH0A1QsH/UCWauGKvqqZZF7dgSe2QgS', '2018-12-10 22:59:02', '0', '2018-12-10 22:59:02');
COMMIT;

-- ----------------------------
--  Table structure for `vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vin` varchar(20) NOT NULL,
  `stock_number` varchar(20) NOT NULL,
  `make_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `country_origin_id` int(11) NOT NULL,
  `model_year` year(4) DEFAULT NULL,
  `manufactured_year` year(4) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `odometer` varchar(10) NOT NULL,
  `odometer_measure_id` int(11) DEFAULT NULL,
  `odometer_confirmed` enum('1','0') DEFAULT NULL,
  `engine_volume_id` int(11) DEFAULT NULL,
  `engine_type` varchar(50) DEFAULT NULL,
  `fuel_id` int(11) NOT NULL,
  `drive_line_type_id` int(11) DEFAULT NULL,
  `vehicle_type_id` int(11) DEFAULT NULL,
  `vehicle_type_1` int(11) DEFAULT NULL COMMENT 'id of the vehicle type',
  `vehicle_type_2` int(11) DEFAULT NULL COMMENT 'id of the vehicle type',
  `vehicle_type_3` int(11) DEFAULT NULL COMMENT 'id of the vehicle type',
  `body_style_id` int(11) NOT NULL,
  `transmission_id` int(11) DEFAULT NULL,
  `exterior_color_id` int(11) DEFAULT NULL,
  `interior_color_id` int(11) DEFAULT NULL,
  `keys_state_id` int(11) DEFAULT NULL,
  `airbag_state_id` int(11) DEFAULT NULL,
  `start_code_id` int(11) DEFAULT NULL,
  `title_id` int(11) DEFAULT NULL,
  `damage_id_loss` int(11) DEFAULT NULL,
  `damage_id_primary` int(11) DEFAULT NULL,
  `damage_id_secondary` int(11) DEFAULT NULL,
  `damage_comments` varchar(100) DEFAULT NULL,
  `actual_cash_value` bigint(20) DEFAULT NULL,
  `repair_estimated_value` bigint(20) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `photos` longtext,
  `other_comments` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `make_id` (`make_id`),
  KEY `model_id` (`model_id`),
  KEY `country_origin_id` (`country_origin_id`),
  KEY `location_id` (`location_id`),
  KEY `odometer_measure_id` (`odometer_measure_id`),
  KEY `engine_volume_id` (`engine_volume_id`),
  KEY `fuel_id` (`fuel_id`),
  KEY `drive_line_type_id` (`drive_line_type_id`),
  KEY `vehicle_type_id` (`vehicle_type_id`),
  KEY `body_style_id` (`body_style_id`),
  KEY `transmission_id` (`transmission_id`),
  KEY `exterior_color_id` (`exterior_color_id`),
  KEY `interior_color_id` (`interior_color_id`),
  KEY `keys_state_id` (`keys_state_id`),
  KEY `airbag_state_id` (`airbag_state_id`),
  KEY `start_code_id` (`start_code_id`),
  KEY `title_id` (`title_id`),
  KEY `currency_id` (`currency_id`),
  KEY `vehicle_type_1` (`vehicle_type_1`),
  KEY `vehicle_type_2` (`vehicle_type_2`),
  KEY `vehicle_type_3` (`vehicle_type_3`),
  KEY `damage_id_loss` (`damage_id_loss`),
  KEY `damage_id_primary` (`damage_id_primary`),
  KEY `damage_id_secondary` (`damage_id_secondary`),
  CONSTRAINT `vehicle_ibfk_10` FOREIGN KEY (`body_style_id`) REFERENCES `body_style` (`id`),
  CONSTRAINT `vehicle_ibfk_11` FOREIGN KEY (`transmission_id`) REFERENCES `transmission` (`id`),
  CONSTRAINT `vehicle_ibfk_12` FOREIGN KEY (`exterior_color_id`) REFERENCES `exterior_color` (`id`),
  CONSTRAINT `vehicle_ibfk_13` FOREIGN KEY (`interior_color_id`) REFERENCES `interior_color` (`id`),
  CONSTRAINT `vehicle_ibfk_14` FOREIGN KEY (`keys_state_id`) REFERENCES `keys_presence` (`id`),
  CONSTRAINT `vehicle_ibfk_15` FOREIGN KEY (`airbag_state_id`) REFERENCES `airbag` (`id`),
  CONSTRAINT `vehicle_ibfk_16` FOREIGN KEY (`start_code_id`) REFERENCES `start_code` (`id`),
  CONSTRAINT `vehicle_ibfk_17` FOREIGN KEY (`title_id`) REFERENCES `title` (`id`),
  CONSTRAINT `vehicle_ibfk_18` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`id`),
  CONSTRAINT `vehicle_ibfk_19` FOREIGN KEY (`vehicle_type_1`) REFERENCES `vehicle_type` (`id`),
  CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`),
  CONSTRAINT `vehicle_ibfk_20` FOREIGN KEY (`vehicle_type_2`) REFERENCES `vehicle_type` (`id`),
  CONSTRAINT `vehicle_ibfk_21` FOREIGN KEY (`vehicle_type_3`) REFERENCES `vehicle_type` (`id`),
  CONSTRAINT `vehicle_ibfk_22` FOREIGN KEY (`damage_id_loss`) REFERENCES `damage` (`id`),
  CONSTRAINT `vehicle_ibfk_23` FOREIGN KEY (`damage_id_primary`) REFERENCES `damage` (`id`),
  CONSTRAINT `vehicle_ibfk_24` FOREIGN KEY (`damage_id_secondary`) REFERENCES `damage` (`id`),
  CONSTRAINT `vehicle_ibfk_25` FOREIGN KEY (`engine_volume_id`) REFERENCES `engine_volume` (`id`),
  CONSTRAINT `vehicle_ibfk_3` FOREIGN KEY (`make_id`) REFERENCES `make` (`id`),
  CONSTRAINT `vehicle_ibfk_4` FOREIGN KEY (`country_origin_id`) REFERENCES `country_of_origin` (`id`),
  CONSTRAINT `vehicle_ibfk_5` FOREIGN KEY (`location_id`) REFERENCES `us_state` (`id`),
  CONSTRAINT `vehicle_ibfk_6` FOREIGN KEY (`odometer_measure_id`) REFERENCES `distance_measure` (`id`),
  CONSTRAINT `vehicle_ibfk_7` FOREIGN KEY (`fuel_id`) REFERENCES `fuel_type` (`id`),
  CONSTRAINT `vehicle_ibfk_8` FOREIGN KEY (`drive_line_type_id`) REFERENCES `drive_line_type` (`id`),
  CONSTRAINT `vehicle_ibfk_9` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `vehicle`
-- ----------------------------
BEGIN;
INSERT INTO `vehicle` VALUES ('1', '1FTRX18W3XNB29607', '23464153', '150', '528', '16', '1999', '1999', '26', '210201', '1', '1', '43', 'V8 FI SOHC 16V F2', '4', '2', '1', null, null, null, '16', '1', '9', '1', '1', '1', '7', '2', null, '27', '15', 'Other (Charity)', null, null, null, '/usr/local/var/www/vhosts/_localhost/php/cnv2_partial/Carfax/images/catalog/1', null), ('2', '1N4AL2APXCN574721', '23535030', '312', '1374', '16', '2012', '2012', '25', '120821', '1', '1', '22', 'I4 FI DOHC 16V NF4', '4', '3', '1', null, null, null, '18', '1', '10', '2', '1', '1', '7', '2', null, '22', '15', 'Other (Remarketing Division) ', '12250', null, '1', '/usr/local/var/www/vhosts/_localhost/php/cnv2_partial/Carfax/images/catalog/2', null), ('3', 'JA4AR3AW9JZ034461', '23702450', '299', '1354', '16', '2018', '2017', '17', '23226', '1', '1', '21', ' I4 FI DOHC 16V NF4', '4', '1', '1', null, null, null, '23', '1', '19', '2', '1', '1', '7', '5', '37', '12', null, null, '18976', null, '1', '/usr/local/var/www/vhosts/_localhost/php/cnv2_partial/Carfax/images/catalog/3', null), ('4', '5YJSA1H13EFP36402', '23406967', '425', '1724', '16', '2014', '2014', '26', '32244', '1', '1', '118', 'U U NX', '2', '4', '1', null, null, null, '13', '1', '2', '2', '1', '2', '6', '7', '37', '18', '30', null, '51058', '21868', '1', '/usr/local/var/www/vhosts/_localhost/php/cnv2_partial/Carfax/images/catalog/4', null), ('5', '1G1YC2D73F5105794', '23297677', '84', '273', '16', '2015', '2015', '20', '1', '1', '1', '59', 'V8 FI DOHC 16V NF2', '4', '4', '1', null, null, null, '6', '2', '18', '2', '1', '1', '7', '7', null, '8', null, 'Water', '46045', null, '1', '/usr/local/var/www/vhosts/_localhost/php/cnv2_partial/Carfax/images/catalog/5', null), ('6', 'JYARJ18E5GA014812', '23195063', '496', '1936', '9', '2016', '2015', '6', '4599', '1', '1', null, '600 cc', '7', null, '6', null, null, null, '20', '2', '2', '2', '1', null, '5', '7', '37', '11', '15', null, '5251', '6840', '1', '/usr/local/var/www/vhosts/_localhost/php/cnv2_partial/Carfax/images/catalog/6', null), ('7', '5UXTR9C50JLC78655', '23596266', '51', '165', '5', '2018', '2017', '18', '10', '1', '0', '17', 'I4 FI DOHC F, Turbo', '1', '1', '4', null, null, null, '23', '1', '23', '2', '1', '1', '1', '1', '8', null, null, null, '44556', '38214', '1', '/usr/local/var/www/vhosts/_localhost/php/cnv2_partial/Carfax/images/catalog/7', null);
COMMIT;

-- ----------------------------
--  Table structure for `vehicle_type`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_type`;
CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `vehicle_type`
-- ----------------------------
BEGIN;
INSERT INTO `vehicle_type` VALUES ('1', 'Automobile'), ('2', 'Classics'), ('3', 'Pick-up Trucks'), ('4', 'SUV'), ('5', 'Van'), ('6', 'Motorcycle'), ('7', 'Heavy Duty Truck'), ('8', 'Trailer'), ('9', 'Bus'), ('10', 'Equipment'), ('11', 'Recreational/ Miscellaneous');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
