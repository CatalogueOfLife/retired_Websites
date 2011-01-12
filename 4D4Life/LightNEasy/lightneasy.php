<?php
/*++++++++++++++++++++++++++++++++++++++++++++++++++++
| LightNEasy Content Management System
| Copyright 2007 - 2008 Fernando Baptista
| http://www.LightNEasy.org
++++++++++++++++++++++++++++++++++++++++++++++++++++++
| lightneasy.php Version 3 SQLite/MySQL
++++++++++++++++++++++++++++++++++++++++++++++++++++++
| Released under the terms & conditions of v2 of the
| GNU General Public License. For details refer to
| the included gpl.txt file or visit http://gnu.org
+++++++++++++++++++++++++++++++++++++++++++++++++++++*/
error_reporting(E_ERROR | E_WARNING | E_PARSE);
session_start();
clearstatcache();

// Redirects to install.php if database file doesn't exist
if(!@filesize("./data/database.php")) header ("Location: ./LightNEasy/install.php");

// Detects the insertion of code in the $_GET array
foreach ($_GET as $check_url) {
	if ((eregi("<[^>]*script*\"?[^>]*>", $check_url)) || (eregi("<[^>]*object*\"?[^>]*>", $check_url)) || (eregi("<[^>]*iframe*\"?[^>]*>", $check_url)) || (eregi("<[^>]*applet*\"?[^>]*>", $check_url)) || (eregi("<[^>]*meta*\"?[^>]*>", $check_url)) || (eregi("<[^>]*style*\"?[^>]*>", $check_url)) || (eregi("<[^>]*form*\"?[^>]*>", $check_url)) || (eregi("\([^>]*\"?[^)]*\)", $check_url)) || (eregi("\"", $check_url))) die ("Hijacking attempt, dying....");
}
unset($check_url);

// Installs the common functions
require_once "./LightNEasy/common.php";

// Opens the database
$sqldbdb=opendb();

// Reads the setup to the global array $set
$set = array();
readsetup();
if($set['language']=="") $set['language']="en_US";
if($set['langeditor']=="") $set['langeditor']="en";

// Checks if this file is not called remotely
if (!eregi($set['indexfile'], sv('PHP_SELF')) && !eregi('index.php', sv('PHP_SELF')))
	die ('Access Denied!');

// Reads the language file
require_once "./languages/lang_".$set['language'].".php";

if($_GET['do']=="logout")
	logout();

// Checks if there was a login attempt or a login cookie exists
login();

// Disables $_GET and $_POST if the user is not logged in, except for the allowed posts
// Disables $_GET except for login and sitemap
if($_GET['do']!="profile" && $_GET['do']!="login" && $_GET['do']!="sitemap" && $_SESSION[$set['password']] != "1") unset ($_GET['do']);

// Disables $_POST['submit'] except for login, send message and send comment
if($_POST['submit']!="Send message" && $_POST['submit']!="sendcomment" && $_POST['submit']!="saveprofile" && $_SESSION[$set['password']] != "1") unset ($_POST['submit']);

### LightNEay global variables: ###
// $set - settings
// $langmessage - the language file

// edit these 2 following values to your convenience
$max_upload_file_size=2500000;
$max_upload_image_size=250000;

// Global variable containing messages to the user;
$message="";

// $menu - contains the menu
$menu=array(array('m1','m2','m3','link','name'));

// $selected - contains the information of the current page
$selected=array('index','m2','m3','link','name','description','template');

// $pagenum - the file name of the current page
$pagenum=sanitize($_GET['page']);
if($pagenum=="") $pagenum="index";

// $out - String containing the page to be sent to the browser
$out="";

### End of global variables ###

// treats the several possible inputs
switch($_POST['submit']) {
	case "sendcomment":
		$message=sendcomment();
		break;
	case "Send message":
		$message=sendmessage();
		break;
	case "saveprofile":
		$message=saveprofile();
		break;
	case "deletecomment":
		$message=deletecomment();
		break;
	default:
}

// there is a download request
if(isset($_GET['dlid'])) senddownload();

// there is a password input for restricted pages
if (isset($_POST['restrictedpassword'])) {
	if(sha1($_POST['restrictedpassword'])==$set['restricted']) { //entered pasword is correct
		$_SESSION['restricteduser']=true;
	}
}

// read the menu
readmenu();

// reads the admin functions if the user is logged in
if($_SESSION['adminlevel']>2) {
	require_once "./LightNEasy/admin.php";
//call admin functions for treating inputs if logged in
	treat_posts();
}

// Sets the path to the template file
if($selected['template']=="") $selected['template']=$set['template'];
$templatepath="./templates/".$selected['template']."/template.php";
//defaults to lightneasy template if selected template not found
if (!file_exists($templatepath)) $templatepath="./templates/lightneasy/template.php";
if (!file_exists($templatepath)) die ($templatepath." ".$langmessage[109]);

if($_GET['do']=="generate") generate();
//if($_GET['do']=="generate") $message="Function disabled";

//Read the template and execute the template markers
$page=file_get_contents($templatepath);
while($page != "") {
	if($pagearray=explode($set['openfield'],stripslashes($page),2)) {
		$out.=$pagearray[0];
		$page=$pagearray[1];
		if($pagearray=explode($set['closefield'],$page,2)) {
			$command=trim($pagearray[0]);
			$page=$pagearray[1];
			switch($command) {
				case "header": $out .= printheader(0,$selected['name']); break;
				case "title": $out .= '<a href="'.$set['homepath'].'">'.$set['title'].'</a>'; break;
				case "subtitle": $out .= $set['subtitle']; break;
				case "mainmenu": $out .= mainmenu(0); break;
				case "mainmenu1": $out.= mainmenu(0,1); break;
				case "mainmenu2": $out.= mainmenu(0,2); break;
				case "mainmenu3": $out.= mainmenu(0,3); break;
				case "submenu": $out .= submenu(0); break;
				case "fullmenu": $out .= fullmenu(0); break;
				case "expmenu": $out .= expmenu(0); break;
				case "treemenu": $out.= treemenu(0); break;
				case "selected": $out .= $selected['name']; break;
				case "content": $out .= content(); break;
				case "extra": $out .= extra(); break;
				case "news": $out .= shownews(); break;
				case "lastnews": $out .= lastnews(); break;
				case "downloads": $out .= downloads(); break;
				case "links": $out .= links(); break;
				case "footer": $out .= $set['footer']; break;
				case "homelink": $out .= '<a href="'.$set['homepath']."\">$langmessage[111]</a>"; break;
				case "sitemap": $out .= sitemap(0); break;
				case "login":  $out .= loginout(); break;
				case "loginform":  $out .= loginform(); break;
				case "image": $out .= "./templates/".$selected['template']."/images/"; break;
				default: {
					if(substr($command,0,8) == "lastnews") {
						$aa = explode(" ",$command,2);
						$out .= lastnews($aa[1]);
					} elseif(substr($command,0,9) == "downloads") {
						$aa = explode(" ",$command,2);
						$out .= downloads($aa[1]);
					} elseif(substr($command,0,5) == "extra") {
						$aa = explode(" ",$command,2);
						$out .= extra($aa[1]);
					} elseif(substr($command,0,5) == "links") {
						$aa = explode(" ",$command,2);
						$out .= links($aa[1]);
					} elseif(substr($command,0,4) == "news") {
						$bb = trim(substr($command,4));
						$aa = explode(" ",$bb);
						if($aa[3] != "") $out .= shownews($aa[0],$aa[1],$aa[2],$aa[3]);
						elseif($aa[2]!="") $out .= shownews($aa[0],$aa[1],$aa[2]);
						elseif($aa[1]!="") $out .= shownews($aa[0],$aa[1]);
						else $out .= shownews($aa[0]);
					} else
						$out .= $command;
				}
			}
		} else break;
	} else break;
}
if($page != "") $out .= $page;

// $out contains the complete page, print it
print $out;

### Execution end ###

// displays the content and interprets incomming commands
function content() {
global $pagenum, $selected, $message, $menu, $set, $langmessage, $LNEversion, $out;
if($message!="") $out.="<div class=\"LNE_message\">".$message."</div>\n";
if($_SESSION['adminlevel']>2) $out.=adminmenu();
switch($_GET['do']) {
	case "profile":
		if($_SESSION[$set['password']]=="1")
			$out.= profile();
		break;
	case "users":
		$out.= users();
		break;
	case "login":
		$out.= loginform();
		break;
	case "sitemap":
		$out.= showsitemap($langmessage,0);
		break;
	case "edit":
		print $out;
		$out="";
		editpage();
		break;
	case "editextra":
		print $out;
		$out="";
		extras();
		break;
	case "adminnews":
		print $out;
		$out="";
		adminnews();
		break;
	case "editlinks":
		$out.= editlinks();
		break;
	case "download":
		$out.= download();
		break;
	case "settings":
		$out.= settings();
		break;
	case "query":
		$out.= query();
		break;
	case "setup":
		$out.= setup();
		break;
	case "editmenu":
		$out.= editmenu();
		break;
	case "delete":
		delete_page();
		break;
	case "image":
		$out.= images();
		break;
	case "create": {
		$out.= create_page();
		break;
	}
	default: {
		$result = dbquery("SELECT * FROM paginas WHERE page=\"".$pagenum."\"");
		if($row=fetch_array($result)) {
			if($row['restricted']!=0 && $row['restricted'] > $_SESSION['adminlevel'])
				$out.=restrictedpage($row['restricted']);
			else
				showcontent(html_entity_decode(stripslashes($row['content'])));
		} else {
			$result = dbquery("SELECT * FROM paginas WHERE page=\"index\"");
			if($row=fetch_array($result))
				showcontent(html_entity_decode(stripslashes($row['content'])));
			else $out.="<h2>$langmessage[116]</h2>\n";
		}
	}
  }
}

function showcontent($page) {
	global $out;
	$open="%!$";
	$close="$!%";
	while(strpos($page,$open)) {
		$pagearray=explode($open,$page,2);
		$out.=$pagearray[0];
		$pagearray1=explode($close,$pagearray[1],2);
		switch($pagearray1[0]) {
			case "contact": $out.= contact(); break;
			case "news": $out.= shownews(); break;
			case "downloads": $out.= downloads(); break;
			case "links": $out.= links(); break;
			default: {
				if(substr($pagearray1[0],0,7)=="include") {
					print $out;
					include clean(substr($pagearray1[0],7));
					$out="";
				} elseif(substr($pagearray1[0],0,3)=='mp3') $out.= mp3(clean(substr($pagearray1[0],3)));
				elseif(substr($pagearray1[0],0,9)=='downloads') $out.= downloads(clean(substr($pagearray1[0],9)));
				elseif(substr($pagearray1[0],0,5)=='links') $out.= links(clean(substr($pagearray1[0],5)));
				elseif(substr($pagearray1[0],0,6)=='videoy') $out.= youtube(clean(substr($pagearray1[0],6)));
				elseif(substr($pagearray1[0],0,6)=='videog') $out.= googlev(clean(substr($pagearray1[0],6)));
				elseif(substr($pagearray1[0],0,5)=='first') {
					$aaa=include clean(substr($pagearray1[0],5));
					$out=$aaa.$out;
				} elseif(substr($pagearray1[0],0,6)=="galery" || substr($pagearray1[0],0,9)=="lyteframe") {
					$out=str_replace("</head>","<link rel=\"stylesheet\" href=\"css/lytebox.css\" type=\"text/css\" media=\"screen\" />\n<script type=\"text/javascript\" src=\"js/lytebox.js\"></script>\n</head>",$out);
					if (substr($pagearray1[0],0,6)=="galery") {
						if(trim($pagearray1[0])=="galery") $out.=galery();
						else $out.=galery(clean(substr($pagearray1[0],7)));
					} else {
// it is a Lyteframe
						$bb=trim(substr($pagearray1[0],9));
						$aa=explode(" ",$bb);
						if($aa[3]!="") $out.= lyteframe($aa[0],$aa[1],$aa[2],$aa[3]);
						elseif($aa[2]!="") $out.= lyteframe($aa[0],$aa[1],$aa[2]);
						elseif($aa[1]!="") $out.= lyteframe($aa[0],$aa[1]);
						else $out.= lyteframe($aa[0]);
					}
				} elseif(substr($pagearray1[0],0,6)=="plugin") {
					$pluginame="./plugins/".clean(substr($pagearray1[0],6));
					if(file_exists($pluginame."/header.mod"))
						$out=str_replace("</head",file_get_contents($pluginame."/header.mod")."\n</head",$out);
					if(file_exists($pluginame."/first.mod"))
						include $pluginame."/first.mod";
					if(file_exists($pluginame."/onload.mod"))
						$out=str_replace("<body","<body onload=\"".file_get_contents($pluginame."/onload.mod")."\"",$out);
					if(file_exists("$pluginame/place.mod"))
						$out.=file_get_contents("$pluginame/place.mod");
					if(file_exists("$pluginame/include.mod")) {
						print $out;
						include "$pluginame/include.mod";
						$out="";
					}
				} elseif(substr($pagearray1[0],0,7)=="wrapper") {
					$bb=clean(substr($pagearray1[0],7));
					$aa=explode(" ",$bb);
					$out=str_replace("</head>","<script language=\"JavaScript\">\n<!--\nfunction calcHeight()\n{\n\t//find the height of the internal page\n\tvar the_height=document.getElementById('the_iframe').contentWindow.document.body.scrollHeight+4;\n\t//change the height of the iframe\n\tdocument.getElementById('the_iframe').height=the_height;\n}\n//-->\n</script>\n</head>",$out);
					$framewidth=0;
					if($aa[1]!="") $framewidth=strval(trim($aa[1]));
					$out.=iframe($aa[0],$framewidth);
				} elseif(substr($pagearray1[0],0,8)=="function") {
					$bb=clean(substr($pagearray1[0],8));
					$aa=explode(" ",$bb);
					if($aa[3]!="") $out.=$aa[0]($aa[1],$aa[2],$aa[3]);
					elseif($aa[2]!="") $out.=$aa[0]($aa[1],$aa[2]);
					elseif($aa[1]!="") $out.=$aa[0]($aa[1]);
					else $out.=$aa[0]();
				} elseif(substr($pagearray1[0],0,4)=="news") {
					$bb=clean(substr($pagearray1[0],4));
					$aa=explode(" ",$bb);
					if($aa[3]!="") $out.= shownews($aa[0],$aa[1],$aa[2],$aa[3]);
					elseif($aa[2]!="") $out.= shownews($aa[0],$aa[1],$aa[2]);
					elseif($aa[1]!="") $out.= shownews($aa[0],$aa[1]);
					else $out.= shownews($aa[0]);
				} elseif(substr($pagearray1[0],0,4)=='head')
					$out=str_replace("</head>",file_get_contents(clean(substr($pagearray1[0],4)))."\n</head>",$out);
				elseif(substr($pagearray1[0],0,5)=='place')
					$out.=clean(file_get_contents(trim(substr($pagearray1[0],5))));
				else $out.="\n".html_entity_decode(stripslashes($pagearray1[0]))."\n";
			}
		}
		$page=$pagearray1[1];
	}
	if($page!="") $out.=$page;
}

function sitemap($generate) {
//prints the sitemap link
	global $set, $pagenum, $langmessage;
	if($generate)
		return '<a href="?do=sitemap">'.$langmessage[88].'</a>';
	else
		return '<a href="'.$set['indexfile'].'?page='.$pagenum.'&amp;do=sitemap">'.$langmessage[88].'</a>';
}

function extra($id=1) {
	$result=dbquery("select content FROM extras WHERE id=$id");
	if($row=fetch_array($result)) showcontent(stripslashes(html_entity_decode($row['content'])));
}

function printheader($generate, $pagename, $desc="", $templ="") {
global $set, $selected,$LNEversion;
$aa=credits();
$aa.="<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />\n";
$aa.="<meta http-equiv='Content-Language' content='".$set['language']."' />\n";
$aa.="<meta http-equiv='Content-Script-Type' content='text/javascript' />\n";
$aa.="<meta http-equiv='Content-Style-Type' content='text/css' />\n";
$aa.="<title>".$pagename." - ".$set['title']."</title>\n";
$aa.="<meta name='keywords' content='".$set['keywords']."' />\n";
$aa.="<meta name='description' content='";
if(!empty($desc))
	$aa.=$desc."' />\n";
else
	$aa.=$set['description']."' />\n";
$aa.="<meta name='author' content='".$set['author']."' />\n";
$aa.="<meta name='generator' content='LightNEasy ".$LNEversion."' />\n";
$aa.="<meta name='Robots' content='index,follow' />\n";
$aa.="<meta http-equiv='imagetoolbar' content='no' /><!-- disable IE's image toolbar -->\n";
$aa.="<link rel='stylesheet' type='text/css' href='templates/";
if(!empty($templ))
	$aa.=$templ;
else
	$aa.=$selected['template'];
$aa.="/style.css' />\n";
$aa.="<link rel='stylesheet' type='text/css' href='css/lightneasy.css' />\n";
$aa.="<link rel=\"alternate\" type=\"application/rss+xml\" title=\"".$set['title']." RSS Feed\" href=\"LightNEasy/rss.php\" />\n";
$aa.="<link rel=\"alternate\" type=\"application/atom+xml\" title=\"".$set['title']." Atom Feed\" href=\"LightNEasy/atom.php\" />\n";
return $aa;
}

function credits() {
global $LNEversion;
return "\n<!-- +++++++++++++++++++++++++++++++++++++++++++++++++
| LightNEasy $LNEversion Content Management System
| SQLite/MySQL version
++++++++++++++++++++++++++++++++++++++++++++++++++++++
| Copyright 2007-2009 Fernando Baptista
| http://www.lightneasy.org
++++++++++++++++++++++++++++++++++++++++++++++++++++++
| Released under the terms & conditions of v2 of the
| GNU General Public License. For details refer to
| the included gpl.txt file or visit http://gnu.org
+++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->\n";
}
?>