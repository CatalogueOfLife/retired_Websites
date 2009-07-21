<html><head>
<title>Advanced Graphing Class Test Program</title>
<style>
body {
	font-family:arial;
	text-align:center;
}
tr,th,td {
	font-family:arial;
	border: 1px solid black;
	border-collapse: collapse;
}
table {
	font-family:arial;
	border: 1px solid black;
	border-collapse: collapse;
	width:80%;
}
</style></head>
<body>
<h3>Advanced Graphing Class Test Program</h3><br>
<h4>Environmental Tests</h4>
<table align=center><tr><th>Test<th></th><th>Result<th></th><th>Resolution</tr>
<tr><td width=30%>PHP Version<td></td><td width=15%><font color=green>PASS</font><td></td><td></tr><tr><td width=30%>Safe Mode<td></td><td width=15%><font color=green>PASS</font><td></td><td></tr><tr><td width=30%>gd Extension<td></td><td width=15%><font color=red>FAIL</font><td></td><td>You must enable the gd extension.  Modify your php.ini file or recompile PHP with this extension.</tr>