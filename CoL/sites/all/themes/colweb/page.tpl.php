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

/*  $usefile5="blue_black_col"; */

  $dir3="images/headp";
  if ($handle3 = opendir($dir3)) {
	/* This is the correct way to loop over the directory. */
	while (false !== ($file3 = readdir($handle3))) {
		$filename33=$file3;
		$split13 = explode('.', $filename33);
		$extension3= $split13[1];
		$extension3= strtolower($extension3);
		if (($extension3 == "jpg") || ($extension3 == "png")){
			$cover_files3[]=$filename33;
		}
	}
	shuffle($cover_files3);
	$usefile3=$cover_files3[0];
	closedir($handle3);
  }

  $dir_top="images/top";
  if ($handle_top = opendir($dir_top)) {
	/* This is the correct way to loop over the directory. */
	while (false !== ($file_top = readdir($handle_top))) {
		$filename_top=$file_top;
		$split_top1 = explode('.', $filename_top);
		$extension_top= $split_top1[1];
		$extension_top= strtolower($extension_top);
		if (($extension_top == "jpg") || ($extension_top == "png")){
			$number_top = ereg_replace("[^0-9]", "", $split_top1[0]);
			$cover_files_top[$number_top]=$filename_top;
		}
	}
        $day=date('z');
	$use_number1 = substr($day, -1);
	$day2=$day+1;
	$use_number2 = substr($day2, -1);
	$day3=$day+2;
	$use_number3 = substr($day3, -1);
	$day4=$day+3;
	$use_number4 = substr($day4, -1);
	$day5=$day+4;
	$use_number5 = substr($day5, -1);
	$filetouse1="/prototype/images/top/".$cover_files_top[$use_number1];
	$filetouse2="/prototype/images/top/".$cover_files_top[$use_number2];
	$filetouse3="/prototype/images/top/".$cover_files_top[$use_number3];
	$filetouse4="/prototype/images/top/".$cover_files_top[$use_number4];
	$filetouse5="/prototype/images/top/".$cover_files_top[$use_number5];
	closedir($handle_top);
  }

// Selecting CoL red leaves banner
  $filetouse="/prototype/images/head/head_leaves.jpg";

  echo "$styles";
  echo "<link type=\"text/css\" rel=\"stylesheet\" media=\"all\" href=\"/prototype/sites/all/themes/colweb/css/lscreen_leaflet.css\" media=\"screen\" title=\"CoL (medium)\" />\n";
  echo "<style type=\"text/css\" media=\"screen\">\n";
//  echo "#header {background-image: url($filetouse);}\n";
//  echo "#header {background-image: /prototype/images/head/head_leaves.jpg;}\n";
  echo "#headlink2 .green2 {background-image: url($filetouse1);}\n";
  echo "#headlink2 .blue2 {background-image: url($filetouse2);}\n";
  echo "#headlink2 .yellow2 {background-image: url($filetouse3);}\n";
  echo "#image3 {background-image: url($filetouse4);}\n";
  echo "#image4 {background-image: url($filetouse5);}\n";
  echo "</style>\n";

  ?>


  <?php print $scripts; ?>
  <script type="text/javascript"><?php /* Needed to avoid Flash of Unstyled Content in IE */ ?> </script>
</head>
<body class="<?php print $body_classes; ?>">
  <div id="page">
  <?php
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
/* set up headlinks */
//stw	if ($theme_col == "blue"){
//stw	echo "<div id=\"header_images\">&nbsp;</div>\n";
//stw	}else{
	echo "<div id=\"headlink2\">\n";
	echo "<span class=\"yellow2\"><div id=\"yellow3\"><a href=\"http://www.catalogueoflife.org/annual-checklist/\" target=\"_blank\">Annual Checklist</a></div></span>\n";
	echo "<span class=\"blue2\"><div id=\"blue3\"><a href=\"http://www.catalogueoflife.org/col\" target=\"_blank\">Dynamic Edition</a></div></span>\n";
	echo "<span class=\"green2\"><div id=\"green3\"><a href=\"../\"><br />Home</a></div></span>\n";
	echo "</div>\n";
//stw	}
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


          <?php print $left; ?>
        </div> <!-- /sidebar-left -->

      <?php endif; ?>

     <div id="main" class="column">

     <?php
	/*	This is actually for content at top, not for right sidebar	*/
        if (!empty($content_right)){
	       echo "<div id=\"content_right\">\n";
		echo "$content_right";
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
	  ?>

        <?php if ((!empty($breadcrumb)) && ($display == "YES")): ?><div id="breadcrumb"><?php print $breadcrumb; ?></div><?php endif; ?>
        <?php if (!empty($mission)): ?><div id="mission"><?php print $mission; ?></div><?php endif; ?>

        <?php


	if ((!empty($content_dynamic)) || (!empty($content_annual)) || (!empty($content_archive)) || (!empty($content_services))){
                $dir2="images/life";
		if ($handle2 = opendir($dir2)) {
			/* This is the correct way to loop over the directory. */
			while (false !== ($file2 = readdir($handle2))) {
				$filename23=$file2;
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
			closedir($handle2);
		}


                $dir="images/covers";
		if ($handle = opendir($dir)) {
			/* This is the correct way to loop over the directory. */
			while (false !== ($file1 = readdir($handle))) {
				$filename3=$file1;
				$split1 = explode('.', $filename3);
				$extension= $split1[1];
				$extension= strtolower($extension);
				$split2 = explode('_', $split1[0]);
				$date=$split2[0];
				$date=strtolower($date);
				$cover=$split2[1];
				if (($extension == "jpg") || ($extension == "png")){
				        if ($date == "current"){
						$current_file=$filename3;
				        }else{
						$cover_files[]=$filename3;
			        	}
				}
			}
			shuffle($cover_files);
			$usefile=$cover_files[0];
			closedir($handle);
		}


	}

	/*  populate the right column, which is mis-named 'content top' */
        if (!empty($content_top)){
	       echo "<div id=\"slogan22\">\n";
		echo "$content_top";
		echo "</div> <!-- /content-content_top -->\n";
        }
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

       if (!empty($content_lower)){
	        echo "<div id=\"lower\">\n";
		echo "$content_lower";
		echo "</div> <!-- /content-content_lower -->\n";
	}

  ?>
        </div> <!-- /content -->


    </div> <!-- /main-squeeze /main -->


    </div> <!-- /container -->

    <div id="footer-wrapper">
      <div id="footer">
        <?php
        $year=date('Y');
	echo "<div class=\"left\"><p><a href=\"http://www.catalogueoflife.org/info/copyright\">&copy; $year, Species 2000 at University of Reading</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href=\"http://www.catalogueoflife.org/info/copyright\">Disclaimer</a></p></div>";
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
