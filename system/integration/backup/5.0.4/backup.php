<?php
/*********************************************************************************
 * The contents of this file are subject to the vtiger Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at <vtiger CRM Home>/vtigerCRM/LICENSE.txt
 * Software distributed under the License is distributed on an  "AS IS"  basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
 * the specific language governing rights and limitations under the License.
 * The Original Code is:  vtigerCRM Open Source
 * The Initial Developer of the Original Code is ABOnline solutions
 * Portions created by ABonline solutions are Copyright (C) ABonline solutions.;
 * All Rights Reserved.
 * Contributor(s):ABOnline solutions http://www.abonlinesolutions.fr
 * Contributor(s):JPL TSolucio, S.L. http://www.tsolucio.com
 ********************************************************************************/

$fullbackup=true;

$path_to_vtiger = realpath(dirname(__FILE__));
//ini_set("include_path", $path_to_vtiger);
require_once('config.inc.php');
require_once('include/utils/utils.php');

function ftpBackupFile($source_file, $ftpserver, $ftpuser, $ftppassword)
{
	// set up basic connection
	$conn_id = ftp_connect($ftpserver);
	if(!$conn_id) {
		return;
	}

	// login with username and password
	$login_result = ftp_login($conn_id, $ftpuser, $ftppassword);	
	if(!$login_result) {
		ftp_close($conn_id);
		return;
	}

	// upload the file
	$destination_file=$source_file;
	$upload = ftp_put($conn_id, '/'.$destination_file, 'schema/backup/'.$source_file, FTP_BINARY);
	// check upload status
	if (!$upload) {
		ftp_close($conn_id);
		return;
	}

	// close the FTP stream
	ftp_close($conn_id);
}


global $adb, $root_directory, $site_URL;

$db_user = $dbconfig['db_username'];
$db_password = $dbconfig['db_password'];
$db = $dbconfig['db_name'];
$db_host = $dbconfig['db_server'];
$db_port = trim($dbconfig['db_port'],':');
$dbname = $dbconfig['db_name']; // Try not to edit this, ok? :)

$ftp_server=$adb->query("select * from vtiger_systems where server_type='backup'");
$res_ftp=$adb->num_rows($ftp_server);
if($res_ftp==1) {
	$backup_use_ftp=true;
}
$ftp_server_name=$adb->query_result($ftp_server,0,'server');
//$ftp_server_port=$adb->query_result($ftp_server,0,'server_port');
$ftp_server_username=$adb->query_result($ftp_server,0,'server_username');
$ftp_server_password=$adb->query_result($ftp_server,0,'server_password');

//Dump mysql
//$dumpname=$db.'_'.date("Ymd").'.sql';
$dumpname=$db.'.sql';
if($dbconfig['db_password']!=""){
	$passwordopt="--password=".$dbconfig['db_password']."";
}
if(ereg("win",strtolower($_ENV["OS"]))){
	//chdir("../../../../mysql/bin");  echo getcwd();
	//exec('mysqldump.exe"'." --user=".$dbconfig['db_username']." ".$passwordopt." -P $db_port -h $db_host --opt ".$dbconfig['db_name'].'>"'.$root_directory.'schema\\backup\\'.$dumpname.'"');
	//chdir($root_directory);
	exec("dumpdb.bat $db_user $db_password $db_port $db_host $dbname $path_to_vtiger");
} else {
    passthru("mysqldump --user=".$dbconfig['db_username']." ".$passwordopt." --opt ".$dbconfig['db_name'].">".$root_directory."schema/backup/".$dumpname."");
}

//Creation de l'archive zip avec les fichiers importants
//$archive_name1=str_replace("http://","",$site_URL);
//$archive_name1=str_replace("/","",$archive_name1);
$archive_name ='vtcrmbackup-'.date("Ymd").'.zip';
include_once('pclzip.lib.php');
$archive = new PclZip(''.$root_directory.'schema/backup/'.$archive_name);
if ($fullbackup)
  $files2zip=''.$root_directory.'user_privileges/,'.$root_directory.'storage/,'.$root_directory.'test/,'.$root_directory.'schema/backup/'.$dumpname.'';
else
  $files2zip=''.$root_directory.'schema/backup/'.$dumpname.'';
$v_list = $archive->create($files2zip);
if ($v_list = 0) {
	die("Error : ".$archive->errorInfo(true));
}

//@unlink(''.$root_directory.'schema/backup/'.$dumpname.'');
//transfer FTP
if($backup_use_ftp){
	ftpBackupFile($archive_name, $ftp_server_name, $ftp_server_username, $ftp_server_password);
}
?>
