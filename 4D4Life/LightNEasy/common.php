<?php
/*---------------------------------------------------+
| LightNEasy Content Management System
| Copyright 2007 - 2008 Fernando Baptista
| http://www.lightneasy.org
+----------------------------------------------------+
| Common functions module common.php
| Version 3 SQLite/MySQL
+----------------------------------------------------+
| Released under the terms & conditions of v2 of the
| GNU General Public License. For details refer to
| the included gpl.txt file or visit http://gnu.org
+----------------------------------------------------*/
# This module contains the common functions

// LightNEasy version
$LNEversion="3";

function profile() {
	global $set, $langmessage;
	$out = "<h2>$langmessage[165]</h2>\n";
	$result=dbquery('SELECT * FROM users WHERE handle="'.$_COOKIE['userhandle'].'"');
	if($row = fetch_array($result)) {
		$out.="<form name=\"form1\" id=\"form1\" method=\"post\" action=\"\" />\n<fieldset style=\"border: none;\">\n";
		$out.="<table style=\"border: none; padding: 4px;\">\n<tr><td>".$langmessage[155]."</td><td><input name=\"handle\" type=\"hidden\" value=\"".$row['handle']."\" /><b>".$row['handle']."</b></td></tr>\n";
		$out.='<tr><td>'.$langmessage[6]."</td><td><input name=\"password\" type=\"password\" size=\"20\" maxlength=\"50\" value=\"\" /></td></tr>\n";
		$out.='<tr><td>'.$langmessage[156]."</td><td><input name=\"repeatpassword\" type=\"password\" size=\"20\" maxlength=\"50\" value=\"\" /></td></tr>\n";
		$out.='<tr><td>'.$langmessage[158].'</td><td><input name="email" type="text" size="20" maxlength="50" value="'.$row['email']."\" /></td></tr>\n";
		$out.='<tr><td>'.$langmessage[166].'</td><td><input name="firstname" type="text" size="20" maxlength="50" value="'.$row['firstname']."\" /></td></tr>\n";
		$out.='<tr><td>'.$langmessage[167].'</td><td><input name="lastname" type="text" size="20" maxlength="50" value="'.$row['lastname']."\" /></td></tr>\n";
		$out.='<tr><td>'.$langmessage[168].'</td><td><input name="website" type="text" size="20" maxlength="50" value="'.$row['website']."\" /></td></tr>\n";
		$out.='<tr><td>'.$langmessage[169].'</td><td><input name="location" type="text" size="20" maxlength="50" value="'.$row['location']."\" /></td></tr>\n";
		$out.="<tr><td><input type=\"hidden\" name=\"submit\" value=\"saveprofile\" />\n";
		$out.="<input type=\"hidden\" name=\"userid\" value=\"".$row['id']."\" /></td>\n";
		$out.="<td><input type=\"submit\" name=\"aaa\" value=\"$langmessage[82]\" /></td></tr>\n</table>\n";
		$out.="</fieldset></form>\n";
	}
	return $out;
}

function deletecomment() {
	$newsid=sanitize($_POST['newsid']);
	$id=sanitize($_POST['id']);
//	dbquery("CREATE TABLE comments ( id INTEGER NOT NULL auto_increment , newsid INTEGER NOT NULL , poster VARCHAR ( 30 ) NOT NULL, postermail VARCHAR ( 40 ) , time DATETIME NOT NULL , text TEXT NOT NULL, PRIMARY KEY (id))");
	dbquery("DELETE FROM comments WHERE newsid=$newsid AND id=\"$id\"");
	return $langmessage[175];
}

function saveprofile() {
	global $message;
	if(!is_intval($_POST['userid'])) die ("aha! Naughty!");
	$handle=sanitize($_POST['handle']);
	$password=sanitize($_POST['password']);
	$repeatpassword=sanitize($_POST['repeatpassword']);
	$email=sanitize($_POST['email']);
	$firstname=sanitize($_POST['firstname']);
	$lastname=sanitize($_POST['lastname']);
	$website=sanitize($_POST['website']);
	$location=sanitize($_POST['location']);
	$query="UPDATE users SET email=\"$email\", firstname=\"$firstname\", lastname=\"$lastname\", handle=\"$handle\", website=\"$website\", location=\"$location\"";
	if($_POST['password']!="") {
		if($_POST['password']==$_POST['repeatpassword'])
			$query.=", password=\"".sha1($_POST['password'])."\"";
		else
			$message="Passwords don't match";
	}
	$query.="  WHERE id=".$_POST['userid'];
	dbquery($query);
}

function loginout() {
//prints the login/logout link
	global $set,$langmessage;
	if($_SESSION[$set['password']]=="1")
		return "<a href=\"?do=profile\">".$_SESSION['user']."</a> | <a href=\"".$set['homepath'].$set['indexfile']."?do=logout\">$langmessage[121]</a>";
	else
		return "<a href=\"".$set['homepath'].$set['indexfile']."?do=login\" rel=\"nofollow\">$langmessage[120]</a>";
}

function logout() {
	global $set, $message;
	unset($_SESSION['user']);
	unset($_SESSION[$set['password']]);
	unset($_SESSION['adminlevel']);
	session_destroy();
	setcookie('userhandle', "", time() - 600);
	setcookie('userpass', "", time() - 600);
	unset($_GET['do']);
	header("Location: ".$set['homepath']);
	$message="you were logged out";
}

function login() {
	global $message, $set, $langmessage;
	if($_SESSION[$set['password']]!="1") {
	if($_GET['do']=="login" && $_POST['handle']!="") {
		$result=dbquery('SELECT * FROM users WHERE handle="'.$_POST['handle'].'"');
		if($row = fetch_array($result)) {
			if($row['password'] == sha1($_POST['password'])) {
				//inserts password in cookie
				setcookie('userpass', sha1(trim($_POST['password'])), time() + 60 * 60 * 24 * 30);
				setcookie('userhandle', $_POST['handle'], time() + 60 * 60 * 24 * 30);
				$_SESSION[$set['password']]="1";
				$_SESSION['user']=$row['handle'];
				$_SESSION['adminlevel']=$row['adminlevel'];
				$message=$langmessage[95];
				unset($_GET['do']);
				header("Location: ".$set['homepath']);
			} else
				$message=$langmessage[96];
		} else
			$message=$langmessage[96];
	} else {
		//Checks if there is a login cookie from past session
		if ($_COOKIE['userhandle'] != "") {
			$result=dbquery('SELECT * FROM users WHERE handle="'.$_COOKIE['userhandle'].'"');
			if($row = fetch_array($result)) {
				if($row['password'] == $_COOKIE['userpass']) {
					$_SESSION[$set['password']]="1";
					$_SESSION['user']=$_COOKIE['userhandle'];
					$_SESSION['adminlevel']=$row['adminlevel'];
					$message="Ah, pois!";
					header("Location: ".$set['homepath']);
				}
			}
		}
	}
	}
}

function loginform() {
//Called by $#loginform#$, prints a login form. Alternative to $#login#$.
	global $langmessage, $LNEversion, $set;
    if ($_SESSION[$set['password']]=="1") {
		$out="\n<form style=\"margin-left: 12px;\" name=\"form1\" id=\"form1\" method=\"get\" action=\"".$set['homepath'].$set['indexfile']."\" />\n";
		$out.="Welcome, <a href=\"?do=profile\">".$_SESSION['user']."</a>\n";
		$out.="<input name=\"do\" value=\"logout\" type=\"hidden\" />\n";
		$out.="<input type=\"submit\" name=\"\" value=\"$langmessage[121]\" />\n";
		$out.="</form>\n";
	} else {
		$out='<div align="center"><h2>'.$langmessage[120].'</h2>';
		$out.='<form name="form1" id="form1" method="post" action="'.$set['homepath'].$set['indexfile'].'?do=login" />';
		$out.='<table><tr><td>Handle</td><td><input name="handle" type="text" size="8" maxlength="20" /></td></tr>';
		$out.='<tr><td>Password</td><td><input name="password" type="password" size="8" maxlength="20" /></td></tr>';
		$out.='<tr><td><input type="hidden" name="do" value="login" /></td>';
		$out.="<td><input type=\"submit\" name=\"\" value=\"$langmessage[120]\" /></td></tr></table>\n";
		$out.="</form>\n</div>\n";
	}
	return $out;
}

function showrss() {
	$out="News feed: <a href=\"./LightNEasy/rss.php\"><img src=\"images/rss.png\" alt=\"RSS feed\" title=\"News RSS feed\" /></a>\n";
	return $out;
}

function lyteframe( $title, $link, $width=0, $height=0 ) {
	$out="<a rev=\"width: ";
	if($width)
		$out.= $width;
	else
		$out.= "640";
	$out.= "px; height: ";
	if($height)
		$out.= $height;
	else
		$out.= "380";
	$out.= "px; scrolling: no;\" title=\"".$title."\" rel=\"lyteframe\" href=\"".$link."\">".$title."</a>\n";
	return $out;
}

function iframe($url, $width) {
	$out="<div style=\"text-align: center; margin: 0; padding: 0;\">\n";
	$out.="<iframe id=\"the_iframe\"\n width=\"";
	if($width) $out.=$width;
	else $out.="100%";
	$out.="\"\n onLoad=\"calcHeight();\"\n src=\"".$url."\"\n scrolling=\"NO\"\n frameborder=\"0\"\n height=\"1\">\nAn iframe capable browser is\nrequired to view this web site\n</iframe>\n</div>\n";
	return $out;
}

function galery($gal="", $width=0, $height=0) {
	global $langmessage;
	if($gal!="") {
		$count=1;
		$out.="<h2>".$gal."</h2><br />\n";
		$galeries[0]=$gal;
	} else {
		if(isset($_POST['gal'])) $gal=sanitize($_POST['gal']);
		$folder="galeries";
		$dir=opendir($folder);
		$count=0;
		while($file=readdir($dir)) {
			if($file != ".." && $file != "." && is_dir($folder."/".$file)) {
				$galeries[$count]=$file;
				$count++;
			}
		}
		closedir($dir);
	}
	if($count>1) {
		$out.="\n<form method=\"post\" name=\"galery\" action=\"\"><fieldset style=\"border: 0;\">\n";
		$out.="<select onchange=\"document.galery.submit();\" name=\"gal\" class=\"LNE_select\">\n";
		for($i=0;$i<$count;$i++) {
			$out.='<option value="'.$galeries[$i].'"';
			if($gal==$galeries[$i]) $out.=" selected";
			$out.=">".$galeries[$i]."&nbsp;</option>\n";
			if($gal=="") $gal=$galeries[$i];
		}
		$out.="</select>\n";
		$out.="<input type=\"hidden\" name=\"showgalery\" value=\"$langmessage[94]\" />\n";
		$out.="</fieldset></form>\n";
		$out.="<br />\n";
	} else {
		$gal=$galeries[0];
	}
	//$gal contains the galery folder
	$gal="galeries/".$gal;
	$filez=filelist('/./',$gal);
	foreach($filez as $file) {
		if($file!="index.html") {
			if($width==0)
				$width=100;
			$out.="<a href=\"$gal/$file\" rel=\"lytebox[".$gal."]\" title=\"$file\" >";
			$out.="<img src=\"thumbs/".createThumb( $gal."/".$file, "thumbs/", $width )."\" width=\"$width\" alt=\"".$file."\" class=\"bordered\" /></a>\n";
		}
	}
	return $out;
}

function restrictedpage ($level) {
	global $langmessage;
	$out = "<h2>$langmessage[146]</h2>\n";
	if($level<4)
		$out.= "<h4>$langmessage[147]</h4>\n";
	else
		$out.= "<h4>$langmessage[164]</h4>\n";
	return $out;
}

function downloads($cat=0) {
	global $langmessage;
	if($cat)
		$query="SELECT * FROM downloadscat WHERE id=".$cat." ORDER BY nome";
	else
		$query="SELECT * FROM downloadscat ORDER BY nome";
	if(!$cresult=dbquery($query))
		die ($langmessage[2]);
	$out.="\n<div id=\"LNE_show\">\n";
	while ($crow = fetch_array($cresult)) {
		$out.="<h3>".decode($crow['descr'])."</h3>";
		$query="SELECT * FROM downloads WHERE ex=".$crow['id']." ORDER BY reg DESC";
		if(!$result=dbquery($query)) die ($langmessage[3]);
		if(num_rows($result)) {
			$GETarray=$_GET;
			$out.="<ul>";
			while ($row = fetch_array($result)) {
				$GETarray['dlid'] = $row[0];
				$out.="<li><a href=\"".$_SERVER['SCRIPT_NAME']."?".http_build_query($GETarray,'','&amp;')."\">".decode($row[1])."</a></li>\n";
			}
			$out.="</ul>";
		} else
			$out.="<h3>$langmessage[100]</h3>";
	}
	$out.="</div>\n";
	return $out;
}

function links($cat=0) {
	global $langmessage;
	$out="";
	if($cat) $query="SELECT * FROM linkscat WHERE id=".$cat." ORDER BY nome";
	else $query="SELECT * FROM linkscat ORDER BY nome";
	if(!$cresult=dbquery($query)) die ($langmessage[4]);
	$out.="\n<div id=\"LNE_show\">\n";
	while ($crow=fetch_array($cresult)) {
		$out.="<h3>".decode($crow['descr'])."</h3>\n";
		$query="SELECT * FROM links where hits=".$crow[0]." ORDER BY name";
		if(!$result=dbquery($query)) die ($langmessage[5]);
		if(num_rows($result)) {
			$out.="<ul>\n";
			while ($row = fetch_array($result)) {
				$out.="<li><a href=\"".$row['link']."\">".decode($row['name'])."</a><div>".decode($row['descr'])."</div></li>\n";
			}
			$out.="</ul>\n";
		}
	}
	$out.="</div>\n";
	return $out;
}

function lastnews($cat=-1) {
	$quer="SELECT titulo,data,noticia,autor,email,visto,reg,cat FROM noticias";
	if($cat > -1) $quer.=" WHERE cat=".$cat;
	$quer.=" ORDER BY reg DESC LIMIT 0,1";
	$query = dbquery($quer);
	if($row_db = fetch_array($query))
		return show_one_news($row_db['0'],$row_db['1'],$row_db['2'],$row_db['3'],$row_db['4']);
}

// this function shows the news
function shownews($post_integra=1,$post_cabecalho=9,$comenta=0,$categ=-1) {
	global $langmessage, $set, $pagenum;
	if($_GET['action']=="delete" && is_intval($_GET['id'])) {
		dbquery("DELETE FROM comments WHERE id=".$_GET['commentid']);
	}
	if(isset($_GET['id']))
		if(!is_intval($_GET['id'])) die ("#3 - Aha! Clever!");
		else $noticia_numero = $_GET["id"];
	if($noticia_numero!="") {
		$query = "SELECT titulo,data,noticia,autor,email,visto, reg FROM noticias WHERE reg=".$noticia_numero;
		if($categ>-1) $query.= " AND cat=".$categ;
	} else {
		$query = "SELECT titulo,data,noticia,autor,email,visto, reg FROM noticias";
		if($categ>-1) $query.= " WHERE cat=".$categ;
		$query.= " ORDER BY reg DESC LIMIT 0, ".$post_integra;
	}
	$row=dbquery($query);
	$first=false;
	while($row_db = fetch_array($row)) {
		$out.=show_one_news($row_db['titulo'],$row_db['data'],$row_db['noticia'],$row_db['autor'],$row_db['email']);
		//check if there are comments on this news
		$res=dbquery("SELECT * FROM comments WHERE newsid=".$row_db['reg']." ORDER BY time DESC");
		$num=num_rows($res);
		if($_GET['showcomments']=="1") {
		//show the comments
			$ff=true;
			$i=0;
			while($row1= fetch_array($res)) {
				if($ff) {
					$out.="<div class=\"LNEnews_comments\">".$langmessage[143].":</div>";
					$ff=false;
				}
				$out.="<div class=\"LNEnews_comment\">\n";
				$out.="<span class=\"time\">".$langmessage[112]." ".data_formatada($row1['time'])."</span>";
				$out.="<span class=\"text\">".decode($row1['text'])."</span>";
				$out.="<span class=\"poster\">$langmessage[144]: </span>\n";
				$out.="<span class=\"author\">".stripslashes(decode($row1['poster']))."</span>";
				if($row1['postermail']!="")
					$out.="<span class=\"email\"><a href=\"mailto:".decode($row1['postermail'])."\">".decode($row1['postermail'])."</a></span>";
				if($_SESSION['adminlevel']>3) {
					$out.="\n<form method=\"post\" action=\"\" >\n";
					$out.="<input type=\"hidden\" name=\"newsid\" value=\"".$row1['newsid']."\" />\n";
					$out.="<input type=\"hidden\" name=\"id\" value=\"".$row1['id']."\" />\n";
					$out.="<input type=\"image\" name=\"submit\" src=\"images/editdelete.png\" value=\"deletecomment\" title=\"$langmessage[174]\" style=\"border: none; background: transparent;\"/>\n";
					$out.="</form>\n";
				}
				$out.="</div>\n";
				unset($_GET['showcomments']);
			}
		} else {
			if($num) {
				$out.="<a href=\"".$_SERVER['SCRIPT_NAME']."?page=".$pagenum."&amp;id=".$row_db['reg']."&amp;showcomments=1\">". $langmessage[143].": ".$num."</a><br />\n";
			}
		}
		$out.="\n<br />";
		if(!$first && ($comenta==2 || ($comenta==1 && $_SESSION['user']!=""))) $out.=commentform($row_db[6]);
		$first=true;
		$novo_visto = $row_db[5] + 1;
		$query_add = dbquery("UPDATE noticias SET visto = $novo_visto WHERE reg = ". $row_db[6]);
	}
	$post_cabecalho_s = $post_cabecalho + $post_integra;
	if($noticia_numero!="") {
		$query = "SELECT titulo, reg ,data, visto FROM noticias WHERE reg != ".$noticia_numero;
		if($categ>-1) $query.= " AND cat=".$categ;
		$query.= " ORDER BY reg DESC LIMIT 0, ".$post_cabecalho_s;
	} else {
		$query = "SELECT titulo, reg ,data, visto FROM noticias";
		if($categ>-1) $query.= " WHERE cat=".$categ;
		$query.=" ORDER BY reg DESC LIMIT $post_integra, ".$post_cabecalho_s;
	}
	$query=dbquery($query);
	$GETarray = $_GET;
	$first=true;
	while ($row_db = fetch_array($query)) {
		if($first) {
			$first=false;
			$out.="<div align=\"center\"><span style=\"font-size: 85%; font-weight: bold;\">$langmessage[113]</span></div>";
			$out.="<table border='0' align='center'><tr><td>$langmessage[12]</td><td>$langmessage[114]</td><td>$langmessage[115]</td></tr>";
		}
		$GETarray['id'] = $row_db[1];
		$GETarray['showcomments']="0";
		$call = $_SERVER['SCRIPT_NAME'] . "?" . http_build_query($GETarray,'','&amp;');
		$out.="<tr><td><a href=\"".$call."\">".stripslashes(decode($row_db["0"]))."</a></td><td>".data_formatada($row_db["2"])."</td><td>".$row_db["3"]."</td></tr>";
	}
	if(!$first) $out.="</table>";
	$out.="<span class=\"rss\">".showrss()."</span>\n";
	return $out;
}

function show_one_news($a,$b,$c,$d,$e) {
	global $langmessage, $set;
	$out="<div class=\"LNEnews\"><h2 class=\"LNEnews_title\" >".decode($a)."</h2>\n";
	$out.="<p class=\"LNEnews_date\">$langmessage[112] ".data_formatada($b)."</p>\n";
	$out.="<span class=\"LNEnews_text\">".stripslashes(decode($c))."</span>\n";
	$out.="<span class=\"LNEnews_author\">$langmessage[16]: ".stripslashes(decode($d))."</span>\n";
	if($e!="") $out.="<span class=\"LNEnews_email\">$e</span>\n";
	$out.="</div>\n";
	return $out;
}

function data_formatada($unix_time){
	global $set, $fuso_s;
		return strftime($set['dateformat'], $unix_time + $fuso_s);
}

function youtube($url) {
	$out="\n<object width=\"425\" height=\"355\"><param name=\"movie\" value=\"http://www.youtube.com/";
	$out.=$url;
	$out.='"></param><param name="wmode" value="transparent"></param><embed src="http://www.youtube.com/';
	$out.=$url;
	$out.="\" type=\"application/x-shockwave-flash\" wmode=\"transparent\" width=\"425\" height=\"355\"></embed></object>\n";
	return $out;
}

function googlev($url) {
	$out="\n<embed style=\"width:400px; height:326px;\" id=\"VideoPlayback\" type=\"application/x-shockwave-flash\" src=\"http://video.google.com/googleplayer.swf?docId=";
	$out.=$url;
	$out.="\" flashvars=\"\"></embed>\n";
	return $out;
}

function mp3($url) {
	$out="\n<object type=\"application/x-shockwave-flash\" data=\"js/dewplayer.swf?son=";
	$out.=$url;
	$out.='" width="200" height="20"> <param name="movie" value="js/dewplayer.swf?son=';
	$out.=$url;
	$out.="\" /></object>\n";
	return $out;
}

function showsitemap($langmessage,$gen) {
	$out="<h2>$langmessage[88]</h2>\n<br />\n";
	$out.="<ul>".fullmenu($gen)."</ul>\n";
	return $out;
}

function treemenu($generat=0) {
	global $pagenum, $menu, $selected, $extension, $set;
	$count=0;
	$out="\n";
	$intend=0;
	while($menu[$count][0] != "") {
		if(strpos($menu[$count][3], "_") === false) {
		if($menu[$count][2]=="0" && $intend==2) {
			$intend--;
			$out.="</ul>\n";
		}
		if($menu[$count][1]=="0" && $intend==1) {
			$intend--;
			$out.="</ul>\n";
		}
		if($menu[$count][1]!="0" && $intend<1) {
			$intend=1;
			$out.="<ul>\n";
		}
		if($menu[$count][2]!="0" && $intend<2) {
			$intend=2;
			$out.="<ul>\n";
		}
		$out.="<li class=\"LNE_menu\"><a ";
		if($menu[$count][4]==$selected['name'])
			$out.= 'class="selected" ';
		if(strpos($menu[$count][3],"*"))
			$out.='href="'.str_replace("*", "",$menu[$count][3]).'">';
		elseif($generat)
			$out.='href="'.$menu[$count][3].".".$set['extension'].'">';
		else
			$out.='href="'.$set['indexfile'].'?page='.$menu[$count][3].'">';
		$out.=$menu[$count][4]."</a></li>\n";
		}
		$count++;
	}
	return $out;
}

function expmenu($generat) {
	global $pagenum,$menu,$selected,$set;
	$count=0;
	$aa="\n";
	while($menu[$count][0] != "") {
		if(($menu[$count][1]=="0" && $menu[$count][2]=="0" || $menu[$count][0]==$selected['index']) &&	strpos($menu[$count][3], "_") === false) {
			$aa.='<li';
			if($menu[$count][2]!="0") $aa.=" class=\"LNE_menu_doubleintend\"";
			elseif($menu[$count][1]!="0") $aa.=" class=\"LNE_menu_intend\"";
			else $aa.=" class=\"LNE_menu\"";
			$aa.="><a ";
			if($menu[$count][4]==$selected['name']) $aa.='class="selected" ';
			if(strpos($menu[$count][3],"*")) $aa.='href="'.str_replace("*", "",$menu[$count][3]).'">';
			else
				if($generat) $aa.='href="'.$menu[$count][3].".".$set['extension'].'">';
				else $aa.='href="'.$set['indexfile'].'?page='.$menu[$count][3].'">';
			$aa.=$menu[$count][4]."</a></li>\n";
		}
		$count++;
	}
	return $aa;
}

function mainmenu($generat, $span=0) {
	global $pagenum,$menu,$selected,$set;
	$aa="\n";
	$count=0;
	$first=true;
	while($menu[$count][0] != "") {
		if($menu[$count][1]=="0" && $menu[$count][2]=="0" && strpos($menu[$count][3],"#") === false) {
			$aa.='<li';
			if($first) {
				$first=false;
				$aa.=' class="first"';
			}
			$aa.='>';
			if($span==3) $aa.="<span>";
			$aa.='<a ';
			if($menu[$count][0]==$selected['index'])
				$aa.='class="selected" ';
			if(strpos($menu[$count][3],"*"))
				$aa.='href="'.str_replace("*", "",$menu[$count][3]).'">';
			else
				if($generat)
					$aa.='href="'.$menu[$count][3].".".$set['extension'].'">';
				else
					$aa.='href="'.$set['indexfile'].'?page='.$menu[$count][3].'">';
			if($span==2) $aa.="<span>";
			$aa.=$menu[$count][4];
			if($span==1) $aa.="<span>";
			if($span==2 || $span==1) $aa.="</span>";
			$aa.="</a>";
			if($span==3) $aa.="</span>";
			$aa.="</li>\n";
		}
		$count++;
	}
	return $aa;
}

function submenu($generat) {
	global $pagenum,$menu,$selected, $set;
	$count=0;
	while($menu[$count][0] != "") {
		if($menu[$count][3]==$pagenum) {
			$m1=$menu[$count][0];
			$m2=$menu[$count][1];
			$m3=$menu[$count][2];
			if($m3) $sub=3; else
			if($m2) $sub=2; else $sub=1;
			break;
		}
		$count++;
	}
	$count=0;
	$out="\n";
	while($menu[$count][0] != "") {
		if(strpos($menu[$count][3], "_") === false) {
		if($menu[$count][0]==$m1 && ($menu[$count][1]!="0" || $menu[$count][2]!="0")) {
			if (($sub==1 && $menu[$count][2]==0) || 
				($sub==2 && $menu[$count][0]==$m1 && ($menu[$count][1]==$m2 || $menu[$count][2]=="0")) || 
				($sub==3 && $menu[$count][1]==$m2 && $menu[$count][0]==$m1)) {
				$out.='<li><a ';
				if($menu[$count][4]==$selected['name'])
					$out.='class="selected" ';
				if(strpos($menu[$count][3],"*"))
					$out.='><a href="'.str_replace("*", "",$menu[$count][3]).'">'.$menu[$count][4]."</a></li>\n";
				else
					if($generat)
						$out.='href="'.$menu[$count][3].".".$set['extension'].'">'.$menu[$count][4]."</a></li>\n";
					else
						$out.='href="'.$set['indexfile'].'?page='.$menu[$count][3].'">'.$menu[$count][4]."</a></li>\n";
			}
		}
		}
		$count++;
	}
	return $out;
}

function fullmenu($generat=0) {
       global $pagenum, $menu, $selected, $extension, $set;
       $count=0;
       $out="\n";
       while($menu[$count][0] != "") {
// Bugfix by Jochen Wendel
               if(strpos($menu[$count][3],"#") === false && $menu[$count][0] != "0") {
               $out.='<li';
               if($menu[$count][2]!="0")
                       $out.=" class=\"LNE_menu_doubleintend\"";
               elseif($menu[$count][1]!="0")
                       $out.=" class=\"LNE_menu_intend\"";
               else
                       $out.=" class=\"LNE_menu\"";
               $out.="><a ";
               if($menu[$count][4]==$selected['name'])
                       $out.= 'class="selected" ';
               if(strpos($menu[$count][3],"*"))
                       $out.='href="'.str_replace("*", "",$menu[$count][3]).'">';
               elseif($generat)
                       $out.='href="'.$menu[$count][3].".".$set['extension'].'">';
               else
                       $out.='href="'.$set['indexfile'].'?page='.$menu[$count][3].'">';
               $out.=$menu[$count][4]."</a></li>\n";
               }
               $count++;
       }
       return $out;
}

function contact() {
	global $pagenum, $langmessage;
	$out="<div id=\"LNE_contact\">\n<form method=\"post\" action=\"\"><fieldset class=\"noborder\" >\n<table>\n";
	if($_SESSION['user']!="") {
		$out.="<input type=\"hidden\" name=\"name\" value=\"".$_SESSION['user']."\" />\n";
		$out.="<input type=\"hidden\" name=\"email\" value=\"\" />\n";
	} else {
		$out.="<tr><td align=\"right\">$langmessage[30]:</td>\n";
		$out.="<td><input  type=\"text\" name=\"name\" value=\"\" /></td></tr>\n";
		$out.="<tr><td align=\"right\">$langmessage[31]:</td>\n";
		$out.="<td><input  type=\"text\" name=\"email\" value=\"\" /></td></tr>\n";
	}
	$out.="<tr><td align=\"right\" valign=\"top\">$langmessage[32]:</td>\n";
	$out.="<td><textarea name=\"text\" rows=\"8\" style=\"width: 250px;\"></textarea></td></tr>\n";
	if($_SESSION['user']!="") {
		srand((double) microtime() * 1000000);
		$a = rand(1, 9);
		$b = rand(1, 9);
		$c=$a*$b;
		$_SESSION['operation']=$c;
		$out.="<input type=\"hidden\" name=\"secCode\" value=\"$c\" />\n";
	} else {
		$out.="<tr><td align=\"right\"><b>$langmessage[99]:&nbsp;</b></td>\n";
//text catchpa - use this is your server doesn't display the catchpa image correctly
		srand((double) microtime() * 1000000);
		$a = rand(0, 9);
		$b = rand(0, 9);
		$c=$a+$b;
		$out.="<td>$a + $b = ";
		$_SESSION['operation'] = $c;
		$out.="<input type=\"text\" name=\"secCode\" maxlength=\"2\" style=\"width:20px\" /></td></tr>\n";
// end of text catchpa
// original catchpa
//		$out.="<td><input type=\"text\" name=\"secCode\" maxlength=\"6\" style=\"width:50px\" />\n";
//		$out.=" <b>&laquo;</b>";
//		$out.="<img src=\"./LightNEasy/seccode.php\" width=\"71\" height=\"21\" align=\"absmiddle\" />";
//		$out.="</td></tr>\n";
// end of original catchpa
	}
	$out.="<tr><td>&nbsp;<input  type=\"hidden\" name=\"page\" value=\"$pagenum\" /></td>\n<td>";
	$out.="<input type=\"hidden\" name=\"submit\" value=\"Send message\" />";
	$out.="<input type=\"submit\" name=\"aa\" value=\"$langmessage[33]\" />";
	$out.="</td></tr>\n</table></fieldset></form></div>\n";
	return $out;
}

function commentform($newsid) {
	global $langmessage,$editar;
	$out="<form action=\"\" method=\"post\"><fieldset class=\"noborder\">\n";
	$out.="<table class=\"noborder\" style=\" width: 280px; align: center;\" cellpadding=\"4\">\n";
	if($_SESSION['user']!="") {
		$out.="<input type=\"hidden\" name=\"commentname\" value=\"".$_SESSION['user']."\" />\n";
		$out.="<input type=\"hidden\" name=\"commentemail\" value=\"".$_SESSION['email']."\" />\n";
	} else {
		$out.="<tr><td align=\"right\"><b>$langmessage[30]:&nbsp;</b></td>\n";
		$out.="<td><input type=\"text\" name=\"commentname\" style=\"width:250px\" value=\"";
		if($editar) $out.=$_POST['commentname'];
		$out.="\" /></td></tr>\n";
		$out.="<tr><td align=\"right\"><b>$langmessage[31]:&nbsp;</b></td>\n";
		$out.="<td><input type=\"text\" name=\"commentemail\" style=\"width:250px\" value=\"";
		if($editar) $out.=$_POST['commentemail'];
		$out.="\"></td></tr>\n";
	}
	$out.="<tr valign=top><td align=\"right\"><b>$langmessage[138]:&nbsp;</b></td>\n";
	$out.="<td><textarea name=\"commentmessage\" style=\"width:250px; height:80px\">";
	if($editar) $out.=$_POST['commentmessage'];
	$out.="</textarea></td>\n";
	if($_SESSION['user']!="") {
		srand((double) microtime() * 1000000);
		$a = rand(1, 9);
		$b = rand(1, 9);
		$c=$a*$b;
		$_SESSION['operation']=$c;
		$out.="<input type=\"hidden\" name=\"secCode\" value=\"$c\" />\n";
	} else {
		$out.="</tr><tr><td align=\"right\"><b>$langmessage[99]:&nbsp;</b></td>\n";
		$out.="<td><input type=\"text\" name=\"secCode\" maxlength=\"6\" style=\"width:50px\">\n";
		$out.=" <b>&laquo;</b><img src=\"LightNEasy/seccode.php\" width=\"71\" height=\"21\" align=\"absmiddle\"></td></tr>\n";
	}
	$out.="<tr><td><input type=\"hidden\" name=\"submit\" value=\"sendcomment\" /><br />&nbsp;";
	$out.="<input type=\"hidden\" name=\"newsid\" value=\"$newsid\" /></td><td>";
	$out.="<input type=\"submit\" value=\"$langmessage[137]\" />\n</td></tr>\n</table>\n</fieldset></form><br />\n";
	return $out;
}

function sendmessage() {
	global $set, $langmessage;
	if(!is_intval(trim($_POST['secCode'])) || !is_intval($_SESSION['operation'])) die ("#9 - aha! Clever!");
	if($_POST['secCode'] != $_SESSION['operation']) {
		$message=$langmessage[139];
	} else {
		if(isset($_POST['text'])) {
			$message=$langmessage[26];
			if($_POST['text']!="" && $_POST['name']!="") {
				mb_language("uni");
				mb_internal_encoding("UTF-8");
				$text=htmlspecialchars(stripslashes($_POST['text']));
				$name=htmlspecialchars(stripslashes($_POST['name']));
				$email=htmlspecialchars(stripslashes($_POST['email']));
				$header="From: ".$set['admin']." ".$set['wemail']."\r\n";
				$to=$set['email']."\r\n";
				if(!mb_send_mail($to,$langmessage[27].$set['admin'],$langmessage[27].$name." at ".$email.":\r\n".$text,$header)) $message=$langmessage[28];
   		} else
				$message=$langmessage[29];
		} else
			$message=$langmessage[29];
	}
	return $message;
}

function sendcomment() {
	global $sqldbdb, $langmessage, $editar, $MySQL;
	if(!is_intval(trim($_POST['newsid'])) || !is_intval(trim($_POST['secCode'])) || !is_intval($_SESSION['operation'])) die ("#1 - aha! Clever!");
	$editar=true;
	if($_POST['commentname']=="" || $_POST['commentmessage']=="")
		$message=$langmessage[101];
	else {
		if($_POST['secCode'] != $_SESSION['operation'])
			$message=$langmessage[139];
		else {
			$order   = array("\r\n", "\n", "\r");
			$_POST['commentmessage'] = str_replace($order, "<br />", $_POST['commentmessage']);
			$query="INSERT INTO comments (newsid, poster, postermail, time, text) VALUES (".$_POST['newsid'].",\" ".encode($_POST['commentname'])."\", \"".encode($_POST['commentemail'])."\", ".time().", \"".encode(stripslashes($_POST['commentmessage']))."\")";
			dbquery($query);
			$registos = db_changes($sqldbdb);
			if ($registos == 1) {
				$message=$langmessage[141];
				$editar=false;
			} else
				$message=$langmessage[142];
		}
	}
	unset($_GET['do']);
	return $message;
}

function senddownload() {
	global $langmessage;
	if(!is_intval($_GET['dlid'])) die ("#2 - Aha! Clever!");
	$result=dbquery("SELECT * FROM downloads WHERE reg=".$_GET['dlid']);
	$row = fetch_array($result);
	if(strpos($row[2],"*")) $filename = str_replace("*", "",$row[2]);
	else $filename="downloads/".decode($row[2]);
	if(!file_exists($filename)) die ($langmessage[109]);
	$size = filesize("$filename");
	$ext = explode (".",$filename);
	if ($ext[1]=="php" || $ext[1]=="html") die ($langmessage[108]);
	header("Content-Type: application/save");
	if ($ext[1]=="doc") header("Content-Type: application/msword");
	if ($ext[1]=="pdf") header("Content-Type: application/pdf");
	if ($ext[1]=="ppt") header("Content-Type: application/ms-powerpoint");
	if ($ext[1]=="xls") header("Content-Type: application/ms-excel");
	if ($ext[1]=="mp3") header("Content-Type: audio/mp3");
	if ($ext[1]=="avi") header("Content-Type: video/avi");
	if ($ext[1]=="mpg") header("Content-Type: video/mpeg");
	header("Content-Length: $size");
	header("Content-Disposition: attachment; filename=$filename"); 
	header("Content-Transfer-Encoding: binary");
	$fp = fopen("$filename", "r");
	fpassthru($fp);
	fclose($fp);
	unset($_GET['dlid']);
	$novo_visto = $row[3] + 1;
	dbquery("UPDATE downloads SET downloads = $novo_visto WHERE reg = ". $row[0]);
	die();
}

function readmenu() {
	global $menu,$pagenum,$selected;
	unset($men);
	$menu=array();
	$result = dbquery("SELECT * FROM menu ORDER BY m1 ASC, m2 ASC, m3 ASC");
	$count=0;
	while($men=fetch_array($result)) {
		$result1 = dbquery("SELECT * FROM paginas WHERE page=\"".$men[3]."\"");
		$row1=fetch_array($result1);
		$men[4]=decode($men[4]);
		if(intval($_SESSION['adminlevel'])>=$row1['restricted']) {
			$menu[$count]=$men;
			if($menu[$count][3]==$pagenum) {
				$selected['index']=$menu[$count][0];
				$selected['m2']=$menu[$count][1];
				$selected['m3']=$menu[$count][2];
				$selected['link']=$menu[$count][3];
				$selected['name']=$menu[$count][4];
				$selected['description']=decode($row1['extra']);
				$selected['template']=$row1['template'];
			}
			$count++;
		}
	}
}

function readsetup() {
	global $set, $fuso_s;
	$query="SELECT * FROM settings";
	if(!$result=dbquery($query)) die ("Error - Could not read the settings");
	$set=fetch_array($result);
	$set['title']=decode($set['title']);
	$set['subtitle']=decode($set['subtitle']);
	$set['keywords']=decode($set['keywords']);
	$set['description']=decode($set['description']);
	$set['author']=decode($set['author']);
	$set['footer']=decode($set['footer']);
	$fuso_s = $set['timeoffset'] * 3600;
}

function is_intval($value) {
     return 1 === preg_match('/^[+-]?[0-9]+$/', $value);
}

function encode($string) {
	return utf8_encode(htmlentities($string));
}

function decode($string) {
	return html_entity_decode(utf8_decode(stripslashes($string)));
}

function db_changes() {
	global $MySQL, $sqldbdb;
	if($MySQL==1) {
		return mysql_affected_rows($sqldbdb);
	} elseif($MySQL==0) {
		return sqlite_changes($sqldbdb);
	} else {
		return $sqldbdb->changes();
	}
}

function num_rows($result) {
	global $MySQL;
	if($MySQL==1) {
		return mysql_num_rows($result);
	} elseif($MySQL==0) {
		return sqlite_num_rows($result);
	} else {
		for($i = 0; fetch_array($result); $i++);
		$result->reset();
		return $i;
	}
}

function fetch_all($result) {
	for($i = 0; $array[$i] = fetch_array($result); $i++);
	array_pop($array);
	return $array;
}

function fetch_array($result) {
	global $MySQL;
	if($MySQL==1) {
		return mysql_fetch_array($result);
	} elseif($MySQL==0) {
		return sqlite_fetch_array($result);
	} else {
		return $result->fetchArray();
	}
}

function opendb() {
	global $MySQL;
	require_once "./data/database.php";
	if($MySQL==1) {
		$a = @mysql_connect($databasehost, $databaselogin, $databasepassword) or die("Error - Could not connect to MySQL server: " . mysql_error());
		@mysql_select_db($databasename) or die("Error - Could not open database " . mysql_error());
	} elseif($MySQL==0) {
		if(!$a = @sqlite_open("./data/$databasename.db")) die ("Error - Could not open database");
	} else {
		if(!$a= new SQLite3("./data/$databasename.db")) die ("Couldn't open SQLite 3 database");
	}
	return $a;
}

function dbquery($query) {
	global $sqldbdb, $MySQL;
	if($MySQL) {
		$result = @mysql_query($query,$sqldbdb) or die($query." ".mysql_error());
		return $result;
	} elseif($MySQL==0) {
		$result = @sqlite_query($sqldbdb,$query);
		if (!$result) {
			print $query.sqlite_error_string(sqlite_last_error($sqldbdb));
			return false;
		} else return $result;
	} else {
		$result = $sqldbdb->query($query);
		if (!$result) {
			echo $query." ".$sqldbdb->lastErrorMsg();
			return false;
		} else {
			return $result;
		}
	}
}

//replacement for PHP5 function http_build_query() if that function doesn't exist
//taken from the PHP online manual
if(!function_exists('http_build_query')) {
    function http_build_query($data,$prefix=null,$sep='',$key='') {
        $ret    = array();
            foreach((array)$data as $k => $v) {
                $k    = urlencode($k);
                if(is_int($k) && $prefix != null) {
                    $k    = $prefix.$k;
                };
                if(!empty($key)) {
                    $k    = $key."[".$k."]";
                };

                if(is_array($v) || is_object($v)) {
                    array_push($ret,http_build_query($v,"",$sep,$k));
                }
                else {
                    array_push($ret,$k."=".urlencode($v));
                };
            };

        if(empty($sep)) {
            $sep = ini_get("arg_separator.output");
        };

        return    implode($sep, $ret);
    };
};

//for compability with earlier php versions
function sv($s) {
	if (!isset($_SERVER)) {
		global $_SERVER;
		$_SERVER = $GLOBALS['HTTP_SERVER_VARS'];
	}
	if (isset($_SERVER[$s]))return $_SERVER[$s];
	else return'';
}

function sanitize($text) {
	// Convert problematic ascii characters to their true values
	$search = array("40","41","58","65","66","67","68","69","70",
		"71","72","73","74","75","76","77","78","79","80","81",
		"82","83","84","85","86","87","88","89","90","97","98",
		"99","100","101","102","103","104","105","106","107",
		"108","109","110","111","112","113","114","115","116",
		"117","118","119","120","121","122"
		);
	$replace = array("(",")",":","a","b","c","d","e","f","g","h",
		"i","j","k","l","m","n","o","p","q","r","s","t","u",
		"v","w","x","y","z","a","b","c","d","e","f","g","h",
		"i","j","k","l","m","n","o","p","q","r","s","t","u",
		"v","w","x","y","z"
		);
	$entities = count($search);
	for ($i=0;$i < $entities;$i++) $text = preg_replace("#(&\#)(0*".$search[$i]."+);*#si", $replace[$i], $text);
	// the following is based on code from bitflux (http://blog.bitflux.ch/wiki/)
	// Kill hexadecimal characters completely
	$text = preg_replace('#(&\#x)([0-9A-F]+);*#si', "", $text);
	// remove any attribute starting with "on" or xmlns
	$text = preg_replace('#(<[^>]+[\\"\'\s])(onmouseover|onmousedown|onmouseup|onmouseout|onmousemove|onclick|ondblclick|onload|xmlns)[^>]*>#iU', ">", $text);
	do {
		$oldtext = $text;
		preg_replace('#</*(applet|meta|xml|blink|link|style|script|embed|object|iframe|frame|frameset|ilayer|layer|bgsound|title|base)[^>]*>#i', "", $text);
	// remove javascript: and vbscript: protocol
	} while ($oldtext != $text);
	$text = preg_replace('#([a-z]*)=([\`\'\"]*)script:#iU', '$1=$2nojscript...', $text);
	$text = preg_replace('#([a-z]*)=([\`\'\"]*)javascript:#iU', '$1=$2nojavascript...', $text);
	$text = preg_replace('#([a-z]*)=([\'\"]*)vbscript:#iU', '$1=$2novbscript...', $text);
	$text = preg_replace('#(<[^>]+)style=([\`\'\"]*).*expression\([^>]*>#iU', "$1>", $text);
	$text = preg_replace('#(<[^>]+)style=([\`\'\"]*).*behaviour\([^>]*>#iU', "$1>", $text);
	return $text;
}

function clean($string) {
	return trim(str_replace('&nbsp;',' ',$string));
}

Function filelist($pattern, $start_dir='.', $dir=0) {
$filenames=array();
if ($handle = opendir($start_dir)) {
	while (false !== ($file = readdir($handle))) {
		if (strcmp($file, '.')==0 || strcmp($file, '..')==0) continue;
		if($dir) {
			if(is_dir($start_dir."/".$file))
				array_push($filenames, $file);
		} else
			array_push($filenames, $file);
	}
	closedir($handle);
}
//$order=-1;
$filesort = create_function('$a,$b', "\$a1=\$a$sortby;\$b1=\$b$sortby; if (\$a1==\$b1) return 0; else return (\$a1<\$b1) ? -1 : 1;");
uasort($filenames, $filesort);
return $filenames;
}

function createThumb( $pathTofile, $pathToThumbs="thumbs/", $thumbWidth=100 ) {
	$info = pathinfo($pathTofile);
	$fname= $info['basename'];
	if(file_exists($pathToThumbs.$fname))
		return $fname;
	// check for the type of image
	switch ( strtolower($info['extension'])) {
		case "jpg":
			$img = imagecreatefromjpeg( $pathTofile );
			break;
		case "png":
			$img = imagecreatefrompng( $pathTofile );
			break;
		case "gif":
			$img = imagecreatefromgif( $pathTofile );
			break;
		default:
			return;
	}
	$width = imagesx( $img );
	$height = imagesy( $img );
	// calculate thumbnail size
	$new_width = $thumbWidth;
	$new_height = floor( $height * ( $thumbWidth / $width ) );
	// create a new tempopary image
	$tmp_img = imagecreatetruecolor( $new_width, $new_height );
	// copy and resize old image into new image
	imagecopyresized( $tmp_img, $img, 0, 0, 0, 0, $new_width, $new_height, $width, $height );
	// save thumbnail into a file
	switch ( strtolower($info['extension'])) {
		case "jpg":
			imagejpeg( $tmp_img, "{$pathToThumbs}{$fname}" );
			break;
		case "png":
			imagepng( $tmp_img, "{$pathToThumbs}{$fname}" );
			break;
		case "gif":
			imagegif( $tmp_img, "{$pathToThumbs}{$fname}" );
			break;
	}
	imagedestroy($img);
	return $fname;
}

?>