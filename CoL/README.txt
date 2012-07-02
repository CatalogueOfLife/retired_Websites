CoL website is built using Drupal 6.

1) it uses mysql database named colwebdrupal (saved in the dumpfile colwebdrupal.sql)
2) all folders and files go into a directory accessible by apache webserver. At the moment it is named prototype/ on the production server.
3) apache server configuration for the directory is:

Alias /colwebsite "/var/www/colwebsite/"
<Directory /var/www/colwebsite>
		Options Indexes FollowSymLinks -MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>
	
4) make sure to set the  
$base_url = 'http://www.catalogueoflife.org';
in sites/default/settings.php 