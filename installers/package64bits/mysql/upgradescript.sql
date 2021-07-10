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
  ('hold','Hold','Garde','Retención'),
  ('waiting','Waiting','En attente','Esperando'),
  ('notready','Not ready','Pas prêt','No listo'),
  ('singletransfer','Single transfer','Transfert en une étape','Transferencia monoetapa'),
  ('twosteptransfer','Two-step transfer','Transfert à deux étapes','Transferencia en dos etapas'),
  ('otherstatistics','Other statistics','Autres statistiques','Otras estadísticas'),
  ('scheduledtime','Scheduled time','Temps prévu','Tiempo previsto'),
  ('login','Login','Nom d\'usager','Usuario'),
  ('adherence','Adherence','Adhésion','Conformidad'),
  ('logintime','Login time','Temps en session','Tiempo en sesión'),
  ('Agent','Agent','Agent','Agente'),
  ('Active','Active','Actif','Activo'),
  ('Configuration','Configuration','Configuration','Configuración'),
  ('Tenant Management','Tenant management','Gestion des clients','Gestión de los clientes'),
  ('Add tenant','Add tenant','Ajouter un client','Añadir un cliente'),
  ('User Management','User management','Gestion des utilisateurs','Gestión de los usuarios'),
  ('Add a user','Add a user','Ajouter un utilisateur','Añadir un usuario'),
  ('Add','Add','Ajouter','Añadir'),
  ('Active Users','Active users','Utilisateurs actifs','Usuarios activos'),
  ('Inactive Users','Inactive users','Utilisateurs inactifs','Usuarios Inactivos'),
  ('Switches','Switches','Commutateurs','Conmutadores'),
  ('Add a switch','Add a switch','Ajouter un commutateur','Añadir un conmutador'),
  ('Network Configuration','Network configuration','Configuration du réseau','Configuración de la red'),
  ('Resources','Resources','Ressources','Recursos'),
  ('Agent Groups','Agent&nbsp;Groups','Groupes&nbsp;d\'agents','Grupos&nbsp;de&nbsp;agentes'),
  ('Agent group','Agent group','Groupe d\'agents','Grupo de agentes'),
  ('Add agent group','Add agent group','Ajouter un groupe d’agents','Añadir un grupo de agentes'),
  ('Active agent group','Active agent group','Groupes d\'agents actifs','Grupos de agentes activos'),
  ('Inactive agent group','Inactive agent group','Groupes d\'agents inactifs','Grupos de agentes inactivos'),
  ('Agents','Agents','Agents','Agentes'),
  ('Performance','Performance','Rendement','Rendimiento'),
  ('Add agent','Add agent','Ajouter un agent','Añadir un agente'),
  ('Active agents','Active agents','Agents actifs','Agentes activos'),
  ('Inactive agents','Inactive agents','Agents inactifs','Agentes inactivos'),
  ('Campaigns','Campaigns','Campagnes','Campañas'),
  ('Campaign','Campaign','Campagne','Campaña'),
  ('Add campaigns','Add campaigns','Ajouter une campagne','Añadir una campaña'),
  ('Active campaigns','Active campaigns','Campagnes actives','Campañas activas'),
  ('Inactive campaigns','Inactive campaigns','Campagnes inactives','Campañas inactivas'),
  ('Calling lists','Calling&nbsp;Lists','Listes&nbsp;d’appel','Listas&nbsp;de&nbsp;llamada'),
  ('Add calling list','Add calling list','Ajouter une liste d\'appel','Añadir una lista de llamada'),
  ('Add lists','Add lists','Ajouter listes','Añadir listas'),
  ('Active lists','Active lists','Listes actives','Listas activas'),
  ('Inactive lists','Inactive lists','Listes inactives','Listas inactivas'),
  ('Filters','Filters','Filtres','Filtros'),
  ('Add filter','Add filter','Ajouter un filtre','Añadir un filtro'),
  ('Active filter','Active filter','Filtre actif','Filtro activo'),
  ('Inactive filter','Inactive filter','Filtre inactif','Filtro inactivo'),
  ('Treatments','Treatments',' Traitements','Tratamientos'),
  ('Add treatment','Add treatment','Ajouter un traitement','Añadir un tratamiento'),
  ('Active Treatments','Active Treatments','Traitements actifs','Tratamientos activos'),
  ('Inactive Treatments','Inactive Treatments','Traitements inactifs','Trantamientos inactivos'),
  ('Historical Reports','Historical reports','Rapports historiques','Informes de datos históricos'),
  ('Agent Details Reports','Agent details reports',' Rapports sur les agents','Informes sobre los agentes'),
  ('Agent Groups Reports','Agent group reports','Rapports sur les groupes d’agents','Informes sobre los grupos de agentes'),
  ('Inbound Calls Reports','Inbound calls reports','Rapports sur les appels entrants','Informes sobre las llamadas'),
  ('Agent Login Reports','Agent login reports','Rapports sur les conexions d’agent','Informes sobre las conexiones de los agentes'),
  ('Campaign Reports','Campaign reports','Rapports sur les campagnes','Informes sobre las campañas'),
  ('Calling List Reports','Calling list reports','Rapport sur les listes d’appel','Informes sobre las listas de llamada'),
  ('Queue Reports','Queue reports','Rapports sur les files d\'attente','Informes sobre las colas'),
  ('Reports','Reports','Rapports','Informes'),
  ('Report','Report','Rapport','Informe'),
  ('Quality Monitoring','Quality monitoring','Contrôle de la qualité','Supervisión de la calidad'),
  ('Agent\'s Conversation','Agent\'s conversation','Conversation de l\'agent','Conversación del agente'),
  ('Financial Reports','Financial Reports','Rapports financiers','Informes financieros'),
  ('Teams','Teams','Équipes','Equipos'),
  ('Add a team','Add a team','Ajouter une équipe','Añadir un equipo'),
  ('Add team','Add team','Ajouter équipe','Añadir equipo'),
  ('Adherence','Adherence','Adhésion','Conformidad'),
  ('Real Time Adherence','Real time adherence','Adhésion en temps réel','Conformidad en tiempo real'),
  ('View Adherence Graph','View adherence graph','Graphique d\'adhésion','Gráfico de conformidad'),
  ('Adherence Report','Adherence report','Rapport sur l\'adhésion','Informe sobre la conformidad'),
  ('Methods Of Payment','Methods of payment','Méthodes de paiement','Métodos de pago'),
  ('Login & Production time','Login & Production time','Temps en session et en production','Tiempo en sesión y en producción'),
  ('Scripts','Scripts','Scripts','Scripts'),
  ('Routing scripts','Routing scripts','Scripts d\'acheminement','Scripts de encaminamiento'),
  ('Routing script','Routing script','Script d\'acheminement','Script de encaminamiento'),
  ('ROUTING SCRIPT','ROUTING SCRIPT','SCRIPT D\'ACHEMINEMENT','SCRIPT DE ENCAMINAMIENTO'),
  ('Add Routing Script','Add routing script','Ajouter un script d\'acheminement','Añadir un script de encaminamiento'),
  ('Skills','Skills','Compétences','Habilidades'),
  ('Add skills','Add skills','Ajouter compétences','Añadir habilidades'),
  ('Active scripts','Active scripts','Scripts actifs','Scripts activos'),
  ('Inactive scripts','Inactive scripts','Scripts inactifs','Scripts inactivos'),
  ('StarPhone Settings','StarPhone settings','Configuration du StartPhone','Configuración de StartPhone'),
  ('StarPhone','StarPhone','StartPhone','StartPhone'),
  ('StarPhone AutoUpdate Settings','StarPhone AutoUpdate settings','Mise à jour automatique du StarPhone','Actualización automática de StartPhone'),
  ('AheevaPhone configuration','AheevaPhone configuration','Configuration du AheevaPhone','Configuración del AheevaPhone'),
  ('Live monitoring','Live monitoring','Surveillance en temps réel','Supervisión en tiempo real'),
  ('Queues','Queues','Files d\'attente','Colas'),
  ('Payroll configuration','Payroll configuration','Configuration des salaires','Configuración de los salarios'),
  ('Payroll Information Report','Payroll Information Report','Rapports sur les salaires','Informe sobre los salarios'),
  ('Activity','Activity','Activité','Actividad'),
  ('Activity name1','Activity name','Nom de l\'activité','Nombre de la actividad'),
  ('Add an activity','Add an activity','Ajouter activité','Añadir actividad'),
  ('Current activities','Current activities','Activités courantes','Actividades actuales'),
  ('Do-not-call lists','Do-not-call lists','Listes Ne-pas-appeler','Listas No-llamar'),
  ('Current do-not-call lists','Current do-not-call lists','Listes Ne-pas-appeler courantes','Listas No-llamar actuales'),
  ('Actions on do-not-call lists','Actions on do-not-call lists','Actions associées aux listes','Acciones relacionadas con las listas'),
  ('Create a do-not-call list','Create a Do-not-call list','Créer liste Ne-pas-appeler','Crear lista No-llamar'),
  ('Add numbers to Do-not-call list','Add numbers to Do-not-call list','Ajouter numéros à la liste','Añadir números a la lista'),
  ('Search campaign for Do-not-call list number','Search campaign for Do-not-call list number','Recherche de numéro à Ne-pas-appeler','Buscar número a No-llamar'),
  ('Display Do-not-call list contents','Display Do-not-call list contents','Afficher contenu liste Ne-pas-appeler','Visualizar contenido lista No-llamar'),
  ('Not-ready reasons','Not-ready reasons','Raisons Pas-prêt','Motivos No-listo'),
  ('Add Not-ready reason','Add Not-ready reason','Ajouter raison Pas-prêt','Añadir motivo No-listo'),
  ('Active Not-ready reasons','Active Not-ready reasons','Raisons Pas-prêt actives','Motivos No-listo activos'),
  ('Inactive Not-ready reasons','Inactive Not-ready reasons','Raisons Pas-prêt inactives','Motivos No-listo inactivos'),
  ('Outbound call reports','Outbound call reports','Rapports sur les appels sortants','Informes sobre llamadas salientes'),
  ('Agent summary reports','Agent summary reports','Rapports sommaires sur les agents','Informes sumarios sobre agentes'),
  ('Agent listening report','Agent listening report','Rapport d\'écoute d\'agent','Informe sobre escucha de agente'),
  ('Agent group queues','Agent group queues','Files d\'attente pour groupe d\'agents','Colas para grupo de agentes'),
  ('Routing script queues','Routing script queues','Files d\'attente pour script d\'acheminement','Colas para script de encaminamiento'),
  ('Payroll information','Payroll information','Données salariales','Datos salariales'),
  ('Commissions','Commissions','Commissions','Comisiones'),
  ('Commissions settings','Commissions settings','Paramètres de commission','Parámetros de comisión'),
  ('Choose commission type','Choose commission type','Sélectionner type de commission','Seleccionar tipo de comisión'),
  ('Add commission','Add commission','Ajouter commission','Añadir comisión'),
  ('Active commissions','Active commissions','Commissions actives','Comisiones activas'),
  ('Inactive commissions','Inactive commissions','Commissions inactives','Comisiones inactivas'),
  ('Add Method of Payment','Add Method of Payment','Ajouter méthode de paiement','Añadir método de pago'),
  ('Active MOPs','Active MOPs','Méthodes actives','Métodos activos'),
  ('Inactive MOPs','Inactive MOPs','Méthodes inactives','Métodos inactivos'),
  ('Schedule','Schedule','Horaire','Horario'),
  ('Add schedules','Add schedules','Ajouter horaires','Añadir horario'),
  ('View published schedules','View published schedules','Afficher horaires publiés','Visualizar horarios publicados'),
  ('Scheduled agents\' report','Scheduled agents\' report','Rapport sur les horaires planifiés','Informe sobre horarios programados'),
  ('Name','Name','Nom','Nombre'),
  ('Submit','Submit','Envoyer','Enviar'),
  ('Tenant name','Tenant name','Nom du client','Nombre del cliente'),
  ('already exists. Please retry','already exists. \n Please retry !','existe déjà. \n Veuillez essayer à nouveau.','existe ya. ¡Revise por favor!'),
  ('Please enter tenant name','Please enter tenant name','Veuillez entrer le nom du client','Favor de introducir el nombre del cliente'),
  ('Invalid use of character','Invalid use of character','Usage non valide de caractère','Uso inválido de carácter'),
  ('Modify tenant name','Modify tenant name','Modifier le nom du client','Modificar el nombre del cliente'),
  ('Tenant ID','Tenant ID','ID du client','ID del cliente'),
  ('Update','Update','Mettre à jour','Actualizar'),
  ('Delete','Delete','Supprimer','Suprimir'),
  ('No changes to tenant information','No changes to tenant information','Pas de changement aux données sur le client','Ningun cambio a los datos sobre el cliente'),
  ('You are about to delete Tenant','You are about to delete Tenant','Vous êtes sur le point de supprimer le client','Usted está a punto de suprimir el cliente'),
  ('Do you want to continue','\n Do you want to continue ?','\n Voulez-vous poursuivre?','\n ¿Usted desea continuar?'),
  ('Specify tenant ID','Specify tenant ID','Indiquer ID du client','Especificar ID del cliente'),
  ('Specify User name','Specify user name','Indiquer nom d\'utilisateur','Especificar nombre de usuario'),
  ('Specify user password','Specify user password','Indiquer mot de passe','Especificar contraseña'),
  ('Passwords don\'t match','Passwords don\'t match','Mots de passe ne correspondent pas','Contraseñas no corresponden'),
  ('Specify user role','Specify user role','Indiquer rôle utilisateur','Especificar función de usuario'),
  ('User name','User name','Nom d\'utilisateur','Usuario'),
  ('Password','Password','Mot de passe','Contraseña'),
  ('Retype password','Retype password','Resaisir le mot de passe','Escriba de nuevo la contraseña'),
  ('Privilegies','Privileges','Privilèges','Privilegios'),
  ('Agent skills','Agent skills','Compétences de l\'agent','Capacidades del agente'),
  ('System configurations','System configuration','Configuration du système','Configuración del sistema'),
  ('Configuration management','Configuration management','Gestion de la configuration','Gestión de la configuración'),
  ('Tenants and Ressources','Tenants and Resources','Clients service partagé et Ressources','Clientes y Recursos'),
  ('Agents conversation','Agents\' conversation','Conversation des agents','Conversación de los agentes'),
  ('Finances','Finances','Finances','Finanzas'),
  ('Work Force','Work force','Effectifs','Personal'),
  ('Call routing scripts','Routing scripts','Scripts d\'acheminement','Scripts de encaminamiento'),
  ('View live statistics','View live statistics','Afficher statistiques en temps réel','Visualizar estadísticas en tiempo real'),
  ('Live statistics','Live statistics','Statistiques en temps réel','Estadísticas en tiempo real'),
  ('Manager features','Manager features','Options d\'application','Opciones de aplicación'),
  ('Change agent status','Change agent status','Modifier état de l\'agent','Cambiar estado del agente'),
  ('Logged agents out','Agent logged out','Déconnecter agent','Desconectar agente'),
  ('Logged agents group out','Agent group logged out','Déconnecter groupe agent','Desconectar grupo de agentes'),
  ('Whisper to agent','Whisper to agent','Intervention discrète agent','Intervención discreta agente'),
  ('Whisper to customer','Whisper to customer','Intervention discrète client','Intervención discreta cliente'),
  ('Role','Role','Rôle','Función'),
  ('Super Admin','Super Admin','Super Admin','Super Admin'),
  ('Admin','Admin','Admin','Admin'),
  ('Viewer','Viewer','Visiteur','Visitante'),
  ('Tenant','Tenant','Client','Cliente'),
  ('Assigned groups','Assigned groups','Groupes affectés','Grupos asignados'),
  ('Groups','Groups','Groupes','Grupos'),
  ('Available groupes','Available groups','Groupes disponibles','Grupos disponibles'),
  ('Add user','Add user','Ajouter utilisateur','Añadir usuario'),
  ('Passwords doesn\'t match.','Passwords doesn\'t match.','Mots de passe non identiques','Las contraseñas no emparejan'),
  ('You can\'t delete your own user','You can\'t delete your own user','Vous ne pouvez pas supprimer votre nom d\'utilisateur','Usted no puede suprimir su propio usuario'),
  ('This user will be permanently deleted.\n Do you want to continue ?','This user will be permanently deleted.\n Do you want to continue ?','Cet utilisateur va être supprimir de façon permanente.\n Désirez-vous poursuivre?','Suprimirán a este usuario permanentemente.\n ¿Usted desea continuar?'),
  ('Modify user','Modify user','Modifier utilisateur','Cambiar usuario'),
  ('Delete user','Delete user','Supprimer utilisateur','Suprimir usuario'),
  ('Specify User','Specify User','Indiquer utilisateur','Especificar usuario'),
  ('Specify a numeric login','Specify a numeric login','Indiquer numéros de connexion','Especificar números de conexión'),
  ('Specify a numeric password','Specify a numeric password','Indiquer un mot de passe numérique','Especificar una contraseña numérica'),
  ('This login is already in use','This login is already in use','Ces numéros de connexion sont déjà utilisés','Estos números de conexión existen ya'),
  ('Add Live User Monitoring','Add Live User Monitoring','Ajouter la supervision en temps réel de l\'utilisateur','Añadir la supervisión en vivo del usuario'),
  ('Numeric login','Numeric login','Numéros de connexion','Números de conexión'),
  ('Numeric Password','Numeric Password','Mot de passe numérique','Contraseña numérica'),
  ('All users already have a live listenning account.\nAdd a new user before.','All users already have a live listenning account.\nAdd a new user before.','Tous les utilisateurs ont déjà un compte de supervision en temps réel.\n Ajouter avant un autre utilisateur.','Todos los usuarios tienen una cuenta para la supervisión en vivo.\n Añadir antes otro usuario.'),
  ('The IP adress should be like: 192.168.100.100','The IP adress should be like: 192.168.100.100','L\'adresse IP doit être sous la forme: 192.168.100.100','La dirección IP debe ser de tipo: 192.168.100.100'),
  ('Load balance for outbound must be numeric','Load balance for outbound must be numeric','La valeur d\'équilibre de charge pour les appels sortants doit être numérique','El valor de equilibrio de carga para las llamadas salientes debe ser numérico'),
  ('A switch with this IP address already exists.','A switch with this IP address already exists.','Un commutateur avec cette adresse IP existe déjà.','Un conmutador con esta dirección IP existe ya.'),
  ('Load balance for agents can\'t be more than','Load balance for agents can\'t be more than','La valeur d\'équilibre de charge pour les agents ne peut pas être plus que','El valor de equilibrio de carga para los agentes no puede ser más que'),
  ('Load balance for outbound can\'t be more than','Load balance for outbound can\'t be more than','La valeur d\'équilibre de charge pour les appels sortants ne peut pas être plus que','El valor de equilibrio de carga para las llamadas salientes no puede ser más que'),
  ('Add new switch','Add new switch','Ajouter un commutateur','Añadir un conmutador'),
  ('IP Address','IP Address','Adresse IP','Dirección IP'),
  ('Load balance for agents','Load balance for agents','Équilibre de charge pour les agents','Equilibrio de carga para los agentes'),
  ('Load balance for outbound','Load balance for outbound','Equilibre de charge pour les appels sortants','Equilibrio de carga para las llamadas salientes'),
  ('Load balance for agents must be numeric.','Load balance for agents must be numeric.','La valeur d\'équilibre de charge pour les agents doit être numérique.','El valor de equilibrio de carga para los agentes debe ser numérico.'),
  ('Network','Network','Réseau','Red'),
  ('Save layout','Save layout','Sauvegarder schéma','Guardar el esquema'),
  ('Reset layout','Reset layout','Réinitialiser schéma','Restablecer el esquema'),
  ('Add site','Add site','Ajouter site','Añadir sitio'),
  ('Servers','Servers','Serveurs','Servidores'),
  ('Services','Services','Services','Servicios'),
  ('Add pbx server','Add PBX server','Ajouter serveur PBX','Añadir servidor PBX'),
  ('Add recording server','Add recording server','Ajouter serveur d\'enregistrement','Añadir servidor de grabación'),
  ('Add encryption server','Add encryption server','Ajouter serveur de chiffrement','Añadir servidor de cifrado'),
  ('Statistics','Statistics','Statistiques','Estadísticas'),
  ('Internal port:','Internal port:','Port interne:','Puerto interno:'),
  ('External port:','External port:','Port externe:','Puerto externo:'),
  ('Refresh','Refresh','Rafraîchir','Renovar'),
  ('The switch DBID must be numeric','The switch DBID must be numeric','Le commutateur DBID doit être numérique','El conmutador DBID debe ser numérico'),
  ('You are about to delete this switch. \n Do you want to continue','You are about to delete this switch. \n Do you want to continue?','Vous êtes sur le point de supprimer ce commutateur. \n Voulez-vous poursuivre?','Usted está a punto de suprimir este conmutador. \n ¿Usted desea continuar?'),
  ('Modify switch','Modify switch','Modifier le commutateur','Modificar conmutador'),
  ('The port should be numeric','The port should be numeric','Le port doit être numérique','El puerto debe ser numérico'),
  ('The internal port should be numeric','The internal port should be numeric','Le port interne doit être numérique','El puerto interno debe ser numérico'),
  ('The external port should be numeric','The external port should be numeric','Le port  externe doit être numérique','El puerto externo debe ser numérico'),
  ('You must select a site.','You must select a site.','Vous devez sélectionner un site.','Debe seleccionar un sitio.'),
  ('Modify Auto update Settings','Modify Auto update Settings','Modifier la configuration de mise à jour','Modificar la configuración de actualización'),
  ('Enable Auto update','Enable Auto update','Permettre mise à jour automatique','Permitir actualización automática'),
  ('Internal URL','Internal URL:','URL interne:','URL interno:'),
  ('Internal IP','Internal IP:','IP interne:','IP interno:'),
  ('External URL','External URL:','URL externe:','URL externo:'),
  ('Path (relative to WEB ROOT)','Path (relative to WEB ROOT)','Chemin d\'accès (relatif au WEB ROOT)','Vía de acceso (en función del WEB ROOT)'),
  ('External IP','External IP:','IP externe:','IP externo:'),
  ('Group name','Group name','Nom du groupe','Nombre del grupo'),
  ('Description','Description','Description','Descripción'),
  ('Associated queue','Associated queue','File d\'attente associée','Cola relacionada'),
  ('Wrap-up time out','Wrap-up time out','Délai traitement post-appel','Plazo post-llamada'),
  ('seconds','seconds','secondes','segundos'),
  ('Not ready','Not ready','Pas prêt','No listo'),
  ('Ready','Ready','Prêt','Listo'),
  ('Logged out','Logged out','Déconnecté','Desconectado'),
  ('Action after Time out','Action after Time out','Action délai expiré','Acción plazo caducado'),
  ('Max Wrap-up time For Productivity','Max wrap up time for productivity','Temps post-appel max. pour productivité','Plazo máximo post-llamada para productividad'),
  ('Enable Dialing','Enable dialing','Permettre composition','Permitir marcación'),
  ('Agents configuration','Agents configuration','Configuration des agents','Configuración de los agentes'),
  ('Non-configured agent','Non-configured agent','Agent non configuré','Agente no configurado'),
  ('Show agent by ID','Show agent by ID','Montrez agents par ID','Mostrar agentes por ID'),
  ('Assigned agent','Assigned agent','Agent asigné','Agente asignado'),
  ('Not-ready reasons configuration','Not-ready reasons configuration','Configuration raisons Pas-prêt','Configuración de los motivos No-listo'),
  ('Add a new reason','Add a new reason','Ajouter raison','Añadir motivo'),
  ('Recordings','Recordings','Enregistrements','Registros'),
  ('Recording options','Recording options','Options d\'enregistrement','Opciones de grabación'),
  ('Enable Recording','Enable Recording','Permettre l\'enregistrement','Permitir la grabación'),
  ('Recordings stay local','Recordings stay local','Les enregistrements restent locaux','Las grabaciones permanecen locales'),
  ('Encode Recordings to MP3','Encode Recordings to MP3','Enregistrer les fichiers en MP3','Registrar ficheros en MP3'),
  ('Minimum Recording Time','Minimum Recording Time','Temps d\'enregistrement minimum','Tiempo de grabación mínimo'),
  ('Maximum Recording Time','Maximum Recording Time','Temps d\'enregistrement maximum','Tiempo de grabación máximo'),
  ('Low quality MP3(smaller files)','Low quality MP3 (smaller files)','Basse qualité MP3 (fichiers plus petits)','MP3 baja calidad (fichero de menor tamaño)'),
  ('High quality MP3(bigger files)','High quality MP3 (bigger files)','Haute qualité MP3 (fichiers plus gros)','MP3 alta calidad (fichero de mayor tamaño)'),
  ('Enable encryption','Enable encryption','Activer chiffrement','Activar cifrado'),
  ('Encryption','Encryption','Chiffrement','Cifrado'),
  ('Encryption server','Encryption server','Serveur de chiffrement','Servidor de cifrado'),
  ('Encryption method','Encryption method','Méthode de chiffrement','Método de cifrado'),
  ('Methods Of Payment info','Methods Of Payment info','Données sur les méthodes de paiement','Datos sobre métodos de pago'),
  ('Select MOP','Select MOP','Sélectionner méthode de paiement','Seleccionar método de pago'),
  ('Override salary','Override salary','Modifier salaire en priorité','Cambiar salario en prioridad'),
  ('Amount','Amount','Montant','Cantidad'),
  ('Hide statistics','Hide statistics','Masquer statistiques','Ocultar estadísticas'),
  ('Select all','Select all','Selectioner tous','Seleccionar todos'),
  ('Select none','Select none','Ne rien selectioner','Seleccionar nada'),
  ('General','General','Généralités','Generalidades'),
  ('General settings','General settings','Paramètres généraux','Parámetros generales'),
  ('General information','General information','Information générale','Información general'),
  ('Personal','Personal','Particularités','Particularidades'),
  ('Personal information','Personal information','Information personnelle','Datos personales'),
  ('Group ID','Group ID','ID du groupe','ID del grupo'),
  ('Last name','Last name','Nom de famille','Apellido'),
  ('First name','First name','Prénom','Nombre'),
  ('Address','Address','Adresse','Dirección'),
  ('City','City','Ville','Ciudad'),
  ('Birth date','Birth date','Date de naissance','Fecha de nacimiento'),
  ('Comments','Comments','Commentaires','Comentarios'),
  ('Start Date','Start Date','Date de début','Fecha de comienzo'),
  ('End Date','End Date','Date de fin','Fecha de fin'),
  ('Salary','Salary','Salaire','Salario'),
  ('Site','Site','Site','Sitio'),
  ('Site details','Site details','Données sur le site','Datos sobre el sitio'),
  ('Preferred sites','Preferred sites','Sites privilégiés','Sitios preferidos'),
  ('Most preferred','Most preferred','Plus privilégiés','El más preferido'),
  ('Less preferred','Less preferred','Moins privilégiés','El menos preferido'),
  ('Set agent skills','Set agent skills','Établir compétences de l\'agent','Establecer habilidades del agente'),
  ('Agent Login ID','Agent Login ID','ID de connexion de l\'agent','ID de conexión del agente'),
  ('Skill','Skill','Compétence','Habilidad'),
  ('Please enter skill name','Please enter skill name','Veuillez indiquer le nom de la compétence','Favor de especificar el nombre de la habilidad'),
  ('Score','Score','Indice','Índice'),
  ('Login','Login','Nom d\'utilisateur','Usuario'),
  ('Please enter a starting date','Please enter a starting date','Veuillez entrer la date du début','Favor de introducir una fecha de comienzo'),
  ('Please enter an ending date','Please enter an ending date','Veuillez entrer la date de fin','Favor de introducir una fecha de fin'),
  ('Please select at least one object','Please select at least one object','Veuillez choisir au moins un objet','Seleccione por favor por lo menos un objeto'),
  ('Your ending date cannnot be smaller than your starting date','Your ending date cannnot be smaller than your starting date!','La date de fin ne peut pas être antérieure à la date de début!','La fecha de fin no puede ser anterior a la fecha de comienzo.'),
  ('Report by call type for Microcell Rac','Report by call type for Microcell Rac','Rapport par type d\'appel pour Microcell Rac','Informe por tipo de llamada para Microcell Rac'),
  ('Agent Adherence Report','Agent Adherence Report','Rapport sur l\'adhésion de l\'agent','Informe sobre la conformidad del agente'),
  ('Show all agents','Show all agents','Montrer tous les agents','Mostrar todos los agentes'),
  ('Show all lists','Show all lists','Montrer toutes les listes','Mostrar todas las listas'),
  ('Report type','Report type','Type de rapport','Tipo del informe'),
  ('Starting date','Starting date','Date de début','Fecha del comienzo'),
  ('Ending date','Ending date','Date de fin','Fecha del fin'),
  ('detail for each year','detail for each year','données pour chaque année','datos para cada año'),
  ('for each year','for each year','pour chaque année','para cada año'),
  ('for each month','for each month','pour chaque mois','para cada mes'),
  ('detail for each month','detail for each month','données pour chaque mois','datos para cada mes'),
  ('for each day','for each day','pour chaque jour','para cada día'),
  ('detail for each day','detail for each day','données pour chaque jour','datos para cada día'),
  ('detailed information','detailed information','information détaillée','información detallada'),
  ('By Group','By group','Par groupe','Por grupo'),
  ('By Leader','By leader','Par chef','Por jefe'),
  ('Listening to agent\'s conversations','Listening to agent\'s conversations','Écouter les conversations des agents','Escuchar las conversaciones del agente'),
  ('Show statistics','Show statistics','Montrer les statistiques','Mostrar estadísticas'),
  ('All groups','All groups','Tous les groupes','Todos los grupos'),
  ('All agents','All agents','Tous les agents','Todos los agentes'),
  ('Phone number','Phone number','Numéro de téléphone','Número de teléfono'),
  ('Call time','Call time','L\'heure de l\'appel','Hora de la llamada'),
  ('To','To','à','hasta'),
  ('Sales','Sales','Ventes','Ventas'),
  ('No sales','No sales','Pas de ventes','No ventas'),
  ('Call type','Call type','Type d\'appel','Tipo de llamada'),
  ('Add new skill','Add new skill','Ajouter nouvelle compétence','Añadir nueva habilidad'),
  ('Modify skill name','Modify skill name','Modifier le nom de la compétence','Modificar el nombre de la habilidad'),
  ('Skill ID','Skill ID','ID de la compétence','ID de la habilidad'),
  ('Skill Name','Skill Name','Nom de la compétence','Nombre de la habilidad'),
  ('Add a new team','Add a new team','Ajouter un équipe','Añadir un equipo'),
  ('Update team','Update team','Mettre équipe à jour','Actualizar equipo'),
  ('Agent Group Real-Time Adherence View','Agent group real-time adherence view','Vue en temps réel de l\'adhésion du groupe d\'agents','Vista en tiempo real de la conformidad del grupo de agentes'),
  ('Time period','Time period','Période de temps','Período'),
  ('Spacing(mn)','Spacing(mn)','Espacement(min)','Espacio(min)'),
  ('Agent Login and Production time','Agent Login and Production time','Temps de connexion et de production de l\'agent','Tiempo de conexión y de producción del agente'),
  ('Method of payment','Method of payment','Méthode de paiement','Método de pago'),
  ('Codes','Codes','Codes','Códigos'),
  ('MOP Codes','MOP codes','Codes méthode de paiement','Códigos método de pago'),
  ('Training Code','Training code','Code formation','Código formación'),
  ('Integration Code','Integration code','Code intégration','Código integración'),
  ('Production Code','Production code','Code production','Código producción'),
  ('Overtime Code','Overtime code','Code heures supplémentaires','Código horas extraordinarias'),
  ('Commission Code','Commission code','Code commission','Código comisión'),
  ('Continuing training Code','Continuing training code','Code formation continue','Código formación continua'),
  ('Select a MOP commission','Select a MOP commission','Sélectionnez une commission de paiement','Seleccione una comisión de pago'),
  ('Available commissions','Available commissions','Commissions disponibles','Comisiones disponibles'),
  ('Selected commissions','Selected commissions','Commissions sélectionnées','Comisiones escogidas'),
  ('Overtime','Overtime','Heures supplémentaires','Horas extraordinarias'),
  ('Overtime properties','Overtime properties','Propriétés heures supplémentaires','Propiedades horas extraordinarias'),
  ('Number of weekly hours','Number of weekly hours','Nombre d\'heures par semaine','Cantidad de horas semanales'),
  ('Help','Help','Aide','Ayuda'),
  ('Modify the team','Modify the team','Modifier l\'équipe','Modificar el equipo'),
  ('You must enter a TEAM NAME','You must enter a TEAM NAME','Vous devez saisir un NOM D\'ÉQUIPE','Usted debe introducir un NOMBRE DE EQUIPO'),
  ('You must enter a TEAM LEADER NAME','You must enter a TEAM LEADER NAME','Vous devez saisir un NOM DE CHEF D\'ÉQUIPE','Usted debe introducir un NOMBRE de  JEFE DE EQUIPO'),
  ('Are you sure, you wish to delete this team ?','Are you sure, you wish to delete this team ?','Êtes-vous certain de vouloir supprimer cette équipe?','¿Esta usted seguro de querer suprimir este equipo?'),
  ('Team Name','Team name','Nom de l\'équipe','Nombre del equipo'),
  ('Team Leader','Team leader','Nom du chef','Jefe del equipo'),
  ('Enter user login','Enter user login','Saisissez le nom d\'utilisateur','Introducir la identificación del usuario'),
  ('Enter user numeric login','Enter user numeric login','Saisissez les numéros de connexion de l\'utilisateur','Introducir números de conexión del usuario'),
  ('Modify Live Monitoring User','Modify Live Monitoring User','Modifier supervision en temps réel de l\'utilisateur','Modificar supervisión en vivo del usuario'),
  ('This numeric login is already in use','This numeric login is already in use','Ce numéro de connexion est déjà utilisé','Este número de conexión existe ya'),
  ('You are about to delete this Live Monitoring user.\nDo you want to continue ?','You are about to delete the Live Monitoring instance for this user.\nDo you want to continue?','Vous êtes sur le point de supprimer l\'option de surveillance en temps réel pour cet utilisateur.\nDésirez-vous poursuivre?','Está a punto de suprimir la función de supervisión en vivo para este usuario.\n ¿Desea proseguir?'),
  ('Agent adherence view','Agent adherence view','Affichage de l\'adhésion à l\'horaire','Visualización de la conformidad al horario'),
  ('Stop','Stop','Arrêter','Parar'),
  ('Start','Start','Commencer','Empezar'),
  ('Your ending month-year must be the same as your starting month-year','Your ending month-year must be the same as your starting month-year','Le mois-année de fin doit être le même que le mois-année de début','Mes-año de fin debe ser igual que mes-año de comienzo'),
  ('Inbound call reports','Inbound call reports','Rapports sur les appels entrants','Informes sobre las llamadas entrantes'),
  ('Inbound call report','Inbound call report','Rapport sur les appels entrants','Informe sobre las llamadas entrantes'),
  ('Monthly','Monthly','Mensuel','Mensual'),
  ('Daily','Daily','Quotidien','Diario'),
  ('Starting time','Starting time','Heure de début','Hora de comienzo'),
  ('Ending time','Ending time','Heure de fin','Hora de fin'),
  ('Save','Save','Enregistrer','Guardar'),
  ('to','to','à','hasta'),
  ('Please enter a date','Please enter a date','Veuillez saisir une date','Favor de introducir una fecha'),
  ('You must include at least agents or supervisors','You must include at least agents or supervisors','Vous devez inclure au minumun des agents ou des superviseurs','Usted debe incluir por lo menos agentes o supervisores'),
  ('Exception Report','Exception Report','Relevé des exceptions','Informe de excepción'),
  ('Over Percentage','Over Percentage','Pourcentage supérieur à','Porcentaje sobrepasa'),
  ('Select a date','Select a date','Sélectioner une date','Seleccione una fecha'),
  ('Include agents','Include agents','Inclure les agents','Incluir agentes'),
  ('Include supervisors','Include supervisors','Inclure les superviseurs','Incluir supervisores'),
  ('already exists','already exists','existe déjà','existe ya'),
  ('You are about to delete this skill.\nDo you want to continue ?','You are about to delete this skill.\n Do you want to continue?','Vous êtes sur le point de supprimer cette compétence. \n Désirez-vous poursuivre?','¿Usted está a punto de suprimir la habilidad.\n ¿Usted desea continuar?'),
  ('cannot be choosen. It causes an order conflict with another treatment','cannot be choosen. It causes an order conflict with another treatment','ne peut pas être choisi. Il cause un conflit d\'ordre de traitement avec un autre traitement','no puede ser elejido. Causa un conflicto de orden de procesamiento con otro tratamiento'),
  ('Add a new Calling list','Add a new Calling list','Ajouter une liste d\'appel','Añadir una lista de llamada'),
  ('Modify Calling list information','Modify Calling list information','Modifier données sur la liste d\'appel','Modificar datos sobre lista de llamada'),
  ('You must enter the table name associated with this list','You must enter the table name associated with this list','Vous devez indiquer le nom de la table associée à cette liste','Debe introducir el nombre de la tabla relacionada con esta lista'),
  ('Calling list already exists','Calling list already exists','Liste d\'appel existe déjà','La lista de llamada existe ya'),
  ('Are you sure, you wish to delete this calling list?','Are you sure, you wish to delete this calling list?','Êtes-vous sûr de vouloir supprimer cette liste d\'appel?','¿Esta usted seguro de desear suprimir esta lista de llamada?'),
  ('Table Name','Table Name','Nom de la table','Nombre de la tabla'),
  ('Selected filter','Selected filter','Filtre selectionné','Filtro seleccionado'),
  ('Available Filters','Available filters','Filtres disponibles','Filtros disponibles'),
  ('Add this filter','Add this filter','Ajouter ce filtre','Añadir este filtro'),
  ('Available Treatments','Available treatments','Traitements disponibles','Tratamientos disponibles'),
  ('Selected Treatments','Selected treatments','Traitements sélectionnés','Tratamientos seleccionados'),
  ('Maximum attempts','Maximum attempts','Tentatives maximum','Tentativas máximas'),
  ('Unlimited','Unlimited','Illimité','Ilimitado'),
  ('Add a new filter','Add a new filter','Ajouter un filtre','Añadir un filtro'),
  ('Modify existing filter information','Modify existing filter information','Modifier les données sur le filtre','Modificar los datos sobre el filtro'),
  ('You must enter a FILTER NAME','You must enter a FILTER NAME','Vous devez saisir un NOM DE FILTRE','Debe introducir un NOMBRE de FILTRO'),
  ('You must enter a criteria or order by clause','You must enter a criteria or order by clause','Vous devez indiquer un critère ou une clause d\'ordonnancement','Debe introducir un criterio o cláusula de ordenación'),
  ('Are you sure, you wish to delete this filter?','Are you sure, you wish to delete this filter?','Êtes-vous sûr de vouloir supprimer ce filtre?','¿Esta usted seguro de querer suprimir este filtro?'),
  ('Filter name','Filter name','Nom du filtre','Nombre del filtro'),
  ('Criteria','Criteria','Critères','Criterios'),
  ('Order by','Order by','Trier par','Ordenar por'),
  ('Filter already exists','Filter already exists','Le filtre existe déjà','El filtro existe ya'),
  ('Add a filter','Add a filter','Ajouter un filtre','Añadir un filtro'),
  ('Delete team','Delete team','Supprimer équipe','Suprimir equipo'),
  ('Delete a team','Delete a team','Supprimer une équipe','Suprimir un equipo'),
  ('Calling list name','Calling list name','Nom de la liste d\'appel','Nombre de la lista de llamada'),
  ('Campaign name','Campaign name','Nom de campagne','Nombre de campaña'),
  ('Number of ports','Number of ports','Nombre de ports','Cantidad de puertos'),
  ('Caller ID','Caller ID','Identification de l\'appelant','ID del llamante'),
  ('Caller ID format','Caller ID format','Format identification de l\'appelant','Formato del ID de llamante'),
  ('CallerName','CallerName','Nom de l\'appelant','Nombre del llamante'),
  ('Associated calling lists','Associated calling lists','Listes d\'appel connexes','Listas de llamada relacionadas'),
  ('Available calling lists','Available calling lists','Listes d\'appel disponibles','Listas de llamada disponibles'),
  ('Associated Do-not-call lists','Associated Do-not-call lists','Listes connexes Ne-pas-appeler','Listas relacionadas de números No-llamar'),
  ('Available blacklist groups','Available Do-not-call lists','Listes disponibles Ne-pas-appeler','Listas disponibles de números No-llamar'),
  ('Selected blacklist groups','Selected Do-not-call lists','Listes sélectionnées Ne-pas-appeler','Listas seleccionadas de números No-llamar'),
  ('Campaign daily hours','Campaign daily hours','Heures quotidiennes de la campagne','Horas diarias de la campaña'),
  ('Hours','Hours','Heures','Horas'),
  ('Dollars','Dollars','Dollars','Dólares'),
  ('Daily hours','Daily hours','Heures quotidiennes','Horas diarias'),
  ('Monday','Monday','Lundi','Lunes'),
  ('Tuesday','Tuesday','Mardi','Martes'),
  ('Wednesday','Wednesday','Mercredi','Miércoles'),
  ('Thursday','Thursday','Jeudi','Jueves'),
  ('Friday','Friday','Vendredi','Viernes'),
  ('Saturday','Saturday','Samedi','Sabado'),
  ('Sunday','Sunday','Dimanche','Domingo'),
  ('From','From','de','de'),
  ('Close','Close','Fermer','Cerrar'),
  ('Mode','Mode','Mode','Modo'),
  ('Dialing Mode','Dialing mode','Mode de numérotation','Modo de marcación'),
  ('Associated routing script','Associated routing script','Script connexe d\'acheminement','Script relacionado de encaminamiento'),
  ('Preview mode','Preview mode','Mode prévisualisation','Modo vista previa'),
  ('Progressive mode','Progressive mode','Mode progressif','Modo progresivo'),
  ('Predictive mode','Predictive mode','Mode prédictif','Modo predictivo'),
  ('Broadcast mode','Broadcast mode','Mode diffusion','Modo difusión'),
  ('Optimization parameter','Optimization parameter','Paramètre d\'optimisation','Parámetro de optimización'),
  ('Agent Busy Factor','Agent Busy Factor','Facteur agent occupé','Factor agente ocupado'),
  ('Overdial Rate','Overdial Rate','Taux de surcomposition','Cuota de marcación en exceso'),
  ('Target','Target','Cible','Objetivo'),
  ('Abandon rate','Abandon rate','Taux d\'abandon','Cuota de abandono'),
  ('Answering Machine Detection','Answering Machine Detection','Détection de répondeur','Detección de contestador automático'),
  ('Load','Load','Charger','Cargar'),
  ('Not loaded','Not loaded','Non chargée','No cargada'),
  ('Add a new treatment','Add a new treatment','Ajouter un traitement','Añadir un tratamiento'),
  ('Modify treatment','Modify treatment','Modifier le traitement','Modificar el tratamiento'),
  ('Are you sure, you wish to delete this treatment?','Are you sure, you wish to delete this treatment?','Êtes-vous sûr de vouloir supprimer ce traitement?','¿Esta usted seguro de querer suprimir este tratamiento?'),
  ('Busy','Busy','Occupé','Ocupado'),
  ('Abandoned','Abandoned','Abandonné','Abandonado'),
  ('No answer','No answer','Sans réponse','Sin respuesta'),
  ('Answering machine','Answering machine','Répondeur','Contestador'),
  ('Sit','SIT','SIT','SIT'),
  ('No more trunk','No more trunk','Plus de ligne inter.','No más línea inter.'),
  ('Agent Unavailable (Personal CallBack)','Agent unavailable (personal callback)','Agent non disponible (reprise personnelle d\'appel)','Agente no disponible (repetición personal de llamada)'),
  ('Order','Order','Ordre','Orden'),
  ('Interval (min)','Interval (min)','Intervalle (min)','Intervalo (min)'),
  ('Increment (min)','Increment (min)','Incrément (min)','Incremento (min)'),
  ('Attempts','Attempts','Tentatives','Tentativas'),
  ('Treatment already exists','Treatment already exists','Le traitement existe déjà','El tratamiento existe ya'),
  ('Call result','Call result','Résultat d\'appel','Resultado de la llamada'),
  ('day','day','jour','día'),
  ('days','days','jours','días'),
  ('week','week','semaine','semana'),
  ('Personal CallBack time out (min)','Personal callback time out (min)','Délai reprise personnelle d\'appel (min)','Plazo repetición personal de llamada (min)'),
  ('Within','Within','En','Dentro de'),
  ('The longest waiting time for response must be in seconds','The longest waiting time for response must be in seconds','Temps d\'attente le plus long pour obtenir une réponse doit être exprimé en secondes','Tiempo de espera más largo para recibir respuesta debe estar en segundos'),
  ('The abandoned shortest time must be in seconds','The abandoned shortest time must be in seconds','Temps d\'attente le plus court pour abandonner l\'appel doit être exprimé en secondes','Tiempo de espera más corto para abandonar la llamada debe estar  en segundos'),
  ('The abandoned shortest time must be less than the longuest waiting time for response','The abandoned shortest time must be less than the longest waiting time for response','Temps d\'attente le plus court pour l\'abandon doit être inférieur au temps d\'attente le plus long pour la réponse','Tiempo de espera más corto para abandono tiene que ser menor que el tiempo de espera más largo para respuesta.'),
  ('Select 10 values for service level answered times','Select 10 values for service level answered times','Sélectionnez 10 valeurs de niveau de service en temps de réponse','Seleccione 10 valores de espera para nivel de servicio en llamadas contestadas'),
  ('Service factor','Service factor','Facteur de service','Factor de servicio'),
  ('General information for service factor','General information about service factor','Information générale sur le facteur de service','Información general sobre el factor de servicio'),
  ('Longest waiting time for response','Longest waiting time for response','Temps d\'attente le plus long pour obtenir réponse','Tiempo de espera más largo para recibir respuesta'),
  ('Shortest time for abandon','Shortest time for abandon','Temps d\'attente le plus court avant l\'abandon','Tiempo de espera más corto para abandono'),
  ('Service level','Service level','Niveau de service','Nivel de servicio'),
  ('Answered times','Answer times','Temps de réponse','Tiempos de espera para respuesta'),
  ('Abandonned times','Abandon times','Temps d\'abandon','Tiempos de espera para abandono'),
  ('Commission name','Commission name','Nom de la commission','Nombre de la comisión'),
  ('(associated to a MOP)','(associated to a MOP)','(associée à une méthode de paiement)','(vinculada a un método de pago)'),
  ('Max commission value','Max commission value','Valeur max. de commission','Valor max. de comisión'),
  ('Based on','Based on','Basée sur','Basado sobre'),
  ('per work hour','per work hour','par heure de travail','por trabaja hora'),
  ('Set your ranges','Set your ranges','Indiquez la plage','Establezca sus rangos'),
  ('Fixed commission','Fixed commission','Commission fixe','Comisión fija'),
  ('Sales-based commissions','Sales-based commission','Commission basée sur les ventes','Comisión basada en ventas'),
  ('Commissions based on group average','Commission based on group average','Commission basée sur la moyenne du groupe','Comisión basada en la media del grupo'),
  ('Performance-based commission','Performance-based commission','Commission basée sur la performance','Comisión basada en la desempeño'),
  ('This activity already exists. Please choose another name !','This activity already exists. Please choose another name.','L\'activité existe déjà. Veuillez choisir un autre nom.','La actividad ya existe. Favor de seleccionar otro nombre.'),
  ('Are you sure, you wish to delete this activity? This can affect your reports!','Are you sure, you wish to delete this activity? This can affect your reports.','Êtes-vous certain de vouloir supprimer l\'activité? Cela peut avoir des répercussions sur vos rapports.','¿Está seguro de querer suprimir esta actividad? Esto puede afectar a sus informes.'),
  ('Auto update','Auto update','Mise à jour automatique','Actualización automática'),
  ('General setup','General setup','Paramètres généraux','Parámetros generales'),
  ('Define work periods','Define work periods','Définir les périodes de travail','Definir periodos de trabajo'),
  ('Add a new work period','Add a new work period','Ajouter une autre période de travail','Añadir otro periodo de trabajo'),
  ('Save work periods','Save work periods','Enregistrer les périodes de travail','Guardar periodos de trabajo'),
  ('Define durations for NRR','Define durations for NRR','Définir la durée des raisons Pas-prêt','Definir duración de motivos No-listo'),
  ('Save durations for NRR','Save durations for NRR','Enregistrer les durées raison Pas-prêt','Guardar duraciones de motivo No-listo'),
  ('Paid NRR','Paid NRR','RPP rémunérée','MNL pagado'),
  ('Configure durations for NRR','Configure durations for NRR','Configurer durées raison Pas-prêt','Configurar duraciones de motivo No-listo'),
  ('Select an agent group','Agent group selection','Sélection du groupe d\'agents','Selección del grupo de agentes'),
  ('Select agent group','Select agent group','Sélectionner groupe d\'agents','Seleccionar grupo de agentes'),
  ('Associated not-ready reasons','Associated not-ready reasons','Raisons Pas-prêt associées','Motivos No-listo relacionados'),
  ('Save payable NRR for this agent group','Save payable NRR for this agent group','Enregistrer les RPP rémunérées pour ce groupe','Guardar motivos No-listo pagados para este grupo');



INSERT INTO `cfg_language` (`KEY_WORD`, `ENGLISH`, `FRENCH`, `ESPAGNOL`) VALUES 
  ('Summary','Summary','Sommaire','Resumen'),
  ('Do-not-call lists contents','Do-not-call lists contents','Contenu des listes Ne-pas-appeler','Contenido de listas de números No-llamar'),
  ('Select a do-not-call list name','Select a do-not-call list name','Sélectionner un nom de liste Ne-pas-appeler','Seleccionar nombre de lista de números No-llamar'),
  ('Select a do-not-call list','Select a do-not-call list','Sélectionner une liste Ne-pas-appeler','Seleccionar una lista No-llamar'),
  ('Select','Select','Sélectionner','Seleccionar'),
  ('View contents','View contents','Afficher contenu','Visualizar contenido'),
  ('Remove unchecked numbers','Remove unchecked numbers','Enlever les numéros sans coche','Quite números sin marca'),
  ('You must enter an ALERT NAME','You must enter an ALERT NAME','Vous devez saisir un NOM D\'ALERTE','Debe introducir un NOMBRE DE ALERTA'),
  ('You must select an AGENT GROUP','You must select an AGENT GROUP','Vous devez sélectionner UN GROUPE D\'AGENTS','Debe seleccionar un GRUPO DE AGENTES'),
  ('You must define at least one condition','You must define at least one condition','Vous devez définir au moins une condition','Debe definir por lo menos una condición'),
  ('Please define a message','Please define a message!','Veuillez définir un message','Favor de definir un mensaje'),
  ('Error: Too many open brackets in alert condition(s)!','Error: Too many open brackets in','Erreur: …contient trop de crochets d\'ouverture','Error: Demasiados corchetes de apertura en...'),
  ('Alert already exists. Please chose another name','Alert already exists. Please chose another name!','L\'alerte existe déjà. Veuillez choisir un autre nom','La alerta ya existe. Favor de seleccionar otro nombre'),
  ('Error: Unexpected close bracket in alert condition(s)!','Error: Unexpected close bracket in','Erreur: Crochet de fermeture inattendu dans…','Error: Corchete de cierre inesperado en...'),
  ('near','near','près de','cerca de'),
  ('Add alert for StarPhone','Add alert for AheevaPhone','Ajouter alerte pour AheevaPhone','Añadir alerta para AheevaPhone'),
  ('Alert definition','Alert definition','Définition de l\'alerte','Definición de la alerta'),
  ('Alert name','Alert name','Nom de l\'alerte','Nombre de la alerta'),
  ('Select a statistic','Select a statistic','Sélectionner la statistique','Seleccionar la estadística'),
  ('Average handling time','Average handling time','Temps moyen de traitement','Tiempo medio de procesamiento'),
  ('Calls in queue','Calls in queue','Appels en file','Llamadas en cola'),
  ('Productivity ratio','Productivity ratio','Quotient de productivité','Índice de productividad'),
  ('Message to send','Message to send','Message à expédier','Mensaje para enviar'),
  ('Message color','Message color','Couleur du message','Color del mensaje'),
  ('Define alert condition(s)','Define alert condition(s)','Définir condition(s) d\'alerte','Definir condición(es) de alerta'),
  ('Manager','Manager','Gestionnaire','Gestor'),
  ('Add alert for manager','Add alert for manager','Ajouter alerte pour gestionnaire','Añadir alerta para gestor'),
  (' Alert related to agent group',' Alert related to agent group',' Alerte associée au groupe d\'agents',' Alerta relacionada con grupo de agentes'),
  ('Waiting agents','Waiting agents','Agents en attente','Agentes esperando'),
  ('Agents in wrap up','Agents in wrap up','Agents en traitement post-appel','Agentes en procesamiento post llamada'),
  ('Click to write the message','Click to write the message','Cliquer pour écrire le message','Hacer clic para escribir el mensaje'),
  ('Pick','Pick','Sélectionner','Escoger'),
  ('You cannot select an alert several times','You cannot select an alert several times','Vous ne pouvez pas sélectionner une alerte plusieurs fois','No puede seleccionar una alerta varias veces'),
  ('You must enter a SCHEDULE NAME','You must enter a SCHEDULE NAME','Vous devez saisir un NOM D\'HORAIRE','Debe introducir un NOMBRE DE HORARIO'),
  ('Schedule already exists','Schedule already exists','L\'horaire existe déjà','El horario ya existe'),
  ('Add schedule for StarPhone','Add schedule for AheevaPhone','Ajouter horaire pour AheevaPhone','Añadir horario para AheevaPhone'),
  ('Schedule definition','Schedule definition','Définition de l\'horaire','Definición del horario'),
  ('Schedule name','Schedule name','Nom de l\'horaire','Nombre del horario'),
  ('Non-configured group','Non-configured group','Groupe non configuré','Grupo no configurado'),
  ('Assigned group','Assigned group','Groupe affecté','Grupo asignado'),
  ('Statistics options','Statistics options','Options de statistiques','Opciones de estadísticas'),
  ('Stats related to','Stats related to','Statistiques sur','Estadísticas relacionadas con'),
  ('Group','Group','Groupe','Grupo'),
  ('Net conversion rate','Net conversion rate','Conversion nette taux de vente','Tasa de conversión neta'),
  ('Average sales per hour','Average sales per hour','Ventes moyennes par heure','Ventas medias por hora'),
  ('Busy factor','Busy factor','Facteur occupé','Factor ocupado'),
  ('Total login time','Total login time','Temps total en session','Tiempo total en sesión'),
  ('Total calls','Total calls','Nombre d\'appels total','Cantidad total de llamadas'),
  ('Waiting calls','Waiting calls','Appels en attente','Llamadas en espera'),
  ('Abandoned calls','Abandoned calls','Appels abandonnés','Llamadas abandonadas'),
  ('Broadcast period (min)','Broadcast period (min)','Période de diffusion (min)','Periodo de difusión (min)'),
  ('Alerts options','Alerts options','Options d\'alerte','Opciones de alerta'),
  ('Add alert','Add alert','Ajouter alerte','Añadir alerta'),
  ('Add schedule for manager','Add schedule for manager','Ajouter horaire pour gestionnaire','Añadir horario para gestor'),
  ('You must enter a number to put in blacklist(s)','You must enter a number to put in the Do-not-call list(s)','Vous devez saisir un numéro à insérer dans la liste des numéros Ne-pas-appeler','Debe introducir un número para poner en la(s) lista(s) de números No\'llamar'),
  ('The number to put in blacklist must be numeric !','The numbers to put in a Do-not-call list must be made of digits.','Les numéros qui figurent dans une liste Ne-pas-appeler doivent être composés de chiffres.','Los números en una lista de números No-llamar deben estar compuestos de cifras.'),
  ('You must select a rule!','You must select a rule!','Vous devez sélectionner une règle!','¡Debe seleccionar una regla!'),
  ('Do-not-call lists rules','Do-not-call lists rules','Règles sur les listes Ne-pas-appeler','Reglas sobre listas de números No-llamar'),
  ('Do not call numbers when','Do not call numbers when','Ne pas appeler les numéros lorsque','No llame los números cuando'),
  ('EQUAL TO','EQUAL TO','EST ÉGAL À','ES IGUAL A'),
  ('NOT EQUAL TO','NOT EQUAL TO','N\'EST PAS ÉGAL À','NO ES IGUAL A'),
  ('START WITH','START WITH','DÉBUTE PAR','EMPIEZA POR'),
  ('END WITH','END WITH','SE TERMINE PAR','TERMINA POR'),
  ('CONTAIN','CONTAIN','CONTIENT','CONTIENE'),
  ('DON\'T CONTAIN','DON\'T CONTAIN','NE CONTIENT PAS','NO CONTIENE'),
  ('Available do-not-call list groups','Available Do-not-call lists','Listes Ne-pas-appeler disponibles','Listas disponibles de números No-llamar'),
  ('Selected do-not-call list groups','Selected Do-not-call lists','Listes Ne-pas-appeler sélectionnées','Listas seleccionadas de números No-llamar'),
  ('Show report order by','Show report order by','Afficher rapport par ordre','Mostrar informe en orden'),
  ('adherence value descending','adherence value descending','décroissant valeur d\'adhésion','descendiente valor de conformidad'),
  ('agent login ID','agent login ID','ID de connexion de l\'agent','ID de conexión del agente'),
  ('adherence value ascending','adherence value ascending','croissant valeur d\'adhésion','ascendente valor de conformidad'),
  ('Agent name','Agent name','Nom de l\'agent','Nombre del agente'),
  ('Agent report','Agent report','Rapport sur les agents','Informe sobre agentes'),
  ('This group name already exists. Please change the name of your group !','This group name already exists. Please change the name of the group.','Le nom de groupe existe déjà. Veuillez changer le nom du groupe.','Este nombre de grupo ya existe. Favor de cambiar el nombre del grupo.'),
  ('Do-not-call list name','Do-not-call list name','Nom de la liste Ne-pas-appeler','Nombre de la lista de números No-llamar'),
  ('Enter a name for the new do-not-call list','Enter a name for the new do-not-call list','Saisir un nom pour la nouvelle liste de numéros à Ne-pas-appeler','Introducir un nombre para la nueva lista de números No-llamar'),
  ('Agent group report','Agent group report','Rapport sur les groupes d\'agents','Informe sobre los grupos de agentes'),
  ('Agent group report parameters','Agent group report parameters','Paramètres du rapport sur les groupes d\'agents','Parámetros de informe sobre grupo de agentes'),
  ('Extract global hours','Extract global hours','Extraire heures globales','Extraer horas globales'),
  ('Do-not-call list number search','Do-not-call list number search','Recherche de numéro Ne-pas-appeler','Búsqueda número No-llamar'),
  ('Enter a number','Enter a number','Saisir un numéro','Introduzca un número'),
  ('Search','Search','Recherche','Buscar'),
  ('Select record to listen','Select record to listen','Sélectionner enregistrement à écouter','Seleccionar registro a escuchar'),
  ('Record parameters','Record parameters','Paramètres d\'enregistrement','Parámetros de grabación'),
  ('You may use (%Phonenumber%)','You may use (%Phonenumber%)','Vous pouvez utiliser (%Phonenumber%)','Puede usar (%Phonenumber%)'),
  ('Advanced options','Advanced options','Options avancées','Opciones avanzadas'),
  ('Advanced search options','Advanced search options','Options de recherche avancées','Opciones de búsqueda avanzadas'),
  ('Choose period','Choose period','Choisir la période','Escoger el periodo'),
  ('IP','IP','Adresse IP','Dirección IP'),
  ('Listen time','Listen time','Temps d\'écoute','Tiempo de escucha'),
  ('User','User','Utilisateur','Usuario'),
  ('All Users','All users','Tous les utilisateurs','Todos los usuarios'),
  ('Help for methods of payment','Help for methods of payment','Aide relative aux méthodes de paiement','Ayuda acerca de los métodos de pago'),
  ('This tab allows you to set a name(mandatory) for your MOP. You can also set a description and a status (active by default) for your MOP.','This tab allows you to set a name (mandatory) for your MOP. You can also set a description and a status (active by default) for your MOP.','L\'onglet vous permet de nommer (obligatoire) la méthode de paiement. Vous permet également d\'enregistrer une description et un état (actif par défaut) pour la méthode de paiement.','Esta pestaña le permite nombrar (obligatorio) el método de pago. Puede también introducir una descripción y establecer un estado (activo por omisión) para el método de pago.'),
  ('This tab allows you to set some codes for different activities. These activities are training, integration, production, commission and continuing training. These codes represent hourly rates(by default) or amount of money.','This tab allows you to set the codes for different activities. These activities are training, integration, production, commission and continuing training. The codes represent hourly rates (by default) or amount of money.','L\'onglet vous permet d\'établir les codes des diverses activités. Celles-ci sont la formation, intégration, production, commission et formation continue. Les codes représentent un taux horaire (par défaut) ou un montant d\'argent.','Esta pestaña le permite establecer los códigos de varias actividades. Las cuales son formación, integración, producción, comisión y formación continua. Los códigos representan tarifas horarias (por omisión) o cierta cantidad de dinero.'),
  ('Treatment','Treatment','Traitement','Tratamiento'),
  ('This tab allows you to choose a treatment for your MOP. You cannot choose more than one treatment.','This tab allows you to choose a treatment for your MOP. You cannot choose more than one treatment.','L\'onglet  vous permet de choisir un traitement pour la méthode de paiement. La sélection se limite à un traitement à la fois.','Esta pestaña le permite escoger un tratamiento para el método de pago. No puede escoger más de un tratamiento a la vez.'),
  ('This tab allows you to set a limit from which overtime hours will be counted. You can also set the multiplicative factor for overtime hours.','This tab allows you to set a limit from which overtime hours will be counted. You can also set the multiplicative factor for overtime hours.','L\'onglet vous permet d\'établir la limite à partir de laquelle seront calculées les heures supplémentaires. Vous pouvez également indiquer le facteur multiplicatif pour travail supplémentaire','Esta pestaña le permite especificar el límite desde el que se calcularan las horas extraordinarias. Puede también indicar el factor multiplicativo de cálculo de las horas extraordinarias.'),
  ('This tab allows you to set a name(mandatory) for your MOP treatment. You can also set a description and a status (active by default) for your MOP treatment.','This tab allows you to set a name(mandatory) for your MOP treatment. You can also set a description and a status (active by default) for your MOP treatment.','L\'onglet vous permet de nommer (obligatoire) le traitement associé à la méthode de paiement. Vous pouvez également enregistrer une description et l\'état (actif par défaut) du traitement.','Esta pestaña le permite nombrar (obligatorio) el tratamiento para el método de pago. Puede también introducir una descripción y establecer un estado (activo por omisión) para dicho tratamiento.'),
  ('This tab allows you to set the type of commission for your treatment. If your treatment doesn\'t need a commission, you must select a fixed commission and set its value to 0.','This tab allows you to set the type of commission for your treatment. If your treatment doesn\'t need a commission, you must select the \"fixed commission\" and set its value to \"0\".','L\'onglet vous permet de définir le type de commission pour le traitement. Si le traitement ne requiert pas de commission, vous devrez sélectionner la \"commission fixe\" et régler la valeur à \"0\".','Esta pestaña le permite especificar el tipo de comisión para el tratamiento. Si el tratamiento no necesita una comisión, debe seleccionar la \"comisión fija\" y establecer su valor a \"0\".'),
  ('You must enter a not ready reason name','You must enter a Not-ready reason name','Vous devez saisir un nom pour la raison Pas-prêt.','Debe introducir un nombre para el motivo No-listo.'),
  ('Not ready reason already exists!','Not-ready reason already exists!','La raison Pas-prêt existe déjà!','¡El motivo No-listo ya existe¡'),
  ('Not ready reason','Not-ready reason','Raison Pas-prêt','Motivo No-listo'),
  ('Are you sure, you wish to delete this Reason? This can affect your reports!','Are you sure, you wish to delete this Reason? This can affect your reports!','Êtes-vous certain de vouloir supprimer la raison? Cela peut avoir des répercussions sur vos rapports.','¿Está seguro de querer suprimir este motivo? Esto puede afectar sus informes.'),
  ('Not ready reason name','Not-ready reason name','Nom de la raison Pas-prêt','Nombre del motivo No-listo'),
  ('agent name','agent name','nom de l\'agent','nombre del agente'),
  ('Record listening report','Record listening report','Rapport sur l\'écoute des enregistrements','Informe sobre escucha de registros'),
  ('Help for MOP treatments','Help for MOP treatments','Aide relative aux traitements pour méthodes de paiement','Ayuda acerca de los tratamientos para métodos de pago'),
  ('Global','Global','Global','Global'),
  ('Use this not ready reason in productivity','Use this Not-ready reason in productivity','Utiliser la raison Pas-prêt en productivité','Usar este motivo No-listo en productividad'),
  ('Agent\'s recording schedule','Agent\'s recording schedule','Horaire d\'enregistrement de l\'agent','Horario de grabación del agente'),
  ('General scheduling','General scheduling','Planification générale des horaires','Planificación general de los horarios'),
  ('Number of recording','Number of recordings','Nombre d\'enregistrements','Cantidad de registros'),
  ('All','All','Tous','Todos'),
  ('Weekly','Weekly','Hebdomadaire','Semanal'),
  ('Add specific scheduling','Add specific scheduling','Ajouter enregistrement spécifique','Añadir grabación específica'),
  ('Weight must be between 0 and 100','Weight must be between \"0\" and \"100\"','Pondération doit se situer entre \"0\" et \"100\"','Ponderación debe estar entre \"0\" y \"100\"'),
  ('Sort agents by ID','Sort agents by ID','Trier les agents par ID','Ordenar agentes por ID'),
  ('Set agent\'s skills','Set agent\'s skills','Établir les compétences de l\'agent','Establecer habilidades del agente'),
  ('Cancel','Cancel','Annuler','Cancelar'),
  ('Please enter a valid phone number','Please enter a valid phone number','Veuillez saisir un numéro de téléphone valide','Favor de introducir un número de teléfono válido'),
  ('Your ending month-year must be the same as your starting month-year!','Your ending month-year must be the same as your starting month-year!','Le mois-année de fin doit être le même que le mois-année de début.','El mes-año de fin debe ser el mismo que el mes-año de comienzo.'),
  ('Spacing (min)','Spacing (min)','Espacement (min)','Espacio (min)'),
  ('Not ready reason ID','Not-ready reason ID','ID de la raison Pas-prêt','ID del motivo No-listo'),
  ('Per group','Per group','Par groupe','Por grupo'),
  ('Choose a group or all','Choose a group or all','Choisir un groupe ou tous','Escoger un grupo o todos'),
  ('Per agent','Per agent','Par agent','Por agente'),
  ('Choose agent','Choose agent','Choisir agent','Escoger agente'),
  ('You must define at least one condition!','You must define at least one condition!','Vous devez définir au moins une condition.','Debe definir como mínimo una condición.'),
  ('Are you sure you wish to delete this alert?','Are you sure you wish to delete this alert?','Êtes-vous certain de vouloir supprimer l\'alerte?','¿Está seguro de querer suprimir esta alerta?'),
  ('Are you sure you wish to delete this schedule?','Are you sure you wish to delete this schedule?','Êtes-vous certain de vouloir supprimer l\'horaire?','¿Está seguro de querer suprimir este horario?'),
  ('Current status','Current status','État actuel','Estado actual'),
  ('Total talk time','Total talk time','Temps total en ligne','Tiempo de habla total'),
  ('Total wait time','Total wait time','Temps total en attente','Tiempo de espera total'),
  ('Total not ready time','Total not-ready time','Temps total Pas-prêt','Tiempo total No-listo'),
  ('Total wrap up time','Total wrap-up time','Temps total post-appel','Tiempo total post-llamada'),
  ('Total on hold time','Total on hold time','Temps total en garde','Tiempo total en retención'),
  ('Total conference time','Total conference time','Temps total conférence','Tiempo total en conferencia'),
  ('Total dialing time','Total dialing time','Temps total composition','Tiempo total marcando números'),
  ('Agents logged in','Agents logged in','Agents en session','Agentes en sesión'),
  ('Total calls handled','Total calls handled','Total appels traités','Total llamadas procesadas'),
  ('In call inbound','In call inbound','En réception d\'appel','Recibiendo llamada'),
  ('In call outbound','In call outbound','En émission d\'appel','Haciendo llamada'),
  ('Waiting','Waiting','En attente','Esperando'),
  ('Wrapup','Wrapup','Post-appel','Post-llamada'),
  ('Dialing','Dialing','En composition','Marcando'),
  ('On hold','On hold','En garde','En retención'),
  ('In conference','In conference','En conférence','En conferencia'),
  ('Type','Type','Type','Tipo'),
  ('Queue','Queue','File','Cola'),
  ('Entered','Entered','Entrés','Entradas'),
  ('Distributed','Distributed','Distribués','Distribuidas'),
  ('Longest call waiting','Longest call waiting','Appel le plus en attente','Llamada con la más espera'),
  ('Current average waiting time','Current average waiting time','Temps actuel moyen d\'attente','Tiempo de espera medio actual'),
  ('Average waiting time','Average waiting time','Moyenne temps d\'attente','Tiempo de espera medio'),
  ('Abandon level','Abandon level','Niveau d\'abandon','Nivel de abandono'),
  ('Time started','Time started','Heure début','Hora de comienzo'),
  ('Status','Status','État','Estado'),
  ('Dials','Dials','Compositions','Marcaciones'),
  ('Answered','Answered','Réponses','Respuestas'),
  ('Answer machine','Answering machine','Répondeur','Contestador'),
  ('Current call length','Current call length','Durée appel courant','Duración llamada actual'),
  ('SIT','SIT','SIT','SIT'),
  ('Fax','Fax','Téléc.','Fax'),
  ('Call list','Call list','Liste d\'appel','Lista de llamada'),
  ('Remaining records','Remaining records','Articles en attente','Registros restantes'),
  ('Total','Total','Total','Total'),
  ('Records in process','Records in process','Articles en traitement','Registros en procesamiento'),
  ('Records in filter','Records in filter','Articles dans le filtre','Registros en el filtro'),
  ('Next hour','Next hour','Heure suivante','Próxima hora'),
  ('Percent completed','Percent completed','Pourcentage terminé','Porcentaje terminado'),
  ('HitRate','Hit rate','Taux de succès','Tasa de éxito'),
  ('Current TZ','Current TZ','FH courant','ZH actual'),
  ('Agent ID','Agent ID','ID de l\'agent','ID del agente'),
  ('Contacts','Contacts','Contacts','Contactos'),
  ('Refusals','Refusals','Rejets','Rechazos'),
  ('Callbacks','Callbacks','Rappels','Repetic. de llamadas'),
  ('Sales/hour','Sales/hour','Ventes/heure','Ventas/hora'),
  ('Net Conv. Rate','Net conv. rate','Conv. nette taux vente','Tasa convers. neta'),
  ('Agent spying','Agent spying','Écoute de l\'agent','Escucha del agente'),
  ('Notice','Notice','Avis','Aviso'),
  ('Message','Message','Message','Mensaje'),
  ('Live monitoring management','Live monitoring management','Gestion de la supervision en temps réel','Gestión de la supervisión en tiempo real'),
  ('Tenant view','Tenant view','Affichage client','Visualización cliente'),
  ('Queues configuration','Queue configuration','Configuration des files d\'attente','Configuración de las colas'),
  ('Quality Monitoring and reports','Quality monitoring and Reports','Contrôle de la qualité et Rapports','Supervisión de la calidad e Informes'),
  ('Login report','Login report','Rapport sur les connexions','Informe sobre las conexiones'),
  ('Finances and Methods of payment','Finances and Methods of payment','Finances et Méthodes de paiement','Finanzas y Métodos de pago'),
  ('Queues reports','Queue reports','Rapports sur les files d\'attente','Informes sobre las colas'),
  ('Associated table name','Associated table name','Nom de la table connexe','Nombre de la tabla relacionada'),
  ('Current filter','Current filter','Filtre courrant','Filtro actual'),
  ('Advanced','Advanced','Avancées','Avanzadas'),
  ('Sales per unit','Sales per unit','Ventes par unité','Ventas por unidad'),
  ('Sales per week','Sales per week','Ventes par semaine','Ventas por semana'),
  ('New','New','Nouveau','Nuevo'),
  ('List name','List name','Nom de la liste','Nombre de la lista'),
  ('Delimiter','Delimiter','Délimiteur','Delimitador'),
  ('tab','tab','tabulateur','tabulador'),
  ('space','space','espace','espacio'),
  ('Quote','Quote','Guillemets','Comillas'),
  ('Source file name','Source file name','Nom du fichier source','Nombre del fichero fuente'),
  ('Skip','Skip','Saut','Salto'),
  ('Row(s)','Row(s)','Rangée(s)','Fila(s)'),
  ('Actions','Actions','Actions','Acciones'),
  ('Extras','Extras','Extra','Extras'),
  ('Auto fill','Auto fill','Remplissage automatique','Relleno automático'),
  ('Clear all','Clear all','Effacer tout','Borrar todo'),
  ('Create new fields from first line','Create new fields from first line','Créer nouveaux champs avec première ligne','Crear nuevos campos con primera línea'),
  ('Next','Next','Suivant','Siguiente'),
  ('Finished','Finished','Terminé','Terminado'),
  ('Loading statistics','Loading statistics','Chargement des statistiques','Carga de estadísticas'),
  ('Processed','Processed','Traité','Procesado'),
  ('Inserted','Inserted','Inséré','Insertado'),
  ('Errors','Errors','Erreurs','Errores'),
  ('Show errors','Show errors','Afficher erreurs','Mostrar errores'),
  ('Pause','Pause','Pause','Pausa'),
  ('Dialing hours','Dialing hours','Heures de composition','Horas de marcación'),
  ('Apply to','Apply to','Appliquer à','Aplicar a'),
  ('All records','All records','Tous les articles','Todos los registros'),
  ('Empty hours records','Empty hours records','Articles avec heures à vide','Registros con horas vacías'),
  ('None','None','Aucun','Ninguno'),
  ('Screen pop','Screen pop','Remontée de fiche','Ventana emergente'),
  ('Defined urls','Defined URLs','URL définis','URLs definidos'),
  ('Records with no extra data',' Records with no extra data',' Articles sans données supplémentaires',' Registros sin datos adicionales'),
  ('Phone number purification','Phone number purification','Purification des numéros de téléphone','Purificación de números de teléfono'),
  ('Action','Action','Actions','Acción'),
  ('Non numeric phone numbers','Non numeric phone numbers','Numéros de téléphone non numériques','Números de teléfono no numéricos'),
  ('Remove record','Remove record','Enlever article','Quitar registro'),
  ('Prefix rules','Prefix rules','Règles sur les préfixes','Reglas sobre prefijos'),
  ('Time zones setup','Time zones setup','Etablissement des fuseaux horaires','Establecimiento del huso horario'),
  ('Available rules','Available rules','Règles disponibles','Reglas disponibles'),
  ('Selected rules','Selected rules','Règles sélectionnées','Reglas seleccionadas'),
  ('Empty time zone records','Empty time zone records','Articles avec fuseau horaire à vide','Registros con huso horario vacío'),
  ('Time','Time','Heure','Hora'),
  ('Load format','Load format','Charger format','Cargar formato'),
  ('Queries status','Query status','État des requêtes','Estado de las consultas'),
  ('Extra data','Extra data','Données supplémentaires','Datos adicionales'),
  ('Time zones','Time zones','Fuseaux horaires','Husos horarios'),
  ('Save settings','Save settings','Enregistrer paramètres','Guardar parámetros'),
  ('Existing formats','Existing formats','Formats existants','Formatos existentes'),
  ('Url','URL','URL','URL'),
  ('Diagnostic','Diagnostic','Diagnostic','Diagnóstico'),
  ('Loaded records','Loaded records','Articles chargés','Registros cargados'),
  ('Records in table','Records in table','Articles dans la table','Registros en la tabla'),
  ('Records with no time zone','Records with no time zone','Articles sans fuseau horaire','Registros sin huso horario'),
  ('To listen to an encrypted record, please login via https !','To listen to an encrypted record, please login via https !','Pour écouter un enregistrement chiffré, veuillez établir la connexion avec https.','Para escuchar un registro cifrado, favor de conectarse por https.'),
  ('Records list','Record list','Liste des articles','Lista de registros'),
  ('Command','Command','Commande','Mandato'),
  ('Error while generating report','Error while generating report','Erreur lors de la production du rapport','Error al generar el informe'),
  ('No records available','No record available','Pas d\'article disponible','Ningún registro disponible'),
  ('Play','Play','Lecture','Lectura'),
  ('Listen history','Listen history','Historique d\'écoute','Historial de escucha'),
  ('Event time','Event time','Heure de l\'événement','Hora del acontecimiento'),
  ('File name','File name','Nom du fichier','Nombre del fichero'),
  ('Found','Found','Trouvé','Encontrado'),
  ('records','records','articles','registros'),
  ('Caller ID name','Caller ID name','Nom de l\'identifiant de l\'appelant','Nombre del ID del llamante'),
  ('Be ready after login','Be ready after login','Prêt dès la connexion','Estar listo al conectarse'),
  ('Priority','Priority','Priorité','Prioridad'),
  ('Call condition test [Setup]','Call condition test [Setup]','Test de condition d\'appel [Configuration]','Prueba de condición de llamada [Configuración]'),
  ('Test','Test','Test','Prueba'),
  ('Call property','Call property','Propriété d\'appel','Propriedad de llamada'),
  ('Call properties','Call properties','Propriétés d\'appel','Propriedades de llamada'),
  ('Operator','Operator','Opérateur','Operador'),
  ('Operators','Operators','Opérateurs','Operadores'),
  ('Seek value','Seek value','Valeur de recherche','Valor de búsqueda'),
  ('Get DTMF [Setup]','Get DTMF [Setup]','Obtenir DTMF [Configuration]','Obtener DTMF [Configuración]'),
  ('ID','ID','ID','ID'),
  ('Data name','Data name','Nom des données','Nombre de los datos'),
  ('Maximum length','Maximum length','Longueur maximale','Longitud máxima'),
  ('Timeout','Timeout','Délai d\'attente','Tiempo de espera'),
  ('Enders','Enders','Indicateurs de fin','Marcas de final'),
  ('Default value','Default value','Valeur par défaut','Valor por omisión'),
  ('Voice message','Voice message','Message vocal','Mensaje vocal'),
  ('Call Ending [Setup]','Call ending [Setup]','Fin de message [Configuration]','Final de llamada [Configuración]'),
  ('Hangup','Hang-up','Raccrochage','Terminación de llamada'),
  ('Soft hangup','Soft hang-up','Transfert en deux étapes','Transferencia en dos etapas'),
  ('Transfer','Transfer','Transfert','Transferencia'),
  ('Voicemail','Voicemail','Boîte vocale','Mensajería vocal'),
  ('Parameters','Parameters','Paramètres','Parámetros'),
  ('Agent pickup method [Setup]','Agent pickup method [Setup]','Méthode de prise d\'appel par l\'agent [Configuration]','Método de toma de llamada por el agente [Configuración]'),
  ('Properties','Properties','Propriétés','Propriedades de llamada'),
  ('Minimum required','Minimum required','Minimum requis','Requisito necesario'),
  ('Action during timeout','Action during timeout','Action à l\'expiration de la temporisation','Acción al cumplir la temporización'),
  ('Tie breaker','Tie breaker','Départage','Desempate'),
  ('Most idle','Most idle','Plus inactif','Más inactivo'),
  ('Least busy','Least busy','Moins occupé','Menos ocupado'),
  ('Call priority','Call priority','Priorité d\'appel','Prioridad de llamada'),
  ('Queue name','Queue name','Nom de la file','Nombre de la cola'),
  ('Announcements active','Announcements active','Messages activés','Anuncios activados'),
  ('Start with announcement','Start with announcement','Débuter avec message','Empezar con anuncio'),
  ('Frequency','Frequency','Fréquence','Frecuencia'),
  ('Announcement of current hold time','Announcement of current hold time','Message sur le temps de garde actuel','Anuncio del tiempo de retención actual'),
  ('Voice messages','Voice messages','Messages vocaux','Mensajes vocales'),
  ('Thank you message','Thank you message','Message de remerciement','Mensaje de gracias'),
  ('Current average time message','Current average time message','Message sur le temps moyen actuel','Mensaje de tiempo medio actual'),
  ('Minutes message','Minutes message','Message sur les minutes','Mensaje sobre minutos'),
  ('Priority increment [Setup]','Priority increment [Setup]','Incrément de priorité [Configuration]','Incremento de prioridad [Configuración]'),
  ('Applications execute [Setup]','Applications execute [Setup]','Exécuter applications [Configuration]','Ejecutar aplicación [Configuración]'),
  ('Selected applications','Selected applications','Applications sélectionnées','Aplicaciones seleccionadas'),
  ('Available applications','Available applications','Applications disponibles','Aplicaciones disponibles'),
  ('Set','Set','Établir','Establecer'),
  ('Database query [Setup]','Database query [Setup]','Interrogation de la base de données [Configuration]','Consulta de la base de datos [Configuración]'),
  ('MySQL query','MySQL query','Requête MySQL','Búsqueda MySQL'),
  ('Result name','Result name','Nom du résultat','Nombre del resultado'),
  ('Switch statement [Setup]','Switch statement [Setup]','Énoncé de commutation [Configuration]','Sentencia de conmutación [Configuración]'),
  ('Values','Values','Valeurs','Valores'),
  ('Like','Like','Semblable à','Parecido a'),
  ('Counter [Setup]','Counter [Setup]','Compteur [Configuration]','Contador [Configuración]'),
  ('Attached to','Attached to','Associé à','Vinculado a'),
  ('Call','Call','Appel','Llamada'),
  ('Reset','Reset','Réinitialiser','Restablecer'),
  ('Get statistic [Setup]','Get statistic [Setup]','Obtenir statistique [Configuration]','Obtener estadística [Configuración]'),
  ('Queues statistics','Queue statistics','Statistiques sur les files','Estadísticas sobre colas'),
  ('Calls entered','Calls entered','Appels entrés','Llamadas entradas'),
  ('Calls distributed','Calls distributed','Appels distribués','Llamadas distribuidas'),
  ('Abandonned calls','Abandoned calls','Appels abandonnés','Llamadas abandonadas'),
  ('Longest waiting call','Longest waiting call','Appel le plus en attente','Llamada con la más espera'),
  ('Agents statistics','Agent statistics','Statistiques sur les agents','Estadísticas sobre los agentes'),
  ('Login agents','Login agents','Agents en session','Agentes conectados'),
  ('Configured agents','Configured agents','Agents configurés','Agentes configurados'),
  ('AND','AND','AND','AND'),
  ('OR','OR','OR','OR'),
  ('Variable name','Variable name','Nom de la variable','Nombre de la variable'),
  ('Custom server [Setup]','Custom server [Setup]','Serveur personnalisé [Configuration]','Servidor personalizado [Configuración]'),
  ('Library','Library','Bibliothèque','Biblioteca'),
  ('Function','Function','Fonction','Función'),
  ('Enter extra data name','Enter extra data name','Indiquer nom des données additionnelles','Indicar nombre de los datos adicionales'),
  ('Available properties','Available properties','Propriétés disponibles','Propriedades disponibles'),
  ('New property','New property','Nouvelle propriété','Nueva propriedad'),
  ('Open script','Open script','Script d\'ouverture','Script de apertura'),
  ('Open','Open','Ouvrir','Abrir'),
  ('Save script as','Save script as','Enregistrer script sous','Guardar script como'),
  ('Save as','Save as','Enregistrer sous','Guardar como'),
  ('Script name','Script name','Nom du script','Nombre del script'),
  ('Whole script validation','Whole script validation','Validation du script entier','Validación del script entero'),
  ('Help for commissions','Help for commissions','Aide relative aux commissions','Ayuda acerca de las comisiones'),
  ('Real-time adherence view for','Real-time adherence view for','Affichage de l\'adhésion en temps réel pour','Visualización en tiempo real de la conformidad al horario para'),
  ('Work period','Work period','Période de travail','Periodo de trabajo'),
  ('Adherence value','Adherence value','Valeur d\'adhésion','Valor de conformidad'),
  ('yes','yes','oui','sí'),
  ('no','no','non','no'),
  ('Break/Meal','Break/Meal','Pause/Repas','Descanso/Almuerzo'),
  ('Break/Meal period','Break/Meal period','Période Pause/Repas','Periodo Descanso/Almuerzo'),
  ('Gap between work and break','Gap between work and break','Séparation entre travail et pause','Separación entre trabajo y descanso'),
  ('Global adherence','Global adherence','Adhésion globale','Conformidad global'),
  ('View agent schedule','View agent schedule','Afficher horaire de l\'agent','Visualizar horario del agente'),
  ('Work','Work','Travail','Trabajo'),
  ('View adherence details','View adherence details','Afficher données sur l\'adhésion','Visualizar datos sobre la conformidad'),
  ('Agent personal info','Agent personal info','Information personnelle sur l\'agent','Datos personales sobre el agente'),
  ('Host name','Host name','Nom de l\'hôte','Nombre de anfitrión'),
  ('First login','First login','Première connexion','Primera conexión'),
  ('You are at','You are at','Vous êtes à...','Usted está en...'),
  (' pixels',' pixels',' pixels',' píxeles'),
  (' was LOGGED OUT.\n Should be logged in during this period',' was LOGGED OUT.\n Should be logged in during this period',' était DÉCONNECTÉ.\n Devrait être en session pendant cette période.',' estaba DESCONECTADO.\n Debería estar conectado durante este periodo.'),
  (' was LOGGED IN.\n Should be logged in during this period',' was LOGGED IN.\n Should be logged in during this period',' était CONNECTÉ.\n Devrait être en session pendant cette période.',' estaba CONECTADO.\n Debería estar conectado durante este periodo.'),
  ('Click Start in','Click Start in','Cliquer sur Démarrer','Hacer clic sobre Comenzar'),
  ('under Work Force Management--Adherence to view adherence data for this day',' under Work Force Management--Adherence to view adherence data for this day',' dans Gestion des effectifs--Adhésion pour afficher les données pour cette journée.',' en Gestión del personal--Conformidad para ver los datos de este día sobre la conformidad.'),
  ('No schedule data found in database. Please load schedule data for this day','No schedule data found in database. Please load schedule data for this day','L\'horaire n\'a pas été trouvé dans la base de données. Veuillez charger les données de l\'horaire pour cette journée.','No se ha encontrado el horario en la base de datos. Favor de cargar los datos del horario para este día.'),
  ('New script','New script','Nouveau script','Nuevo script'),
  ('Delete script','Delete script','Supprimer script','Suprimir script'),
  ('Script statistics','Script statistics','Statistiques sur le script','Estadísticas sobre el script'),
  ('Exit','Exit','Sortir','Salir'),
  ('Undo','Undo','Annuler','Deshacer'),
  ('Redo','Redo','Rétablir','Rehacer'),
  ('Clear diagram','Clear diagram','Effacer diagramme','Borrar gráfico'),
  ('Validate diagram','Validate diagram','Valider diagramme','Validar gráfico'),
  ('Delete link','Delete link','Supprimer lien','Suprimir enlace'),
  ('Zoom diagram','Zoom diagram','Agrandir diagramme','Acercar gráfico'),
  ('Unzoom diagram','Unzoom diagram','Réduire diagramme','Alejar gráfico'),
  ('Undo zooming','Undo zooming','Annuler le zoom','Deshacer el zoom'),
  ('Statements','Statements','Énoncés','Sentencias'),
  ('User manual','User manual','Manuel de l\'utilisateur','Manual del usuario'),
  ('Agent pickup method','Agent pickup method','Méthode de prise d\'appel par l\'agent','Método de toma de llamada por el agente'),
  ('Caller priority increment','Caller priority increment','Incrément de priorité d\'appel','Incremento de prioridad del llamante'),
  ('Application execute','Application execute','Exécuter application','Executar aplicación'),
  ('Get string','Get string','Obtenir chaîne','Obtener cadena'),
  ('Get dtmf','Get dtmf','Obtenir dtmf','Obtención dtmf'),
  ('Database query','Database query','Consultation de la base de données','Búsqueda en la base de datos'),
  ('Custom server','Custom server','Serveur personnalisé','Servidor personalizado'),
  ('End call','End call','Terminer l\'appel','Terminar la llamada'),
  ('If ... else ...','If ... else ...','Si ... alors ...','Si ... si no ...'),
  ('Switch... case...','Switch... case...','Commutateur... cas...','Conmutador... caso...'),
  ('Counter','Counter','Compteur','Contador'),
  ('Get statistic','Get statistic','Obtenir statistique','Obtener estadística'),
  ('New calling list wizard','New calling list wizard','Assistant Création d\'une liste d\'appel','Asistente Creación de una lista de llamada'),
  ('Calling list wizard','Calling list wizard','Assistant Liste d\'appel','Asistente Lista de llamada'),
  ('Warning: No sheet found in this xls file','Warning: No sheet found in this xls file','Avertissement: Ce fichier .xls ne contient aucune feuille','Aviso: No se ha encontrado hojas en este fichero .xls'),
  ('Setting name','Setting name','Nom de configuration','Nombre de configuración'),
  ('Don\'t forget to select an override cause','Don\'t forget to select an override cause','N\'oubliez pas de sélectionner la raison du changement','No se olvide de seleccionar el motivo para el cambio'),
  ('Do you really want to close this day','Do you really want to close this day?','Êtes-vous certain de vouloir fermer cette journée?','¿Está seguro de que desea cerrar este día?'),
  ('Please select a group','Please select a group','Veuillez sélectionner un groupe','Favor de seleccionar un grupo'),
  ('Please select an agent','Please select an agent','Veuillez sélectionner un agent','Favor de seleccionar un agente'),
  ('You cannot add a row for a date prior to today. Please change the date!','You cannot add a row for a date prior to today. Please change the date!','Vous ne pouvez pas ajouter une rangée pour une date antérieure à celle d\'aujourd\'hui. Veuillez changer la date.','No puede añadir una línea para una fecha anterior a la de hoy. Favor de cambiar la fecha.'),
  ('You must select an activity for each row, please verify','You must select an activity for each row. Please verify','Vous devez sélectionner une activité pour chaque rangée. Veuillez vérifier que','Debe seleccionar una actividad en cada línea. Favor de comprobar que'),
  ('You must enter a paid time for each row, please verify','You must enter a paid time for each row. Please verify','Vous devez indiquer un temps rémunéré pour chaque rangée. Veuillez vérifier que','Debe indicar un tiempo pagado en cada línea. Favor de comprobar que'),
  ('Login time','Login time','Temps de connexion','Tiempo de conexión'),
  ('Not paid NRR time','Not paid NRR time','Temps RPP non payé','Tiempo MNL no pagado'),
  ('Extra paid NRR time','Extra paid NRR time','Temps RPP supplémentaire payé','Tiempo MNL pagado adicional'),
  ('Total paid time','Total paid time','Temps total rémunéré','Tiempo total pagado'),
  ('Search options','Search options','Options de recherche','Opciones de búsqueda'),
  ('Save modified','Save modified','Enregistrer les modifications','Guardar las modificaciones'),
  ('Close this day','Close this day','Fermer la journée','Cerrar el día'),
  ('Select an agent','Select an agent','Sélectionner un agent','Seleccionar un agente'),
  ('View data','View data','Afficher les données','Visualizar los datos'),
  ('Paid time','Paid time','Temps rémunéré','Tiempo pagado'),
  ('Override','Override','Modifier','Cambiar'),
  ('Override by','Override by','Modifier par','Cambiar por'),
  ('Correction','Correction','Correction','Corrección'),
  ('Override time','Override time','Modifier le temps','Cambiar el tiempo'),
  ('Override cause','Override cause','Raison de la modif.','Motivo del cambio'),
  ('Custom cause','Custom cause','Raison adaptée','Motivo adaptado'),
  ('Starphone crash','AheevaPhone crash','Panne du AheevaPhone','Fallo de AheevaPhone'),
  ('Fire alarm','Fire alarm','Avertisseur d\'incendie','Alarma de incendios'),
  ('Computer crash','Computer crash','Panne du système','Fallo de sistema'),
  ('Power failure','Power failure','Panne d\'électricité','Apagón'),
  ('Agent displacement','Agent displacement','Déplacement de l\'agent','Desplazamiento de agente'),
  ('Sent Home (3hrs paid)','Sent Home (3hrs paid)','Quart écourté (3 h. payées)','Turno abreviado (3 h. pagadas)'),
  ('First day integration','First day integration','Première journée d\'intégration','Primer día de integración'),
  ('Floor support','Floor support','Soutien à la production','Ayuda a la producción'),
  ('HR interview','HR interview','Entrevue RH','Entrevista RH'),
  ('Other','Other','Autre','Otro'),
  ('Add a row','Add a row','Ajouter une rangée','Añadir una línea'),
  ('Save rows','Save rows','Enregistrer les rangées','Guardar las líneas'),
  ('Exceptions','Exceptions','Exceptions','Excepciones'),
  ('Select start date','Select start date','Sélectionner la date de début','Seleccionar la fecha de comienzo'),
  ('Select stop date','Select stop date','Sélectionner la date de fin','Seleccionar la fecha de fin'),
  ('Date','Date','Date','Fecha'),
  ('System failure','System failure','Panne de système','Fallo de sistema'),
  ('Working at Fido','Working at Fido','Travaille chez Fido','Trabajando con Fido'),
  ('View agent groups hours summary','View agent groups hours summary','Afficher le sommaire des heures des groupes','Visualizar el sumario de las horas de los grupos'),
  ('Billable','Billable','Facturable','Facturar'),
  ('View exceptions','View exceptions','Afficher les exceptions','Visualizar las excepciones'),
  ('Financial configuration','Financial configuration','Financial configuration','Configuración financiera'),
  ('Calling List Report Details','Calling List Report Details','Rapport détaillé sur les listes d\'appel','Informes sobre las listas de llamada'),
  ('Live monitoring login','Live monitoring login','Live monitoring login','Conexión de supervisión viva'),
  ('Live monitoring password','Live monitoring password','Live monitoring password','Contraseña de supervisión viva'),
  ('Retype live monitoring password','Retype live monitoring password','Retype live monitoring password','Escribir de nuevo la contraseña a máquina de supervisión viva'),
  ('Predefined Roles','Predefined Roles','Rôles prédéfinis','Papeles predefinidos'),
  ('Custom','Custom','Custom','Custom'),
  ('Tenants','Tenants','Tenants','Tenants'),
  ('No statistics are currently available','No statistics are currently available','Aucune statistique n\'est disponible actuellement','Ninguna estadística está disponible actualmente'),
  ('Security','Security','Sécurité','Securidad'),
  ('Add new tenant','Add new tenant','Ajouter un nouveau client','Añadir un cliente'),
  ('Security settings','Security settings','Paramètres de sécurité','Parámetros de securidad'),
  ('Allowed users','Allowed users','Usagers permis','Usuarios permitidos'),
  ('Not allowed users','Not allowed users','Usagers non permis','usuarios no permitidos'),
  ('No statistics are currently available.','No statistics are currently available.','Aucune statistique n\'est disponible actuellement.','Ninguna estadística está disponible actualmente.'),
  ('Disallowed users','Disallowed users','Utilisateurs non autorisés','Usuarios no autorizados'),
  ('Assign at least one tenant','Assign at least one tenant','Assigner au moins un profil','Asignar por lo menos un perfil'),
  ('Financial information','Financial information','Informations financières','Información financiera'),
  ('Work Force Management','Work force management','Gestion des effectifs','Gestión del personal'),
  ('Your schedule data has been saved properly!','Your schedule data has been saved properly!','Vos données sur l\'horaire ont été sauvegardées correctement.','Sus datos sobre el horario se han guardado correctamente.'),
  ('Your recording schedule has been saved properly!','Your recording schedule has been saved properly!','Votre programme d\'enregistrement a été sauvegardé correctement.','Su programa de grabación se ha guardado correctamente.'),
  ('Your description should be filled. Use valid characters.','Your description should be filled. Use valid characters.','Vous devez compléter la description. Utilisez des caractères valides.','Debe rellenar la descripción. Use caracteres válidos.'),
  ('You must specify an email address to which the report will be sent','You must specify an email address to which the report will be sent','Vous devez indiquer une adresse de courriel pour l\'expédition du rapport','Debe indicar una dirección de correo electrónico para el envió del informe'),
  ('You must select one type of commission for this treatment','You must select one type of commission for this treatment','Vous devez sélectionner un type de commission pour ce traitement','Debe seleccionar un tipo de comisión para éste tratamiento'),
  ('You must select an activity for this agent','You must select an activity for this agent','Vous devez sélectionner une activité pour l\'agent','Debe seleccionar una actividad para el agente'),
  ('You must select a payroll company','You must select a payroll company','Vous devez sélectionner une entreprise de paie','Debe seleccionar una empresa pagadora'),
  ('You must first save the agent to set the skills','You must first save the agent to set the skills','Vous devez d\'abord enregistrer l\'agent avant d\'établir les compétences','Debe registrar el agente antes de establecer las habilidades'),
  ('You must enter the encryption server IP or uncheck the encryption box','You must enter the encryption server IP or uncheck the encryption box','Vous devez saisir l\'IP du serveur de chiffrement ou désactiver la case de chiffrement','Debe introducir el IP del servidor de cifrado o desactivar el recuadro de selección de cifrado'),
  ('You must enter the encryption method or uncheck the encryption box','You must enter the encryption method or uncheck the encryption box','Vous devez saisir une méthode de chiffrement ou désactiver la case de chiffrement','Debe introducir el método de cifrado o desactivar el recuadro de selección de cifrado'),
  ('You must enter the amount of override salary of that group','You must enter the amount of override salary of that group','Vous devez saisir le nouveau salaire de ce groupe','Debe introducir el nuevo sueldo para este grupo'),
  ('You must enter a Mop Treatment name','You must enter a Mop Treatment name','Vous devez saisir un nom de traitement pour la méthode de paiement','Debe introducir un nombre de tratamiento para el método de pago'),
  ('You must enter a Mop name','You must enter a Mop name','Vous devez saisir un nom de méthode de paiement','Debe introducir un nombre de método de pago'),
  ('You must enter a GROUP QUEUE','You must enter a GROUP QUEUE','Vous devez saisir un NOM DE FILE','Debe introducir un NOMBRE DE COLA'),
  ('You must enter a GROUP NAME','You must enter a GROUP NAME','Vous devez saisir un NOM DE GROUPE','Debe introducir un NOMBRE DE GRUPO'),
  ('You must acknowledge and enter a comment before submitting','You must acknowledge and enter a comment before submitting','Vous devez confirmer et saisir un commentaire avant de soumettre les données','Debe confirmar e introducir un comentario antes de enviar los datos'),
  ('You cannot select a reason several times','You cannot select a reason several times','Vous ne pouvez pas sélectionner une raison plusieurs fois','No puede seleccionar un motivo varias veces'),
  ('You cannot extract data to cover more than one week','You cannot extract data to cover more than one week','Vous ne pouvez pas extraire des données qui portent sur plus d\'une semaine.','No puede extraer datos que abarquen más de una semana'),
  ('You can associate only one treatment to this MOP. Please drop the currently selected treatment and select another one','You can associate only one treatment to this MOP. Please drop the currently selected treatment and select another one','Vous pouvez associer un seul traitement à cette méthode de paiement. Veuillez laisser le traitement actuellement sélectionné et en choisir un autre.','Puede asociar un solo tratamiento con el método de pago. Favor de dejar el tratamiento ya seleccionado y escoger otro.'),
  ('Yearly','Yearly','Annuel -','Anual -'),
  ('Year','Year','Année','Año'),
  ('Wrong number','Wrong number','Mauvais numéro','Número incorrecto'),
  ('Wrap-up time','Wrap-up time','Temps en post-appel','Tiempo en post llamada'),
  ('Wrap-up count','Wrap-up count','Compte des traitements post-appel','Conteo de procesamientos post llamada'),
  ('Wrap-up calls','Wrap-up calls','Traitements post-appel','Procesamientos post llamada'),
  ('Wrap-up average','Wrap-up average','Moyenne de traitement post-appel','Media de procesamiento post llamada'),
  ('Workshop','Workshop','Atelier','Taller de trabajo'),
  ('Work schedule','Work schedule','Horaire de travail','Horario de trabajo'),
  ('Work manual setting','Work manual setting','Réglage manuel Travail','Ajuste manual Trabajo'),
  ('where IP','where IP','où IP','donde IP'),
  ('Weight','Weight','Pondération','Ponderación'),
  ('Week selector','Week selector','Sélecteur de semaine','Seleccionador de semana'),
  ('Warning:\nYou are about to delete this routing script.\nDo you want to continue?','Warning:\nYou are about to delete this routing script.\nDo you want to continue?','Avertissement:\nVous êtes sur le point de supprimer ce script d\'acheminement.\nVoulez-vous poursuivre?','Aviso:\nEstá a punto de suprimir éste script de encaminamiento.\n¿Desea proseguir?'),
  ('Warning:\nYou are about to delete the','Warning:\nYou are about to delete the','Avertissement:\nVous êtes sur le point de supprimer le','Aviso:\nEstá a punto de suprimir el'),
  ('Warning: URL host:','Warning: URL host:','Avertissement: URL hôte:','Aviso: URL de anfitrión:'),
  ('WARNING','WARNING','AVERTISSEMENT','AVISO'),
  ('Waiting time','Waiting time','Temps d\'attente','Tiempo de espera'),
  ('Waiting count','Waiting count','Compte des appels en attente','Conteo de llamadas en espera'),
  ('Waiting average','Waiting average','Temps d\'attente moyen','Tiempo de espera medio'),
  ('Wait','Wait','Attente','Espera'),
  ('View schedule parameters','View schedule parameters','Afficher les paramètres de l\'horaire','Visualizar los parámetros del horario'),
  ('View schedule','View schedule','Afficher l\'horaire','Visualizar el horario'),
  ('view','view','afficher','visualizar'),
  ('Value of path is: null','Value of path is: null','\\nValeur du chemin d\'accès est: nulle','\\nValor de la vía de acceso es: nulo'),
  ('Value of path is not null','Value of path is not null','\\nLa valeur du chemin d\'accès n\'est pas nulle','\\nValor de la vía de acceso no es nulo'),
  ('Validating diagram','Validating diagram','En cours de validation du diagramme','Validando el gráfico'),
  ('Use','Use','Utiliser','Usar'),
  ('Undo Publish','Undo Publish','Défaire Publier','Deshacer Publicar');


INSERT INTO `cfg_language` (`KEY_WORD`, `ENGLISH`, `FRENCH`, `ESPAGNOL`) VALUES 
  ('Unanswered calls','Unanswered calls','Appels sans réponse','Llamadas sin respuesta'),
  ('Unanswered call report','Unanswered call report','Rapport sur les appels sans réponse','Informe sobre las llamadas sin respuesta'),
  ('Unanswered call detailled report','Unanswered call detailled report','Rapport détaillé sur les appels sans réponse','Informe detallado sobre las llamadas sin respuesta'),
  ('Unanswered','Unanswered','Sans réponse','No contestadas'),
  ('Unable to delete non-empty site.\nThis site contains recording server','Unable to delete non-empty site.\nThis site contains recording server','Incapable de supprimer un site non-vide.\nLe site contient un serveur d\'enregistrement','No se puede suprimir un sitio que no esté vacío.\nEste sitio contiene un servidor de grabación'),
  ('Unable to delete non-empty site.\nThis site contains encryption server','Unable to delete non-empty site.\nThis site contains encryption server','Incapable de supprimer un site non-vide.\nLe site contient un serveur de chiffrement','No se puede suprimir un sitio que no esté vacío.\nEste sitio contiene un servidor de cifrado'),
  ('Unable to delete non-empty site.\nThis site contains Asterisk PBX','Unable to delete non-empty site.\nThis site contains Asterisk PBX','Incapable de supprimer un site non-vide.\nLe site contient le PBX de Asterisk','No se puede suprimir un sitio que no esté vacío.\nEste sitio contiene el PBX de Asterisk'),
  ('Two-step transfer time','Two-step transfer time','Temps de transfert en deux étapes','Tiempo de transfer. en dos etapas'),
  ('Two-step transfer count','Two-step transfer count','Compte des transferts en deux étapes','Conteo de transferencias en dos etapas'),
  ('Two-step transfer calls','Two-step transfer calls','Transfert d\'appels en deux étapes','Transferencia de llamadas en dos etapas'),
  ('Two-step transfer','Two-step transfer','Transfert à deux étapes','Transferencia en dos etapas'),
  ('Transfer time','Transfer time','Temps de transfert','Tiempo de transferencia'),
  ('Transfer count','Transfer count','Compte des transferts','Conteo de transferencias'),
  ('Transfer calls','Transfer calls','Appels transférés','Llamadas transferidas'),
  ('Transfer average','Transfer average','Moyenne de transfert','Media de transferencia'),
  ('Training type','Training type','Type de formation','Tipo de formación'),
  ('Training hours','Training hours','Heures de formation','Horas de formación'),
  ('Training','Training','Formation','Formación'),
  ('Trade','Trade','Échange','Cambio'),
  ('Total/day','Total/day','Total/jour','Total/día'),
  ('Total records','Total records','Total des enregistrements','Total de registros'),
  ('Total hours','Total hours','Total heures','Total horas'),
  ('Total calls transferred','Total calls transferred','Total des transferts d\'appels','Total de transfer. de llamadas'),
  ('Tolerance','Tolerance','Tolérance','Tolerancia'),
  ('This tolerance is numeric. Please change','This tolerance is numeric. Please change','La valeur de tolérance est numérique. Veuillez la changer','El valor de esta tolerancia es numérico. Favor de cambiarlo'),
  ('This QUEUE is already assigned. You must enter a NEW QUEUE','This QUEUE is already assigned. You must enter a NEW QUEUE','Cette FILE a déjà été assignée. Vous devez saisir une NOUVELLE FILE','Ésta COLA ya ha sido asignada. Debe introducir una COLA NUEVA'),
  ('This duration is numeric. please change it','This duration is numeric. please change it','La durée est numérique. Veuillez la changer','La duración es numérica. Favor de cambiarla'),
  ('There is no skill available','There is no skill available','Il n\'y a pas de compétence disponible','No hay habilidad disponible'),
  ('The numbers to put in a Do-not-call list must be made of digits.','The numbers to put in a Do-not-call list must be made of digits.','Les numéros qui figurent dans une liste Ne-pas-appeler doivent être composés de chiffres.','Los números en una lista de números No-llamar deben estar compuestos de cifras.'),
  ('The maximum wrap-up time that does not affect productivity must be in seconds','The maximum wrap-up time that does not affect productivity must be in seconds','Le temps maximum post-appel qui ne produise pas d\'effet sur la productivité doit être en secondes','El tiempo máximo en post-llamada que no afecte a la productividad debe indicarse en segundos'),
  ('The maximum wrap-up time must be less than 99999 seconds','The maximum wrap-up time must be less than 99999 seconds','Le temps maximum post-appel doit être inférieur à 99999 secondes','El tiempo máximo en post-llamada debe ser inferior a 99999 segundos'),
  ('The maximum wrap-up time must be in seconds','The maximum wrap-up time must be in seconds','Le temps maximum post-appel doit être exprimé en secondes','El tiempo máximo en post-llamada debe indicarse en segundos'),
  ('The maximum wrap-up time must be at least 1 second','The maximum wrap-up time must be at least 1 second','Le temps maximum post-appel doit être d\'au moins 1 seconde','El tiempo máximo en post-llamada debe ser por lo menos 1 segundo'),
  ('The file path is null! Please check data in your database','The file path is null! Please check data in your database','Le chemin d\'accès au fichier est nul. Veuillez vérifier les données dans votre base de données.','La vía de acceso al fichero es nula. Favor de comprobar los datos en la base de datos.'),
  ('The current script has been modified.\nDo you want to save it?','The current script has been modified.\nDo you want to save it?','Le script actuel a été modifié.\nVoulez-vous l\'enregistrer?','El script actual ha sido modificado.\n¿Desea registrarlo?'),
  ('The caller ID cannot be more than 100 characters','The caller ID cannot be more than 100 characters','L\'identification de l\'appelant ne peut pas comporter plus de 100 caractères','El ID del llamante no puede tener más de 100 caracteres'),
  ('Telephony data','Telephony data','Données de téléphonie','Datos de telefonía'),
  ('Team schedule','Team schedule','Horaire de l\'équipe','Horario del equipo'),
  ('Talk time','Talk time','Temps en ligne','Tiempo de habla'),
  ('Table columns','Table columns','Colonnes de table','Columnas de tabla'),
  ('Summary report','Summary report','Rapport sommaire','Informe sumario'),
  ('Success','Success','Réussites','Éxitos'),
  ('Sub total','Sub total','Sous-total','Subtotal'),
  ('Starting date must be prior to ending date','Starting date must be prior to ending date','La date de début doit être antérieure à la date de fin','La fecha de comienzo debe ser anterior a la fecha de fin'),
  ('Start time','Start time','Heure de début','Hora de comienzo'),
  ('split shift','split shift','quart brisé','jornada partida'),
  ('Specify the server name','Specify the server name','Indiquer le nom du serveur','Especificar el nombre del servidor'),
  ('Specify the server internal port for secure communications','Specify the server internal port for secure communications','Indiquer le port interne du serveur pour les communications sécurisées','Especificar el puerto interno del servidor para comunicaciones seguras'),
  ('Specify the server internal port','Specify the server internal port','Indiquer le port interne du serveur','Especifical el puerto interno del servidor'),
  ('Specify the server internal host','Specify the server internal host','Indiquer le serveur hôte interne','Especificar el servidor de anfitrión interno'),
  ('Specify the server external port for secure communications','Specify the server external port for secure communications','Indiquer le port externe du serveur pour les communications sécurisées','Especificar el puerto externo de servidor para comunicaciones seguras'),
  ('Specify the server external port','Specify the server external port','Indiquer le port externe du serveur','Especificar el puerto externo del servidor'),
  ('Specify the server external host','Specify the server external host','Indiquer le serveur hôte externe','Especificar el servidor de anfitrión externo'),
  ('Specify the load balance for agents','Specify the load balance for agents','Indiquer la valeur d\'équilibre de charge pour les agents','Especificar el valor de equilibrio de carga para los agentes'),
  ('Specify the file extension','Specify the file extension','Indiquer l\'extension du fichier','Especificar la extensión del fichero'),
  ('Specify the encryption server name','Specify the encryption server name','Indiquer le nom du serveur de chiffrement','Especificar el nombre del servidor de cifrado'),
  ('Specify the directory for sales recordings','Specify the directory for sales recordings','Indiquer le répertoire d\'enregistrement des ventes','Especificar el directorio de grabación de las ventas'),
  ('Specify the directory for no sales recordings','Specify the directory for no sales recordings','Indiquer le répertoire d\'enregistrement des pas-de-ventes','Especificar el directorio de grabación de las sin-ventas'),
  ('Specify the CSV file delimiters and quotes','Specify the CSV file delimiters and quotes','Indiquer les délimiteurs et type de guillemets du fichier CSV (coma-separated values)','Especificar los delimitadores y tipo de comillas de fichero CSV (coma-separated values)'),
  ('Specify the calling list file','Specify the calling list file','Indiquer le fichier de la liste d\'appel','Especificar el fichero de la lista de llamada'),
  ('Specify switch password','Specify switch password','Indiquer le mot de passe du commutateur','Especificar la contraseña del conmutador'),
  ('Specify switch name','Specify switch name','Indiquer le nom du commutateur','Especificar el nombre del conmutador'),
  ('Specify switch internal host name or IP address','Specify switch internal host name or IP address','Indiquer le nom d\'hôte interne ou l\'adresse IP du commutateur','Especificar la dirección IP o el nombre de anfitrión internos del conmutador'),
  ('Specify switch external host name or IP adresss','Specify switch external host name or IP adresss','Indiquer le nom d\'hôte ou l\'adresse IP externes du commutateur','Especificar la dirección IP o el nombre de anfitrión externos del conmutador'),
  ('Specify server password','Specify server password','Indiquer le mot de passe du serveur','Especificar la contraseña del servidor'),
  ('Specify encryption server URL','Specify encryption server URL','Indiquer l\'URL du serveur de chiffrement','Especificar el URL del servidor de cifrado'),
  ('Specify encryption server protocol','Specify encryption server protocol','Indiquer le protocole du serveur de chiffrement','Especificar el protocolo del servidor de cifrado'),
  ('Specify encryption server internal port','Specify encryption server internal port','Indiquer le port interne du serveur de chiffrement','Especificar el puerto interno del servidor de cifrado'),
  ('Specify encryption server internal host','Specify encryption server internal host','Indiquer le nom d\'hôte du serveur interne de chiffrement','Especificar el servidor de anfitrión interno de cifrado'),
  ('Specify encryption server external port','Specify encryption server external port','Indiquer le port externe du serveur de chiffrement','Especificar el puerto externo del servidor de cifrado'),
  ('Specify encryption server external host','Specify encryption server external host','Indiquer le serveur hôte externe de chiffrement','Especificar el servidor de anfitrión externo de cifrado'),
  ('Space column','Space column','Espacer colonnes','Espaciar las columnas'),
  ('site.\nDo you want to continue?','site.\nDo you want to continue?','site.\nVoulez-vous poursuivre?','sitio.\n¿Desea proseguir?'),
  ('Single transfer time','Single transfer time','Temps de transfert en une étape','Tiempo de transfer. monoetapa'),
  ('Single transfer count','Single transfer count','Compte des transferts en une étape','Conteo de transferencias monoetapa'),
  ('Single transfer calls','Single transfer calls','Transfert d\'appels en une étape','Transferencia monoetapa de llamadas'),
  ('Single transfer','Single transfer','Transfert en une étape','Transferencia monoetapa'),
  ('Show grid','Show grid','Afficher quadrillage','Mostrar cuadrícula'),
  ('Shifts','Shifts','Quarts','Turnos'),
  ('Shift trade management for group','Shift trade management for group','Gestion des échanges de quart pour le groupe','Gestión de los cambios de turno para el grupo'),
  ('Shift trade','Shift trade','Échange de quart','Cambio de turno'),
  ('shift assigned for this day','shift assigned for this day','quart assigné pour cette journée','turno asignado para este día'),
  ('Shift','Shift','Quart','Turno'),
  ('Set skills','Set skills','Établir compétences','Establecer habilidades'),
  ('Set schedule','Set schedule','Établir horaire','Establecer horario'),
  ('Set quit','Set quit','Établir démission','Establecer dimisión'),
  ('Set absent','Set absent','Indiquer absent','Establecer ausente'),
  ('Scheduled time','Scheduled time','Temps prévu','Tiempo previsto'),
  ('Scheduled','Scheduled','Prévu','Previsto'),
  ('Saving','Saving','En cours d\'enregistrement','Registrando'),
  ('save Video','save Video','enregistrer Vidéo','guardar Video'),
  ('Save successful','Save successful','Enregistrement réussi','Se guardo correctamente'),
  ('Save list settings for loading (optional)','Save list settings for loading (optional)','Enregistrer les paramètres de chargement de la liste (facultatif)','Guardar los parámetros de carga de la lista (facultativo)'),
  ('save Audio','save Audio','enregistrer Audio','guardar Audio'),
  ('Save & Close','Save & Close','Enregistrer & Fermer','Guardar & Cerrar'),
  ('Sales/h','Sales/h','Ventes/h','Ventas/h'),
  ('Sales per hour','Sales per hour','Ventes par heure','Ventas por hora'),
  ('Sale info','Sale info','Données sur les ventes','Información sobre ventas'),
  ('Sale','Sale','Vente','Venta'),
  ('Right-click to download','Right-click to download','Cliquez avec le bouton droit pour télécharger','Pinche con el botón derecho para descargar'),
  ('Resource directory is:','Resource directory is:','Le répertoire des ressources est:','Directorio de recurso es:'),
  ('Report starting date must be Sunday!','Report starting date must be Sunday!','La journée de début du rapport doit être dimanche.','El día de comienzo del informe debe ser domingo.'),
  ('Report ending date must be Saturday!','Report ending date must be Saturday!','La journée de fin du rapport doit être samedi.','La fecha de fin del informe debe ser sábado.'),
  ('Refused','Refused','Refusé','Rechazado'),
  ('Refusals/h','Refusals/h','Rejets/h','Rechazos/h'),
  ('Refer path','Refer path','Chemin d\'accès de référence','Vía de acceso de referencia'),
  ('Received a total of [','Received a total of [','A reçu un total de [','Se ha recibido un total de ['),
  ('Reason','Reason','Raison','Motivo'),
  ('Real hours (without breaks)','Real hours (without breaks)','Heures réelles (sans pauses)','Horas reales (sin descansos)'),
  ('Queue configuration','Queue configuration','Configuration des files d\'attente','Configuración de las colas'),
  ('Publish','Publish','Publier','Publicar'),
  ('Protocol','Protocol','\\nProtocole','\\nProtocolo'),
  ('Productivity','Productivity','Productivité','Productividad'),
  ('Production time exception report','Production time exception report','Relevé des exceptions aux temps de production','Informe de excepción a los tiempos de producción'),
  ('Production time','Production time','Temps en production','Tiempo en producción'),
  ('Production hours','Production hours','Heures de production','Horas de producción'),
  ('Production','Production','Production','Producción'),
  ('Preview','Preview','Prévisualiser','Previsualizar'),
  ('Possible Call Conditions are:','Possible Call Conditions are:','Les conditions d\'appel possibles sont:','Las condiciones de llamada posibles son:'),
  ('Port','Port','Port','Puerto'),
  ('Please wait while the new recording server is being modified','Please wait while the new recording server is being modified','Veuillez attendre que la modification du nouveau serveur d\'enregistrement soit terminée','Favor de esperar que se termine la modificación del nuevo servidor de grabación'),
  ('Please wait while deleting switch','Please wait while deleting switch','Veuillez attendre que la suppression du commutateur soit terminée','Favor de esperar que se termine la supresión del conmutador'),
  ('Please wait for switch modification','Please wait for switch modification','Veuillez attendre que la modification du commutateur soit terminée','Favor de esperar que se termine la modificación del conmutador'),
  ('Please wait for switch creation','Please wait for switch creation','Veuillez attendre que la création du commutateur soit terminée','Favor de esperar que se termine la creación del conmutador'),
  ('Please Unload/Stop the campaign before deleting it','Please Unload/Stop the campaign before deleting it','Veuillez Décharger/Arrêter la campagne avant de la supprimer','Favor de Descargar/Parar la campaña antes de suprimirla'),
  ('Please fill all tolerance fields','Please fill all tolerance fields','Veuillez remplir tous les champs de tolérance','Favor de rellenar todos los campos de tolerancia'),
  ('Please fill all duration fields','Please fill all duration fields','Veuillez remplir tous les champs de durée','Favor de rellenar todos los campos de duración'),
  ('Please enter your password','Please enter your password','Veuillez entrer votre mot de passe','Por favor, entre su contraseña'),
  ('Period','Period','Période','Periodo'),
  ('Percentages for queue','Percentages for queue','Pourcentages relatifs à la file','Porcentajes acerca de la cola'),
  ('Percentages compared to Not-ready time','Percentages compared to Not-ready time','Pourcentages en comparaison avec le temps Pas-prêt','Porcentajes en comparación con el tiempo No-listo'),
  ('Percentages compared to login time','Percentages compared to login time','Pourcentages en comparaison avec le temps de connexion','Porcentajes en comparación con el tiempo en sesión'),
  ('Percentages','Percentages','Pourcentages','Porcentajes'),
  ('Percentage over','Percentage over','Pourcentage supérieur à','Porcentaje sobrepasa'),
  ('Per record type','Per record type','Par type d\'enregistrement','Por tipo de registro'),
  ('Per record status','Per record status','Par état d\'enregistrement','Por estado de registro'),
  ('Per call result','Per call result','Par résultat d\'appel','Por resultado de llamada'),
  ('Payroll data','Payroll data','Données salariales','Datos salariales'),
  ('Pay','Pay','Payer','Pagar'),
  ('part-time shift','part-time shift','quart à temps partiel','jornada a tiempo parcial'),
  ('parent','parent','parent','padre'),
  ('Paid time formula','Paid time formula','Formule pour temps rémunéré','Fórmula para tiempo pagado'),
  ('Outbound time','Outbound time','Temps appels sortants','Tiempo llamadas salientes'),
  ('Outbound count','Outbound count','Compte des appels sortants','Conteo de llamadas salientes'),
  ('Outbound calls','Outbound calls','Appels sortants','Llamadas salientes'),
  ('Outbound average','Outbound average','Moyenne des appels sortants','Media de llamadas salientes'),
  ('Outbound','Outbound','Sortant','Saliente'),
  ('Other training','Other training','Autre formation','Otra formación'),
  ('Other statistics','Other statistics','Autres statistiques','Otras estadísticas'),
  ('or more','or more','ou plus','o más'),
  ('on disk. Please verify that the recording is still on disk at the right place!','on disk. Please verify that the recording is still on disk at the right place!','sur disque. Veuillez vérifier que l\'enregistrement est toujours sur le disque et au bon endroit.','en el disco. Favor de comprobar que el grabado permanece en disco y en su lugar.'),
  ('Not-ready time','Not-ready time','Temps Pas-prêt','Tiempo No-listo'),
  ('Not-Ready count','Not-Ready count','Compte des Pas-prêts','Conteo de No-listos'),
  ('Not-ready calls','Not-ready calls','Appels Pas-prêt','Llamadas No-listo'),
  ('Not-ready average','Not-ready average','Moyenne en Pas-prêt','Media en No-listo'),
  ('Not reached','Not reached','Non joint','No se comunico'),
  ('Not listened','Not listened','Non écouté','Sin escuchar'),
  ('No table in your calling list','No table in your calling list','Votre liste d\'appel ne contient aucune table','Su lista de llamada no tiene tabla'),
  ('No sites were defined.\nPlease add site first','No sites were defined.\nPlease add site first','Aucun site n\'a été défini.\nVeuillez d\'abord ajouter un site','No se han definido sitios.\nFavor de añadir primero un sitio'),
  ('No site was associated with the new switch','No site was associated with the new switch','Aucun site n\'a été associé au nouveau commutateur','No se ha vinculado un sitio con el nuevo conmutador'),
  ('No site was associated with the new encryption server','No site was associated with the new encryption server','Aucun site n\'a été associé avec le nouveau serveur de chiffrement','No se ha vinculado un sitio con el nuevo servidor de cifrado'),
  ('No search path specified in ctiSocket.properties','No search path specified in ctiSocket.properties','Aucun chemin d\'accès de recherche n\'a été indiqué dans ctiSocket.properties','No se ha indicado la vía de acceso de búsqueda en ctiSocket.properties'),
  ('No search path is specified in file ctiSocket.properties. Please set at least one.','No search path is specified in file ctiSocket.properties. Please set at least one.','Le fichier ctiSocket.properties ne contient pas de chemin d\'accès de recherche. Veuillez en indiquer au moins un.','No se ha indicado la vía de acceso de búsqueda en el fichero ctiSocket.properties. Favor de establecer por lo menos una.'),
  ('No schedule data found in database.','No schedule data found in database.','L\'horaire n\'a pas été trouvé dans la base de données.','No se ha encontrado el horario en la base de datos.'),
  ('No sale','No sale','Pas de vente','Ninguna venta'),
  ('No query specifed.','No query specifed.','Aucune consultation d\'indiquée.','No se indicó ninguna consulta.'),
  ('No association with the phone number field','No association with the phone number field','Aucune association ne s\'est produite avec le champ du numéro de téléphone','No se ha producido asociación con el campo de número de teléfono'),
  ('No association has been made','No association has been made','Aucune association n\'a été faite','No se ha producido ninguna asociación'),
  ('Next logout','Next logout','Fermeture de session suivante','Próxima desconexión'),
  ('next day off','next day off','prochain jour de relâche','día libre siguiente'),
  ('name.\nDo you want to continue?','name.\nDo you want to continue?','inconnu.\nVoulez-vous poursuivre?','desconocido.\n¿Desea proseguir?'),
  ('name fields: First name and Last name required','name fields: First name and Last name required','champs de nom: Le nom et le nom de famille sont nécessaires','campos de nombre: Se necesita el nombre y el apellido'),
  ('name','name','nom','nombre'),
  ('More than one starting box were found.','More than one starting box were found.','Plus d\'une boîte de début a été trouvée.','Se ha encontrado más de un recuadro de inicio.'),
  ('Month','Month','Mois','Mes'),
  ('Monitoring','Monitoring','Supervision','Supervisión'),
  ('Minimum recording time must be smaller than maximum recording time','Minimum recording time must be smaller than maximum recording time','Le temps minimum d\'enregistrement doit être inférieur au temps maximum d\'enregistrement','El tiempo mínimo de grabación debe ser inferior al tiempo máximo de grabación'),
  ('MESSAGE','MESSAGE','MESSAGE','MENSAJE'),
  ('Manual schedule','Manual schedule','Horaire manuel','Horario manual'),
  ('Mail to','Mail to','Envoyer à','Enviar a'),
  ('Looking up the filename on audio server in directory [','Looking up the filename on audio server in directory [','Recherche du nom de fichier sur le serveur audio dans le répertoire  [','Búsqueda de nombre de fichero en servidor de audio en el directorio ['),
  ('Login details','Login details','Données sur la connexion','Datos sobre la conexión'),
  ('Login count','Login count','Compte des ouvertures de session','Conteo de conexiones'),
  ('Login and Password required','Login and Password required','ID de connexion et mot de passe nécessaires','Código de conexión y contraseña necesarios'),
  ('Login - Lunch - Restroom','Login - Lunch - Restroom','Connexion - Repas - Toilettes','Conexión - Almuerzo - Aseos'),
  ('Listened','Listened','Écouté','Escuchado'),
  ('Listen live','Listen live','Écoute en temps réel','Escucha en vivo'),
  ('Last logout','Last logout','Dernière fermeture de session','Última desconexión'),
  ('Last day integration','Last day integration','Dernier jour d\'intégration','Último día de integración'),
  ('Last 2 directories of file path are:','Last 2 directories of file path are:','Les 2 derniers répertoires du chemin d\'accès au fichier sont:','Últimos 2 directorios de vía de acceso al fichero son:'),
  ('Invalid switch internal port','Invalid switch internal port','Port interne du commutateur invalide','Puerto interno del conmutador inválido'),
  ('Invalid servlet URL! Please check encryption server settings','Invalid servlet URL! Please check encryption server settings','Adresse URL de servlet invalide. Veuillez vérifier les paramètres du serveur de chiffrement','URL del servlet inválido. Favor de comprobar la configuración del servidor de cifrado.'),
  ('Invalid login. Already given to another agent','Invalid login. Already given to another agent','ID de connexion invalide. Il a déjà été attribué à un autre agent','Código de conexión inválido. Ya se le proporciono a otro agente'),
  ('Invalid load balance for outbound','Invalid load balance for outbound','Valeur d\'équilibre de charge invalide pour les appels sortants','Valor de equilibrio de carga para las llamadas salientes inválido'),
  ('Invalid load balance for agents','Invalid load balance for agents','Valeur d\'équilibre de charge invalide pour les agents','Valor de equilibrio de carga inválido para los agentes'),
  ('Invalid encryption server host IP or port! Please check encryption server settings','Invalid encryption server host IP or port! Please check encryption server settings','Adresse IP ou port du serveur hôte de chiffrement est invalide. Veuillez vérifier les paramètres du serveur de chiffrement','Dirección IP o puerto del servidor de anfitrión de cifrado inválido. Favor de comprobar la configuración del servidor de cifrado'),
  ('Integration hours','Integration hours','Heures d\'intégration','Horas de integración'),
  ('Integration','Integration','Intégration','Integración'),
  ('Information','Information','Information','Información'),
  ('Info','Info','Données','Datos'),
  ('Inbound time','Inbound time','Temps appels entrants','Tiempo llamadas entrantes'),
  ('Inbound count','Inbound count','Compte des appels reçus','Conteo de llamadas entrantes'),
  ('Inbound calls','Inbound calls','Appels entrants','Llamadas entrantes'),
  ('Inbound average','Inbound average','Moyenne des appels entrants','Media de llamadas entrantes'),
  ('Inbound','Inbound','Entrant','Entrante'),
  ('In integration','In integration','En intégration','En integración'),
  ('if a directory has been mounted for recordings.','if a directory has been mounted for recordings.','si un répertoire a été monté pour les enregistrements.','si se ha montado un directorio de grabación.'),
  ('Idle time','Idle time','Temps d\'inactivité','Tiempo inactivo'),
  ('Host','Host','Hôte','Anfitrión'),
  ('Hold time','Hold time','Temps en garde','Tiempo en retención'),
  ('Hold count','Hold count','Compte des appels en garde','Conteo de llamadas en retención'),
  ('Hold calls','Hold calls','Appels en garde','Llamadas en retención'),
  ('Hold average','Hold average','Moyenne de mise en garde','Media de retención'),
  ('Hold','Hold','Garde','Retención'),
  ('Hide grid','Hide grid','Masquer quadrillage','Ocultar cuadrícula'),
  ('Handling time','Handling time','Temps de traitement','Tiempo de procesam.'),
  ('Handling','Handling','Traitement','Procesamiento'),
  ('grouped by team leader','grouped by team leader','groupés par chef d\'équipe','agrupados por jefe de equipo'),
  ('General statistics','General statistics','Statistiques générales','Estadísticas generales'),
  ('General data','General data','Données générales','Datos generales'),
  ('GAP','GAP','Écart','Intervalo'),
  ('for','for','pour','sobre'),
  ('Finished writing data from encryption server','Finished writing data from encryption server','L\'écriture des données du serveur de chiffrement est terminée','Se ha terminado la escritura de datos del servidor de cifrado'),
  ('find','find','recherche','búsqueda'),
  ('file to search [','file to search [','fichier à chercher [','fichero para buscar ['),
  ('File to decrypt','File to decrypt','Fichier à déchiffrer','Fichero para descifrar'),
  ('File NOT FOUND','File NOT FOUND','Fichier NON TROUVÉ','Fichero NO ENCONTRADO'),
  ('File found','File found','Fichier trouvé','Fichero encontrado'),
  ('Extract payroll data','Extract payroll data','Extraire les données salariales','Extraer datos salariales'),
  ('Export to','Export to','Exporter à','Exportar a'),
  ('Events','Events','Événements','Acontecimientos'),
  ('Errors during save','Errors during save','Des erreurs se sont produites lors de l\'enregistrement','Se han producido errores al guardar los datos'),
  ('Error: Unknow switch','Error: Unknow switch','Erreur: Nom de commutateur','Error: Nombre de conmutador'),
  ('Error: Unable to delete site','Error: Unable to delete site','Erreur: Incapable de supprimer le site','Error: No se puede suprimir el sitio'),
  ('Error: Switch','Error: Switch','Erreur: Commutateur','Error: El conmutador'),
  ('Error: Specify site name','Error: Specify site name','Erreur: Indiquer le nom du site','Error: Especificar el nombre del sitio'),
  ('Error: Specify script name','Error: Specify script name','Erreur: Indiquer le nom du script','Error: Especificar el nombre del script'),
  ('Error: Site already exists. Specify new name','Error: Site already exists. Specify new name','Erreur: Le site existe déjà. Saisir un autre nom','Error: El sitio ya existe. Indique otro nombre'),
  ('Error: No starting box found in this script. Please add a call condition','Error: No starting box found in this script. Please add a call condition','Erreur: Aucune boîte de début n\'a été trouvée pour ce script. Veuillez ajouter une condition d\'appel','Error: No se ha encontrado un recuadro de inicio en el script. Favor de añadir una condición de llamada'),
  ('Error: No starting box found in this script','Error: No starting box found in this script','Erreur: Aucune boîte de début n\'a été trouvée pour ce script','Error: No se ha encontrado un recuadro de inicio en el script'),
  ('Error: No specification about the switch name','Error: No specification about the switch name','Erreur: Le nom du commutateur n\'a pas été indiqué','Error: No se ha especificado el nombre del conmutador'),
  ('Error: Missing the extra data for screenpop. Try selecting the \\\'None\\\' option','Error: Missing the extra data for screenpop. Try selecting the \\\'None\\\' option','Erreur: Il manque les données supplémentaires pour la remontée de fiche. Essayez de sélectionner l\'option \\\'Aucun\\\'','Error: Faltan los datos adicionales para la ventana emergente. Ensaye de seleccionar la opción \\\'Ninguno\\\''),
  ('Error: Missing the extra data','Error: Missing the extra data','Erreur: Il manque les données supplémentaires','Error: Faltan los datos adicionales'),
  ('Error: Missing non numeric phone number action','Error: Missing non numeric phone number action','Erreur: Il manque l\'action par numéro de téléphone non numérique','Error: Falta la acción por número de teléfono no numérico'),
  ('Error: Missing extra data \\\"apply to\\\"','Error: Missing extra data \\\"apply to\\\"','Erreur: Il manque les données supplémentaires \\\"appliquer à\\\"','Error: Faltan datos adicionales \\\"aplicar a\\\"'),
  ('Error: Missing dialing hours \\\"apply to\\\"','Error: Missing dialing hours \\\"apply to\\\"','Erreur: Il manque les heures de composition \\\"appliquer à\\\"','Error: Faltan las horas de marcación \\\"aplicar a\\\"'),
  ('Error while saving schedule data. Try again!','Error while saving schedule data. Try again!','Erreur lors de la sauvegarde des données sur l\'horaire. Veuillez essayer à nouveau.','Se ha producido un error al guardar los datos sobre el horario. Favor de intentar de nuevo.'),
  ('Error while saving recording schedule data. Please try again!','Error while saving recording schedule data. Please try again!','Erreur lors de la sauvegarde des données du programme d\'enregistrement. Veuillez essayer à nouveau.','Se ha producido un error al guardar los datos del programa de grabación. Favor de intentar de nuevo.'),
  ('Error while getting data. Please check the database','Error while getting data. Please check the database','Une erreur s\'est produite lors de l\'obtention des données. Veuillez vérifier la base de données','Se ha producido un error al obtener los datos. Favor de verificar la base de datos.'),
  ('Error while generating Agent performance report...','Error while generating Agent performance report...','Erreur lors de la production du Rapport sur le rendement de l\'agent...','Se ha producido un error al generar el Informe sobre el rendimiento del agente...'),
  ('Error while generating Agent performance report','Error while generating Agent performance report','Une erreur s\'est produite lors de la production du Rapport sur le rendement des agents','Se ha producido un error al generar el Informe sobre el rendimiento de los agentes'),
  ('Error while generating Agent login report','Error while generating Agent login report','Erreur lors de la production du Rapport sur les connexions de l\'agent','Se ha producido un error al generar el Informe sobre las conexiones del agente'),
  ('Error occurred! Please check tomcat log file for details','Error occurred! Please check tomcat log file for details','Une erreur s\'est produite. Veuillez vérifier les données du journal tomcat','Se ha producido un error. Para detalles sobre el error favor de verificar el archivo de anotaciones de tomcat'),
  ('Error in query. Please check the database','Error in query. Please check the database','Une erreur s\'est produite lors de la recherche. Veuillez vérifier la base de données','Se ha producido un error en la consulta. Favor de verificar la base de datos.'),
  ('End time','End time','Heure de fin','Hora de fin'),
  ('End','End','Terminer','Terminar'),
  ('Encryption URL','Encryption URL','URL de chiffrement','URL de cifrado'),
  ('encrypted','encrypted','chiffré','cifrado'),
  ('Duration','Duration','Durée','Duración'),
  ('Do you want to reload information?','Do you want to reload information?','Voulez-vous charger les données à nouveau?','¿Quiere volver a cargar los datos?'),
  ('Do not call','Do not call','Ne pas appeler','No llamar'),
  ('Diagram','Diagram','Diagramme','Gráfico'),
  ('Details','Details','Données','Datos'),
  ('Delete it first','Delete it first','Supprimez d\'abord l\'autocommutateur','Suprima primero el autoconmutador'),
  ('Delete all','Delete all','Supprimer tout','Suprimir todo'),
  ('Days not in Integration','Days not in Integration','Jours sans intégration','Días sin integración'),
  ('Day off','Day off','Relâche','Día libre'),
  ('Date and Time','Date and Time','Date et Heure','Fecha y Hora'),
  ('Data has been published: the modification feature is disabled. Contact your supervisor if you need to unlock it','Data has been published: the modification feature is disabled. Contact your supervisor if you need to unlock it','Les données ont été publiées: la fonction de modification est désactivée. Veuillez communiquer avec votre superviseur pour y avoir accès','Los datos han sido publicados: la función de modificación está desactivada. Favor de comunicarse con su supervisor si necesita acceso'),
  ('Data has been changed in','Data has been changed in','Les données ont été changées dans','Los datos han sido modificados en'),
  ('Data count','Data count','Compte des données','Cuenta de datos'),
  ('Data','Data','Les données','Los datos'),
  ('Creating chart - please wait','Creating chart - please wait','En cours de production du diagramme - veuillez patienter','Produciendo el diagrama - favor de esperar'),
  ('Counters','Counters','Compteurs','Contadores'),
  ('Count','Count','Compte','Conteo'),
  ('Couldn\'t get connection from','Couldn\'t get connection from','La connexion n\'a pas été établie avec','No se ha logrado la conexión con'),
  ('Could not find the record','Could not find the record','L\'enregistrement n\'a pas été trouvé','No se encontró el registro'),
  ('Continuing training hours','Continuing training hours','Heures de formation continue','Horas de formación contínua'),
  ('Contacts/h','Contacts/h','Contacts/h','Contactos/h'),
  ('Connection successfull to','Connection successfull to','Connexion établie avec','Se ejecutó la conexión con'),
  ('Commission based on group average','Commission based on group average','Commission basée sur la moyenne du groupe','Comisión basada en la media del grupo'),
  ('Choose day','Choose day','Sélectionnez la journée','Seleccione el día'),
  ('Check also that the mount service is working properly','Check also that the mount service is working properly','Vérifier également que le service de montage fonctionne correctement','Verificar también que el servicio de montaje funciona correctamente'),
  ('Change status','Change status','Changer état','Cambiar estado'),
  ('Cell selection','Cell selection','Sélection de la cellule','Selección de la célula'),
  ('canonical','canonical','canonique','canónica'),
  ('Campaign already exists','Campaign already exists','La campagne existe déjà','La campaña ya existe'),
  ('Calls/h','Calls/h','Appels/h','Llamadas/h'),
  ('calls transferred inbound','calls transferred inbound','Transferts internes d\'appels','Transferencias internas de llamadas'),
  ('calls outbound/inbound','calls outbound/inbound','appels sortants/entrants','llamadas salientes/entrantes'),
  ('Calls out/in','Calls out/in','Appels faits/reçus','Llamadas hechas/recibidas'),
  ('Calling list name cannot start with a letter','Calling list name cannot start with a letter','Le nom de la liste d\'appel ne peut commencer par une lettre','El nombre de la lista de llamada no puede empezar con una letra'),
  ('CallerID should be like \\\"CallerName\\\" <(514) 222-2222>','CallerID should be like \\\"CallerName\\\" <(514) 222-2222>','L\'identification de l\'appelant devrait ressembler à \\\"CallerName\\\" <(514) 222-2222>','ID del llamante debe semejarse a  \\\"CallerName\\\" <(514) 222-2222>'),
  ('Call history','Call history','Historique d\'appel','Historial de llamada'),
  ('Call date','Call date','Date de l\'appel','Fecha de la llamada'),
  ('Call back','Call back','Rappeler','Volver a llamar'),
  ('bytes now from encryption server; total bytes sent are','bytes now from encryption server; total bytes sent are','octets du serveur de chiffrement; nombre total d\'octets envoyés est','octetos del servidor de cifrado; número total de octetos enviados es'),
  ('bytes from encryption Server','bytes from encryption Server','octets du serveur de chiffrement','octetos del servidor de cifrado'),
  ('Break schedule','Break schedule','Périodes de pause','Periodos de descanso'),
  ('Break manual setting','Break manual setting','Réglage manuel Pause','Ajuste manual Descanso'),
  ('break','break','pause','descanso'),
  ('Billable time formula','Billable time formula','Formule pour temps facturé','Fórmula tiempo facturado'),
  ('Billable time','Billable time','Temps facturable','Tiempo de facturación'),
  ('Back','Back','Précédente','Anterior'),
  ('Average wrap-up time','Average wrap-up time','Temps moyen post-appel','Tiempo medio post llamada'),
  ('Average talk time transfer','Average talk time transfer','Temps moyen en ligne en transferts','Tiempo medio de habla en transfer.'),
  ('Average outbound talk time','Average outbound talk time','Temps moyen en ligne en émission d\'appel','Tiempo medio de habla en llamada saliente'),
  ('Average inbound talk time','Average inbound talk time','Temps moyen en ligne en réception d\'appel','Tiempo medio de habla en llamada entrante'),
  ('Average answering time','Average answering time','Temps moyen de réponse','Tiempo medio de respuesta'),
  ('Average','Average','Moyenne','Media'),
  ('Available shifts','Available shifts','Quarts disponibles','Turnos disponibles'),
  ('Available bytes','Available bytes','Octets disponibles','Octetos disponibles'),
  ('Assigned shifts','Assigned shifts','Quarts assignés','Turnos asignados'),
  ('Assign','Assign','Assigner','Asignar'),
  ('Are you sure, you wish to delete this agent?','Are you sure, you wish to delete this agent?','Êtes-vous certain de vouloir supprimer cet agent?','¿Está seguro de querer suprimir éste agente?'),
  ('Are you sure you wish to unload this campaign? You should only do this at the end of the day','Are you sure you wish to unload this campaign? You should only do this at the end of the day','Êtes-vous certain de vouloir décharger cette campagne? Vous devriez le faire uniquement à la fin de la journée','¿Está seguro de querer descargar esta campaña? Solo debería hacerlo al terminar el día'),
  ('Are you sure you wish to delete this group?','Are you sure you wish to delete this group?','Êtes-vous certain de vouloir supprimer ce groupe?','¿Está seguro de querer suprimir este grupo?'),
  ('Are you sure you wish to delete this campaign?','Are you sure you wish to delete this campaign?','Êtes-vous certain de vouloir supprimer cette campagne?','¿Está seguro de querer suprimir ésta campaña?'),
  ('Apply filter','Apply filter','Appliquer filtre','Aplicar filtro'),
  ('Answers per day','Answers per day','Réponses par jour','Contestas por día'),
  ('Answered service factor','Answered service factor','Facteur de service, avec réponse','Factor de servicio, contestadas'),
  ('Answered count','Answered count','Compte, avec réponse','Cuenta, contestadas'),
  ('Answered calls','Answered calls','Appels avec réponse','Llamadas con respuesta'),
  ('Answered call report','Answered call report','Rapport sur les appels avec réponse','Informe sobre las llamadas contestadas'),
  ('Answered call detailled report','Answered call detailled report','Rapport détaillé sur les appels avec réponse','Informe detallado sobre las llamadas con respuesta'),
  ('AHT out','AHT out','TMT sortant','TMP saliente'),
  ('AHT in','AHT in','TMT entrant','TMP entrante'),
  ('AheevaPhone crash','AheevaPhone crash','Panne du AheevaPhone','Fallo de AheevaPhone'),
  ('Agents with days not in integration between two integration days','Agents with days not in integration between two integration days','Agents non en intégration entre deux jours d\'intégration','Agentes no en integración entre dos días de integración'),
  ('Agents whose production time is higher than their login time by','Agents whose production time is higher than their login time by','Agents dont le temps en production est supérieur au temps en session par','Agentes cuyo tiempo en producción es superior a el tiempo en sesión de'),
  ('Agents which have login time but no production time','Agents which have login time but no production time','Agents avec temps en session mais pas en production','Agentes con tiempo en sesión pero no en producción'),
  ('Agent performance report for group','Agent performance report for group','Rapport sur le rendement de l\'agent dans le groupe','Informe sobre el rendimiento del agente en el grupo'),
  ('Agent performance report','Agent performance report','Raport sur le rendement des agents','Informe sobre el rendimiento de los agentes'),
  ('Agent performance','Agent performance','Rendement de l\'agent','Rendimiento del agente'),
  ('Agent must have at least one preferred site','Agent must have at least one preferred site','L\'agent doit avoir au moins un site privilégié','El agente debe tener por lo menos un sitio preferido'),
  ('Agent login','Agent login','Connexion de l\'agent','Conexión del agente'),
  ('Agent logged out','Agent logged out','Déconnecter agent','Desconectar agente'),
  ('agent has quit','agent has quit','agent a démissionné','agente ha dimitido de su empleo'),
  ('Agent group selection','Agent group selection','Sélection du groupe d\'agents','Selección del grupo de agentes'),
  ('Agent group performance report','Agent group performance report','Rapport sur le rendement du groupe d\'agents','Informe sobre el rendimiento del grupo de agentes'),
  ('Agent group logged out','Agent group logged out','Groupe d\'agents déconnecté','Grupo de agentes desconectado'),
  ('Agent group already exists','Agent group already exists','Le groupe d\'agents existe déjà','El grupo de agentes ya existe'),
  ('Agent adherence','Agent adherence','Adhésion à l\'horaire','Conformidad al horario'),
  ('agent absent this day','agent absent this day','agent est absent cette journée','agente ausente este día'),
  ('Add schedule for AheevaPhone','Add schedule for AheevaPhone','Ajouter horaire pour AheevaPhone','Añadir horario para AheevaPhone'),
  ('Add schedule for agent','Add schedule for agent','Ajouter horaire pour l\'agent','Añadir horario para el agente'),
  ('Add alert for AheevaPhone','Add alert for AheevaPhone','Ajouter alerte pour AheevaPhone','Añadir alerta para AheevaPhone'),
  ('Add a new tenant','Add a new tenant','Ajouter un nouveau client','Añadir un nuevo cliente'),
  ('Add a new row','Add a new row','Ajouter une autre rangée','Añadir otra línea'),
  ('Actual','Actual','Réel','Real'),
  ('Acknowledged','Acknowledged','Admis','Admitido'),
  ('Acknowledge','Acknowledge','Admettre','Admitir'),
  ('Accepted','Accepted','Accepté','Aceptado'),
  ('Absence management for group','Absence management for group','Gestion des absences pour le groupe','Gestión de las ausencias para el grupo'),
  ('Absence','Absence','Absence','Ausencia'),
  ('Abandon count','Abandon count','Compte, abandonnés','Cuenta, abandonadas'),
  ('A running campaign uses this group! You can\'t delete it','A running campaign uses this group! You can\'t delete it','Une campagne en cours d\'exécution utilise ce groupe! Vous ne pouvez pas le supprimer','¡Una campaña en ejecución usa este grupo! No puede suprimirlo'),
  ('A recording server','A recording server','Serveur d\'enregistrement','Servidor de grabación'),
  ('No Stats Available','No Stats Available','Statistiques non disponibles','Estadísticas non disponibles'),
  ('records found','records found','articles trouvés','registros encontrados'),
  ('of','of','de','de'),
  ('Agent sales','Agent sales','Ventes de l\'agent','Ventas del agente'),
  ('Group sales','Group sales','Ventes du groupe','Ventas del grupo'),
  ('Agent hours','Agent hours','Heures de l\'agent','Horas del agente'),
  ('Group hours','Group hours','Heures du groupe','Horas del grupo'),
  ('Calculation base','Calculation base','Base de calcul','Base del cálculo'),
  ('Total commission','Total commission','Commission totale','Comisión total'),
  ('Commission details','Commission details','Details des commissions','Detalles de la Comisión'),
  ('Show commission details from','Show commission details from','Afficher les details de commission de','Demuestre a detalles de la comisión de'),
  ('Please enter a valid date to proceed','Please enter a valid date to proceed','Veuillez saisir une date valide','Incorpore por favor una fecha válida para proceder'),
  ('Leave a message if answering machine is detected','Leave a message if answering machine is detected','Laisser un message lorsqu\'un répondeur est détecté','Dejar un mensaje cuando se detecta un contestador'),
  ('Line management','Line management','Gestion des lignes','Gestión de las líneas'),
  ('Configured ports','Configured ports','Ports configurés','Puertos configurados'),
  ('Total used','Total used','Total utilisé','Total utilizado'),
  ('Agent outbound','Agent outbound','Agent en appel sortant','Agente en llamada saliente'),
  ('Transferred','Transferred','Transféré','Transferido'),
  ('Conference','Conference','Conférence','Conferencia'),
  ('Unknown status','Unknown status','Status inconnu','Estado desconocido'),
  ('Global summary','Global summary','Sommaire global','Sumario global');

