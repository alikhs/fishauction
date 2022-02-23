-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2017 at 07:04 PM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nelayan`
--

-- --------------------------------------------------------

--
-- Table structure for table `daemons`
--

CREATE TABLE IF NOT EXISTS `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gammu`
--

CREATE TABLE IF NOT EXISTS `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gammu`
--

INSERT INTO `gammu` (`Version`) VALUES
(13);

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE IF NOT EXISTS `inbox` (
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `RecipientID` text NOT NULL,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
`ID` int(10) unsigned NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=367 ;

--
-- Triggers `inbox`
--
DELIMITER //
CREATE TRIGGER `inbox_timestamp` BEFORE INSERT ON `inbox`
 FOR EACH ROW BEGIN
    IF NEW.ReceivingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.ReceivingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

CREATE TABLE IF NOT EXISTS `outbox` (
  `nama_dosen` varchar(50) NOT NULL,
  `ruangan` varchar(10) NOT NULL,
  `mata_kuliah` varchar(35) NOT NULL,
  `hari` varchar(10) NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `tahun` varchar(10) NOT NULL,
  `status` varchar(25) NOT NULL,
  `sesi` varchar(10) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
`ID` int(10) unsigned NOT NULL,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=407 ;

--
-- Triggers `outbox`
--
DELIMITER //
CREATE TRIGGER `outbox_timestamp` BEFORE INSERT ON `outbox`
 FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingTimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.SendingTimeOut = CURRENT_TIMESTAMP();
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `outbox_multipart`
--

CREATE TABLE IF NOT EXISTS `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pbk`
--

CREATE TABLE IF NOT EXISTS `pbk` (
`ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL,
  `Foto` varchar(250) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `pbk`
--

INSERT INTO `pbk` (`ID`, `GroupID`, `Name`, `Number`, `Foto`) VALUES
(1, 15, 'Sugiarti', '090909090', 'assets/img/logo.png'),
(28, 8, 'Khairudin Siagian', '0898989898', 'assets/img/logo.png'),
(29, 8, 'Siska Purnama Sari', '08989898989', 'assets/img/logo.png'),
(30, 8, 'Richa Ayu Riana', '+62838898989898', 'assets/img/logo.png'),
(31, 8, 'Roland Siahaan', '085277164503', 'assets/img/logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `pbk_groups`
--

CREATE TABLE IF NOT EXISTS `pbk_groups` (
  `NameGroup` text NOT NULL,
`GroupID` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `pbk_groups`
--

INSERT INTO `pbk_groups` (`NameGroup`, `GroupID`) VALUES
('Kelas MJ-5A', 2),
('Kelas IF-5A', 3),
('Kelas MJ-5B', 12),
('Kelas IF-5B', 8),
('Kelas IF-3B', 13),
('Kelas IF-3A', 14),
('Kelas MJ-3A', 15),
('Kelas MJ-3B', 16);

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE IF NOT EXISTS `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '-1',
  `Signal` int(11) NOT NULL DEFAULT '-1',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`ID`, `UpdatedInDB`, `InsertIntoDB`, `TimeOut`, `Send`, `Receive`, `IMEI`, `Client`, `Battery`, `Signal`, `Sent`, `Received`) VALUES
('', '2017-08-08 06:52:14', '2017-08-07 17:52:50', '2017-08-08 06:52:24', 'yes', 'yes', '860872013453627', 'Gammu 1.33.0, Windows Server 2007, GCC 4.7, MinGW 3.11', 0, 51, 8, 11);

--
-- Triggers `phones`
--
DELIMITER //
CREATE TRIGGER `phones_timestamp` BEFORE INSERT ON `phones`
 FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.TimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.TimeOut = CURRENT_TIMESTAMP();
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sentitems`
--

CREATE TABLE IF NOT EXISTS `sentitems` (
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sentitems`
--

INSERT INTO `sentitems` (`Text`, `DestinationNumber`, `SendingDateTime`, `DeliveryDateTime`, `InsertIntoDB`, `UpdatedInDB`, `Coding`, `UDH`, `SMSCNumber`, `Class`, `TextDecoded`, `ID`, `SenderID`, `SequencePosition`, `Status`, `StatusError`, `TPMR`, `RelativeValidity`, `CreatorID`) VALUES
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6282283350469', '2017-08-07 18:19:27', NULL, '2017-08-07 18:19:13', '2017-08-07 18:19:27', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 406, '', 1, 'SendingOKNoReport', -1, 229, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6282283350469', '2017-08-07 18:17:23', NULL, '2017-08-07 18:17:01', '2017-08-07 18:17:23', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 405, '', 1, 'SendingOKNoReport', -1, 228, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282283350469', '2017-08-07 18:15:49', NULL, '2017-08-07 18:15:44', '2017-08-07 18:15:49', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 404, '', 1, 'SendingOKNoReport', -1, 227, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282283350469', '2017-08-07 18:11:45', NULL, '2017-08-07 18:11:29', '2017-08-07 18:11:45', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 403, '', 1, 'SendingOKNoReport', -1, 226, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6282283350469', '2017-08-07 18:09:39', NULL, '2017-08-07 18:09:13', '2017-08-07 18:09:39', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 402, '', 1, 'SendingOKNoReport', -1, 225, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282283350469', '2017-08-07 18:08:35', NULL, '2017-08-07 18:08:03', '2017-08-07 18:08:35', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 401, '', 1, 'SendingOKNoReport', -1, 224, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282283350469', '2017-08-07 17:59:31', NULL, '2017-08-07 17:59:09', '2017-08-07 17:59:31', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 400, '', 1, 'SendingOKNoReport', -1, 223, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282283350469', '2017-08-07 17:57:27', NULL, '2017-08-07 17:57:23', '2017-08-07 17:57:27', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 399, '', 1, 'SendingOKNoReport', -1, 222, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6282283350469', '2017-07-31 09:00:49', NULL, '2017-07-31 09:00:26', '2017-07-31 09:00:49', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 398, '', 1, 'SendingOKNoReport', -1, 220, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282283350469', '2017-07-31 08:57:45', NULL, '2017-07-31 08:57:16', '2017-07-31 08:57:45', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 397, '', 1, 'SendingOKNoReport', -1, 219, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282283350469', '2017-07-31 08:55:39', NULL, '2017-07-31 08:55:31', '2017-07-31 08:55:39', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 396, '', 1, 'SendingOKNoReport', -1, 218, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6282283350469', '2017-07-31 08:31:35', NULL, '2017-07-31 08:31:31', '2017-07-31 08:31:35', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 395, '', 1, 'SendingOKNoReport', -1, 217, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6282283350469', '2017-07-31 08:31:01', NULL, '2017-07-31 08:30:40', '2017-07-31 08:31:01', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 394, '', 1, 'SendingOKNoReport', -1, 216, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282283350469', '2017-07-31 08:30:26', NULL, '2017-07-31 08:30:06', '2017-07-31 08:30:26', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 393, '', 1, 'SendingOKNoReport', -1, 215, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6282285304671', '2017-07-17 07:47:29', NULL, '2017-07-17 07:47:18', '2017-07-17 07:47:29', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 392, '', 1, 'SendingOKNoReport', -1, 85, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282285304671', '2017-07-17 07:46:55', NULL, '2017-07-17 07:46:37', '2017-07-17 07:46:55', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 391, '', 1, 'SendingOKNoReport', -1, 84, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282285304671', '2017-07-17 07:39:25', NULL, '2017-07-17 07:39:03', '2017-07-17 07:39:25', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 390, '', 1, 'SendingOKNoReport', -1, 83, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6282285304671', '2017-07-17 07:36:51', NULL, '2017-07-17 07:36:42', '2017-07-17 07:36:51', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 389, '', 1, 'SendingOKNoReport', -1, 82, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6282285304671', '2017-07-17 07:35:17', NULL, '2017-07-17 07:34:47', '2017-07-17 07:35:17', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 388, '', 1, 'SendingOKNoReport', -1, 81, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6282285304671', '2017-07-17 07:31:13', NULL, '2017-07-17 07:30:51', '2017-07-17 07:31:13', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 387, '', 1, 'SendingOKNoReport', -1, 80, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282285304671', '2017-07-17 07:30:09', NULL, '2017-07-17 07:30:04', '2017-07-17 07:30:09', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 386, '', 1, 'SendingOKNoReport', -1, 79, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282285304671', '2017-07-17 06:28:16', NULL, '2017-07-17 06:27:48', '2017-07-17 06:28:16', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 385, '', 1, 'SendingOKNoReport', -1, 76, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6282285304671', '2017-07-17 06:26:12', NULL, '2017-07-17 06:25:44', '2017-07-17 06:26:12', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 383, '', 1, 'SendingOKNoReport', -1, 75, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6282285304671', '2017-07-17 06:26:02', NULL, '2017-07-17 06:25:44', '2017-07-17 06:26:02', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 384, '', 1, 'SendingOKNoReport', -1, 74, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282285304671', '2017-07-17 06:25:52', NULL, '2017-07-17 06:25:44', '2017-07-17 06:25:52', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 382, '', 1, 'SendingOKNoReport', -1, 73, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6282285304671', '2017-07-17 06:20:48', NULL, '2017-07-17 06:20:45', '2017-07-17 06:20:48', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 381, '', 1, 'SendingOKNoReport', -1, 72, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6283183689099', '2017-06-20 16:50:26', NULL, '2017-06-20 16:50:06', '2017-06-20 16:50:26', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 380, '', 1, 'SendingOKNoReport', -1, 145, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6283183689099', '2017-06-20 16:24:22', NULL, '2017-06-20 16:23:56', '2017-06-20 16:24:22', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 379, '', 1, 'SendingOKNoReport', -1, 144, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6283183689099', '2017-06-20 16:22:18', NULL, '2017-06-20 16:22:10', '2017-06-20 16:22:18', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 378, '', 1, 'SendingOKNoReport', -1, 143, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6283183689099', '2017-06-20 16:18:14', NULL, '2017-06-20 16:17:46', '2017-06-20 16:18:14', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 377, '', 1, 'SendingOKNoReport', -1, 142, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6283183689099', '2017-06-20 16:13:39', NULL, '2017-06-20 16:13:18', '2017-06-20 16:13:39', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 376, '', 1, 'SendingOKNoReport', -1, 141, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6283183689099', '2017-06-20 16:02:05', NULL, '2017-06-20 16:01:55', '2017-06-20 16:02:05', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 375, '', 1, 'SendingOKNoReport', -1, 140, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6283183689099', '2017-06-20 15:56:31', NULL, '2017-06-20 15:56:04', '2017-06-20 15:56:31', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 374, '', 1, 'SendingOKNoReport', -1, 139, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6283183689099', '2017-06-16 00:41:07', NULL, '2017-06-16 00:41:00', '2017-06-16 00:41:07', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 373, '', 1, 'SendingOKNoReport', -1, 138, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6283183689099', '2017-06-16 00:40:02', NULL, '2017-06-16 00:39:38', '2017-06-16 00:40:02', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 372, '', 1, 'SendingOKNoReport', -1, 137, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6283183689099', '2017-06-16 00:27:27', NULL, '2017-06-16 00:26:55', '2017-06-16 00:27:27', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 371, '', 1, 'SendingOKNoReport', -1, 136, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900680061007000750073', '+6283183689099', '2017-06-16 00:22:52', NULL, '2017-06-16 00:22:26', '2017-06-16 00:22:52', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil dihapus', 370, '', 1, 'SendingOKNoReport', -1, 135, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6283183689099', '2017-06-16 00:20:17', NULL, '2017-06-16 00:19:46', '2017-06-16 00:20:17', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 369, '', 1, 'SendingOKNoReport', -1, 134, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6283183689099', '2017-06-15 23:55:40', NULL, '2017-06-15 23:55:29', '2017-06-15 23:55:40', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 368, '', 1, 'SendingOKNoReport', -1, 133, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6283183689099', '2017-06-15 23:54:36', NULL, '2017-06-15 23:54:13', '2017-06-15 23:54:36', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 367, '', 1, 'SendingOKNoReport', -1, 132, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6283183689099', '2017-06-15 10:05:20', NULL, '2017-06-15 10:04:48', '2017-06-15 10:05:20', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 366, '', 1, 'SendingOKNoReport', -1, 131, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C0020006400690075006200610068', '+6283183689099', '2017-06-15 08:17:03', NULL, '2017-06-15 08:16:32', '2017-06-15 08:17:03', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil diubah', 364, '', 1, 'SendingOKNoReport', -1, 129, 255, 'Gammu 1.33.0'),
('004400610074006100200042006500720068006100730069006C00200064006900740061006D006200610068', '+6283183689099', '2017-06-15 09:59:16', NULL, '2017-06-15 09:58:57', '2017-06-15 09:59:16', 'Default_No_Compression', '', '+6281100000', -1, 'Data Berhasil ditambah', 365, '', 1, 'SendingOKNoReport', -1, 130, 255, 'Gammu 1.33.0');

--
-- Triggers `sentitems`
--
DELIMITER //
CREATE TRIGGER `sentitems_timestamp` BEFORE INSERT ON `sentitems`
 FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_inbox`
--

CREATE TABLE IF NOT EXISTS `sms_inbox` (
`id` int(11) NOT NULL,
  `pesan` text,
  `nohp` varchar(20) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=250 ;

--
-- Dumping data for table `sms_inbox`
--

INSERT INTO `sms_inbox` (`id`, `pesan`, `nohp`, `waktu`) VALUES
(241, 'Tambah#ketam#6#100000', '+6282283350469', '2017-08-08 00:57:24'),
(242, 'Tambah#sotong#10#50000', '+6282283350469', '2017-08-08 00:59:06'),
(245, 'Tambah#ikan tongkol#8#40000', '+6282283350469', '2017-08-08 01:11:29'),
(247, 'Tambah#ikan mas#6#20000', '+6282283350469', '2017-08-08 01:15:41'),
(248, 'Ubah#ikan mas#2#20000', '+6282283350469', '2017-08-08 01:17:00'),
(249, 'Hapus#ikan mas', '+6282283350469', '2017-08-08 01:19:09');

-- --------------------------------------------------------

--
-- Table structure for table `tangkapan`
--

CREATE TABLE IF NOT EXISTS `tangkapan` (
`id` int(11) NOT NULL,
  `namaikan` varchar(50) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `berat` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `totalharga` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=690 ;

--
-- Dumping data for table `tangkapan`
--

INSERT INTO `tangkapan` (`id`, `namaikan`, `nohp`, `berat`, `harga`, `totalharga`, `tanggal`) VALUES
(660, 'ikan koi', '+6285765543919', 10, 1000, 10000, '0000-00-00'),
(661, 'ikan kerapu', '+6283183689099', 7, 25000, 175000, '0000-00-00'),
(663, 'ikan selikur', '+6283183689099', 0, 25000, 0, '2017-06-01'),
(664, 'ikan selikur', '+6283183689099', 0, 25000, 0, '2017-06-01'),
(665, 'ikan lele', '+6283183689099', 1, 5000, 5000, '2017-06-02'),
(679, 'ikan tongkol', '+6283183689099', 2, 4000, 8000, '2017-06-15'),
(680, 'ikan mas', '+6282285304671', 2, 10000, 20000, '2017-07-17'),
(682, 'ikan hiu', '+6282285304671', 5, 10000, 50000, '2017-07-17'),
(684, 'ikan lele', '+6282285304671', 4, 60000, 240000, '2017-07-17'),
(686, 'ketam', '+6282283350469', 6, 100000, 600000, '2017-08-07'),
(689, 'ikan tongkol', '+6282283350469', 8, 40000, 320000, '2017-08-07');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(15) NOT NULL,
  `nama` varchar(80) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `level`, `nama`, `nohp`, `foto`, `folder`) VALUES
('agus', 'fdf169558242ee051cca1479770ebac3', 'nelayan', 'agus suhardi', '+6282283350469', 'lkj.png', 'atribut/img/lkj.png'),
('admin1', 'c20ad4d76fe97759aa27a0c99bff6710', 'admin', 'Muhammad', '082285304678', 'bem.png', 'foto/bem.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `outbox`
--
ALTER TABLE `outbox`
 ADD PRIMARY KEY (`ID`), ADD KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`), ADD KEY `outbox_sender` (`SenderID`);

--
-- Indexes for table `outbox_multipart`
--
ALTER TABLE `outbox_multipart`
 ADD PRIMARY KEY (`ID`,`SequencePosition`);

--
-- Indexes for table `pbk`
--
ALTER TABLE `pbk`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
 ADD PRIMARY KEY (`GroupID`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
 ADD PRIMARY KEY (`IMEI`);

--
-- Indexes for table `sentitems`
--
ALTER TABLE `sentitems`
 ADD PRIMARY KEY (`ID`,`SequencePosition`), ADD KEY `sentitems_date` (`DeliveryDateTime`), ADD KEY `sentitems_tpmr` (`TPMR`), ADD KEY `sentitems_dest` (`DestinationNumber`), ADD KEY `sentitems_sender` (`SenderID`);

--
-- Indexes for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tangkapan`
--
ALTER TABLE `tangkapan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`nohp`), ADD UNIQUE KEY `nohp` (`nohp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=367;
--
-- AUTO_INCREMENT for table `outbox`
--
ALTER TABLE `outbox`
MODIFY `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=407;
--
-- AUTO_INCREMENT for table `pbk`
--
ALTER TABLE `pbk`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `pbk_groups`
--
ALTER TABLE `pbk_groups`
MODIFY `GroupID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sms_inbox`
--
ALTER TABLE `sms_inbox`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=250;
--
-- AUTO_INCREMENT for table `tangkapan`
--
ALTER TABLE `tangkapan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=690;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
