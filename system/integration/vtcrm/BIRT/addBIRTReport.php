<?php
/*********************************************************************************
 * Copyright 2012 JPL TSolucio, S.L.  --  This file is a part of vtiger CRM.
 * You can copy, adapt and distribute the work under the "Attribution-NonCommercial-ShareAlike"
 * Vizsage Public License (the "License"). You may not use this file except in compliance with the
 * License. Roughly speaking, non-commercial users may share and modify this code, but must give credit
 * and share improvements. However, for proper details please read the full License, available at
 * http://vizsage.com/license/Vizsage-License-BY-NC-SA.html and the handy reference for understanding
 * the full license at http://vizsage.com/license/Vizsage-Deed-BY-NC-SA.html. Unless required by
 * applicable law or agreed to in writing, any software distributed under the License is distributed
 * on an  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and limitations under the
 * License terms of Creative Commons Attribution-NonCommercial-ShareAlike 3.0 (the License).
 ********************************************************************************/
$title='vtiger CRM BI reporting';
header('Content-Type: text/html; charset=UTF8');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><title><?php echo $title; ?></title>
<style type="text/css">@import url("themes/softed/style.css");br { display: block; margin: 2px; }</style>
</head><body class=small style="font-size: 12px; margin: 2px; padding: 2px;">
<table border=0 width=100%><tr>
<td align=left><a href="index.php"><img src="themes/softed/images/vtiger-crm.gif" alt="vtigerBI" title="vtigerBI" border=0></a></td>
<td align=center><b><font size=6><?php echo $title; ?></font></b><br></td>
<td align=right><a href="http://www.tsolucio.com">JPL TSolucio, S.L.</a><br><a href="http://www.bievolutivo.com">vtigercrmbi project</a></td>
</tr></table>
<hr style="height: 1px"><br>
<form name="vtigerbi" method="POST" action="addBIRTReport.php">
<?php
// Turn on debugging level
$Vtiger_Utils_Log = true;

include_once('vtlib/Vtiger/Module.php');

// Check if we have necessary column in database and add if not there
$repcols=$adb->getColumnNames('vtiger_report');
if (!in_array('biurl',$repcols)) 
  ExecuteQuery("ALTER TABLE vtiger_report ADD biurl VARCHAR(455) NULL;",false);

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

if (empty($_REQUEST['reportname']) or empty($_REQUEST['reportdesc']) or empty($_REQUEST['reporturl'])) {
    echo '<br><br><b>Necessary Parameters not present</b><br>';
} else {
 // Tabla para albergar resultados
 echo '<table border=0 width=90%>';
 
$newrptid = $adb->getUniqueID("vtiger_selectquery");
$folderid = (empty($_REQUEST['folderid']) ? 1 : $_REQUEST['folderid']);
$reportname = $_REQUEST['reportname'];
$reportdesc = $_REQUEST['reportdesc'];
$reporturl  = $_REQUEST['reporturl'];

$insrpt ="insert into vtiger_selectquery (queryid, startindex, numofobjects) values ($newrptid,0,0);";
ExecuteQuery($insrpt);
$insrpt ="insert into vtiger_report (reportid, folderid, reportname, description, reporttype, queryid, state, customizable, category, sharingtype, biurl) ";
$insrpt.="values ($newrptid,$folderid,'$reportname','$reportdesc','vtigerBI',$newrptid,'CUSTOM',0,1,'Public','$reporturl');";  
ExecuteQuery($insrpt);
$insrpt ="insert into vtiger_reportmodules (reportmodulesid, primarymodule, secondarymodules) ";
$insrpt.="values ($newrptid,'Users','Users');";  
ExecuteQuery($insrpt);

 // Tabla para albergar resultados
 echo '</table><br>';
}

echo '<table border=1 width=50%>';
$repfld=$adb->query('select folderid,foldername from vtiger_reportfolder order by folderid');
echo '<tr><td class="dvtCellLabel" align="right" width="25%">Folder</td>';
echo '<td class="dvtCellInfo" width="25%"><select id="folderid" name="folderid">';
while ($fld=$adb->fetch_array($repfld)) {
	echo "<option value=".$fld['folderid'].'>'.getTranslatedString($fld['foldername'],'Reports').'</option>';
}
echo '</select></td></tr>';
echo '<tr><td class="dvtCellLabel" align="right" width="25%">Report name</td>';
echo '<td class="dvtCellInfo" width="25%"><input type=text size=50 maxlength=100 id="reportname" name="reportname"></td></tr>';
echo '<tr><td class="dvtCellLabel" align="right" width="25%">Report description</td>';
echo '<td class="dvtCellInfo" width="25%"><input type=text size=50 maxlength=250 id="reportdesc" name="reportdesc"></td></tr>';
echo '<tr><td class="dvtCellLabel" align="right" width="25%">Report URL</td>';
echo '<td class="dvtCellInfo" width="25%"><input type=text size=50 maxlength=255 id="reporturl" name="reporturl"><br>';
echo '<font size=2>birtviewer/frameset?__report=report/IncidenciasRapidas.rptdesign</font></td></tr>';
?>
</table>
<br><input type="submit" value="Create Report"/></form>
</body>
</html>