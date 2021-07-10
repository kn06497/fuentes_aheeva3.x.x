
<?php
	$link = mysql_connect('127.0.0.1', 'aheevaccs', 'aheevaccs');
	mysql_select_db('aheevaccs', $link) or die('Cannot connect to database');

	$get_tablesq = 'select table_name from cfg_calling_list';
	$get_tablesq = mysql_query($get_tablesq, $link);

	echo 'use aheevaccs;';
	while( $c = mysql_fetch_assoc($get_tablesq) )
	{

		$update_table = 'ALTER TABLE '.$c["table_name"].' ADD COLUMN DO_NOT_CALL INT(11) DEFAULT 0;';

		//$res = mysql_query($update_table, $link);
		echo $update_table.'';

	}

?>
