<?php
// $Id: page.tpl.php,v 1.11.2.1 2009/04/30 00:13:31 goba Exp $

/**
 * @file page.tpl.php
 *
 * Theme implementation to display a single Drupal page.
 *
 * Available variables:
 *
 * General utility variables:
 * - $base_path: The base URL path of the Drupal installation. At the very
 *   least, this will always default to /.
 * - $css: An array of CSS files for the current page.
 * - $directory: The directory the theme is located in, e.g. themes/garland or
 *   themes/garland/minelli.
 * - $is_front: TRUE if the current page is the front page. Used to toggle the mission statement.
 * - $logged_in: TRUE if the user is registered and signed in.
 * - $is_admin: TRUE if the user has permission to access administration pages.
 *
 * Page metadata:
 * - $language: (object) The language the site is being displayed in.
 *   $language->language contains its textual representation.
 *   $language->dir contains the language direction. It will either be 'ltr' or 'rtl'.
 * - $head_title: A modified version of the page title, for use in the TITLE tag.
 * - $head: Markup for the HEAD section (including meta tags, keyword tags, and
 *   so on).
 * - $styles: Style tags necessary to import all CSS files for the page.
 * - $scripts: Script tags necessary to load the JavaScript files and settings
 *   for the page.
 * - $body_classes: A set of CSS classes for the BODY tag. This contains flags
 *   indicating the current layout (multiple columns, single column), the current
 *   path, whether the user is logged in, and so on.
 *
 * Site identity:
 * - $front_page: The URL of the front page. Use this instead of $base_path,
 *   when linking to the front page. This includes the language domain or prefix.
 * - $logo: The path to the logo image, as defined in theme configuration.
 * - $site_name: The name of the site, empty when display has been disabled
 *   in theme settings.
 * - $site_slogan: The slogan of the site, empty when display has been disabled
 *   in theme settings.
 * - $mission: The text of the site mission, empty when display has been disabled
 *   in theme settings.
 *
 * Navigation:
 * - $search_box: HTML to display the search box, empty if search has been disabled.
 * - $primary_links (array): An array containing primary navigation links for the
 *   site, if they have been configured.
 * - $secondary_links (array): An array containing secondary navigation links for
 *   the site, if they have been configured.
 *
 * Page content (in order of occurrance in the default page.tpl.php):
 * - $left: The HTML for the left sidebar.
 *
 * - $breadcrumb: The breadcrumb trail for the current page.
 * - $title: The page title, for use in the actual HTML content.
 * - $help: Dynamic help text, mostly for admin pages.
 * - $messages: HTML for status and error messages. Should be displayed prominently.
 * - $tabs: Tabs linking to any sub-pages beneath the current page (e.g., the view
 *   and edit tabs when displaying a node).
 *
 * - $content: The main content of the current Drupal page.
 *
 * - $right: The HTML for the right sidebar.
 *
 * Footer/closing data:
 * - $feed_icons: A string of all feed icons for the current page.
 * - $footer_message: The footer message as defined in the admin settings.
 * - $footer : The footer region.
 * - $closure: Final closing markup from any modules that have altered the page.
 *   This variable should always be output last, after all other dynamic content.
 *
 * @see template_preprocess()
 * @see template_preprocess_page()
 */

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php print $language->language ?>" lang="<?php print $language->language ?>" dir="<?php print $language->dir ?>">

<head>
  <?php print $head; ?>
  <title><?php print $head_title; ?></title>
  <?php

  $testpage=menu_get_active_menu_name();
  $testpage=trim($testpage);
  if ($testpage == "menu-help"){
/*	$usefile4="head_flower"; */
	$usefile4="head_fish";
  }elseif ($testpage == "menu-services"){
	$usefile4="head_toadstool";
  }elseif ($testpage == "menu-col"){
/*	$usefile4="head_wood"; */
	$usefile4="head_dragonfly";
  }else{
	$usefile4="head_leaves";
  }
  $usefile5="blue_black_col";

  $dir3="images/headp";
  if ($handle3 = opendir($dir3)) {
// HELP	echo "<p>Files:";
	/* This is the correct way to loop over the directory. */
	while (false !== ($file3 = readdir($handle3))) {
		$filename33=$file3;
// HELP	        echo "<br />$filename33";
		$split13 = explode('.', $filename33);
		$extension3= $split13[1];
		$extension3= strtolower($extension3);
		if (($extension3 == "jpg") || ($extension3 == "png")){
			$cover_files3[]=$filename33;
		}
	}
	shuffle($cover_files3);
	$usefile3=$cover_files3[0];
// HELP	echo "<br />USE: $usefile3";
// HELP	echo "</p>";
	closedir($handle3);
  }

// Random primary backgrounds
//  $filetouse="/images/headp/".$usefile3;
// Matching backgrounds
//  $filetouse="/images/head/".$usefile4;
// Blue and Black
  $filetouse="/images/".$usefile5;

	// THEME COLOUR
//	$theme_col="blue";
//	$theme_col="primary";
	$theme_col="leaflet";

  echo "$styles";
//  echo "<link type=\"text/css\" rel=\"stylesheet\" media=\"all\" href=\"/sites/all/themes/colweb/css/lscreen_leaflet.css\" media=\"screen\" title=\"CoL (medium)\" />\n";
  echo "<link type=\"text/css\" rel=\"stylesheet\" media=\"all\" href=\"/sites/all/themes/colweb/css/lscreen_$theme_col.css\" media=\"screen\" title=\"CoL (medium)\" />\n";

  echo "<style type=\"text/css\" media=\"screen\">\n";
//  echo "#header {background-image: url(/images/head/$usefile4);}\n";
  echo "#header {background-image: url($filetouse);}\n";
  echo "</style>\n";

  ?>


  <?php print $scripts; ?>
  <script type="text/javascript"><?php /* Needed to avoid Flash of Unstyled Content in IE */ ?> </script>
</head>
<body class="<?php print $body_classes; ?>">
  <div id="page">
  <?php
// HELP  echo "<p>testpage = $testpage, front_page = $front_page<br />is_front = $is_front, head_title = $head_title, base_path = $base_path</p>\n";

  echo "<div id=\"header\">\n";

  ?>

      <div id="logo-title">

        <?php if (!empty($logo)): ?>
          <a href="<?php print $front_page; ?>" title="<?php print t('Home'); ?>" rel="home" id="logo">
            <img src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" />
          </a>
        <?php endif; ?>

        <div id="name-and-slogan">
          <?php if (!empty($site_name)): ?>
            <h1 id="site-name">
              <a href="<?php print $front_page ?>" title="<?php print t('Home'); ?>" rel="home"><span><?php print $site_name; ?></span></a>
            </h1>
          <?php endif; ?>

          <?php if (!empty($site_slogan)): ?>
            <div id="site-slogan"><?php print $site_slogan; ?></div>
          <?php endif; ?>
        </div> <!-- /name-and-slogan -->
      </div> <!-- /logo-title -->

      <?php if (!empty($search_box)): ?>
        <div id="search-box"><?php print $search_box; ?></div>
      <?php endif; ?>

      <?php if (!empty($header)): ?>
        <div id="header-region">
          <?php print $header; ?>
        </div>
      <?php endif; ?>

	<?php
//	echo "<div id=\"header_images\"><img src=\"/images/head_left.jpg\" alt=\"header\" title=\"CoL header\" width=\"428\" height=\"95\" /> </div>\n";
	if ($theme_col == "blue"){
	echo "<div id=\"header_images\">&nbsp;</div>\n";
	}else{
	echo "<div id=\"headlink2\">\n";
	echo "<span class=\"yellow2\"><div id=\"yellow3\"><a href=\"http://www.catalogueoflife.org/annual-checklist/\" target=\"_blank\">Annual Checklist</a></div></span>\n";
	echo "<span class=\"blue2\"><div id=\"blue3\"><a href=\"http://www.catalogueoflife.org/col\" target=\"_blank\">Latest Edition</a></div></span>\n";
	echo "<span class=\"green2\"><div id=\"green3\"><a href=\"../\">CoL<br />Home</a></div></span>\n";
//	echo "<div id=\"headlink\">\n";
//	echo "<span class=\"yellow\"><a href=\"http://www.catalogueoflife.org/dynamic-checklist/\">Annual Checklist</a></span>\n";
//	echo "<span class=\"blue\"><a href=\"http://www.catalogueoflife.org/dynamic-checklist/\">Latest Edition</a></span>\n";
//	echo "<span class=\"green\"><a href=\"/\">Home</a></span>\n";
	echo "</div>\n";
	}
	?>

    </div> <!-- /header -->

    <div id="container" class="clear-block">

      <div id="navigation" class="menu <?php if (!empty($primary_links)) { print "withprimary"; } if (!empty($secondary_links)) { print " withsecondary"; } ?> ">
        <?php if (!empty($primary_links)): ?>
          <div id="primary" class="clear-block">
            <?php print theme('links', $primary_links, array('class' => 'links primary-links')); ?>
          </div>
        <?php endif; ?>

        <?php if (!empty($secondary_links)): ?>
          <div id="secondary" class="clear-block">
            <?php print theme('links', $secondary_links, array('class' => 'links secondary-links')); ?>
          </div>
        <?php endif; ?>
      </div> <!-- /navigation -->

      <?php if (!empty($left)): ?>
        <div id="sidebar-left" class="column sidebar">
        <?php
	if ($theme_col == "blue"){
	        echo "<div id=\"block-menu-menu-goto\" class=\"clear-block block block-menu\">\n<h2>Quick Links:</h2>\n<div class=\"content\"><ul class=\"menu\">";
//		echo "<form name=\"col_search_form\" method=\"get\" action=\"http://www.catalogueoflife.org/search_results.php\"><input type=\"text\" size=18 name=\"search_string\"><br /><input type=\"submit\" value=\"Quick Search&nbsp;&rsaquo;&rsaquo;&rsaquo;\" class=\"submit\" /></form>\n";
// version1
//	        echo "<div id=\"block-menu-menu-goto\" class=\"clear-block block block-menu\"><h2>Quick Search</h2>\n<div class=\"content\">\n";
//		echo "<form name=\"col_search_form\" method=\"post\" action=\"http://www.catalogueoflife.org/search/all\"><input type=\"text\" size=15 name=\"key\">&nbsp;<input class=\"submit\" type=\"submit\" value=\"Go!\" /></form>\n";
// version2
//	        echo "<div id=\"block-menu-menu-goto\" class=\"clear-block block block-menu\"><div class=\"content\">\n";
//		echo "<form name=\"col_search_form\" method=\"post\" action=\"http://www.catalogueoflife.org/search/all\"><input type=\"text\" size=15 name=\"key\" value=\"Quick search...\">&nbsp;<input class=\"submit\" type=\"submit\" value=\"Go!\" /></form>\n";
//		echo "<form name=\"col_search_form\" method=\"post\" action=\"http://www.catalogueoflife.org/search/all\"><input type=\"text\" size=20 name=\"key\" /><br /><input class=\"submit\" type=\"submit\" value=\"Quick Search&nbsp;&rsaquo;&rsaquo;&rsaquo;\" /></form>\n";

//		echo "</div></div>\n";

	        echo "<li class=\"leaf first\"><a href=\"../\">CoL Home</a></li>\n";
	        echo "<li class=\"leaf\"><a href=\"http://www.catalogueoflife.org/dynamic-checklist/\" target=\"_blank\">CoL Latest Edition</a></li>\n";
	        echo "<li class=\"leaf last\"><a href=\"http://www.catalogueoflife.org/annual-checklist/\" target=\"_blank\">CoL Annual Checklist</a></li></ul></div></div>\n";
	}
// Quick Search
//        echo "<div id=\"block-menu-menu-goto\" class=\"clear-block block block-menu\"><div class=\"content\">\n";
//	echo "<form name=\"col_search_form\" method=\"post\" action=\"http://www.catalogueoflife.org/search/all\"><input type=\"text\" size=20 name=\"key\" /><br /><input class=\"submit\" type=\"submit\" value=\"Quick Search&nbsp;&rsaquo;&rsaquo;&rsaquo;\" /></form>\n";
//	echo "</div></div>\n";

	?>

          <?php print $left; ?>
        </div> <!-- /sidebar-left -->
      <?php endif; ?>

      <div id="main" class="column">
<?php
        if (!empty($content_right)){
	        echo "<div id=\"content_right\">\n";
//		echo "$content_right";
		echo "<img src=\"/images/logos/sp2000.jpg\" width=\"95px\" alt=\"Sp2000 logo\" />";
		echo "<img src=\"/images/logos/itis.jpg\" width=\"95px\" alt=\"itis logo\" />";
		echo "</div> <!-- /content-content_right -->\n";
	}
?>

      <div id="main-squeeze">
	  <?php
	  $path = $_SERVER['REQUEST_URI'];
	  $pathadmin=substr($path, 1, 5);
	  $pathuser=substr($path, 1, 4);
	  $pathadd=substr($path, 1, 8);
	  if (($pathadd == "admin") || ($pathadd == "node/add") || ($pathuser == "user")){
		$display="YES";
	  }else{
		$display="NO";
	  }
// HELP	  echo "<p>1. path: $path (display = $display)<br />$pathadmin, $pathuser, $pathadd</p>\n";
	  ?>
        <?php if ((!empty($breadcrumb)) && ($display == "YES")): ?><div id="breadcrumb"><?php print $breadcrumb; ?></div><?php endif; ?>
        <?php if (!empty($mission)): ?><div id="mission"><?php print $mission; ?></div><?php endif; ?>

        <?php

	if ($testpage == "menu-help"){
		echo "<h5>How do I...</h5>\n";
	}

        if (!empty($content_top)){
//	        echo "<div id=\"content_top\">\n";
//		if ($theme_col != "blue"){
//			echo "<div id=\"leftlinks\">\n";
//		}
	        echo "<div id=\"slogan\">\n";
		echo "$content_top";
//		echo "</div>\n";
		echo "</div> <!-- /content-content_top -->\n";
        }

        if (!empty($content_intro)){
	        echo "<div id=\"intro\">\n";
		echo "$content_intro";
		echo "</div> <!-- /content-content_intro -->\n";
        }

	if ((!empty($content_dynamic)) || (!empty($content_annual)) || (!empty($content_archive)) || (!empty($content_services))){

//        if ((!empty($content_dynamic)) || (!empty($content_annual)) || (!empty($content_archive))){
                $dir="images/covers";
		if ($handle = opendir($dir)) {
// HELP		        echo "<p>Files:";
			/* This is the correct way to loop over the directory. */
			while (false !== ($file1 = readdir($handle))) {
				$filename3=$file1;
// HELP			        echo "<br />$filename3";
				$split1 = explode('.', $filename3);
				$extension= $split1[1];
				$extension= strtolower($extension);
				$split2 = explode('_', $split1[0]);
				$date=$split2[0];
				$date=strtolower($date);
				$cover=$split2[1];
				if (($extension == "jpg") || ($extension == "png")){
				        if ($date == "current"){
// HELP				        	echo "<br />CURRENT: $filename3";
						$current_file=$filename3;
				        }else{
// HELP				        	echo "<br />KEEP: $filename3";
						$cover_files[]=$filename3;
			        	}
				}
			}
			shuffle($cover_files);
			$usefile=$cover_files[0];
// HELP	        	echo "<br />USE: $usefile";
// HELP		        echo "</p>";
			closedir($handle);
		}
//	}

//	if (empty($content_top)){
//	if ((empty($content_top)) || ($theme_col == "blue")){

//		echo "<div id=\"leftlinks\">\n";

//	}

        if (!empty($content_dynamic)){
                $dir2="images/life";
		if ($handle2 = opendir($dir2)) {
// HELP		        echo "<p>Files:";
			/* This is the correct way to loop over the directory. */
			while (false !== ($file2 = readdir($handle2))) {
				$filename23=$file2;
// HELP			        echo "<br />$filename23";
				$split12 = explode('.', $filename23);
				$extension2= $split12[1];
				$extension2= strtolower($extension2);
				if (($extension2 == "jpg") || ($extension2 == "png")){
					$cover_files2[]=$filename23;
				}
			}
			shuffle($cover_files2);
			$usefile2=$cover_files2[0];
			$usefile22=$cover_files2[1];
// HELP	        	echo "<br />USE: $usefile2";
// HELP		        echo "</p>";
			closedir($handle2);
		}

	        echo "<div id=\"dynamic2\"><div id=\"standard\">\n";
	        echo "<a href=\"http://www.catalogueoflife.org/dynamic-checklist/\" target=\"_blank\"><h2>Latest Edition&nbsp;&rsaquo;&rsaquo;&rsaquo;</h2></a>";
		echo "<a href=\"http://www.catalogueoflife.org/dynamic-checklist/\" target=\"_blank\"><img src=\"/images/life/$usefile2\" width=\"147\" alt=\"tree frog\" /></a>";
		echo "$content_dynamic";
		echo "</div></div> <!-- /content-content_dynamic -->\n";
        }

        if (!empty($content_annual)){
	        echo "<div id=\"annual2\"><div id=\"standard\">\n";
//		echo "<a href=\"http://www.catalogueoflife.org/annual-checklist/\" target=\"_blank\"><img src=\"/images/covers/$current_file\" width=\"100\" alt=\"cover\" /></a>";
//	        echo "<a href=\"http://www.catalogueoflife.org/annual-checklist/\" target=\"_blank\"><h2>Annual Checklist&nbsp;&rsaquo;&rsaquo;&rsaquo;</h2></a>";
		echo "$content_annual";
		echo "</div></div><!-- /content-content_annual -->\n";
        }

        if (!empty($content_archive)){
	        echo "<div id=\"archive\">\n";
//	        echo "<a href=\"http://www.catalogueoflife.org/dynamic-checklist/\"><img src=\"/images/covers/$usefile\" /></a><h2><a href=\"http://www.catalogueoflife.org/dynamic-checklist/\">Archive Versions</a></h2>";
	        echo "<a href=\"http://www.sp2000.org/index.php?option=com_content&task=view&id=47&Itemid=44\"><div class=\"redspot\"><h2>Archive Versions&nbsp;&rsaquo;&rsaquo;&rsaquo;</h2>";
		echo "$content_archive";
		echo "</div></a></div> <!-- /content-content_archive -->\n";
	}
        if (!empty($content_services)){
		$usefile2="flower.jpg";

	        echo "<div id=\"services\">\n";
//	        echo "<a href=\"../content/services\"><img src=\"/images/boxes/$usefile2\" /></a><h2><a href=\"http://www.catalogueoflife.org/dynamic-checklist/\">Electronic Services</a></h2>";
	        echo "<a href=\"../content/services\"><div class=\"redspot\"><h2>Electronic Services&nbsp;&rsaquo;&rsaquo;&rsaquo;</h2></div>";
//	        echo "<a href=\"../content/services\"><img src=\"/images/colSmallSquare.jpg\" /></a><h2><a href=\"http://www.catalogueoflife.org/dynamic-checklist/\">Electronic Services</a></h2>";
		echo "$content_services";
		echo "</a></div> <!-- /content-content_services -->\n";
	}
//	echo "</div>\n";
	}

//        if ((!empty($content_extra)) || (!empty($content_extra2)) || (!empty($content_extra3)) || (!empty($content_extra4))){
//        if (!empty($content_right)){
//	echo "<div id=\"extra\"><h2>Quick Links</h2>\n";
//	echo "<div id=\"extra\">\n";

//        if (!empty($content_right)){
//	        echo "<div id=\"content_right\">\n";
////		echo "$content_right";
//		echo "<img src=\"/images/logos/sp2000.jpg\" width=\"95px\" alt=\"Sp2000 logo\" />";
//		echo "<img src=\"/images/logos/itis.jpg\" width=\"95px\" alt=\"itis logo\" />";
//		echo "</div> <!-- /content-content_right -->\n";
//	}

//	echo "</div>\n";

//	}
	
	?>

        <div id="content">
          <?php if ((!empty($title)) && ($display == "YES")): ?><h1 class="title" id="page-title"><?php print $title; ?></h1><?php endif; ?>
          <?php if (!empty($tabs)): ?><div class="tabs"><?php print $tabs; ?></div><?php endif; ?>
          <?php if (!empty($messages)): print $messages; endif; ?>
          <?php if (!empty($help)): print $help; endif; ?>
          <div id="content-content" class="clear-block">
            <?php print $content; ?>
          </div> <!-- /content-content -->
          <?php
//	  echo "HERE: $feed_icons";

        if (!empty($content_guide)){
	        echo "<div id=\"guide\">\n";
//		echo "$content_guide";
		echo "<img src=\"/images/life/$usefile22\" width=\"147\" alt=\"image\" />\n";
		echo "<div id=\"guide2\"><span class=\"orange\">How do I...<a href=\"/content/scientific\" class=\"medium\">Look-up a species</a><a href=\"/content/common\" class=\"small\">Find a common name</a><a href=\"/content/distribution\" class=\"large\">Search by species distribution</a><a href=\"/content/statistics\" class=\"medium\">Check the number of species</a><a href=\"/content/tree\" class=\"small\">View the taxonomic hierachy</a><a href=\"/content/synonyms\" class=\"large\">Trace synonyms</a><a href=\"/content/classification\" class=\"small\">Plant, animal, fungus or micro-organism</a>?</span>\n";
		echo "</div></div> <!-- /content-content_guide -->\n";
	}

        if (!empty($content_lower)){
//	        echo "<div id=\"extra\"><div id=\"extra2\">\n";
	        echo "<div id=\"lower\">\n";
//	        echo "<a href=\"http://www.catalogueoflife.org/dynamic-checklist/\"><img src=\"/images/covers/$usefile\" /></a><h2><a href=\"http://www.catalogueoflife.org/dynamic-checklist/\">Archive Versions</a></h2>";
		echo "$content_lower";
		echo "</div> <!-- /content-content_lower -->\n";
	}

	  ?>
        </div> <!-- /content -->

      </div>
<?php
//        if (!empty($content_right)){
//	        echo "<div id=\"content_right\">\n";
////		echo "$content_right";
//		echo "<img src=\"/images/logos/sp2000.jpg\" width=\"95px\" alt=\"Sp2000 logo\" />";
//		echo "<img src=\"/images/logos/itis.jpg\" width=\"95px\" alt=\"itis logo\" />";
//		echo "</div> <!-- /content-content_right -->\n";
//	}
?>
      </div> <!-- /main-squeeze /main -->

      <?php if (!empty($right)): ?>
        <div id="sidebar-right" class="column sidebar">
          <?php print $right; ?>
        </div> <!-- /sidebar-right -->
      <?php endif; ?>

    </div> <!-- /container -->

    <div id="footer-wrapper">
      <div id="footer">
        <?php
        $year=date('Y');
//	echo "$footer_message";
	echo "<div class=\"left\"><p><a href=\"http://www.catalogueoflife.org/info/copyright\">&copy; $year, Species 2000</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href=\"http://www.catalogueoflife.org/info/copyright\">Disclaimer</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href=\"../content/contact\">Contact Us</a></p></div>";
	if (!empty($footer)){
		echo "<br class=\"doNotDisplay doNotPrint\" />
<div class=\"right\">$footer</div>";
	}
	?>
      </div> <!-- /footer -->
    </div> <!-- /footer-wrapper -->

    <?php print $closure; ?>

  </div> <!-- /page -->

</body>
</html>
