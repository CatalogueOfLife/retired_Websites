<?php $pagenum="faro"; require_once "./LightNEasy/runtime.php"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<!-- +++++++++++++++++++++++++++++++++++++++++++++++++
| LightNEasy 3 Content Management System
| SQLite/MySQL version
++++++++++++++++++++++++++++++++++++++++++++++++++++++
| Copyright 2007-2009 Fernando Baptista
| http://www.lightneasy.org
++++++++++++++++++++++++++++++++++++++++++++++++++++++
| Released under the terms & conditions of v2 of the
| GNU General Public License. For details refer to
| the included gpl.txt file or visit http://gnu.org
+++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<meta http-equiv='Content-Language' content='en_US' />
<meta http-equiv='Content-Script-Type' content='text/javascript' />
<meta http-equiv='Content-Style-Type' content='text/css' />
<title> Faro - 4D4Life</title>
<meta name='keywords' content='diversity, species, biodiversity, taxonomy, species2000, catalogue of life' />
<meta name='description' content='4D4Life establishes a state of the art e-taxonomy facility based on an enhanced service-based distributed architecture.' />
<meta name='author' content='Admin' />
<meta name='generator' content='LightNEasy 3' />
<meta name='Robots' content='index,follow' />
<meta http-equiv='imagetoolbar' content='no' /><!-- disable IE's image toolbar -->
<link rel='stylesheet' type='text/css' href='templates/4d4life_2oct2009/style.css' />
<link rel='stylesheet' type='text/css' href='css/lightneasy.css' />
<link rel="alternate" type="application/rss+xml" title="4D4Life RSS Feed" href="LightNEasy/rss.php" />
<link rel="alternate" type="application/atom+xml" title="4D4Life Atom Feed" href="LightNEasy/atom.php" />
</head>
<body>
<div class="content">
<div class="main_content">
<div class="preheader"></div>
<img src="./banner3.jpg" id= "imbanner">
<img src="./euimgs.jpg" id= "euimgs">

<table class = "content_table">
<tr><td colspan = 2 ><span class="slogan">Distributed Dynamic Diversity Databases for Life</span></td></tr>
<tr><td colspan = 2 id="mainlevel-box"><span ><ul id="mainlevel-nav"><li class="textblue"><a href = "http://www.catalogueoflife.org/col" class="mainlevel-nav" target = "_new">Catalogue of Life</a><span style='margin-left: 30px;'>&nbsp;</span></li><li><a href="http://www.catalogueoflife.org/annual-checklist/2010" class="mainlevel-nav" target = "_new">Annual Checklist</a></li><li><a href="http://www.catalogueoflife.org/services" class="mainlevel-nav" target = "_new">CoL Services</a></li></ul></span></td></tr>
<tr><td class="sd_menu">
<h2> Faro</h2><ul><?php print fullmenu(1); ?>
</ul><br /><br /><?php print extra(); ?>
<br />
</td><td class="sd_content"><?php content("faro"); ?></td></tr>
</table>
<div class="footer"><div class="padding"><br /><a href="?do=sitemap">Site Map</a> | <?php print loginout(); ?>
</div></div></div></div>
</body>
</html>
