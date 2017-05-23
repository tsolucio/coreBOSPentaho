<?php
$moduleTitle="TSolucio::vtiger CRM-Pentaho BI Reporting";

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">';
echo "<html><head><title>vtlib $moduleTitle</title>";
echo '<style type="text/css">@import url("themes/softed/style.css");br { display: block; margin: 2px; }</style>';
echo '</head><body class=small style="font-size: 12px; margin: 2px; padding: 2px; background-color:#f7fff3; ">';
echo '<table width=100% border=0><tr><td align=left>';
echo '<a href="index.php"><img src="themes/softed/images/vtiger-crm.gif" alt="vtiger CRM" title="vtiger CRM" border=0></a>';
echo '</td><td align=center style="background-image: url(\'vtlogowmg.png\'); background-repeat: no-repeat; background-position: center;">';
echo "<b><H1>$moduleTitle</H1></b>";
echo '</td><td align=right>';
echo '<a href="www.vtiger-spain.com"><img src="modules/BIReporting/vtspain.gif" alt="vtiger-spain" title="vtiger-spain" border=0 height=100></a>';
echo '</td></tr></table>';
echo '<hr style="height: 1px">';

// Turn on debugging level
$Vtiger_Utils_Log = true;

include_once('vtlib/Vtiger/Menu.php');
include_once('vtlib/Vtiger/Module.php');

// Enlace con Pentaho BI
$module = new Vtiger_Module();
$module->name = 'BIReporting';
$module->save();

// Initialize all the tables required
$module->initTables();

// Add the module to the Menu (entry point from UI)
$menu = Vtiger_Menu::getInstance('Analytics');
$menu->addModule($module);


// Install script for TSolucio vtigercrm-bi integration
require_once('include/database/PearDatabase.php');

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

?>
