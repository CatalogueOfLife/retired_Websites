-- MySQL dump 10.10
--
-- Host: localhost    Database: sp2kwebsite
-- ------------------------------------------------------
-- Server version	5.0.22-Debian_0ubuntu6.06.2-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jos_banner`
--

DROP TABLE IF EXISTS `jos_banner`;
CREATE TABLE `jos_banner` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(10) NOT NULL default 'banner',
  `name` varchar(50) NOT NULL default '',
  `imptotal` int(11) NOT NULL default '0',
  `impmade` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(100) NOT NULL default '',
  `clickurl` varchar(200) NOT NULL default '',
  `date` datetime default NULL,
  `showBanner` tinyint(1) NOT NULL default '0',
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `custombannercode` text,
  PRIMARY KEY  (`bid`),
  KEY `viewbanner` (`showBanner`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_banner`
--


/*!40000 ALTER TABLE `jos_banner` DISABLE KEYS */;
LOCK TABLES `jos_banner` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_banner` ENABLE KEYS */;

--
-- Table structure for table `jos_bannerclient`
--

DROP TABLE IF EXISTS `jos_bannerclient`;
CREATE TABLE `jos_bannerclient` (
  `cid` int(11) NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `contact` varchar(60) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL default '0',
  `checked_out_time` time default NULL,
  `editor` varchar(50) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_bannerclient`
--


/*!40000 ALTER TABLE `jos_bannerclient` DISABLE KEYS */;
LOCK TABLES `jos_bannerclient` WRITE;
INSERT INTO `jos_bannerclient` VALUES (1,'Open Source Matters','Administrator','admin@opensourcematters.org','',0,'00:00:00',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_bannerclient` ENABLE KEYS */;

--
-- Table structure for table `jos_bannerfinish`
--

DROP TABLE IF EXISTS `jos_bannerfinish`;
CREATE TABLE `jos_bannerfinish` (
  `bid` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL default '0',
  `type` varchar(10) NOT NULL default '',
  `name` varchar(50) NOT NULL default '',
  `impressions` int(11) NOT NULL default '0',
  `clicks` int(11) NOT NULL default '0',
  `imageurl` varchar(50) NOT NULL default '',
  `datestart` datetime default NULL,
  `dateend` datetime default NULL,
  PRIMARY KEY  (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_bannerfinish`
--


/*!40000 ALTER TABLE `jos_bannerfinish` DISABLE KEYS */;
LOCK TABLES `jos_bannerfinish` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_bannerfinish` ENABLE KEYS */;

--
-- Table structure for table `jos_categories`
--

DROP TABLE IF EXISTS `jos_categories`;
CREATE TABLE `jos_categories` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `title` varchar(50) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `image` varchar(100) NOT NULL default '',
  `section` varchar(50) NOT NULL default '',
  `image_position` varchar(10) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `editor` varchar(50) default NULL,
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_section` (`section`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_categories`
--


/*!40000 ALTER TABLE `jos_categories` DISABLE KEYS */;
LOCK TABLES `jos_categories` WRITE;
INSERT INTO `jos_categories` VALUES (1,0,'News','News','','1','left','<p>Select a news item from the list below.&nbsp; If you would like any further information please contact the <a href=\"index.php?option=com_content&amp;task=view&amp;id=17&amp;Itemid=33\">Species 2000 Secretariat.</a></p><p>&nbsp;</p><a href=\"index.php?option=com_content&amp;task=view&amp;id=17&amp;Itemid=33\"></a>',1,0,'0000-00-00 00:00:00','',1,0,1,'imagefolders=*2*'),(2,0,'Joomla!','Joomla!','clock.jpg','com_weblinks','left','A selection of links that are all related to the Joomla! Project.',1,0,'0000-00-00 00:00:00',NULL,0,0,0,''),(3,0,'Newsflash','Newsflash','','2','left','',1,0,'0000-00-00 00:00:00','',0,0,0,''),(4,0,'Joomla!','Joomla!','','com_newsfeeds','left','',1,0,'0000-00-00 00:00:00',NULL,3,0,0,''),(5,0,'Business: general','Business: general','','com_newsfeeds','left','',1,0,'0000-00-00 00:00:00',NULL,2,0,0,''),(7,0,'Examples','Example FAQs','key.jpg','3','left','Here you will find an example set of FAQs.',1,0,'0000-00-00 00:00:00',NULL,0,0,2,''),(9,0,'Finance','Finance','','com_newsfeeds','left','',1,0,'0000-00-00 00:00:00',NULL,4,0,0,''),(10,0,'Linux','Linux','','com_newsfeeds','left','<br />\r\n',1,0,'0000-00-00 00:00:00',NULL,5,0,0,''),(11,0,'Internet','Internet','','com_newsfeeds','left','',1,0,'0000-00-00 00:00:00',NULL,6,0,0,''),(12,0,'Secretariat','Secretariat','','com_contact_details','left','All general enquires should be directed at the Species 2000 Secretariat in the first instance.<br />',0,0,'0000-00-00 00:00:00',NULL,4,0,0,''),(13,0,'Directors','Directors','','com_contact_details','left','The Species 2000 Directors. ',1,0,'0000-00-00 00:00:00',NULL,1,0,0,''),(15,0,'Biology','Biology','','com_newsfeeds','left','',1,0,'0000-00-00 00:00:00',NULL,1,0,0,''),(16,0,'Annual General Meetings','Annual General Meetings','','4','left','',1,0,'0000-00-00 00:00:00',NULL,1,0,0,'imagefolders='),(17,0,'Team Meetings','Team Meetings','','4','left','',1,0,'0000-00-00 00:00:00',NULL,2,0,0,'imagefolders='),(18,0,'Information Systems Group','Information Systems Group','','com_contact_details','left','The Information Systems Group (ISG) develop and manage the Species 2000 software. ',1,0,'0000-00-00 00:00:00',NULL,2,0,0,''),(19,0,'Taxonomy Working Group','Taxonomy Working Group','','com_contact_details','left','The Taxonomy Working Group guides Species 2000 on taxonomic issues.<br />',1,0,'0000-00-00 00:00:00',NULL,3,0,0,''),(20,0,'Software Overview','Software Overview','','5','left','This section contains general information about the software developed by Species 2000  ',1,0,'0000-00-00 00:00:00',NULL,6,0,0,'imagefolders='),(21,0,'Project Reports','Project Reports','','5','left','',1,0,'0000-00-00 00:00:00',NULL,5,0,0,'imagefolders='),(22,0,'Annual Checklist - Contributors Resources','Annual Checklist - Contributors Resources','','5','left','Resources for database custodians who would like to contribute to the Species 2000 Annual Checklist.',1,0,'0000-00-00 00:00:00',NULL,4,0,0,'imagefolders='),(25,0,'Documents','Documents','','5','left','',1,0,'0000-00-00 00:00:00',NULL,1,0,0,'imagefolders='),(23,0,'Dynamic Checklist - Contributors Resources','Dynamic Checklist - Contributors Resources','','5','left','Resources for database custodians contributing to the Species 2000 Dynamic Checklist. ',1,0,'0000-00-00 00:00:00',NULL,3,0,0,'imagefolders='),(24,0,'Standard Dataset Documentation','Standard Dataset Documentation','','5','left','Current and archive versions of the Species 2000 Standard Dataset.<br />',1,0,'0000-00-00 00:00:00',NULL,2,0,0,'imagefolders=');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_categories` ENABLE KEYS */;

--
-- Table structure for table `jos_components`
--

DROP TABLE IF EXISTS `jos_components`;
CREATE TABLE `jos_components` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `menuid` int(11) unsigned NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `admin_menu_link` varchar(255) NOT NULL default '',
  `admin_menu_alt` varchar(255) NOT NULL default '',
  `option` varchar(50) NOT NULL default '',
  `ordering` int(11) NOT NULL default '0',
  `admin_menu_img` varchar(255) NOT NULL default '',
  `iscore` tinyint(4) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_components`
--


/*!40000 ALTER TABLE `jos_components` DISABLE KEYS */;
LOCK TABLES `jos_components` WRITE;
INSERT INTO `jos_components` VALUES (1,'Banners','',0,0,'','Banner Management','com_banners',0,'js/ThemeOffice/component.png',0,''),(2,'Manage Banners','',0,1,'option=com_banners','Active Banners','com_banners',1,'js/ThemeOffice/edit.png',0,''),(3,'Manage Clients','',0,1,'option=com_banners&task=listclients','Manage Clients','com_banners',2,'js/ThemeOffice/categories.png',0,''),(4,'Web Links','option=com_weblinks',0,0,'','Manage Weblinks','com_weblinks',0,'js/ThemeOffice/globe2.png',0,''),(5,'Weblink Items','',0,4,'option=com_weblinks','View existing weblinks','com_weblinks',1,'js/ThemeOffice/edit.png',0,''),(6,'Weblink Categories','',0,4,'option=categories&section=com_weblinks','Manage weblink categories','',2,'js/ThemeOffice/categories.png',0,''),(7,'Contacts','option=com_contact',0,0,'','Edit contact details','com_contact',0,'js/ThemeOffice/user.png',1,''),(8,'Manage Contacts','',0,7,'option=com_contact','Edit contact details','com_contact',0,'js/ThemeOffice/edit.png',1,''),(9,'Contact Categories','',0,7,'option=categories&section=com_contact_details','Manage contact categories','',2,'js/ThemeOffice/categories.png',1,''),(10,'FrontPage','option=com_frontpage',0,0,'','Manage Front Page Items','com_frontpage',0,'js/ThemeOffice/component.png',1,''),(11,'Polls','option=com_poll',0,0,'option=com_poll','Manage Polls','com_poll',0,'js/ThemeOffice/component.png',0,''),(12,'News Feeds','option=com_newsfeeds',0,0,'','News Feeds Management','com_newsfeeds',0,'js/ThemeOffice/component.png',0,''),(13,'Manage News Feeds','',0,12,'option=com_newsfeeds','Manage News Feeds','com_newsfeeds',1,'js/ThemeOffice/edit.png',0,''),(14,'Manage Categories','',0,12,'option=com_categories&section=com_newsfeeds','Manage Categories','',2,'js/ThemeOffice/categories.png',0,''),(15,'Login','option=com_login',0,0,'','','com_login',0,'',1,''),(16,'Search','option=com_search',0,0,'','','com_search',0,'',1,''),(17,'Syndicate','',0,0,'option=com_syndicate&hidemainmenu=1','Manage Syndication Settings','com_syndicate',0,'js/ThemeOffice/component.png',0,''),(18,'Mass Mail','',0,0,'option=com_massmail&hidemainmenu=1','Send Mass Mail','com_massmail',0,'js/ThemeOffice/mass_email.png',0,''),(19,'ReMOSitory','option=com_remository',0,0,'option=com_remository','ReMOSitory','com_remository',0,'js/ThemeOffice/component.png',0,''),(20,'Show Categories','',0,19,'option=com_remository&act=showcats','Show Categories','com_remository',0,'js/ThemeOffice/component.png',0,''),(21,'Show Folders','',0,19,'option=com_remository&act=showfolders','Show Folders','com_remository',1,'js/ThemeOffice/component.png',0,''),(22,'Show Files','',0,19,'option=com_remository&act=showfiles','Show Files','com_remository',2,'js/ThemeOffice/component.png',0,''),(23,'Approve Uploads','',0,19,'option=com_remository&act=approve','Approve Uploads','com_remository',3,'js/ThemeOffice/component.png',0,''),(24,'Recalculate File Counts','',0,19,'option=com_remository&act=resetfilecounts','Recalculate File Counts','com_remository',4,'js/ThemeOffice/component.png',0,''),(25,'Reset Download Counts','',0,19,'option=com_remository&act=resetdownloads','Reset Download Counts','com_remository',5,'js/ThemeOffice/component.png',0,''),(26,'Handle Unlinked Files','',0,19,'option=com_remository&act=orphans','Handle Unlinked Files','com_remository',6,'js/ThemeOffice/component.png',0,''),(27,'List Missing Files','',0,19,'option=com_remository&act=missing','List Missing Files','com_remository',7,'js/ThemeOffice/component.png',0,''),(28,'Configuration','',0,19,'option=com_remository&act=remosconfig','Configuration','com_remository',8,'js/ThemeOffice/component.png',0,''),(29,'ReMOSitory Stats','',0,19,'option=com_remository&act=stats','ReMOSitory Stats','com_remository',9,'js/ThemeOffice/component.png',0,''),(30,'Convert pre 3.2 Database','',0,19,'option=com_remository&act=dbconvert','Convert pre 3.2 Database','com_remository',10,'js/ThemeOffice/component.png',0,''),(31,'About ReMOSitory','',0,19,'option=com_remository&act=about','About ReMOSitory','com_remository',11,'js/ThemeOffice/component.png',0,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_components` ENABLE KEYS */;

--
-- Table structure for table `jos_contact_details`
--

DROP TABLE IF EXISTS `jos_contact_details`;
CREATE TABLE `jos_contact_details` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `con_position` varchar(50) default NULL,
  `address` text,
  `suburb` varchar(50) default NULL,
  `state` varchar(20) default NULL,
  `country` varchar(50) default NULL,
  `postcode` varchar(10) default NULL,
  `telephone` varchar(25) default NULL,
  `fax` varchar(25) default NULL,
  `misc` mediumtext,
  `image` varchar(100) default NULL,
  `imagepos` varchar(20) default NULL,
  `email_to` varchar(100) default NULL,
  `default_con` tinyint(1) unsigned NOT NULL default '0',
  `published` tinyint(1) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL default '0',
  `catid` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_contact_details`
--


/*!40000 ALTER TABLE `jos_contact_details` DISABLE KEYS */;
LOCK TABLES `jos_contact_details` WRITE;
INSERT INTO `jos_contact_details` VALUES (4,'Frank Bisby','Director','Plant Science Laboratories','University of Reading','','United Kingdom','RG6 6AS','+44 118 378 6466','+44 118 378 8160','','',NULL,'f.a.bisby@rdg.ac.uk',0,1,0,'0000-00-00 00:00:00',26,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,13,0),(3,'Species 2000 Secretariat','','Plant Science Laboratories','University of Reading','Reading','United Kingdom','RG6 6AS','+44 118 378 6466','+44 118 378 8160','','',NULL,'sp2000@sp2000.org',0,0,0,'0000-00-00 00:00:00',34,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,12,0),(5,'Yuri Roskov','Species 2000 Content Manager','Plant Science Laboratories','University of Reading','','United Kingdom','RG6 6AS','+44 118 378 6466','+44 118 378 8160','','',NULL,'y.roskov@rdg.ac.uk',0,1,0,'0000-00-00 00:00:00',33,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(6,'Richard White','ISG Convenor','Cardiff University','','','United Kingdom','','','','','',NULL,'r.j.white@cs.cf.ac.uk',0,1,0,'0000-00-00 00:00:00',32,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(7,'Karen Wilson','Director','Royal Botanical Gardens Sydney','','','Australia','','','','','',NULL,'karen.wilson@rbgsyd.nsw.gov.au',0,1,0,'0000-00-00 00:00:00',31,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,13,0),(8,'Rainer Froese','','','','','','','','','','',NULL,'rfroese@ifm-geomar.de ',0,1,0,'0000-00-00 00:00:00',29,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(9,'Alex Gray','','Cardiff University','','','United Kingdom','','','','','',NULL,'W.A.Gray@cs.cf.ac.uk',0,1,0,'0000-00-00 00:00:00',25,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(10,'Michael Dadd','Director','','','','','','','','','',NULL,'mndadd@zoonom.org',0,1,0,'0000-00-00 00:00:00',28,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,13,0),(11,'Peter Schalk','Director','ETI','','','Netherlands','','','','','',NULL,'pschalk@eti.uva.nl',0,1,0,'0000-00-00 00:00:00',30,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,13,0),(12,'Vanderlei Canhos','Director','CRIA','','','Brazil','','','','','',NULL,'vcanhos@cria.org.br',0,1,0,'0000-00-00 00:00:00',27,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,13,0),(13,'Andrew Jones','','Cardiff University','','','United Kingdom','','','','','',NULL,'andrew.c.jones@cs.cf.ac.uk',0,1,0,'0000-00-00 00:00:00',24,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(14,'Frank Bisby','','University of Reading','','','United Kingdom','','','','','',NULL,'f.a.bisby@rdg.ac.uk',0,1,0,'0000-00-00 00:00:00',23,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(15,'Guy Baillargeon','','','','','Canada','','','','','',NULL,'baillarg@agr.gc.ca',0,1,0,'0000-00-00 00:00:00',22,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(16,'Junko Shimura','','','','','Japan','','','','','',NULL,'junko@nies.go.jp',0,1,0,'0000-00-00 00:00:00',21,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(17,'Lois Blaine','','','','','United States','','','','','',NULL,'lblaine@atcc.org',0,1,0,'0000-00-00 00:00:00',20,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(18,'Marc Brugman','','','','','Netherlands','','','','','',NULL,'marc@eti.uva.nl',0,1,0,'0000-00-00 00:00:00',19,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(19,'Paula Huddleston','','','','','United States','','','','','',NULL,'paula.huddleston@ociofc.usda.gov',0,1,0,'0000-00-00 00:00:00',18,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(20,'Rainer Froese','','','','','Germany','','','','','',NULL,'r.froese@ifm-geomar.de',0,1,0,'0000-00-00 00:00:00',17,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(21,'Roger Hyam','','','','','United Kingdom','','','','','',NULL,'roger@hyam.net',0,1,0,'0000-00-00 00:00:00',16,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(22,'Yuri Roskov','','','','','United Kingdom','','','','','',NULL,'y.roskov@rdg.ac.uk',0,1,0,'0000-00-00 00:00:00',15,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,18,0),(23,'Guy Baillargeon','','','','','Canada','','','','','',NULL,'baillarg@agr.gc.ca',0,1,0,'0000-00-00 00:00:00',14,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(24,'Jerry Cooper','','','','','New Zealand','','','','','',NULL,'cooperj@landcareresearch.co.nz',0,1,0,'0000-00-00 00:00:00',13,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(25,'Dennis Gordon','','','','','New Zealand','','','','','',NULL,'d.gordon@niwa.co.nz',0,1,0,'0000-00-00 00:00:00',12,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(26,'Frank Bisby','','','','','United Kingdom','','','','','',NULL,'f.a.bisby@rdg.ac.uk',0,1,0,'0000-00-00 00:00:00',11,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(27,'Jim Staley','','','','','United States','','','','','',NULL,'jtstaley@u.washington.edu',0,1,0,'0000-00-00 00:00:00',10,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(28,'Karen Wilson','','','','','Australia','','','','','',NULL,'karen.wilson@rbgsyd.nsw.gov.au',0,1,0,'0000-00-00 00:00:00',9,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(29,'Roy McDiarmid','','','','','United States','','','','','',NULL,'mcdiarmid.roy@nmnh.si.edu',0,1,0,'0000-00-00 00:00:00',8,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(30,'Scott Miller','','','','','United States','','','','','',NULL,'miller.scott:nmnh.si.edu',0,1,0,'0000-00-00 00:00:00',7,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(31,'Paul Kirk','','','','','United Kingdom','','','','','',NULL,'p.kirk@cabi.org',0,1,0,'0000-00-00 00:00:00',6,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(32,'Rainer Froese','','','','','Germany','','','','','',NULL,'r.froese@ifm-geomar.de',0,1,0,'0000-00-00 00:00:00',5,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(33,'Michael Ruggiero','','','','','United States','','','','','',NULL,'ruggiero.michael@nmnh.si.edu',0,1,0,'0000-00-00 00:00:00',4,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(34,'Adeline Soulier-Perkins','','','','','France','','','','','',NULL,'soulier@mnhm.fr',0,1,0,'0000-00-00 00:00:00',3,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(35,'Vera Imperatriz Fonseca','','','','','Brazil','','','','','',NULL,'vlifonse@ib.usp.br',0,1,0,'0000-00-00 00:00:00',2,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0),(36,'Connal Eardley','','','','','South Africa','','','','','',NULL,'vrehcde@plant5.agric.za',0,1,0,'0000-00-00 00:00:00',1,'menu_image=-1\npageclass_sfx=\nprint=\nback_button=\nname=1\nposition=1\nemail=0\nstreet_address=1\nsuburb=1\nstate=1\ncountry=1\npostcode=1\ntelephone=1\nfax=1\nmisc=1\nimage=1\nvcard=0\nemail_description=1\nemail_description_text=\nemail_form=1\nemail_copy=0\ndrop_down=0\ncontact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=',0,19,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_contact_details` ENABLE KEYS */;

--
-- Table structure for table `jos_content`
--

DROP TABLE IF EXISTS `jos_content`;
CREATE TABLE `jos_content` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `title_alias` varchar(100) NOT NULL default '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL default '0',
  `sectionid` int(11) unsigned NOT NULL default '0',
  `mask` int(11) unsigned NOT NULL default '0',
  `catid` int(11) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL default '0',
  `created_by_alias` varchar(100) NOT NULL default '',
  `modified` datetime NOT NULL default '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL default '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL default '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL default '1',
  `parentid` int(11) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_mask` (`mask`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_content`
--


/*!40000 ALTER TABLE `jos_content` DISABLE KEYS */;
LOCK TABLES `jos_content` WRITE;
INSERT INTO `jos_content` VALUES (1,'Welcome to Joomla!','Welcome','If you\'ve read anything at all about Content Management Systems (CMS), you\'ll probably know at least three things: CMS are the most exciting way to do business, CMS can be really, I mean <i>really</i>, complicated and lastly Portals are absolutely, outrageously, often <i>unaffordably</i> expensive. <br /><br />{mosimage}Joomla! is set to change all that ... Joomla! is different from the normal models for portal software. For a start, it\'s not complicated. Joomla! has been developed for the masses. It\'s licensed under the GNU/GPL license, easy to install and administer and reliable. Joomla! doesn\'t even require the user or administrator of the system to know HTML to operate it once it\'s up and running.','<h4><font color=\"#ff6600\">Joomla! features:</font></h4>\r\n<ul>\r\n<li>Completely database driven site engines </li>\r\n<li>News, products or services sections fully editable and manageable</li> \r\n<li>Topics sections can be added to by contributing authors </li>\r\n<li>Fully customisable layouts including left, center and right menu boxes </li>\r\n<li>Browser upload of images to your own library for use anywhere in the site </li>\r\n<li>Dynamic Forum/Poll/Voting booth for on-the-spot results </li>\r\n<li>Runs on Linux, FreeBSD, MacOSX server, Solaris and AIX \r\n</li></ul>\r\n<h4>Extensive Administration:</h4>\r\n<ul>\r\n<li>Change order of objects including news, FAQs, articles etc. </li>\r\n<li>Random Newsflash generator </li>\r\n<li>Remote author submission module for News, Articles, FAQs and Links </li>\r\n<li>Object hierarchy - as many sections, departments, divisions and pages as you want </li>\r\n<li>Image library - store all your PNGs, PDFs, DOCs, XLSs, GIFs and JPEGs online for easy use </li>\r\n<li>Automatic Path-Finder. Place a picture and let Joomla! fix the link </li>\r\n<li>News feed manager. Choose from over 360 news feeds from around the world </li>\r\n<li>Archive manager. Put your old articles into cold storage rather than throw them out </li>\r\n<li>Email-a-friend and Print-format for every story and article </li>\r\n<li>In-line Text editor similar to Word Pad </li>\r\n<li>User editable look and feel </li>\r\n<li>Polls/Surveys - Now put a different one on each page </li>\r\n<li>Custom Page Modules. Download custom page modules to spice up your site </li>\r\n<li>Template Manager. Download templates and implement them in seconds </li>\r\n<li>Layout preview. See how it looks before going live </li>\r\n<li>Banner manager. Make money out of your site</li></ul>',-2,1,0,1,'2004-06-12 11:54:06',62,'Web Master','2004-06-12 12:33:27',62,0,'0000-00-00 00:00:00','2004-01-01 00:00:00','0000-00-00 00:00:00','asterisk.png|left|Joomla! Logo|1|Example Caption|bottom|center|120','','',1,0,0,'','',0,1),(5,'Joomla! License Guidelines','','<p>This website is powered by <a href=\"http://www.joomla.org/\">Joomla!</a>  The software and default templates on which it runs are Copyright 2005 <a href=\"http://www.opensourcematters.org/\">Open Source Matters</a>.  All other content and data, including data entered into this website and templates added after installation, are copyrighted by their respective copyright owners.</p><p>If you want to distribute, copy or modify Joomla!, you are welcome to do so under the terms of the <a href=\"http://www.gnu.org/copyleft/gpl.html#SEC1\">GNU General Public License</a>.  If you are unfamiliar with this license, you might want to read <a href=\"http://www.gnu.org/copyleft/gpl.html#SEC4\">\'How To Apply These Terms To Your Program\'</a> and the <a href=\"http://www.gnu.org/licenses/gpl-faq.html\">\'GNU General Public License FAQ\'</a>.</p>','',-2,0,0,0,'2004-08-19 20:11:07',62,'','2004-08-19 20:14:49',62,0,'0000-00-00 00:00:00','2004-08-19 00:00:00','0000-00-00 00:00:00','','','menu_image=\nitem_title=1\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=',1,0,0,'','',0,11),(49,'Taxonomic Database Survey Questionnaire','Database Custodian Questionnaire','<p><em>The &quot;Species 2000 Taxonomic Database Survey Questionnaire for the Catalogue of Life&quot; is shown below.&nbsp; Alternatively you can download it in<a href=\"http://documents.sp2000.org/Forms/Sp2000Questionnaire_20Apr05.doc\"> MS Word format</a>.</em> </p><h2>Database summary<strong> </strong></h2><p><em>(Summary will be published in the CD-ROM booklet and credit pages)</em><br /><br /><strong>Full Database Name:</strong><br /><br /><strong>Short Database Name </strong>(nickname or acronym):<br /><br /><strong>Database Version</strong> (number or code)<br /><br /><strong>Release date</strong> (or date of download for the Catalogue of Life):<br /><br /><strong>Institution</strong>:<br /><br /><strong>Legal Custodian of the database</strong> (could be individual person, group, project, institution, etc):<br /><br /><strong>Author(s) of the database content</strong>:<br /><br /><strong>Editor(s) of the database content</strong> (if applicable):<br /><strong><br />Database abstract</strong> (free text of 50-70 words, which will be published in the Annual Checklist booklet and included as a digital credit page in the Catalogue of Life. This can be a brief database description, explanation of goals, targets, historical sketch, advertisement, thanks to sponsors, credits, etc. Please, look examples on http://annual.sp2000.org/2006/info_source_dbs.php).<br /><br /><br /><strong>Which major taxon does the Database cover</strong> (please, give both Scientific and English names of the group)?<br />&nbsp;&nbsp;&nbsp; Latin name &amp; rank:<br />&nbsp;&nbsp;&nbsp; English Name:<br /><br /><strong>Does the Database cover the taxon worldwide?&nbsp;</strong>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br /><strong>If not, which geographical areas does it incorporate?</strong><br /><br /><strong>Home URL of the Database</strong> (title page):<br /><br /></p><h2>Database full details<strong> </strong></h2><p><em>(This information will be stored in the Species 2000 Metadatabase)</em><br /><br /><strong>Search URL of the Database</strong> (search page):<br /><br /><strong>URL of Project Logo</strong>:<br /><br /><strong>Name of any wider project</strong> (if the Database is linked to, or part of any other database, project or programme):<br /><br /><strong>How many species does it contain at present?</strong> (Please, give the precise number of species for the present version)<br /><br /><strong>What is the approximate total number of names</strong> (species + synonyms)? <br /><br /><strong>What is the estimated number of known species when database will be completed?</strong><br /><br /><strong>What is the completeness of species list in the Database</strong> (in percentage):<br /><br /><strong>What are the sources of the taxonomic data and opinions</strong> (Literature, Expert data, Collection data (specimens), Survey data, On-line sources, others - explain)?<br /><br /><strong>In what form is the Dataset? </strong>(Relational db, Excel table, HTML system, Flat text, Card index, Monograph, etc.):<br /><br /><strong>What is the Database Software?</strong><br />Software of &lsquo;master database&rsquo;:<br />Software of web-based database: <br /><br /><strong>How many taxonomists are involved in maintenance and data quality verification?</strong><br /><br /><strong>Does the Database contain non-standard characters (i.e. diacritics, etc.)?&nbsp;&nbsp;&nbsp;</strong> &nbsp;&nbsp; <br />If &lsquo;Yes&rsquo;, where do they occur in the data (i.e. scientific names, author string, common names, bibliographic references, person names, distribution data, comment fields, etc.)?<br /><br /><strong>What is the approximate frequency of updating the Database</strong> (daily, weekly, monthly, annually, sporadically, fixed version): <br /><br /></p><h2>Taxonomic sector details</h2><p><br /><strong>Which rank of higher taxa above the Family does the Database contain?</strong><br /><strong><br />Is the Database species- or name- based</strong> (i.e. is it a synonymic checklist or a name list)?<br /><br /><strong>Which mediums is the database available in?</strong> (i.e. HDD, CD, DVD, local server, Web, etc.)?<br /><br /><strong>Does the Database have subspecific taxa with accepted names?</strong>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br /><br /><strong>Does the Database have subspecific taxa in synonyms?&nbsp;&nbsp;&nbsp; &nbsp;</strong>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br />If &lsquo;Yes&rsquo;, which Infraspecific Ranks are used in the Database (i.e. Subspecies, Varieties, Forms, Strains):<br /><strong><br />Is the information attached for infraspecific taxa combined in the information for the species?&nbsp;&nbsp;</strong>&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br /><br /></p><h2>Presence of Standard Dataset for species level:</h2><p>(for details see <a href=\"http://www.sp2000.org/index.php?option=com_content&amp;task=view&amp;id=41&amp;Itemid=49\">Species 2000 Standard Dataset</a> )</p><p><strong>Accepted, Valid or Correct scientific name:</strong> <br />Is this information present for all species?<br />Full Genus Name&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br />Specific Epithet&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br />Author String&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br />Name Status (i.e. Accepted, Provisionally accepted, others &ndash; please, give a list of statuses)&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br /><br />Can species names in your database be classified as: <br />Accepted species&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br />Provisionally accepted species&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br /><br />Do species have a Nomenclatural Reference (bibliographic source which contains the original (validating) publication of taxon name or new name combination) &nbsp;&nbsp;&nbsp; Yes/No<br /><br />Do species have Acceptance Status Reference(s) (bibliographic sources which accept this species in the same taxonomic status, and with the same name) &nbsp;&nbsp;&nbsp; Yes/No<br /><br /><br /><strong>Synonyms</strong><br />Does the Database have synonyms? &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br /><br />Is this information present for all synonyms?<br />Full Genus Name&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br />Specific Epithet&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br />Author String&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br />Name Status (i.e. Synonym, Ambiguous Synonym, Misapplied Name, others &ndash; please, give a list of statuses)&nbsp;&nbsp;&nbsp; Yes/No<br /><br />Can synonyms in your database be classified as: <br />Synonyms &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br />Ambiguous synonyms &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br />Misapplied names &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br /><br />Do synonyms have a Nomenclatural Reference (bibliographic source which contains the original (validating) publication of taxon name or new name combination) &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes/No<br /><br />Do synonyms have Status Reference(s) (bibliographic source which contains the original (validating) publication of taxon name or new name combination) &nbsp;&nbsp;&nbsp; Yes/No<br /><br /><br /><strong>Common Names</strong><br />Does the Database have common names? &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br /><br />If &lsquo;Yes&rsquo;, does it give for each common name:<br />The Country of usage &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br />The Language of the name&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br />Reference(s) citing the usage &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br /><br /><br /><strong>Latest taxonomic scrutiny</strong><br />Does the Database have a taxonomic scrutiny field (name of taxonomic expert who is responsible for taxonomic quality of each species record)? &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br /><br />If &lsquo;Yes&rsquo;, does the Database show: <br />Name of Expert &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br />Date of latest scrutiny &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br /><br /><strong>Family name</strong><br />Does the Database contain information about which Family the species belongs to? &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br /><br /><strong>Distribution</strong><br />Does the Database have information about the distribution of each species?&nbsp;&nbsp;&nbsp; Yes / No<br /><br />If &lsquo;Yes&rsquo;, <br />Does the Database use TDWG standard for Countries level? &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br />(TDWG &ndash; Taxonomic Databases Working Group, www.tdwg.org)<br /><br />Does species have occurrence status (in which area species is native, introduced or other - explain)? &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br /><br />If the Database contains distribution information in some other form, please, explain. <br /><br /><br /><strong>Presence of additional data &amp; Comment field:</strong><br />Does the Database have additional data?<br />Descriptions &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br />Identification tools &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br />Images &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br />Maps &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; Yes / No<br />Others (i.e. Habitats, Conservation Status, etc. etc.; please, explain)<br /><br />Which additional data would you, the Custodian, propose to include in the Comment field (your choice &ndash; up to 255 text characters available)?<br /><br /><br /><strong>Species 2000 peer review</strong><br /><br />Please suggest names and contact addresses of two or three taxonomists who could be invited as Species 2000 reviewers for your database. <br /><br /></p><h2>Contact details<strong> </strong></h2><p>(Persons &amp; Institutions)<br /><br /><strong>Responsible Officer </strong>(Senior Person, Principal Investigator):<br />&nbsp;&nbsp;&nbsp; Title: <br />&nbsp;&nbsp;&nbsp; First Name:<br />&nbsp;&nbsp;&nbsp; Family Name:<br />&nbsp;&nbsp;&nbsp; Address:<br />&nbsp;&nbsp;&nbsp; Tel.: <br />&nbsp;&nbsp;&nbsp; Fax: <br />&nbsp;&nbsp;&nbsp; Email: <br />&nbsp;&nbsp;&nbsp; WWW: <br /><strong><br />Taxonomic Manager:</strong><br />&nbsp;&nbsp;&nbsp; Title: <br />&nbsp;&nbsp;&nbsp; First Name:<br />&nbsp;&nbsp;&nbsp; Family Name:<br />&nbsp;&nbsp;&nbsp; Address:<br />&nbsp;&nbsp;&nbsp; Tel.: <br />&nbsp;&nbsp;&nbsp; Fax: <br />&nbsp;&nbsp;&nbsp; Email: <br />&nbsp;&nbsp;&nbsp; WWW: <br /><br /><strong>System Manager:</strong><br />&nbsp;&nbsp;&nbsp; Title: <br />&nbsp;&nbsp;&nbsp; First Name:<br />&nbsp;&nbsp;&nbsp; Family Name:<br />&nbsp;&nbsp;&nbsp; Address:<br />&nbsp;&nbsp;&nbsp; Tel.: <br />&nbsp;&nbsp;&nbsp; Fax: <br />&nbsp;&nbsp;&nbsp; Email: <br />&nbsp;&nbsp;&nbsp; WWW: <br /><br /><br />I give permission for Questionnaire information to be made publicly available as a part of the Species 2000 Metadatabase.<br /><br />Signature:<br /><br />Name of authorised person:<br /><br />Date: <br />&nbsp;</p>','',1,5,0,25,'2006-09-21 14:55:39',62,'','2006-09-21 15:38:39',62,0,'0000-00-00 00:00:00','2006-09-21 14:53:21','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',12,0,2,'','',0,225),(50,'Spice XML Schema','Spice XML Schema','<p>The SPICE XML Schema used by the Dynamic Checklist can be downloaded from <a href=\"http://documents.sp2000.org/DC/spicexmlschemav1.4beta.xsd\">here</a>.     </p>','',1,5,0,25,'2006-10-13 10:29:48',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-10-13 10:19:45','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,1,'','',0,65),(46,'Dynamic Checklist Instructions','Dynamic Checklist Instructions','<p>The roadmap to have your database accessible by the Dynamic Checklist is as follows:</p><ol><li>Questionnaire and metadata (about each metabase)</li><li>Online access (both for reviewers and for the checklist to use)</li><li>Peer review (&amp; technical review / locating the Species 2000 standard fields)</li><li>Joining Species 2000</li><li>Access agreement (permission for Species 2000 to access the database)</li><li>Mapping fields and wrapper writing </li><li>Testing the connection to the hub (IT and Biological content testing)</li></ol><p>Step 6 - requires that a &#39;wrapper&#39; to your database is written. This wrapper, when queried, returns results as an XML file which conforms to the <a href=\"http://documents.sp2000.org/DC/spicexmlschemav1.4beta.xsd\">Species 2000 XML Schema</a>. The document &quot;<a href=\"http://documents.sp2000.org/DC/sp2000wrapperguidelinesv1.3jan2006.doc\">Guidelines for writing a SPICE wrapper program</a>&quot; describes the steps required to write a wrapper for your database.</p><h4>Java Wrapper&nbsp; </h4><p>The most widely used wrapper is the Java wrapper.&nbsp; The documentation and source code is available for download:</p><ul><li><a href=\"http://documents.sp2000.org/DC/Wrappers/Java/readmeforjavawrapperv1_3.doc\">Java wrapper documentation</a> </li><li><a href=\"http://documents.sp2000.org/DC/Wrappers/Java/wrapper_java.tgz\">Java wrapper source code</a></li></ul><p>&nbsp;</p><h4>Python Wrapper</h4><p>The Pywrapper downloads are coming soon... </p>','',1,5,0,25,'2006-09-12 12:20:51',62,'','2006-10-19 16:07:01',62,0,'0000-00-00 00:00:00','2006-09-12 12:10:29','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',9,0,7,'','',0,184),(44,'Annual Checklist Instructions','Annual Checklist Instructions','These are the instructions for database custodians to contribute to the Species 2000 Annual Checklist. ','<p>Species 2000 is interested in all data defined in our <a href=\"index.php?option=com_content&amp;task=view&amp;id=41&amp;Itemid=31\">Standard Dataset document</a>. However, please note that we do not require our data providers to prepare their data in our format prior to sending. We are pleased to receive data in a format convenient to you. The table below lists the fields required for the Species 2000 Annual Checklist.</p><br /> <table border=\"1\"> <tbody><tr><td align=\"center\"><strong>Table Number&nbsp;</strong></td><td><strong>Table Name <br />       </strong></td><td><strong>Field Names <br />       </strong></td></tr><tr valign=\"top\"><td>&nbsp;1</td><td>Accepted Names <br /> </td><td>1&nbsp;&nbsp; &nbsp;ID<br /> 2&nbsp;&nbsp; &nbsp;Kingdom (if available in your database)<br /> 3&nbsp;&nbsp; &nbsp;Phylum (if available in your database)<br /> 4&nbsp;&nbsp; &nbsp;Class (if available in your database)<br /> 5&nbsp;&nbsp; &nbsp;Order (if available in your database)<br /> 6&nbsp;&nbsp; &nbsp;SuperFamilyName (if available in your database)<br /> 7&nbsp;&nbsp; &nbsp;Family<br /> 8&nbsp;&nbsp; &nbsp;Genus<br /> 9&nbsp;&nbsp; &nbsp;Species<br /> 10&nbsp;&nbsp; &nbsp;AuthorString<br /> 11&nbsp;&nbsp; &nbsp;InfraSpecies<br /> 12&nbsp;&nbsp; &nbsp;InfraSpMarker<br /> 13&nbsp;&nbsp; &nbsp;InfraSpecificAuthorString<br /> 14&nbsp;&nbsp; &nbsp;AdditionalData<br /> 15&nbsp;&nbsp; &nbsp;Specialist<br /> 16&nbsp;&nbsp; &nbsp;ScrutinyDate<br /> 17&nbsp;&nbsp; &nbsp;NameStatus<br /> 18&nbsp;&nbsp; &nbsp;Distribution<br /> 19&nbsp;&nbsp; &nbsp;OccurrenceStatus<br /> 20&nbsp;&nbsp; &nbsp;ReferenceID</td></tr><tr valign=\"top\"><td>&nbsp;2</td><td>Synonyms <br /> </td><td>1&nbsp;&nbsp; &nbsp;ID<br /> 2&nbsp;&nbsp; &nbsp;AcceptedName_ID<br /> 3&nbsp;&nbsp; &nbsp;Kingdom (if available in your database)<br /> 4&nbsp;&nbsp; &nbsp;Phylum (if available in your database)<br /> 5&nbsp;&nbsp; &nbsp;Class (if available in your database)<br /> 6&nbsp;&nbsp; &nbsp;Order (if available in your database)<br /> 7&nbsp;&nbsp; &nbsp;SuperFamilyName (if available in your database)<br /> 8&nbsp;&nbsp; &nbsp;Family<br /> 9&nbsp;&nbsp; &nbsp;Genus<br /> 10&nbsp;&nbsp; &nbsp;Species<br /> 11&nbsp;&nbsp; &nbsp;AuthorString<br /> 12&nbsp;&nbsp; &nbsp;InfraSpecies<br /> 13&nbsp;&nbsp; &nbsp;InfraSpMarker<br /> 14&nbsp;&nbsp; &nbsp;InfraSpecificAuthorString<br /> 15&nbsp;&nbsp; &nbsp;AdditionalData<br /> 16&nbsp;&nbsp; &nbsp;Specialist<br /> 17&nbsp;&nbsp; &nbsp;ScrutinyDate<br /> 18&nbsp;&nbsp; &nbsp;NameStatus<br /> 19&nbsp;&nbsp; &nbsp;ReferenceID</td></tr><tr valign=\"top\"><td>&nbsp;3</td><td>Common Names <br /> </td><td>1&nbsp;&nbsp;&nbsp; ID<br /> 2&nbsp;&nbsp;&nbsp; CommonName<br /> 3&nbsp;&nbsp;&nbsp; Country<br /> 4&nbsp;&nbsp;&nbsp; Language<br /> 5&nbsp;&nbsp;&nbsp; ReferenceID<br /> </td></tr><tr valign=\"top\"><td>&nbsp;4</td><td>Reference(s) <br /> </td><td>1&nbsp;&nbsp; &nbsp;ReferenceID<br /> 2&nbsp;&nbsp; &nbsp;Author(s)<br /> 3&nbsp;&nbsp; &nbsp;Year<br /> 4&nbsp;&nbsp; &nbsp;Title<br /> 5&nbsp;&nbsp; &nbsp;Details<br /> 6&nbsp;&nbsp; &nbsp;ReferenceType</td></tr><tr valign=\"top\"><td>&nbsp;5</td><td>Source Database <br /> </td><td>1&nbsp;&nbsp; &nbsp;TaxonomicCoverage<br /> 2&nbsp;&nbsp; &nbsp;DatabaseShortName<br /> 3&nbsp;&nbsp; &nbsp;DatabaseFullName<br /> 4&nbsp;&nbsp; &nbsp;DatabaseVersion<br /> 5&nbsp;&nbsp; &nbsp;ReleaseDate<br /> 6&nbsp;&nbsp; &nbsp;HomeURL<br /> 7&nbsp;&nbsp; &nbsp;SearchURL<br /> 8&nbsp;&nbsp; &nbsp;LogoURL<br /> 9&nbsp;&nbsp; &nbsp;StandardDataAbstract<br /> 10&nbsp;&nbsp; &nbsp;Custodian<br /> 11&nbsp;&nbsp; &nbsp;Author(s)/Editor(s)</td></tr></tbody> </table> <p>Please send us data in any of the following Species 2000 workable data formats (examples of which can be found <a href=\"index.php?option=com_content&amp;task=view&amp;id=45&amp;Itemid=31\">here</a> ):</p><ul><li>Delimited text</li><li>MS Excel</li><li>MS Access and MS Access supported formats</li><li>MS SQL</li><li>MySQL</li><li>Open Office</li></ul><p>Files should be archived as ZIP, GZip or RAR files to reduce their size prior to sending.&nbsp; Files should be sent via email (if less than 5Mb) or CD-ROM to the <a href=\"index.php?option=com_content&amp;task=view&amp;id=17&amp;Itemid=33\">Species 2000 Secretariat</a>.&nbsp; Alternatively if you have access to an FTP server please email the Secretariat the URL and login information if applicable.&nbsp; </p>',1,5,0,25,'2006-09-12 11:36:22',62,'','2006-10-16 14:13:13',62,0,'0000-00-00 00:00:00','2006-09-12 11:22:34','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',7,0,4,'','',0,205),(45,'Annual Checklist File Samples','Annual Checklist File Samples','<p>Below are links to a selection of files containing data suitable for inclusion in the Species 2000 Annual Checklist.</p><ul><li><a href=\"http://documents.sp2000.org/AC/Samples/access.mdb\">MS Access</a>  </li><li><a href=\"http://documents.sp2000.org/AC/Samples/excel.xls\">MS Excel</a> </li><li><a href=\"http://documents.sp2000.org/AC/Samples/delimitedtext.zip\">Delimited text</a> </li></ul><p>&nbsp;</p>','',1,5,0,25,'2006-09-12 11:49:14',62,'','2006-09-21 14:47:58',62,0,'0000-00-00 00:00:00','2006-09-12 11:45:50','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,5,'','',0,155),(51,'Next meeting in Amsterdam','','<h5>Newsflash&nbsp;</h5><p>The next Species 2000 meeting will be held at ETI in Amsterdam 8-10th November 2006. </p>','<p>The meeting will include subgroup meetings of the Taxonomy and Information System Groups as well as a Species 2000 team meeting. &nbsp;</p><p><strong>Wednesday 8th November.</strong></p><p>Two parallel sessions:</p><ul><li>Information Systems Group: convenor Richard White</li><li>Taxonomy Group: convenor Karen Wilson</li></ul><p><br /><strong>Thursday 9th November /</strong> <strong>Friday 10th November</strong></p><ul><li>Team meeting: Guy Baillargeon takes over from Karen Wilson as chair.</li></ul><pre><br /><br /></pre>',1,2,0,3,'2006-10-16 14:25:40',62,'','2006-10-16 14:39:43',62,0,'0000-00-00 00:00:00','2006-10-16 14:19:51','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',6,0,1,'','',0,51),(13,'Welcome to Species 2000','','<p>Welcome to the new Species 2000 website. Please use the menu of the left to browse for more information about the Species 2000 project or use the links below to search the <a href=\"http://www.sp2000.org\">Species 2000</a>  and <a href=\"http://www.itis.gov\">ITIS</a>   &quot;Catalogue of Life&quot;.<br /><br /></p><ul><ul><li><span class=\"link-external\"><a href=\"http://annual.sp2000.org/2006\" target=\"_blank\">Annual Checklist 2006</a></span><br />     - Species 2000 &amp; ITIS assembly of 37 taxonomic databases as a fixed annual edition<br />     - 880,000 species<br />     - Also available on a free CD-ROM from the <a href=\"index.php?option=com_content&amp;task=view&amp;id=17&amp;Itemid=33\">Species 2000 Secretariat</a> <br /> - <a href=\"index.php?option=com_content&amp;task=view&amp;id=47\">Archive versions</a>  of the Annual Checklist are available<a href=\"archive/index_html\"></a><br /><a href=\"archive/index_html\"><br /><br /></a></li></ul><li><span class=\"link-external\"><a href=\"http://spice.sp2000.org/\" target=\"_blank\">Dynamic Checklist</a></span> <br />     - real time access to the Species 2000 array of 26 online taxonomic databases<br />     - 450,000 species<br />     </li></ul> <p>Please note that database coverage differs between the <span class=\"link-external\"><a href=\"http://spice.sp2000.org/info_source_dbs.php\">Dynamic</a></span> and the <span class=\"link-external\"><a href=\"http://annual.sp2000.org/2006/info_source_dbs.php\">Annual</a></span> Checklists.</p><p align=\"center\">&nbsp;</p><p align=\"left\">{mosimage} <br /></p>','',1,0,0,0,'2006-09-07 14:01:56',62,'','2006-10-13 11:40:32',62,0,'0000-00-00 00:00:00','2006-09-07 14:00:26','0000-00-00 00:00:00','logos/sp2klogobar.png','','menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=0\nrating=0\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=0',1,0,0,'','',0,21660),(12,'About Species 2000','About ','<div class=\"documentDescription\"><strong>A brief description of the Species 2000 programme</strong></div>                                         <p>Species 2000 is a &quot;federation&quot; of database organisations working closely with users, taxonomists and sponsoring agencies. </p> <p>The goal of the Species 2000 project is to create a validated checklist of all the world&#39;s species (plants, animals, fungi and microbes).&nbsp; This is being achieved by bringing together an array of&nbsp;global species databases covering each of the major groups of organisms.&nbsp; Each&nbsp;database&nbsp;covers all known species in the group, using a consistent taxonomic system.&nbsp; The&nbsp;participating databases are widely distributed throughout the world and currently number 40.&nbsp; The existing global species databases&nbsp;presently account for some 50% of the total known species, so substantial investment in new databases will be needed for full coverage of all taxa to be achieved.&nbsp; </p> <p>The programme in partnership with the Integrated Taxonomic Information system (ITIS) of North America currently produces the Catalogue of Life&nbsp; - an Annual Checklist available on the Species 2000 web site and by CD ROM (contact the Secretariat).&nbsp; This is used by the Global Biodiversity Information facility (GBIF) as the taxonomic backbone to its web portal.&nbsp; Species 2000 receives funding from GBIF.</p>','',1,0,0,0,'2006-09-07 13:50:00',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-07 13:49:00','0000-00-00 00:00:00','','','menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=',1,0,0,'','',0,1046),(42,'Admin Login','Admin Login','<p>Authorised personel may use the login form below the menu to view and edit internal documentation and submit content for this website. &nbsp;</p><ul><li>Reset your <a href=\"index.php?option=com_registration&amp;task=lostPassword\">password</a> </li><li>Email the <a href=\"index.php?option=com_content&amp;task=view&amp;id=17&amp;Itemid=33\">Secretariat</a>  to request access&nbsp;</li></ul>','',1,0,0,0,'2006-09-12 10:38:58',62,'','2006-09-12 11:11:22',62,0,'0000-00-00 00:00:00','2006-09-12 10:34:11','0000-00-00 00:00:00','','','menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=\nrating=0\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=0',1,0,0,'','',0,351),(14,'Directors Meeting January 2006','','<p>On 4-6 January 2006 the Directors of Species 2000 met in Carmelo, Uruguay to plan the next phase of the programme. They also visited Darwin Point - the furthest place up the Rio Plata reached by Darwin on the Voyage of the Beagle.</p><br />','<p>{mosimage}</p><p>{mosimage}&nbsp;</p>',1,1,0,1,'2006-01-09 01:00:00',62,'','2006-09-11 11:29:26',62,0,'0000-00-00 00:00:00','2006-09-07 14:16:39','0000-00-00 00:00:00','photos/boarddarwinpointthumb.jpg|||0|The Directors at Darwin Point|bottom|center|\r\nphotos/boardmeetingjan2006thumb.jpg|||0|Directors meeting at Carmelo, Uruguay|bottom|center|','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',5,0,6,'','',0,87),(48,'Service Checker','Service Checker','<p>This page shows the status of the Species 2000 services.</p>  <h2>Websites</h2> &quot;; 				} 			} 			else 			{ 				echo testResult($websiteName,$liveFileName,&quot;error - reference file missing&quot;, false); 			} 		} 	} $i++; } ?&gt;  <h2>Checklists</h2>  &quot;; 				} 			} 			else 			{ 				echo testResult($websiteName,$liveFileName,&quot;error - reference file missing&quot;, false); 			} 		} 	} $i++; } ?&gt;     <h2>Wrappers</h2>         <strong><font color=\"#000e00\">&quot;.$item.&quot;</font></strong><br /> URL - &quot;.$address.&quot; <br /> Status - &quot;.$description.&quot;<br /><p>&nbsp;</p>\\n&quot;; 	} 	else 	{ 		echo &quot;<p><strong><font color=\"#00ed00\">&quot;.$item.&quot;</font></strong> <br /> URL - &quot;.$address.&quot; <br /> Status - &quot;.$description.&quot;<br /></p>\\n&quot;; 	} }   ?&gt;  ','',-2,0,0,0,'2006-09-16 10:44:23',62,'','2006-09-16 10:45:23',62,0,'0000-00-00 00:00:00','2006-09-16 10:42:59','0000-00-00 00:00:00','','','menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=',1,0,0,'','',0,1),(16,'New website!','Website!','The new Species 2000 website is launched ','some more info<br /> ',0,2,0,3,'2006-09-08 14:06:51',62,'','2006-10-16 14:26:03',62,0,'0000-00-00 00:00:00','2006-09-08 14:06:28','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=1\nintrotext=1\nsection=1\nsection_link=1\ncategory=1\ncategory_link=1\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',5,0,2,'','',0,2),(43,'Contributing to Species 2000','Contributing to Species 2000','<p>If you have a taxonomic database and would like to join the Species 2000 federation of databases please contact the Species 2000 Secretariat as all databases go through a peer review process prior to being included. You can contribute to the Annual Checklist, the Dynamic Checklist or both. </p><h3>Contributing to the Annual Checklist&nbsp;</h3><p>Every year Species 2000 and ITIS produce a fixed annual edition of the species checklist &ndash; the Annual Checklist, published in March/April. It is available on CD-ROM as a published version and accessible on the web. The Species 2000 &amp; ITIS Catalogue of Life, Annual Checklist is widely used around the world, including providing the core taxonomy for the GBIF and other portals (<span class=\"link-external\"><a href=\"http://www.gbif.org/\">www.gbif.org</a></span>).</p> <p>At present the Annual Checklist is created by the custodians providing an annual download of the Standard dataset for previously selected taxonomic sectors, and providing it to the Philippines office of Species 2000. Data are collated using MS Access and published each year on CD.</p>  <p>Data download and incorporation process ends in December of each year to allow for testing and editing before publication in April of the following year. Once the databases have been incorporated the data custodians together with the editors of the checklist are invited to test and check their sectors and send comments on whether the data are correctly incorporated in the Catalogue of Life (CoL) tables and correctly displayed on the CoL interfaces.</p><p><a href=\"index.php?option=com_content&amp;task=view&amp;id=44&amp;Itemid=49\">Instructions</a>  explaining the details (tables) required, our preferred formats and some examples of the various fields in Excel, Access and Delimited text are available in the <a href=\"index.php?option=com_content&amp;task=category&amp;sectionid=5&amp;id=25&amp;Itemid=49\">Documents</a>  section of this website. </p><h3>Contributing to the Dynamic Checklist&nbsp;</h3> <p>To enable your database to be included in the Dynamic Checklist your database must be available online and you must implement a &#39;wrapper&#39; to your database.&nbsp; A wrapper is a small program that presents the data from your databases to Species 2000 in a defined format.&nbsp; There are a number of wrappers already written in a variety of languages (Java, Python, Perl) that you can download and modify for use with your database.&nbsp; The Species 2000 Secretariat can assist you with development and testing of your wrapper.&nbsp;&nbsp;  <a href=\"index.php?option=com_content&amp;task=view&amp;id=46&amp;Itemid=49\">Instructions</a>  for how to write a wrapper are available from the <a href=\"index.php?option=com_content&amp;task=category&amp;sectionid=5&amp;id=25&amp;Itemid=49\">Documents</a> section of this website. </p><p>&nbsp;</p>','',1,0,0,0,'2006-09-12 11:21:01',62,'','2006-09-25 11:41:45',62,0,'0000-00-00 00:00:00','2006-09-12 11:12:11','0000-00-00 00:00:00','','','menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=',1,0,0,'','',0,445),(17,'Species 2000 Secretariat','Contacting Species 2000','<p><strong>If you have any questions about Species 2000 or our services please contact us at the Secretariat:</strong></p><p>Species 2000 Secretariat<br /> Centre for Plant Diversity &amp; Systematics<br />Plant Science Laboratories <br /> The University of Reading <br /> Reading<br />RG6 6AS<br />United Kingdom <br /></p><p> Tel: +44 118 378 6466<br /> Fax: +44 118 378 8160<br /> Email: <span class=\"link-mailto\"><a href=\"mailto:sp2000@sp2000.org\">sp2000@sp2000.org</a></span> <br /></p>','',1,0,0,0,'2006-09-08 15:34:19',62,'','2006-09-12 12:29:00',62,0,'0000-00-00 00:00:00','2006-09-08 15:32:33','0000-00-00 00:00:00','','','menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=',1,0,0,'','',0,934),(18,'Annual General Meeting 2006','Annual General Meeting 2006','<p>Species 2000 Annual General Meeting for 2006 was held at the Laboratoire d&#39;Entomologie, Mus&eacute;um National d&#39;Histoire Naturelle on Friday, 26 May.</p><p>             The AGM Agenda can be downloaded <a href=\"http://www.sp2000.org/meetings/Meetings2006/2006agm.pdf/download\" target=\"_blank\">here</a>.  <br /> The Chairmans report presented at the meeting can be downloaded <a href=\"http://www.sp2000.org/meetings/Meetings2006/SP2kChairReport.ppt/download\" target=\"_blank\">here</a>. <br /></p>','',1,4,0,16,'2006-09-08 15:40:07',62,'','2006-09-08 16:02:22',62,0,'0000-00-00 00:00:00','2006-09-08 15:39:03','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',3,0,1,'','',0,93),(19,'Annual General Meeting 2005','Annual General Meeting 2005','The AGM 2005 was held in Qawra,Malta','',1,4,0,16,'2006-09-08 16:18:17',62,'','2006-09-11 14:11:40',62,0,'0000-00-00 00:00:00','2006-09-08 16:17:49','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,2,'','',0,46),(47,'Annual Checklist Archives','Annual Checklist Archives','<p>The Species 2000 and ITIS Catalogue of Life Annual Checklist has been released each year since 2000 (excluding 2001).&nbsp; Previous checklists can be queried below:</p><ul><li><a href=\"http://annual.sp2000.org/2006\">Annual Checklist 2006</a>  - 884,000 taxa </li><li><a href=\"http://annual.sp2000.org/2005\">Annual Checklist 2005</a>  - 527,000 taxa<br /></li><li><a href=\"http://annual.sp2000.org/2004\">Annual Checklist 2004</a>  - 323,000 taxa<br /></li><li><a href=\"http://annual.sp2000.org/2003\">Annual Checklist 2003</a>  - 304,000 taxa<br /></li><li><a href=\"http://annual.sp2000.org/2002\">Annual Checklist 2002</a>  - 260,000 taxa<br /></li><li><a href=\"http://annual.sp2000.org/2000\">Annual Checklist 2000</a>  - 220,000 taxa<br /></li></ul>','',1,0,0,0,'2006-09-15 10:05:56',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-15 09:56:14','0000-00-00 00:00:00','','','menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=',1,0,0,'','',0,503),(20,'Species 2000 Annual Checklist reaches half a million','Species 2000 Annual Checklist reaches half a million','<p>The Annual Checklist on CD for 2005 now has over 527,000 species.</p><p>&nbsp;</p>','The Species 2000 and ITIS Catalogue of Life Annual CD for 2005 has three new datasets and now contains over 527,000 species.',1,1,0,1,'2005-11-04 01:00:00',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-11 11:27:02','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,12,'','',0,85),(21,'Asia-Oceania workshop','Asia-Oceania workshop','<div class=\"documentDescription\">Species 2000 AO will be holding a regional workshop in Oct 2005 in Taipei, Taiwan</div><br />','<p>Professor Kwang-Tsao Shao has organised a biodiversity workshop for the Asia Oceania region at the Academia Sinica, Taipei from&nbsp;1 to 2 October 2005.</p>  <p>Please contact the Species 2000 Secretariat for further details.</p> ',0,1,0,1,'2005-11-04 01:00:00',62,'','2006-09-12 10:45:36',62,0,'0000-00-00 00:00:00','2006-09-11 11:29:29','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,11,'','',0,1),(22,'New Dynamic Checklist launched','New Dynamic Checklist launched','<div class=\"documentDescription\">The new Species 2000 Dynamic Checklist was launched at a meeting held in Stockholm, Sweden on 15th October  </div>                                         <p>&nbsp;</p>','On Saturday 15th October 2005, at a joint Biodiversity Informatics Fair held by the europa project of Species 2000 and&nbsp;the European Network for Biodiversity Information project,&nbsp; the new Dynamic Checklist was launched.&nbsp; Click on the Dynamic Checklist link on the Species 2000 home page to see the new query interface and to search the 527,000 species now available&nbsp;in real time from the&nbsp;participating databases.&nbsp;<br /> For further details see the Meetings folder.',1,1,0,1,'2005-12-08 01:00:00',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-11 11:34:17','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,10,'','',0,80),(23,'Species 2000 europa at CER','Species 2000 europa at CER','<div class=\"documentDescription\">The Communicating European Research exhibition to be held on 14 and 15th November in Brussels, will have a stand for the europa project. </div><p>The Species 2000 europa project will be demonstrating its achievements on stand 1.085 at the CER exhibition in Brussels.</p>   <p>The new Dynamic Checklist will be on display and information about individual databases.</p> ','',1,1,0,1,'2005-12-08 01:00:00',62,'','2006-09-11 11:36:39',62,0,'0000-00-00 00:00:00','2006-09-11 11:35:51','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,9,'','',0,81),(24,'Biodiversity Workshops','Biodiversity Workshops','<div class=\"documentDescription\">Details of two forthcoming workshops organised by the European Network for Biodiversity Information (ENBI)</div>                                         <p>Biodiversity Information and the Law - an Advanced Workshop to be held at the Royal Botanic Gardens, Kew, UK 30 Nov-2 Dec 2005.</p> <p>Biodiversity Information and Informatics - a Training Workshop to be held at Charles University of Prague, Czech Republic 21-22 Nov 2005.</p> <p>For a registration form contact Chris Johnson <span class=\"link-mailto\"><a href=\"mailto:cjohnson@maich.gr\">cjohnson@maich.gr</a></span></p>','',0,1,0,1,'2005-12-08 01:00:00',62,'','2006-09-12 10:45:36',62,0,'0000-00-00 00:00:00','2006-09-11 11:36:58','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,8,'','',0,1),(25,'Asia-Oceania taxonomy for biodiversity','Asia-Oceania taxonomy for biodiversity','<div class=\"documentDescription\">Report from the 2nd Global Taxonomy Initiative Regional Workshop in Asia-Oceania</div>                                         <p>Members of the Species 2000 global team based in Asia-Oceania (Junko Shimura, Karen Wilson and Dennis Gordon) assisted in preparing the report of the 2nd Global Taxonomy Initiative Regional Workshop in Asia-Oceania, held in Wellington, New Zealand 9-10 October 2004.<br /> </p> <p>Copies of&nbsp;the report are available from the GTI National Focal Point for Japan, National Institute for&nbsp;Environmental Studies, 16-2 Onogawa, Tsukuba, Ibaraki 305-8506 Japan</p>','',0,1,0,1,'2005-12-08 01:00:00',62,'','2006-09-12 10:45:36',0,0,'0000-00-00 00:00:00','2006-09-11 11:38:34','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,7,'','',0,1),(26,'Catalogue of Life at SBSTTA','Catalogue of Life at SBSTTA','<div class=\"documentDescription\">Species 2000 and ITIS lunchtime meeting at the recent CBD SBSTTA meeting in Montreal</div><div class=\"documentDescription\">&nbsp;</div> Frank Bisby of Species 2000 and Mike Ruggiero of ITIS (The Catalogue of Life partnership) held a lunchtime meeting at the CBD SBSTTA meeting held in Montreal last week.&nbsp;         ','',1,1,0,1,'2006-01-26 01:00:00',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-11 11:39:25','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,5,'','',0,91),(27,'Species 2000 welcomes two new team members','Species 2000 welcomes two new team members','<div class=\"documentDescription\">Two new members have joined the species 2000 project management team.</div><div class=\"documentDescription\">&nbsp;</div><p> They are Jerry Cooper of Landcare Research in New Zealand and Cyril Gallut of the Universit&eacute; Pierre et Marie Curie in Paris, France.</p><p>At the same time Peter Schalk and Vanderlei Perez Canhos are stepping down from the team, but will remain as Directors.&nbsp; Professor Kwang-Tsao Shao will also leave the team, but remains with Species 2000 Asia-Oceania.</p>','',1,1,0,1,'2006-02-22 01:00:00',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-11 11:40:14','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,4,'','',0,65),(28,'Two more team members','Two more team members','<div class=\"documentDescription\">The Species 2000 project management team welcomes two more new members</div><div class=\"documentDescription\">&nbsp;</div> Dennis Gordon of NIWA, New Zealand and Marc Brugman of ETI BioInformatics in The Netherlands join the Species 2000 project management team in March 2006.','',1,1,0,1,'2006-03-20 01:00:00',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-11 11:41:21','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,3,'','',0,82),(29,'Species 2000 represented at CBD CoP','Species 2000 represented at CBD CoP','<div class=\"documentDescription\">Frank Bisby, Peter Schalk and Vanderlei Perez Canhos will be representing Species 2000 at the Conference of the Parties for the Convention for Biological Diversity in Curitiba, Brazil 20-31 March 2006 </div>                                                  ','',1,1,0,1,'2006-03-20 01:00:00',62,'','2006-09-12 10:20:07',62,0,'0000-00-00 00:00:00','2006-09-11 11:42:00','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',4,0,2,'','',0,77),(30,'Successful meetings in Paris','Successful meetings in Paris','<div class=\"documentDescription\">Species 2000 and Species 2000 europa had a group of successful meetings in Paris (23 - 26 May 2006) marking the achievement of &#39;Half of All Known Species&#39; in the Catalogue of Life. </div>                                         <p>The meetings ran over four days and included:</p> <ul><li>Species 2000 Secretariat and ITIS consulting meeting at CODATA/IUBS building  on Tuesday, 23 May</li><li>Catalogue of Life Partnership meeting at CODATA/IUBS building on Wednesday,  24 May </li><li>Species 2000 Team meeting at CODATA/IUBS building on Thursday, 25 May </li><li>Species 2000 Annual General Meeting and Species 2000 europa Regional Meeting at the Laboratoire d&#39;Entomologie, Mus&eacute;um National d&#39;Histoire Naturelle on Friday, 26 May </li></ul><br />{mosimage}<br />','',1,1,0,1,'2006-05-31 01:00:00',62,'','2006-09-11 11:51:36',62,0,'0000-00-00 00:00:00','2006-09-11 11:43:02','0000-00-00 00:00:00','photos/paristeammay2006.jpg|center||0|Participants at the Species 2000 Team meeting (left to right, Cyril Gallut, Mike Ruggiero, Frank Bisby, Yuri Roskov, Peter Brewer, Richard White and Karen Wilson)|bottom||','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',4,0,1,'','',0,97),(31,'Annual General Meeting 2004','Annual General Meeting 2004','The 2004 AGM was held on 7 May 2004 at Smithsonian Institution, Washington DC, USA. ','',1,4,0,16,'2006-09-11 14:41:39',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-11 14:40:31','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,3,'','',0,43),(32,'Annual General Meeting 1999','Annual General Meeting 1999','The first Species 2000 AGM was held on 16 March 1999 in London, UK.','',1,4,0,16,'2006-09-11 14:42:49',62,'','2006-09-11 14:46:49',62,0,'0000-00-00 00:00:00','2006-09-11 14:42:33','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,6,'','',0,35),(33,'Annual General Meeting 2000','Annual General Meeting 2000','The 2000 AGM was held on 7 April 2000 in Amsterdam, The Netherlands.','',1,4,0,16,'2006-09-11 14:47:43',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-11 14:47:04','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,5,'','',0,38),(34,'Annual General Meeting 2001','Annual General Meeting 2001','The 2001 AGM was held on 2 April 2001 in Paris, France.','',1,4,0,16,'2006-09-11 14:48:49',62,'','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2006-09-11 14:48:11','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',1,0,4,'','',0,41),(35,'Team Meetings 2005','Team Meetings 2005','<p>17th March - Information Systems Group and Taxonomy Working Group Meetings, Malta</p><p align=\"justify\">18-19th March - Global Team Meeting and directors meetings, Malta</p> <p align=\"justify\">16th October - Taxonomy Group Meeting and GBIF ECAT, The Natural History Museum, Stockholm, Sweden</p> <p align=\"justify\">17th October - Global Team Meeting, The Natural Hsitory Museum, Stockholm, sweden</p><p>&nbsp;</p>','',1,4,0,17,'2006-09-11 14:52:28',62,'','2006-09-11 14:52:53',62,0,'0000-00-00 00:00:00','2006-09-11 14:51:20','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,1,'','',0,46),(36,'Team Meetings 2004','Team Meetings 2004','<p>4-6 May 2004 - Smithsonian Institution, Washington DC, USA.<br />7 May 2004 - Smithsonian Institution, Washington DC, USA. <br /> 3-4 October 2004 - Christchurch, New Zealand.</p>','',1,4,0,17,'2006-09-11 15:07:12',62,'','2006-09-11 15:07:21',62,0,'0000-00-00 00:00:00','2006-09-11 14:53:35','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,2,'','',0,37),(37,'Miscellaneous Meetings 1999-2003','Miscellaneous Meetings 1999-2003',' <ul><li>Species Plantarum. Species 2000 Plantarum abstract available <a href=\"http://www.sp2000.org/Presentations/Sweden%20abstract.doc\"><font color=\"#0000ff\">here</font></a>. (2003) </li></ul> <ul><li><span class=\"link-external\"><a href=\"http://www-gti.nies.go.jp/forum2003%20\"><font color=\"#0000ff\">Joint International Forum on Biodiversity Information</font></a></span>. 4-10th October 2003 , Tsukuba, Japan. </li></ul> <ul><li><a href=\"http://www.sp2000.org/whatsnewarchive.html#startup\"><font color=\"#0000ff\">Species 2000 Europa Startup Meeting</font></a>, 6, 7, 8 May 2003 The University of Reading. </li></ul> <ul><li><span class=\"link-external\"><a href=\"http://www.cria.org.br/eventos/tdbi/\"><font color=\"#0000ff\">TDWG</font></a></span> meetings Indaiatuba, Brazil 18-20 October 2002.<br />     </li><li><a href=\"http://www.sp2000.org/www-sp2000ao.nies.go.jp/english/gti/GTIwksp.html\"><font color=\"#0000ff\">Asia GTI workshop</font></a> 9-13 September 2002, Putrajaya, Malaysia. <br />     </li><li><span class=\"link-external\"><a href=\"http://plantnet.rbgsyd.gov.au/bioforum/col/col.html\"><font color=\"#0000ff\">The Architecture for the Catalogue of Life</font></a></span> - a public workshop organised by Species 2000 and ITIS, working with GBIF, All-Species and others 15-16 March 2002, Sydney, Australia. </li><li><a href=\"http://www.sp2000.org/whatsnewarchive.html#bbsrc_itis\"><font color=\"#0000ff\">BBSRC/ITIS Joint International Workshop</font></a>: Biodiversity Informatics and the Catalogue of Life 5-7 June 2001, Reading, UK.<br />     </li><li><a href=\"http://www.sp2000.org/whatsnewarchive.html#symp2001\"><font color=\"#0000ff\">Symposium: Species 2000 and the Catalogue of Life</font></a>, 2 April 2001, Paris, France.<br />     </li><li><a href=\"http://www.sp2000.org/whatsnewarchive.html#sp2kiny2k\"><font color=\"#0000ff\">Species 2000 in the year 2000</font></a> - a public presentation, 7 April 2000, Amsterdam, The Netherlands.<br />     </li><li><a href=\"http://www.sp2000.org/whatsnewarchive.html#millennial\"><font color=\"#0000ff\">Millennial Symposium</font></a> - Species 2000. 1-5 February 2000, Wellington, New Zealand.<br />     </li><li><a href=\"http://www.sp2000.org/whatsnewarchive.html#2ndworkshop\"><font color=\"#0000ff\">Second International Workshop of Species 2000</font></a>, 14-16 July 1999, Tsukuba, Japan.<br />     </li><li><a href=\"http://www.sp2000.org/whatsnewarchive.html#colloquium\"><font color=\"#0000ff\">Species 2000 in the Americas</font></a> - a public workshop, 3 November 1999, Manassas, USA. </li></ul>','',1,4,0,17,'2006-09-11 15:09:41',62,'','2006-09-11 15:10:08',62,0,'0000-00-00 00:00:00','2006-09-11 15:07:59','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,3,'','',0,40),(38,'SPICE software','SPICE software','<div class=\"plain\">Established in 1998, SPICE was a project funded by the UK <a href=\"http://www.bbsrc.ac.uk/\">Biotechnology and Biological Sciences Research Council</a>  (BBSRC) to carry out fundamental research into a new robust and scaleable architecture for Species 2000.&nbsp; The original project partners were <a href=\"http://www.cs.cf.ac.uk\">Cardiff University</a> , <a href=\"http://www.soton.ac.uk\">Southampton University</a> , <a href=\"http://www.rdg.ac.uk\">The University of Reading</a> , <a href=\"http://www.rbgkew.org.uk\">Royal Botanic Gardens Kew</a>  and the <a href=\"http://www.nhm.ac.uk\">Natural History Museum London</a> . <br /><br />Since then the SPICE project has developed the distributed computing engine that runs the Dynamic Checklist.&nbsp; Then &quot;wrapper&quot; programmes allow a number of species databases to be queried simultaneously, returning a uniform list of results.</div><div class=\"plain\">&nbsp;</div><div class=\"plain\">The conceptual basis of the SPICE distributed system rotates around the SPICE Common Data Model (CDM) described in various documents (<a href=\"http://documents.sp2000.org/DC/CommonDataModel1.20.rtf\">CDM v1.20</a>, <a href=\"http://documents.sp2000.org/DC/CommonDataModel1.21.rtf\">CDM v1.21</a>).&nbsp; This specifies the SPICE Protocol by which the Common Access System (CAS) queries the array of connected databases, and the responses envisaged from these databases.&nbsp; However, for precise clarification of which items have been implemented in the Species 2000 project please see i) <a href=\"index.php?option=com_content&amp;task=view&amp;id=46&amp;Itemid=49\">Dynamic Checklist Instructions</a>&nbsp; ii) <a href=\"http://documents.sp2000.org/DC/spicexmlschemav1.4beta.xsd\">SPICE XML Schema</a>.&nbsp;  </div><div class=\"plain\">&nbsp;</div><div class=\"plain\">The current version of SPICE (4.1 March 2004) contains the following features:<br /><br />Since version 4.1:<br /></div><div class=\"plain\"><ul><li>Hierarchy support with demonstration interface</li><li>Updated web service </li><li>Hierarchy requests added</li><li>Ability to choose between global and euro hubs</li><li>Extended type 3 functionality (can get data for multiple hubs in one request)</li><li>Caching system bug fixes&nbsp; </li></ul><br />Since version 4.0:<br /><ul><li>External test module</li><li>Tests both the CAS and wrappers</li><li>CAS tester automatically restarts the CAS in the event of an error </li><li>Wrapper test cases configurable via the www</li><li>Tests automatically run at configurable times </li><li>Automatic emailed test reports</li><li>Runs as a windows service (automatically restarts when server is rebooted)</li><li>Improved handling of unexpected wrapper responses</li><li>Replacement of the &ldquo;Availability agent&rdquo; component</li><li>New caching system</li><li>All wrapper data cached </li><li>Cache automatically updated when the wrapper reports GSD data updates&nbsp; </li></ul><br />Since version 3.x:<br /><ul><li>CAS web service to provide programmatic access</li><li>Support for CDM 1.20 (backward compatible with CDM 1.11)</li><li>Global/European hub switch</li><li>Web based wrapper configuration tool</li><li>New simplified installation procedure</li><li>CAS debugging application</li><li>Improved logging system (including request login)</li></ul><br />Main Features from previous versions:<br /><ul><li>CDM 1.11 support</li><li>Servlet based web interface</li><li>CORBA architecture to provide scalability&nbsp; </li></ul><br /><br />Papers about SPICE:<br />AC Jones, X Xu, N Pittas, WA Gray, NJ Fiddian, RJ White, JS Robinson, FA Bisby and SM Brandt, SPICE: Architecture for integrating autonomous databases to a distributed catalogue of Life.&nbsp; Proc 11th Int. Conference and Workshop on Database and Expert Systems Applications (DEXA 2000), Springer-Verlag (Lecture Notes in Computer Science), 10pp, September 2000.&nbsp;&nbsp;&nbsp;&nbsp; <br /><br /></div>','',1,5,0,25,'2006-09-11 15:24:01',62,'','2006-10-13 11:22:22',62,0,'0000-00-00 00:00:00','2006-09-11 15:20:20','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',7,0,6,'','',0,169),(39,'LITCHI software','LITCHI software','<div class=\"documentDescription\">Information about the LITCHI software which allows comparisons of different taxonomic treatments</div>                            <div class=\"plain\"> LITCHI is a collaborative project on &quot;taxonomically intelligent&quot; software for interrelating species diversity databases with differing taxonomic treatments.&nbsp; It was originally funded by the UK Biotechnology and Biological Sciences Research Council (BBSRC) and was&nbsp;developed&nbsp;by three research groups in <span class=\"link-external\"><a href=\"#Cardiff\"><u><font color=\"#800080\">Cardiff</font></u></a></span>, <span class=\"link-external\"><a href=\"#Southampton\"><u><font color=\"#800080\">Southampton</font></u></a></span> and <span class=\"link-external\"><a href=\"#Reading\"><u><font color=\"#800080\">Reading</font></u></a></span> Universities.</div><div class=\"plain\">&nbsp;</div><div class=\"plain\"> <ul><li><span class=\"link-external\"><a href=\"http://litchi.biol.soton.ac.uk/summary.html\"><font color=\"#0000ff\">Summary</font></a></span> </li><li><span class=\"link-external\"><a href=\"http://litchi.biol.soton.ac.uk/staff.html\"><font color=\"#0000ff\">Staff</font></a></span>, including permanent institution staff and temporary project employees </li><li>Brief description, similar to a <span class=\"link-external\"><a href=\"http://litchi.biol.soton.ac.uk/poster.html\"><font color=\"#0000ff\">poster</font></a></span> displayed at BBSRC/EPSRC Bioinformatics Workshop, Cambridge, 5 &amp; 6 January 1998 </li><li>PowerPoint <span class=\"link-external\"><a href=\"http://litchi.biol.soton.ac.uk/litchi.ppt\"><font color=\"#0000ff\">slide show</font></a></span> (1.1 Gb) used in the research talk by White &amp; Gray at BBSRC/EPSRC Bioinformatics Workshop, Hinxton, 5 February 1999 </li><li>More detailed <span class=\"link-external\"><a href=\"http://litchi.biol.soton.ac.uk/project.html\"><font color=\"#0000ff\">description</font></a></span> of the project </li><li>Why is it called <span class=\"link-external\"><a href=\"http://litchi.biol.soton.ac.uk/name.html\"><font color=\"#0000ff\">LITCHI</font></a></span>? </li><li>Original project <span class=\"link-external\"><a href=\"http://litchi.biol.soton.ac.uk/proposal.html\"><font color=\"#0000ff\">proposal</font></a></span> </li></ul>         </div>','',1,5,0,25,'2006-09-11 15:25:01',62,'','2006-10-13 11:19:55',62,0,'0000-00-00 00:00:00','2006-09-11 15:24:25','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',3,0,9,'','',0,154),(40,'SPICE / Dynamic Checklist Web Service','SPICE Web Service','<p>The SPICE Common Access System (CAS) that runs the Dynamic Checklist is available via an AXIS web service.&nbsp; A document describing the the web service is available for download from <a href=\"http://documents.sp2000.org/Documentation/CASWebService.rtf\">here</a>.</p><p>&nbsp;</p><p>&nbsp;</p>','',1,5,0,25,'2006-09-11 15:29:51',62,'','2006-10-13 11:35:17',62,0,'0000-00-00 00:00:00','2006-09-11 15:26:45','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',3,0,8,'','',0,164),(41,'Standard Dataset','Standard Dataset','<p>Species 2000 plans to deliver a standard set of data for every known species. These data will be drawn from an array of participating taxonomic databases. </p><p>Species 2000 has defined ten field groups to be the standard set of data for each species (or infraspecies). <br /><br />1.&nbsp; Accepted Scientific Name linked to References (obligatory)<br />2.&nbsp; Synonym(s) linked to Reference(s) (obligatory, as appropriate)<br />3.&nbsp; Common Name(s) linked to Reference(s) (optional)<br />4.&nbsp; Latest taxonomic scrutiny (obligatory)<br />5.&nbsp; Source Database (obligatory)<br />6.&nbsp; Additional Data (optional)<br />7.&nbsp; Family name (obligatory)<br />8.&nbsp; Classification above family, and highest taxon (obligatory, as appropriate)<br />9.&nbsp; Distribution (optional)<br />10. Reference(s)</p><p>You can download the full standard dataset documents here:</p><ul><li><a href=\"http://documents.sp2000.org/Documentation/standarddatasetv3.2dec2004.doc\">Standard Dataset v3.2</a>  - December 2004</li><li><a href=\"http://documents.sp2000.org/Documentation/standarddatasetv3oct2004.doc\">Standard Dataset v3.0</a>  - October 2004</li><li><a href=\"http://documents.sp2000.org/Documentation/standarddatasetv2may2003.doc\">Standard Dataset v2.0</a> - May 2003</li><li><a href=\"http://documents.sp2000.org/Documentation/standarddatasetv1.2dec2002.doc\">Standard Dataset v1.2</a>  - December 2002</li></ul>','',1,5,0,25,'2006-09-11 15:40:45',62,'','2006-09-21 14:47:45',62,0,'0000-00-00 00:00:00','2006-09-11 15:32:26','0000-00-00 00:00:00','','','pageclass_sfx=\nback_button=\nitem_title=1\nlink_titles=\nintrotext=1\nsection=0\nsection_link=0\ncategory=0\ncategory_link=0\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nkeyref=\ndocbook_type=',2,0,3,'','',0,228),(52,'File not found - error 404','File not found - error 404','<p>The file you are looking for cannot be found.&nbsp; If you manually typed the URL please check for typing mistakes or if you followed a link please notify the <a href=\"index.php?option=com_content&amp;task=view&amp;id=17&amp;Itemid=33\">Secretariat</a>. We apologies for the inconvenience.&nbsp;</p><p>Useful links:</p><ul><li><a href=\"http://www.sp2000.org\">Species 2000 homepage</a> </li><li><a href=\"http://annual.sp2000.org\">Annual Checklist</a> <br /></li><li><a href=\"http://dynamic.sp2000.org\">Dynamic Checklist</a> </li></ul>','',1,0,0,0,'2006-10-23 16:14:33',62,'','2006-10-24 11:01:30',62,0,'0000-00-00 00:00:00','2006-10-23 16:14:21','0000-00-00 00:00:00','','','menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=0\nrating=0\nauthor=0\ncreatedate=0\nmodifydate=0\npdf=0\nprint=0\nemail=0',1,0,0,'','',0,18929),(53,'Species 2000 Logo','Species 2000 Logo','<p>The Species 2000 logo can only be used by Species 2000 members or with the permission of the <a href=\"index.php?option=com_content&amp;task=view&amp;id=17&amp;Itemid=33\">Secretariat</a>.&nbsp;&nbsp;&nbsp;  </p><table border=\"0\"><tbody><tr><td>{mosimage}&nbsp;</td><td><ul><li>Preferrd - Colour vector <a href=\"http://documents.sp2000.org/Artwork/Logos/species2000rgb.eps\">EPS</a> </li><li>Websites - Small GIF <a href=\"http://documents.sp2000.org/Artwork/Logos/species2000logo.gif\">Transparent</a> or <a href=\"http://documents.sp2000.org/Artwork/Logos/species2000logowhite.gif\">White</a>&nbsp;  <br /> </li></ul><ul><li>Printing - Large <a href=\"http://documents.sp2000.org/Artwork/Logos/species2000logo.tif\">TIFF</a>   <br /> </li></ul></td></tr></tbody></table><br />The vector EPS format file should be used where possible as it can be reproduced at any size.&nbsp; Most good graphics programs should be able to accept this format. ','',1,0,0,0,'2006-10-23 17:48:26',62,'','2006-10-23 18:09:01',62,0,'0000-00-00 00:00:00','2006-10-23 17:47:01','0000-00-00 00:00:00','logos/sp2000logo.gif','','menu_image=-1\nitem_title=1\npageclass_sfx=\nback_button=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=',1,0,0,'','',0,7);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_content` ENABLE KEYS */;

--
-- Table structure for table `jos_content_frontpage`
--

DROP TABLE IF EXISTS `jos_content_frontpage`;
CREATE TABLE `jos_content_frontpage` (
  `content_id` int(11) NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_content_frontpage`
--


/*!40000 ALTER TABLE `jos_content_frontpage` DISABLE KEYS */;
LOCK TABLES `jos_content_frontpage` WRITE;
INSERT INTO `jos_content_frontpage` VALUES (1,2),(51,1),(5,3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_content_frontpage` ENABLE KEYS */;

--
-- Table structure for table `jos_content_rating`
--

DROP TABLE IF EXISTS `jos_content_rating`;
CREATE TABLE `jos_content_rating` (
  `content_id` int(11) NOT NULL default '0',
  `rating_sum` int(11) unsigned NOT NULL default '0',
  `rating_count` int(11) unsigned NOT NULL default '0',
  `lastip` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_content_rating`
--


/*!40000 ALTER TABLE `jos_content_rating` DISABLE KEYS */;
LOCK TABLES `jos_content_rating` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_content_rating` ENABLE KEYS */;

--
-- Table structure for table `jos_core_acl_aro`
--

DROP TABLE IF EXISTS `jos_core_acl_aro`;
CREATE TABLE `jos_core_acl_aro` (
  `aro_id` int(11) NOT NULL auto_increment,
  `section_value` varchar(240) NOT NULL default '0',
  `value` varchar(240) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`aro_id`),
  UNIQUE KEY `jos_gacl_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_core_acl_aro`
--


/*!40000 ALTER TABLE `jos_core_acl_aro` DISABLE KEYS */;
LOCK TABLES `jos_core_acl_aro` WRITE;
INSERT INTO `jos_core_acl_aro` VALUES (10,'users','62',0,'Administrator',0),(11,'users','63',0,'Peter Brewer',0),(12,'users','64',0,'Director',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_core_acl_aro` ENABLE KEYS */;

--
-- Table structure for table `jos_core_acl_aro_groups`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_groups`;
CREATE TABLE `jos_core_acl_aro_groups` (
  `group_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `lft` int(11) NOT NULL default '0',
  `rgt` int(11) NOT NULL default '0',
  PRIMARY KEY  (`group_id`),
  KEY `parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--


/*!40000 ALTER TABLE `jos_core_acl_aro_groups` DISABLE KEYS */;
LOCK TABLES `jos_core_acl_aro_groups` WRITE;
INSERT INTO `jos_core_acl_aro_groups` VALUES (17,0,'ROOT',1,22),(28,17,'USERS',2,21),(29,28,'Public Frontend',3,12),(18,29,'Registered',4,11),(19,18,'Author',5,10),(20,19,'Editor',6,9),(21,20,'Publisher',7,8),(30,28,'Public Backend',13,20),(23,30,'Manager',14,19),(24,23,'Administrator',15,18),(25,24,'Super Administrator',16,17);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_core_acl_aro_groups` ENABLE KEYS */;

--
-- Table structure for table `jos_core_acl_aro_sections`
--

DROP TABLE IF EXISTS `jos_core_acl_aro_sections`;
CREATE TABLE `jos_core_acl_aro_sections` (
  `section_id` int(11) NOT NULL auto_increment,
  `value` varchar(230) NOT NULL default '',
  `order_value` int(11) NOT NULL default '0',
  `name` varchar(230) NOT NULL default '',
  `hidden` int(11) NOT NULL default '0',
  PRIMARY KEY  (`section_id`),
  UNIQUE KEY `value_aro_sections` (`value`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `hidden_aro_sections` (`hidden`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--


/*!40000 ALTER TABLE `jos_core_acl_aro_sections` DISABLE KEYS */;
LOCK TABLES `jos_core_acl_aro_sections` WRITE;
INSERT INTO `jos_core_acl_aro_sections` VALUES (10,'users',1,'Users',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_core_acl_aro_sections` ENABLE KEYS */;

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

DROP TABLE IF EXISTS `jos_core_acl_groups_aro_map`;
CREATE TABLE `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL default '0',
  `section_value` varchar(240) NOT NULL default '',
  `aro_id` int(11) NOT NULL default '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--


/*!40000 ALTER TABLE `jos_core_acl_groups_aro_map` DISABLE KEYS */;
LOCK TABLES `jos_core_acl_groups_aro_map` WRITE;
INSERT INTO `jos_core_acl_groups_aro_map` VALUES (19,'',11),(19,'',12),(25,'',10);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_core_acl_groups_aro_map` ENABLE KEYS */;

--
-- Table structure for table `jos_core_log_items`
--

DROP TABLE IF EXISTS `jos_core_log_items`;
CREATE TABLE `jos_core_log_items` (
  `time_stamp` date NOT NULL default '0000-00-00',
  `item_table` varchar(50) NOT NULL default '',
  `item_id` int(11) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_core_log_items`
--


/*!40000 ALTER TABLE `jos_core_log_items` DISABLE KEYS */;
LOCK TABLES `jos_core_log_items` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_core_log_items` ENABLE KEYS */;

--
-- Table structure for table `jos_core_log_searches`
--

DROP TABLE IF EXISTS `jos_core_log_searches`;
CREATE TABLE `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL default '',
  `hits` int(11) unsigned NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_core_log_searches`
--


/*!40000 ALTER TABLE `jos_core_log_searches` DISABLE KEYS */;
LOCK TABLES `jos_core_log_searches` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_core_log_searches` ENABLE KEYS */;

--
-- Table structure for table `jos_downloads_containers`
--

DROP TABLE IF EXISTS `jos_downloads_containers`;
CREATE TABLE `jos_downloads_containers` (
  `id` int(255) NOT NULL auto_increment,
  `sequence` int(11) NOT NULL default '0',
  `windowtitle` varchar(255) NOT NULL default '',
  `parentid` smallint(255) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '1',
  `description` text NOT NULL,
  `filecount` smallint(6) NOT NULL default '0',
  `foldercount` smallint(6) NOT NULL default '0',
  `icon` varchar(50) NOT NULL default '',
  `registered` tinyint(3) unsigned NOT NULL default '2',
  `userupload` tinyint(3) unsigned NOT NULL default '3',
  `plaintext` tinyint(3) unsigned NOT NULL default '0',
  `groupid` smallint(6) NOT NULL default '0',
  UNIQUE KEY `id` (`id`),
  KEY `parentid` (`parentid`,`published`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_downloads_containers`
--


/*!40000 ALTER TABLE `jos_downloads_containers` DISABLE KEYS */;
LOCK TABLES `jos_downloads_containers` WRITE;
INSERT INTO `jos_downloads_containers` VALUES (1,0,'',0,'Directors documents','',1,'',2,0,'',0,3,0,0),(2,0,'',0,'Reports','',1,'',0,0,'',2,3,0,0),(3,0,'',0,'Logos','',1,'',2,0,'',0,3,0,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_downloads_containers` ENABLE KEYS */;

--
-- Table structure for table `jos_downloads_files`
--

DROP TABLE IF EXISTS `jos_downloads_files`;
CREATE TABLE `jos_downloads_files` (
  `id` int(11) NOT NULL auto_increment,
  `sequence` int(11) NOT NULL default '0',
  `windowtitle` varchar(255) NOT NULL default '',
  `realname` varchar(255) NOT NULL default '',
  `islocal` tinyint(3) unsigned NOT NULL default '1',
  `containerid` smallint(6) NOT NULL default '0',
  `filepath` varchar(255) NOT NULL default '',
  `filesize` varchar(255) NOT NULL default '',
  `filetype` varchar(255) NOT NULL default '',
  `filetitle` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `smalldesc` text NOT NULL,
  `autoshort` tinyint(3) unsigned NOT NULL default '1',
  `license` text NOT NULL,
  `licenseagree` tinyint(3) unsigned NOT NULL default '0',
  `price` int(11) NOT NULL default '0',
  `currency` char(3) NOT NULL default '',
  `downloads` int(11) NOT NULL default '0',
  `url` varchar(255) NOT NULL default '',
  `icon` varchar(50) NOT NULL default '',
  `published` tinyint(3) unsigned NOT NULL default '1',
  `registered` tinyint(3) unsigned NOT NULL default '2',
  `userupload` tinyint(3) unsigned NOT NULL default '3',
  `recommended` tinyint(3) unsigned NOT NULL default '0',
  `recommend_text` text NOT NULL,
  `featured` tinyint(4) NOT NULL default '0',
  `featured_st_date` date NOT NULL default '2000-01-01',
  `featured_end_date` date NOT NULL default '2000-01-01',
  `featured_priority` smallint(6) NOT NULL default '0',
  `featured_seq` smallint(6) NOT NULL default '0',
  `featured_text` text NOT NULL,
  `opsystem` varchar(50) NOT NULL default '',
  `legaltype` varchar(50) NOT NULL default '',
  `requirements` text NOT NULL,
  `company` varchar(255) NOT NULL default '',
  `releasedate` date NOT NULL default '1000-01-01',
  `languages` text NOT NULL,
  `company_URL` varchar(255) NOT NULL default '',
  `translator` varchar(255) NOT NULL default '',
  `fileversion` varchar(50) NOT NULL default '',
  `fileauthor` varchar(100) NOT NULL default '',
  `author_URL` varchar(255) NOT NULL default '',
  `filedate` datetime NOT NULL default '2000-01-01 00:00:00',
  `filehomepage` varchar(255) NOT NULL default '',
  `screenurl` varchar(255) NOT NULL default '',
  `plaintext` tinyint(3) unsigned NOT NULL default '0',
  `isblob` tinyint(3) unsigned NOT NULL default '0',
  `groupid` smallint(6) NOT NULL default '0',
  `submittedby` mediumint(9) NOT NULL default '0',
  `submitdate` datetime NOT NULL default '2000-01-01 00:00:00',
  UNIQUE KEY `id` (`id`),
  KEY `filetitle` (`filetitle`),
  KEY `realname` (`realname`),
  KEY `url` (`url`),
  KEY `containerid` (`containerid`,`published`),
  KEY `recommended` (`containerid`,`recommended`,`published`),
  KEY `featured` (`containerid`,`featured`,`published`,`featured_st_date`,`featured_end_date`),
  KEY `opsystem` (`containerid`,`opsystem`,`published`),
  FULLTEXT KEY `filetitle_2` (`filetitle`,`description`,`smalldesc`,`fileauthor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_downloads_files`
--


/*!40000 ALTER TABLE `jos_downloads_files` DISABLE KEYS */;
LOCK TABLES `jos_downloads_files` WRITE;
INSERT INTO `jos_downloads_files` VALUES (5,0,'','28934d9dSp2000EU rgb.eps',1,3,'','330.31Kb','eps','Sp2000EU rgb.eps','EPS version of the Species 2000 europa logo<br />','EPS version of the Species 2000 europa logo',1,'',0,0,'',0,'','eye.gif',1,0,3,0,'',0,'0000-00-00','0000-00-00',0,0,'','','','','','0000-00-00','','','','','Unknown','','2006-09-08 18:02:44','','',0,0,0,63,'2006-09-08 18:03:07'),(4,0,'','f2cd3207species 2000 rgb.eps',1,3,'','259.02Kb','eps','species 2000 rgb.eps','EPS version of the Species 2000 logo<br />','EPS version of the Species 2000 logo',1,'',0,0,'',0,'','eye.gif',1,0,3,0,'',0,'0000-00-00','0000-00-00',0,0,'','','','','','0000-00-00','','','','','Unknown','','2006-09-08 18:01:00','','',0,0,0,63,'2006-09-08 18:01:00'),(6,0,'','19fad91cSp2000 Dev Plan v2.doc',1,1,'','58.00Kb','doc','Sp2000 Dev Plan v2.doc','Version 2, Sp2000 Development Plan, from Frank','Version 2, Sp2000 Development Plan, from Frank',1,'',0,0,'',4,'','',1,0,3,0,'',0,'0000-00-00','0000-00-00',0,0,'','','','','','0000-00-00','','','','','Director','','2006-09-08 18:18:36','','',0,0,0,64,'2006-09-08 18:18:36'),(7,0,'','4f15100d6494 Directors lunch, gardenTisbury aug06.jpg',1,1,'','264.71Kb','jpg','photo Tisbury','photo of Directors at Tisbury August 2006 - Karen','photo of Directors at Tisbury August 2006 - Karen',1,'',0,0,'',3,'','',1,0,3,0,'',0,'0000-00-00','0000-00-00',0,0,'','','','','','0000-00-00','','','','','Director','','2006-09-10 04:22:13','','',0,0,0,64,'2006-09-10 04:22:13');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_downloads_files` ENABLE KEYS */;

--
-- Table structure for table `jos_downloads_log`
--

DROP TABLE IF EXISTS `jos_downloads_log`;
CREATE TABLE `jos_downloads_log` (
  `id` int(11) NOT NULL auto_increment,
  `type` tinyint(3) unsigned NOT NULL default '0',
  `date` datetime NOT NULL default '2000-01-01 00:00:00',
  `userid` mediumint(9) NOT NULL default '0',
  `fileid` int(11) NOT NULL default '0',
  `value` int(11) NOT NULL default '0',
  `ipaddress` char(15) NOT NULL default '',
  UNIQUE KEY `id` (`id`),
  KEY `userid` (`type`,`userid`),
  KEY `fileid` (`type`,`fileid`),
  KEY `ipaddress` (`type`,`ipaddress`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_downloads_log`
--


/*!40000 ALTER TABLE `jos_downloads_log` DISABLE KEYS */;
LOCK TABLES `jos_downloads_log` WRITE;
INSERT INTO `jos_downloads_log` VALUES (6,2,'2006-09-08 18:02:44',63,5,330,'134.225.66.76'),(7,2,'2006-09-08 18:18:36',64,6,58,'134.225.66.124'),(5,2,'2006-09-08 18:01:00',63,4,259,'134.225.66.76'),(8,1,'2006-09-10 02:53:07',64,6,58,'141.243.60.12'),(9,1,'2006-09-10 02:53:48',64,6,58,'141.243.60.12'),(10,1,'2006-09-10 02:58:20',64,6,58,'141.243.60.12'),(11,2,'2006-09-10 04:22:13',64,7,264,'141.243.60.12'),(12,1,'2006-09-10 04:22:29',64,7,264,'141.243.60.12'),(13,1,'2006-09-10 13:21:39',64,7,264,'62.49.16.28'),(14,1,'2006-09-10 15:39:00',64,7,264,'62.253.96.42'),(15,3,'2006-09-12 14:36:31',64,7,4,'134.225.66.76'),(16,1,'2006-09-12 14:57:40',64,6,58,'134.225.66.76'),(17,3,'2006-09-12 14:59:16',64,6,4,'134.225.66.76');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_downloads_log` ENABLE KEYS */;

--
-- Table structure for table `jos_downloads_repository`
--

DROP TABLE IF EXISTS `jos_downloads_repository`;
CREATE TABLE `jos_downloads_repository` (
  `id` int(11) NOT NULL,
  `sequence` int(11) NOT NULL default '0',
  `windowtitle` varchar(255) NOT NULL default '',
  `version` char(10) NOT NULL default '',
  `tabclass` varchar(255) NOT NULL default 'sectiontableentry2,sectiontableentry1',
  `tabheader` varchar(255) NOT NULL default 'sectiontableheader',
  `headerpic` varchar(255) NOT NULL default '$mosConfig_live_site/components/com_remository/images/header.jpg',
  `ExtsOk` varchar(255) NOT NULL default 'txt,exe,tar,gz,rar,zip,png,gif,jpg,pdf,doc',
  `Down_Path` varchar(255) NOT NULL default '$mosConfig_absolute_path/components/com_remository/downloads',
  `Up_Path` varchar(255) NOT NULL default '$mosConfig_absolute_path/components/com_remository/uploads',
  `Large_Text_Len` int(11) NOT NULL default '500',
  `Small_Text_Len` smallint(6) NOT NULL default '150',
  `Small_Image_Width` smallint(6) NOT NULL default '100',
  `Small_Image_Height` smallint(6) NOT NULL default '100',
  `MaxSize` int(11) NOT NULL default '5000',
  `Max_Up_Per_Day` smallint(6) NOT NULL default '5',
  `Max_Up_Dir_Space` int(11) NOT NULL default '50000',
  `Favourites_Max` smallint(6) NOT NULL default '5',
  `Default_Version` char(20) NOT NULL default '',
  `Date_Format` char(20) NOT NULL default '',
  `Anti_Leach` tinyint(3) unsigned NOT NULL default '0',
  `Allow_Up_Overwrite` tinyint(3) unsigned NOT NULL default '1',
  `Allow_User_Sub` tinyint(3) unsigned NOT NULL default '1',
  `Allow_User_Edit` tinyint(3) unsigned NOT NULL default '1',
  `Allow_User_Up` tinyint(3) unsigned NOT NULL default '1',
  `Enable_Admin_Autoapp` tinyint(3) unsigned NOT NULL default '1',
  `Enable_User_Autoapp` tinyint(3) unsigned NOT NULL default '0',
  `Allow_Comments` tinyint(3) unsigned NOT NULL default '1',
  `Allow_Votes` tinyint(3) unsigned NOT NULL default '1',
  `Enable_List_Download` tinyint(3) unsigned NOT NULL default '0',
  `User_Remote_Files` tinyint(3) unsigned NOT NULL default '0',
  `See_Containers_no_download` tinyint(3) unsigned NOT NULL default '1',
  `See_Files_no_download` tinyint(3) unsigned NOT NULL default '1',
  `Send_Sub_Mail` tinyint(3) unsigned NOT NULL default '1',
  `Sub_Mail_Alt_Addr` varchar(255) NOT NULL default '',
  `Sub_Mail_Alt_Name` varchar(100) NOT NULL default '',
  `Time_Stamp` varchar(15) NOT NULL default '1119386419',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_downloads_repository`
--


/*!40000 ALTER TABLE `jos_downloads_repository` DISABLE KEYS */;
LOCK TABLES `jos_downloads_repository` WRITE;
INSERT INTO `jos_downloads_repository` VALUES (0,0,'','','sectiontableentry2,sectiontableentry1','sectiontableheader','http://aplx5.rdg.ac.uk/joomla/components/com_remository/images/header.jpg','txt,exe,tar,gz,rar,zip,png,gif,jpg,pdf,doc,rtf,eps','/var/www/joomla/downloads','/var/www/joomla/downloads/uploads',300,150,100,100,5000,5,50000,0,'','d M Y',1,1,1,1,1,1,1,1,1,0,0,0,0,1,'','','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_downloads_repository` ENABLE KEYS */;

--
-- Table structure for table `jos_downloads_reviews`
--

DROP TABLE IF EXISTS `jos_downloads_reviews`;
CREATE TABLE `jos_downloads_reviews` (
  `id` int(11) NOT NULL auto_increment,
  `sequence` int(11) NOT NULL default '0',
  `windowtitle` varchar(255) NOT NULL default '',
  `component` varchar(255) NOT NULL default '',
  `itemid` int(11) NOT NULL default '0',
  `userid` mediumint(9) NOT NULL default '0',
  `userURL` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `comment` text NOT NULL,
  `fullreview` text NOT NULL,
  `date` datetime NOT NULL default '2000-01-01 00:00:00',
  UNIQUE KEY `id` (`id`),
  KEY `userid` (`component`,`itemid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_downloads_reviews`
--


/*!40000 ALTER TABLE `jos_downloads_reviews` DISABLE KEYS */;
LOCK TABLES `jos_downloads_reviews` WRITE;
INSERT INTO `jos_downloads_reviews` VALUES (1,0,'','com_remository',6,64,'','Review Title','I need further instruction on how to use this system! I just made minor updates to no. of spp in the AC on p.2 but that didn\'t get saved, so I obviously need to do something else ?new version no? - Karen','','2006-09-10 03:01:22');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_downloads_reviews` ENABLE KEYS */;

--
-- Table structure for table `jos_downloads_structure`
--

DROP TABLE IF EXISTS `jos_downloads_structure`;
CREATE TABLE `jos_downloads_structure` (
  `id` int(11) NOT NULL auto_increment,
  `container` smallint(6) NOT NULL default '0',
  `item` mediumint(9) NOT NULL default '0',
  UNIQUE KEY `id` (`id`),
  KEY `container` (`container`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_downloads_structure`
--


/*!40000 ALTER TABLE `jos_downloads_structure` DISABLE KEYS */;
LOCK TABLES `jos_downloads_structure` WRITE;
INSERT INTO `jos_downloads_structure` VALUES (1,1,1),(2,3,3),(3,2,2);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_downloads_structure` ENABLE KEYS */;

--
-- Table structure for table `jos_downloads_temp`
--

DROP TABLE IF EXISTS `jos_downloads_temp`;
CREATE TABLE `jos_downloads_temp` (
  `id` int(11) NOT NULL auto_increment,
  `sequence` int(11) NOT NULL default '0',
  `windowtitle` varchar(255) NOT NULL default '',
  `filetempname` varchar(255) NOT NULL default '',
  `filetemphash` varchar(255) NOT NULL default '',
  `oldid` int(11) NOT NULL default '0',
  `filename` varchar(255) NOT NULL default '',
  `realname` varchar(255) NOT NULL default '',
  `islocal` tinyint(3) unsigned NOT NULL default '1',
  `containerid` smallint(6) NOT NULL default '0',
  `filepath` varchar(255) NOT NULL default '',
  `filesize` varchar(255) NOT NULL default '',
  `filetype` varchar(255) NOT NULL default '',
  `filetitle` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `smalldesc` text NOT NULL,
  `autoshort` tinyint(3) unsigned NOT NULL default '1',
  `license` text NOT NULL,
  `licenseagree` tinyint(3) unsigned NOT NULL default '0',
  `price` int(11) NOT NULL default '0',
  `currency` char(3) NOT NULL default '',
  `downloads` int(11) NOT NULL default '0',
  `url` varchar(255) default '',
  `icon` varchar(50) NOT NULL default '',
  `published` tinyint(4) NOT NULL default '1',
  `registered` tinyint(3) unsigned NOT NULL default '2',
  `userupload` tinyint(3) unsigned NOT NULL default '3',
  `recommended` tinyint(4) NOT NULL default '0',
  `recommend_text` text NOT NULL,
  `featured` tinyint(4) NOT NULL default '0',
  `featured_st_date` date NOT NULL default '2000-01-01',
  `featured_end_date` date NOT NULL default '2000-01-01',
  `featured_priority` smallint(6) NOT NULL default '0',
  `featured_seq` smallint(6) NOT NULL default '0',
  `featured_text` text NOT NULL,
  `opsystem` varchar(50) NOT NULL default '',
  `legaltype` varchar(50) NOT NULL default '',
  `requirements` text NOT NULL,
  `company` varchar(255) NOT NULL default '',
  `releasedate` date NOT NULL default '1000-01-01',
  `languages` text NOT NULL,
  `company_URL` varchar(255) NOT NULL default '',
  `translator` varchar(255) NOT NULL default '',
  `fileversion` varchar(50) NOT NULL default '',
  `fileauthor` varchar(100) NOT NULL default '',
  `author_URL` varchar(255) NOT NULL default '',
  `filedate` datetime NOT NULL default '2000-01-01 00:00:00',
  `filehomepage` varchar(255) NOT NULL default '',
  `screenurl` varchar(255) NOT NULL default '',
  `plaintext` tinyint(3) unsigned NOT NULL default '0',
  `isblob` tinyint(3) unsigned NOT NULL default '0',
  `groupid` smallint(6) NOT NULL default '0',
  `submittedby` mediumint(9) NOT NULL default '0',
  `submitdate` datetime NOT NULL default '2000-01-01 00:00:00',
  UNIQUE KEY `id` (`id`),
  KEY `filetempname` (`filetempname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_downloads_temp`
--


/*!40000 ALTER TABLE `jos_downloads_temp` DISABLE KEYS */;
LOCK TABLES `jos_downloads_temp` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_downloads_temp` ENABLE KEYS */;

--
-- Table structure for table `jos_groups`
--

DROP TABLE IF EXISTS `jos_groups`;
CREATE TABLE `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_groups`
--


/*!40000 ALTER TABLE `jos_groups` DISABLE KEYS */;
LOCK TABLES `jos_groups` WRITE;
INSERT INTO `jos_groups` VALUES (0,'Public'),(1,'Registered'),(2,'Special');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_groups` ENABLE KEYS */;

--
-- Table structure for table `jos_mambots`
--

DROP TABLE IF EXISTS `jos_mambots`;
CREATE TABLE `jos_mambots` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL default '',
  `element` varchar(100) NOT NULL default '',
  `folder` varchar(100) NOT NULL default '',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `ordering` int(11) NOT NULL default '0',
  `published` tinyint(3) NOT NULL default '0',
  `iscore` tinyint(3) NOT NULL default '0',
  `client_id` tinyint(3) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_mambots`
--


/*!40000 ALTER TABLE `jos_mambots` DISABLE KEYS */;
LOCK TABLES `jos_mambots` WRITE;
INSERT INTO `jos_mambots` VALUES (1,'MOS Image','mosimage','content',0,-10000,1,1,0,0,'0000-00-00 00:00:00',''),(2,'MOS Pagination','mospaging','content',0,10000,1,1,0,0,'0000-00-00 00:00:00',''),(3,'Legacy Mambot Includer','legacybots','content',0,1,0,1,0,0,'0000-00-00 00:00:00',''),(4,'SEF','mossef','content',0,3,1,0,0,0,'0000-00-00 00:00:00',''),(5,'MOS Rating','mosvote','content',0,4,1,1,0,0,'0000-00-00 00:00:00',''),(6,'Search Content','content.searchbot','search',0,1,1,1,0,62,'2006-09-08 14:11:51',''),(7,'Search Weblinks','weblinks.searchbot','search',0,2,1,1,0,62,'2006-09-08 14:11:56',''),(8,'Code support','moscode','content',0,2,0,0,0,0,'0000-00-00 00:00:00',''),(9,'No WYSIWYG Editor','none','editors',0,0,1,1,0,0,'0000-00-00 00:00:00',''),(10,'TinyMCE WYSIWYG Editor','tinymce','editors',0,0,1,1,0,0,'0000-00-00 00:00:00','theme=advanced'),(11,'MOS Image Editor Button','mosimage.btn','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(12,'MOS Pagebreak Editor Button','mospage.btn','editors-xtd',0,0,1,0,0,0,'0000-00-00 00:00:00',''),(13,'Search Contacts','contacts.searchbot','search',0,3,1,1,0,0,'0000-00-00 00:00:00',''),(14,'Search Categories','categories.searchbot','search',0,4,1,0,0,0,'0000-00-00 00:00:00',''),(15,'Search Sections','sections.searchbot','search',0,5,1,0,0,0,'0000-00-00 00:00:00',''),(16,'Email Cloaking','mosemailcloak','content',0,5,1,0,0,0,'0000-00-00 00:00:00',''),(17,'GeSHi','geshi','content',0,5,0,0,0,0,'0000-00-00 00:00:00',''),(18,'Search Newsfeeds','newsfeeds.searchbot','search',0,6,1,0,0,0,'0000-00-00 00:00:00',''),(19,'Load Module Positions','mosloadposition','content',0,6,1,0,0,0,'0000-00-00 00:00:00','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_mambots` ENABLE KEYS */;

--
-- Table structure for table `jos_menu`
--

DROP TABLE IF EXISTS `jos_menu`;
CREATE TABLE `jos_menu` (
  `id` int(11) NOT NULL auto_increment,
  `menutype` varchar(25) default NULL,
  `name` varchar(100) default NULL,
  `link` text,
  `type` varchar(50) NOT NULL default '',
  `published` tinyint(1) NOT NULL default '0',
  `parent` int(11) unsigned NOT NULL default '0',
  `componentid` int(11) unsigned NOT NULL default '0',
  `sublevel` int(11) default '0',
  `ordering` int(11) default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL default '0',
  `browserNav` tinyint(4) default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `utaccess` tinyint(3) unsigned NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_menu`
--


/*!40000 ALTER TABLE `jos_menu` DISABLE KEYS */;
LOCK TABLES `jos_menu` WRITE;
INSERT INTO `jos_menu` VALUES (1,'mainmenu','Home','index.php?option=com_frontpage','components',-2,0,10,0,1,0,'0000-00-00 00:00:00',0,0,0,3,'leading=1\r\nintro=2\r\nlink=1\r\nimage=1\r\npage_title=0\r\nheader=Welcome to the Frontpage\r\norderby_sec=front\r\nprint=0\r\npdf=0\r\nemail=0\r\nback_button=0'),(3,'mainmenu','Project Members','index.php?option=com_contact','components',1,0,7,0,8,0,'0000-00-00 00:00:00',0,0,0,3,'menu_image=-1\npageclass_sfx=\nback_button=\npage_title=1\nheader=\ncatid=0\nother_cat_section=1\nother_cat=1\ncat_description=1\ncat_items=1\ndescription=1\ndescription_text=\nimage=-1\nimage_align=right\nheadings=1\nposition=1\nemail=0\ntelephone=1\nfax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1'),(23,'mainmenu','Links','index.php?option=com_weblinks','components',-2,0,4,0,3,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=web_links.jpg\npageclass_sfx=\nback_button=\npage_title=1\nheader=\nheadings=1\nhits=\nitem_description=1\nother_cat=1\ndescription=1\ndescription_text=\nimage=-1\nimage_align=right\nweblink_icons='),(51,'usermenu','Service Checker','index.php?option=com_wrapper','wrapper',0,0,0,0,8,0,'0000-00-00 00:00:00',0,0,1,0,'menu_image=-1\npageclass_sfx=\nback_button=\npage_title=1\nheader=\nscrolling=auto\nwidth=100%\nheight=500\nheight_auto=0\nadd=1\nurl=http://reading.sp2000.org/servicechecker/servicechecker3.php'),(48,'mainmenu','Documents','index.php?option=com_content&task=blogcategory&id=25','content_blog_category',-2,0,25,0,5,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\npageclass_sfx=\nback_button=\nheader=\npage_title=1\nleading=1\nintro=4\ncolumns=2\nlink=4\norderby_pri=\norderby_sec=\npagination=2\npagination_results=1\nimage=1\ndescription=0\ndescription_image=0\ncategory=0\ncategory_link=0\nitem_title=1\nlink_titles=\nreadmore=\nrating=\nauthor=\ncreatedate=\nmodifydate=\npdf=\nprint=\nemail=\nunpublished=0\ncategoryid=25'),(49,'mainmenu','Documents','index.php?option=com_content&task=category&sectionid=5&id=25','content_category',1,0,25,0,12,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\npage_title=1\npageclass_sfx=\nback_button=\ndescription_cat=1\ndescription_cat_image=1\norderby=\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=1\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title\nother_cat=1\nempty_cat=0\ncat_items=1\ncat_description=1\nunpublished=1'),(10,'othermenu','Joomla! Home','http://www.joomla.org','url',0,0,0,0,1,0,'0000-00-00 00:00:00',0,0,0,3,''),(11,'othermenu','Joomla! Forums','http://forum.joomla.org','url',0,0,0,0,2,0,'0000-00-00 00:00:00',0,0,0,3,''),(12,'othermenu','OSM Home','http://www.opensourcematters.org','url',0,0,0,0,3,0,'0000-00-00 00:00:00',0,0,0,3,''),(24,'othermenu','Administrator','administrator/','url',0,0,0,0,4,0,'0000-00-00 00:00:00',0,0,0,3,'menu_image=-1'),(21,'usermenu','Your Details','index.php?option=com_user&task=UserDetails','url',1,0,0,0,2,0,'0000-00-00 00:00:00',0,0,1,3,''),(13,'usermenu','Submit News','index.php?option=com_content&task=new&sectionid=1&Itemid=0','url',1,0,0,0,3,0,'0000-00-00 00:00:00',0,0,1,2,''),(14,'usermenu','Submit WebLink','index.php?option=com_weblinks&task=new','url',0,0,0,0,4,0,'0000-00-00 00:00:00',0,0,1,2,''),(15,'usermenu','Check-In My Items','index.php?option=com_user&task=CheckIn','url',0,0,0,0,5,0,'0000-00-00 00:00:00',0,0,1,2,''),(16,'usermenu','Logout','index.php?option=com_login','components',1,0,15,0,1,0,'0000-00-00 00:00:00',0,0,1,3,''),(17,'topmenu','Home','index.php','url',1,0,0,0,1,0,'0000-00-00 00:00:00',0,0,0,3,''),(45,'topmenu','Dynamic Checklist','http://spice.sp2000.org','url',1,0,0,0,4,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1'),(19,'topmenu','News','index.php?option=com_content&task=section&id=1&Itemid=2','url',0,0,0,0,2,0,'0000-00-00 00:00:00',0,0,0,3,''),(20,'topmenu','Links','index.php?option=com_weblinks&Itemid=23','url',0,0,0,0,3,0,'0000-00-00 00:00:00',0,0,0,3,'menu_image=-1'),(26,'mainmenu','About Sp2000','index.php?option=com_content&task=view&id=12','content_typed',1,0,12,0,7,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\nunique_itemid=0'),(27,'usermenu','Repository','index.php?option=com_remository','components',1,0,19,0,6,0,'0000-00-00 00:00:00',0,0,1,0,''),(50,'mainmenu','Service Checker','index.php?option=com_wrapper','wrapper',1,0,0,0,15,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\npageclass_sfx=\nback_button=\npage_title=1\nheader=\nscrolling=auto\nwidth=100%\nheight=500\nheight_auto=0\nadd=1\nurl=http://reading.sp2000.org/servicechecker/servicechecker3.php'),(29,'mainmenu','Meetings','index.php?option=com_content&task=section&id=4','content_section',1,0,4,0,13,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\npage_title=1\npageclass_sfx=\nback_button=\ndescription_sec=1\ndescription_sec_image=1\norderby=\nother_cat_section=1\nempty_cat_section=0\ndescription_cat=1\ndescription_cat_image=1\nother_cat=1\nempty_cat=0\ncat_items=1\ncat_description=1\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=1\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title\nunpublished=1'),(46,'topmenu','Annual Checklist','http://annual.sp2000.org','url',1,0,0,0,5,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1'),(47,'usermenu','Service Checker','http://aplx5.rdg.ac.uk/servicechecker/servicechecker.php','url',-2,0,0,0,0,0,'0000-00-00 00:00:00',0,2,1,0,'menu_image=-1'),(31,'mainmenu','Documents','index.php?option=com_content&task=section&id=5','content_section',-2,0,5,0,2,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\npage_title=1\npageclass_sfx=\nback_button=\ndescription_sec=1\ndescription_sec_image=1\norderby=\nother_cat_section=1\nempty_cat_section=0\ndescription_cat=1\ndescription_cat_image=1\nother_cat=1\nempty_cat=0\ncat_items=1\ncat_description=1\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=1\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title\nunpublished=1'),(32,'mainmenu','Standards &amp; Protocols','index.php?option=com_content&task=section&id=6','content_section',0,0,6,0,14,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\npage_title=1\npageclass_sfx=\nback_button=\ndescription_sec=1\ndescription_sec_image=1\norderby=\nother_cat_section=1\nempty_cat_section=0\ndescription_cat=1\ndescription_cat_image=1\nother_cat=1\nempty_cat=0\ncat_items=1\ncat_description=1\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=1\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title\nunpublished=1'),(33,'topmenu','Contact Us','index.php?option=com_content&task=view&id=17','content_typed',1,0,17,0,6,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\nunique_itemid=0'),(34,'mainmenu','Contact Us','index.php?option=com_content&task=view&id=17','content_typed',1,0,17,0,9,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\nunique_itemid=0'),(35,'mainmenu','<hr>','','separator',1,0,0,0,10,0,'0000-00-00 00:00:00',0,3,0,0,'menu_image=-1'),(37,'mainmenu','<hr>','','separator',1,0,0,0,16,0,'0000-00-00 00:00:00',0,3,0,0,'menu_image=-1'),(38,'mainmenu','News','index.php?option=com_content&task=category&sectionid=1&id=1','content_category',1,0,1,0,6,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\npage_title=1\npageclass_sfx=\nback_button=\ndescription_cat=1\ndescription_cat_image=1\norderby=\ndate_format=\ndate=\nauthor=\nhits=\nheadings=1\nnavigation=1\norder_select=1\ndisplay=1\ndisplay_num=50\nfilter=1\nfilter_type=title\nother_cat=1\nempty_cat=0\ncat_items=1\ncat_description=1\nunpublished=1'),(41,'mainmenu','Home','index.php?option=com_content&task=view&id=13','content_typed',1,0,13,0,4,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\nunique_itemid=0'),(44,'mainmenu','Contributing','index.php?option=com_content&task=view&id=43','content_typed',1,0,43,0,11,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\nunique_itemid=0'),(43,'mainmenu','Login','index.php?option=com_content&task=view&id=42','content_typed',1,0,42,0,17,0,'0000-00-00 00:00:00',0,0,0,0,'menu_image=-1\nunique_itemid=0');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_menu` ENABLE KEYS */;

--
-- Table structure for table `jos_messages`
--

DROP TABLE IF EXISTS `jos_messages`;
CREATE TABLE `jos_messages` (
  `message_id` int(10) unsigned NOT NULL auto_increment,
  `user_id_from` int(10) unsigned NOT NULL default '0',
  `user_id_to` int(10) unsigned NOT NULL default '0',
  `folder_id` int(10) unsigned NOT NULL default '0',
  `date_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `state` int(11) NOT NULL default '0',
  `priority` int(1) unsigned NOT NULL default '0',
  `subject` varchar(230) NOT NULL default '',
  `message` text NOT NULL,
  PRIMARY KEY  (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_messages`
--


/*!40000 ALTER TABLE `jos_messages` DISABLE KEYS */;
LOCK TABLES `jos_messages` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_messages` ENABLE KEYS */;

--
-- Table structure for table `jos_messages_cfg`
--

DROP TABLE IF EXISTS `jos_messages_cfg`;
CREATE TABLE `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL default '0',
  `cfg_name` varchar(100) NOT NULL default '',
  `cfg_value` varchar(255) NOT NULL default '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_messages_cfg`
--


/*!40000 ALTER TABLE `jos_messages_cfg` DISABLE KEYS */;
LOCK TABLES `jos_messages_cfg` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_messages_cfg` ENABLE KEYS */;

--
-- Table structure for table `jos_modules`
--

DROP TABLE IF EXISTS `jos_modules`;
CREATE TABLE `jos_modules` (
  `id` int(11) NOT NULL auto_increment,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL default '0',
  `position` varchar(10) default NULL,
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `module` varchar(50) default NULL,
  `numnews` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `showtitle` tinyint(3) unsigned NOT NULL default '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_modules`
--


/*!40000 ALTER TABLE `jos_modules` DISABLE KEYS */;
LOCK TABLES `jos_modules` WRITE;
INSERT INTO `jos_modules` VALUES (1,'Polls','',7,'left',0,'0000-00-00 00:00:00',1,'mod_poll',0,0,1,'cache=0\nmoduleclass_sfx=',0,0),(2,'User Menu','',2,'left',0,'0000-00-00 00:00:00',1,'mod_mainmenu',0,1,1,'menutype=usermenu',1,0),(3,'Main Menu','',1,'left',0,'0000-00-00 00:00:00',1,'mod_mainmenu',0,0,1,'menutype=mainmenu',1,0),(4,'Login Form','',4,'left',0,'0000-00-00 00:00:00',1,'mod_login',0,0,1,'moduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\nlogin_message=0\nlogout_message=0\ngreeting=0\nname=0',1,0),(5,'Syndicate','',5,'left',0,'0000-00-00 00:00:00',0,'mod_rssfeed',0,0,1,'',1,0),(6,'Latest News','',4,'user1',0,'0000-00-00 00:00:00',0,'mod_latestnews',0,0,1,'',1,0),(7,'Statistics','',8,'left',0,'0000-00-00 00:00:00',0,'mod_stats',0,0,1,'serverinfo=1\nsiteinfo=1\ncounter=1\nincrease=0\nmoduleclass_sfx=',0,0),(8,'Who\'s Online','',3,'right',0,'0000-00-00 00:00:00',0,'mod_whosonline',0,0,1,'online=1\nusers=1\nmoduleclass_sfx=',0,0),(9,'Popular','',6,'user2',0,'0000-00-00 00:00:00',0,'mod_mostread',0,0,1,'',0,0),(10,'Template Chooser','',9,'left',0,'0000-00-00 00:00:00',0,'mod_templatechooser',0,0,1,'show_preview=1',0,0),(11,'Archive','',10,'left',0,'0000-00-00 00:00:00',0,'mod_archive',0,0,1,'',1,0),(12,'Sections','',11,'left',0,'0000-00-00 00:00:00',0,'mod_sections',0,0,1,'',1,0),(13,'Newsflash','',6,'left',0,'0000-00-00 00:00:00',1,'mod_newsflash',0,0,1,'catid=3\nstyle=vert\nimage=0\nlink_titles=\nreadmore=1\nitem_title=0\nitems=\ncache=0\nmoduleclass_sfx=',0,0),(14,'Related Items','',12,'left',0,'0000-00-00 00:00:00',0,'mod_related_items',0,0,1,'',0,0),(15,'Search','',1,'user4',0,'0000-00-00 00:00:00',1,'mod_search',0,0,0,'moduleclass_sfx=\ncache=0\nset_itemid=\nwidth=20\ntext=Search website...\nbutton=\nbutton_pos=right\nbutton_text=',0,0),(16,'Random Image','',4,'right',0,'0000-00-00 00:00:00',0,'mod_random_image',0,0,1,'',0,0),(17,'Top Menu','',1,'user3',0,'0000-00-00 00:00:00',1,'mod_mainmenu',0,0,0,'menutype=topmenu\nmenu_style=list_flat\nmenu_images=n\nmenu_images_align=left\nexpand_menu=n\nclass_sfx=-nav\nmoduleclass_sfx=\nindent_image1=0\nindent_image2=0\nindent_image3=0\nindent_image4=0\nindent_image5=0\nindent_image6=0',1,0),(18,'Banners','',1,'banner',0,'0000-00-00 00:00:00',0,'mod_banners',0,0,0,'banner_cids=\nmoduleclass_sfx=\n',1,0),(19,'Components','',2,'cpanel',0,'0000-00-00 00:00:00',1,'mod_components',0,99,1,'',1,1),(20,'Popular','',3,'cpanel',0,'0000-00-00 00:00:00',1,'mod_popular',0,99,1,'',0,1),(21,'Latest Items','',4,'cpanel',0,'0000-00-00 00:00:00',1,'mod_latest',0,99,1,'',0,1),(22,'Menu Stats','',5,'cpanel',0,'0000-00-00 00:00:00',1,'mod_stats',0,99,1,'',0,1),(23,'Unread Messages','',1,'header',0,'0000-00-00 00:00:00',1,'mod_unread',0,99,1,'',1,1),(24,'Online Users','',2,'header',0,'0000-00-00 00:00:00',1,'mod_online',0,99,1,'',1,1),(25,'Full Menu','',1,'top',0,'0000-00-00 00:00:00',1,'mod_fullmenu',0,99,1,'',1,1),(26,'Pathway','',1,'pathway',0,'0000-00-00 00:00:00',1,'mod_pathway',0,99,1,'',1,1),(27,'Toolbar','',1,'toolbar',0,'0000-00-00 00:00:00',1,'mod_toolbar',0,99,1,'',1,1),(28,'System Message','',1,'inset',0,'0000-00-00 00:00:00',1,'mod_mosmsg',0,99,1,'',1,1),(29,'Quick Icons','',1,'icon',0,'0000-00-00 00:00:00',1,'mod_quickicon',0,99,1,'',1,1),(30,'Other Menu','',3,'left',0,'0000-00-00 00:00:00',1,'mod_mainmenu',0,0,0,'menutype=othermenu\nmenu_style=vert_indent\ncache=0\nmenu_images=0\nmenu_images_align=0\nexpand_menu=0\nclass_sfx=\nmoduleclass_sfx=\nindent_image=0\nindent_image1=\nindent_image2=\nindent_image3=\nindent_image4=\nindent_image5=\nindent_image6=',0,0),(31,'Wrapper','',13,'left',0,'0000-00-00 00:00:00',0,'mod_wrapper',0,0,1,'',0,0),(32,'Logged','',0,'cpanel',0,'0000-00-00 00:00:00',1,'mod_logged',0,99,1,'',0,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_modules` ENABLE KEYS */;

--
-- Table structure for table `jos_modules_menu`
--

DROP TABLE IF EXISTS `jos_modules_menu`;
CREATE TABLE `jos_modules_menu` (
  `moduleid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_modules_menu`
--


/*!40000 ALTER TABLE `jos_modules_menu` DISABLE KEYS */;
LOCK TABLES `jos_modules_menu` WRITE;
INSERT INTO `jos_modules_menu` VALUES (1,0),(2,0),(3,0),(4,43),(5,1),(6,1),(6,2),(6,4),(6,27),(6,36),(8,1),(9,1),(9,2),(9,4),(9,27),(9,36),(10,1),(13,41),(15,0),(17,0),(18,0),(30,0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_modules_menu` ENABLE KEYS */;

--
-- Table structure for table `jos_newsfeeds`
--

DROP TABLE IF EXISTS `jos_newsfeeds`;
CREATE TABLE `jos_newsfeeds` (
  `catid` int(11) NOT NULL default '0',
  `id` int(11) NOT NULL auto_increment,
  `name` text NOT NULL,
  `link` text NOT NULL,
  `filename` varchar(200) default NULL,
  `published` tinyint(1) NOT NULL default '0',
  `numarticles` int(11) unsigned NOT NULL default '1',
  `cache_time` int(11) unsigned NOT NULL default '3600',
  `checked_out` tinyint(3) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `published` (`published`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_newsfeeds`
--


/*!40000 ALTER TABLE `jos_newsfeeds` DISABLE KEYS */;
LOCK TABLES `jos_newsfeeds` WRITE;
INSERT INTO `jos_newsfeeds` VALUES (4,1,'Joomla! - Official News','http://www.joomla.org/index.php?option=com_rss_xtd&feed=RSS2.0&type=com_frontpage&Itemid=1','',1,5,3600,0,'0000-00-00 00:00:00',8),(4,2,'Joomla! - Community News','http://www.joomla.org/index.php?option=com_rss_xtd&feed=RSS2.0&type=com_content&task=blogcategory&id=0&Itemid=33','',1,5,3600,0,'0000-00-00 00:00:00',9),(4,3,'OpenSourceMatters','http://www.opensourcematters.org/index2.php?option=com_rss&feed=RSS2.0&no_html=1','',1,5,3600,0,'0000-00-00 00:00:00',10),(10,4,'Linux Today','http://linuxtoday.com/backend/my-netscape.rdf','',1,3,3600,0,'0000-00-00 00:00:00',1),(5,5,'Business News','http://headlines.internet.com/internetnews/bus-news/news.rss','',1,3,3600,0,'0000-00-00 00:00:00',2),(11,6,'Web Developer News','http://headlines.internet.com/internetnews/wd-news/news.rss','',1,3,3600,0,'0000-00-00 00:00:00',3),(10,7,'Linux Central:New Products','http://linuxcentral.com/backend/lcnew.rdf','',1,3,3600,0,'0000-00-00 00:00:00',4),(10,8,'Linux Central:Best Selling','http://linuxcentral.com/backend/lcbestns.rdf','',1,3,3600,0,'0000-00-00 00:00:00',5),(10,9,'Linux Central:Daily Specials','http://linuxcentral.com/backend/lcspecialns.rdf','',1,3,3600,0,'0000-00-00 00:00:00',6),(9,10,'Internet:Finance News','http://headlines.internet.com/internetnews/fina-news/news.rss','',1,3,3600,0,'0000-00-00 00:00:00',7);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_newsfeeds` ENABLE KEYS */;

--
-- Table structure for table `jos_poll_data`
--

DROP TABLE IF EXISTS `jos_poll_data`;
CREATE TABLE `jos_poll_data` (
  `id` int(11) NOT NULL auto_increment,
  `pollid` int(4) NOT NULL default '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_poll_data`
--


/*!40000 ALTER TABLE `jos_poll_data` DISABLE KEYS */;
LOCK TABLES `jos_poll_data` WRITE;
INSERT INTO `jos_poll_data` VALUES (13,15,'Yes - it\\\'s perfect!',5),(14,15,'Yes - but there is still room for improvement',9),(15,15,'About the same',3),(16,15,'No - I prefer the old site.',1),(17,15,'',0),(18,15,'',0),(19,15,'',0),(20,15,'',0),(21,15,'',0),(22,15,'',0),(23,15,'',0),(24,15,'',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_poll_data` ENABLE KEYS */;

--
-- Table structure for table `jos_poll_date`
--

DROP TABLE IF EXISTS `jos_poll_date`;
CREATE TABLE `jos_poll_date` (
  `id` bigint(20) NOT NULL auto_increment,
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL default '0',
  `poll_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_poll_date`
--


/*!40000 ALTER TABLE `jos_poll_date` DISABLE KEYS */;
LOCK TABLES `jos_poll_date` WRITE;
INSERT INTO `jos_poll_date` VALUES (1,'2006-09-07 12:32:00',1,14),(2,'2006-09-12 10:51:00',14,15),(3,'2006-09-12 11:13:00',14,15),(4,'2006-09-14 14:12:00',14,15),(5,'2006-09-16 11:05:00',13,15),(6,'2006-09-18 13:46:00',14,15),(7,'2006-09-19 22:14:00',13,15),(8,'2006-09-21 05:33:00',14,15),(9,'2006-09-21 08:33:00',13,15),(10,'2006-09-27 12:55:00',15,15),(11,'2006-09-27 20:48:00',14,15),(12,'2006-09-27 22:38:00',15,15),(13,'2006-09-28 01:11:00',14,15),(14,'2006-09-28 09:28:00',13,15),(15,'2006-09-28 21:54:00',14,15),(16,'2006-10-01 15:22:00',14,15),(17,'2006-10-01 21:58:00',15,15),(18,'2006-10-02 01:41:00',16,15),(19,'2006-10-02 06:06:00',13,15);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_poll_date` ENABLE KEYS */;

--
-- Table structure for table `jos_poll_menu`
--

DROP TABLE IF EXISTS `jos_poll_menu`;
CREATE TABLE `jos_poll_menu` (
  `pollid` int(11) NOT NULL default '0',
  `menuid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_poll_menu`
--


/*!40000 ALTER TABLE `jos_poll_menu` DISABLE KEYS */;
LOCK TABLES `jos_poll_menu` WRITE;
INSERT INTO `jos_poll_menu` VALUES (15,41);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_poll_menu` ENABLE KEYS */;

--
-- Table structure for table `jos_polls`
--

DROP TABLE IF EXISTS `jos_polls`;
CREATE TABLE `jos_polls` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL default '',
  `voters` int(9) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `lag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_polls`
--


/*!40000 ALTER TABLE `jos_polls` DISABLE KEYS */;
LOCK TABLES `jos_polls` WRITE;
INSERT INTO `jos_polls` VALUES (15,'Is the new website more user friendly than the last?',18,0,'0000-00-00 00:00:00',0,0,86400);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_polls` ENABLE KEYS */;

--
-- Table structure for table `jos_sections`
--

DROP TABLE IF EXISTS `jos_sections`;
CREATE TABLE `jos_sections` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `image` varchar(100) NOT NULL default '',
  `scope` varchar(50) NOT NULL default '',
  `image_position` varchar(10) NOT NULL default '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) unsigned NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `access` tinyint(3) unsigned NOT NULL default '0',
  `count` int(11) NOT NULL default '0',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_sections`
--


/*!40000 ALTER TABLE `jos_sections` DISABLE KEYS */;
LOCK TABLES `jos_sections` WRITE;
INSERT INTO `jos_sections` VALUES (1,'News','The News','','content','right','<p>Select a news topic category from the list below, then select a news article to read.</p><p>&nbsp;</p>',1,0,'0000-00-00 00:00:00',5,0,7,'imagefolders=*1*'),(2,'Newsflashes','Newsflashes','','content','left','',1,0,'0000-00-00 00:00:00',6,0,1,''),(3,'FAQs','Frequently Asked Questions','pastarchives.jpg','content','left','From the list below choose one of our FAQs topics, then select an FAQ to read. If you have a question which is not in this section, please contact us.',1,0,'0000-00-00 00:00:00',7,0,1,''),(4,'Meetings','Meetings','','content','left','',1,0,'0000-00-00 00:00:00',4,0,5,'imagefolders=*1*'),(5,'Documents','Documents','','content','left','',1,0,'0000-00-00 00:00:00',3,0,18,'imagefolders=*1*'),(6,'Standards & Protocols','Standards & Protocols','','content','left','',1,0,'0000-00-00 00:00:00',2,0,0,'imagefolders=*1*');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_sections` ENABLE KEYS */;

--
-- Table structure for table `jos_session`
--

DROP TABLE IF EXISTS `jos_session`;
CREATE TABLE `jos_session` (
  `username` varchar(50) default '',
  `time` varchar(14) default '',
  `session_id` varchar(200) NOT NULL default '0',
  `guest` tinyint(4) default '1',
  `userid` int(11) default '0',
  `usertype` varchar(50) default '',
  `gid` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`session_id`),
  KEY `whosonline` (`guest`,`usertype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_session`
--


/*!40000 ALTER TABLE `jos_session` DISABLE KEYS */;
LOCK TABLES `jos_session` WRITE;
INSERT INTO `jos_session` VALUES ('','1161954218','bbcdc41eb54eaf669cd6bac5364f1138',1,0,'',0),('','1161954263','24f1f49e61d2ccc49f070d318ecfb17b',1,0,'',0),('admin','1161859700','ee19ff9543706fbd58cdbdc1e1c335cc',1,62,'Super Administrator',0);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_session` ENABLE KEYS */;

--
-- Table structure for table `jos_stats_agents`
--

DROP TABLE IF EXISTS `jos_stats_agents`;
CREATE TABLE `jos_stats_agents` (
  `agent` varchar(255) NOT NULL default '',
  `type` tinyint(1) unsigned NOT NULL default '0',
  `hits` int(11) unsigned NOT NULL default '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_stats_agents`
--


/*!40000 ALTER TABLE `jos_stats_agents` DISABLE KEYS */;
LOCK TABLES `jos_stats_agents` WRITE;
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_stats_agents` ENABLE KEYS */;

--
-- Table structure for table `jos_template_positions`
--

DROP TABLE IF EXISTS `jos_template_positions`;
CREATE TABLE `jos_template_positions` (
  `id` int(11) NOT NULL auto_increment,
  `position` varchar(10) NOT NULL default '',
  `description` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_template_positions`
--


/*!40000 ALTER TABLE `jos_template_positions` DISABLE KEYS */;
LOCK TABLES `jos_template_positions` WRITE;
INSERT INTO `jos_template_positions` VALUES (1,'left',''),(2,'right',''),(3,'top',''),(4,'bottom',''),(5,'inset',''),(6,'banner',''),(7,'header',''),(8,'footer',''),(9,'newsflash',''),(10,'legals',''),(11,'pathway',''),(12,'toolbar',''),(13,'cpanel',''),(14,'user1',''),(15,'user2',''),(16,'user3',''),(17,'user4',''),(18,'user5',''),(19,'user6',''),(20,'user7',''),(21,'user8',''),(22,'user9',''),(23,'advert1',''),(24,'advert2',''),(25,'advert3',''),(26,'icon',''),(27,'debug','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_template_positions` ENABLE KEYS */;

--
-- Table structure for table `jos_templates_menu`
--

DROP TABLE IF EXISTS `jos_templates_menu`;
CREATE TABLE `jos_templates_menu` (
  `template` varchar(50) NOT NULL default '',
  `menuid` int(11) NOT NULL default '0',
  `client_id` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`template`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_templates_menu`
--


/*!40000 ALTER TABLE `jos_templates_menu` DISABLE KEYS */;
LOCK TABLES `jos_templates_menu` WRITE;
INSERT INTO `jos_templates_menu` VALUES ('sp2ktemplate',0,0),('joomla_admin',0,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_templates_menu` ENABLE KEYS */;

--
-- Table structure for table `jos_users`
--

DROP TABLE IF EXISTS `jos_users`;
CREATE TABLE `jos_users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '',
  `username` varchar(25) NOT NULL default '',
  `email` varchar(100) NOT NULL default '',
  `password` varchar(100) NOT NULL default '',
  `usertype` varchar(25) NOT NULL default '',
  `block` tinyint(4) NOT NULL default '0',
  `sendEmail` tinyint(4) default '0',
  `gid` tinyint(3) unsigned NOT NULL default '1',
  `registerDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL default '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL default '',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_users`
--


/*!40000 ALTER TABLE `jos_users` DISABLE KEYS */;
LOCK TABLES `jos_users` WRITE;
INSERT INTO `jos_users` VALUES (62,'Administrator','admin','sp2000@rdg.ac.uk','087489d29ed83b88a03f3ccd0b727479','Super Administrator',0,1,25,'2006-09-07 12:31:36','2006-10-13 14:41:15','','expired=\nexpired_time='),(63,'Peter Brewer','aps03pwb','p.w.brewer@rdg.ac.uk','430b5a9a558706b712545e80ecfb5928','Author',0,0,19,'2006-09-07 12:44:03','2006-10-26 11:24:31','','editor=tinymce'),(64,'Director','director','sp2000@sp2000.org','3d4e992d8d8a7d848724aa26ed7f4176','Author',0,0,19,'2006-09-08 17:25:33','2006-10-02 11:09:16','','editor=');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_users` ENABLE KEYS */;

--
-- Table structure for table `jos_usertypes`
--

DROP TABLE IF EXISTS `jos_usertypes`;
CREATE TABLE `jos_usertypes` (
  `id` tinyint(3) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL default '',
  `mask` varchar(11) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_usertypes`
--


/*!40000 ALTER TABLE `jos_usertypes` DISABLE KEYS */;
LOCK TABLES `jos_usertypes` WRITE;
INSERT INTO `jos_usertypes` VALUES (0,'superadministrator',''),(1,'administrator',''),(2,'editor',''),(3,'user',''),(4,'author',''),(5,'publisher',''),(6,'manager','');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_usertypes` ENABLE KEYS */;

--
-- Table structure for table `jos_weblinks`
--

DROP TABLE IF EXISTS `jos_weblinks`;
CREATE TABLE `jos_weblinks` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `catid` int(11) NOT NULL default '0',
  `sid` int(11) NOT NULL default '0',
  `title` varchar(250) NOT NULL default '',
  `url` varchar(250) NOT NULL default '',
  `description` varchar(250) NOT NULL default '',
  `date` datetime NOT NULL default '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL default '0',
  `published` tinyint(1) NOT NULL default '0',
  `checked_out` int(11) NOT NULL default '0',
  `checked_out_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL default '0',
  `archived` tinyint(1) NOT NULL default '0',
  `approved` tinyint(1) NOT NULL default '1',
  `params` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jos_weblinks`
--


/*!40000 ALTER TABLE `jos_weblinks` DISABLE KEYS */;
LOCK TABLES `jos_weblinks` WRITE;
INSERT INTO `jos_weblinks` VALUES (1,2,0,'Joomla!','http://www.joomla.org','Home of Joomla!','2005-02-14 15:19:02',2,1,0,'0000-00-00 00:00:00',1,0,1,'target=0'),(2,2,0,'php.net','http://www.php.net','The language that Joomla! is developed in','2004-07-07 11:33:24',0,1,0,'0000-00-00 00:00:00',3,0,1,''),(3,2,0,'MySQL','http://www.mysql.com','The database that Joomla! uses','2004-07-07 10:18:31',0,1,0,'0000-00-00 00:00:00',5,0,1,''),(4,2,0,'OpenSourceMatters','http://www.opensourcematters.org','Home of OSM','2005-02-14 15:19:02',2,1,0,'0000-00-00 00:00:00',1,0,1,'target=0'),(5,2,0,'Joomla! - Forums','http://forum.joomla.org','Joomla! Forums','2005-02-14 15:19:02',2,1,0,'0000-00-00 00:00:00',1,0,1,'target=0');
UNLOCK TABLES;
/*!40000 ALTER TABLE `jos_weblinks` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

