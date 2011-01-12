<?php
/*---------------------------------------------------+
| LightNEasy Content Management System
| Copyright 2007 - 2008 Fernando Baptista
| http://www.lightneasy.org
+----------------------------------------------------+
| Runtime module runtime.php
| Version 3 SQLite/MySQL
+----------------------------------------------------+
| Released under the terms & conditions of v2 of the
| GNU General Public License. For details refer to
| the included gpl.txt file or visit http://gnu.org
+----------------------------------------------------*/
# This is the runtime module used by the generated php pages
error_reporting(E_ERROR | E_WARNING | E_PARSE);

// Checks if database.php exists. If not, redirect to install.php
clearstatcache();
if(!file_exists("./data/database.php")) header ("Location: LightNEasy/install.php");

session_start();
$message="";
$selected=array('index','m2','m3','link','name');

//Includes the common functions
require_once "./LightNEasy/common.php";

$sqldbdb=opendb();
$result=dbquery('SELECT * FROM bannedips WHERE ip="'.$_SERVER['REMOTE_ADDR'].'"');
if($row=fetch_array($result)!== false) die ($langmessage[118]);
readsetup();
//checks if user is logged in
login();
//redirects to LightNEasy.php if user is logged in and is an admin
if ($_SESSION['adminlevel']>2) {
	header("Location: ".$set['homepath'].$set['indexfile']);
}

require_once "./languages/lang_".$set['language'].".php";

//Read menu
readmenu();

switch($_POST['submit']) {
	case "Send message":
		$message=sendmessage();
		break;
	case "sendcomment":
		$message=sendcomment();
		break;
	case "saveprofile":
		$message=saveprofile();
		break;
	case "deletecomment":
		if($_SESSION['adminlevel']>=4)
			$message=deletecomment();
		break;
	default:
}

if(isset($_GET['dlid'])) 
	senddownload();

function content($count) {
	global $langmessage, $menu, $message;
	if($message!="") print "<div class=\"LNE_message\">".$message."</div>\n";
	switch($_GET['do']) {
		case "profile":
			print profile();
			break;
		case "sitemap":
			print showsitemap($langmessage,1);
			break;
		case "login":
			print loginform();
			break;
		default: {
			$result = dbquery('SELECT * FROM paginas WHERE page="'.$count.'"');
			$row=fetch_array($result);
			if($row['restricted']!=0 && $row['restricted'] > $_SESSION['adminlevel']) {
				print restrictedpage($row['restricted']);
			} else
				markers(stripslashes(html_entity_decode($row['content'])));
		}
	}
}

function extra($id=1) {
	$result=dbquery("select content FROM extras WHERE id=$id");
	if($row=fetch_array($result)) markers(stripslashes(html_entity_decode($row['content'])));
}

//parses the page content and executes the modules
function markers($page) {
$open="%!$";
$close="$!%";
while(strpos($page,$open)) {
	$pagearray=explode($open,$page,2);
	print $pagearray[0];
	$pagearray1=explode($close,$pagearray[1],2);
	switch($pagearray1[0]) {
		case "contact": print contact(); break;
		case "news": print shownews(); break;
		case "downloads": print downloads(); break;
		case "links": print links(); break;
		case "galery": print galery(); break;
		default: {
			if(substr($pagearray1[0],0,6)=="plugin") {
				$pluginame="plugins/".clean(substr($pagearray1[0],6))."/";
				if(file_exists($pluginame."place.mod"))
					print file_get_contents($pluginame."place.mod");
				if(file_exists($pluginame."include.mod")) {
					include $pluginame."include.mod";
				}
			} elseif(substr($pagearray1[0],0,9)=="lyteframe") {
				$bb=trim(substr($pagearray1[0],9));
				$aa=explode(" ",$bb);
				if($aa[3]!="") print lyteframe($aa[0],$aa[1],$aa[2],$aa[3]);
				elseif($aa[2]!="") print lyteframe($aa[0],$aa[1],$aa[2]);
				elseif($aa[1]!="") print lyteframe($aa[0],$aa[1]);
				else print lyteframe($aa[0]);
			} elseif(substr($pagearray1[0],0,7)=="wrapper") {
				$bb=clean(substr($pagearray1[0],7));
				$aa=explode(" ",$bb);
				$framewidth=0;
				if($aa[1]!="") $framewidth=strval(trim($aa[1]));
				print iframe($aa[0],$framewidth);
			} elseif(substr($pagearray1[0],0,4)=="news") {
				$bb=clean(substr($pagearray1[0],4));
				$aa=explode(" ",$bb);
				if($aa[3]!="") print shownews($aa[0],$aa[1],$aa[2],$aa[3]);
				elseif($aa[2]!="") print shownews($aa[0],$aa[1],$aa[2]);
				elseif($aa[1]!="") print shownews($aa[0],$aa[1]);
				else print shownews($aa[0]);
			} elseif(substr($pagearray1[0],0,8)=="function") {
				$bb=clean(substr($pagearray1[0],8));
				$aa=explode(" ",$bb);
				if($aa[3]!="") print $aa[0]($aa[1],$aa[2],$aa[3]);
				elseif($aa[2]!="") print $aa[0]($aa[1],$aa[2]);
				elseif($aa[1]!="") print $aa[0]($aa[1]);
				else print $aa[0]();
			} elseif(substr($pagearray1[0],0,3)=="mp3") print mp3(clean(substr($pagearray1[0],3)));
			elseif(substr($pagearray1[0],0,6)=="galery") print galery(clean(substr($pagearray1[0],6)));
			elseif(substr($pagearray1[0],0,7)=="include") include clean(substr($pagearray1[0],7));
			elseif(substr($pagearray1[0],0,9)=="downloads") print downloads(clean(substr($pagearray1[0],9)));
			elseif(substr($pagearray1[0],0,5)=="links") print links(clean(substr($pagearray1[0],5)));
			elseif(substr($pagearray1[0],0,6)=="videoy") print youtube(clean(substr($pagearray1[0],6)));
			elseif(substr($pagearray1[0],0,6)=="videog") print googlev(clean(substr($pagearray1[0],6)));
			elseif(substr($pagearray1[0],0,5)=="place") print clean(file_get_contents(trim(substr($pagearray1[0],5))));
			elseif(substr($pagearray1[0],0,5)!="first" && substr($pagearray1[0],0,4)!="head") print "\n".clean($pagearray1[0])."\n";
		}
	}
	$page=$pagearray1[1];
  }
  if ($page!="") print $page;
}

//prints.... guess what
function footer() {
	global $set, $LNEversion;
	print $set['footer']." - <a href=\"http://lightneasy.org\">LightNEasy $LNEversion</a>";
}
?>