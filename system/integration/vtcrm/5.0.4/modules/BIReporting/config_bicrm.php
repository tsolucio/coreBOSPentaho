<?php
/*********************************************************************************
** The contents of this file are subject to the Mozilla Public License. You may
*not use this file except in compliance with the License
* The Original Code is: JPLTSolucio, S,L, Open Source based on vTiger CRM
* The Initial Developer of the Original Code is JPLTSolucio, S.L.
* Portions created by vtiger are Copyright (C) vtiger. All Rights Reserved.
*
 ********************************************************************************/

// Install script for TSolucio vtigercrm-bi integration
require_once('include/database/PearDatabase.php');
require_once('include/utils/CommonUtils.php');

/** to store the custom view columns of the customview in vtiger_cvcolumnlist table
  * @param $cvid :: Type Integer
  * @param $columnlist :: Type Array of columnlists
 */
function insertCvColumns($CVid,$columnslist)
{
	global $done;
	if($CVid != "")
	{
		for($i=0;$i<count($columnslist);$i++)
		{
			$columnsql = "insert into vtiger_cvcolumnlist (cvid,columnindex,columnname)";
			$columnsql .= " values (".$CVid.",".$i.",'".$columnslist[$i]."')";
			ExecuteQuery($columnsql,$done);
		}
	}
}

 //Function used to execute the query and display the success/failure of the query
function ExecuteQuery($query,$done=false)
{
    if ($done) return; // Si ya esta hecho nos vamos
    
    global $adb;
    $status = $adb->query($query);
    if(is_object($status))
    {
        echo '
            <tr width="100%">
                <td width="25%"><font color="green"> OK </font></td>
                <td width="75%">'.$query.'</td>
            </tr>';
    }
    else
    {
        echo '
            <tr width="100%">
                <td width="25%"><font color="red"> NOK ('.$status.') </font></td>
                <td width="75%">'.$query.'</td>
            </tr>';
    }
}

 $done=false;  // De entrada todo esta hecho
 
 // Tabla para albergar resultados
 echo '<table border=0 width=90%>';
 
 // Prepare vtiger product line view
 $newview="CREATE VIEW `productline` AS
    SELECT `id` , `productid` , `sequence_no` , `quantity` , `listprice` , `comment` , `description` ,
     coalesce( `tax1` , 0 ) AS tax1, coalesce( `tax2` , 0 ) AS tax2, coalesce( `tax3` , 0 ) AS tax3,
     `quantity` * `listprice` AS extgross,
     COALESCE( discount_percent, COALESCE( discount_amount *100 / ( `quantity` * `listprice` ) , 0 ) ) AS `discount_percent`,
     COALESCE( discount_amount, COALESCE( discount_percent * `quantity` * `listprice` /100, 0 ) ) AS `discount_amount`,
     (quantity * listprice) - COALESCE( discount_amount, COALESCE( discount_percent * quantity * listprice /100, 0 )) AS extnet,
     ((quantity * listprice) - COALESCE( discount_amount, COALESCE( discount_percent * quantity * listprice /100, 0 ))) * ( COALESCE( tax1, 0 ) + COALESCE( tax2, 0 ) + COALESCE( tax3, 0 ) ) /100 AS linetax,
     ((quantity * listprice) - COALESCE( discount_amount, COALESCE( discount_percent * quantity * listprice /100, 0 ))) * ( 1 + ( COALESCE( tax1, 0 ) + COALESCE( tax2, 0 ) + COALESCE( tax3, 0 )) /100) AS linetotal
    FROM vtiger_inventoryproductrel";
 ExecuteQuery($newview);
 

 $newfunction="CREATE FUNCTION getTotalIndividualTax(entityid INT) RETURNS FLOAT RETURN (SELECT SUM( linetax ) AS taxtotales FROM productline WHERE id = entityid)";
 ExecuteQuery($newfunction);

// Create new tab in table `vtiger_tab` and vtiger_parenttab
  // First we obtain the next available tabid
  $result   = $adb->query("select max(tabid) as maxtabid from vtiger_tab;");
  $newtabid = $adb->query_result($result,0,'maxtabid') + 1;
  // Now we create new tab entry
  $insquery="INSERT INTO `vtiger_tab` (`tabid`, `name`, `presence`, `tabsequence`, `tablabel`, `modifiedby`, `modifiedtime`, `customized`,`ownedby`) VALUES ($newtabid, 'BIReporting', 0, $newtabid, 'BIReporting', NULL, NULL, 0,0);";
  ExecuteQuery($insquery,$done);

  // Insert newtab into vtiger_entityname
  //$query = "INSERT INTO `vtiger_entityname` ( `tabid` , `modulename` , `tablename`, `fieldname`, `entityidfield` ) VALUES ";
  //$query.= "  ('$newtabid', 'BIReporting', 'vtiger_bireporting', 'bireporting', 'bireportingid');";
  //ExecuteQuery($query,$done);
  
  // First we obtain the next available parenttabib
/*
  $result   = $adb->query("select max(parenttabid) as maxtabid from vtiger_parenttab;");
  $newptabid = $adb->query_result($result,0,'maxtabid') + 1;
  $query = "INSERT INTO `vtiger_parenttab` ( `parenttabid` , `parenttab_label` , `sequence` , `visible` ) VALUES ";
  $query.= "  ('$newptabid', 'Projects', 4, '0');";
  $adb->query($query);
*/
  // Now we create new parenttabrel entry
  $query = "INSERT INTO `vtiger_parenttabrel` ( `parenttabid` , `tabid` , `sequence` ) VALUES ";
  $query.= "  ('5', '$newtabid', '8');";
  ExecuteQuery($query,$done);

  // Get role information once for all operations that need it now
  $role_query  = 'select distinct roleid from vtiger_role;';
  $role_result = $adb->query($role_query);
  $num_roles   = $adb->num_rows($role_result);

  // Get profile information once for all
  $profile_query  = 'select distinct profileid from vtiger_profile;';
  $profile_result = $adb->query($profile_query);
  $num_profiles   = $adb->num_rows($profile_result);
  
// For each existing profile add tab & permissions (default to all)
for($p=0; $p<$num_profiles; $p++)
{
	$profid = $adb->query_result($profile_result,$p,'profileid');
	
	$insp2tab = "INSERT INTO vtiger_profile2tab (profileid, tabid, permissions) VALUES ($profid, $newtabid, 0)";
	ExecuteQuery($insp2tab,$done);
	    
	for ($op=0; $op<=4; $op++){
		$insp2stdperms = "INSERT INTO vtiger_profile2standardpermissions (profileid, tabid, Operation, permissions) VALUES ($profid, $newtabid, $op, 0)";
		ExecuteQuery($insp2stdperms,$done);    
	}
}

 $done=false;  // A partir de aqui esta pendiente

 // Tabla para albergar resultados
 echo '</table>';

  // regenerate tabdata.php
  print "Regenerate tabdata.php<br>";
  create_tab_data_file();
  create_parenttab_data_file();
 
  print '<br/>You should check apache and vtiger logs for any errors before continuing.<br/>';
  print "<br/>Thanks for trying out the TSolucio::vtiger-pentaho BIReporting module.<br/>TSolucio Team<br/>";
  
?>
