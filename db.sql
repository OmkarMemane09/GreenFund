# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     26_product_bl
# Server version:               5.1.73-community
# Server OS:                    Win32
# HeidiSQL version:             5.0.0.3272
# Date/time:                    2026-04-01 09:37:44
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
# Dumping database structure for 26_product_bl
CREATE DATABASE IF NOT EXISTS `26_product_bl` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `26_product_bl`;


# Dumping structure for table 26_product_bl.companyregistertbl
CREATE TABLE IF NOT EXISTS `companyregistertbl` (
  `Cusername` text,
  `Cemail` text,
  `Cpassword` text,
  `CMbNo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table 26_product_bl.companyregistertbl: 2 rows
/*!40000 ALTER TABLE `companyregistertbl` DISABLE KEYS */;
INSERT INTO `companyregistertbl` (`Cusername`, `Cemail`, `Cpassword`, `CMbNo`) VALUES ('dd', 'd2@gmail.com', 'Da@123', '9876543210'), ('dd', 'd1@gmail.com', 'Da@123', '9876543210');
/*!40000 ALTER TABLE `companyregistertbl` ENABLE KEYS */;


# Dumping structure for table 26_product_bl.product_info
CREATE TABLE IF NOT EXISTS `product_info` (
  `MID` int(10) NOT NULL AUTO_INCREMENT,
  `ProductName` text,
  `CompanyName` text,
  `DescriptionName` text,
  `MFGDate` text,
  `Price` text,
  `ExpiryDate` text,
  `Qty` text,
  `Product_No` text,
  `Farmer_Email_ID` text,
  `Farmer_Mobile_No` text,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table 26_product_bl.product_info: 2 rows
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` (`MID`, `ProductName`, `CompanyName`, `DescriptionName`, `MFGDate`, `Price`, `ExpiryDate`, `Qty`, `Product_No`, `Farmer_Email_ID`, `Farmer_Mobile_No`) VALUES (1, 'Rice', 'A1', 'best product', '2026-07-01', '50', '2026-12-01', '6', 'Ric58742', NULL, NULL), (2, 'apple', 'MI', 'best food', '2026-02-21', '150', '2027-02-03', '5', 'app6036', 'raj@gmail.com', '9876543210');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;


# Dumping structure for table 26_product_bl.product_info_order
CREATE TABLE IF NOT EXISTS `product_info_order` (
  `D_Id` int(10) NOT NULL AUTO_INCREMENT,
  `Distribute_Email_ID` text,
  `Product_No` text,
  `ProductName` text,
  `CompanyName` text,
  `Order_Qty` text,
  `MId` text,
  `Distribute_Mobile_No` text,
  `Status_Info` text,
  `Product_Price` text,
  `Farmer_Price` text,
  `Farmer_Email_ID` text,
  `Farmer_Mobile_No` text,
  PRIMARY KEY (`D_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table 26_product_bl.product_info_order: 2 rows
/*!40000 ALTER TABLE `product_info_order` DISABLE KEYS */;
INSERT INTO `product_info_order` (`D_Id`, `Distribute_Email_ID`, `Product_No`, `ProductName`, `CompanyName`, `Order_Qty`, `MId`, `Distribute_Mobile_No`, `Status_Info`, `Product_Price`, `Farmer_Price`, `Farmer_Email_ID`, `Farmer_Mobile_No`) VALUES (1, 'd2@gmail.com', 'Ric58742', 'Rice', 'A1', '2', '1', '9876543210', 'Accept Request', '100.0', '50', 'jitu@gmail.com', '9876543210'), (2, 'd1@gmail.com', 'app6036', 'apple', 'MI', '5', '2', '9876543210', 'Accept Request', '750.0', '150', 'raj@gmail.com', '9876543210');
/*!40000 ALTER TABLE `product_info_order` ENABLE KEYS */;


# Dumping structure for table 26_product_bl.registertbl
CREATE TABLE IF NOT EXISTS `registertbl` (
  `Uusername` text,
  `Uemail` text,
  `Upassword` text,
  `UMbNo` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Dumping data for table 26_product_bl.registertbl: 2 rows
/*!40000 ALTER TABLE `registertbl` DISABLE KEYS */;
INSERT INTO `registertbl` (`Uusername`, `Uemail`, `Upassword`, `UMbNo`) VALUES ('jitu', 'jitu@gmail.com', 'Ja@123', '9876543210'), ('raj', 'raj@gmail.com', 'Ra@123', '9876543210');
/*!40000 ALTER TABLE `registertbl` ENABLE KEYS */;


# Dumping structure for table 26_product_bl.tblamount
CREATE TABLE IF NOT EXISTS `tblamount` (
  `A_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Email_ID` text,
  `Amount` text,
  PRIMARY KEY (`A_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table 26_product_bl.tblamount: 2 rows
/*!40000 ALTER TABLE `tblamount` DISABLE KEYS */;
INSERT INTO `tblamount` (`A_ID`, `Email_ID`, `Amount`) VALUES (1, 'd2@gmail.com', '100000000'), (2, 'd1@gmail.com', '100000000');
/*!40000 ALTER TABLE `tblamount` ENABLE KEYS */;


# Dumping structure for table 26_product_bl.tblchatbot
CREATE TABLE IF NOT EXISTS `tblchatbot` (
  `CID` int(10) NOT NULL AUTO_INCREMENT,
  `patterns` text,
  `responses` text,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

# Dumping data for table 26_product_bl.tblchatbot: 27 rows
/*!40000 ALTER TABLE `tblchatbot` DISABLE KEYS */;
INSERT INTO `tblchatbot` (`CID`, `patterns`, `responses`) VALUES (1, 'Hi', 'Hello! How can I assist you today?'), (2, 'How are you?', 'I am just a bot, but I am doing great! How can I help you? '), (3, 'Is anyone there?', 'Yes, I am here to help you! '), (4, 'Hello', 'Hello! Good to see you again! '), (5, 'Good day', 'Good day! How can I help you? '), (6, 'Whats up', 'Not much, just here to assist you! '), (7, 'how are ya', 'I am doing great! How about you? '), (8, 'heyy', 'Hey! How can I help? '), (9, 'whatsup', 'Nothing much! What can I do for you? '), (10, '???', 'Can I help with something specific? '), (11, 'Hello!', 'Hello! How can I assist you today? '), (12, 'Good to see you again!', 'Good to see you too! '), (13, 'Hi there', 'Hi there! How can I help?'), (14, 'What is the current market price of wheat?', 'The current market price of wheat varies by region. Please specify your location.'), (15, 'How can I sell my crops?', 'You can sell your crops by registering with local agricultural markets or using online platforms like eNAM or other regional marketplaces.'), (16, 'What is eNAM?', 'eNAM stands for the National Agriculture Market, a pan-India electronic trading portal that connects farmers, traders, and buyers for better price discovery.'), (17, 'How do I check crop prices online?', 'You can check crop prices on official government websites, agriculture apps, or market information systems like eNAM or Agmarknet.'), (18, 'What is the best time to harvest rice?', 'The best time to harvest rice is when the grains are hard and yellow, usually around 30 to 35 days after flowering, depending on the variety.'), (19, 'How can I get crop insurance?', 'To get crop insurance, you can contact your local agricultural office or insurance provider offering government-backed schemes like PMFBY.'), (20, 'How can I store harvested grains?', 'Harvested grains should be dried thoroughly and stored in a cool, dry place in airtight containers or silos to prevent pest infestation and moisture.'), (21, 'What fertilizers are best for wheat crops?', 'Wheat crops require nitrogen, phosphorus, and potassium. Common fertilizers include Urea (for nitrogen), DAP (for phosphorus), and Potash (for potassium).'), (22, 'How do I prevent pests in my crops?', 'You can prevent pests by using integrated pest management techniques, rotating crops, and using organic or chemical pesticides as necessary.'), (23, 'How do I access agricultural loans?', 'Agricultural loans can be accessed through banks by applying under government schemes like Kisan Credit Card (KCC) or contacting financial institutions specializing in agri-loans.'), (24, 'How can I increase the yield of my tomatoes?', 'To increase tomato yield, ensure proper irrigation, use disease-resistant varieties, and maintain adequate spacing between plants. Also, applying organic fertilizers like compost can improve soil health. Would you like to know more about tomato cultivation techniques?'), (25, 'dfafd', 'hgdgh'), (26, 'What is the weather forecast for the next week?', 'The weather forecast for the next week shows clear skies with temperatures ranging from 20°C to 30°C. No rain expected. Would you like to know more details'), (27, 'price in rice', '50 kg');
/*!40000 ALTER TABLE `tblchatbot` ENABLE KEYS */;


# Dumping structure for table 26_product_bl.tbluser_amount
CREATE TABLE IF NOT EXISTS `tbluser_amount` (
  `A_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Email_ID` text,
  `Amount` text,
  PRIMARY KEY (`A_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

# Dumping data for table 26_product_bl.tbluser_amount: 2 rows
/*!40000 ALTER TABLE `tbluser_amount` DISABLE KEYS */;
INSERT INTO `tbluser_amount` (`A_ID`, `Email_ID`, `Amount`) VALUES (1, 'jitu@gmail.com', '100000000'), (2, 'raj@gmail.com', '100000000');
/*!40000 ALTER TABLE `tbluser_amount` ENABLE KEYS */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
