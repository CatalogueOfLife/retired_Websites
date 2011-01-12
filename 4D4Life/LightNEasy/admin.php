<?php
/*---------------------------------------------------+
| LightNEasy Content Management System
| Copyright 2007 - 2008 Fernando Baptista
| http://www.lightneasy.org
+----------------------------------------------------+
| administration module admin.php
| Version 3 SQLite/MySQL
+----------------------------------------------------+
| Released under the terms & conditions of v2 of the
| GNU General Public License. For details refer to
| the included gpl.txt file or visit http://gnu.org
+----------------------------------------------------*/
# This module contains the admin functions
function treat_posts() {
	global $message, $edit, $editextra, $langmessage, $set, $pagenum, $menu, $sqldbdb;

	if(isset($_POST['return'])) {
			unset($_GET['do']);
			unset($_POST['submit']);
			$edit=0;
			$editextra=0;
	}
	switch($_POST['submit']) {
		case "adduser":
			if($_POST['handle']=="") {
				$message="No handle entered";
				break;
			}
			if($_POST['password']=="") {
				$message="No password entered";
				break;
			}
			if($_POST['email']=="") {
				$message="No e-mail entered";
				break;
			}
			if($_POST['password']!=$_POST['repeatpassword']) {
				$message="Passwords don't match";
				break;
			}
			$query='INSERT INTO users (id, handle, password, adminlevel, ip, datejoined, email, firstname, lastname, website, location) VALUES (null, "'.$_POST['handle'].'", "'.sha1($_POST['password']).'", '.$_POST['adminlevel'].', "", '.time().', "'.$_POST['email'].'", "'.$_POST['firstname'].'", "'.$_POST['lastname'].'", "'.$_POST['website'].'", "'.$_POST['location'].'")';
			dbquery($query);
			unset($_GET['action']);
			break;
		case "saveuser":
			$query ="UPDATE users SET ";
			if($_POST['password']!="" && $_POST['password']==$_POST['repeatpassword'])
				$query.="password=\"".sha1($_POST['password'])."\", ";
			else
				$message="Passwords didn't match";
			$query.="handle=\"".$_POST['handle']."\", email=\"".$_POST['email']."\", firstname=\"".$_POST['firstname']."\", lastname=\"".$_POST['lastname']."\", website=\"".$_POST['website']."\", location=\"".$_POST['location']."\", adminlevel=".$_POST['adminlevel']." WHERE id=".$_POST['userid'];
			dbquery($query);
			unset($_GET['action']);
			break;
		case "Save":
			if($_POST['mycontent']!="") {
				dbquery('UPDATE paginas SET content="'.htmlentities($_POST['mycontent']).'", extra="'.encode($_POST['description']).'", template="'.$_POST['template'].'", restricted='.$_POST['restricted'].' WHERE page="'.$_POST['pagenum'].'"');
				unset($_GET['do']);
				$edit=0;
				$message=$langmessage[102];
			}
			break;
		case "Save Extra":
			$id=$_POST['id'];
			$result=dbquery('SELECT content FROM extras WHERE id='.$id);
			if(num_rows($result))
				dbquery('UPDATE extras SET content="'.htmlentities($_POST['mycontent']).'" WHERE id='.$id);
			else
				dbquery('insert into extras (id,content) VALUES (null,"'.htmlentities($_POST['mycontent']).'")');
			unset($_GET['do']);
			$editextra=0;
			$message=$langmessage[103];
			break;
		case "Save Setup":
			$query='UPDATE settings set ';
			if($_POST['password']!="") $query.='password="'.sha1($_POST['password']).'", ';
			if($_POST['restricted']!="") $query.='restricted="'.sha1($_POST['restricted']).'", ';
			$query.='admin="'.$_POST['admin'].'", email="'.$_POST['email'].'", wemail="'.$_POST['wemail'].'", ';
			$query.='homepath="'.$_POST['homepath'].'", template="'.$_POST['template'].
			'", title="'.encode($_POST['title']).'", subtitle="'.encode($_POST['subtitle']).
			'", keywords="'.encode($_POST['keywords']).
			'", description="'.encode($_POST['description']).
			'", author="'.encode($_POST['author']).
			'", footer="'.encode($_POST['footer']).
			'", gzip=0, timeoffset='.$_POST['timeoffset'].
			', dateformat="'.$_POST['dateformat'].
			'", extension="php", indexfile="'.$_POST['indexfile'].
			'", language="'.$_POST['language'].
			'", langeditor="'.$_POST['langeditor'].'"';
			if(!dbquery($query)) die($langmessage[22]);
			unset($_GET['do']);
			readsetup();
			$message=$langmessage[150];
			break;
		case "Add Download":
		case "Edit Download":
			$succeded=false;
			if($_POST['filename']=="upload") { // upload file to folder downloads
				if($_FILES['uploadedfile']['name'] != "") {
					$target_path = "downloads/";
					$target_path .= basename( $_FILES['uploadedfile']['name']);
					if(file_exists($target_path)) unlink($target_path);
					if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
						$succeded=true;
						@chmod($target_path, 0644);
					} else {
						$message=$langmessage[123];
					}
				} else $message=$langmessage[97];
			}
			if(($_POST['nome']!="" && $_POST['file']!="") || $succeded) {
				if($succeded) $filenam=basename( $_FILES['uploadedfile']['name']);
				else $filenam=htmlentities($_POST['file']);
				if($_POST['submit'] == "Add Download") // add download
					$query="INSERT INTO downloads (reg,nome,file,downloads,ex) VALUES (null,\"".encode($_POST['nome'])."\",\"$filenam\", 0, ".$_POST['cat'].")";
				else // edit download
					$query="UPDATE downloads  SET nome=\"".encode($_POST['nome'])."\", file=\"$filenam\", downloads=".$_POST['downloads'].", ex=".$_POST['cat']." WHERE reg=".$_POST['reg'];
				if(!dbquery($query)) die($langmessage[119]);
			}
			unset($_GET['action']);
			break;
		case "Add News":
		case "Edit News":
			$autor = encode($_POST["autor"]);
			$email= encode($_POST["email"]);
			$titulo = encode($_POST["titulo"]);
			$texto = encode($_POST["mycontent"]);
			$cat=$_POST['cat'];
			$data = mktime  ($_POST['hora'], $_POST['minuto'], 0, $_POST['mes'], $_POST['dia'], $_POST['ano'] );
			if($_POST['submit'] == "Add News")
				$query="INSERT INTO noticias (autor, email, titulo, noticia, data, visto, cat) VALUES (\"$autor\", \"$email\", \"$titulo\", \"$texto\", \"$data\",1, \"$cat\")";
			else
				$query="UPDATE noticias SET autor=\"$autor\", email=\"$email\", titulo=\"$titulo\", noticia=\"$texto\", data=\"$data\", cat=\"$cat\" WHERE reg=\"".$_POST['reg']."\"";
			dbquery($query);
			$registos = db_changes($sqldbdb);
			if ($registos == 1) $message=$langmessage[75];
			elseif($_GET['action']=="Add News") $message=$langmessage[76];
			unset($_GET['action']);
			break;
		case "Add Link":
		case "Edit Link":
			if($_POST['link']!="" && $_POST['linkname']!="") {
				if($_POST['submit'] == "Add Link")
					$query="INSERT INTO links (id, link, name, descr, hits) VALUES (null, \"".
					htmlentities($_POST['link'])."\", \"".encode($_POST['linkname']).
					"\", \"".encode($_POST['descr'])."\", ".$_POST['cat'].")";
				else
					$query="UPDATE links SET link=\"".htmlentities($_POST['link']).
					"\", name=\"".encode($_POST['linkname'])."\", descr=\"".encode($_POST['descr']).
					"\", hits=".$_POST['cat']." WHERE id=".$_POST['id'];
				if(!dbquery($query)) die($langmessage[132]);
				unset($_GET['action']);
			}
			break;
		case "Edit Menu Entry":
			$query='UPDATE menu SET m1='.$_POST['m1'].', m2='.$_POST['m2'].', m3='.$_POST['m3'].', page="'.$_POST['m4'].'", nome="'.encode($_POST['m5']).'" WHERE page="'.$_POST['oldm4'].'"';
			dbquery($query);
			unset($_GET['action']);
			readmenu();
			break;
		case "Delete Menu Entry":
			dbquery("DELETE FROM menu WHERE page=\"".$_POST['oldm4']."\"");
			unset($_GET['action']);
			readmenu();
			break;
		case "Query Database":
			dbquery(stripslashes($_POST['query']));
			$message=$langmessage[46];
			unset($_GET['do']);
			break;
		case "Create Gallery":
			if(!is_dir("galeries/".$_POST['galeryname'])) {
				mkdir("galeries/".$_POST['galeryname'], 0777)
					or die ($langmessage[63]);
				$message=$langmessage[64];
			} else $message=$langmessage[65];
			break;
		case "Upload image":
			$message="";
			if($_FILES['uploadedfile']['name'] != "" && $_POST['gal']!="") {
				$target_path = "galeries/".$_POST['gal']."/";
				$target_path = $target_path.basename( $_FILES['uploadedfile']['name']);
			} else $message=$langmessage[97];
			if($message=="") {
				if(file_exists($target_path)) unlink($target_path);
				if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
					@chmod($target_path, 0644);
    				$message=$langmessage[124].basename( $_FILES['uploadedfile']['name']).$langmessage[125];
				} else $message=$langmessage[123];
			}
			unset($_GET['do']);
			break;
		case "Delete Page":
			dbquery('DELETE FROM menu WHERE page="'.$_POST['pagenum'].'"');
			dbquery('DELETE FROM paginas WHERE page="'.$_POST['pagenum'].'"');
			unset($_GET['do']);
			$pagenum="index";
			$message=$langmessage[104];
			readmenu();
			break;
		case "Create Page":
			if($_POST['filename']=="" || $_POST['label']=="")
				$message=$langmessage[97];
			else {
				$count=0;
				while($menu[$count][3]!="") {
					if($menu[$count][3]==$_POST['count']) break;
					$count++;
				}
				if(!strval(strstr($_POST['filename'], "*")))
					$create=1;
				else
					$create=0;
				$label=encode($_POST['label']);
				$filename1=sanitize(trim($_POST['filename']));
				$filename=str_replace("_", "", $filename1);
				$descr=encode($_POST['description']);
				$templat=sanitize($_POST['template']);
				$restricted=$_POST['restricted'];
				switch($_POST['level']) {
					case "1": {
						$bb=strval($menu[$count][0])+1;
						$query="UPDATE menu SET m1=m1+1 WHERE m1>=".$bb;
						dbquery($query);
						$query="INSERT INTO menu (m1,m2,m3, page, nome) VALUES (".$bb.",0,0,\"".$filename1."\",\"".$label."\")";
						dbquery($query);
						if($create) addpage ($bb,0,0,$filename,$label,$descr,$templat,$restricted);
						break;
					}
					case "2": {
						$bb=strval($menu[$count][1])+1;
						$query="UPDATE menu SET m2=m2+1 WHERE m1=".$menu[$count][0]." AND m2>=".$bb;
						dbquery($query);
						$query="INSERT INTO menu (m1,m2,m3, page, nome) VALUES (".$menu[$count][0].",".$bb.",0,\"".$filename1."\",\"".$label."\")";
						dbquery($query);
						if($create) addpage ($menu[$count][0],$bb,0,$filename,$label,$descr,$templat,$restricted);
						break;
					}
					case "3": {
						$bb=strval($menu[$count][2])+1;
						$query="UPDATE menu SET m3=m3+1 WHERE m1=".$menu[$count][0]." AND m2=".$menu[$count][2]." AND m3>=$bb";
						dbquery($query);
						$query="INSERT INTO menu (m1,m2,m3, page, nome) VALUES (".$menu[$count][0].",".$menu[$count][1].",".$bb.",\"".$filename1."\",\"".$label."\")";
						dbquery($query);
						if($create) addpage ($menu[$count][0],$menu[$count][1],$bb,$filename,$label,$descr,$templat,$restricted);
						break;
					}
				}
				$message=$langmessage[87];
				$pagenum="index";
				readmenu();
			}
			break;
		default:
	}

	if($_POST['downloadcat']=="Add Category" || $_POST['downloadcat']=="Edit Category") {
	// add category, edit category
		if($_POST['downloadcat']=="Add Category")
			$query="INSERT INTO downloadscat (id, nome, descr) VALUES (null, '".encode($_POST['name'])."', '".encode($_POST['descr'])."')";
		else
			$query="UPDATE downloadscat SET nome=\"".encode($_POST['name'])."\", descr=\"".encode($_POST['descr'])."\" WHERE id=".$_POST['id'];
		if (!dbquery($query)) die($langmessage[105]);
	}

	if($_POST['linkcat']=="Add Category" || $_POST['linkcat']=="Edit Category") { // add category - edit category
		if($_POST['linkcat']=="Add Category")
			$query="INSERT INTO linkscat (id, nome, descr) VALUES (null, '".encode($_POST['name'])."', '".encode($_POST['descr'])."')";
		else
			$query="UPDATE linkscat SET nome=\"".encode($_POST['name'])."\", descr=\"".encode($_POST['descr'])."\" WHERE id=".$_POST['id'];
		if (!dbquery($query)) die($langmessage[106]);
	}

	if($_POST['newscat']=="Add Category" || $_POST['newscat']=="Edit Category") {
		if($_POST['newscat']=="Add Category")
			$query="INSERT INTO newscat (id, nome, descr) VALUES (null, '".encode($_POST['name'])."', '".encode($_POST['descr'])."')";
		else
			$query="UPDATE newscat SET id=".$_POST['id'].", nome='".encode($_POST['name'])."', descr='".encode($_POST['descr'])."' WHERE id=".$_POST['newid'];
		if(!dbquery($query)) die ($langmessage[107]);
		unset ($_GET['action']);
	}

	switch($_GET['do']) {
		case "edit":
			if($_SESSION[$set['password']]=="1") $edit=1;
			else {
				$edit=0;
				unset($_GET['do']);
			}
			break;
		case "editextra":
			if($_SESSION[$set['password']]=="1") $editextra=1;
			else {
		    	$editextra=0;
	    		unset($_GET['do']);
			}
			break;
		default:
	}
}

function addpage($m1,$m2,$m3,$page,$nome,$descr,$templat,$restricted) {
	$query='INSERT INTO paginas (m1,m2,m3,page,nome,content,extra,template,restricted) VALUES ('.$m1.','.$m2.','.$m3.',"'.$page.'","'.$nome.'","'.htmlentities("<h2 class=\"LNE_title\">".$nome."</h2>").'","'.$descr.'","'.$templat.'",'.$restricted.')';
	dbquery($query);
}

function generate() {
	global $edit, $langmessage, $set, $pagenum, $menu, $templatepath, $selected, $LNEversion;
	$edit=0;
	$count=0;
	$go_sm = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<urlset\n\t
      xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\"\n\t
      xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n\t
      xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">\n
	<url>\n
	<loc>http://".sv(SERVER_NAME)."/</loc>\n
	<priority>0.6</priority>\n
	<lastmod>".date('Y-m-d')."</lastmod>\n
	<changefreq>daily</changefreq>\n</url>\n";
	while($menu[$count][0]!="") {
		$result1 = dbquery("SELECT * FROM paginas WHERE page=\"".str_replace("_","",$menu[$count][3])."\"");
		$row1=fetch_array($result1);
		if($row1['template']!="")
			$template1="templates/".$row1['template']."/template.php";
		else
			$template1=$templatepath;
		$out="";
		$pagenum=str_replace("''", "'",$menu[$count][3]);
		$pagenum=str_replace("_","",$pagenum);
		if(!strval(strstr($menu[$count][3], "*"))) {
			$selected['index']=$menu[$count][0];
			$selected['name']=$menu[$count][4];
			if($set['extension']=="php")
				$page="<?php \$pagenum=\"".$pagenum."\"; require_once \"./LightNEasy/runtime.php\"; ?>\n";
			$page.=file_get_contents($template1);
			$go_sm .= "<url>\n
			<loc>http://".sv(SERVER_NAME).dirname(sv(REQUEST_URI)).$menu[$count][3].".".$set['extension']."</loc>\n
			<priority>0.5</priority>\n
			<lastmod>". date('Y-m-d') ."</lastmod>\n
			<changefreq>daily</changefreq>\n
			</url>\n";
			if(!$fp=fopen($pagenum.".".$set['extension'],"w"))
				die($langmessage[110].$menu[$count][3].".".$set['extension']);
			$contnt=html_entity_decode(stripslashes($row1['content']));
			while($page != "") {
				if($pagearray=explode($set['openfield'],$page,2)) {
					$out.=$pagearray[0];
					$page=$pagearray[1];
					if($pagearray=explode($set['closefield'],$page,2)) {
						$command=trim($pagearray[0]);
						$page=$pagearray[1];
						switch($command) {
							case "content": {
								if(strpos($contnt, '%!$galery')!==false || strpos($contnt, '%!$lyteframe')!==false) {
									$out=str_replace("</head>","<link rel=\"stylesheet\" href=\"css/lytebox.css\" type=\"text/css\" media=\"screen\" />\n<script type=\"text/javascript\" src=\"js/lytebox.js\"></script>\n</head>",$out);
								}
								if(strpos($contnt, '%!$plugin')!==false) {
									$one=explode('%!$plugin',$contnt,2);
									$two=explode('$!%',$one[1],2);
									$pluginame="./plugins/".trim($two[0]);
									if(file_exists($pluginame."/header.mod"))
										$out=str_replace("</head>",file_get_contents($pluginame."/header.mod")."\n</head>",$out);
									if(file_exists($pluginame."/onload.mod"))
										$out=str_replace("<body","<body onload=\"".file_get_contents($pluginame."/onload.mod")."\"",$out);
									if(file_exists($pluginame."/first.mod"))
										$out=file_get_contents($pluginame."/first.mod").$out;
								}
								if(strpos($contnt, '%!$wrapper')!==false) {
									$out=str_replace("</head>","<script language=\"JavaScript\">\n<!--\nfunction calcHeight()\n{\n\t//find the height of the internal page\n\tvar the_height=document.getElementById('the_iframe').contentWindow.document.body.scrollHeight+20;\n\t//change the height of the iframe\n\tdocument.getElementById('the_iframe').height=the_height;\n}\n//-->\n</script>\n</head>",$out);
								}
								if(strpos($contnt, '%!$first')!==false) {
									$one=explode('%!$first',$contnt,2);
									$two=explode('$!%',$one[1],2);
									$three=file_get_contents(trim($two[0]))."\n<!DOCTYPE";
									$out=str_replace("<!DOCTYPE",$three,$out);
								}
								if(strpos($contnt, '%!$head')!==false) {
									$one=explode('%!$head',$contnt,2);
									$two=explode('$!%',$one[1],2);
									$three=file_get_contents(trim($two[0]))."\n</head>";
									$out=str_replace("</head>",$three,$out);
								}
								$out.="<?php content(\"".$pagenum."\"); ?>";
								break;
							}
							case "header": {
								$result1 = dbquery("SELECT * FROM paginas WHERE page=\"".$menu[$count][3]."\"");
								$row1=fetch_array($result1);
								$out.=printheader(1,$selected['name'],$row1['extra'],$row1['template']);
								break;
							}
							case "footer":		$out.='<?php print footer(); ?>'; break;
							case "homelink":	$out.='<a href="'.$set['homepath'].'">'.$langmessage[111].'</a>'; break;
							case "image":		$out.="templates/".$set['template']."/images/"; break;
							case "extra":		$out.="<?php print extra(); ?>\n"; break;
							case "login":		$out.="<?php print loginout(); ?>\n"; break;
							case "loginform":	$out.="<?php print loginform(); ?>\n"; break;
							case "mainmenu":	$out.="<?php print mainmenu(1); ?>\n"; break;
							case "mainmenu1":	$out.="<?php print mainmenu(1,1); ?>\n"; break;
							case "mainmenu2":	$out.="<?php print mainmenu(1,2); ?>\n"; break;
							case "mainmenu3":	$out.="<?php print mainmenu(1,3); ?>\n"; break;
							case "treemenu":	$out.="<?php print treemenu(1); ?>\n"; break;
							case "fullmenu":	$out.="<?php print fullmenu(1); ?>\n"; break;
							case "expmenu":	$out.="<?php print expmenu(1); ?>\n"; break;
							case "submenu":	$out.="<?php print submenu(1); ?>\n"; break;
							case "selected":	$out.=$selected['name']; break;
							case "sitemap":	$out.=sitemap(1); break;
							case "news":		$out.="<?php print shownews(); ?>"; break;
							case "lastnews":	$out.='<?php print lastnews(); ?>'; break;
							case "subtitle":	$out.=$set['subtitle']; break;
							case "title":		$out.='<a href="'.$set['homepath'].'">'.$set['title'].'</a>'; break;
							case "downloads":	$out.="<?php print downloads(); ?>"; break;
							case "links":		$out.="<?php print links(); ?>"; break;
							default: {
								if(strpos($command, "lastnews")!== false) {
									$aa=explode(" ",$command,2);
									$out.="<?php print lastnews(".$aa[1]."); ?>";
								} elseif(strpos($command, "extra")!== false) {
									$aa=explode(" ",$command,2);
									$out.="<?php print extra(".$aa[1]."); ?>";
								} elseif(strpos($command, "downloads")!== false) {
									$aa=explode(" ",$command,2);
									$out.="<?php print downloads(".$aa[1]."); ?>";
								} elseif(strpos($command, "links")!== false) {
									$aa=explode(" ",$command,2);
									$out.="<?php print links(".$aa[1]."); ?>";
								} elseif(substr($command,0,4)=="news") {
									$bb=trim(substr($command,4));
									$aa=explode(" ",$bb);
									if($aa[3]!="")			$out.="<?php print shownews($aa[0],$aa[1],$aa[2],$aa[3]); ?>";
									elseif($aa[2]!="")	$out.="<?php print shownews($aa[0],$aa[1],$aa[2]); ?>";
									elseif($aa[1]!="")	$out.="<?php print shownews($aa[0],$aa[1]); ?>";
									else 						$out.="<?php print shownews($aa[0]); ?>";
								} else
									$out.=$command;
							}
						}
					} else break;
				} else break;
			}
			if($page != "") $out.=$page;
			fwrite($fp,$out);
			fclose($fp);
			@chmod($menu[$count][3].".".$extension, 0755);
			if($set['extension'] == "php") {
				if(file_exists($menu[$count][3].".html")) unlink($menu[$count][3].".html");
			} else {
				if($menu[$count][3]!="index") if(file_exists($menu[$count][3].".php")) unlink($menu[$count][3].".php");
			}
		}
		$count++;
	}
	$go_sm .= "</urlset>\n";
	$fp_go = fopen('sitemap.xml', 'w');
	fwrite($fp_go, $go_sm);
	fclose($fp_go);
	unset($_SESSION[$set['password']]);
	setcookie('userpass', "", time() - 60);
	setcookie('userhandle', "", time() - 60);
	session_destroy();
	unset($_GET['do']);
	header("Location: ".$set['homepath']);
}

function printcontent($page) {
	$open="%!$";
	$close="$!%";
	while(strpos($page,$open)) {
		$pagearray=explode($open,$page,2);
		unset($pagearray1);
		$pagearray1=explode($close,$pagearray[1],2);
		if(substr($pagearray1[0],0,7)=="include") $pagearray[0].='<?php include "'.trim(substr($pagearray1[0],7)).'" ?>';
		elseif($pagearray1[0]=="contact") $pagearray[0].=contact();
		else $pagearray[0].="\n".html_entity_decode($pagearray1[0])."\n";
		$page=$pagearray[0].$pagearray1[1];
	}
	return $page;
}

//displays the 3 icons: edit, delete, admin menu
function adminmenu() {
	global $set,$pagenum, $langmessage;
	$aa="";
	if($_SESSION[$set['password']]=="1") {
		$aa.="\n<div id=\"LNE_admin\"><table>\n\t<tr>";
		$aa.="<td><a href=\"".$set['homepath'].$set['indexfile']."?page=".$pagenum."&amp;do=edit\">\n\t";
		$aa.="<img src=\"images/edit.png\" alt=\"edit\" title=\"".$langmessage[152]."\"align=\"left\" border=\"0\" /></a></td>\n\t";
		$aa.="<td><a href=\"".$set['homepath'].$set['indexfile']."?page=".$pagenum."&amp;do=delete\">";
		$aa.="<img src=\"images/editdelete.png\" alt=\"delete\" align=\"left\" title=\"".$langmessage[136]."\" border=\"0\" /></a></td>\n\t";
		$aa.="<td><a href=\"".$set['homepath'].$set['indexfile']."?do=settings\">";
		$aa.="<img src=\"images/tools.png\" alt=\"Settings\" align=\"left\" title=\"".$langmessage[34]."\" border=\"0\" /></a></td>\n\t";
		$aa.="</tr>\n</table></div>\n";
	}
	return $aa;
}

function editpage() {
	global $set, $langmessage, $selected, $pagenum;
	$query='SELECT * FROM paginas WHERE page="'.$pagenum.'"';
	$result = dbquery($query);
	if($row=fetch_array($result)) $out= stripslashes(html_entity_decode($row['content']));
	print "<form method=\"post\" action=\"\">\n<fieldset>\n";
	editor($out);
	print "\n<input  type=\"hidden\" name=\"pagenum\" value=\"".$pagenum."\" />\n";
	print $langmessage[67].": <input style=\"width: 95%\" type=\"text\" name=\"description\" value=\"";
	if($row['extra']!="")
		print decode($row['extra']);
	print "\" />\n";
	print $langmessage[160]." ";
	print "<select name=\"restricted\">";
	print "<option value=\"0\"";
	if($row['restricted']==0 || $row['restricted']==1) print " selected";
	print ">$langmessage[161]</option>";
	print "<option value=\"2\"";
	if($row['restricted']==2 || $row['restricted']==3) print " selected";
	print ">$langmessage[162]</option>";
	print "<option value=\"4\"";
	if($row['restricted']==4 || $row['restricted']==5) print " selected";
	print ">$langmessage[163]</option></select><br />\n";
	print "$langmessage[11]: <select name=\"template\">\n";
	print "<OPTION VALUE=\"\">Default</OPTION>\n";
	$folder="templates";
	$dir=opendir($folder);
	while($file=readdir($dir)) {
		if($file != ".." && $file != "." && is_dir($folder."/".$file)) {
		    print '<OPTION VALUE="'.$file.'"';
		    if(trim($file) == $row['template'] && $row['template']!="") print ' SELECTED';
		    print '>'.$file."&nbsp;</OPTION>\n";
		}
	}
	closedir($dir);
	print "</select>";
	print savereturn("Save");
}

function editor($out) {
	global $set;
	include_once("fckeditor/fckeditor.php") ;
	$oFCKeditor = new FCKeditor('mycontent') ;
	$oFCKeditor->BasePath = "./fckeditor/";
	$oFCKeditor->Height = 400 ;
	$oFCKeditor->Config['AutoDetectLanguage'] = false ;
	$oFCKeditor->Config['DefaultLanguage'] = $set['langeditor'];
//comment out the next line for using the FCK editor default skin
	$oFCKeditor->Config['SkinPath'] = "skins/silver/";
	$oFCKeditor->Value = $out;
	$oFCKeditor->Create() ;
}

function extras() {
	global $langmessage;
	print "<h2 class=\"LNE_title\">$langmessage[36]</h2>\n";
	if($_GET['action']=="delete" && $_GET['id']!="") {
		dbquery("DELETE FROM extras WHERE id=".$_GET['id']);
		$_GET['id']="";
	}
	if($_GET['id']!="") {
		editextra($_GET['id']);
	} else {
		$result=dbquery("SELECT id, content FROM extras");
		if(num_rows($result)>1) {
			$row=fetch_all($result);
			foreach($row as $res) {
				// Print the links to all extras
				print "<table><tr><td><a href='".$_SERVER["SCRIPT_NAME"]."?do=editextra&amp;action=edit&amp;id=".$res['id']."'><img src=\"images/edit.png\" alt=\"edit\" title=\"Edit extra\" style=\"align: left; border: 0;\" /></a></td><td><a href='".$_SERVER["SCRIPT_NAME"]."?do=editextra&amp;action=delete&amp;id=".$res['id']."'><img src=\"images/editdelete.png\" alt=\"delete\" title=\"Delete extra\" style=\"align: left; border: 0;\" /></a></td><td>$langmessage[36] ".$res['id']."</td></tr>\n</table>\n";
			}
		} else {
			$row=fetch_array($result);
			editextra($row['id']);
		}
	}
}

function editextra($id) {
	$result=dbquery("SELECT id, content FROM extras WHERE id=$id");
	$row=fetch_array($result);
	print "<form method=\"post\" action=\"\">\n<fieldset>\n";
	editor(stripslashes(html_entity_decode($row['content'])));
	print savereturn("Save Extra", $id);
}

// Displays the icons for save/return
function savereturn($value, $id=0) {
	global $langmessage;
	$out.="<input type=\"hidden\" name=\"submit\" value=\"$value\" />\n";
	$out.="<table>\n\t";
	if($id) {
		$out.="<tr><td align=\"center\" colspan=\"2\">";
		$out.="<select name=\"id\"><option value=\"$id\">".$langmessage[82]."</option><option value=\"0\">".$langmessage[173]."</option></select>";
		$out.="</td></tr>\n\t";
	}
	$out.="<tr><td valign=\"top\">";
	$out.="<input type=\"image\" name=\"aa\" value=\"\" src=\"images/accept.png\" title=\"".$langmessage[82]."\" style=\"width: 32px; height: 32px; border: none;\" />\n\t</fieldset></form>\n\t";
	$out.="<form style=\"border: none; margin: 0; padding: 0;\" method=\"post\" action=\"\">\n\t<fieldset style=\"border: none; margin: 0; padding: 0; background: transparent;\"></td>\n\t";
	$out.="<td valign=\"top\"><input type=\"hidden\" name=\"return\" value=\"Return\" />\n\t";
	$out.="<input type=\"image\" name=\"aa\" title=\"".$langmessage[153]."\" src=\"images/back.png\" value=\"\" style=\"width: 32px; height: 32px; border: none;\" />\n\t</td>";
	$out.="</tr>\n\t</fieldset>\n\t</form>\n</table>\n";
	return $out;
}

function adminnews() {
	global $noticia_numero, $langmessage, $message;
	switch($_GET['action']) {
	case "deletec":
		$noticia_numero = $_GET['id'];
		$query = dbquery("DELETE FROM newscat WHERE id = $noticia_numero");
		$registros = db_changes();
		if ($registros == 1)
			$message=$langmessage[126];
		else
			$message=$langmessage[127];
		break;
	case "delete":
		$noticia_numero = $_GET['id'];
		$query = dbquery("DELETE FROM noticias WHERE reg = $noticia_numero");
		$registros = db_changes();
		if ($registros == 1)
			$message=$langmessage[128];
		else
			$message=$langmessage[129];
		break;
	case "edit":
		$noticia_numero = $_GET["id"];
		$query = dbquery("SELECT * FROM noticias WHERE reg = '$noticia_numero'");
		$row=fetch_array($query);
		break;
	case "editc":
		$categoria_id = $_GET["id"];
		$query = dbquery("SELECT * FROM newscat WHERE id = '$categoria_id'");
		$row=fetch_array($query);
		break;
	}
	print "<h1>$langmessage[72]</h1>\n";
	print "<div align=\"center\">\n";
	print "<form name=\"adicionar\" method=\"post\" action=\"\">\n<fieldset style=\"border: 0;\">\n<table style=\"border: 0;\">\n";
	print "<tr><td>$langmessage[16]:</td><td>";
	print "<input type='text' name='autor' value=\"";
	if($_GET['action']=="edit") print decode($row[1]);
	print "\" /></td></tr>\n<tr><td>$langmessage[73]:</td><td><input type='text' name='email' value=\"";
	if($_GET['action']=="edit") print decode($row[2]);
	print "\" /></td></tr>\n<tr><td>$langmessage[12]:</td><td><input type='text' name='titulo' value='".decode($row[3])."' /></td></tr>\n";
	print "<tr><td>$langmessage[114]:</td><td>";
	if($_GET['action']=="edit")
		$date=date("YmdGi",$row[5]);
	else
		$date=date("YmdGi");
	$ano=substr($date,0,4);
	$mes=substr($date,4,2);
	$dia=substr($date,6,2);
	$hora=substr($date,8,2);
	$minuto=substr($date,10,2);
	print "<select name=\"ano\">";
	for($i=2000;$i<2020;$i++) {
		print "<option value=\"$i\"";
		if($i==$ano) print " SELECTED";
		print ">$i</option>\n";
	}
	print "</select>\n";
	print "/<select name=\"mes\">";
	for($i=1;$i<13;$i++) {
		print "<option value=\"$i\"";
		if($i==$mes) print " SELECTED";
		print ">$i</option>\n";
	}
	print "</select>\n";
	print "/<select name=\"dia\">";
	for($i=1;$i<32;$i++) {
		print "<option value=\"$i\"";
		if($i==$dia) print " SELECTED";
		print ">$i</option>\n";
	}
	print "</select>\n";
	print " - <select name=\"hora\">";
	for($i=0;$i<24;$i++) {
		print "<option value=\"$i\"";
		if($i==$hora) print " SELECTED";
		print ">$i</option>\n";
	}
	print "</select>\n";
	print ":<select name=\"minuto\">";
	for($i=0;$i<60;$i++) {
		print "<option value=\"$i\"";
		if($i==$minuto) print " SELECTED";
		print ">$i</option>\n";
	}
	print "</select>\n";
	print "</td></tr>\n";
	print "<tr><td>$langmessage[52]:</td><td><select name=\"cat\" >\n";
	$result = dbquery("SELECT * FROM newscat");
	$cats=fetch_all($result);
	foreach ($cats as $catt) {
		print '<option value="'.$catt['id'].'"';
		if($_GET['action']=="edit" && strval($row[7])==strval($catt['id'])) print ' SELECTED';
		print '>'.decode($catt['nome'])."&nbsp;</option>\n";
	}
	print "</select></td></tr>\n";
	print "<tr><td colspan=\"2\" width=\"450\">";
	editor(stripslashes(decode($row[4])));
	print "</td></tr></table>\n";
	if($_GET['action']=="edit") {
		print "<input type='hidden' name='reg' value='".$row[0]."' />";
		print savereturn("Edit News");
	} else
		print savereturn("Add News");
	print "</fieldset></form>\n";
	print "<h2>$langmessage[80]</h2>\n<table>\n";
	$query = dbquery("SELECT titulo, reg ,data,visto FROM noticias ORDER BY reg DESC");
	while ($row_db = fetch_array($query)) {
		print "<tr><td><a href='".$_SERVER["SCRIPT_NAME"]."?do=adminnews&amp;action=edit&amp;id=".$row_db["1"]."'><img src=\"images/edit.png\" alt=\"edit\" title=\"Edit news\" style=\"align: left; border: 0;\" /></a></td><td><a href='".$_SERVER["SCRIPT_NAME"]."?do=adminnews&amp;action=delete&amp;id=".$row_db["1"]."'><img src=\"images/editdelete.png\" alt=\"delete\" title=\"Delete news\" style=\"align: left; border: 0;\" /></a></td><td><b>".decode($row_db["0"])."</b></td><td>".data_formatada($row_db["2"] + $fuso_s)."</td><td>$langmessage[81]: ".$row_db["3"]."</td></tr>\n";
	}
	print "</table>\n";
	print "<br /><h3>$langmessage[78]</h3>\n";
	print "<form name=\"form1\" method=\"post\" action=\"\"><fieldset style=\"border: 0;\">\n<table>\n";
	print "<tr><td>$langmessage[50]</td><td>";
	print "<input type=\"text\" name=\"name\"";
	if($_GET['action']=="editc") print " value=\"".$row[1]."\"";
	print " /></td></tr>\n<tr><td>$langmessage[67]</td><td><input type=\"text\" name=\"descr\"";
	if($_GET['action']=="editc") print " value=\"".$row[2]."\"";
	print " /></td></tr>\n";
	if($_GET['action']=="editc") print "<tr><td>$langmessage[79]</td><td><input type=\"text\" name=\"newid\" value=\"".$row[0]."\" /></td></tr>\n";
	print "<tr><td></td><td><input type=\"hidden\" name=\"id\" value=\"".$_GET['id']."\" />\n";
	print "<input type=\"hidden\" name=\"newscat\" ";
	if($_GET['action']=="editc") print "value=\"Edit Category\"";
	else print "value=\"Add Category\"";
	print " />\n";
	print "<input type=\"submit\" name=\"\" ";
	if($_GET['action']=="editc") print "value=\"$langmessage[54]\"";
	else print "value=\"$langmessage[53]\"";
	print " />\n";
	print "</td></tr>\n</table></fieldset></div></form>\n";
	print "<h2>$langmessage[78]</h2>\n<table>\n";
	$res=dbquery("SELECT * FROM newscat");
	while($roww=fetch_array($res)) {
		print "<tr><td><a href='".$_SERVER["SCRIPT_NAME"]."?do=adminnews&amp;action=editc&amp;id=".$roww["0"]."'><img src=\"images/edit.png\" alt=\"edit\" style=\"align: left; border: 0;\" /></a></td><td><a href='".$_SERVER["SCRIPT_NAME"]."?do=adminnews&amp;action=deletec&amp;id=".$roww["0"]."'><img src=\"images/editdelete.png\" alt=\"delete\" style=\"align: left; border: 0;\" /></a></td><td><b>".decode($roww["1"])."</b></td><td>".decode($roww["2"])."</td><td>Id: ".$roww["0"]."</td></tr>\n";
	}
	print "</table>\n<br />";
}

function editlinks() {
	global $message, $langmessage;
	switch($_GET['action']) {
		case "delete":
			dbquery("DELETE FROM links WHERE id=".$_GET['id']);
			unset($_GET['action']);
			break;
		case "deletec":
			dbquery("DELETE FROM linkscat WHERE id=".$_GET['id']);
			unset($_GET['action']);
			break;
		case "editc":
			$result = dbquery("SELECT * FROM linkscat WHERE id=".$_GET['id']);
			$row=fetch_array($result);
	}
	$out.="<h2>$langmessage[40]</h2>\n<div align=\"center\">\n<h3>$langmessage[66]</h3>\n";
	$out.="<form method=\"post\" action=\"\"><fieldset style=\"border: 0;\"><table>\n";
	$out.="<tr><td>$langmessage[50]</td><td><input type=\"text\" name=\"name\"";
	if($_GET['action']=="editc") $out.=" value=\"".decode($row[1])."\"";
	$out.=" /></td></tr>\n";
	$out.="<tr><td>$langmessage[67]</td><td><input type=\"text\" name=\"descr\"";
	if($_GET['action']=="editc") $out.=" value=\"".decode($row[2])."\"";
	$out.=" /></td></tr>\n<tr><td>";
	if($_GET['action']=="editc") $out.="<input type=\"hidden\" name=\"id\" value=".$row[0]." />";
	$out.="</td>\n<td>";
	$out.="<input type=\"hidden\" name=\"linkcat\" ";
	if($_GET['action']=="editc") $out.="value=\"Edit Category\"";
	else $out.="value=\"Add Category\"";
	$out.=" />\n";
	$out.="<input type=\"submit\" name=\"\" ";
	if($_GET['action']=="editc") $out.="value=\"$langmessage[54]\"";
	else $out.="value=\"$langmessage[53]\"";
	$out.=" />\n";
	$out.="</td></tr>\n</table></div>\n";
	$result = dbquery("SELECT * FROM linkscat ORDER BY nome");
	$out.="<table cellspacing=\"5\">";
	$GETarray=$_GET;
	while ( $row=fetch_array($result)) {
		$out.="<tr><td><a href=\"".$_SERVER['SCRIPT_NAME']."?";
		if($_GET['do']!="") $out.="do=".$_GET['do']."&amp;";
		$out.="id=".$row[0]."&amp;action=editc\"><img src=\"images/edit.png\" style=\"align: left; border: 0;\" ></a></td>\n";
		$out.="<td><a href=\"".$_SERVER['SCRIPT_NAME']."?";
		if($_GET['do']!="") $out.="do=".$_GET['do']."&amp;";
		$out.="id=".$row[0]."&amp;action=deletec\"><img src=\"images/editdelete.png\" style=\"align: left; border: 0;\" ></a></td>\n";
		$out.="<td>".decode($row['nome'])."</td><td>".decode($row['descr'])."</td>\n";
		$out.="<td>".$row['id']."</td></tr>\n";
	}
	$out.="</table>\n</form>\n";
	if($_GET['action']=="edit")
		$row=fetch_array(dbquery("SELECT * FROM links WHERE id=".$_GET['id']));
	$out.="<div align=\"center\"><h3>$langmessage[40]</h3><form name=\"form1\" method=\"post\" action=\"\"><fieldset style=\"border: 0;\">\n<table>\n";
	$out.="<tr><td>$langmessage[68]</td><td><input type=\"text\" name=\"linkname\"";
	if($_GET['action']=="edit") $out.=" value=\"".decode($row['name'])."\"";
	$out.=" /></td></tr>\n<tr><td>$langmessage[69]</td><td><input type=\"text\" name=\"link\"";
	if($_GET['action']=="edit") $out.=" value=\"".$row['link']."\"";
	$out.=" /></td></tr>\n";
	$out.="<tr><td valign=\"top\" >$langmessage[67]</td><td><textarea name=\"descr\">";
	if($_GET['action']=="edit") $out.=decode($row['descr']);
	$out.="</textarea></td></tr>\n";
	$out.="<tr><td>$langmessage[52]</td><td align=\"right\"><select name=\"cat\" >\n";
	$result = dbquery("SELECT * FROM linkscat");
	$cats=fetch_all($result);
	foreach ($cats as $cat) {
		$out.='<option value="'.$cat['id'].'"';
		if($_GET['action']=="edit" && $row[4]==$cat['id']) $out.=' SELECTED';
		$out.='>'.decode($cat['nome'])."&nbsp;</option>\n";
	}
	$out.="</select></tr>\n<tr><td>";
	if($_GET['action']=="edit") $out.="<input type=\"hidden\" name=\"id\" value=\"".$row[0]."\" />";
	$out.="</td><td><input type=\"hidden\" name=\"submit\" ";
	if($_GET['action']=="edit") $out.="value=\"Edit Link\"";
	else $out.="value=\"Add Link\"";
	$out.=" />\n";
	$out.="<input type=\"submit\" name=\"aa\" ";
	if($_GET['action']=="edit") $out.="value=\"$langmessage[70]\"";
	else $out.="value=\"$langmessage[71]\"";
	$out.=" />\n";
	$out.="</td></tr></table></fieldset></form></div>\n";
	$result = dbquery("SELECT * FROM links ORDER BY name ASC");
	$out.="<table cellspacing=\"5\">";
	while ( $row=fetch_array($result)) {
		$out.="<tr><td><a href=\"".$_SERVER['SCRIPT_NAME']."?";
		if($_GET['do']!="") $out.="do=".$_GET['do']."&amp;";
		$out.="id=".$row[0]."&amp;action=edit\"><img src=\"images/edit.png\" style=\"align: left; border: 0;\" ></a></td>\n";
		$out.="<td><a href=\"".$_SERVER['SCRIPT_NAME']."?";
		if($_GET['do']!="") $out.="do=".$_GET['do']."&amp;";
		$out.="id=".$row[0]."&amp;action=delete\"><img src=\"images/editdelete.png\" style=\"align: left; border: 0;\" ></a></td>\n";
		$out.="<td>".decode($row['name'])."</td><td>".$row['link']."</td></tr>\n";
	}
	$out.="</table>\n";
	return $out;
}

function download() {
	global $message, $langmessage, $max_upload_file_size;
	switch($_GET['action']) {
		case "delete":
			dbquery("DELETE FROM downloads WHERE reg=".$_GET['id']);
			unset($_GET['action']);
			$message1="Download deleted";
			break;
		case "deletec":
			dbquery("DELETE FROM downloadscat WHERE id=".$_GET['id']);
			unset($_GET['action']);
			$message1="Download category deleted";
			break;
		case "editc":
			$result = dbquery("SELECT * FROM downloadscat WHERE id=".$_GET['id']);
			$row=fetch_array($result);
			$message1="Download category deleted";
	}
	if($message1!="") $out.="<h3>".$message1."</h3>\n";
	$out.="<h2>$langmessage[48]</h2>\n<div align=\"center\"><h3>$langmessage[49]</h3>\n";
	$out.="<form method=\"post\" action=\"\"><fieldset style=\"border: 0;\"><table>\n";
	$out.="<tr><td>$langmessage[50]</td><td><input type=\"text\" name=\"name\"";
	if($_GET['action']=="editc") $out.=" value=\"".decode($row[1])."\"";
	$out.=" /></td></tr>\n<tr><td>$langmessage[15]</td><td><input type=\"text\" name=\"descr\"";
	if($_GET['action']=="editc") $out.=" value=\"".decode($row[2])."\"";
	$out.=" /></td></tr>\n<tr><td></td><td><input type=\"hidden\" name=\"id\" value=\"".$_GET['id']."\" />\n";
	$out.="<input type=\"hidden\" name=\"downloadcat\" ";
	if($_GET['action']=="editc") $out.="value=\"Edit Category\"";
	else $out.="value=\"Add Category\"";
	$out.=" />\n";
	$out.="<input type=\"submit\" name=\"\" ";
	if($_GET['action']=="editc") $out.="value=\"$langmessage[54]\"";
	else $out.="value=\"$langmessage[53]\"";
	$out.=" />\n";
	$out.="</td></tr>\n</table></div>\n";
	$result = dbquery("SELECT * FROM downloadscat ORDER BY id");
	$out.="<table cellspacing=\"5\">";
	while ( $row=fetch_array($result)) {
		$out.="<tr><td><a href=\"".$_SERVER['SCRIPT_NAME']."?";
		if($_GET['do']!="") $out.="do=".$_GET['do']."&amp;";
		$out.="id=".$row[0]."&amp;action=editc\"><img src=\"images/edit.png\" style=\"align: left; border: 0;\" ></a></td>\n";
		$GETarray['action'] = "deletec";
		$out.="<td><a href=\"".$_SERVER['SCRIPT_NAME']."?";
		if($_GET['do']!="") $out.="do=".$_GET['do']."&amp;";
		$out.="id=".$row[0]."&amp;action=deletec\"><img src=\"images/editdelete.png\" style=\"align: left; border: 0;\" ></a></td>\n";
		$out.='<td>'.decode($row['nome']).'</td><td>'.$row['file']."</td>\n";
		$out.="<td>".$row['downloads']."</td><td>".$row['ex']."</td></tr>\n";
	}
	$out.="</table></form>";
	if($_GET['action']=="edit") $row=fetch_array(dbquery("SELECT * FROM downloads WHERE reg=".$_GET['id']));
	$out.="<hr><div align=\"center\"><h3>$langmessage[48]</h3>";
	$out.="<form enctype=\"multipart/form-data\" method=\"post\" action=\"\"><fieldset style=\"border: 0;\"><table>\n";
	$out.="<tr><td><input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"$max_upload_file_size\" /></td>\n<td>$langmessage[50]</td><td><input type=\"text\" name=\"nome\"";
	if($_GET['action']=="edit") $out.=" value=\"".decode($row[1])."\"";
	$out.=" /></td></tr>\n";
	$out.="<tr><td><input style=\"width: 14px;\" type=\"radio\" checked=\"checked\" name=\"filename\" value=\"upload\" /></td><td>$langmessage[122]</td><td><input style=\" text-align: left;\" name=\"uploadedfile\" type=\"file\" name=\"uploadfile\" />\n</td></tr>\n";
	$out.="<tr><td><input style=\"width: 14px;\" type=\"radio\" name=\"filename\" value=\"filename\" /></td><td>$langmessage[84]</td><td><input type=\"text\" name=\"file\"";
	if($_GET['action']=="edit") $out.=" value=\"".decode($row[2])."\"";
	$out.=" /></td></tr>\n";
	if($_GET['action']=="edit") {
		$out.="<tr><td>&nbsp;</td><td>$langmessage[48]</td><td><input type=\"text\" name=\"downloads\" value=\"".$row[3]."\" />";
		$out.="<input type=\"hidden\" name=\"reg\" value=\"".$row[0]."\" /></td></tr>\n";
	}
	$out.="<tr><td>&nbsp;</td><td>$langmessage[52]</td><td align=\"right\"><select name=\"cat\" >\n";
	$result = dbquery("SELECT * FROM downloadscat");
	$cats=fetch_all($result);
	foreach ($cats as $cat) {
		$out.='<option value="'.$cat['id'].'"';
		if($_GET['action']=="edit" && $row[4]==$cat['id']) $out.=' SELECTED';
		$out.='>'.decode($cat['nome'])."&nbsp;</option>\n";
	}
	$out.="</select></tr>\n";
	$out.="<tr><td>&nbsp;</td><td>&nbsp</td><td>\n";
	$out.="<input type=\"hidden\" name=\"submit\" ";
	if($_GET['action']=="edit") $out.="value=\"Edit Download\"";
	else $out.="value=\"Add Download\"";
	$out.=" />\n";
	$out.="<input type=\"submit\" name=\"\" ";
	if($_GET['action']=="edit") $out.="value=\"$langmessage[56]\"";
	else $out.="value=\"$langmessage[55]\"";
	$out.=" />\n";
	$out.="</td></tr>\n</table>\n</fieldset>\n</form>\n</div>\n";
	$result = dbquery("SELECT * FROM downloads ORDER BY reg DESC");
	$out.="<table cellspacing=\"5\">";
	while ( $row=fetch_array($result)) {
		$out.="<tr><td><a href=\"".$_SERVER['SCRIPT_NAME']."?";
		if($_GET['do']!="") $out.="do=".$_GET['do']."&amp;";
		$out.="id=".$row[0]."&amp;action=edit\"><img src=\"images/edit.png\" style=\"align: left; border: 0;\" ></a></td>\n";
		$out.="<td><a href=\"".$_SERVER['SCRIPT_NAME']."?";
		if($_GET['do']!="") $out.="do=".$_GET['do']."&amp;";
		$out.="id=".$row[0]."&amp;action=delete\"><img src=\"images/editdelete.png\" style=\"align: left; border: 0;\" ></a></td>\n";
		$out.='<td>'.decode($row['nome']).'</td><td>'.$row['file']."</td>\n";
		$out.="<td>".$row['downloads']."</td><td>".$row['ex']."</td></tr>\n";
	}
	$out.="</table>\n";
	return $out;
}

function settings() {
	global $langmessage, $set;
	$out.="<h2>$langmessage[34]</h2><br /><br /><div id=\"LNE_admininput\"><table class=\"settings\">\n<tr>";
	$out.="<td><a href=\"".$set['homepath'].$set['indexfile']."?do=create\"><img src=\"images/addpage.png\" alt=\"$langmessage[35]\" title=\"$langmessage[35]\" style=\"border: 0;\" /></a></td>\n";
	$out.="<td><a href=\"".$set['homepath'].$set['indexfile']."?do=editextra\"><img src=\"images/extra.png\" alt=\"$langmessage[36]\" title=\"$langmessage[36]\" style=\"border: 0;\" /></a></td>\n";
	$out.="<td><a href=\"".$set['homepath'].$set['indexfile']."?do=adminnews\"><img src=\"images/news.png\" alt=\"$langmessage[37]\" title=\"$langmessage[37]\" style=\"border: 0;\" /></a></td>";
	$out.="<td><a href=\"".$set['homepath'].$set['indexfile']."?page=".$pagenum."&amp;do=image\"><img src=\"images/images.png\" alt=\"$langmessage[38]\" title=\"$langmessage[38]\" style=\"border: 0;\" /></a></td>\n";
	$out.="<td><a href=\"".$set['homepath'].$set['indexfile']."?page=".$pagenum."&amp;do=download\"><img src=\"images/downloads.png\" alt=\"$langmessage[39]\" title=\"$langmessage[39]\" style=\"border: 0;\" /></a></td></tr>\n";
	$out.="<tr><td>$langmessage[35]</td><td>$langmessage[36]</td><td>$langmessage[37]</td><td>$langmessage[38]</td><td>$langmessage[39]</td></tr>\n";
	$out.="<tr><td style=\" text-align: center; \"><a href=\"".$set['homepath'].$set['indexfile']."?do=editlinks\"><img src=\"images/gowebsite.png\" alt=\"$langmessage[40]\" style=\"border: 0;\" /></td>";
	$out.="<td><a href=\"".$set['homepath'].$set['indexfile']."?do=editmenu\"><img src=\"images/menu.png\" alt=\"$langmessage[41]\" title=\"$langmessage[41]\" style=\"border: 0;\" /></a></td>";
	$out.="\n<td><a href=\"".$set['homepath'].$set['indexfile']."?do=generate\"><img src=\"images/generate.png\" alt=\"$langmessage[42]\" title=\"$langmessage[42]\" style=\"border: 0;\" /></a>&nbsp;</td>\n";
	$out.="<td><a href=\"".$set['homepath'].$set['indexfile']."?do=users\"><img src=\"images/user.png\" alt=\"$langmessage[154]\" title=\"$langmessage[154]\" style=\"border: 0;\" /></a></td>";
	$out.="<td><a href=\"".$set['homepath'].$set['indexfile']."?do=setup\"><img src=\"images/setup.png\" alt=\"$langmessage[44]\" title=\"$langmessage[44]\" style=\"border: 0;\" /></a></td></tr>";
	$out.="<tr><td>$langmessage[40]</td><td>$langmessage[41]</td><td>$langmessage[42]</td><td>$langmessage[154]</td><td>$langmessage[44]</td></tr>\n";
	$out.="</table></div>\n";
	return $out;
}

function query() {
	global $langmessage;
	$out.="<form method=\"post\" action=\"\"><fieldset>\n
	<div align=\"center\">\n
	<h2>$langmessage[45]</h2>\n
	<table width=\"95%\">\n
	<tr><td>$langmessage[47]:</td><td><textarea style=\"width: 95%\"name=\"query\"></textarea></td></tr>\n
	</table>\n";
	$out.="<input type=\"hidden\" name=\"submit\" value=\"Query Database\" />\n";
	$out.="<input type=\"submit\" name=\"\" value=\"$langmessage[45]\" />\n";
	$out.="</div>\n</fieldset></form>\n";
	return $out;
}

function setup() {
	global $langmessage, $set;
	$out.="<form method=\"post\" action=\"\">\n";
	$out.="<h2>$langmessage[130]</h2>\n<fieldset><table>\n";
	$out.="<tr><td align=\"right\">$langmessage[6]:</td>\n";
	$out.="<td><input type=\"text\" name=\"password\" value=\"\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[7]:</td>\n";
	$out.="<td><input type=\"text\" name=\"admin\" value=\"".$set['admin']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[8]:</td>\n";
	$out.="<td><input type=\"text\" name=\"email\" value=\"".$set['email']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[9]:</td>\n";
	$out.="<td><input type=\"text\" name=\"wemail\" value=\"".$set['wemail']."\" /></td></tr>\n";
	$out.="<input type=\"hidden\" name=\"restricted\" value=\"\" />";
	$out.="<tr><td align=\"right\">$langmessage[10]:</td>\n";
	$out.="<td><input type=\"text\" name=\"homepath\" value=\"".$set['homepath']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[11]:</td>\n<td><select name=\"template\">\n";
	$folder="templates";
	$filez=filelist('/./', $folder,1);
	foreach($filez as $fil) {
		$out.='<option value="'.$fil.'"';
		if($set['template']==$fil) $out.=" SELECTED";
		$out.='>'.$fil."</option>\n";
	}
	$out.="</select>\n</td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[12]:</td><td><input type=\"text\" name=\"title\" value=\"".$set['title']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[13]:</td><td><input type=\"text\" name=\"subtitle\" value=\"".$set['subtitle']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[14]:</td><td><input type=\"text\" name=\"keywords\" value=\"".$set['keywords']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[15]:</td><td><input type=\"text\" name=\"description\" value=\"".$set['description']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[16]:</td><td><input type=\"text\" name=\"author\" value=\"".$set['author']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[17]:</td><td><input type=\"text\" name=\"footer\" value=\"".$set['footer']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[145]:</td><td><input type=\"text\" name=\"timeoffset\" value=\"".$set['timeoffset']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[151]:</td><td><input type=\"text\" name=\"dateformat\" value=\"".$set['dateformat']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[19]:</td>\n<td><input type=\"text\" name=\"indexfile\" value=\"".$set['indexfile']."\" /></td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[20]:</td>\n<td><select name=\"language\">\n";
	$folder="languages";
	$filez=filelist('/./', $folder);
	foreach($filez as $fil) {
		$out.='<option value="'.substr($fil,5,5).'"';
		if(substr($fil,5,5) == $set['language']) $out.=' SELECTED';
		$out.='>'.substr($fil,0,10)."</option>\n";
	}
	$out.="</select>\n</td></tr>\n";
	$out.="<tr><td align=\"right\">$langmessage[21]:</td>\n<td><select name=\"langeditor\">\n";
	$folder="fckeditor/editor/lang";
	$filez=filelist('/./', $folder);
	foreach($filez as $fil) {
		if(strpos($fil, ".js")) {
			$out.='<option value="'.substr($fil,0,2).'"';
			if(substr($fil,0,2) == $set['langeditor']) $out.=' SELECTED';
			$out.='>'.$fil."</option>\n";
		}
	}
	$out.="</select>\n</td></tr>\n";
	$out.="<tr><td><input type=\"hidden\" name=\"submit\" value=\"Save Setup\" />\n";
	$out.="</td><td><input type=\"submit\" name=\"\" value=\"$langmessage[25]\" /></td></tr>\n";
	$out.="</table>\n</fieldset></form>\n";
	return $out;
}

function editmenu() {
	global $menu, $langmessage, $set;
	$out="<h2>$langmessage[91]</h2>\n<hr>\n";
	if($_GET['action']=="edit") {
		$result = dbquery("SELECT * FROM menu WHERE page=\"".$_GET['page']."\"");
		$row=fetch_array($result);
		$out.='<div align="center"><form method="post" action=""><fieldset>';
		$out.="<table width=\"90%\" cellspacing=\"5\">";
		$out.="<tr><td>m1</td><td>m2</td><td>m3</td><td>$langmessage[69]</td><td>$langmessage[85]</td></tr>";
		$out.='<tr><td><input style=" width: 3em;" type="text" name="m1" value='.$row[0].' /></td>';
		$out.='<td><input style=" width: 3em;" type="text" name="m2" value='.$row[1].' /></td>';
		$out.='<td><input style=" width: 3em;" type="text" name="m3" value='.$row[2].' /></td>';
		$out.='<td><input type="text" name="m4" value="'.$row[3].'" size="10" /></td>';
		$out.='<td><input type="text" name="m5" value="'.decode($row[4]).'" size="30" /></td>';
		$out.='</tr></table><input type="hidden" name="oldm4" value="'.$row[3].'" />';
		$out.='<input type="hidden" name="submit" value="Edit Menu Entry" />';
		$out.='<input type="submit" name="" value="'.$langmessage[92].'" />';
		$out.="\n</fieldset></form></div>\n";
	}
	if($_GET['action']=="delete") {
		$result = dbquery("SELECT * FROM menu WHERE page=\"".$_GET['page']."\"");
		$row=fetch_array($result);
		$out.='<div align="center"><form method="post" action=""><fieldset>';
		$out.="<table><tr><td>m1</td><td>m2</td><td>m3</td><td>$langmessage[69]</td><td>$langmessage[85]</td></tr>";
		$out.='<tr><td>'.$row[0].'</td>';
		$out.='<td>'.$row[1].'</td>';
		$out.='<td>'.$row[2].'</td>';
		$out.='<td>'.$row[3].'</td>';
		$out.='<td>'.decode($row[4]).'</td>';
		$out.='</tr></table><input type="hidden" name="oldm4" value="'.$row[3].'" />';
		$out.="<input type=\"hidden\" name=\"submit\" value=\"Delete Menu Entry\" />\n";
		$out.="<input type=\"submit\" name=\"\" value=\"$langmessage[93]\" />\n";
		$out.="</fieldset></form></div>";
	}
	$out.="<table cellspacing=\"5\" style=\"border: 0;\">\n
	<tr><td style=\" width: 14px;\"></td><td style=\" width: 14px;\"></td><td style=\" width: 14px;\"></td><td style=\" width: 14px;\"></td><td style=\" width: 14px;\"></td><td style=\" width: 140px;\"><b>$langmessage[69]:</b></td><td><b>$langmessage[85]:</b></td></tr>\n";
	$count=0;
	while($menu[$count][0]) {
		$out.='<tr><td>';
		$out.='<a href="'.$set['homepath'].$set['indexfile'].'?do=editmenu&amp;action=edit&amp;page='.$menu[$count][3].'"><img src="images/edit.png" title="'.$langmessage[92].'" style="align: left; border: 0;" ></a>';
		$out.='</td><td><a href="'.$set['homepath'].$set['indexfile'].'?do=editmenu&amp;action=delete&amp;page='.$menu[$count][3].'"><img src="images/editdelete.png" title="'.$langmessage[93].'" style="align: left; border: 0;" ></a>';
		$out.='</td><td>'.$menu[$count][0].'</td><td>'.$menu[$count][1].'</td><td>'.$menu[$count][2];
		$out.='</td><td>'.$menu[$count][3].'</td><td>';
		if($menu[$count][1]!="0")
			$out.="<span style=\" width: 20px; display: inline; float: left;\">-></span>";
		if($menu[$count][2]!="0")
			$out.="<span style=\" width: 20px; display: inline; float: left;\">-></span>";
		$out.=$menu[$count][4]."</td></tr>\n";
		$count++;
	}
	$out.="</table><hr>\n";
	return $out;
}

function delete_page() {
	global $out, $pagenum, $langmessage, $selected;
	$out.="<div align=\"center\">\n<h2>$langmessage[131]".$selected['name']."?</h2>\n";
	$out.="<form method=\"post\" action=\"\">\n<fieldset>\n";
	$out.="<input type=\"hidden\" name=\"pagenum\" value=\"$pagenum\" />";
	$out.="<input type=\"hidden\" name=\"submit\" value=\"Delete Page\" />\n";
	$out.="<input type=\"submit\" name=\"\" value=\"$langmessage[136]\" />\n";
	$out.="</fieldset></form>\n</div>\n";
	$result = dbquery("SELECT * FROM paginas WHERE page=\"".$pagenum."\"");
	if($row=fetch_array($result))
		$out.=showcontent(stripslashes(html_entity_decode($row['content'])));
	else
		$out.="<h2>$langmessage[116]</h2>";
}

function images() {
	global $langmessage, $max_upload_image_size;
	$out.="<div align=\"center\">\n";
	if($_GET['action']=="delete" && $_GET['file']!="") {
		$pathtofile= $_GET['file'];
		if(@unlink($pathtofile)) {
			//delete thumbnail too
			$info = pathinfo($pathtofile);
			$fname= $info['basename'];
			@unlink("../thumbs/".$fname);
			$out.="<h2 class=\"LNE_message\">".$langmessage[149]."</h2>\n";
		} else
			$out.="<h2 class=\"LNE_message\">Error deleting image</h2>\n";
	}
	$out.="<form enctype=\"multipart/form-data\" method=\"post\" action=\"\">\n<fieldset style=\"border: 0;\">\n";
	$out.="<h2 class=\"LNE_title\">$langmessage[57]</h2>\n";
	$out.="<h3>$langmessage[58]</h3>\n";
	$out.="<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"$max_upload_image_size\" />\n";
	$out.="<table>\n<tr><td></td><td>$langmessage[59]:</td><td><input name=\"uploadedfile\" type=\"file\" />\n</td></tr>\n";
	$out.="<tr><td>&nbsp;</td><td>$langmessage[61]:</td><td>";
	$out.="<select name=\"gal\">\n";
	$folder="galeries";
	$files=filelist('/./',$folder,1);
	foreach($files as $file) {
		if($file != ".." && $file != ".") {
		    $out.='<option value="'.$file."\">".$file."&nbsp;</option>\n";
		}
	}
	$out.="</select>\n</td></tr>\n";
	$out.="<tr><td></td>\n<td></td><td>";
	$out.="<input type=\"hidden\" name=\"submit\" value=\"Upload image\" />";
	$out.="<input type=\"submit\" value=\"$langmessage[58]\" /></td>";
	$out.="</tr>\n</table>\n</fieldset>\n</form>\n<br /><h3>$langmessage[62]</h3>\n";
	$out.="<form method=\"post\" action=\"\">\n<fieldset style=\"border: 0;\">\n";
	$out.="<table>\n<tr><td>$langmessage[117]:</td>\n<td>";
	$out.="<input name=\"galeryname\" type=\"text\" value=\"\" />\n</td></tr>\n";
	$out.="<tr><td><input type=\"hidden\" name=\"submit\" value=\"Create Gallery\" /></td>\n<td>";
	$out.="<input type=\"submit\" name=\"aa\" value=\"$langmessage[62]\" /></td>";
	$out.="</tr></table>\n</fieldset>\n</form>\n";
	$out.="<br /><h3>".$langmessage[148]." ".$langmessage[38]."</h3>\n";
	$out.="<table>\n";
	$folder="galeries";
	$files=filelist('/./',$folder,1);
	foreach($files as $file) { // we have folder names here
		$folder1="galeries/".$file;
		$file1=filelist("/./",$folder1);
		foreach($file1 as $fil) {
			$out.="<tr><td><a href=\"".$_SERVER["SCRIPT_NAME"]."?pag=5&do=image&amp;action=delete&amp;file=$folder1/$fil\">";
			$out.="<img src=\"images/editdelete.png\" alt=\"delete\" title=\"Delete ".substr($file,9)."\" align=\"left\" border=\"0\" /></a></td>";
			$out.="<td>$fil</td>";
			$out.="<td align=\"center\" >";
			$thumb=createThumb($folder1."/".$fil, "thumbs/", 100);
			$out.="<img src=\"thumbs/$thumb\"  alt=\"$thumb\" /></td></tr>\n";
		}
	}
	$out.="</table>\n</div>\n";
	return $out;
}

function create_page() {
	global $set, $menu, $langmessage;
	$out.="<div id=\"LNE_admininput\"><form method=\"post\" action=\"\"><h2>$langmessage[35]</h2>\n
	<fieldset><table><tr><td align=\"right\"><b>$langmessage[83]:</b></td><td><select name=\"level\"><OPTION VALUE=\"1\">1&nbsp;</OPTION>\n
	<OPTION VALUE=\"2\">2&nbsp;</OPTION>\n<OPTION VALUE=\"3\">3&nbsp;</OPTION>\n</td></tr>\n
	<tr><td align=\"right\"><b>$langmessage[140]:</b></td><td><select name=\"count\">\n";
	$count=0;
	while($menu[$count][0] != "") {
		$out.='<option value="'.$menu[$count][3].'"';
		$out.=' selected >'.$menu[$count][4]."&nbsp;</option>\n";
		$count++;
	}
	$out.="</select></td></tr>\n
	<tr><td align=\"right\"><b>$langmessage[84]:</b></td><td><input name=\"filename\" type=\"text\" /></td></tr>\n";
	$out.="<tr><td align=\"right\"><b>$langmessage[85]:</b></td><td><input name=\"label\" type=\"text\" /></td></tr>\n";
	$out.="<tr><td align=\"right\" valign=\"top\"><b>$langmessage[15]:</b></td><td><textarea name=\"description\"></textarea></td></tr>\n";
	$out.="<tr><td align=\"right\"><b>$langmessage[11]:</b></td><td><select name=\"template\">\n";
	$folder="templates";
	$out.="<OPTION VALUE=\"\">$langmessage[159]</OPTION>\n";
	$dir=opendir($folder);
	while($file=readdir($dir))
		if($file != ".." && $file != "." && is_dir($folder."/".$file))
		    $out.='<OPTION VALUE="'.$file.'">'.$file."&nbsp;</OPTION>\n";
	closedir($dir);
	$out.="</select></td></tr>\n";
	$out.="<tr><td align=\"right\"><b>$langmessage[160]</b></td><td>";
	$out.="<select name=\"restricted\">";
	$out.="<option value=\"0\">$langmessage[161]</option>";
	$out.="<option value=\"2\">$langmessage[162]</option>";
	$out.="<option value=\"4\">$langmessage[163]</option>";
	$out.="</select></td></tr>\n<tr><td></td><td>\n";
	$out.="<input type=\"hidden\" name=\"submit\" value=\"Create Page\" />\n";
	$out.="<input type=\"submit\" name=\"\" value=\"$langmessage[86]\" />\n";
	$out.="</td></tr>\n</table></fieldset></form></div>\n";
	return $out;
}

function users() {
	global $langmessage;
	$out="<h2>$langmessage[154]</h2>\n";
	if($_GET['action']=="edituser") {
		$result = dbquery('SELECT * FROM users WHERE id='.$_GET['id']);
		if($row = fetch_array($result))
			$out.= userform($_GET['id'], $row);
	}
	$out.="<div>\n<table style=\"border: none;\">\n";
	$result=dbquery('SELECT * FROM users ORDER BY handle');
	while($row = fetch_array($result)) {
		$out.="<tr><td><a href=\"".$_SERVER['SCRIPT_NAME']."?do=users&amp;action=edituser&amp;id=".$row['id']."\"><img style=\"padding: none; border: none;\" src=\"images/edit.png\" /></a></td><td><b>".$row['handle']."</b></td><td>".$row['adminlevel']."</td><td>".$row['ip']."</td><td>".strftime("%m/%d/%y", $row['datejoined'])."</td></tr>\n";
	}
	$out.="</table>\n</div>\n";
	if($_GET['action']!="edituser")
		$out.= userform();
	return $out;
}

function userform($id=0, $row="") {
	global $langmessage;
	if($id) {
		$mess="saveuser";
		$mess1=$langmessage[82];
	} else {
		$mess="adduser";
		$mess1=$langmessage[172];
	}
	$out.="<form method=\"POST\" action=\"\" />\n<table>\n";
	$out.="<tr><td>$langmessage[155]</td><td><input name=\"handle\" type=\"text\" size=\"20\" maxlength=\"30\" value=\"".$row['handle']."\" /></td></tr>\n";
	$out.="<tr><td>$langmessage[170]</td><td>".$row['ip']."</td></tr>\n";
	$out.="<tr><td>$langmessage[6]</td><td><input name=\"password\" type=\"password\" size=\"20\" maxlength=\"30\" /></td></tr>\n";
	$out.="<tr><td>$langmessage[156]</td><td><input name=\"repeatpassword\" type=\"password\" size=\"20\" maxlength=\"30\" /></td></tr>\n";
	$out.="<tr><td>$langmessage[158]</td><td><input name=\"email\" type=\"text\" size=\"20\" maxlength=\"30\" value=\"".$row['email']."\" /></td></tr>\n";
	$out.="<tr><td>$langmessage[166]</td><td><input name=\"firstname\" type=\"text\" size=\"20\" maxlength=\"30\" value=\"".$row['firstname']."\" /></td></tr>\n";
	$out.="<tr><td>$langmessage[167]</td><td><input name=\"lastname\" type=\"text\" size=\"20\" maxlength=\"30\" value=\"".$row['lastname']."\" /></td></tr>\n";
	$out.="<tr><td>$langmessage[168]</td><td><input name=\"website\" type=\"text\" size=\"20\" maxlength=\"30\" value=\"".$row['website']."\" /></td></tr>\n";
	$out.="<tr><td>$langmessage[169]</td><td><input name=\"location\" type=\"text\" size=\"20\" maxlength=\"30\" value=\"".$row['location']."\" /></td></tr>\n";
	if($_SESSION['adminlevel']==5) {
		$out.="<tr><td>$langmessage[157]</td><td><select name=\"adminlevel\">";
		$out.="<option value=\"0\"";
		if($row['adminlevel']==0) $out.=" selected";
		$out.=">$langmessage[161]</option>";
		$out.="<option value=\"2\"";
		if($row['adminlevel']==2) $out.=" selected";
		$out.=">$langmessage[162]</option>";
		$out.="<option value=\"4\"";
		if($row['adminlevel']==4) $out.=" selected";
		$out.=">$langmessage[163]</option>";
		$out.="<option value=\"5\"";
		if($row['adminlevel']==5) $out.=" selected";
		$out.=">Webmaster</option>";
		$out.="</select></td></tr>\n";
	} else {
		$out.="<input type=\"hidden\" name=\"adminlevel\" value=\"".$row['adminlevel']."\" />\n";
	}
	$out.="<tr><td><input type=\"hidden\" name=\"userid\" value=\"$id\" /><input type=\"hidden\" name=\"submit\" value=\"$mess\" /></td><td><input name=\"\" type=\"submit\" value=\"$mess1\" /></td></tr>\n";
	$out.="</table>\n</form>\n";
	return $out;
}
?>