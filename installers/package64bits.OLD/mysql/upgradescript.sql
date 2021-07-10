/*
After executing this script, you must set the correct tenant_dbid fields in following tables
- cfg_activity
- blacklist_group
- cfg_work_period
- wfm_treatment
- wfm_mop

*/

CREATE TABLE `cfg_language` (
  `DBID` int(11) NOT NULL auto_increment,
  `KEY_WORD` varchar(255) character set latin1 collate latin1_bin default NULL,
  `ENGLISH` varchar(255) default NULL,
  `FRENCH` varchar(255) default NULL,
  `ESPAGNOL` varchar(255) default NULL,
  PRIMARY KEY  (`DBID`),
  UNIQUE KEY `DBID` (`DBID`),
  UNIQUE KEY `KEY_WORD` (`KEY_WORD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `cfg_predefined_user_roles` (
  `DBID` int(11) NOT NULL auto_increment,
  `ROLE_NAME` varchar(255) NOT NULL default '',
  `PRIVILEGE_NAME` varchar(255) default NULL,
  PRIMARY KEY  (`DBID`),
  UNIQUE KEY `DBID` (`DBID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `cfg_timezone_info` (
  `NAME` varchar(10) NOT NULL default '',
  `UTC_OFFSET` decimal(5,1) NOT NULL default '0.0',
  `DESCRIPTION` varchar(100) default NULL,
  PRIMARY KEY  (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `cfg_user_authorize_ressources` (
  `DBID` int(11) NOT NULL auto_increment,
  `USER_DBID` int(11) default NULL,
  `RESSOURCE_DBID` int(11) default NULL,
  `RESSOURCE_TYPE` enum('TENANT','AGENTGROUP','CAMPAIGN','ROUTING_SCRIPT','CALLING_LIST') default 'AGENTGROUP',
  PRIMARY KEY  (`DBID`),
  UNIQUE KEY `user_id` (`DBID`),
  UNIQUE KEY `UNIQUE_ID` (`DBID`),
  KEY `USER_DBID` (`USER_DBID`,`RESSOURCE_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `datamart_line_status` (
  `EVENT_TIME` datetime NOT NULL,
  `SERVER_NAME` varchar(50) NOT NULL,
  `CAMPAIGN` varchar(75) NOT NULL,
  `NB_LINES_USED_CAMPAIGN` int(11) NOT NULL default '0',
  `NB_LINES_USED_GLOBAL` int(11) NOT NULL default '0',
  `TOTAL_LINES_AVAILABLE` int(11) NOT NULL default '0',
  PRIMARY KEY  (`EVENT_TIME`,`SERVER_NAME`,`CAMPAIGN`)
) ENGINE=MyISAM;


ALTER TABLE `black_list_group` ADD COLUMN `TENANT_DBID` INTEGER(11) DEFAULT NULL;
ALTER TABLE `cfg_activity` ADD COLUMN `TENANT_DBID` INTEGER(11) DEFAULT NULL;
ALTER TABLE `cfg_agent_prefer_sites` MODIFY COLUMN `AGENT_LOGINID` VARCHAR(30) DEFAULT NULL;
ALTER TABLE `cfg_black_list` MODIFY COLUMN `MATCH_TYPE` ENUM('EQUALS','START_WITH','END_WITH','CONTAINS') DEFAULT NULL;
ALTER TABLE `cfg_campaign` ADD COLUMN `leave_message` TINYINT(1) DEFAULT '0';
ALTER TABLE `cfg_routing_script` MODIFY COLUMN `SCRIPT_NAME` VARCHAR(30) DEFAULT NULL;
ALTER TABLE `cfg_switch` ADD COLUMN `NUMBER_OF_LINES` VARCHAR(10) DEFAULT NULL;
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_CONFIGURATION_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_TENANT_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_USER_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_NETWORK_CONFIGURATION` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_TENANT_VIEW` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_RESSOURCES_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_AGENT_GROUPS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_AGENT_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_CAMPAIGN_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_CALLING_LIST_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_DONOTCALL_LIST_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_FILTER_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_TREATMENTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_NOT_READY_REASON_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_QUEUES_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_SKILLS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_QUALITY_MONITORING_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_WORK_FORCE_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_FINANCIAL_CONFIGURATION` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_ROUTING_SCRIPT_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_FINANCIAL_REPORTS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_VIEW_LIVE_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_VIEW_AGENT_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_VIEW_AGENTGROUP_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_VIEW_QUEUES_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_VIEW_CAMPAIGN_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_VIEW_CALLING_LIST_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_VIEW_PERFOMANCE_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_VIEW_TEAM_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_VIEW_ADHERENCE_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_MANAGER_CHANGE_AGENT_STATUS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_MANAGER_LOGGED_OUT_AGENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_MANAGER_LIVE_MONITORING` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_MANAGER_WHISPER_TOAGENT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_MANAGER_WHISPER_TOCUSTOMER` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_PAYROLL_INFORMATION_REPORT` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_user` ADD COLUMN `ALLOW_RIGHT_CLICK_AGENT_STATS` ENUM('no','yes') DEFAULT 'no';
ALTER TABLE `cfg_work_period` ADD COLUMN `TENANT_DBID` INTEGER(11) DEFAULT NULL;
ALTER TABLE `datamart_cmp_info_no_agg` MODIFY COLUMN `DNIS` VARCHAR(20) DEFAULT NULL;
ALTER TABLE `datamart_cmp_info_no_agg` ADD COLUMN `N_RESERVED` INTEGER(11) DEFAULT NULL;
ALTER TABLE `datamart_cmp_info_no_agg` ADD COLUMN `T_RESERVED` INTEGER(11) DEFAULT NULL;
ALTER TABLE `qms_agent_conversation` MODIFY COLUMN `AGT_ID` VARCHAR(50) DEFAULT NULL;
ALTER TABLE `qms_agent_conversation` MODIFY COLUMN `TRACKNUM` VARCHAR(50) DEFAULT NULL;
ALTER TABLE `wfm_mop` ADD COLUMN `TENANT_DBID` INTEGER(11) DEFAULT NULL;
ALTER TABLE `wfm_treatment` ADD COLUMN `TENANT_DBID` INTEGER(11) DEFAULT NULL;
ALTER TABLE `cfg_agent_group` ADD KEY `NAME` (`NAME`);
ALTER TABLE `datamart_adherence_details` ADD KEY `GRP_DBID` (`GRP_DBID`);
ALTER TABLE `datamart_adherence_details` ADD KEY `LOGIN_ID` (`LOGIN_ID`);
ALTER TABLE `datamart_agent_sales` ADD KEY `AGENT_DBID` (`AGENT_DBID`);
ALTER TABLE `datamart_agent_sales` ADD KEY `GROUP_DBID` (`GROUP_DBID`);
ALTER TABLE `datamart_cmp_call_list_resume` ADD KEY `LIST_NAME` (`LIST_NAME`(20));
ALTER TABLE `datamart_cmp_info_no_agg` ADD KEY `GRP_DBID` (`GRP_DBID`);
ALTER TABLE `datamart_cmp_info_no_agg` ADD KEY `DNIS` (`DNIS`);
ALTER TABLE `datamart_cmp_info_no_agg` ADD KEY `AGENT_ID` (`AGENT_ID`);
ALTER TABLE `datamart_not_ready_reason` ADD KEY `GRP_DBID` (`GRP_DBID`);
ALTER TABLE `datamart_not_ready_reason` ADD KEY `EVENT_TIME` (`EVENT_TIME`);
ALTER TABLE `datamart_not_ready_reason` ADD KEY `AGENT_ID` (`AGENT_ID`);
ALTER TABLE `datamart_queue_resume` ADD KEY `DNIS` (`DNIS`);
ALTER TABLE `datamart_tmp_event` ADD KEY `event_time` (`event_time`);
ALTER TABLE `datamart_tmp_event` ADD KEY `agent_id` (`agent_id`);
ALTER TABLE `datamart_tmp_event` ADD KEY `previousEvent` (`previousEvent`);
ALTER TABLE `ref_campaign_list_hours` ADD KEY `campaign_name` (`campaign_name`(20));
ALTER TABLE `wfm_details` ADD KEY `AGENT_DBID` (`AGENT_DBID`);
ALTER TABLE `wfm_details` ADD KEY `BEGIN_TIME` (`START_TIME`);


UPDATE cfg_user
SET ALLOW_CONFIGURATION_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_TENANT_MANAGEMENT=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
ELSE 'no'
END,
ALLOW_USER_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE 'no'
END,
ALLOW_NETWORK_CONFIGURATION =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
ELSE 'no'
END,
ALLOW_TENANT_VIEW =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_RESSOURCES_MANAGEMENT=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_AGENT_GROUPS_MANAGEMENT=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_AGENT_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_CAMPAIGN_MANAGEMENT  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_CALLING_LIST_MANAGEMENT=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_DONOTCALL_LIST_MANAGEMENT=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_FILTER_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_TREATMENTS_MANAGEMENT  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_NOT_READY_REASON_MANAGEMENT  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_QUEUES_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_SKILLS_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_ROUTING_SCRIPT_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_QUALITY_MONITORING_MANAGEMENT  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'			/* Viewer */
ELSE  'no'
END,
ALLOW_WORK_FORCE_MANAGEMENT  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_REPORTS_MANAGEMENT=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
ELSE  'no'
END,
ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_FINANCIAL_CONFIGURATION =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END, 
ALLOW_FINANCIAL_REPORTS =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_VIEW_LIVE_STATS=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_VIEW_AGENT_STATS  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_VIEW_AGENTGROUP_STATS=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_VIEW_QUEUES_STATS  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_VIEW_CAMPAIGN_STATS=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_VIEW_CALLING_LIST_STATS =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_VIEW_PERFOMANCE_STATS =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_VIEW_TEAM_STATS =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_VIEW_ADHERENCE_STATS  =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
WHEN ROLE='30' THEN 'yes'			/* Historical Reports */
WHEN ROLE='40' THEN 'yes'			/* Quality Monitoring */
WHEN ROLE=50 THEN 'yes'				/* Viewer */
ELSE  'no'
END,
ALLOW_MANAGER_CHANGE_AGENT_STATUS=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_MANAGER_LOGGED_OUT_AGENT =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_MANAGER_LIVE_MONITORING=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_MANAGER_WHISPER_TOAGENT=
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END,
ALLOW_MANAGER_WHISPER_TOCUSTOMER =
CASE
WHEN ROLE='10' THEN 'yes'			/* Super admin*/
WHEN ROLE='20' THEN 'yes'			/* Admin */
ELSE  'no'
END;



/*Tenants rights for all non-admin users */
INSERT INTO cfg_user_authorize_ressources (user_dbid, ressource_dbid, ressource_type)
	SELECT cfg_user.dbid, cfg_user.tenant_dbid, 'TENANT' FROM cfg_user WHERE ROLE IN('30', '40', '50');

/*Agent groups rights for all non-admin users */
INSERT INTO cfg_user_authorize_ressources (user_dbid, ressource_dbid, ressource_type)
	SELECT cfg_user_authorize_group.user_dbid, cfg_user_authorize_group.group_dbid, 'AGENTGROUP' FROM cfg_user_authorize_group INNER JOIN cfg_agent_group
		ON cfg_user_authorize_group.user_dbid = cfg_agent_group.dbid;

/*Give admins access to all tenants */		
INSERT INTO cfg_user_authorize_ressources (user_dbid, ressource_dbid, ressource_type)
	SELECT  cfg_user.dbid , cfg_tenant_info.dbid, 'TENANT'  FROM cfg_tenant_info, cfg_user WHERE cfg_user.role IN ('10', '20');

/*Give admins access to all agent group*/
INSERT INTO cfg_user_authorize_ressources (user_dbid, ressource_dbid, ressource_type)
	SELECT cfg_user.dbid, cfg_agent_group.dbid, 'AGENTGROUP' FROM cfg_agent_group, cfg_user WHERE cfg_user.role IN ('10', '20');

/*Give admins access to all campaigns*/	
INSERT INTO cfg_user_authorize_ressources (user_dbid, ressource_dbid, ressource_type)
	SELECT cfg_user.dbid, cfg_campaign.dbid, 'CAMPAIGN' FROM cfg_campaign, cfg_user WHERE cfg_user.role IN ('10', '20');

/*Give admins access to all calling lists*/	
INSERT INTO cfg_user_authorize_ressources (user_dbid, ressource_dbid, ressource_type)
	SELECT cfg_user.dbid, cfg_calling_list.dbid, 'CALLING_LIST' FROM cfg_calling_list, cfg_user WHERE cfg_user.role IN ('10', '20');

/*Give admins access to all routing scripts*/		
INSERT INTO cfg_user_authorize_ressources (user_dbid, ressource_dbid, ressource_type)
	SELECT cfg_user.dbid, cfg_routing_script.dbid, 'ROUTING_SCRIPT' FROM cfg_routing_script, cfg_user WHERE cfg_user.role IN ('10', '20');
	


	
INSERT INTO `cfg_timezone_info` (`NAME`, `UTC_OFFSET`, `DESCRIPTION`) VALUES 
  ('NST',-3.5,'America / Newfoundland Standard Time'),
  ('AST',-4,'America / Atlantic Standard Time'),
  ('ADT',-3,'America / Atlantic Daylight Time'),
  ('EST',-5,'America / Eastern Standard Time'),
  ('EDT',-4,'America / Eastern Daylight Time'),
  ('CST',-6,'America / Central Standard Time'),
  ('CDT',-5,'America / Central Daylight Time'),
  ('MST',-7,'America / Mountain Standard Time'),
  ('MDT',-6,'America / Mountain Daylight Time'),
  ('PST',-8,'America / Pacific Standard Time'),
  ('PDT',-7,'America / Pacific Daylight Time'),
  ('AKST',-9,'America / Alaska Standard Time'),
  ('AKDT',-8,'America / Alaska Daylight Time'),
  ('HAST',-10,'Hawaii / Aleutian Standard Time'),
  ('HADT',-9,'Hawaii / Aleutian Daylight Time'),
  ('GMT',0,'Greenwich Mean Time'),
  ('UTC',0,'Universal Time Coordinated'),
  ('BST',1,'Europe / British Summer Time'),
  ('IST',1,'Europe / Irish Summer Time'),
  ('WET',0,'Europe / Western European Time'),
  ('WEST',1,'Europe / Western European Summer Time'),
  ('CET',1,'Europe / Central European Time'),
  ('CEST',2,'Europe / Central European Summer Time'),
  ('EET',2,'Europe / Eastern European Time'),
  ('EEST',3,'Europe / Eastern European Summer Time'),
  ('NFT',11.5,'Australia / Norfolk Time'),
  ('AEST',10,'Australia / Australian Eastern Standard Time'),
  ('AEDT',11,'Australia / Australian Eastern Daylight Time'),
  ('ACST',10,'Australia / Australian Central Standard Time'),
  ('ACDT',11,'Australia / Australian Central Daylight Time'),
  ('AWST',8,'Australia / Australian Western Standard Time'),
  ('CXT',7,'Christmas Island Time (Indian Ocean)'),
  ('MPT',10,'Pacific / North Mariana Islands Time'),
  ('CLT',-4,'America / Chile Time'),
  ('ECT',-5,'America / Ecuador Time'),
  ('PHT',8,'Asia / Philippine Time');

    INSERT INTO `cfg_predefined_user_roles` (`ROLE_NAME`, `PRIVILEGE_NAME`) VALUES
      ('Outbound Manager','ALLOW_AGENT_GROUPS_MANAGEMENT'),
      ('Super Administrator','ALLOW_AGENT_GROUPS_MANAGEMENT'),
      ('Administrator','ALLOW_AGENT_GROUPS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_AGENT_MANAGEMENT'),
      ('Administrator','ALLOW_AGENT_MANAGEMENT'),
      ('Super Administrator','ALLOW_AGENT_MANAGEMENT'),
      ('Super Administrator','ALLOW_CALLING_LIST_MANAGEMENT'),
      ('Administrator','ALLOW_CALLING_LIST_MANAGEMENT'),
      ('Outbound Manager','ALLOW_CALLING_LIST_MANAGEMENT'),
      ('Administrator','ALLOW_CAMPAIGN_MANAGEMENT'),
      ('Super Administrator','ALLOW_CAMPAIGN_MANAGEMENT'),
      ('Outbound Manager','ALLOW_CAMPAIGN_MANAGEMENT'),
      ('Administrator','ALLOW_CONFIGURATION_MANAGEMENT'),
      ('Super Administrator','ALLOW_CONFIGURATION_MANAGEMENT'),
      ('Super Administrator','ALLOW_DONOTCALL_LIST_MANAGEMENT'),
      ('Administrator','ALLOW_DONOTCALL_LIST_MANAGEMENT'),
      ('Outbound Manager','ALLOW_DONOTCALL_LIST_MANAGEMENT'),
      ('Administrator','ALLOW_FILTER_MANAGEMENT'),
      ('Outbound Manager','ALLOW_FILTER_MANAGEMENT'),
      ('Super Administrator','ALLOW_FILTER_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_AGENTGROUPS_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_AGENTINBOUND_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_AGENTLOGIN_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_AGENTOUTBOUND_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_AGENTS_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_AGENTSUMMARY_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_CALLINGLIST_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_CAMPAIGN_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_QUEUES_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_HISTORICAL_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_HISTORICAL_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_HISTORICAL_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_HISTORICAL_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_MANAGER_CHANGE_AGENT_STATUS'),
      ('Coach','ALLOW_MANAGER_CHANGE_AGENT_STATUS'),
      ('Super Administrator','ALLOW_MANAGER_CHANGE_AGENT_STATUS'),
      ('Coach','ALLOW_MANAGER_LIVE_MONITORING'),
      ('Super Administrator','ALLOW_MANAGER_LIVE_MONITORING'),
      ('Administrator','ALLOW_MANAGER_LIVE_MONITORING'),
      ('Administrator','ALLOW_MANAGER_LOGGED_OUT_AGENT'),
      ('Super Administrator','ALLOW_MANAGER_LOGGED_OUT_AGENT'),
      ('Coach','ALLOW_MANAGER_LOGGED_OUT_AGENT'),
      ('Super Administrator','ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP'),
      ('Administrator','ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP'),
      ('Coach','ALLOW_MANAGER_LOGGED_OUT_AGENTGROUP'),
    # ('Coach','ALLOW_MANAGER_WHISPER_TOAGENT'),
    # ('Administrator','ALLOW_MANAGER_WHISPER_TOAGENT'),
    # ('Super Administrator','ALLOW_MANAGER_WHISPER_TOAGENT'),
    # ('Coach','ALLOW_MANAGER_WHISPER_TOCUSTOMER'),
    # ('Super Administrator','ALLOW_MANAGER_WHISPER_TOCUSTOMER'),
    # ('Administrator','ALLOW_MANAGER_WHISPER_TOCUSTOMER'),
      ('Financial Manager','ALLOW_FINANCIAL_CONFIGURATION'),
      ('Administrator','ALLOW_MOP_MANAGEMENT'),
      ('Super Administrator','ALLOW_MOP_MANAGEMENT'),
      ('Super Administrator','ALLOW_NETWORK_CONFIGURATION'),
      ('Super Administrator','ALLOW_NOT_READY_REASON_MANAGEMENT'),
      ('Outbound Manager','ALLOW_NOT_READY_REASON_MANAGEMENT'),
      ('Administrator','ALLOW_NOT_READY_REASON_MANAGEMENT'),
      ('Financial Manager','ALLOW_FINANCIAL_REPORTS'),
      ('Super Administrator','ALLOW_PAYROLL_INFORMATION_REPORT'),
      ('Administrator','ALLOW_PAYROLL_INFORMATION_REPORT'),
      ('Super Administrator','ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_QUALITY_MONITORING_AGENTCONVERSATION_REPORTS_MANAGEMENT'),
      ('Historical Reports','ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT'),
      ('Administrator','ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_QUALITY_MONITORING_AGENTLISTENING_REPORTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_QUALITY_MONITORING_MANAGEMENT'),
      ('Administrator','ALLOW_QUALITY_MONITORING_MANAGEMENT'),
      ('Historical Reports','ALLOW_QUALITY_MONITORING_MANAGEMENT'),
      ('Outbound Manager','ALLOW_QUALITY_MONITORING_MANAGEMENT'),
      ('Administrator','ALLOW_QUEUES_MANAGEMENT'),
      ('Super Administrator','ALLOW_QUEUES_MANAGEMENT'),
      ('Outbound Manager','ALLOW_QUEUES_MANAGEMENT'),
      ('Super Administrator','ALLOW_RESSOURCES_MANAGEMENT'),
      ('Outbound Manager','ALLOW_RESSOURCES_MANAGEMENT'),
      ('Administrator','ALLOW_RESSOURCES_MANAGEMENT'),
      ('Administrator','ALLOW_ROUTING_SCRIPT_MANAGEMENT'),
      ('Super Administrator','ALLOW_ROUTING_SCRIPT_MANAGEMENT'),
      ('Administrator','ALLOW_SKILLS_MANAGEMENT'),
      ('Super Administrator','ALLOW_SKILLS_MANAGEMENT'),
      ('Super Administrator','ALLOW_TENANT_MANAGEMENT'),
      ('Outbound Manager','ALLOW_TENANT_VIEW'),
      ('Administrator','ALLOW_TENANT_VIEW'),
      ('Super Administrator','ALLOW_TENANT_VIEW'),
      ('Super Administrator','ALLOW_TREATMENTS_MANAGEMENT'),
      ('Outbound Manager','ALLOW_TREATMENTS_MANAGEMENT'),
      ('Administrator','ALLOW_TREATMENTS_MANAGEMENT'),
      ('Super Administrator','ALLOW_USER_MANAGEMENT'),
      ('Administrator','ALLOW_USER_MANAGEMENT'),
      ('Super Administrator','ALLOW_VIEW_ADHERENCE_STATS'),
      ('Outbound Manager','ALLOW_VIEW_ADHERENCE_STATS'),
      ('Statistics Viewer','ALLOW_VIEW_ADHERENCE_STATS'),
      ('Coach','ALLOW_VIEW_ADHERENCE_STATS'),
      ('Administrator','ALLOW_VIEW_ADHERENCE_STATS'),
      ('Administrator','ALLOW_VIEW_AGENT_STATS'),
      ('Statistics Viewer','ALLOW_VIEW_AGENT_STATS'),
      ('Outbound Manager','ALLOW_VIEW_AGENT_STATS'),
      ('Super Administrator','ALLOW_VIEW_AGENT_STATS'),
      ('Coach','ALLOW_VIEW_AGENT_STATS'),
      ('Outbound Manager','ALLOW_VIEW_AGENTGROUP_STATS'),
      ('Statistics Viewer','ALLOW_VIEW_AGENTGROUP_STATS'),
      ('Administrator','ALLOW_VIEW_AGENTGROUP_STATS'),
      ('Coach','ALLOW_VIEW_AGENTGROUP_STATS'),
      ('Super Administrator','ALLOW_VIEW_AGENTGROUP_STATS'),
      ('Administrator','ALLOW_VIEW_CALLING_LIST_STATS'),
      ('Outbound Manager','ALLOW_VIEW_CALLING_LIST_STATS'),
      ('Super Administrator','ALLOW_VIEW_CALLING_LIST_STATS'),
      ('Coach','ALLOW_VIEW_CALLING_LIST_STATS'),
      ('Statistics Viewer','ALLOW_VIEW_CALLING_LIST_STATS'),
      ('Statistics Viewer','ALLOW_VIEW_CAMPAIGN_STATS'),
      ('Coach','ALLOW_VIEW_CAMPAIGN_STATS'),
      ('Super Administrator','ALLOW_VIEW_CAMPAIGN_STATS'),
      ('Administrator','ALLOW_VIEW_CAMPAIGN_STATS'),
      ('Outbound Manager','ALLOW_VIEW_CAMPAIGN_STATS'),
      ('Super Administrator','ALLOW_VIEW_LIVE_STATS'),
      ('Administrator','ALLOW_VIEW_LIVE_STATS'),
      ('Outbound Manager','ALLOW_VIEW_LIVE_STATS'),
      ('Statistics Viewer','ALLOW_VIEW_LIVE_STATS'),
      ('Coach','ALLOW_VIEW_LIVE_STATS'),
      ('Coach','ALLOW_VIEW_PERFOMANCE_STATS'),
      ('Super Administrator','ALLOW_VIEW_PERFOMANCE_STATS'),
      ('Statistics Viewer','ALLOW_VIEW_PERFOMANCE_STATS'),
      ('Administrator','ALLOW_VIEW_PERFOMANCE_STATS'),
      ('Outbound Manager','ALLOW_VIEW_PERFOMANCE_STATS'),
      ('Administrator','ALLOW_VIEW_QUEUES_STATS'),
      ('Outbound Manager','ALLOW_VIEW_QUEUES_STATS'),
      ('Super Administrator','ALLOW_VIEW_QUEUES_STATS'),
      ('Statistics Viewer','ALLOW_VIEW_QUEUES_STATS'),
      ('Coach','ALLOW_VIEW_QUEUES_STATS'),
      ('Coach','ALLOW_VIEW_TEAM_STATS'),
      ('Outbound Manager','ALLOW_VIEW_TEAM_STATS'),
      ('Administrator','ALLOW_VIEW_TEAM_STATS'),
      ('Statistics Viewer','ALLOW_VIEW_TEAM_STATS'),
      ('Super Administrator','ALLOW_VIEW_TEAM_STATS'),
      ('Historical Reports','ALLOW_WORK_FORCE_MANAGEMENT'),
      ('Administrator','ALLOW_WORK_FORCE_MANAGEMENT'),
      ('Historical Reports','ALLOW_TENANT_VIEW'),
      ('Financial Manager','ALLOW_TENANT_VIEW'),
      ('Super Administrator','ALLOW_WORK_FORCE_MANAGEMENT'),
      ('Super Administrator','ALLOW_FINANCIAL_CONFIGURATION'),
      ('Super Administrator','ALLOW_FINANCIAL_REPORTS'),
      ('Administrator','ALLOW_FINANCIAL_CONFIGURATION'),
      ('Administrator','ALLOW_FINANCIAL_REPORTS');



INSERT INTO `cfg_language` (`KEY_WORD`, `ENGLISH`, `FRENCH`, `ESPAGNOL`) VALUES 
  ('graphloadingmessage','Creating Chart - Please Wait','En cours de production du diagramme - veuillez patienter','Produciendo el diagrama - favor de esperar'),
  ('calls','Calls','Appels','Llamadas'),
  ('inbound','Inbound','Entrant','Entrante'),
  ('outbound','Outbound','Sortant','Saliente'),
  ('wrapup','WrapUp','Post-appel','Post llamada'),
  ('hold','Hold','Garde','Retenci�n'),
  ('waiting','Waiting','En attente','Esperando'),
  ('notready','Not ready','Pas pr�t','No listo'),
  ('singletransfer','Single transfer','Transfert en une �tape','Transferencia monoetapa'),
  ('twosteptransfer','Two-step transfer','Transfert � deux �tapes','Transferencia en dos etapas'),
  ('otherstatistics','Other statistics','Autres statistiques','Otras estad�sticas'),
  ('scheduledtime','Scheduled time','Temps pr�vu','Tiempo previsto'),
  ('login','Login','Nom d\'usager','Usuario'),
  ('adherence','Adherence','Adh�sion','Conformidad'),
  ('logintime','Login time','Temps en session','Tiempo en sesi�n'),
  ('Agent','Agent','Agent','Agente'),
  ('Active','Active','Actif','Activo'),
  ('Configuration','Configuration','Configuration','Configuraci�n'),
  ('Tenant Management','Tenant management','Gestion des clients','Gesti�n de los clientes'),
  ('Add tenant','Add tenant','Ajouter un client','A�adir un cliente'),
  ('User Management','User management','Gestion des utilisateurs','Gesti�n de los usuarios'),
  ('Add a user','Add a user','Ajouter un utilisateur','A�adir un usuario'),
  ('Add','Add','Ajouter','A�adir'),
  ('Active Users','Active users','Utilisateurs actifs','Usuarios activos'),
  ('Inactive Users','Inactive users','Utilisateurs inactifs','Usuarios Inactivos'),
  ('Switches','Switches','Commutateurs','Conmutadores'),
  ('Add a switch','Add a switch','Ajouter un commutateur','A�adir un conmutador'),
  ('Network Configuration','Network configuration','Configuration du r�seau','Configuraci�n de la red'),
  ('Resources','Resources','Ressources','Recursos'),
  ('Agent Groups','Agent&nbsp;Groups','Groupes&nbsp;d\'agents','Grupos&nbsp;de&nbsp;agentes'),
  ('Agent group','Agent group','Groupe d\'agents','Grupo de agentes'),
  ('Add agent group','Add agent group','Ajouter un groupe d�agents','A�adir un grupo de agentes'),
  ('Active agent group','Active agent group','Groupes d\'agents actifs','Grupos de agentes activos'),
  ('Inactive agent group','Inactive agent group','Groupes d\'agents inactifs','Grupos de agentes inactivos'),
  ('Agents','Agents','Agents','Agentes'),
  ('Performance','Performance','Rendement','Rendimiento'),
  ('Add agent','Add agent','Ajouter un agent','A�adir un agente'),
  ('Active agents','Active agents','Agents actifs','Agentes activos'),
  ('Inactive agents','Inactive agents','Agents inactifs','Agentes inactivos'),
  ('Campaigns','Campaigns','Campagnes','Campa�as'),
  ('Campaign','Campaign','Campagne','Campa�a'),
  ('Add campaigns','Add campaigns','Ajouter une campagne','A�adir una campa�a'),
  ('Active campaigns','Active campaigns','Campagnes actives','Campa�as activas'),
  ('Inactive campaigns','Inactive campaigns','Campagnes inactives','Campa�as inactivas'),
  ('Calling lists','Calling&nbsp;Lists','Listes&nbsp;d�appel','Listas&nbsp;de&nbsp;llamada'),
  ('Add calling list','Add calling list','Ajouter une liste d\'appel','A�adir una lista de llamada'),
  ('Add lists','Add lists','Ajouter listes','A�adir listas'),
  ('Active lists','Active lists','Listes actives','Listas activas'),
  ('Inactive lists','Inactive lists','Listes inactives','Listas inactivas'),
  ('Filters','Filters','Filtres','Filtros'),
  ('Add filter','Add filter','Ajouter un filtre','A�adir un filtro'),
  ('Active filter','Active filter','Filtre actif','Filtro activo'),
  ('Inactive filter','Inactive filter','Filtre inactif','Filtro inactivo'),
  ('Treatments','Treatments',' Traitements','Tratamientos'),
  ('Add treatment','Add treatment','Ajouter un traitement','A�adir un tratamiento'),
  ('Active Treatments','Active Treatments','Traitements actifs','Tratamientos activos'),
  ('Inactive Treatments','Inactive Treatments','Traitements inactifs','Trantamientos inactivos'),
  ('Historical Reports','Historical reports','Rapports historiques','Informes de datos hist�ricos'),
  ('Agent Details Reports','Agent details reports',' Rapports sur les agents','Informes sobre los agentes'),
  ('Agent Groups Reports','Agent group reports','Rapports sur les groupes d�agents','Informes sobre los grupos de agentes'),
  ('Inbound Calls Reports','Inbound calls reports','Rapports sur les appels entrants','Informes sobre las llamadas'),
  ('Agent Login Reports','Agent login reports','Rapports sur les conexions d�agent','Informes sobre las conexiones de los agentes'),
  ('Campaign Reports','Campaign reports','Rapports sur les campagnes','Informes sobre las campa�as'),
  ('Calling List Reports','Calling list reports','Rapport sur les listes d�appel','Informes sobre las listas de llamada'),
  ('Queue Reports','Queue reports','Rapports sur les files d\'attente','Informes sobre las colas'),
  ('Reports','Reports','Rapports','Informes'),
  ('Report','Report','Rapport','Informe'),
  ('Quality Monitoring','Quality monitoring','Contr�le de la qualit�','Supervisi�n de la calidad'),
  ('Agent\'s Conversation','Agent\'s conversation','Conversation de l\'agent','Conversaci�n del agente'),
  ('Financial Reports','Financial Reports','Rapports financiers','Informes financieros'),
  ('Teams','Teams','�quipes','Equipos'),
  ('Add a team','Add a team','Ajouter une �quipe','A�adir un equipo'),
  ('Add team','Add team','Ajouter �quipe','A�adir equipo'),
  ('Adherence','Adherence','Adh�sion','Conformidad'),
  ('Real Time Adherence','Real time adherence','Adh�sion en temps r�el','Conformidad en tiempo real'),
  ('View Adherence Graph','View adherence graph','Graphique d\'adh�sion','Gr�fico de conformidad'),
  ('Adherence Report','Adherence report','Rapport sur l\'adh�sion','Informe sobre la conformidad'),
  ('Methods Of Payment','Methods of payment','M�thodes de paiement','M�todos de pago'),
  ('Login & Production time','Login & Production time','Temps en session et en production','Tiempo en sesi�n y en producci�n'),
  ('Scripts','Scripts','Scripts','Scripts'),
  ('Routing scripts','Routing scripts','Scripts d\'acheminement','Scripts de encaminamiento'),
  ('Routing script','Routing script','Script d\'acheminement','Script de encaminamiento'),
  ('ROUTING SCRIPT','ROUTING SCRIPT','SCRIPT D\'ACHEMINEMENT','SCRIPT DE ENCAMINAMIENTO'),
  ('Add Routing Script','Add routing script','Ajouter un script d\'acheminement','A�adir un script de encaminamiento'),
  ('Skills','Skills','Comp�tences','Habilidades'),
  ('Add skills','Add skills','Ajouter comp�tences','A�adir habilidades'),
  ('Active scripts','Active scripts','Scripts actifs','Scripts activos'),
  ('Inactive scripts','Inactive scripts','Scripts inactifs','Scripts inactivos'),
  ('StarPhone Settings','StarPhone settings','Configuration du StartPhone','Configuraci�n de StartPhone'),
  ('StarPhone','StarPhone','StartPhone','StartPhone'),
  ('StarPhone AutoUpdate Settings','StarPhone AutoUpdate settings','Mise � jour automatique du StarPhone','Actualizaci�n autom�tica de StartPhone'),
  ('AheevaPhone configuration','AheevaPhone configuration','Configuration du AheevaPhone','Configuraci�n del AheevaPhone'),
  ('Live monitoring','Live monitoring','Surveillance en temps r�el','Supervisi�n en tiempo real'),
  ('Queues','Queues','Files d\'attente','Colas'),
  ('Payroll configuration','Payroll configuration','Configuration des salaires','Configuraci�n de los salarios'),
  ('Payroll Information Report','Payroll Information Report','Rapports sur les salaires','Informe sobre los salarios'),
  ('Activity','Activity','Activit�','Actividad'),
  ('Activity name1','Activity name','Nom de l\'activit�','Nombre de la actividad'),
  ('Add an activity','Add an activity','Ajouter activit�','A�adir actividad'),
  ('Current activities','Current activities','Activit�s courantes','Actividades actuales'),
  ('Do-not-call lists','Do-not-call lists','Listes Ne-pas-appeler','Listas No-llamar'),
  ('Current do-not-call lists','Current do-not-call lists','Listes Ne-pas-appeler courantes','Listas No-llamar actuales'),
  ('Actions on do-not-call lists','Actions on do-not-call lists','Actions associ�es aux listes','Acciones relacionadas con las listas'),
  ('Create a do-not-call list','Create a Do-not-call list','Cr�er liste Ne-pas-appeler','Crear lista No-llamar'),
  ('Add numbers to Do-not-call list','Add numbers to Do-not-call list','Ajouter num�ros � la liste','A�adir n�meros a la lista'),
  ('Search campaign for Do-not-call list number','Search campaign for Do-not-call list number','Recherche de num�ro � Ne-pas-appeler','Buscar n�mero a No-llamar'),
  ('Display Do-not-call list contents','Display Do-not-call list contents','Afficher contenu liste Ne-pas-appeler','Visualizar contenido lista No-llamar'),
  ('Not-ready reasons','Not-ready reasons','Raisons Pas-pr�t','Motivos No-listo'),
  ('Add Not-ready reason','Add Not-ready reason','Ajouter raison Pas-pr�t','A�adir motivo No-listo'),
  ('Active Not-ready reasons','Active Not-ready reasons','Raisons Pas-pr�t actives','Motivos No-listo activos'),
  ('Inactive Not-ready reasons','Inactive Not-ready reasons','Raisons Pas-pr�t inactives','Motivos No-listo inactivos'),
  ('Outbound call reports','Outbound call reports','Rapports sur les appels sortants','Informes sobre llamadas salientes'),
  ('Agent summary reports','Agent summary reports','Rapports sommaires sur les agents','Informes sumarios sobre agentes'),
  ('Agent listening report','Agent listening report','Rapport d\'�coute d\'agent','Informe sobre escucha de agente'),
  ('Agent group queues','Agent group queues','Files d\'attente pour groupe d\'agents','Colas para grupo de agentes'),
  ('Routing script queues','Routing script queues','Files d\'attente pour script d\'acheminement','Colas para script de encaminamiento'),
  ('Payroll information','Payroll information','Donn�es salariales','Datos salariales'),
  ('Commissions','Commissions','Commissions','Comisiones'),
  ('Commissions settings','Commissions settings','Param�tres de commission','Par�metros de comisi�n'),
  ('Choose commission type','Choose commission type','S�lectionner type de commission','Seleccionar tipo de comisi�n'),
  ('Add commission','Add commission','Ajouter commission','A�adir comisi�n'),
  ('Active commissions','Active commissions','Commissions actives','Comisiones activas'),
  ('Inactive commissions','Inactive commissions','Commissions inactives','Comisiones inactivas'),
  ('Add Method of Payment','Add Method of Payment','Ajouter m�thode de paiement','A�adir m�todo de pago'),
  ('Active MOPs','Active MOPs','M�thodes actives','M�todos activos'),
  ('Inactive MOPs','Inactive MOPs','M�thodes inactives','M�todos inactivos'),
  ('Schedule','Schedule','Horaire','Horario'),
  ('Add schedules','Add schedules','Ajouter horaires','A�adir horario'),
  ('View published schedules','View published schedules','Afficher horaires publi�s','Visualizar horarios publicados'),
  ('Scheduled agents\' report','Scheduled agents\' report','Rapport sur les horaires planifi�s','Informe sobre horarios programados'),
  ('Name','Name','Nom','Nombre'),
  ('Submit','Submit','Envoyer','Enviar'),
  ('Tenant name','Tenant name','Nom du client','Nombre del cliente'),
  ('already exists. Please retry','already exists. \n Please retry !','existe d�j�. \n Veuillez essayer � nouveau.','existe ya. �Revise por favor!'),
  ('Please enter tenant name','Please enter tenant name','Veuillez entrer le nom du client','Favor de introducir el nombre del cliente'),
  ('Invalid use of character','Invalid use of character','Usage non valide de caract�re','Uso inv�lido de car�cter'),
  ('Modify tenant name','Modify tenant name','Modifier le nom du client','Modificar el nombre del cliente'),
  ('Tenant ID','Tenant ID','ID du client','ID del cliente'),
  ('Update','Update','Mettre � jour','Actualizar'),
  ('Delete','Delete','Supprimer','Suprimir'),
  ('No changes to tenant information','No changes to tenant information','Pas de changement aux donn�es sur le client','Ningun cambio a los datos sobre el cliente'),
  ('You are about to delete Tenant','You are about to delete Tenant','Vous �tes sur le point de supprimer le client','Usted est� a punto de suprimir el cliente'),
  ('Do you want to continue','\n Do you want to continue ?','\n Voulez-vous poursuivre?','\n �Usted desea continuar?'),
  ('Specify tenant ID','Specify tenant ID','Indiquer ID du client','Especificar ID del cliente'),
  ('Specify User name','Specify user name','Indiquer nom d\'utilisateur','Especificar nombre de usuario'),
  ('Specify user password','Specify user password','Indiquer mot de passe','Especificar contrase�a'),
  ('Passwords don\'t match','Passwords don\'t match','Mots de passe ne correspondent pas','Contrase�as no corresponden'),
  ('Specify user role','Specify user role','Indiquer r�le utilisateur','Especificar funci�n de usuario'),
  ('User name','User name','Nom d\'utilisateur','Usuario'),
  ('Password','Password','Mot de passe','Contrase�a'),
  ('Retype password','Retype password','Resaisir le mot de passe','Escriba de nuevo la contrase�a'),
  ('Privilegies','Privileges','Privil�ges','Privilegios'),
  ('Agent skills','Agent skills','Comp�tences de l\'agent','Capacidades del agente'),
  ('System configurations','System configuration','Configuration du syst�me','Configuraci�n del sistema'),
  ('Configuration management','Configuration management','Gestion de la configuration','Gesti�n de la configuraci�n'),
  ('Tenants and Ressources','Tenants and Resources','Clients service partag� et Ressources','Clientes y Recursos'),
  ('Agents conversation','Agents\' conversation','Conversation des agents','Conversaci�n de los agentes'),
  ('Finances','Finances','Finances','Finanzas'),
  ('Work Force','Work force','Effectifs','Personal'),
  ('Call routing scripts','Routing scripts','Scripts d\'acheminement','Scripts de encaminamiento'),
  ('View live statistics','View live statistics','Afficher statistiques en temps r�el','Visualizar estad�sticas en tiempo real'),
  ('Live statistics','Live statistics','Statistiques en temps r�el','Estad�sticas en tiempo real'),
  ('Manager features','Manager features','Options d\'application','Opciones de aplicaci�n'),
  ('Change agent status','Change agent status','Modifier �tat de l\'agent','Cambiar estado del agente'),
  ('Logged agents out','Agent logged out','D�connecter agent','Desconectar agente'),
  ('Logged agents group out','Agent group logged out','D�connecter groupe agent','Desconectar grupo de agentes'),
  ('Whisper to agent','Whisper to agent','Intervention discr�te agent','Intervenci�n discreta agente'),
  ('Whisper to customer','Whisper to customer','Intervention discr�te client','Intervenci�n discreta cliente'),
  ('Role','Role','R�le','Funci�n'),
  ('Super Admin','Super Admin','Super Admin','Super Admin'),
  ('Admin','Admin','Admin','Admin'),
  ('Viewer','Viewer','Visiteur','Visitante'),
  ('Tenant','Tenant','Client','Cliente'),
  ('Assigned groups','Assigned groups','Groupes affect�s','Grupos asignados'),
  ('Groups','Groups','Groupes','Grupos'),
  ('Available groupes','Available groups','Groupes disponibles','Grupos disponibles'),
  ('Add user','Add user','Ajouter utilisateur','A�adir usuario'),
  ('Passwords doesn\'t match.','Passwords doesn\'t match.','Mots de passe non identiques','Las contrase�as no emparejan'),
  ('You can\'t delete your own user','You can\'t delete your own user','Vous ne pouvez pas supprimer votre nom d\'utilisateur','Usted no puede suprimir su propio usuario'),
  ('This user will be permanently deleted.\n Do you want to continue ?','This user will be permanently deleted.\n Do you want to continue ?','Cet utilisateur va �tre supprimir de fa�on permanente.\n D�sirez-vous poursuivre?','Suprimir�n a este usuario permanentemente.\n �Usted desea continuar?'),
  ('Modify user','Modify user','Modifier utilisateur','Cambiar usuario'),
  ('Delete user','Delete user','Supprimer utilisateur','Suprimir usuario'),
  ('Specify User','Specify User','Indiquer utilisateur','Especificar usuario'),
  ('Specify a numeric login','Specify a numeric login','Indiquer num�ros de connexion','Especificar n�meros de conexi�n'),
  ('Specify a numeric password','Specify a numeric password','Indiquer un mot de passe num�rique','Especificar una contrase�a num�rica'),
  ('This login is already in use','This login is already in use','Ces num�ros de connexion sont d�j� utilis�s','Estos n�meros de conexi�n existen ya'),
  ('Add Live User Monitoring','Add Live User Monitoring','Ajouter la supervision en temps r�el de l\'utilisateur','A�adir la supervisi�n en vivo del usuario'),
  ('Numeric login','Numeric login','Num�ros de connexion','N�meros de conexi�n'),
  ('Numeric Password','Numeric Password','Mot de passe num�rique','Contrase�a num�rica'),
  ('All users already have a live listenning account.\nAdd a new user before.','All users already have a live listenning account.\nAdd a new user before.','Tous les utilisateurs ont d�j� un compte de supervision en temps r�el.\n Ajouter avant un autre utilisateur.','Todos los usuarios tienen una cuenta para la supervisi�n en vivo.\n A�adir antes otro usuario.'),
  ('The IP adress should be like: 192.168.100.100','The IP adress should be like: 192.168.100.100','L\'adresse IP doit �tre sous la forme: 192.168.100.100','La direcci�n IP debe ser de tipo: 192.168.100.100'),
  ('Load balance for outbound must be numeric','Load balance for outbound must be numeric','La valeur d\'�quilibre de charge pour les appels sortants doit �tre num�rique','El valor de equilibrio de carga para las llamadas salientes debe ser num�rico'),
  ('A switch with this IP address already exists.','A switch with this IP address already exists.','Un commutateur avec cette adresse IP existe d�j�.','Un conmutador con esta direcci�n IP existe ya.'),
  ('Load balance for agents can\'t be more than','Load balance for agents can\'t be more than','La valeur d\'�quilibre de charge pour les agents ne peut pas �tre plus que','El valor de equilibrio de carga para los agentes no puede ser m�s que'),
  ('Load balance for outbound can\'t be more than','Load balance for outbound can\'t be more than','La valeur d\'�quilibre de charge pour les appels sortants ne peut pas �tre plus que','El valor de equilibrio de carga para las llamadas salientes no puede ser m�s que'),
  ('Add new switch','Add new switch','Ajouter un commutateur','A�adir un conmutador'),
  ('IP Address','IP Address','Adresse IP','Direcci�n IP'),
  ('Load balance for agents','Load balance for agents','�quilibre de charge pour les agents','Equilibrio de carga para los agentes'),
  ('Load balance for outbound','Load balance for outbound','Equilibre de charge pour les appels sortants','Equilibrio de carga para las llamadas salientes'),
  ('Load balance for agents must be numeric.','Load balance for agents must be numeric.','La valeur d\'�quilibre de charge pour les agents doit �tre num�rique.','El valor de equilibrio de carga para los agentes debe ser num�rico.'),
  ('Network','Network','R�seau','Red'),
  ('Save layout','Save layout','Sauvegarder sch�ma','Guardar el esquema'),
  ('Reset layout','Reset layout','R�initialiser sch�ma','Restablecer el esquema'),
  ('Add site','Add site','Ajouter site','A�adir sitio'),
  ('Servers','Servers','Serveurs','Servidores'),
  ('Services','Services','Services','Servicios'),
  ('Add pbx server','Add PBX server','Ajouter serveur PBX','A�adir servidor PBX'),
  ('Add recording server','Add recording server','Ajouter serveur d\'enregistrement','A�adir servidor de grabaci�n'),
  ('Add encryption server','Add encryption server','Ajouter serveur de chiffrement','A�adir servidor de cifrado'),
  ('Statistics','Statistics','Statistiques','Estad�sticas'),
  ('Internal port:','Internal port:','Port interne:','Puerto interno:'),
  ('External port:','External port:','Port externe:','Puerto externo:'),
  ('Refresh','Refresh','Rafra�chir','Renovar'),
  ('The switch DBID must be numeric','The switch DBID must be numeric','Le commutateur DBID doit �tre num�rique','El conmutador DBID debe ser num�rico'),
  ('You are about to delete this switch. \n Do you want to continue','You are about to delete this switch. \n Do you want to continue?','Vous �tes sur le point de supprimer ce commutateur. \n Voulez-vous poursuivre?','Usted est� a punto de suprimir este conmutador. \n �Usted desea continuar?'),
  ('Modify switch','Modify switch','Modifier le commutateur','Modificar conmutador'),
  ('The port should be numeric','The port should be numeric','Le port doit �tre num�rique','El puerto debe ser num�rico'),
  ('The internal port should be numeric','The internal port should be numeric','Le port interne doit �tre num�rique','El puerto interno debe ser num�rico'),
  ('The external port should be numeric','The external port should be numeric','Le port  externe doit �tre num�rique','El puerto externo debe ser num�rico'),
  ('You must select a site.','You must select a site.','Vous devez s�lectionner un site.','Debe seleccionar un sitio.'),
  ('Modify Auto update Settings','Modify Auto update Settings','Modifier la configuration de mise � jour','Modificar la configuraci�n de actualizaci�n'),
  ('Enable Auto update','Enable Auto update','Permettre mise � jour automatique','Permitir actualizaci�n autom�tica'),
  ('Internal URL','Internal URL:','URL interne:','URL interno:'),
  ('Internal IP','Internal IP:','IP interne:','IP interno:'),
  ('External URL','External URL:','URL externe:','URL externo:'),
  ('Path (relative to WEB ROOT)','Path (relative to WEB ROOT)','Chemin d\'acc�s (relatif au WEB ROOT)','V�a de acceso (en funci�n del WEB ROOT)'),
  ('External IP','External IP:','IP externe:','IP externo:'),
  ('Group name','Group name','Nom du groupe','Nombre del grupo'),
  ('Description','Description','Description','Descripci�n'),
  ('Associated queue','Associated queue','File d\'attente associ�e','Cola relacionada'),
  ('Wrap-up time out','Wrap-up time out','D�lai traitement post-appel','Plazo post-llamada'),
  ('seconds','seconds','secondes','segundos'),
  ('Not ready','Not ready','Pas pr�t','No listo'),
  ('Ready','Ready','Pr�t','Listo'),
  ('Logged out','Logged out','D�connect�','Desconectado'),
  ('Action after Time out','Action after Time out','Action d�lai expir�','Acci�n plazo caducado'),
  ('Max Wrap-up time For Productivity','Max wrap up time for productivity','Temps post-appel max. pour productivit�','Plazo m�ximo post-llamada para productividad'),
  ('Enable Dialing','Enable dialing','Permettre composition','Permitir marcaci�n'),
  ('Agents configuration','Agents configuration','Configuration des agents','Configuraci�n de los agentes'),
  ('Non-configured agent','Non-configured agent','Agent non configur�','Agente no configurado'),
  ('Show agent by ID','Show agent by ID','Montrez agents par ID','Mostrar agentes por ID'),
  ('Assigned agent','Assigned agent','Agent asign�','Agente asignado'),
  ('Not-ready reasons configuration','Not-ready reasons configuration','Configuration raisons Pas-pr�t','Configuraci�n de los motivos No-listo'),
  ('Add a new reason','Add a new reason','Ajouter raison','A�adir motivo'),
  ('Recordings','Recordings','Enregistrements','Registros'),
  ('Recording options','Recording options','Options d\'enregistrement','Opciones de grabaci�n'),
  ('Enable Recording','Enable Recording','Permettre l\'enregistrement','Permitir la grabaci�n'),
  ('Recordings stay local','Recordings stay local','Les enregistrements restent locaux','Las grabaciones permanecen locales'),
  ('Encode Recordings to MP3','Encode Recordings to MP3','Enregistrer les fichiers en MP3','Registrar ficheros en MP3'),
  ('Minimum Recording Time','Minimum Recording Time','Temps d\'enregistrement minimum','Tiempo de grabaci�n m�nimo'),
  ('Maximum Recording Time','Maximum Recording Time','Temps d\'enregistrement maximum','Tiempo de grabaci�n m�ximo'),
  ('Low quality MP3(smaller files)','Low quality MP3 (smaller files)','Basse qualit� MP3 (fichiers plus petits)','MP3 baja calidad (fichero de menor tama�o)'),
  ('High quality MP3(bigger files)','High quality MP3 (bigger files)','Haute qualit� MP3 (fichiers plus gros)','MP3 alta calidad (fichero de mayor tama�o)'),
  ('Enable encryption','Enable encryption','Activer chiffrement','Activar cifrado'),
  ('Encryption','Encryption','Chiffrement','Cifrado'),
  ('Encryption server','Encryption server','Serveur de chiffrement','Servidor de cifrado'),
  ('Encryption method','Encryption method','M�thode de chiffrement','M�todo de cifrado'),
  ('Methods Of Payment info','Methods Of Payment info','Donn�es sur les m�thodes de paiement','Datos sobre m�todos de pago'),
  ('Select MOP','Select MOP','S�lectionner m�thode de paiement','Seleccionar m�todo de pago'),
  ('Override salary','Override salary','Modifier salaire en priorit�','Cambiar salario en prioridad'),
  ('Amount','Amount','Montant','Cantidad'),
  ('Hide statistics','Hide statistics','Masquer statistiques','Ocultar estad�sticas'),
  ('Select all','Select all','Selectioner tous','Seleccionar todos'),
  ('Select none','Select none','Ne rien selectioner','Seleccionar nada'),
  ('General','General','G�n�ralit�s','Generalidades'),
  ('General settings','General settings','Param�tres g�n�raux','Par�metros generales'),
  ('General information','General information','Information g�n�rale','Informaci�n general'),
  ('Personal','Personal','Particularit�s','Particularidades'),
  ('Personal information','Personal information','Information personnelle','Datos personales'),
  ('Group ID','Group ID','ID du groupe','ID del grupo'),
  ('Last name','Last name','Nom de famille','Apellido'),
  ('First name','First name','Pr�nom','Nombre'),
  ('Address','Address','Adresse','Direcci�n'),
  ('City','City','Ville','Ciudad'),
  ('Birth date','Birth date','Date de naissance','Fecha de nacimiento'),
  ('Comments','Comments','Commentaires','Comentarios'),
  ('Start Date','Start Date','Date de d�but','Fecha de comienzo'),
  ('End Date','End Date','Date de fin','Fecha de fin'),
  ('Salary','Salary','Salaire','Salario'),
  ('Site','Site','Site','Sitio'),
  ('Site details','Site details','Donn�es sur le site','Datos sobre el sitio'),
  ('Preferred sites','Preferred sites','Sites privil�gi�s','Sitios preferidos'),
  ('Most preferred','Most preferred','Plus privil�gi�s','El m�s preferido'),
  ('Less preferred','Less preferred','Moins privil�gi�s','El menos preferido'),
  ('Set agent skills','Set agent skills','�tablir comp�tences de l\'agent','Establecer habilidades del agente'),
  ('Agent Login ID','Agent Login ID','ID de connexion de l\'agent','ID de conexi�n del agente'),
  ('Skill','Skill','Comp�tence','Habilidad'),
  ('Please enter skill name','Please enter skill name','Veuillez indiquer le nom de la comp�tence','Favor de especificar el nombre de la habilidad'),
  ('Score','Score','Indice','�ndice'),
  ('Login','Login','Nom d\'utilisateur','Usuario'),
  ('Please enter a starting date','Please enter a starting date','Veuillez entrer la date du d�but','Favor de introducir una fecha de comienzo'),
  ('Please enter an ending date','Please enter an ending date','Veuillez entrer la date de fin','Favor de introducir una fecha de fin'),
  ('Please select at least one object','Please select at least one object','Veuillez choisir au moins un objet','Seleccione por favor por lo menos un objeto'),
  ('Your ending date cannnot be smaller than your starting date','Your ending date cannnot be smaller than your starting date!','La date de fin ne peut pas �tre ant�rieure � la date de d�but!','La fecha de fin no puede ser anterior a la fecha de comienzo.'),
  ('Report by call type for Microcell Rac','Report by call type for Microcell Rac','Rapport par type d\'appel pour Microcell Rac','Informe por tipo de llamada para Microcell Rac'),
  ('Agent Adherence Report','Agent Adherence Report','Rapport sur l\'adh�sion de l\'agent','Informe sobre la conformidad del agente'),
  ('Show all agents','Show all agents','Montrer tous les agents','Mostrar todos los agentes'),
  ('Show all lists','Show all lists','Montrer toutes les listes','Mostrar todas las listas'),
  ('Report type','Report type','Type de rapport','Tipo del informe'),
  ('Starting date','Starting date','Date de d�but','Fecha del comienzo'),
  ('Ending date','Ending date','Date de fin','Fecha del fin'),
  ('detail for each year','detail for each year','donn�es pour chaque ann�e','datos para cada a�o'),
  ('for each year','for each year','pour chaque ann�e','para cada a�o'),
  ('for each month','for each month','pour chaque mois','para cada mes'),
  ('detail for each month','detail for each month','donn�es pour chaque mois','datos para cada mes'),
  ('for each day','for each day','pour chaque jour','para cada d�a'),
  ('detail for each day','detail for each day','donn�es pour chaque jour','datos para cada d�a'),
  ('detailed information','detailed information','information d�taill�e','informaci�n detallada'),
  ('By Group','By group','Par groupe','Por grupo'),
  ('By Leader','By leader','Par chef','Por jefe'),
  ('Listening to agent\'s conversations','Listening to agent\'s conversations','�couter les conversations des agents','Escuchar las conversaciones del agente'),
  ('Show statistics','Show statistics','Montrer les statistiques','Mostrar estad�sticas'),
  ('All groups','All groups','Tous les groupes','Todos los grupos'),
  ('All agents','All agents','Tous les agents','Todos los agentes'),
  ('Phone number','Phone number','Num�ro de t�l�phone','N�mero de tel�fono'),
  ('Call time','Call time','L\'heure de l\'appel','Hora de la llamada'),
  ('To','To','�','hasta'),
  ('Sales','Sales','Ventes','Ventas'),
  ('No sales','No sales','Pas de ventes','No ventas'),
  ('Call type','Call type','Type d\'appel','Tipo de llamada'),
  ('Add new skill','Add new skill','Ajouter nouvelle comp�tence','A�adir nueva habilidad'),
  ('Modify skill name','Modify skill name','Modifier le nom de la comp�tence','Modificar el nombre de la habilidad'),
  ('Skill ID','Skill ID','ID de la comp�tence','ID de la habilidad'),
  ('Skill Name','Skill Name','Nom de la comp�tence','Nombre de la habilidad'),
  ('Add a new team','Add a new team','Ajouter un �quipe','A�adir un equipo'),
  ('Update team','Update team','Mettre �quipe � jour','Actualizar equipo'),
  ('Agent Group Real-Time Adherence View','Agent group real-time adherence view','Vue en temps r�el de l\'adh�sion du groupe d\'agents','Vista en tiempo real de la conformidad del grupo de agentes'),
  ('Time period','Time period','P�riode de temps','Per�odo'),
  ('Spacing(mn)','Spacing(mn)','Espacement(min)','Espacio(min)'),
  ('Agent Login and Production time','Agent Login and Production time','Temps de connexion et de production de l\'agent','Tiempo de conexi�n y de producci�n del agente'),
  ('Method of payment','Method of payment','M�thode de paiement','M�todo de pago'),
  ('Codes','Codes','Codes','C�digos'),
  ('MOP Codes','MOP codes','Codes m�thode de paiement','C�digos m�todo de pago'),
  ('Training Code','Training code','Code formation','C�digo formaci�n'),
  ('Integration Code','Integration code','Code int�gration','C�digo integraci�n'),
  ('Production Code','Production code','Code production','C�digo producci�n'),
  ('Overtime Code','Overtime code','Code heures suppl�mentaires','C�digo horas extraordinarias'),
  ('Commission Code','Commission code','Code commission','C�digo comisi�n'),
  ('Continuing training Code','Continuing training code','Code formation continue','C�digo formaci�n continua'),
  ('Select a MOP commission','Select a MOP commission','S�lectionnez une commission de paiement','Seleccione una comisi�n de pago'),
  ('Available commissions','Available commissions','Commissions disponibles','Comisiones disponibles'),
  ('Selected commissions','Selected commissions','Commissions s�lectionn�es','Comisiones escogidas'),
  ('Overtime','Overtime','Heures suppl�mentaires','Horas extraordinarias'),
  ('Overtime properties','Overtime properties','Propri�t�s heures suppl�mentaires','Propiedades horas extraordinarias'),
  ('Number of weekly hours','Number of weekly hours','Nombre d\'heures par semaine','Cantidad de horas semanales'),
  ('Help','Help','Aide','Ayuda'),
  ('Modify the team','Modify the team','Modifier l\'�quipe','Modificar el equipo'),
  ('You must enter a TEAM NAME','You must enter a TEAM NAME','Vous devez saisir un NOM D\'�QUIPE','Usted debe introducir un NOMBRE DE EQUIPO'),
  ('You must enter a TEAM LEADER NAME','You must enter a TEAM LEADER NAME','Vous devez saisir un NOM DE CHEF D\'�QUIPE','Usted debe introducir un NOMBRE de  JEFE DE EQUIPO'),
  ('Are you sure, you wish to delete this team ?','Are you sure, you wish to delete this team ?','�tes-vous certain de vouloir supprimer cette �quipe?','�Esta usted seguro de querer suprimir este equipo?'),
  ('Team Name','Team name','Nom de l\'�quipe','Nombre del equipo'),
  ('Team Leader','Team leader','Nom du chef','Jefe del equipo'),
  ('Enter user login','Enter user login','Saisissez le nom d\'utilisateur','Introducir la identificaci�n del usuario'),
  ('Enter user numeric login','Enter user numeric login','Saisissez les num�ros de connexion de l\'utilisateur','Introducir n�meros de conexi�n del usuario'),
  ('Modify Live Monitoring User','Modify Live Monitoring User','Modifier supervision en temps r�el de l\'utilisateur','Modificar supervisi�n en vivo del usuario'),
  ('This numeric login is already in use','This numeric login is already in use','Ce num�ro de connexion est d�j� utilis�','Este n�mero de conexi�n existe ya'),
  ('You are about to delete this Live Monitoring user.\nDo you want to continue ?','You are about to delete the Live Monitoring instance for this user.\nDo you want to continue?','Vous �tes sur le point de supprimer l\'option de surveillance en temps r�el pour cet utilisateur.\nD�sirez-vous poursuivre?','Est� a punto de suprimir la funci�n de supervisi�n en vivo para este usuario.\n �Desea proseguir?'),
  ('Agent adherence view','Agent adherence view','Affichage de l\'adh�sion � l\'horaire','Visualizaci�n de la conformidad al horario'),
  ('Stop','Stop','Arr�ter','Parar'),
  ('Start','Start','Commencer','Empezar'),
  ('Your ending month-year must be the same as your starting month-year','Your ending month-year must be the same as your starting month-year','Le mois-ann�e de fin doit �tre le m�me que le mois-ann�e de d�but','Mes-a�o de fin debe ser igual que mes-a�o de comienzo'),
  ('Inbound call reports','Inbound call reports','Rapports sur les appels entrants','Informes sobre las llamadas entrantes'),
  ('Inbound call report','Inbound call report','Rapport sur les appels entrants','Informe sobre las llamadas entrantes'),
  ('Monthly','Monthly','Mensuel','Mensual'),
  ('Daily','Daily','Quotidien','Diario'),
  ('Starting time','Starting time','Heure de d�but','Hora de comienzo'),
  ('Ending time','Ending time','Heure de fin','Hora de fin'),
  ('Save','Save','Enregistrer','Guardar'),
  ('to','to','�','hasta'),
  ('Please enter a date','Please enter a date','Veuillez saisir une date','Favor de introducir una fecha'),
  ('You must include at least agents or supervisors','You must include at least agents or supervisors','Vous devez inclure au minumun des agents ou des superviseurs','Usted debe incluir por lo menos agentes o supervisores'),
  ('Exception Report','Exception Report','Relev� des exceptions','Informe de excepci�n'),
  ('Over Percentage','Over Percentage','Pourcentage sup�rieur �','Porcentaje sobrepasa'),
  ('Select a date','Select a date','S�lectioner une date','Seleccione una fecha'),
  ('Include agents','Include agents','Inclure les agents','Incluir agentes'),
  ('Include supervisors','Include supervisors','Inclure les superviseurs','Incluir supervisores'),
  ('already exists','already exists','existe d�j�','existe ya'),
  ('You are about to delete this skill.\nDo you want to continue ?','You are about to delete this skill.\n Do you want to continue?','Vous �tes sur le point de supprimer cette comp�tence. \n D�sirez-vous poursuivre?','�Usted est� a punto de suprimir la habilidad.\n �Usted desea continuar?'),
  ('cannot be choosen. It causes an order conflict with another treatment','cannot be choosen. It causes an order conflict with another treatment','ne peut pas �tre choisi. Il cause un conflit d\'ordre de traitement avec un autre traitement','no puede ser elejido. Causa un conflicto de orden de procesamiento con otro tratamiento'),
  ('Add a new Calling list','Add a new Calling list','Ajouter une liste d\'appel','A�adir una lista de llamada'),
  ('Modify Calling list information','Modify Calling list information','Modifier donn�es sur la liste d\'appel','Modificar datos sobre lista de llamada'),
  ('You must enter the table name associated with this list','You must enter the table name associated with this list','Vous devez indiquer le nom de la table associ�e � cette liste','Debe introducir el nombre de la tabla relacionada con esta lista'),
  ('Calling list already exists','Calling list already exists','Liste d\'appel existe d�j�','La lista de llamada existe ya'),
  ('Are you sure, you wish to delete this calling list?','Are you sure, you wish to delete this calling list?','�tes-vous s�r de vouloir supprimer cette liste d\'appel?','�Esta usted seguro de desear suprimir esta lista de llamada?'),
  ('Table Name','Table Name','Nom de la table','Nombre de la tabla'),
  ('Selected filter','Selected filter','Filtre selectionn�','Filtro seleccionado'),
  ('Available Filters','Available filters','Filtres disponibles','Filtros disponibles'),
  ('Add this filter','Add this filter','Ajouter ce filtre','A�adir este filtro'),
  ('Available Treatments','Available treatments','Traitements disponibles','Tratamientos disponibles'),
  ('Selected Treatments','Selected treatments','Traitements s�lectionn�s','Tratamientos seleccionados'),
  ('Maximum attempts','Maximum attempts','Tentatives maximum','Tentativas m�ximas'),
  ('Unlimited','Unlimited','Illimit�','Ilimitado'),
  ('Add a new filter','Add a new filter','Ajouter un filtre','A�adir un filtro'),
  ('Modify existing filter information','Modify existing filter information','Modifier les donn�es sur le filtre','Modificar los datos sobre el filtro'),
  ('You must enter a FILTER NAME','You must enter a FILTER NAME','Vous devez saisir un NOM DE FILTRE','Debe introducir un NOMBRE de FILTRO'),
  ('You must enter a criteria or order by clause','You must enter a criteria or order by clause','Vous devez indiquer un crit�re ou une clause d\'ordonnancement','Debe introducir un criterio o cl�usula de ordenaci�n'),
  ('Are you sure, you wish to delete this filter?','Are you sure, you wish to delete this filter?','�tes-vous s�r de vouloir supprimer ce filtre?','�Esta usted seguro de querer suprimir este filtro?'),
  ('Filter name','Filter name','Nom du filtre','Nombre del filtro'),
  ('Criteria','Criteria','Crit�res','Criterios'),
  ('Order by','Order by','Trier par','Ordenar por'),
  ('Filter already exists','Filter already exists','Le filtre existe d�j�','El filtro existe ya'),
  ('Add a filter','Add a filter','Ajouter un filtre','A�adir un filtro'),
  ('Delete team','Delete team','Supprimer �quipe','Suprimir equipo'),
  ('Delete a team','Delete a team','Supprimer une �quipe','Suprimir un equipo'),
  ('Calling list name','Calling list name','Nom de la liste d\'appel','Nombre de la lista de llamada'),
  ('Campaign name','Campaign name','Nom de campagne','Nombre de campa�a'),
  ('Number of ports','Number of ports','Nombre de ports','Cantidad de puertos'),
  ('Caller ID','Caller ID','Identification de l\'appelant','ID del llamante'),
  ('Caller ID format','Caller ID format','Format identification de l\'appelant','Formato del ID de llamante'),
  ('CallerName','CallerName','Nom de l\'appelant','Nombre del llamante'),
  ('Associated calling lists','Associated calling lists','Listes d\'appel connexes','Listas de llamada relacionadas'),
  ('Available calling lists','Available calling lists','Listes d\'appel disponibles','Listas de llamada disponibles'),
  ('Associated Do-not-call lists','Associated Do-not-call lists','Listes connexes Ne-pas-appeler','Listas relacionadas de n�meros No-llamar'),
  ('Available blacklist groups','Available Do-not-call lists','Listes disponibles Ne-pas-appeler','Listas disponibles de n�meros No-llamar'),
  ('Selected blacklist groups','Selected Do-not-call lists','Listes s�lectionn�es Ne-pas-appeler','Listas seleccionadas de n�meros No-llamar'),
  ('Campaign daily hours','Campaign daily hours','Heures quotidiennes de la campagne','Horas diarias de la campa�a'),
  ('Hours','Hours','Heures','Horas'),
  ('Dollars','Dollars','Dollars','D�lares'),
  ('Daily hours','Daily hours','Heures quotidiennes','Horas diarias'),
  ('Monday','Monday','Lundi','Lunes'),
  ('Tuesday','Tuesday','Mardi','Martes'),
  ('Wednesday','Wednesday','Mercredi','Mi�rcoles'),
  ('Thursday','Thursday','Jeudi','Jueves'),
  ('Friday','Friday','Vendredi','Viernes'),
  ('Saturday','Saturday','Samedi','Sabado'),
  ('Sunday','Sunday','Dimanche','Domingo'),
  ('From','From','de','de'),
  ('Close','Close','Fermer','Cerrar'),
  ('Mode','Mode','Mode','Modo'),
  ('Dialing Mode','Dialing mode','Mode de num�rotation','Modo de marcaci�n'),
  ('Associated routing script','Associated routing script','Script connexe d\'acheminement','Script relacionado de encaminamiento'),
  ('Preview mode','Preview mode','Mode pr�visualisation','Modo vista previa'),
  ('Progressive mode','Progressive mode','Mode progressif','Modo progresivo'),
  ('Predictive mode','Predictive mode','Mode pr�dictif','Modo predictivo'),
  ('Broadcast mode','Broadcast mode','Mode diffusion','Modo difusi�n'),
  ('Optimization parameter','Optimization parameter','Param�tre d\'optimisation','Par�metro de optimizaci�n'),
  ('Agent Busy Factor','Agent Busy Factor','Facteur agent occup�','Factor agente ocupado'),
  ('Overdial Rate','Overdial Rate','Taux de surcomposition','Cuota de marcaci�n en exceso'),
  ('Target','Target','Cible','Objetivo'),
  ('Abandon rate','Abandon rate','Taux d\'abandon','Cuota de abandono'),
  ('Answering Machine Detection','Answering Machine Detection','D�tection de r�pondeur','Detecci�n de contestador autom�tico'),
  ('Load','Load','Charger','Cargar'),
  ('Not loaded','Not loaded','Non charg�e','No cargada'),
  ('Add a new treatment','Add a new treatment','Ajouter un traitement','A�adir un tratamiento'),
  ('Modify treatment','Modify treatment','Modifier le traitement','Modificar el tratamiento'),
  ('Are you sure, you wish to delete this treatment?','Are you sure, you wish to delete this treatment?','�tes-vous s�r de vouloir supprimer ce traitement?','�Esta usted seguro de querer suprimir este tratamiento?'),
  ('Busy','Busy','Occup�','Ocupado'),
  ('Abandoned','Abandoned','Abandonn�','Abandonado'),
  ('No answer','No answer','Sans r�ponse','Sin respuesta'),
  ('Answering machine','Answering machine','R�pondeur','Contestador'),
  ('Sit','SIT','SIT','SIT'),
  ('No more trunk','No more trunk','Plus de ligne inter.','No m�s l�nea inter.'),
  ('Agent Unavailable (Personal CallBack)','Agent unavailable (personal callback)','Agent non disponible (reprise personnelle d\'appel)','Agente no disponible (repetici�n personal de llamada)'),
  ('Order','Order','Ordre','Orden'),
  ('Interval (min)','Interval (min)','Intervalle (min)','Intervalo (min)'),
  ('Increment (min)','Increment (min)','Incr�ment (min)','Incremento (min)'),
  ('Attempts','Attempts','Tentatives','Tentativas'),
  ('Treatment already exists','Treatment already exists','Le traitement existe d�j�','El tratamiento existe ya'),
  ('Call result','Call result','R�sultat d\'appel','Resultado de la llamada'),
  ('day','day','jour','d�a'),
  ('days','days','jours','d�as'),
  ('week','week','semaine','semana'),
  ('Personal CallBack time out (min)','Personal callback time out (min)','D�lai reprise personnelle d\'appel (min)','Plazo repetici�n personal de llamada (min)'),
  ('Within','Within','En','Dentro de'),
  ('The longest waiting time for response must be in seconds','The longest waiting time for response must be in seconds','Temps d\'attente le plus long pour obtenir une r�ponse doit �tre exprim� en secondes','Tiempo de espera m�s largo para recibir respuesta debe estar en segundos'),
  ('The abandoned shortest time must be in seconds','The abandoned shortest time must be in seconds','Temps d\'attente le plus court pour abandonner l\'appel doit �tre exprim� en secondes','Tiempo de espera m�s corto para abandonar la llamada debe estar  en segundos'),
  ('The abandoned shortest time must be less than the longuest waiting time for response','The abandoned shortest time must be less than the longest waiting time for response','Temps d\'attente le plus court pour l\'abandon doit �tre inf�rieur au temps d\'attente le plus long pour la r�ponse','Tiempo de espera m�s corto para abandono tiene que ser menor que el tiempo de espera m�s largo para respuesta.'),
  ('Select 10 values for service level answered times','Select 10 values for service level answered times','S�lectionnez 10 valeurs de niveau de service en temps de r�ponse','Seleccione 10 valores de espera para nivel de servicio en llamadas contestadas'),
  ('Service factor','Service factor','Facteur de service','Factor de servicio'),
  ('General information for service factor','General information about service factor','Information g�n�rale sur le facteur de service','Informaci�n general sobre el factor de servicio'),
  ('Longest waiting time for response','Longest waiting time for response','Temps d\'attente le plus long pour obtenir r�ponse','Tiempo de espera m�s largo para recibir respuesta'),
  ('Shortest time for abandon','Shortest time for abandon','Temps d\'attente le plus court avant l\'abandon','Tiempo de espera m�s corto para abandono'),
  ('Service level','Service level','Niveau de service','Nivel de servicio'),
  ('Answered times','Answer times','Temps de r�ponse','Tiempos de espera para respuesta'),
  ('Abandonned times','Abandon times','Temps d\'abandon','Tiempos de espera para abandono'),
  ('Commission name','Commission name','Nom de la commission','Nombre de la comisi�n'),
  ('(associated to a MOP)','(associated to a MOP)','(associ�e � une m�thode de paiement)','(vinculada a un m�todo de pago)'),
  ('Max commission value','Max commission value','Valeur max. de commission','Valor max. de comisi�n'),
  ('Based on','Based on','Bas�e sur','Basado sobre'),
  ('per work hour','per work hour','par heure de travail','por trabaja hora'),
  ('Set your ranges','Set your ranges','Indiquez la plage','Establezca sus rangos'),
  ('Fixed commission','Fixed commission','Commission fixe','Comisi�n fija'),
  ('Sales-based commissions','Sales-based commission','Commission bas�e sur les ventes','Comisi�n basada en ventas'),
  ('Commissions based on group average','Commission based on group average','Commission bas�e sur la moyenne du groupe','Comisi�n basada en la media del grupo'),
  ('Performance-based commission','Performance-based commission','Commission bas�e sur la performance','Comisi�n basada en la desempe�o'),
  ('This activity already exists. Please choose another name !','This activity already exists. Please choose another name.','L\'activit� existe d�j�. Veuillez choisir un autre nom.','La actividad ya existe. Favor de seleccionar otro nombre.'),
  ('Are you sure, you wish to delete this activity? This can affect your reports!','Are you sure, you wish to delete this activity? This can affect your reports.','�tes-vous certain de vouloir supprimer l\'activit�? Cela peut avoir des r�percussions sur vos rapports.','�Est� seguro de querer suprimir esta actividad? Esto puede afectar a sus informes.'),
  ('Auto update','Auto update','Mise � jour automatique','Actualizaci�n autom�tica'),
  ('General setup','General setup','Param�tres g�n�raux','Par�metros generales'),
  ('Define work periods','Define work periods','D�finir les p�riodes de travail','Definir periodos de trabajo'),
  ('Add a new work period','Add a new work period','Ajouter une autre p�riode de travail','A�adir otro periodo de trabajo'),
  ('Save work periods','Save work periods','Enregistrer les p�riodes de travail','Guardar periodos de trabajo'),
  ('Define durations for NRR','Define durations for NRR','D�finir la dur�e des raisons Pas-pr�t','Definir duraci�n de motivos No-listo'),
  ('Save durations for NRR','Save durations for NRR','Enregistrer les dur�es raison Pas-pr�t','Guardar duraciones de motivo No-listo'),
  ('Paid NRR','Paid NRR','RPP r�mun�r�e','MNL pagado'),
  ('Configure durations for NRR','Configure durations for NRR','Configurer dur�es raison Pas-pr�t','Configurar duraciones de motivo No-listo'),
  ('Select an agent group','Agent group selection','S�lection du groupe d\'agents','Selecci�n del grupo de agentes'),
  ('Select agent group','Select agent group','S�lectionner groupe d\'agents','Seleccionar grupo de agentes'),
  ('Associated not-ready reasons','Associated not-ready reasons','Raisons Pas-pr�t associ�es','Motivos No-listo relacionados'),
  ('Save payable NRR for this agent group','Save payable NRR for this agent group','Enregistrer les RPP r�mun�r�es pour ce groupe','Guardar motivos No-listo pagados para este grupo');



INSERT INTO `cfg_language` (`KEY_WORD`, `ENGLISH`, `FRENCH`, `ESPAGNOL`) VALUES 
  ('Summary','Summary','Sommaire','Resumen'),
  ('Do-not-call lists contents','Do-not-call lists contents','Contenu des listes Ne-pas-appeler','Contenido de listas de n�meros No-llamar'),
  ('Select a do-not-call list name','Select a do-not-call list name','S�lectionner un nom de liste Ne-pas-appeler','Seleccionar nombre de lista de n�meros No-llamar'),
  ('Select a do-not-call list','Select a do-not-call list','S�lectionner une liste Ne-pas-appeler','Seleccionar una lista No-llamar'),
  ('Select','Select','S�lectionner','Seleccionar'),
  ('View contents','View contents','Afficher contenu','Visualizar contenido'),
  ('Remove unchecked numbers','Remove unchecked numbers','Enlever les num�ros sans coche','Quite n�meros sin marca'),
  ('You must enter an ALERT NAME','You must enter an ALERT NAME','Vous devez saisir un NOM D\'ALERTE','Debe introducir un NOMBRE DE ALERTA'),
  ('You must select an AGENT GROUP','You must select an AGENT GROUP','Vous devez s�lectionner UN GROUPE D\'AGENTS','Debe seleccionar un GRUPO DE AGENTES'),
  ('You must define at least one condition','You must define at least one condition','Vous devez d�finir au moins une condition','Debe definir por lo menos una condici�n'),
  ('Please define a message','Please define a message!','Veuillez d�finir un message','Favor de definir un mensaje'),
  ('Error: Too many open brackets in alert condition(s)!','Error: Too many open brackets in','Erreur: �contient trop de crochets d\'ouverture','Error: Demasiados corchetes de apertura en...'),
  ('Alert already exists. Please chose another name','Alert already exists. Please chose another name!','L\'alerte existe d�j�. Veuillez choisir un autre nom','La alerta ya existe. Favor de seleccionar otro nombre'),
  ('Error: Unexpected close bracket in alert condition(s)!','Error: Unexpected close bracket in','Erreur: Crochet de fermeture inattendu dans�','Error: Corchete de cierre inesperado en...'),
  ('near','near','pr�s de','cerca de'),
  ('Add alert for StarPhone','Add alert for AheevaPhone','Ajouter alerte pour AheevaPhone','A�adir alerta para AheevaPhone'),
  ('Alert definition','Alert definition','D�finition de l\'alerte','Definici�n de la alerta'),
  ('Alert name','Alert name','Nom de l\'alerte','Nombre de la alerta'),
  ('Select a statistic','Select a statistic','S�lectionner la statistique','Seleccionar la estad�stica'),
  ('Average handling time','Average handling time','Temps moyen de traitement','Tiempo medio de procesamiento'),
  ('Calls in queue','Calls in queue','Appels en file','Llamadas en cola'),
  ('Productivity ratio','Productivity ratio','Quotient de productivit�','�ndice de productividad'),
  ('Message to send','Message to send','Message � exp�dier','Mensaje para enviar'),
  ('Message color','Message color','Couleur du message','Color del mensaje'),
  ('Define alert condition(s)','Define alert condition(s)','D�finir condition(s) d\'alerte','Definir condici�n(es) de alerta'),
  ('Manager','Manager','Gestionnaire','Gestor'),
  ('Add alert for manager','Add alert for manager','Ajouter alerte pour gestionnaire','A�adir alerta para gestor'),
  (' Alert related to agent group',' Alert related to agent group',' Alerte associ�e au groupe d\'agents',' Alerta relacionada con grupo de agentes'),
  ('Waiting agents','Waiting agents','Agents en attente','Agentes esperando'),
  ('Agents in wrap up','Agents in wrap up','Agents en traitement post-appel','Agentes en procesamiento post llamada'),
  ('Click to write the message','Click to write the message','Cliquer pour �crire le message','Hacer clic para escribir el mensaje'),
  ('Pick','Pick','S�lectionner','Escoger'),
  ('You cannot select an alert several times','You cannot select an alert several times','Vous ne pouvez pas s�lectionner une alerte plusieurs fois','No puede seleccionar una alerta varias veces'),
  ('You must enter a SCHEDULE NAME','You must enter a SCHEDULE NAME','Vous devez saisir un NOM D\'HORAIRE','Debe introducir un NOMBRE DE HORARIO'),
  ('Schedule already exists','Schedule already exists','L\'horaire existe d�j�','El horario ya existe'),
  ('Add schedule for StarPhone','Add schedule for AheevaPhone','Ajouter horaire pour AheevaPhone','A�adir horario para AheevaPhone'),
  ('Schedule definition','Schedule definition','D�finition de l\'horaire','Definici�n del horario'),
  ('Schedule name','Schedule name','Nom de l\'horaire','Nombre del horario'),
  ('Non-configured group','Non-configured group','Groupe non configur�','Grupo no configurado'),
  ('Assigned group','Assigned group','Groupe affect�','Grupo asignado'),
  ('Statistics options','Statistics options','Options de statistiques','Opciones de estad�sticas'),
  ('Stats related to','Stats related to','Statistiques sur','Estad�sticas relacionadas con'),
  ('Group','Group','Groupe','Grupo'),
  ('Net conversion rate','Net conversion rate','Conversion nette taux de vente','Tasa de conversi�n neta'),
  ('Average sales per hour','Average sales per hour','Ventes moyennes par heure','Ventas medias por hora'),
  ('Busy factor','Busy factor','Facteur occup�','Factor ocupado'),
  ('Total login time','Total login time','Temps total en session','Tiempo total en sesi�n'),
  ('Total calls','Total calls','Nombre d\'appels total','Cantidad total de llamadas'),
  ('Waiting calls','Waiting calls','Appels en attente','Llamadas en espera'),
  ('Abandoned calls','Abandoned calls','Appels abandonn�s','Llamadas abandonadas'),
  ('Broadcast period (min)','Broadcast period (min)','P�riode de diffusion (min)','Periodo de difusi�n (min)'),
  ('Alerts options','Alerts options','Options d\'alerte','Opciones de alerta'),
  ('Add alert','Add alert','Ajouter alerte','A�adir alerta'),
  ('Add schedule for manager','Add schedule for manager','Ajouter horaire pour gestionnaire','A�adir horario para gestor'),
  ('You must enter a number to put in blacklist(s)','You must enter a number to put in the Do-not-call list(s)','Vous devez saisir un num�ro � ins�rer dans la liste des num�ros Ne-pas-appeler','Debe introducir un n�mero para poner en la(s) lista(s) de n�meros No\'llamar'),
  ('The number to put in blacklist must be numeric !','The numbers to put in a Do-not-call list must be made of digits.','Les num�ros qui figurent dans une liste Ne-pas-appeler doivent �tre compos�s de chiffres.','Los n�meros en una lista de n�meros No-llamar deben estar compuestos de cifras.'),
  ('You must select a rule!','You must select a rule!','Vous devez s�lectionner une r�gle!','�Debe seleccionar una regla!'),
  ('Do-not-call lists rules','Do-not-call lists rules','R�gles sur les listes Ne-pas-appeler','Reglas sobre listas de n�meros No-llamar'),
  ('Do not call numbers when','Do not call numbers when','Ne pas appeler les num�ros lorsque','No llame los n�meros cuando'),
  ('EQUAL TO','EQUAL TO','EST �GAL �','ES IGUAL A'),
  ('NOT EQUAL TO','NOT EQUAL TO','N\'EST PAS �GAL �','NO ES IGUAL A'),
  ('START WITH','START WITH','D�BUTE PAR','EMPIEZA POR'),
  ('END WITH','END WITH','SE TERMINE PAR','TERMINA POR'),
  ('CONTAIN','CONTAIN','CONTIENT','CONTIENE'),
  ('DON\'T CONTAIN','DON\'T CONTAIN','NE CONTIENT PAS','NO CONTIENE'),
  ('Available do-not-call list groups','Available Do-not-call lists','Listes Ne-pas-appeler disponibles','Listas disponibles de n�meros No-llamar'),
  ('Selected do-not-call list groups','Selected Do-not-call lists','Listes Ne-pas-appeler s�lectionn�es','Listas seleccionadas de n�meros No-llamar'),
  ('Show report order by','Show report order by','Afficher rapport par ordre','Mostrar informe en orden'),
  ('adherence value descending','adherence value descending','d�croissant valeur d\'adh�sion','descendiente valor de conformidad'),
  ('agent login ID','agent login ID','ID de connexion de l\'agent','ID de conexi�n del agente'),
  ('adherence value ascending','adherence value ascending','croissant valeur d\'adh�sion','ascendente valor de conformidad'),
  ('Agent name','Agent name','Nom de l\'agent','Nombre del agente'),
  ('Agent report','Agent report','Rapport sur les agents','Informe sobre agentes'),
  ('This group name already exists. Please change the name of your group !','This group name already exists. Please change the name of the group.','Le nom de groupe existe d�j�. Veuillez changer le nom du groupe.','Este nombre de grupo ya existe. Favor de cambiar el nombre del grupo.'),
  ('Do-not-call list name','Do-not-call list name','Nom de la liste Ne-pas-appeler','Nombre de la lista de n�meros No-llamar'),
  ('Enter a name for the new do-not-call list','Enter a name for the new do-not-call list','Saisir un nom pour la nouvelle liste de num�ros � Ne-pas-appeler','Introducir un nombre para la nueva lista de n�meros No-llamar'),
  ('Agent group report','Agent group report','Rapport sur les groupes d\'agents','Informe sobre los grupos de agentes'),
  ('Agent group report parameters','Agent group report parameters','Param�tres du rapport sur les groupes d\'agents','Par�metros de informe sobre grupo de agentes'),
  ('Extract global hours','Extract global hours','Extraire heures globales','Extraer horas globales'),
  ('Do-not-call list number search','Do-not-call list number search','Recherche de num�ro Ne-pas-appeler','B�squeda n�mero No-llamar'),
  ('Enter a number','Enter a number','Saisir un num�ro','Introduzca un n�mero'),
  ('Search','Search','Recherche','Buscar'),
  ('Select record to listen','Select record to listen','S�lectionner enregistrement � �couter','Seleccionar registro a escuchar'),
  ('Record parameters','Record parameters','Param�tres d\'enregistrement','Par�metros de grabaci�n'),
  ('You may use (%Phonenumber%)','You may use (%Phonenumber%)','Vous pouvez utiliser (%Phonenumber%)','Puede usar (%Phonenumber%)'),
  ('Advanced options','Advanced options','Options avanc�es','Opciones avanzadas'),
  ('Advanced search options','Advanced search options','Options de recherche avanc�es','Opciones de b�squeda avanzadas'),
  ('Choose period','Choose period','Choisir la p�riode','Escoger el periodo'),
  ('IP','IP','Adresse IP','Direcci�n IP'),
  ('Listen time','Listen time','Temps d\'�coute','Tiempo de escucha'),
  ('User','User','Utilisateur','Usuario'),
  ('All Users','All users','Tous les utilisateurs','Todos los usuarios'),
  ('Help for methods of payment','Help for methods of payment','Aide relative aux m�thodes de paiement','Ayuda acerca de los m�todos de pago'),
  ('This tab allows you to set a name(mandatory) for your MOP. You can also set a description and a status (active by default) for your MOP.','This tab allows you to set a name (mandatory) for your MOP. You can also set a description and a status (active by default) for your MOP.','L\'onglet vous permet de nommer (obligatoire) la m�thode de paiement. Vous permet �galement d\'enregistrer une description et un �tat (actif par d�faut) pour la m�thode de paiement.','Esta pesta�a le permite nombrar (obligatorio) el m�todo de pago. Puede tambi�n introducir una descripci�n y establecer un estado (activo por omisi�n) para el m�todo de pago.'),
  ('This tab allows you to set some codes for different activities. These activities are training, integration, production, commission and continuing training. These codes represent hourly rates(by default) or amount of money.','This tab allows you to set the codes for different activities. These activities are training, integration, production, commission and continuing training. The codes represent hourly rates (by default) or amount of money.','L\'onglet vous permet d\'�tablir les codes des diverses activit�s. Celles-ci sont la formation, int�gration, production, commission et formation continue. Les codes repr�sentent un taux horaire (par d�faut) ou un montant d\'argent.','Esta pesta�a le permite establecer los c�digos de varias actividades. Las cuales son formaci�n, integraci�n, producci�n, comisi�n y formaci�n continua. Los c�digos representan tarifas horarias (por omisi�n) o cierta cantidad de dinero.'),
  ('Treatment','Treatment','Traitement','Tratamiento'),
  ('This tab allows you to choose a treatment for your MOP. You cannot choose more than one treatment.','This tab allows you to choose a treatment for your MOP. You cannot choose more than one treatment.','L\'onglet  vous permet de choisir un traitement pour la m�thode de paiement. La s�lection se limite � un traitement � la fois.','Esta pesta�a le permite escoger un tratamiento para el m�todo de pago. No puede escoger m�s de un tratamiento a la vez.'),
  ('This tab allows you to set a limit from which overtime hours will be counted. You can also set the multiplicative factor for overtime hours.','This tab allows you to set a limit from which overtime hours will be counted. You can also set the multiplicative factor for overtime hours.','L\'onglet vous permet d\'�tablir la limite � partir de laquelle seront calcul�es les heures suppl�mentaires. Vous pouvez �galement indiquer le facteur multiplicatif pour travail suppl�mentaire','Esta pesta�a le permite especificar el l�mite desde el que se calcularan las horas extraordinarias. Puede tambi�n indicar el factor multiplicativo de c�lculo de las horas extraordinarias.'),
  ('This tab allows you to set a name(mandatory) for your MOP treatment. You can also set a description and a status (active by default) for your MOP treatment.','This tab allows you to set a name(mandatory) for your MOP treatment. You can also set a description and a status (active by default) for your MOP treatment.','L\'onglet vous permet de nommer (obligatoire) le traitement associ� � la m�thode de paiement. Vous pouvez �galement enregistrer une description et l\'�tat (actif par d�faut) du traitement.','Esta pesta�a le permite nombrar (obligatorio) el tratamiento para el m�todo de pago. Puede tambi�n introducir una descripci�n y establecer un estado (activo por omisi�n) para dicho tratamiento.'),
  ('This tab allows you to set the type of commission for your treatment. If your treatment doesn\'t need a commission, you must select a fixed commission and set its value to 0.','This tab allows you to set the type of commission for your treatment. If your treatment doesn\'t need a commission, you must select the \"fixed commission\" and set its value to \"0\".','L\'onglet vous permet de d�finir le type de commission pour le traitement. Si le traitement ne requiert pas de commission, vous devrez s�lectionner la \"commission fixe\" et r�gler la valeur � \"0\".','Esta pesta�a le permite especificar el tipo de comisi�n para el tratamiento. Si el tratamiento no necesita una comisi�n, debe seleccionar la \"comisi�n fija\" y establecer su valor a \"0\".'),
  ('You must enter a not ready reason name','You must enter a Not-ready reason name','Vous devez saisir un nom pour la raison Pas-pr�t.','Debe introducir un nombre para el motivo No-listo.'),
  ('Not ready reason already exists!','Not-ready reason already exists!','La raison Pas-pr�t existe d�j�!','�El motivo No-listo ya existe�'),
  ('Not ready reason','Not-ready reason','Raison Pas-pr�t','Motivo No-listo'),
  ('Are you sure, you wish to delete this Reason? This can affect your reports!','Are you sure, you wish to delete this Reason? This can affect your reports!','�tes-vous certain de vouloir supprimer la raison? Cela peut avoir des r�percussions sur vos rapports.','�Est� seguro de querer suprimir este motivo? Esto puede afectar sus informes.'),
  ('Not ready reason name','Not-ready reason name','Nom de la raison Pas-pr�t','Nombre del motivo No-listo'),
  ('agent name','agent name','nom de l\'agent','nombre del agente'),
  ('Record listening report','Record listening report','Rapport sur l\'�coute des enregistrements','Informe sobre escucha de registros'),
  ('Help for MOP treatments','Help for MOP treatments','Aide relative aux traitements pour m�thodes de paiement','Ayuda acerca de los tratamientos para m�todos de pago'),
  ('Global','Global','Global','Global'),
  ('Use this not ready reason in productivity','Use this Not-ready reason in productivity','Utiliser la raison Pas-pr�t en productivit�','Usar este motivo No-listo en productividad'),
  ('Agent\'s recording schedule','Agent\'s recording schedule','Horaire d\'enregistrement de l\'agent','Horario de grabaci�n del agente'),
  ('General scheduling','General scheduling','Planification g�n�rale des horaires','Planificaci�n general de los horarios'),
  ('Number of recording','Number of recordings','Nombre d\'enregistrements','Cantidad de registros'),
  ('All','All','Tous','Todos'),
  ('Weekly','Weekly','Hebdomadaire','Semanal'),
  ('Add specific scheduling','Add specific scheduling','Ajouter enregistrement sp�cifique','A�adir grabaci�n espec�fica'),
  ('Weight must be between 0 and 100','Weight must be between \"0\" and \"100\"','Pond�ration doit se situer entre \"0\" et \"100\"','Ponderaci�n debe estar entre \"0\" y \"100\"'),
  ('Sort agents by ID','Sort agents by ID','Trier les agents par ID','Ordenar agentes por ID'),
  ('Set agent\'s skills','Set agent\'s skills','�tablir les comp�tences de l\'agent','Establecer habilidades del agente'),
  ('Cancel','Cancel','Annuler','Cancelar'),
  ('Please enter a valid phone number','Please enter a valid phone number','Veuillez saisir un num�ro de t�l�phone valide','Favor de introducir un n�mero de tel�fono v�lido'),
  ('Your ending month-year must be the same as your starting month-year!','Your ending month-year must be the same as your starting month-year!','Le mois-ann�e de fin doit �tre le m�me que le mois-ann�e de d�but.','El mes-a�o de fin debe ser el mismo que el mes-a�o de comienzo.'),
  ('Spacing (min)','Spacing (min)','Espacement (min)','Espacio (min)'),
  ('Not ready reason ID','Not-ready reason ID','ID de la raison Pas-pr�t','ID del motivo No-listo'),
  ('Per group','Per group','Par groupe','Por grupo'),
  ('Choose a group or all','Choose a group or all','Choisir un groupe ou tous','Escoger un grupo o todos'),
  ('Per agent','Per agent','Par agent','Por agente'),
  ('Choose agent','Choose agent','Choisir agent','Escoger agente'),
  ('You must define at least one condition!','You must define at least one condition!','Vous devez d�finir au moins une condition.','Debe definir como m�nimo una condici�n.'),
  ('Are you sure you wish to delete this alert?','Are you sure you wish to delete this alert?','�tes-vous certain de vouloir supprimer l\'alerte?','�Est� seguro de querer suprimir esta alerta?'),
  ('Are you sure you wish to delete this schedule?','Are you sure you wish to delete this schedule?','�tes-vous certain de vouloir supprimer l\'horaire?','�Est� seguro de querer suprimir este horario?'),
  ('Current status','Current status','�tat actuel','Estado actual'),
  ('Total talk time','Total talk time','Temps total en ligne','Tiempo de habla total'),
  ('Total wait time','Total wait time','Temps total en attente','Tiempo de espera total'),
  ('Total not ready time','Total not-ready time','Temps total Pas-pr�t','Tiempo total No-listo'),
  ('Total wrap up time','Total wrap-up time','Temps total post-appel','Tiempo total post-llamada'),
  ('Total on hold time','Total on hold time','Temps total en garde','Tiempo total en retenci�n'),
  ('Total conference time','Total conference time','Temps total conf�rence','Tiempo total en conferencia'),
  ('Total dialing time','Total dialing time','Temps total composition','Tiempo total marcando n�meros'),
  ('Agents logged in','Agents logged in','Agents en session','Agentes en sesi�n'),
  ('Total calls handled','Total calls handled','Total appels trait�s','Total llamadas procesadas'),
  ('In call inbound','In call inbound','En r�ception d\'appel','Recibiendo llamada'),
  ('In call outbound','In call outbound','En �mission d\'appel','Haciendo llamada'),
  ('Waiting','Waiting','En attente','Esperando'),
  ('Wrapup','Wrapup','Post-appel','Post-llamada'),
  ('Dialing','Dialing','En composition','Marcando'),
  ('On hold','On hold','En garde','En retenci�n'),
  ('In conference','In conference','En conf�rence','En conferencia'),
  ('Type','Type','Type','Tipo'),
  ('Queue','Queue','File','Cola'),
  ('Entered','Entered','Entr�s','Entradas'),
  ('Distributed','Distributed','Distribu�s','Distribuidas'),
  ('Longest call waiting','Longest call waiting','Appel le plus en attente','Llamada con la m�s espera'),
  ('Current average waiting time','Current average waiting time','Temps actuel moyen d\'attente','Tiempo de espera medio actual'),
  ('Average waiting time','Average waiting time','Moyenne temps d\'attente','Tiempo de espera medio'),
  ('Abandon level','Abandon level','Niveau d\'abandon','Nivel de abandono'),
  ('Time started','Time started','Heure d�but','Hora de comienzo'),
  ('Status','Status','�tat','Estado'),
  ('Dials','Dials','Compositions','Marcaciones'),
  ('Answered','Answered','R�ponses','Respuestas'),
  ('Answer machine','Answering machine','R�pondeur','Contestador'),
  ('Current call length','Current call length','Dur�e appel courant','Duraci�n llamada actual'),
  ('SIT','SIT','SIT','SIT'),
  ('Fax','Fax','T�l�c.','Fax'),
  ('Call list','Call list','Liste d\'appel','Lista de llamada'),
  ('Remaining records','Remaining records','Articles en attente','Registros restantes'),
  ('Total','Total','Total','Total'),
  ('Records in process','Records in process','Articles en traitement','Registros en procesamiento'),
  ('Records in filter','Records in filter','Articles dans le filtre','Registros en el filtro'),
  ('Next hour','Next hour','Heure suivante','Pr�xima hora'),
  ('Percent completed','Percent completed','Pourcentage termin�','Porcentaje terminado'),
  ('HitRate','Hit rate','Taux de succ�s','Tasa de �xito'),
  ('Current TZ','Current TZ','FH courant','ZH actual'),
  ('Agent ID','Agent ID','ID de l\'agent','ID del agente'),
  ('Contacts','Contacts','Contacts','Contactos'),
  ('Refusals','Refusals','Rejets','Rechazos'),
  ('Callbacks','Callbacks','Rappels','Repetic. de llamadas'),
  ('Sales/hour','Sales/hour','Ventes/heure','Ventas/hora'),
  ('Net Conv. Rate','Net conv. rate','Conv. nette taux vente','Tasa convers. neta'),
  ('Agent spying','Agent spying','�coute de l\'agent','Escucha del agente'),
  ('Notice','Notice','Avis','Aviso'),
  ('Message','Message','Message','Mensaje'),
  ('Live monitoring management','Live monitoring management','Gestion de la supervision en temps r�el','Gesti�n de la supervisi�n en tiempo real'),
  ('Tenant view','Tenant view','Affichage client','Visualizaci�n cliente'),
  ('Queues configuration','Queue configuration','Configuration des files d\'attente','Configuraci�n de las colas'),
  ('Quality Monitoring and reports','Quality monitoring and Reports','Contr�le de la qualit� et Rapports','Supervisi�n de la calidad e Informes'),
  ('Login report','Login report','Rapport sur les connexions','Informe sobre las conexiones'),
  ('Finances and Methods of payment','Finances and Methods of payment','Finances et M�thodes de paiement','Finanzas y M�todos de pago'),
  ('Queues reports','Queue reports','Rapports sur les files d\'attente','Informes sobre las colas'),
  ('Associated table name','Associated table name','Nom de la table connexe','Nombre de la tabla relacionada'),
  ('Current filter','Current filter','Filtre courrant','Filtro actual'),
  ('Advanced','Advanced','Avanc�es','Avanzadas'),
  ('Sales per unit','Sales per unit','Ventes par unit�','Ventas por unidad'),
  ('Sales per week','Sales per week','Ventes par semaine','Ventas por semana'),
  ('New','New','Nouveau','Nuevo'),
  ('List name','List name','Nom de la liste','Nombre de la lista'),
  ('Delimiter','Delimiter','D�limiteur','Delimitador'),
  ('tab','tab','tabulateur','tabulador'),
  ('space','space','espace','espacio'),
  ('Quote','Quote','Guillemets','Comillas'),
  ('Source file name','Source file name','Nom du fichier source','Nombre del fichero fuente'),
  ('Skip','Skip','Saut','Salto'),
  ('Row(s)','Row(s)','Rang�e(s)','Fila(s)'),
  ('Actions','Actions','Actions','Acciones'),
  ('Extras','Extras','Extra','Extras'),
  ('Auto fill','Auto fill','Remplissage automatique','Relleno autom�tico'),
  ('Clear all','Clear all','Effacer tout','Borrar todo'),
  ('Create new fields from first line','Create new fields from first line','Cr�er nouveaux champs avec premi�re ligne','Crear nuevos campos con primera l�nea'),
  ('Next','Next','Suivant','Siguiente'),
  ('Finished','Finished','Termin�','Terminado'),
  ('Loading statistics','Loading statistics','Chargement des statistiques','Carga de estad�sticas'),
  ('Processed','Processed','Trait�','Procesado'),
  ('Inserted','Inserted','Ins�r�','Insertado'),
  ('Errors','Errors','Erreurs','Errores'),
  ('Show errors','Show errors','Afficher erreurs','Mostrar errores'),
  ('Pause','Pause','Pause','Pausa'),
  ('Dialing hours','Dialing hours','Heures de composition','Horas de marcaci�n'),
  ('Apply to','Apply to','Appliquer �','Aplicar a'),
  ('All records','All records','Tous les articles','Todos los registros'),
  ('Empty hours records','Empty hours records','Articles avec heures � vide','Registros con horas vac�as'),
  ('None','None','Aucun','Ninguno'),
  ('Screen pop','Screen pop','Remont�e de fiche','Ventana emergente'),
  ('Defined urls','Defined URLs','URL d�finis','URLs definidos'),
  ('Records with no extra data',' Records with no extra data',' Articles sans donn�es suppl�mentaires',' Registros sin datos adicionales'),
  ('Phone number purification','Phone number purification','Purification des num�ros de t�l�phone','Purificaci�n de n�meros de tel�fono'),
  ('Action','Action','Actions','Acci�n'),
  ('Non numeric phone numbers','Non numeric phone numbers','Num�ros de t�l�phone non num�riques','N�meros de tel�fono no num�ricos'),
  ('Remove record','Remove record','Enlever article','Quitar registro'),
  ('Prefix rules','Prefix rules','R�gles sur les pr�fixes','Reglas sobre prefijos'),
  ('Time zones setup','Time zones setup','Etablissement des fuseaux horaires','Establecimiento del huso horario'),
  ('Available rules','Available rules','R�gles disponibles','Reglas disponibles'),
  ('Selected rules','Selected rules','R�gles s�lectionn�es','Reglas seleccionadas'),
  ('Empty time zone records','Empty time zone records','Articles avec fuseau horaire � vide','Registros con huso horario vac�o'),
  ('Time','Time','Heure','Hora'),
  ('Load format','Load format','Charger format','Cargar formato'),
  ('Queries status','Query status','�tat des requ�tes','Estado de las consultas'),
  ('Extra data','Extra data','Donn�es suppl�mentaires','Datos adicionales'),
  ('Time zones','Time zones','Fuseaux horaires','Husos horarios'),
  ('Save settings','Save settings','Enregistrer param�tres','Guardar par�metros'),
  ('Existing formats','Existing formats','Formats existants','Formatos existentes'),
  ('Url','URL','URL','URL'),
  ('Diagnostic','Diagnostic','Diagnostic','Diagn�stico'),
  ('Loaded records','Loaded records','Articles charg�s','Registros cargados'),
  ('Records in table','Records in table','Articles dans la table','Registros en la tabla'),
  ('Records with no time zone','Records with no time zone','Articles sans fuseau horaire','Registros sin huso horario'),
  ('To listen to an encrypted record, please login via https !','To listen to an encrypted record, please login via https !','Pour �couter un enregistrement chiffr�, veuillez �tablir la connexion avec https.','Para escuchar un registro cifrado, favor de conectarse por https.'),
  ('Records list','Record list','Liste des articles','Lista de registros'),
  ('Command','Command','Commande','Mandato'),
  ('Error while generating report','Error while generating report','Erreur lors de la production du rapport','Error al generar el informe'),
  ('No records available','No record available','Pas d\'article disponible','Ning�n registro disponible'),
  ('Play','Play','Lecture','Lectura'),
  ('Listen history','Listen history','Historique d\'�coute','Historial de escucha'),
  ('Event time','Event time','Heure de l\'�v�nement','Hora del acontecimiento'),
  ('File name','File name','Nom du fichier','Nombre del fichero'),
  ('Found','Found','Trouv�','Encontrado'),
  ('records','records','articles','registros'),
  ('Caller ID name','Caller ID name','Nom de l\'identifiant de l\'appelant','Nombre del ID del llamante'),
  ('Be ready after login','Be ready after login','Pr�t d�s la connexion','Estar listo al conectarse'),
  ('Priority','Priority','Priorit�','Prioridad'),
  ('Call condition test [Setup]','Call condition test [Setup]','Test de condition d\'appel [Configuration]','Prueba de condici�n de llamada [Configuraci�n]'),
  ('Test','Test','Test','Prueba'),
  ('Call property','Call property','Propri�t� d\'appel','Propriedad de llamada'),
  ('Call properties','Call properties','Propri�t�s d\'appel','Propriedades de llamada'),
  ('Operator','Operator','Op�rateur','Operador'),
  ('Operators','Operators','Op�rateurs','Operadores'),
  ('Seek value','Seek value','Valeur de recherche','Valor de b�squeda'),
  ('Get DTMF [Setup]','Get DTMF [Setup]','Obtenir DTMF [Configuration]','Obtener DTMF [Configuraci�n]'),
  ('ID','ID','ID','ID'),
  ('Data name','Data name','Nom des donn�es','Nombre de los datos'),
  ('Maximum length','Maximum length','Longueur maximale','Longitud m�xima'),
  ('Timeout','Timeout','D�lai d\'attente','Tiempo de espera'),
  ('Enders','Enders','Indicateurs de fin','Marcas de final'),
  ('Default value','Default value','Valeur par d�faut','Valor por omisi�n'),
  ('Voice message','Voice message','Message vocal','Mensaje vocal'),
  ('Call Ending [Setup]','Call ending [Setup]','Fin de message [Configuration]','Final de llamada [Configuraci�n]'),
  ('Hangup','Hang-up','Raccrochage','Terminaci�n de llamada'),
  ('Soft hangup','Soft hang-up','Transfert en deux �tapes','Transferencia en dos etapas'),
  ('Transfer','Transfer','Transfert','Transferencia'),
  ('Voicemail','Voicemail','Bo�te vocale','Mensajer�a vocal'),
  ('Parameters','Parameters','Param�tres','Par�metros'),
  ('Agent pickup method [Setup]','Agent pickup method [Setup]','M�thode de prise d\'appel par l\'agent [Configuration]','M�todo de toma de llamada por el agente [Configuraci�n]'),
  ('Properties','Properties','Propri�t�s','Propriedades de llamada'),
  ('Minimum required','Minimum required','Minimum requis','Requisito necesario'),
  ('Action during timeout','Action during timeout','Action � l\'expiration de la temporisation','Acci�n al cumplir la temporizaci�n'),
  ('Tie breaker','Tie breaker','D�partage','Desempate'),
  ('Most idle','Most idle','Plus inactif','M�s inactivo'),
  ('Least busy','Least busy','Moins occup�','Menos ocupado'),
  ('Call priority','Call priority','Priorit� d\'appel','Prioridad de llamada'),
  ('Queue name','Queue name','Nom de la file','Nombre de la cola'),
  ('Announcements active','Announcements active','Messages activ�s','Anuncios activados'),
  ('Start with announcement','Start with announcement','D�buter avec message','Empezar con anuncio'),
  ('Frequency','Frequency','Fr�quence','Frecuencia'),
  ('Announcement of current hold time','Announcement of current hold time','Message sur le temps de garde actuel','Anuncio del tiempo de retenci�n actual'),
  ('Voice messages','Voice messages','Messages vocaux','Mensajes vocales'),
  ('Thank you message','Thank you message','Message de remerciement','Mensaje de gracias'),
  ('Current average time message','Current average time message','Message sur le temps moyen actuel','Mensaje de tiempo medio actual'),
  ('Minutes message','Minutes message','Message sur les minutes','Mensaje sobre minutos'),
  ('Priority increment [Setup]','Priority increment [Setup]','Incr�ment de priorit� [Configuration]','Incremento de prioridad [Configuraci�n]'),
  ('Applications execute [Setup]','Applications execute [Setup]','Ex�cuter applications [Configuration]','Ejecutar aplicaci�n [Configuraci�n]'),
  ('Selected applications','Selected applications','Applications s�lectionn�es','Aplicaciones seleccionadas'),
  ('Available applications','Available applications','Applications disponibles','Aplicaciones disponibles'),
  ('Set','Set','�tablir','Establecer'),
  ('Database query [Setup]','Database query [Setup]','Interrogation de la base de donn�es [Configuration]','Consulta de la base de datos [Configuraci�n]'),
  ('MySQL query','MySQL query','Requ�te MySQL','B�squeda MySQL'),
  ('Result name','Result name','Nom du r�sultat','Nombre del resultado'),
  ('Switch statement [Setup]','Switch statement [Setup]','�nonc� de commutation [Configuration]','Sentencia de conmutaci�n [Configuraci�n]'),
  ('Values','Values','Valeurs','Valores'),
  ('Like','Like','Semblable �','Parecido a'),
  ('Counter [Setup]','Counter [Setup]','Compteur [Configuration]','Contador [Configuraci�n]'),
  ('Attached to','Attached to','Associ� �','Vinculado a'),
  ('Call','Call','Appel','Llamada'),
  ('Reset','Reset','R�initialiser','Restablecer'),
  ('Get statistic [Setup]','Get statistic [Setup]','Obtenir statistique [Configuration]','Obtener estad�stica [Configuraci�n]'),
  ('Queues statistics','Queue statistics','Statistiques sur les files','Estad�sticas sobre colas'),
  ('Calls entered','Calls entered','Appels entr�s','Llamadas entradas'),
  ('Calls distributed','Calls distributed','Appels distribu�s','Llamadas distribuidas'),
  ('Abandonned calls','Abandoned calls','Appels abandonn�s','Llamadas abandonadas'),
  ('Longest waiting call','Longest waiting call','Appel le plus en attente','Llamada con la m�s espera'),
  ('Agents statistics','Agent statistics','Statistiques sur les agents','Estad�sticas sobre los agentes'),
  ('Login agents','Login agents','Agents en session','Agentes conectados'),
  ('Configured agents','Configured agents','Agents configur�s','Agentes configurados'),
  ('AND','AND','AND','AND'),
  ('OR','OR','OR','OR'),
  ('Variable name','Variable name','Nom de la variable','Nombre de la variable'),
  ('Custom server [Setup]','Custom server [Setup]','Serveur personnalis� [Configuration]','Servidor personalizado [Configuraci�n]'),
  ('Library','Library','Biblioth�que','Biblioteca'),
  ('Function','Function','Fonction','Funci�n'),
  ('Enter extra data name','Enter extra data name','Indiquer nom des donn�es additionnelles','Indicar nombre de los datos adicionales'),
  ('Available properties','Available properties','Propri�t�s disponibles','Propriedades disponibles'),
  ('New property','New property','Nouvelle propri�t�','Nueva propriedad'),
  ('Open script','Open script','Script d\'ouverture','Script de apertura'),
  ('Open','Open','Ouvrir','Abrir'),
  ('Save script as','Save script as','Enregistrer script sous','Guardar script como'),
  ('Save as','Save as','Enregistrer sous','Guardar como'),
  ('Script name','Script name','Nom du script','Nombre del script'),
  ('Whole script validation','Whole script validation','Validation du script entier','Validaci�n del script entero'),
  ('Help for commissions','Help for commissions','Aide relative aux commissions','Ayuda acerca de las comisiones'),
  ('Real-time adherence view for','Real-time adherence view for','Affichage de l\'adh�sion en temps r�el pour','Visualizaci�n en tiempo real de la conformidad al horario para'),
  ('Work period','Work period','P�riode de travail','Periodo de trabajo'),
  ('Adherence value','Adherence value','Valeur d\'adh�sion','Valor de conformidad'),
  ('yes','yes','oui','s�'),
  ('no','no','non','no'),
  ('Break/Meal','Break/Meal','Pause/Repas','Descanso/Almuerzo'),
  ('Break/Meal period','Break/Meal period','P�riode Pause/Repas','Periodo Descanso/Almuerzo'),
  ('Gap between work and break','Gap between work and break','S�paration entre travail et pause','Separaci�n entre trabajo y descanso'),
  ('Global adherence','Global adherence','Adh�sion globale','Conformidad global'),
  ('View agent schedule','View agent schedule','Afficher horaire de l\'agent','Visualizar horario del agente'),
  ('Work','Work','Travail','Trabajo'),
  ('View adherence details','View adherence details','Afficher donn�es sur l\'adh�sion','Visualizar datos sobre la conformidad'),
  ('Agent personal info','Agent personal info','Information personnelle sur l\'agent','Datos personales sobre el agente'),
  ('Host name','Host name','Nom de l\'h�te','Nombre de anfitri�n'),
  ('First login','First login','Premi�re connexion','Primera conexi�n'),
  ('You are at','You are at','Vous �tes �...','Usted est� en...'),
  (' pixels',' pixels',' pixels',' p�xeles'),
  (' was LOGGED OUT.\n Should be logged in during this period',' was LOGGED OUT.\n Should be logged in during this period',' �tait D�CONNECT�.\n Devrait �tre en session pendant cette p�riode.',' estaba DESCONECTADO.\n Deber�a estar conectado durante este periodo.'),
  (' was LOGGED IN.\n Should be logged in during this period',' was LOGGED IN.\n Should be logged in during this period',' �tait CONNECT�.\n Devrait �tre en session pendant cette p�riode.',' estaba CONECTADO.\n Deber�a estar conectado durante este periodo.'),
  ('Click Start in','Click Start in','Cliquer sur D�marrer','Hacer clic sobre Comenzar'),
  ('under Work Force Management--Adherence to view adherence data for this day',' under Work Force Management--Adherence to view adherence data for this day',' dans Gestion des effectifs--Adh�sion pour afficher les donn�es pour cette journ�e.',' en Gesti�n del personal--Conformidad para ver los datos de este d�a sobre la conformidad.'),
  ('No schedule data found in database. Please load schedule data for this day','No schedule data found in database. Please load schedule data for this day','L\'horaire n\'a pas �t� trouv� dans la base de donn�es. Veuillez charger les donn�es de l\'horaire pour cette journ�e.','No se ha encontrado el horario en la base de datos. Favor de cargar los datos del horario para este d�a.'),
  ('New script','New script','Nouveau script','Nuevo script'),
  ('Delete script','Delete script','Supprimer script','Suprimir script'),
  ('Script statistics','Script statistics','Statistiques sur le script','Estad�sticas sobre el script'),
  ('Exit','Exit','Sortir','Salir'),
  ('Undo','Undo','Annuler','Deshacer'),
  ('Redo','Redo','R�tablir','Rehacer'),
  ('Clear diagram','Clear diagram','Effacer diagramme','Borrar gr�fico'),
  ('Validate diagram','Validate diagram','Valider diagramme','Validar gr�fico'),
  ('Delete link','Delete link','Supprimer lien','Suprimir enlace'),
  ('Zoom diagram','Zoom diagram','Agrandir diagramme','Acercar gr�fico'),
  ('Unzoom diagram','Unzoom diagram','R�duire diagramme','Alejar gr�fico'),
  ('Undo zooming','Undo zooming','Annuler le zoom','Deshacer el zoom'),
  ('Statements','Statements','�nonc�s','Sentencias'),
  ('User manual','User manual','Manuel de l\'utilisateur','Manual del usuario'),
  ('Agent pickup method','Agent pickup method','M�thode de prise d\'appel par l\'agent','M�todo de toma de llamada por el agente'),
  ('Caller priority increment','Caller priority increment','Incr�ment de priorit� d\'appel','Incremento de prioridad del llamante'),
  ('Application execute','Application execute','Ex�cuter application','Executar aplicaci�n'),
  ('Get string','Get string','Obtenir cha�ne','Obtener cadena'),
  ('Get dtmf','Get dtmf','Obtenir dtmf','Obtenci�n dtmf'),
  ('Database query','Database query','Consultation de la base de donn�es','B�squeda en la base de datos'),
  ('Custom server','Custom server','Serveur personnalis�','Servidor personalizado'),
  ('End call','End call','Terminer l\'appel','Terminar la llamada'),
  ('If ... else ...','If ... else ...','Si ... alors ...','Si ... si no ...'),
  ('Switch... case...','Switch... case...','Commutateur... cas...','Conmutador... caso...'),
  ('Counter','Counter','Compteur','Contador'),
  ('Get statistic','Get statistic','Obtenir statistique','Obtener estad�stica'),
  ('New calling list wizard','New calling list wizard','Assistant Cr�ation d\'une liste d\'appel','Asistente Creaci�n de una lista de llamada'),
  ('Calling list wizard','Calling list wizard','Assistant Liste d\'appel','Asistente Lista de llamada'),
  ('Warning: No sheet found in this xls file','Warning: No sheet found in this xls file','Avertissement: Ce fichier .xls ne contient aucune feuille','Aviso: No se ha encontrado hojas en este fichero .xls'),
  ('Setting name','Setting name','Nom de configuration','Nombre de configuraci�n'),
  ('Don\'t forget to select an override cause','Don\'t forget to select an override cause','N\'oubliez pas de s�lectionner la raison du changement','No se olvide de seleccionar el motivo para el cambio'),
  ('Do you really want to close this day','Do you really want to close this day?','�tes-vous certain de vouloir fermer cette journ�e?','�Est� seguro de que desea cerrar este d�a?'),
  ('Please select a group','Please select a group','Veuillez s�lectionner un groupe','Favor de seleccionar un grupo'),
  ('Please select an agent','Please select an agent','Veuillez s�lectionner un agent','Favor de seleccionar un agente'),
  ('You cannot add a row for a date prior to today. Please change the date!','You cannot add a row for a date prior to today. Please change the date!','Vous ne pouvez pas ajouter une rang�e pour une date ant�rieure � celle d\'aujourd\'hui. Veuillez changer la date.','No puede a�adir una l�nea para una fecha anterior a la de hoy. Favor de cambiar la fecha.'),
  ('You must select an activity for each row, please verify','You must select an activity for each row. Please verify','Vous devez s�lectionner une activit� pour chaque rang�e. Veuillez v�rifier que','Debe seleccionar una actividad en cada l�nea. Favor de comprobar que'),
  ('You must enter a paid time for each row, please verify','You must enter a paid time for each row. Please verify','Vous devez indiquer un temps r�mun�r� pour chaque rang�e. Veuillez v�rifier que','Debe indicar un tiempo pagado en cada l�nea. Favor de comprobar que'),
  ('Login time','Login time','Temps de connexion','Tiempo de conexi�n'),
  ('Not paid NRR time','Not paid NRR time','Temps RPP non pay�','Tiempo MNL no pagado'),
  ('Extra paid NRR time','Extra paid NRR time','Temps RPP suppl�mentaire pay�','Tiempo MNL pagado adicional'),
  ('Total paid time','Total paid time','Temps total r�mun�r�','Tiempo total pagado'),
  ('Search options','Search options','Options de recherche','Opciones de b�squeda'),
  ('Save modified','Save modified','Enregistrer les modifications','Guardar las modificaciones'),
  ('Close this day','Close this day','Fermer la journ�e','Cerrar el d�a'),
  ('Select an agent','Select an agent','S�lectionner un agent','Seleccionar un agente'),
  ('View data','View data','Afficher les donn�es','Visualizar los datos'),
  ('Paid time','Paid time','Temps r�mun�r�','Tiempo pagado'),
  ('Override','Override','Modifier','Cambiar'),
  ('Override by','Override by','Modifier par','Cambiar por'),
  ('Correction','Correction','Correction','Correcci�n'),
  ('Override time','Override time','Modifier le temps','Cambiar el tiempo'),
  ('Override cause','Override cause','Raison de la modif.','Motivo del cambio'),
  ('Custom cause','Custom cause','Raison adapt�e','Motivo adaptado'),
  ('Starphone crash','AheevaPhone crash','Panne du AheevaPhone','Fallo de AheevaPhone'),
  ('Fire alarm','Fire alarm','Avertisseur d\'incendie','Alarma de incendios'),
  ('Computer crash','Computer crash','Panne du syst�me','Fallo de sistema'),
  ('Power failure','Power failure','Panne d\'�lectricit�','Apag�n'),
  ('Agent displacement','Agent displacement','D�placement de l\'agent','Desplazamiento de agente'),
  ('Sent Home (3hrs paid)','Sent Home (3hrs paid)','Quart �court� (3 h. pay�es)','Turno abreviado (3 h. pagadas)'),
  ('First day integration','First day integration','Premi�re journ�e d\'int�gration','Primer d�a de integraci�n'),
  ('Floor support','Floor support','Soutien � la production','Ayuda a la producci�n'),
  ('HR interview','HR interview','Entrevue RH','Entrevista RH'),
  ('Other','Other','Autre','Otro'),
  ('Add a row','Add a row','Ajouter une rang�e','A�adir una l�nea'),
  ('Save rows','Save rows','Enregistrer les rang�es','Guardar las l�neas'),
  ('Exceptions','Exceptions','Exceptions','Excepciones'),
  ('Select start date','Select start date','S�lectionner la date de d�but','Seleccionar la fecha de comienzo'),
  ('Select stop date','Select stop date','S�lectionner la date de fin','Seleccionar la fecha de fin'),
  ('Date','Date','Date','Fecha'),
  ('System failure','System failure','Panne de syst�me','Fallo de sistema'),
  ('Working at Fido','Working at Fido','Travaille chez Fido','Trabajando con Fido'),
  ('View agent groups hours summary','View agent groups hours summary','Afficher le sommaire des heures des groupes','Visualizar el sumario de las horas de los grupos'),
  ('Billable','Billable','Facturable','Facturar'),
  ('View exceptions','View exceptions','Afficher les exceptions','Visualizar las excepciones'),
  ('Financial configuration','Financial configuration','Financial configuration','Configuraci�n financiera'),
  ('Calling List Report Details','Calling List Report Details','Rapport d�taill� sur les listes d\'appel','Informes sobre las listas de llamada'),
  ('Live monitoring login','Live monitoring login','Live monitoring login','Conexi�n de supervisi�n viva'),
  ('Live monitoring password','Live monitoring password','Live monitoring password','Contrase�a de supervisi�n viva'),
  ('Retype live monitoring password','Retype live monitoring password','Retype live monitoring password','Escribir de nuevo la contrase�a a m�quina de supervisi�n viva'),
  ('Predefined Roles','Predefined Roles','R�les pr�d�finis','Papeles predefinidos'),
  ('Custom','Custom','Custom','Custom'),
  ('Tenants','Tenants','Tenants','Tenants'),
  ('No statistics are currently available','No statistics are currently available','Aucune statistique n\'est disponible actuellement','Ninguna estad�stica est� disponible actualmente'),
  ('Security','Security','S�curit�','Securidad'),
  ('Add new tenant','Add new tenant','Ajouter un nouveau client','A�adir un cliente'),
  ('Security settings','Security settings','Param�tres de s�curit�','Par�metros de securidad'),
  ('Allowed users','Allowed users','Usagers permis','Usuarios permitidos'),
  ('Not allowed users','Not allowed users','Usagers non permis','usuarios no permitidos'),
  ('No statistics are currently available.','No statistics are currently available.','Aucune statistique n\'est disponible actuellement.','Ninguna estad�stica est� disponible actualmente.'),
  ('Disallowed users','Disallowed users','Utilisateurs non autoris�s','Usuarios no autorizados'),
  ('Assign at least one tenant','Assign at least one tenant','Assigner au moins un profil','Asignar por lo menos un perfil'),
  ('Financial information','Financial information','Informations financi�res','Informaci�n financiera'),
  ('Work Force Management','Work force management','Gestion des effectifs','Gesti�n del personal'),
  ('Your schedule data has been saved properly!','Your schedule data has been saved properly!','Vos donn�es sur l\'horaire ont �t� sauvegard�es correctement.','Sus datos sobre el horario se han guardado correctamente.'),
  ('Your recording schedule has been saved properly!','Your recording schedule has been saved properly!','Votre programme d\'enregistrement a �t� sauvegard� correctement.','Su programa de grabaci�n se ha guardado correctamente.'),
  ('Your description should be filled. Use valid characters.','Your description should be filled. Use valid characters.','Vous devez compl�ter la description. Utilisez des caract�res valides.','Debe rellenar la descripci�n. Use caracteres v�lidos.'),
  ('You must specify an email address to which the report will be sent','You must specify an email address to which the report will be sent','Vous devez indiquer une adresse de courriel pour l\'exp�dition du rapport','Debe indicar una direcci�n de correo electr�nico para el envi� del informe'),
  ('You must select one type of commission for this treatment','You must select one type of commission for this treatment','Vous devez s�lectionner un type de commission pour ce traitement','Debe seleccionar un tipo de comisi�n para �ste tratamiento'),
  ('You must select an activity for this agent','You must select an activity for this agent','Vous devez s�lectionner une activit� pour l\'agent','Debe seleccionar una actividad para el agente'),
  ('You must select a payroll company','You must select a payroll company','Vous devez s�lectionner une entreprise de paie','Debe seleccionar una empresa pagadora'),
  ('You must first save the agent to set the skills','You must first save the agent to set the skills','Vous devez d\'abord enregistrer l\'agent avant d\'�tablir les comp�tences','Debe registrar el agente antes de establecer las habilidades'),
  ('You must enter the encryption server IP or uncheck the encryption box','You must enter the encryption server IP or uncheck the encryption box','Vous devez saisir l\'IP du serveur de chiffrement ou d�sactiver la case de chiffrement','Debe introducir el IP del servidor de cifrado o desactivar el recuadro de selecci�n de cifrado'),
  ('You must enter the encryption method or uncheck the encryption box','You must enter the encryption method or uncheck the encryption box','Vous devez saisir une m�thode de chiffrement ou d�sactiver la case de chiffrement','Debe introducir el m�todo de cifrado o desactivar el recuadro de selecci�n de cifrado'),
  ('You must enter the amount of override salary of that group','You must enter the amount of override salary of that group','Vous devez saisir le nouveau salaire de ce groupe','Debe introducir el nuevo sueldo para este grupo'),
  ('You must enter a Mop Treatment name','You must enter a Mop Treatment name','Vous devez saisir un nom de traitement pour la m�thode de paiement','Debe introducir un nombre de tratamiento para el m�todo de pago'),
  ('You must enter a Mop name','You must enter a Mop name','Vous devez saisir un nom de m�thode de paiement','Debe introducir un nombre de m�todo de pago'),
  ('You must enter a GROUP QUEUE','You must enter a GROUP QUEUE','Vous devez saisir un NOM DE FILE','Debe introducir un NOMBRE DE COLA'),
  ('You must enter a GROUP NAME','You must enter a GROUP NAME','Vous devez saisir un NOM DE GROUPE','Debe introducir un NOMBRE DE GRUPO'),
  ('You must acknowledge and enter a comment before submitting','You must acknowledge and enter a comment before submitting','Vous devez confirmer et saisir un commentaire avant de soumettre les donn�es','Debe confirmar e introducir un comentario antes de enviar los datos'),
  ('You cannot select a reason several times','You cannot select a reason several times','Vous ne pouvez pas s�lectionner une raison plusieurs fois','No puede seleccionar un motivo varias veces'),
  ('You cannot extract data to cover more than one week','You cannot extract data to cover more than one week','Vous ne pouvez pas extraire des donn�es qui portent sur plus d\'une semaine.','No puede extraer datos que abarquen m�s de una semana'),
  ('You can associate only one treatment to this MOP. Please drop the currently selected treatment and select another one','You can associate only one treatment to this MOP. Please drop the currently selected treatment and select another one','Vous pouvez associer un seul traitement � cette m�thode de paiement. Veuillez laisser le traitement actuellement s�lectionn� et en choisir un autre.','Puede asociar un solo tratamiento con el m�todo de pago. Favor de dejar el tratamiento ya seleccionado y escoger otro.'),
  ('Yearly','Yearly','Annuel -','Anual -'),
  ('Year','Year','Ann�e','A�o'),
  ('Wrong number','Wrong number','Mauvais num�ro','N�mero incorrecto'),
  ('Wrap-up time','Wrap-up time','Temps en post-appel','Tiempo en post llamada'),
  ('Wrap-up count','Wrap-up count','Compte des traitements post-appel','Conteo de procesamientos post llamada'),
  ('Wrap-up calls','Wrap-up calls','Traitements post-appel','Procesamientos post llamada'),
  ('Wrap-up average','Wrap-up average','Moyenne de traitement post-appel','Media de procesamiento post llamada'),
  ('Workshop','Workshop','Atelier','Taller de trabajo'),
  ('Work schedule','Work schedule','Horaire de travail','Horario de trabajo'),
  ('Work manual setting','Work manual setting','R�glage manuel Travail','Ajuste manual Trabajo'),
  ('where IP','where IP','o� IP','donde IP'),
  ('Weight','Weight','Pond�ration','Ponderaci�n'),
  ('Week selector','Week selector','S�lecteur de semaine','Seleccionador de semana'),
  ('Warning:\nYou are about to delete this routing script.\nDo you want to continue?','Warning:\nYou are about to delete this routing script.\nDo you want to continue?','Avertissement:\nVous �tes sur le point de supprimer ce script d\'acheminement.\nVoulez-vous poursuivre?','Aviso:\nEst� a punto de suprimir �ste script de encaminamiento.\n�Desea proseguir?'),
  ('Warning:\nYou are about to delete the','Warning:\nYou are about to delete the','Avertissement:\nVous �tes sur le point de supprimer le','Aviso:\nEst� a punto de suprimir el'),
  ('Warning: URL host:','Warning: URL host:','Avertissement: URL h�te:','Aviso: URL de anfitri�n:'),
  ('WARNING','WARNING','AVERTISSEMENT','AVISO'),
  ('Waiting time','Waiting time','Temps d\'attente','Tiempo de espera'),
  ('Waiting count','Waiting count','Compte des appels en attente','Conteo de llamadas en espera'),
  ('Waiting average','Waiting average','Temps d\'attente moyen','Tiempo de espera medio'),
  ('Wait','Wait','Attente','Espera'),
  ('View schedule parameters','View schedule parameters','Afficher les param�tres de l\'horaire','Visualizar los par�metros del horario'),
  ('View schedule','View schedule','Afficher l\'horaire','Visualizar el horario'),
  ('view','view','afficher','visualizar'),
  ('Value of path is: null','Value of path is: null','\\nValeur du chemin d\'acc�s est: nulle','\\nValor de la v�a de acceso es: nulo'),
  ('Value of path is not null','Value of path is not null','\\nLa valeur du chemin d\'acc�s n\'est pas nulle','\\nValor de la v�a de acceso no es nulo'),
  ('Validating diagram','Validating diagram','En cours de validation du diagramme','Validando el gr�fico'),
  ('Use','Use','Utiliser','Usar'),
  ('Undo Publish','Undo Publish','D�faire Publier','Deshacer Publicar');


INSERT INTO `cfg_language` (`KEY_WORD`, `ENGLISH`, `FRENCH`, `ESPAGNOL`) VALUES 
  ('Unanswered calls','Unanswered calls','Appels sans r�ponse','Llamadas sin respuesta'),
  ('Unanswered call report','Unanswered call report','Rapport sur les appels sans r�ponse','Informe sobre las llamadas sin respuesta'),
  ('Unanswered call detailled report','Unanswered call detailled report','Rapport d�taill� sur les appels sans r�ponse','Informe detallado sobre las llamadas sin respuesta'),
  ('Unanswered','Unanswered','Sans r�ponse','No contestadas'),
  ('Unable to delete non-empty site.\nThis site contains recording server','Unable to delete non-empty site.\nThis site contains recording server','Incapable de supprimer un site non-vide.\nLe site contient un serveur d\'enregistrement','No se puede suprimir un sitio que no est� vac�o.\nEste sitio contiene un servidor de grabaci�n'),
  ('Unable to delete non-empty site.\nThis site contains encryption server','Unable to delete non-empty site.\nThis site contains encryption server','Incapable de supprimer un site non-vide.\nLe site contient un serveur de chiffrement','No se puede suprimir un sitio que no est� vac�o.\nEste sitio contiene un servidor de cifrado'),
  ('Unable to delete non-empty site.\nThis site contains Asterisk PBX','Unable to delete non-empty site.\nThis site contains Asterisk PBX','Incapable de supprimer un site non-vide.\nLe site contient le PBX de Asterisk','No se puede suprimir un sitio que no est� vac�o.\nEste sitio contiene el PBX de Asterisk'),
  ('Two-step transfer time','Two-step transfer time','Temps de transfert en deux �tapes','Tiempo de transfer. en dos etapas'),
  ('Two-step transfer count','Two-step transfer count','Compte des transferts en deux �tapes','Conteo de transferencias en dos etapas'),
  ('Two-step transfer calls','Two-step transfer calls','Transfert d\'appels en deux �tapes','Transferencia de llamadas en dos etapas'),
  ('Two-step transfer','Two-step transfer','Transfert � deux �tapes','Transferencia en dos etapas'),
  ('Transfer time','Transfer time','Temps de transfert','Tiempo de transferencia'),
  ('Transfer count','Transfer count','Compte des transferts','Conteo de transferencias'),
  ('Transfer calls','Transfer calls','Appels transf�r�s','Llamadas transferidas'),
  ('Transfer average','Transfer average','Moyenne de transfert','Media de transferencia'),
  ('Training type','Training type','Type de formation','Tipo de formaci�n'),
  ('Training hours','Training hours','Heures de formation','Horas de formaci�n'),
  ('Training','Training','Formation','Formaci�n'),
  ('Trade','Trade','�change','Cambio'),
  ('Total/day','Total/day','Total/jour','Total/d�a'),
  ('Total records','Total records','Total des enregistrements','Total de registros'),
  ('Total hours','Total hours','Total heures','Total horas'),
  ('Total calls transferred','Total calls transferred','Total des transferts d\'appels','Total de transfer. de llamadas'),
  ('Tolerance','Tolerance','Tol�rance','Tolerancia'),
  ('This tolerance is numeric. Please change','This tolerance is numeric. Please change','La valeur de tol�rance est num�rique. Veuillez la changer','El valor de esta tolerancia es num�rico. Favor de cambiarlo'),
  ('This QUEUE is already assigned. You must enter a NEW QUEUE','This QUEUE is already assigned. You must enter a NEW QUEUE','Cette FILE a d�j� �t� assign�e. Vous devez saisir une NOUVELLE FILE','�sta COLA ya ha sido asignada. Debe introducir una COLA NUEVA'),
  ('This duration is numeric. please change it','This duration is numeric. please change it','La dur�e est num�rique. Veuillez la changer','La duraci�n es num�rica. Favor de cambiarla'),
  ('There is no skill available','There is no skill available','Il n\'y a pas de comp�tence disponible','No hay habilidad disponible'),
  ('The numbers to put in a Do-not-call list must be made of digits.','The numbers to put in a Do-not-call list must be made of digits.','Les num�ros qui figurent dans une liste Ne-pas-appeler doivent �tre compos�s de chiffres.','Los n�meros en una lista de n�meros No-llamar deben estar compuestos de cifras.'),
  ('The maximum wrap-up time that does not affect productivity must be in seconds','The maximum wrap-up time that does not affect productivity must be in seconds','Le temps maximum post-appel qui ne produise pas d\'effet sur la productivit� doit �tre en secondes','El tiempo m�ximo en post-llamada que no afecte a la productividad debe indicarse en segundos'),
  ('The maximum wrap-up time must be less than 99999 seconds','The maximum wrap-up time must be less than 99999 seconds','Le temps maximum post-appel doit �tre inf�rieur � 99999 secondes','El tiempo m�ximo en post-llamada debe ser inferior a 99999 segundos'),
  ('The maximum wrap-up time must be in seconds','The maximum wrap-up time must be in seconds','Le temps maximum post-appel doit �tre exprim� en secondes','El tiempo m�ximo en post-llamada debe indicarse en segundos'),
  ('The maximum wrap-up time must be at least 1 second','The maximum wrap-up time must be at least 1 second','Le temps maximum post-appel doit �tre d\'au moins 1 seconde','El tiempo m�ximo en post-llamada debe ser por lo menos 1 segundo'),
  ('The file path is null! Please check data in your database','The file path is null! Please check data in your database','Le chemin d\'acc�s au fichier est nul. Veuillez v�rifier les donn�es dans votre base de donn�es.','La v�a de acceso al fichero es nula. Favor de comprobar los datos en la base de datos.'),
  ('The current script has been modified.\nDo you want to save it?','The current script has been modified.\nDo you want to save it?','Le script actuel a �t� modifi�.\nVoulez-vous l\'enregistrer?','El script actual ha sido modificado.\n�Desea registrarlo?'),
  ('The caller ID cannot be more than 100 characters','The caller ID cannot be more than 100 characters','L\'identification de l\'appelant ne peut pas comporter plus de 100 caract�res','El ID del llamante no puede tener m�s de 100 caracteres'),
  ('Telephony data','Telephony data','Donn�es de t�l�phonie','Datos de telefon�a'),
  ('Team schedule','Team schedule','Horaire de l\'�quipe','Horario del equipo'),
  ('Talk time','Talk time','Temps en ligne','Tiempo de habla'),
  ('Table columns','Table columns','Colonnes de table','Columnas de tabla'),
  ('Summary report','Summary report','Rapport sommaire','Informe sumario'),
  ('Success','Success','R�ussites','�xitos'),
  ('Sub total','Sub total','Sous-total','Subtotal'),
  ('Starting date must be prior to ending date','Starting date must be prior to ending date','La date de d�but doit �tre ant�rieure � la date de fin','La fecha de comienzo debe ser anterior a la fecha de fin'),
  ('Start time','Start time','Heure de d�but','Hora de comienzo'),
  ('split shift','split shift','quart bris�','jornada partida'),
  ('Specify the server name','Specify the server name','Indiquer le nom du serveur','Especificar el nombre del servidor'),
  ('Specify the server internal port for secure communications','Specify the server internal port for secure communications','Indiquer le port interne du serveur pour les communications s�curis�es','Especificar el puerto interno del servidor para comunicaciones seguras'),
  ('Specify the server internal port','Specify the server internal port','Indiquer le port interne du serveur','Especifical el puerto interno del servidor'),
  ('Specify the server internal host','Specify the server internal host','Indiquer le serveur h�te interne','Especificar el servidor de anfitri�n interno'),
  ('Specify the server external port for secure communications','Specify the server external port for secure communications','Indiquer le port externe du serveur pour les communications s�curis�es','Especificar el puerto externo de servidor para comunicaciones seguras'),
  ('Specify the server external port','Specify the server external port','Indiquer le port externe du serveur','Especificar el puerto externo del servidor'),
  ('Specify the server external host','Specify the server external host','Indiquer le serveur h�te externe','Especificar el servidor de anfitri�n externo'),
  ('Specify the load balance for agents','Specify the load balance for agents','Indiquer la valeur d\'�quilibre de charge pour les agents','Especificar el valor de equilibrio de carga para los agentes'),
  ('Specify the file extension','Specify the file extension','Indiquer l\'extension du fichier','Especificar la extensi�n del fichero'),
  ('Specify the encryption server name','Specify the encryption server name','Indiquer le nom du serveur de chiffrement','Especificar el nombre del servidor de cifrado'),
  ('Specify the directory for sales recordings','Specify the directory for sales recordings','Indiquer le r�pertoire d\'enregistrement des ventes','Especificar el directorio de grabaci�n de las ventas'),
  ('Specify the directory for no sales recordings','Specify the directory for no sales recordings','Indiquer le r�pertoire d\'enregistrement des pas-de-ventes','Especificar el directorio de grabaci�n de las sin-ventas'),
  ('Specify the CSV file delimiters and quotes','Specify the CSV file delimiters and quotes','Indiquer les d�limiteurs et type de guillemets du fichier CSV (coma-separated values)','Especificar los delimitadores y tipo de comillas de fichero CSV (coma-separated values)'),
  ('Specify the calling list file','Specify the calling list file','Indiquer le fichier de la liste d\'appel','Especificar el fichero de la lista de llamada'),
  ('Specify switch password','Specify switch password','Indiquer le mot de passe du commutateur','Especificar la contrase�a del conmutador'),
  ('Specify switch name','Specify switch name','Indiquer le nom du commutateur','Especificar el nombre del conmutador'),
  ('Specify switch internal host name or IP address','Specify switch internal host name or IP address','Indiquer le nom d\'h�te interne ou l\'adresse IP du commutateur','Especificar la direcci�n IP o el nombre de anfitri�n internos del conmutador'),
  ('Specify switch external host name or IP adresss','Specify switch external host name or IP adresss','Indiquer le nom d\'h�te ou l\'adresse IP externes du commutateur','Especificar la direcci�n IP o el nombre de anfitri�n externos del conmutador'),
  ('Specify server password','Specify server password','Indiquer le mot de passe du serveur','Especificar la contrase�a del servidor'),
  ('Specify encryption server URL','Specify encryption server URL','Indiquer l\'URL du serveur de chiffrement','Especificar el URL del servidor de cifrado'),
  ('Specify encryption server protocol','Specify encryption server protocol','Indiquer le protocole du serveur de chiffrement','Especificar el protocolo del servidor de cifrado'),
  ('Specify encryption server internal port','Specify encryption server internal port','Indiquer le port interne du serveur de chiffrement','Especificar el puerto interno del servidor de cifrado'),
  ('Specify encryption server internal host','Specify encryption server internal host','Indiquer le nom d\'h�te du serveur interne de chiffrement','Especificar el servidor de anfitri�n interno de cifrado'),
  ('Specify encryption server external port','Specify encryption server external port','Indiquer le port externe du serveur de chiffrement','Especificar el puerto externo del servidor de cifrado'),
  ('Specify encryption server external host','Specify encryption server external host','Indiquer le serveur h�te externe de chiffrement','Especificar el servidor de anfitri�n externo de cifrado'),
  ('Space column','Space column','Espacer colonnes','Espaciar las columnas'),
  ('site.\nDo you want to continue?','site.\nDo you want to continue?','site.\nVoulez-vous poursuivre?','sitio.\n�Desea proseguir?'),
  ('Single transfer time','Single transfer time','Temps de transfert en une �tape','Tiempo de transfer. monoetapa'),
  ('Single transfer count','Single transfer count','Compte des transferts en une �tape','Conteo de transferencias monoetapa'),
  ('Single transfer calls','Single transfer calls','Transfert d\'appels en une �tape','Transferencia monoetapa de llamadas'),
  ('Single transfer','Single transfer','Transfert en une �tape','Transferencia monoetapa'),
  ('Show grid','Show grid','Afficher quadrillage','Mostrar cuadr�cula'),
  ('Shifts','Shifts','Quarts','Turnos'),
  ('Shift trade management for group','Shift trade management for group','Gestion des �changes de quart pour le groupe','Gesti�n de los cambios de turno para el grupo'),
  ('Shift trade','Shift trade','�change de quart','Cambio de turno'),
  ('shift assigned for this day','shift assigned for this day','quart assign� pour cette journ�e','turno asignado para este d�a'),
  ('Shift','Shift','Quart','Turno'),
  ('Set skills','Set skills','�tablir comp�tences','Establecer habilidades'),
  ('Set schedule','Set schedule','�tablir horaire','Establecer horario'),
  ('Set quit','Set quit','�tablir d�mission','Establecer dimisi�n'),
  ('Set absent','Set absent','Indiquer absent','Establecer ausente'),
  ('Scheduled time','Scheduled time','Temps pr�vu','Tiempo previsto'),
  ('Scheduled','Scheduled','Pr�vu','Previsto'),
  ('Saving','Saving','En cours d\'enregistrement','Registrando'),
  ('save Video','save Video','enregistrer Vid�o','guardar Video'),
  ('Save successful','Save successful','Enregistrement r�ussi','Se guardo correctamente'),
  ('Save list settings for loading (optional)','Save list settings for loading (optional)','Enregistrer les param�tres de chargement de la liste (facultatif)','Guardar los par�metros de carga de la lista (facultativo)'),
  ('save Audio','save Audio','enregistrer Audio','guardar Audio'),
  ('Save & Close','Save & Close','Enregistrer & Fermer','Guardar & Cerrar'),
  ('Sales/h','Sales/h','Ventes/h','Ventas/h'),
  ('Sales per hour','Sales per hour','Ventes par heure','Ventas por hora'),
  ('Sale info','Sale info','Donn�es sur les ventes','Informaci�n sobre ventas'),
  ('Sale','Sale','Vente','Venta'),
  ('Right-click to download','Right-click to download','Cliquez avec le bouton droit pour t�l�charger','Pinche con el bot�n derecho para descargar'),
  ('Resource directory is:','Resource directory is:','Le r�pertoire des ressources est:','Directorio de recurso es:'),
  ('Report starting date must be Sunday!','Report starting date must be Sunday!','La journ�e de d�but du rapport doit �tre dimanche.','El d�a de comienzo del informe debe ser domingo.'),
  ('Report ending date must be Saturday!','Report ending date must be Saturday!','La journ�e de fin du rapport doit �tre samedi.','La fecha de fin del informe debe ser s�bado.'),
  ('Refused','Refused','Refus�','Rechazado'),
  ('Refusals/h','Refusals/h','Rejets/h','Rechazos/h'),
  ('Refer path','Refer path','Chemin d\'acc�s de r�f�rence','V�a de acceso de referencia'),
  ('Received a total of [','Received a total of [','A re�u un total de [','Se ha recibido un total de ['),
  ('Reason','Reason','Raison','Motivo'),
  ('Real hours (without breaks)','Real hours (without breaks)','Heures r�elles (sans pauses)','Horas reales (sin descansos)'),
  ('Queue configuration','Queue configuration','Configuration des files d\'attente','Configuraci�n de las colas'),
  ('Publish','Publish','Publier','Publicar'),
  ('Protocol','Protocol','\\nProtocole','\\nProtocolo'),
  ('Productivity','Productivity','Productivit�','Productividad'),
  ('Production time exception report','Production time exception report','Relev� des exceptions aux temps de production','Informe de excepci�n a los tiempos de producci�n'),
  ('Production time','Production time','Temps en production','Tiempo en producci�n'),
  ('Production hours','Production hours','Heures de production','Horas de producci�n'),
  ('Production','Production','Production','Producci�n'),
  ('Preview','Preview','Pr�visualiser','Previsualizar'),
  ('Possible Call Conditions are:','Possible Call Conditions are:','Les conditions d\'appel possibles sont:','Las condiciones de llamada posibles son:'),
  ('Port','Port','Port','Puerto'),
  ('Please wait while the new recording server is being modified','Please wait while the new recording server is being modified','Veuillez attendre que la modification du nouveau serveur d\'enregistrement soit termin�e','Favor de esperar que se termine la modificaci�n del nuevo servidor de grabaci�n'),
  ('Please wait while deleting switch','Please wait while deleting switch','Veuillez attendre que la suppression du commutateur soit termin�e','Favor de esperar que se termine la supresi�n del conmutador'),
  ('Please wait for switch modification','Please wait for switch modification','Veuillez attendre que la modification du commutateur soit termin�e','Favor de esperar que se termine la modificaci�n del conmutador'),
  ('Please wait for switch creation','Please wait for switch creation','Veuillez attendre que la cr�ation du commutateur soit termin�e','Favor de esperar que se termine la creaci�n del conmutador'),
  ('Please Unload/Stop the campaign before deleting it','Please Unload/Stop the campaign before deleting it','Veuillez D�charger/Arr�ter la campagne avant de la supprimer','Favor de Descargar/Parar la campa�a antes de suprimirla'),
  ('Please fill all tolerance fields','Please fill all tolerance fields','Veuillez remplir tous les champs de tol�rance','Favor de rellenar todos los campos de tolerancia'),
  ('Please fill all duration fields','Please fill all duration fields','Veuillez remplir tous les champs de dur�e','Favor de rellenar todos los campos de duraci�n'),
  ('Please enter your password','Please enter your password','Veuillez entrer votre mot de passe','Por favor, entre su contrase�a'),
  ('Period','Period','P�riode','Periodo'),
  ('Percentages for queue','Percentages for queue','Pourcentages relatifs � la file','Porcentajes acerca de la cola'),
  ('Percentages compared to Not-ready time','Percentages compared to Not-ready time','Pourcentages en comparaison avec le temps Pas-pr�t','Porcentajes en comparaci�n con el tiempo No-listo'),
  ('Percentages compared to login time','Percentages compared to login time','Pourcentages en comparaison avec le temps de connexion','Porcentajes en comparaci�n con el tiempo en sesi�n'),
  ('Percentages','Percentages','Pourcentages','Porcentajes'),
  ('Percentage over','Percentage over','Pourcentage sup�rieur �','Porcentaje sobrepasa'),
  ('Per record type','Per record type','Par type d\'enregistrement','Por tipo de registro'),
  ('Per record status','Per record status','Par �tat d\'enregistrement','Por estado de registro'),
  ('Per call result','Per call result','Par r�sultat d\'appel','Por resultado de llamada'),
  ('Payroll data','Payroll data','Donn�es salariales','Datos salariales'),
  ('Pay','Pay','Payer','Pagar'),
  ('part-time shift','part-time shift','quart � temps partiel','jornada a tiempo parcial'),
  ('parent','parent','parent','padre'),
  ('Paid time formula','Paid time formula','Formule pour temps r�mun�r�','F�rmula para tiempo pagado'),
  ('Outbound time','Outbound time','Temps appels sortants','Tiempo llamadas salientes'),
  ('Outbound count','Outbound count','Compte des appels sortants','Conteo de llamadas salientes'),
  ('Outbound calls','Outbound calls','Appels sortants','Llamadas salientes'),
  ('Outbound average','Outbound average','Moyenne des appels sortants','Media de llamadas salientes'),
  ('Outbound','Outbound','Sortant','Saliente'),
  ('Other training','Other training','Autre formation','Otra formaci�n'),
  ('Other statistics','Other statistics','Autres statistiques','Otras estad�sticas'),
  ('or more','or more','ou plus','o m�s'),
  ('on disk. Please verify that the recording is still on disk at the right place!','on disk. Please verify that the recording is still on disk at the right place!','sur disque. Veuillez v�rifier que l\'enregistrement est toujours sur le disque et au bon endroit.','en el disco. Favor de comprobar que el grabado permanece en disco y en su lugar.'),
  ('Not-ready time','Not-ready time','Temps Pas-pr�t','Tiempo No-listo'),
  ('Not-Ready count','Not-Ready count','Compte des Pas-pr�ts','Conteo de No-listos'),
  ('Not-ready calls','Not-ready calls','Appels Pas-pr�t','Llamadas No-listo'),
  ('Not-ready average','Not-ready average','Moyenne en Pas-pr�t','Media en No-listo'),
  ('Not reached','Not reached','Non joint','No se comunico'),
  ('Not listened','Not listened','Non �cout�','Sin escuchar'),
  ('No table in your calling list','No table in your calling list','Votre liste d\'appel ne contient aucune table','Su lista de llamada no tiene tabla'),
  ('No sites were defined.\nPlease add site first','No sites were defined.\nPlease add site first','Aucun site n\'a �t� d�fini.\nVeuillez d\'abord ajouter un site','No se han definido sitios.\nFavor de a�adir primero un sitio'),
  ('No site was associated with the new switch','No site was associated with the new switch','Aucun site n\'a �t� associ� au nouveau commutateur','No se ha vinculado un sitio con el nuevo conmutador'),
  ('No site was associated with the new encryption server','No site was associated with the new encryption server','Aucun site n\'a �t� associ� avec le nouveau serveur de chiffrement','No se ha vinculado un sitio con el nuevo servidor de cifrado'),
  ('No search path specified in ctiSocket.properties','No search path specified in ctiSocket.properties','Aucun chemin d\'acc�s de recherche n\'a �t� indiqu� dans ctiSocket.properties','No se ha indicado la v�a de acceso de b�squeda en ctiSocket.properties'),
  ('No search path is specified in file ctiSocket.properties. Please set at least one.','No search path is specified in file ctiSocket.properties. Please set at least one.','Le fichier ctiSocket.properties ne contient pas de chemin d\'acc�s de recherche. Veuillez en indiquer au moins un.','No se ha indicado la v�a de acceso de b�squeda en el fichero ctiSocket.properties. Favor de establecer por lo menos una.'),
  ('No schedule data found in database.','No schedule data found in database.','L\'horaire n\'a pas �t� trouv� dans la base de donn�es.','No se ha encontrado el horario en la base de datos.'),
  ('No sale','No sale','Pas de vente','Ninguna venta'),
  ('No query specifed.','No query specifed.','Aucune consultation d\'indiqu�e.','No se indic� ninguna consulta.'),
  ('No association with the phone number field','No association with the phone number field','Aucune association ne s\'est produite avec le champ du num�ro de t�l�phone','No se ha producido asociaci�n con el campo de n�mero de tel�fono'),
  ('No association has been made','No association has been made','Aucune association n\'a �t� faite','No se ha producido ninguna asociaci�n'),
  ('Next logout','Next logout','Fermeture de session suivante','Pr�xima desconexi�n'),
  ('next day off','next day off','prochain jour de rel�che','d�a libre siguiente'),
  ('name.\nDo you want to continue?','name.\nDo you want to continue?','inconnu.\nVoulez-vous poursuivre?','desconocido.\n�Desea proseguir?'),
  ('name fields: First name and Last name required','name fields: First name and Last name required','champs de nom: Le nom et le nom de famille sont n�cessaires','campos de nombre: Se necesita el nombre y el apellido'),
  ('name','name','nom','nombre'),
  ('More than one starting box were found.','More than one starting box were found.','Plus d\'une bo�te de d�but a �t� trouv�e.','Se ha encontrado m�s de un recuadro de inicio.'),
  ('Month','Month','Mois','Mes'),
  ('Monitoring','Monitoring','Supervision','Supervisi�n'),
  ('Minimum recording time must be smaller than maximum recording time','Minimum recording time must be smaller than maximum recording time','Le temps minimum d\'enregistrement doit �tre inf�rieur au temps maximum d\'enregistrement','El tiempo m�nimo de grabaci�n debe ser inferior al tiempo m�ximo de grabaci�n'),
  ('MESSAGE','MESSAGE','MESSAGE','MENSAJE'),
  ('Manual schedule','Manual schedule','Horaire manuel','Horario manual'),
  ('Mail to','Mail to','Envoyer �','Enviar a'),
  ('Looking up the filename on audio server in directory [','Looking up the filename on audio server in directory [','Recherche du nom de fichier sur le serveur audio dans le r�pertoire  [','B�squeda de nombre de fichero en servidor de audio en el directorio ['),
  ('Login details','Login details','Donn�es sur la connexion','Datos sobre la conexi�n'),
  ('Login count','Login count','Compte des ouvertures de session','Conteo de conexiones'),
  ('Login and Password required','Login and Password required','ID de connexion et mot de passe n�cessaires','C�digo de conexi�n y contrase�a necesarios'),
  ('Login - Lunch - Restroom','Login - Lunch - Restroom','Connexion - Repas - Toilettes','Conexi�n - Almuerzo - Aseos'),
  ('Listened','Listened','�cout�','Escuchado'),
  ('Listen live','Listen live','�coute en temps r�el','Escucha en vivo'),
  ('Last logout','Last logout','Derni�re fermeture de session','�ltima desconexi�n'),
  ('Last day integration','Last day integration','Dernier jour d\'int�gration','�ltimo d�a de integraci�n'),
  ('Last 2 directories of file path are:','Last 2 directories of file path are:','Les 2 derniers r�pertoires du chemin d\'acc�s au fichier sont:','�ltimos 2 directorios de v�a de acceso al fichero son:'),
  ('Invalid switch internal port','Invalid switch internal port','Port interne du commutateur invalide','Puerto interno del conmutador inv�lido'),
  ('Invalid servlet URL! Please check encryption server settings','Invalid servlet URL! Please check encryption server settings','Adresse URL de servlet invalide. Veuillez v�rifier les param�tres du serveur de chiffrement','URL del servlet inv�lido. Favor de comprobar la configuraci�n del servidor de cifrado.'),
  ('Invalid login. Already given to another agent','Invalid login. Already given to another agent','ID de connexion invalide. Il a d�j� �t� attribu� � un autre agent','C�digo de conexi�n inv�lido. Ya se le proporciono a otro agente'),
  ('Invalid load balance for outbound','Invalid load balance for outbound','Valeur d\'�quilibre de charge invalide pour les appels sortants','Valor de equilibrio de carga para las llamadas salientes inv�lido'),
  ('Invalid load balance for agents','Invalid load balance for agents','Valeur d\'�quilibre de charge invalide pour les agents','Valor de equilibrio de carga inv�lido para los agentes'),
  ('Invalid encryption server host IP or port! Please check encryption server settings','Invalid encryption server host IP or port! Please check encryption server settings','Adresse IP ou port du serveur h�te de chiffrement est invalide. Veuillez v�rifier les param�tres du serveur de chiffrement','Direcci�n IP o puerto del servidor de anfitri�n de cifrado inv�lido. Favor de comprobar la configuraci�n del servidor de cifrado'),
  ('Integration hours','Integration hours','Heures d\'int�gration','Horas de integraci�n'),
  ('Integration','Integration','Int�gration','Integraci�n'),
  ('Information','Information','Information','Informaci�n'),
  ('Info','Info','Donn�es','Datos'),
  ('Inbound time','Inbound time','Temps appels entrants','Tiempo llamadas entrantes'),
  ('Inbound count','Inbound count','Compte des appels re�us','Conteo de llamadas entrantes'),
  ('Inbound calls','Inbound calls','Appels entrants','Llamadas entrantes'),
  ('Inbound average','Inbound average','Moyenne des appels entrants','Media de llamadas entrantes'),
  ('Inbound','Inbound','Entrant','Entrante'),
  ('In integration','In integration','En int�gration','En integraci�n'),
  ('if a directory has been mounted for recordings.','if a directory has been mounted for recordings.','si un r�pertoire a �t� mont� pour les enregistrements.','si se ha montado un directorio de grabaci�n.'),
  ('Idle time','Idle time','Temps d\'inactivit�','Tiempo inactivo'),
  ('Host','Host','H�te','Anfitri�n'),
  ('Hold time','Hold time','Temps en garde','Tiempo en retenci�n'),
  ('Hold count','Hold count','Compte des appels en garde','Conteo de llamadas en retenci�n'),
  ('Hold calls','Hold calls','Appels en garde','Llamadas en retenci�n'),
  ('Hold average','Hold average','Moyenne de mise en garde','Media de retenci�n'),
  ('Hold','Hold','Garde','Retenci�n'),
  ('Hide grid','Hide grid','Masquer quadrillage','Ocultar cuadr�cula'),
  ('Handling time','Handling time','Temps de traitement','Tiempo de procesam.'),
  ('Handling','Handling','Traitement','Procesamiento'),
  ('grouped by team leader','grouped by team leader','group�s par chef d\'�quipe','agrupados por jefe de equipo'),
  ('General statistics','General statistics','Statistiques g�n�rales','Estad�sticas generales'),
  ('General data','General data','Donn�es g�n�rales','Datos generales'),
  ('GAP','GAP','�cart','Intervalo'),
  ('for','for','pour','sobre'),
  ('Finished writing data from encryption server','Finished writing data from encryption server','L\'�criture des donn�es du serveur de chiffrement est termin�e','Se ha terminado la escritura de datos del servidor de cifrado'),
  ('find','find','recherche','b�squeda'),
  ('file to search [','file to search [','fichier � chercher [','fichero para buscar ['),
  ('File to decrypt','File to decrypt','Fichier � d�chiffrer','Fichero para descifrar'),
  ('File NOT FOUND','File NOT FOUND','Fichier NON TROUV�','Fichero NO ENCONTRADO'),
  ('File found','File found','Fichier trouv�','Fichero encontrado'),
  ('Extract payroll data','Extract payroll data','Extraire les donn�es salariales','Extraer datos salariales'),
  ('Export to','Export to','Exporter �','Exportar a'),
  ('Events','Events','�v�nements','Acontecimientos'),
  ('Errors during save','Errors during save','Des erreurs se sont produites lors de l\'enregistrement','Se han producido errores al guardar los datos'),
  ('Error: Unknow switch','Error: Unknow switch','Erreur: Nom de commutateur','Error: Nombre de conmutador'),
  ('Error: Unable to delete site','Error: Unable to delete site','Erreur: Incapable de supprimer le site','Error: No se puede suprimir el sitio'),
  ('Error: Switch','Error: Switch','Erreur: Commutateur','Error: El conmutador'),
  ('Error: Specify site name','Error: Specify site name','Erreur: Indiquer le nom du site','Error: Especificar el nombre del sitio'),
  ('Error: Specify script name','Error: Specify script name','Erreur: Indiquer le nom du script','Error: Especificar el nombre del script'),
  ('Error: Site already exists. Specify new name','Error: Site already exists. Specify new name','Erreur: Le site existe d�j�. Saisir un autre nom','Error: El sitio ya existe. Indique otro nombre'),
  ('Error: No starting box found in this script. Please add a call condition','Error: No starting box found in this script. Please add a call condition','Erreur: Aucune bo�te de d�but n\'a �t� trouv�e pour ce script. Veuillez ajouter une condition d\'appel','Error: No se ha encontrado un recuadro de inicio en el script. Favor de a�adir una condici�n de llamada'),
  ('Error: No starting box found in this script','Error: No starting box found in this script','Erreur: Aucune bo�te de d�but n\'a �t� trouv�e pour ce script','Error: No se ha encontrado un recuadro de inicio en el script'),
  ('Error: No specification about the switch name','Error: No specification about the switch name','Erreur: Le nom du commutateur n\'a pas �t� indiqu�','Error: No se ha especificado el nombre del conmutador'),
  ('Error: Missing the extra data for screenpop. Try selecting the \\\'None\\\' option','Error: Missing the extra data for screenpop. Try selecting the \\\'None\\\' option','Erreur: Il manque les donn�es suppl�mentaires pour la remont�e de fiche. Essayez de s�lectionner l\'option \\\'Aucun\\\'','Error: Faltan los datos adicionales para la ventana emergente. Ensaye de seleccionar la opci�n \\\'Ninguno\\\''),
  ('Error: Missing the extra data','Error: Missing the extra data','Erreur: Il manque les donn�es suppl�mentaires','Error: Faltan los datos adicionales'),
  ('Error: Missing non numeric phone number action','Error: Missing non numeric phone number action','Erreur: Il manque l\'action par num�ro de t�l�phone non num�rique','Error: Falta la acci�n por n�mero de tel�fono no num�rico'),
  ('Error: Missing extra data \\\"apply to\\\"','Error: Missing extra data \\\"apply to\\\"','Erreur: Il manque les donn�es suppl�mentaires \\\"appliquer �\\\"','Error: Faltan datos adicionales \\\"aplicar a\\\"'),
  ('Error: Missing dialing hours \\\"apply to\\\"','Error: Missing dialing hours \\\"apply to\\\"','Erreur: Il manque les heures de composition \\\"appliquer �\\\"','Error: Faltan las horas de marcaci�n \\\"aplicar a\\\"'),
  ('Error while saving schedule data. Try again!','Error while saving schedule data. Try again!','Erreur lors de la sauvegarde des donn�es sur l\'horaire. Veuillez essayer � nouveau.','Se ha producido un error al guardar los datos sobre el horario. Favor de intentar de nuevo.'),
  ('Error while saving recording schedule data. Please try again!','Error while saving recording schedule data. Please try again!','Erreur lors de la sauvegarde des donn�es du programme d\'enregistrement. Veuillez essayer � nouveau.','Se ha producido un error al guardar los datos del programa de grabaci�n. Favor de intentar de nuevo.'),
  ('Error while getting data. Please check the database','Error while getting data. Please check the database','Une erreur s\'est produite lors de l\'obtention des donn�es. Veuillez v�rifier la base de donn�es','Se ha producido un error al obtener los datos. Favor de verificar la base de datos.'),
  ('Error while generating Agent performance report...','Error while generating Agent performance report...','Erreur lors de la production du Rapport sur le rendement de l\'agent...','Se ha producido un error al generar el Informe sobre el rendimiento del agente...'),
  ('Error while generating Agent performance report','Error while generating Agent performance report','Une erreur s\'est produite lors de la production du Rapport sur le rendement des agents','Se ha producido un error al generar el Informe sobre el rendimiento de los agentes'),
  ('Error while generating Agent login report','Error while generating Agent login report','Erreur lors de la production du Rapport sur les connexions de l\'agent','Se ha producido un error al generar el Informe sobre las conexiones del agente'),
  ('Error occurred! Please check tomcat log file for details','Error occurred! Please check tomcat log file for details','Une erreur s\'est produite. Veuillez v�rifier les donn�es du journal tomcat','Se ha producido un error. Para detalles sobre el error favor de verificar el archivo de anotaciones de tomcat'),
  ('Error in query. Please check the database','Error in query. Please check the database','Une erreur s\'est produite lors de la recherche. Veuillez v�rifier la base de donn�es','Se ha producido un error en la consulta. Favor de verificar la base de datos.'),
  ('End time','End time','Heure de fin','Hora de fin'),
  ('End','End','Terminer','Terminar'),
  ('Encryption URL','Encryption URL','URL de chiffrement','URL de cifrado'),
  ('encrypted','encrypted','chiffr�','cifrado'),
  ('Duration','Duration','Dur�e','Duraci�n'),
  ('Do you want to reload information?','Do you want to reload information?','Voulez-vous charger les donn�es � nouveau?','�Quiere volver a cargar los datos?'),
  ('Do not call','Do not call','Ne pas appeler','No llamar'),
  ('Diagram','Diagram','Diagramme','Gr�fico'),
  ('Details','Details','Donn�es','Datos'),
  ('Delete it first','Delete it first','Supprimez d\'abord l\'autocommutateur','Suprima primero el autoconmutador'),
  ('Delete all','Delete all','Supprimer tout','Suprimir todo'),
  ('Days not in Integration','Days not in Integration','Jours sans int�gration','D�as sin integraci�n'),
  ('Day off','Day off','Rel�che','D�a libre'),
  ('Date and Time','Date and Time','Date et Heure','Fecha y Hora'),
  ('Data has been published: the modification feature is disabled. Contact your supervisor if you need to unlock it','Data has been published: the modification feature is disabled. Contact your supervisor if you need to unlock it','Les donn�es ont �t� publi�es: la fonction de modification est d�sactiv�e. Veuillez communiquer avec votre superviseur pour y avoir acc�s','Los datos han sido publicados: la funci�n de modificaci�n est� desactivada. Favor de comunicarse con su supervisor si necesita acceso'),
  ('Data has been changed in','Data has been changed in','Les donn�es ont �t� chang�es dans','Los datos han sido modificados en'),
  ('Data count','Data count','Compte des donn�es','Cuenta de datos'),
  ('Data','Data','Les donn�es','Los datos'),
  ('Creating chart - please wait','Creating chart - please wait','En cours de production du diagramme - veuillez patienter','Produciendo el diagrama - favor de esperar'),
  ('Counters','Counters','Compteurs','Contadores'),
  ('Count','Count','Compte','Conteo'),
  ('Couldn\'t get connection from','Couldn\'t get connection from','La connexion n\'a pas �t� �tablie avec','No se ha logrado la conexi�n con'),
  ('Could not find the record','Could not find the record','L\'enregistrement n\'a pas �t� trouv�','No se encontr� el registro'),
  ('Continuing training hours','Continuing training hours','Heures de formation continue','Horas de formaci�n cont�nua'),
  ('Contacts/h','Contacts/h','Contacts/h','Contactos/h'),
  ('Connection successfull to','Connection successfull to','Connexion �tablie avec','Se ejecut� la conexi�n con'),
  ('Commission based on group average','Commission based on group average','Commission bas�e sur la moyenne du groupe','Comisi�n basada en la media del grupo'),
  ('Choose day','Choose day','S�lectionnez la journ�e','Seleccione el d�a'),
  ('Check also that the mount service is working properly','Check also that the mount service is working properly','V�rifier �galement que le service de montage fonctionne correctement','Verificar tambi�n que el servicio de montaje funciona correctamente'),
  ('Change status','Change status','Changer �tat','Cambiar estado'),
  ('Cell selection','Cell selection','S�lection de la cellule','Selecci�n de la c�lula'),
  ('canonical','canonical','canonique','can�nica'),
  ('Campaign already exists','Campaign already exists','La campagne existe d�j�','La campa�a ya existe'),
  ('Calls/h','Calls/h','Appels/h','Llamadas/h'),
  ('calls transferred inbound','calls transferred inbound','Transferts internes d\'appels','Transferencias internas de llamadas'),
  ('calls outbound/inbound','calls outbound/inbound','appels sortants/entrants','llamadas salientes/entrantes'),
  ('Calls out/in','Calls out/in','Appels faits/re�us','Llamadas hechas/recibidas'),
  ('Calling list name cannot start with a letter','Calling list name cannot start with a letter','Le nom de la liste d\'appel ne peut commencer par une lettre','El nombre de la lista de llamada no puede empezar con una letra'),
  ('CallerID should be like \\\"CallerName\\\" <(514) 222-2222>','CallerID should be like \\\"CallerName\\\" <(514) 222-2222>','L\'identification de l\'appelant devrait ressembler � \\\"CallerName\\\" <(514) 222-2222>','ID del llamante debe semejarse a  \\\"CallerName\\\" <(514) 222-2222>'),
  ('Call history','Call history','Historique d\'appel','Historial de llamada'),
  ('Call date','Call date','Date de l\'appel','Fecha de la llamada'),
  ('Call back','Call back','Rappeler','Volver a llamar'),
  ('bytes now from encryption server; total bytes sent are','bytes now from encryption server; total bytes sent are','octets du serveur de chiffrement; nombre total d\'octets envoy�s est','octetos del servidor de cifrado; n�mero total de octetos enviados es'),
  ('bytes from encryption Server','bytes from encryption Server','octets du serveur de chiffrement','octetos del servidor de cifrado'),
  ('Break schedule','Break schedule','P�riodes de pause','Periodos de descanso'),
  ('Break manual setting','Break manual setting','R�glage manuel Pause','Ajuste manual Descanso'),
  ('break','break','pause','descanso'),
  ('Billable time formula','Billable time formula','Formule pour temps factur�','F�rmula tiempo facturado'),
  ('Billable time','Billable time','Temps facturable','Tiempo de facturaci�n'),
  ('Back','Back','Pr�c�dente','Anterior'),
  ('Average wrap-up time','Average wrap-up time','Temps moyen post-appel','Tiempo medio post llamada'),
  ('Average talk time transfer','Average talk time transfer','Temps moyen en ligne en transferts','Tiempo medio de habla en transfer.'),
  ('Average outbound talk time','Average outbound talk time','Temps moyen en ligne en �mission d\'appel','Tiempo medio de habla en llamada saliente'),
  ('Average inbound talk time','Average inbound talk time','Temps moyen en ligne en r�ception d\'appel','Tiempo medio de habla en llamada entrante'),
  ('Average answering time','Average answering time','Temps moyen de r�ponse','Tiempo medio de respuesta'),
  ('Average','Average','Moyenne','Media'),
  ('Available shifts','Available shifts','Quarts disponibles','Turnos disponibles'),
  ('Available bytes','Available bytes','Octets disponibles','Octetos disponibles'),
  ('Assigned shifts','Assigned shifts','Quarts assign�s','Turnos asignados'),
  ('Assign','Assign','Assigner','Asignar'),
  ('Are you sure, you wish to delete this agent?','Are you sure, you wish to delete this agent?','�tes-vous certain de vouloir supprimer cet agent?','�Est� seguro de querer suprimir �ste agente?'),
  ('Are you sure you wish to unload this campaign? You should only do this at the end of the day','Are you sure you wish to unload this campaign? You should only do this at the end of the day','�tes-vous certain de vouloir d�charger cette campagne? Vous devriez le faire uniquement � la fin de la journ�e','�Est� seguro de querer descargar esta campa�a? Solo deber�a hacerlo al terminar el d�a'),
  ('Are you sure you wish to delete this group?','Are you sure you wish to delete this group?','�tes-vous certain de vouloir supprimer ce groupe?','�Est� seguro de querer suprimir este grupo?'),
  ('Are you sure you wish to delete this campaign?','Are you sure you wish to delete this campaign?','�tes-vous certain de vouloir supprimer cette campagne?','�Est� seguro de querer suprimir �sta campa�a?'),
  ('Apply filter','Apply filter','Appliquer filtre','Aplicar filtro'),
  ('Answers per day','Answers per day','R�ponses par jour','Contestas por d�a'),
  ('Answered service factor','Answered service factor','Facteur de service, avec r�ponse','Factor de servicio, contestadas'),
  ('Answered count','Answered count','Compte, avec r�ponse','Cuenta, contestadas'),
  ('Answered calls','Answered calls','Appels avec r�ponse','Llamadas con respuesta'),
  ('Answered call report','Answered call report','Rapport sur les appels avec r�ponse','Informe sobre las llamadas contestadas'),
  ('Answered call detailled report','Answered call detailled report','Rapport d�taill� sur les appels avec r�ponse','Informe detallado sobre las llamadas con respuesta'),
  ('AHT out','AHT out','TMT sortant','TMP saliente'),
  ('AHT in','AHT in','TMT entrant','TMP entrante'),
  ('AheevaPhone crash','AheevaPhone crash','Panne du AheevaPhone','Fallo de AheevaPhone'),
  ('Agents with days not in integration between two integration days','Agents with days not in integration between two integration days','Agents non en int�gration entre deux jours d\'int�gration','Agentes no en integraci�n entre dos d�as de integraci�n'),
  ('Agents whose production time is higher than their login time by','Agents whose production time is higher than their login time by','Agents dont le temps en production est sup�rieur au temps en session par','Agentes cuyo tiempo en producci�n es superior a el tiempo en sesi�n de'),
  ('Agents which have login time but no production time','Agents which have login time but no production time','Agents avec temps en session mais pas en production','Agentes con tiempo en sesi�n pero no en producci�n'),
  ('Agent performance report for group','Agent performance report for group','Rapport sur le rendement de l\'agent dans le groupe','Informe sobre el rendimiento del agente en el grupo'),
  ('Agent performance report','Agent performance report','Raport sur le rendement des agents','Informe sobre el rendimiento de los agentes'),
  ('Agent performance','Agent performance','Rendement de l\'agent','Rendimiento del agente'),
  ('Agent must have at least one preferred site','Agent must have at least one preferred site','L\'agent doit avoir au moins un site privil�gi�','El agente debe tener por lo menos un sitio preferido'),
  ('Agent login','Agent login','Connexion de l\'agent','Conexi�n del agente'),
  ('Agent logged out','Agent logged out','D�connecter agent','Desconectar agente'),
  ('agent has quit','agent has quit','agent a d�missionn�','agente ha dimitido de su empleo'),
  ('Agent group selection','Agent group selection','S�lection du groupe d\'agents','Selecci�n del grupo de agentes'),
  ('Agent group performance report','Agent group performance report','Rapport sur le rendement du groupe d\'agents','Informe sobre el rendimiento del grupo de agentes'),
  ('Agent group logged out','Agent group logged out','Groupe d\'agents d�connect�','Grupo de agentes desconectado'),
  ('Agent group already exists','Agent group already exists','Le groupe d\'agents existe d�j�','El grupo de agentes ya existe'),
  ('Agent adherence','Agent adherence','Adh�sion � l\'horaire','Conformidad al horario'),
  ('agent absent this day','agent absent this day','agent est absent cette journ�e','agente ausente este d�a'),
  ('Add schedule for AheevaPhone','Add schedule for AheevaPhone','Ajouter horaire pour AheevaPhone','A�adir horario para AheevaPhone'),
  ('Add schedule for agent','Add schedule for agent','Ajouter horaire pour l\'agent','A�adir horario para el agente'),
  ('Add alert for AheevaPhone','Add alert for AheevaPhone','Ajouter alerte pour AheevaPhone','A�adir alerta para AheevaPhone'),
  ('Add a new tenant','Add a new tenant','Ajouter un nouveau client','A�adir un nuevo cliente'),
  ('Add a new row','Add a new row','Ajouter une autre rang�e','A�adir otra l�nea'),
  ('Actual','Actual','R�el','Real'),
  ('Acknowledged','Acknowledged','Admis','Admitido'),
  ('Acknowledge','Acknowledge','Admettre','Admitir'),
  ('Accepted','Accepted','Accept�','Aceptado'),
  ('Absence management for group','Absence management for group','Gestion des absences pour le groupe','Gesti�n de las ausencias para el grupo'),
  ('Absence','Absence','Absence','Ausencia'),
  ('Abandon count','Abandon count','Compte, abandonn�s','Cuenta, abandonadas'),
  ('A running campaign uses this group! You can\'t delete it','A running campaign uses this group! You can\'t delete it','Une campagne en cours d\'ex�cution utilise ce groupe! Vous ne pouvez pas le supprimer','�Una campa�a en ejecuci�n usa este grupo! No puede suprimirlo'),
  ('A recording server','A recording server','Serveur d\'enregistrement','Servidor de grabaci�n'),
  ('No Stats Available','No Stats Available','Statistiques non disponibles','Estad�sticas non disponibles'),
  ('records found','records found','articles trouv�s','registros encontrados'),
  ('of','of','de','de'),
  ('Agent sales','Agent sales','Ventes de l\'agent','Ventas del agente'),
  ('Group sales','Group sales','Ventes du groupe','Ventas del grupo'),
  ('Agent hours','Agent hours','Heures de l\'agent','Horas del agente'),
  ('Group hours','Group hours','Heures du groupe','Horas del grupo'),
  ('Calculation base','Calculation base','Base de calcul','Base del c�lculo'),
  ('Total commission','Total commission','Commission totale','Comisi�n total'),
  ('Commission details','Commission details','Details des commissions','Detalles de la Comisi�n'),
  ('Show commission details from','Show commission details from','Afficher les details de commission de','Demuestre a detalles de la comisi�n de'),
  ('Please enter a valid date to proceed','Please enter a valid date to proceed','Veuillez saisir une date valide','Incorpore por favor una fecha v�lida para proceder'),
  ('Leave a message if answering machine is detected','Leave a message if answering machine is detected','Laisser un message lorsqu\'un r�pondeur est d�tect�','Dejar un mensaje cuando se detecta un contestador'),
  ('Line management','Line management','Gestion des lignes','Gesti�n de las l�neas'),
  ('Configured ports','Configured ports','Ports configur�s','Puertos configurados'),
  ('Total used','Total used','Total utilis�','Total utilizado'),
  ('Agent outbound','Agent outbound','Agent en appel sortant','Agente en llamada saliente'),
  ('Transferred','Transferred','Transf�r�','Transferido'),
  ('Conference','Conference','Conf�rence','Conferencia'),
  ('Unknown status','Unknown status','Status inconnu','Estado desconocido'),
  ('Global summary','Global summary','Sommaire global','Sumario global');

