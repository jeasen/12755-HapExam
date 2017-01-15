/*
Navicat MySQL Data Transfer

Source Server         : hap
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : hap_dev

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-01-15 19:56:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'false', '1');
INSERT INTO `act_ge_property` VALUES ('next.dbid', '1', '1');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.0.0.3)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.0.0.3', '1');

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for databasechangelog
-- ----------------------------
DROP TABLE IF EXISTS `databasechangelog`;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databasechangelog
-- ----------------------------
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-1', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:44', '1', 'EXECUTED', '7:9cac9c56da25e14795c9ad0fa1436c19', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-2', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:44', '2', 'EXECUTED', '7:5d560b358c03c9fee1a39da807b02b23', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-3', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '3', 'EXECUTED', '7:9e2fe3457ff81d91b48b534a6459aaa0', 'createTable, addUniqueConstraint, createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-4', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '4', 'EXECUTED', '7:551f342eb60fdf566c4d95a61b161363', 'createTable, createIndex, createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-5', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '5', 'EXECUTED', '7:7d29d8abcefb7bb07043a9897e31d08d', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-6', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '6', 'EXECUTED', '7:425119fea37700db89b302ec51f02a00', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-7', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '7', 'EXECUTED', '7:141374b97762ca54b459b60beba2c040', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-8', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '8', 'EXECUTED', '7:9a674f57a67ab46523528c8447b31202', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-9', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '9', 'EXECUTED', '7:9f83aa6e28d4f23ee298b99802076e7d', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-10', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '10', 'EXECUTED', '7:cbc692f7425bc6701f2c567fe508b542', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-11', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '11', 'EXECUTED', '7:4d8043535ee793e9409b1fea6b934289', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-12', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:45', '12', 'EXECUTED', '7:f6ece7f4163ef166c20a2f42424dd9e2', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-13', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:46', '13', 'EXECUTED', '7:a49ef97998b9acf74e22cb3a066b8743', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-14', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:46', '14', 'EXECUTED', '7:616e4f25d42a9d13f7259fb497395d3e', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-15', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:46', '15', 'EXECUTED', '7:d84b793422dc1ae60a6ef833796ca8ec', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-16', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:46', '16', 'EXECUTED', '7:7b692fe998f27eb0d4c8992ad8fe98d1', 'createTable, addUniqueConstraint, createIndex, createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-17', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:46', '17', 'EXECUTED', '7:113d335667c184c47f7f0e7650eb87e2', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-18', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:46', '18', 'EXECUTED', '7:f9e230001744d362be869c79e52d913b', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-19', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:46', '19', 'EXECUTED', '7:e5283c602c58c0c70ba7c286eae45df7', 'createTable, addUniqueConstraint, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-20', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:46', '20', 'EXECUTED', '7:31098a41b812119f3dd5ee3322670659', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160609-hailor-21', 'hailor', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:46', '21', 'EXECUTED', '7:b32904539b879705d32f2ad4a434ff01', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160610-sys-attach-category-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '22', 'EXECUTED', '7:999c5a29fe71bd6a72a54d87537e753e', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160610-sys-attachment-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '23', 'EXECUTED', '7:3de8de4f612baa8c57693dfa20d4dac5', 'createTable, createIndex (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160610-sys-file-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '24', 'EXECUTED', '7:cba72ad08c077065381aa2a6fe368c62', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-transaction-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '25', 'EXECUTED', '7:8687ecbd4890bfac4be5c8c847dc2478', 'createTable, createIndex (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-attachment-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '26', 'EXECUTED', '7:5705fdfba5272a56d655a1bffe282801', 'createTable, createIndex (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-email-account-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '27', 'EXECUTED', '7:c96d61576e45aac0862c5219c491d42c', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160611-sys-message-email-config-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '28', 'EXECUTED', '7:bb29c2927842699262131ba2f1dd60bc', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-message-email-white-lt-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '29', 'EXECUTED', '7:d935ef8ebd2bb4867f2de5e8b1cd4a70', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-message-receiver-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '30', 'EXECUTED', '7:a19fcaa3839cf5d58c5a517c4a6d716f', 'createTable, createIndex', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-message-template-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '31', 'EXECUTED', '7:30d17456a88542cd03ca7c4ebafe28a8', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-preferences-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:47', '32', 'EXECUTED', '7:86dba2866476bb547c66f1a1dca40caa', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-sys-account-retrieve-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:48', '33', 'EXECUTED', '7:b85978e55ee07971e98e327946d2eff2', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160922-sys-config-1', 'xuhailin', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:48', '34', 'EXECUTED', '7:9a086e0e95e6567eda7bd6dbc803318a', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-activiti.create.engine-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:53', '35', 'EXECUTED', '7:db6e32a91292af7bd67a1b554392e055', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-activiti.create.history-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:55', '36', 'EXECUTED', '7:5eb0e316ceac016258fe1a8796c5a04b', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-activiti.create.identity-1', 'jessen', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:55', '37', 'EXECUTED', '7:d9ba093bbd73a17a565e45a0a3b1b1dc', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('2016-10-9-FND_COMPANY', 'jialongzuo', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:55', '38', 'EXECUTED', '7:5ae91b53baf9301cc0b53cd33913c0f5', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161011-sys-userLogin-1', 'jialongzuo', '2016-06-09-init-table-migration.groovy', '2017-01-13 11:14:55', '39', 'EXECUTED', '7:4868890d35400bf73b6e6e3390e6cbb2', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-employee', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:55', '40', 'EXECUTED', '7:07c915a5d30d8d22125f508467d49556', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-org-unit', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:55', '41', 'EXECUTED', '7:fd02936bc948ab02489e94072e720030', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-org-position', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:55', '42', 'EXECUTED', '7:465365db4389d13a1203bac7735d3251', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160926-niujiaqing-hr-employee-assign', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:56', '43', 'EXECUTED', '7:d0b5a1ca504c1ef36fb410f41c830123', 'createTable, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161011-niujiaqing-sys-dashboard', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:56', '44', 'EXECUTED', '7:044b40288f4a9e51ce9f5f53ac14a23d', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161012-niujiaqing-user-dashboard', 'niujiaqing', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:56', '45', 'EXECUTED', '7:15a304a37ab173818db363debca865c6', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161031-sys-interfaceHeader-1', 'xiangyuQi', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:56', '46', 'EXECUTED', '7:773b32780ba1136e5879eb3c733a1afb', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161031-sys-interfaceLine-1', 'xiangyuQi', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:56', '47', 'EXECUTED', '7:4a0f79c06570442fc3e392aff56adac3', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161117-sys-user-demo-1', 'xuhailin', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:56', '48', 'EXECUTED', '7:2631f516111601ec396aace8c0401d32', 'createTable (x2)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161121-sys-if-invoke-in-1', 'xiangyuQi', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:56', '49', 'EXECUTED', '7:adf8895c0b6b018e26fa25ff2d9d0523', 'createTable, createIndex (x4)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161121-sys-if-invoke-out-1', 'xiangyuQi', '2016-09-26-init-migration.groovy', '2017-01-13 11:14:57', '50', 'EXECUTED', '7:caf8f033968cd31f816dc46077f61d6a', 'createTable, createIndex (x4)', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160601-hailor-1', 'jessen', 'hbi/core/db/2016-06-01-init-migration.groovy', '2017-01-13 11:14:57', '51', 'EXECUTED', '7:db8c28b026c8937eb118a19768efa7c4', 'createTable', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161009-xiangyuqi-1', 'xiangyuqi', 'patch.groovy', '2017-01-13 11:14:57', '52', 'EXECUTED', '7:70978c14109fc229144487006afccf91', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161025-zhizheng.yang-1', 'zhizheng.yang', 'patch.groovy', '2017-01-13 11:14:57', '53', 'EXECUTED', '7:c514a1778adc006e19237dbaf9ac7b6f', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161104-zhizheng.yang', 'zhizheng.yang', 'patch.groovy', '2017-01-13 11:14:57', '54', 'EXECUTED', '7:d20c8a541f028fa8876bdb71fafa05f4', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161109-xiangyuqi-1', 'xiangyu.qi', 'patch.groovy', '2017-01-13 11:14:57', '55', 'EXECUTED', '7:e9c2e00a3a580cde9301e67bdaa86513', 'renameColumn, addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161110-jialongzuo-1', 'jialong.zuo', 'patch.groovy', '2017-01-13 11:14:57', '56', 'EXECUTED', '7:164ccff8482ca92bc4c91622d34cf2da', 'addUniqueConstraint', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20161129-jialongzuo-1', 'jialong.zuo', 'patch.groovy', '2017-01-13 11:14:57', '57', 'EXECUTED', '7:91ca2128eff23ef5dc99b6f9ae7ffe41', 'addColumn', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-attach-category-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-01-13 11:14:57', '58', 'EXECUTED', '7:d7254fb792a2581c0c921cda8b90698b', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-email-config-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-01-13 11:14:57', '59', 'EXECUTED', '7:c39e780093128f2d0aafed24b3109466', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-email-account-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-01-13 11:14:57', '60', 'EXECUTED', '7:763810fcf72218794f8e4258011bef88', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-email-white-lt-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-01-13 11:14:57', '61', 'EXECUTED', '7:f5032ab5d66464c5d77ca62f90ca05ad', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160613-data-sys-message-template-1', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-01-13 11:14:57', '62', 'EXECUTED', '7:45cef023d3167bf5abed8b84d0c6ee8e', 'sqlFile', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160930-init-data-xlsx', 'jessen', '2016-06-09-init-data-migration.groovy', '2017-01-13 11:15:08', '63', 'EXECUTED', '7:45d61ef4bf0bf129b5184d1a46f5098f', 'customChange', '', null, '3.4.2', null, null);
INSERT INTO `databasechangelog` VALUES ('20160601-yourname-1', 'yourname', 'hbi/core/db/2016-06-01-init-data.groovy', '2017-01-13 11:15:08', '64', 'EXECUTED', '7:d41d8cd98f00b204e9800998ecf8427e', 'Empty', '', null, '3.4.2', null, null);

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS `databasechangeloglock`;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO `databasechangeloglock` VALUES ('1', '\0', null, null);

-- ----------------------------
-- Table structure for film_language
-- ----------------------------
DROP TABLE IF EXISTS `film_language`;
CREATE TABLE `film_language` (
  `language_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of film_language
-- ----------------------------
INSERT INTO `film_language` VALUES ('1', 'English', '2006-02-15 05:02:19');
INSERT INTO `film_language` VALUES ('2', 'Italian', '2006-02-15 05:02:19');
INSERT INTO `film_language` VALUES ('3', 'Japanese', '2006-02-15 05:02:19');
INSERT INTO `film_language` VALUES ('4', 'Mandarin', '2006-02-15 05:02:19');
INSERT INTO `film_language` VALUES ('5', 'French', '2006-02-15 05:02:19');
INSERT INTO `film_language` VALUES ('6', 'German', '2006-02-15 05:02:19');

-- ----------------------------
-- Table structure for fnd_company_b
-- ----------------------------
DROP TABLE IF EXISTS `fnd_company_b`;
CREATE TABLE `fnd_company_b` (
  `company_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_code` varchar(30) NOT NULL COMMENT '公司编码',
  `company_type` varchar(30) DEFAULT NULL COMMENT '公司类型',
  `address` varchar(2000) DEFAULT NULL COMMENT '地址',
  `company_level_id` bigint(20) DEFAULT NULL,
  `parent_company_id` bigint(20) DEFAULT NULL,
  `chief_position_id` bigint(20) DEFAULT NULL,
  `start_date_active` datetime DEFAULT NULL,
  `end_date_active` datetime DEFAULT NULL,
  `company_short_name` varchar(2000) DEFAULT NULL COMMENT '公司简称',
  `company_full_name` varchar(2000) DEFAULT NULL COMMENT '公司全称',
  `zipcode` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `FND_COMPANY_B_U1` (`company_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fnd_company_b
-- ----------------------------
INSERT INTO `fnd_company_b` VALUES ('10001', '213213', '2134', '213213', '213', null, null, '2017-01-07 00:00:00', '2017-07-01 00:00:00', '是', '萨达所大所', null, null, null, null, '2', '-1', '-1', '10001', '2017-01-14 14:16:32', '10001', '2017-01-14 21:04:29', '10001');
INSERT INTO `fnd_company_b` VALUES ('10002', 'hnfdbgfd', '21', 'jmutyrhtegfv', '321', null, null, '2017-01-04 00:00:00', '2017-01-26 00:00:00', 'ikymjutnhbgdfvd', 'oikyjuhgtfrd', null, null, null, null, '1', '-1', '-1', '10001', '2017-01-14 14:17:31', '10001', '2017-01-14 14:17:31', '10001');
INSERT INTO `fnd_company_b` VALUES ('10003', '21312', '3213', '21321', '321', null, null, null, null, 'sadsa', 'sadqwdwqdwq', null, null, null, null, '1', '-1', '-1', '10001', '2017-01-15 00:05:27', '10001', '2017-01-15 00:05:27', '10001');

-- ----------------------------
-- Table structure for fnd_company_tl
-- ----------------------------
DROP TABLE IF EXISTS `fnd_company_tl`;
CREATE TABLE `fnd_company_tl` (
  `company_id` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `company_short_name` varchar(2000) DEFAULT NULL,
  `company_full_name` varchar(2000) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`company_id`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fnd_company_tl
-- ----------------------------
INSERT INTO `fnd_company_tl` VALUES ('10001', 'en_GB', '是', '萨达所大所', '1', '-1', '-1', '10001', '2017-01-14 14:16:31', '10001', '2017-01-14 14:16:31', '-1');
INSERT INTO `fnd_company_tl` VALUES ('10001', 'zh_CN', '是', '萨达所大所', '1', '-1', '-1', '10001', '2017-01-14 14:16:31', '10001', '2017-01-14 21:04:29', '-1');
INSERT INTO `fnd_company_tl` VALUES ('10002', 'en_GB', 'ikymjutnhbgdfvd', 'oikyjuhgtfrd', '1', '-1', '-1', '10001', '2017-01-14 14:17:30', '10001', '2017-01-14 14:17:30', '-1');
INSERT INTO `fnd_company_tl` VALUES ('10002', 'zh_CN', 'ikymjutnhbgdfvd', 'oikyjuhgtfrd', '1', '-1', '-1', '10001', '2017-01-14 14:17:30', '10001', '2017-01-14 14:17:30', '-1');
INSERT INTO `fnd_company_tl` VALUES ('10003', 'en_GB', 'sadsa', 'sadqwdwqdwq', '1', '-1', '-1', '10001', '2017-01-15 00:05:26', '10001', '2017-01-15 00:05:26', '-1');
INSERT INTO `fnd_company_tl` VALUES ('10003', 'zh_CN', 'sadsa', 'sadqwdwqdwq', '1', '-1', '-1', '10001', '2017-01-15 00:05:26', '10001', '2017-01-15 00:05:26', '-1');

-- ----------------------------
-- Table structure for hap_ar_customers
-- ----------------------------
DROP TABLE IF EXISTS `hap_ar_customers`;
CREATE TABLE `hap_ar_customers` (
  `CUSTOMER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `CUSTOMER_NUMBER` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '客户编号',
  `CUSTOMER_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司ID',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '启用标识',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '请求号',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COMMENT='客户主数据';

-- ----------------------------
-- Records of hap_ar_customers
-- ----------------------------
INSERT INTO `hap_ar_customers` VALUES ('201', 'C001', '上海达芙妮', '101', 'Y', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_ar_customers` VALUES ('202', 'C002', '光明乳业', '102', 'Y', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_ar_customers` VALUES ('203', 'C003', '东阿阿胶', '103', 'N', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_ar_customers` VALUES ('204', 'C004', '大华科技', '104', 'Y', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_ar_customers` VALUES ('205', 'C005', '腾讯科技', '105', 'Y', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_demo
-- ----------------------------
DROP TABLE IF EXISTS `hap_demo`;
CREATE TABLE `hap_demo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `object_version_number` bigint(20) DEFAULT '1',
  `request_id` bigint(20) DEFAULT '-1',
  `program_id` bigint(20) DEFAULT '-1',
  `created_by` bigint(20) DEFAULT '-1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_updated_by` bigint(20) DEFAULT '-1',
  `last_update_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update_login` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_demo
-- ----------------------------

-- ----------------------------
-- Table structure for hap_film
-- ----------------------------
DROP TABLE IF EXISTS `hap_film`;
CREATE TABLE `hap_film` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `rental_rate` decimal(4,2) NOT NULL DEFAULT '4.99',
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) NOT NULL DEFAULT '19.99',
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT 'G',
  `special_features` set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`film_id`),
  KEY `idx_title` (`title`),
  KEY `idx_fk_language_id` (`language_id`),
  KEY `idx_fk_original_language_id` (`original_language_id`),
  CONSTRAINT `fk_film_language` FOREIGN KEY (`language_id`) REFERENCES `film_language` (`language_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_film_language_original` FOREIGN KEY (`original_language_id`) REFERENCES `film_language` (`language_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1030 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_film
-- ----------------------------
INSERT INTO `hap_film` VALUES ('1', 'ACADEMY DINOSAUR', 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies', '2006', '1', null, '6', '0.99', '86', '20.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('2', 'ACE GOLDFINGER', 'A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China', '2006', '1', null, '3', '4.99', '48', '12.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('3', 'ADAPTATION HOLES', 'A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory', '2006', '1', null, '7', '2.99', '50', '18.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('4', 'AFFAIR PREJUDICE', 'A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank', '2006', '1', null, '5', '2.99', '117', '26.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('6', 'AGENT TRUMAN', 'A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China', '2006', '1', null, '3', '2.99', '169', '17.99', 'PG', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('7', 'AIRPLANE SIERRA', 'A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat', '2006', '1', null, '6', '4.99', '62', '28.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('8', 'AIRPORT POLLOCK', 'A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India', '2006', '1', null, '6', '4.99', '54', '15.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('9', 'ALABAMA DEVIL', 'A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat', '2006', '1', null, '3', '2.99', '114', '21.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('10', 'ALADDIN CALENDAR', 'A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China', '2006', '1', null, '6', '4.99', '63', '24.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('11', 'ALAMO VIDEOTAPE', 'A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention', '2006', '1', null, '6', '0.99', '126', '16.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('12', 'ALASKA PHANTOM', 'A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia', '2006', '1', null, '6', '0.99', '136', '22.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('13', 'ALI FOREVER', 'A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies', '2006', '1', null, '4', '4.99', '150', '21.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('14', 'ALICE FANTASIA', 'A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia', '2006', '1', null, '6', '0.99', '94', '23.99', 'NC-17', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('15', 'ALIEN CENTER', 'A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention', '2006', '1', null, '5', '2.99', '46', '10.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('16', 'ALLEY EVOLUTION', 'A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans', '2006', '1', null, '6', '2.99', '180', '23.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('17', 'ALONE TRIP', 'A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House', '2006', '1', null, '3', '0.99', '82', '14.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('18', 'ALTER VICTORY', 'A Thoughtful Drama of a Composer And a Feminist who must Meet a Secret Agent in The Canadian Rockies', '2006', '1', null, '6', '0.99', '57', '27.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('19', 'AMADEUS HOLY', 'A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon', '2006', '1', null, '6', '0.99', '113', '20.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('20', 'AMELIE HELLFIGHTERS', 'A Boring Drama of a Woman And a Squirrel who must Conquer a Student in A Baloon', '2006', '1', null, '4', '4.99', '79', '23.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('21', 'AMERICAN CIRCUS', 'A Insightful Drama of a Girl And a Astronaut who must Face a Database Administrator in A Shark Tank', '2006', '1', null, '3', '4.99', '129', '17.99', 'R', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('22', 'AMISTAD MIDSUMMER', 'A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California', '2006', '1', null, '6', '2.99', '85', '10.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('23', 'ANACONDA CONFESSIONS', 'A Lacklusture Display of a Dentist And a Dentist who must Fight a Girl in Australia', '2006', '1', null, '3', '0.99', '92', '9.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('24', 'ANALYZE HOOSIERS', 'A Thoughtful Display of a Explorer And a Pastry Chef who must Overcome a Feminist in The Sahara Desert', '2006', '1', null, '6', '2.99', '181', '19.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('25', 'ANGELS LIFE', 'A Thoughtful Display of a Woman And a Astronaut who must Battle a Robot in Berlin', '2006', '1', null, '3', '2.99', '74', '15.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('26', 'ANNIE IDENTITY', 'A Amazing Panorama of a Pastry Chef And a Boat who must Escape a Woman in An Abandoned Amusement Park', '2006', '1', null, '3', '0.99', '86', '15.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('27', 'ANONYMOUS HUMAN', 'A Amazing Reflection of a Database Administrator And a Astronaut who must Outrace a Database Administrator in A Shark Tank', '2006', '1', null, '7', '0.99', '179', '12.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('28', 'ANTHEM LUKE', 'A Touching Panorama of a Waitress And a Woman who must Outrace a Dog in An Abandoned Amusement Park', '2006', '1', null, '5', '4.99', '91', '16.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('29', 'ANTITRUST TOMATOES', 'A Fateful Yarn of a Womanizer And a Feminist who must Succumb a Database Administrator in Ancient India', '2006', '1', null, '5', '2.99', '168', '11.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('30', 'ANYTHING SAVANNAH', 'A Epic Story of a Pastry Chef And a Woman who must Chase a Feminist in An Abandoned Fun House', '2006', '1', null, '4', '2.99', '82', '27.99', 'R', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('31', 'APACHE DIVINE', 'A Awe-Inspiring Reflection of a Pastry Chef And a Teacher who must Overcome a Sumo Wrestler in A U-Boat', '2006', '1', null, '5', '4.99', '92', '16.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('32', 'APOCALYPSE FLAMINGOS', 'A Astounding Story of a Dog And a Squirrel who must Defeat a Woman in An Abandoned Amusement Park', '2006', '1', null, '6', '4.99', '119', '11.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('33', 'APOLLO TEEN', 'A Action-Packed Reflection of a Crocodile And a Explorer who must Find a Sumo Wrestler in An Abandoned Mine Shaft', '2006', '1', null, '5', '2.99', '153', '15.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('34', 'ARABIA DOGMA', 'A Touching Epistle of a Madman And a Mad Cow who must Defeat a Student in Nigeria', '2006', '1', null, '6', '0.99', '62', '29.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('35', 'ARACHNOPHOBIA ROLLERCOASTER', 'A Action-Packed Reflection of a Pastry Chef And a Composer who must Discover a Mad Scientist in The First Manned Space Station', '2006', '1', null, '4', '2.99', '147', '24.99', 'PG-13', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('36', 'ARGONAUTS TOWN', 'A Emotional Epistle of a Forensic Psychologist And a Butler who must Challenge a Waitress in An Abandoned Mine Shaft', '2006', '1', null, '7', '0.99', '127', '12.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('37', 'ARIZONA BANG', 'A Brilliant Panorama of a Mad Scientist And a Mad Cow who must Meet a Pioneer in A Monastery', '2006', '1', null, '3', '2.99', '121', '28.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('38', 'ARK RIDGEMONT', 'A Beautiful Yarn of a Pioneer And a Monkey who must Pursue a Explorer in The Sahara Desert', '2006', '1', null, '6', '0.99', '68', '25.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('39', 'ARMAGEDDON LOST', 'A Fast-Paced Tale of a Boat And a Teacher who must Succumb a Composer in An Abandoned Mine Shaft', '2006', '1', null, '5', '0.99', '99', '10.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('40', 'ARMY FLINTSTONES', 'A Boring Saga of a Database Administrator And a Womanizer who must Battle a Waitress in Nigeria', '2006', '1', null, '4', '0.99', '148', '22.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('41', 'ARSENIC INDEPENDENCE', 'A Fanciful Documentary of a Mad Cow And a Womanizer who must Find a Dentist in Berlin', '2006', '1', null, '4', '0.99', '137', '17.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('42', 'ARTIST COLDBLOODED', 'A Stunning Reflection of a Robot And a Moose who must Challenge a Woman in California', '2006', '1', null, '5', '2.99', '170', '10.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('43', 'ATLANTIS CAUSE', 'A Thrilling Yarn of a Feminist And a Hunter who must Fight a Technical Writer in A Shark Tank', '2006', '1', null, '6', '2.99', '170', '15.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('44', 'ATTACKS HATE', 'A Fast-Paced Panorama of a Technical Writer And a Mad Scientist who must Find a Feminist in An Abandoned Mine Shaft', '2006', '1', null, '5', '4.99', '113', '21.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('45', 'ATTRACTION NEWTON', 'A Astounding Panorama of a Composer And a Frisbee who must Reach a Husband in Ancient Japan', '2006', '1', null, '5', '4.99', '83', '14.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('46', 'AUTUMN CROW', 'A Beautiful Tale of a Dentist And a Mad Cow who must Battle a Moose in The Sahara Desert', '2006', '1', null, '3', '4.99', '108', '13.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('47', 'BABY HALL', 'A Boring Character Study of a A Shark And a Girl who must Outrace a Feminist in An Abandoned Mine Shaft', '2006', '1', null, '5', '4.99', '153', '23.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('48', 'BACKLASH UNDEFEATED', 'A Stunning Character Study of a Mad Scientist And a Mad Cow who must Kill a Car in A Monastery', '2006', '1', null, '3', '4.99', '118', '24.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('49', 'BADMAN DAWN', 'A Emotional Panorama of a Pioneer And a Composer who must Escape a Mad Scientist in A Jet Boat', '2006', '1', null, '6', '2.99', '162', '22.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('50', 'BAKED CLEOPATRA', 'A Stunning Drama of a Forensic Psychologist And a Husband who must Overcome a Waitress in A Monastery', '2006', '1', null, '3', '2.99', '182', '20.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('51', 'BALLOON HOMEWARD', 'A Insightful Panorama of a Forensic Psychologist And a Mad Cow who must Build a Mad Scientist in The First Manned Space Station', '2006', '1', null, '5', '2.99', '75', '10.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('52', 'BALLROOM MOCKINGBIRD', 'A Thrilling Documentary of a Composer And a Monkey who must Find a Feminist in California', '2006', '1', null, '6', '0.99', '173', '29.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('53', 'BANG KWAI', 'A Epic Drama of a Madman And a Cat who must Face a A Shark in An Abandoned Amusement Park', '2006', '1', null, '5', '2.99', '87', '25.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('54', 'BANGER PINOCCHIO', 'A Awe-Inspiring Drama of a Car And a Pastry Chef who must Chase a Crocodile in The First Manned Space Station', '2006', '1', null, '5', '0.99', '113', '15.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('55', 'BARBARELLA STREETCAR', 'A Awe-Inspiring Story of a Feminist And a Cat who must Conquer a Dog in A Monastery', '2006', '1', null, '6', '2.99', '65', '27.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('56', 'BAREFOOT MANCHURIAN', 'A Intrepid Story of a Cat And a Student who must Vanquish a Girl in An Abandoned Amusement Park', '2006', '1', null, '6', '2.99', '129', '15.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('57', 'BASIC EASY', 'A Stunning Epistle of a Man And a Husband who must Reach a Mad Scientist in A Jet Boat', '2006', '1', null, '4', '2.99', '90', '18.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('58', 'BEACH HEARTBREAKERS', 'A Fateful Display of a Womanizer And a Mad Scientist who must Outgun a A Shark in Soviet Georgia', '2006', '1', null, '6', '2.99', '122', '16.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('59', 'BEAR GRACELAND', 'A Astounding Saga of a Dog And a Boy who must Kill a Teacher in The First Manned Space Station', '2006', '1', null, '4', '2.99', '160', '20.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('60', 'BEAST HUNCHBACK', 'A Awe-Inspiring Epistle of a Student And a Squirrel who must Defeat a Boy in Ancient China', '2006', '1', null, '3', '4.99', '89', '22.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('61', 'BEAUTY GREASE', 'A Fast-Paced Display of a Composer And a Moose who must Sink a Robot in An Abandoned Mine Shaft', '2006', '1', null, '5', '4.99', '175', '28.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('62', 'BED HIGHBALL', 'A Astounding Panorama of a Lumberjack And a Dog who must Redeem a Woman in An Abandoned Fun House', '2006', '1', null, '5', '2.99', '106', '23.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('63', 'BEDAZZLED MARRIED', 'A Astounding Character Study of a Madman And a Robot who must Meet a Mad Scientist in An Abandoned Fun House', '2006', '1', null, '6', '0.99', '73', '21.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('64', 'BEETHOVEN EXORCIST', 'A Epic Display of a Pioneer And a Student who must Challenge a Butler in The Gulf of Mexico', '2006', '1', null, '6', '0.99', '151', '26.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('65', 'BEHAVIOR RUNAWAY', 'A Unbelieveable Drama of a Student And a Husband who must Outrace a Sumo Wrestler in Berlin', '2006', '1', null, '3', '4.99', '100', '20.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('66', 'BENEATH RUSH', 'A Astounding Panorama of a Man And a Monkey who must Discover a Man in The First Manned Space Station', '2006', '1', null, '6', '0.99', '53', '27.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('67', 'BERETS AGENT', 'A Taut Saga of a Crocodile And a Boy who must Overcome a Technical Writer in Ancient China', '2006', '1', null, '5', '2.99', '77', '24.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('68', 'BETRAYED REAR', 'A Emotional Character Study of a Boat And a Pioneer who must Find a Explorer in A Shark Tank', '2006', '1', null, '5', '4.99', '122', '26.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('69', 'BEVERLY OUTLAW', 'A Fanciful Documentary of a Womanizer And a Boat who must Defeat a Madman in The First Manned Space Station', '2006', '1', null, '3', '2.99', '85', '21.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('70', 'BIKINI BORROWERS', 'A Astounding Drama of a Astronaut And a Cat who must Discover a Woman in The First Manned Space Station', '2006', '1', null, '7', '4.99', '142', '26.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('71', 'BILKO ANONYMOUS', 'A Emotional Reflection of a Teacher And a Man who must Meet a Cat in The First Manned Space Station', '2006', '1', null, '3', '4.99', '100', '25.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('72', 'BILL OTHERS', 'A Stunning Saga of a Mad Scientist And a Forensic Psychologist who must Challenge a Squirrel in A MySQL Convention', '2006', '1', null, '6', '2.99', '93', '12.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('73', 'BINGO TALENTED', 'A Touching Tale of a Girl And a Crocodile who must Discover a Waitress in Nigeria', '2006', '1', null, '5', '2.99', '150', '22.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('74', 'BIRCH ANTITRUST', 'A Fanciful Panorama of a Husband And a Pioneer who must Outgun a Dog in A Baloon', '2006', '1', null, '4', '4.99', '162', '18.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('75', 'BIRD INDEPENDENCE', 'A Thrilling Documentary of a Car And a Student who must Sink a Hunter in The Canadian Rockies', '2006', '1', null, '6', '4.99', '163', '14.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('76', 'BIRDCAGE CASPER', 'A Fast-Paced Saga of a Frisbee And a Astronaut who must Overcome a Feminist in Ancient India', '2006', '1', null, '4', '0.99', '103', '23.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('77', 'BIRDS PERDITION', 'A Boring Story of a Womanizer And a Pioneer who must Face a Dog in California', '2006', '1', null, '5', '4.99', '61', '15.99', 'G', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('78', 'BLACKOUT PRIVATE', 'A Intrepid Yarn of a Pastry Chef And a Mad Scientist who must Challenge a Secret Agent in Ancient Japan', '2006', '1', null, '7', '2.99', '85', '12.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('79', 'BLADE POLISH', 'A Thoughtful Character Study of a Frisbee And a Pastry Chef who must Fight a Dentist in The First Manned Space Station', '2006', '1', null, '5', '0.99', '114', '10.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('80', 'BLANKET BEVERLY', 'A Emotional Documentary of a Student And a Girl who must Build a Boat in Nigeria', '2006', '1', null, '7', '2.99', '148', '21.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('81', 'BLINDNESS GUN', 'A Touching Drama of a Robot And a Dentist who must Meet a Hunter in A Jet Boat', '2006', '1', null, '6', '4.99', '103', '29.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('82', 'BLOOD ARGONAUTS', 'A Boring Drama of a Explorer And a Man who must Kill a Lumberjack in A Manhattan Penthouse', '2006', '1', null, '3', '0.99', '71', '13.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('83', 'BLUES INSTINCT', 'A Insightful Documentary of a Boat And a Composer who must Meet a Forensic Psychologist in An Abandoned Fun House', '2006', '1', null, '5', '2.99', '50', '18.99', 'G', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('84', 'BOILED DARES', 'A Awe-Inspiring Story of a Waitress And a Dog who must Discover a Dentist in Ancient Japan', '2006', '1', null, '7', '4.99', '102', '13.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('85', 'BONNIE HOLOCAUST', 'A Fast-Paced Story of a Crocodile And a Robot who must Find a Moose in Ancient Japan', '2006', '1', null, '4', '0.99', '63', '29.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('86', 'BOOGIE AMELIE', 'A Lacklusture Character Study of a Husband And a Sumo Wrestler who must Succumb a Technical Writer in The Gulf of Mexico', '2006', '1', null, '6', '4.99', '121', '11.99', 'R', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('87', 'BOONDOCK BALLROOM', 'A Fateful Panorama of a Crocodile And a Boy who must Defeat a Monkey in The Gulf of Mexico', '2006', '1', null, '7', '0.99', '76', '14.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('88', 'BORN SPINAL', 'A Touching Epistle of a Frisbee And a Husband who must Pursue a Student in Nigeria', '2006', '1', null, '7', '4.99', '179', '17.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('89', 'BORROWERS BEDAZZLED', 'A Brilliant Epistle of a Teacher And a Sumo Wrestler who must Defeat a Man in An Abandoned Fun House', '2006', '1', null, '7', '0.99', '63', '22.99', 'G', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('90', 'BOULEVARD MOB', 'A Fateful Epistle of a Moose And a Monkey who must Confront a Lumberjack in Ancient China', '2006', '1', null, '3', '0.99', '63', '11.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('91', 'BOUND CHEAPER', 'A Thrilling Panorama of a Database Administrator And a Astronaut who must Challenge a Lumberjack in A Baloon', '2006', '1', null, '5', '0.99', '98', '17.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('92', 'BOWFINGER GABLES', 'A Fast-Paced Yarn of a Waitress And a Composer who must Outgun a Dentist in California', '2006', '1', null, '7', '4.99', '72', '19.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('93', 'BRANNIGAN SUNRISE', 'A Amazing Epistle of a Moose And a Crocodile who must Outrace a Dog in Berlin', '2006', '1', null, '4', '4.99', '121', '27.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('94', 'BRAVEHEART HUMAN', 'A Insightful Story of a Dog And a Pastry Chef who must Battle a Girl in Berlin', '2006', '1', null, '7', '2.99', '176', '14.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('95', 'BREAKFAST GOLDFINGER', 'A Beautiful Reflection of a Student And a Student who must Fight a Moose in Berlin', '2006', '1', null, '5', '4.99', '123', '18.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('96', 'BREAKING HOME', 'A Beautiful Display of a Secret Agent And a Monkey who must Battle a Sumo Wrestler in An Abandoned Mine Shaft', '2006', '1', null, '4', '2.99', '169', '21.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('97', 'BRIDE INTRIGUE', 'A Epic Tale of a Robot And a Monkey who must Vanquish a Man in New Orleans', '2006', '1', null, '7', '0.99', '56', '24.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('98', 'BRIGHT ENCOUNTERS', 'A Fateful Yarn of a Lumberjack And a Feminist who must Conquer a Student in A Jet Boat', '2006', '1', null, '4', '4.99', '73', '12.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('99', 'BRINGING HYSTERICAL', 'A Fateful Saga of a A Shark And a Technical Writer who must Find a Woman in A Jet Boat', '2006', '1', null, '7', '2.99', '136', '14.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('100', 'BROOKLYN DESERT', 'A Beautiful Drama of a Dentist And a Composer who must Battle a Sumo Wrestler in The First Manned Space Station', '2006', '1', null, '7', '4.99', '161', '21.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('101', 'BROTHERHOOD BLANKET', 'A Fateful Character Study of a Butler And a Technical Writer who must Sink a Astronaut in Ancient Japan', '2006', '1', null, '3', '0.99', '73', '26.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('102', 'BUBBLE GROSSE', 'A Awe-Inspiring Panorama of a Crocodile And a Moose who must Confront a Girl in A Baloon', '2006', '1', null, '4', '4.99', '60', '20.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('103', 'BUCKET BROTHERHOOD', 'A Amazing Display of a Girl And a Womanizer who must Succumb a Lumberjack in A Baloon Factory', '2006', '1', null, '7', '4.99', '133', '27.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('104', 'BUGSY SONG', 'A Awe-Inspiring Character Study of a Secret Agent And a Boat who must Find a Squirrel in The First Manned Space Station', '2006', '1', null, '4', '2.99', '119', '17.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('105', 'BULL SHAWSHANK', 'A Fanciful Drama of a Moose And a Squirrel who must Conquer a Pioneer in The Canadian Rockies', '2006', '1', null, '6', '0.99', '125', '21.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('106', 'BULWORTH COMMANDMENTS', 'A Amazing Display of a Mad Cow And a Pioneer who must Redeem a Sumo Wrestler in The Outback', '2006', '1', null, '4', '2.99', '61', '14.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('107', 'BUNCH MINDS', 'A Emotional Story of a Feminist And a Feminist who must Escape a Pastry Chef in A MySQL Convention', '2006', '1', null, '4', '2.99', '63', '13.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('108', 'BUTCH PANTHER', 'A Lacklusture Yarn of a Feminist And a Database Administrator who must Face a Hunter in New Orleans', '2006', '1', null, '6', '0.99', '67', '19.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('109', 'BUTTERFLY CHOCOLAT', 'A Fateful Story of a Girl And a Composer who must Conquer a Husband in A Shark Tank', '2006', '1', null, '3', '0.99', '89', '17.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('110', 'CABIN FLASH', 'A Stunning Epistle of a Boat And a Man who must Challenge a A Shark in A Baloon Factory', '2006', '1', null, '4', '0.99', '53', '25.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('111', 'CADDYSHACK JEDI', 'A Awe-Inspiring Epistle of a Woman And a Madman who must Fight a Robot in Soviet Georgia', '2006', '1', null, '3', '0.99', '52', '17.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('112', 'CALENDAR GUNFIGHT', 'A Thrilling Drama of a Frisbee And a Lumberjack who must Sink a Man in Nigeria', '2006', '1', null, '4', '4.99', '120', '22.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('113', 'CALIFORNIA BIRDS', 'A Thrilling Yarn of a Database Administrator And a Robot who must Battle a Database Administrator in Ancient India', '2006', '1', null, '4', '4.99', '75', '19.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('114', 'CAMELOT VACATION', 'A Touching Character Study of a Woman And a Waitress who must Battle a Pastry Chef in A MySQL Convention', '2006', '1', null, '3', '0.99', '61', '26.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('115', 'CAMPUS REMEMBER', 'A Astounding Drama of a Crocodile And a Mad Cow who must Build a Robot in A Jet Boat', '2006', '1', null, '5', '2.99', '167', '27.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('116', 'CANDIDATE PERDITION', 'A Brilliant Epistle of a Composer And a Database Administrator who must Vanquish a Mad Scientist in The First Manned Space Station', '2006', '1', null, '4', '2.99', '70', '10.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('117', 'CANDLES GRAPES', 'A Fanciful Character Study of a Monkey And a Explorer who must Build a Astronaut in An Abandoned Fun House', '2006', '1', null, '6', '4.99', '135', '15.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('118', 'CANYON STOCK', 'A Thoughtful Reflection of a Waitress And a Feminist who must Escape a Squirrel in A Manhattan Penthouse', '2006', '1', null, '7', '0.99', '85', '26.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('119', 'CAPER MOTIONS', 'A Fateful Saga of a Moose And a Car who must Pursue a Woman in A MySQL Convention', '2006', '1', null, '6', '0.99', '176', '22.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('120', 'CARIBBEAN LIBERTY', 'A Fanciful Tale of a Pioneer And a Technical Writer who must Outgun a Pioneer in A Shark Tank', '2006', '1', null, '3', '4.99', '92', '16.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('121', 'CAROL TEXAS', 'A Astounding Character Study of a Composer And a Student who must Overcome a Composer in A Monastery', '2006', '1', null, '4', '2.99', '151', '15.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('122', 'CARRIE BUNCH', 'A Amazing Epistle of a Student And a Astronaut who must Discover a Frisbee in The Canadian Rockies', '2006', '1', null, '7', '0.99', '114', '11.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('123', 'CASABLANCA SUPER', 'A Amazing Panorama of a Crocodile And a Forensic Psychologist who must Pursue a Secret Agent in The First Manned Space Station', '2006', '1', null, '6', '4.99', '85', '22.99', 'G', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('124', 'CASPER DRAGONFLY', 'A Intrepid Documentary of a Boat And a Crocodile who must Chase a Robot in The Sahara Desert', '2006', '1', null, '3', '4.99', '163', '16.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('125', 'CASSIDY WYOMING', 'A Intrepid Drama of a Frisbee And a Hunter who must Kill a Secret Agent in New Orleans', '2006', '1', null, '5', '2.99', '61', '19.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('126', 'CASUALTIES ENCINO', 'A Insightful Yarn of a A Shark And a Pastry Chef who must Face a Boy in A Monastery', '2006', '1', null, '3', '4.99', '179', '16.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('127', 'CAT CONEHEADS', 'A Fast-Paced Panorama of a Girl And a A Shark who must Confront a Boy in Ancient India', '2006', '1', null, '5', '4.99', '112', '14.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('128', 'CATCH AMISTAD', 'A Boring Reflection of a Lumberjack And a Feminist who must Discover a Woman in Nigeria', '2006', '1', null, '7', '0.99', '183', '10.99', 'G', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('129', 'CAUSE DATE', 'A Taut Tale of a Explorer And a Pastry Chef who must Conquer a Hunter in A MySQL Convention', '2006', '1', null, '3', '2.99', '179', '16.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('130', 'CELEBRITY HORN', 'A Amazing Documentary of a Secret Agent And a Astronaut who must Vanquish a Hunter in A Shark Tank', '2006', '1', null, '7', '0.99', '110', '24.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('131', 'CENTER DINOSAUR', 'A Beautiful Character Study of a Sumo Wrestler And a Dentist who must Find a Dog in California', '2006', '1', null, '5', '4.99', '152', '12.99', 'PG', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('132', 'CHAINSAW UPTOWN', 'A Beautiful Documentary of a Boy And a Robot who must Discover a Squirrel in Australia', '2006', '1', null, '6', '0.99', '114', '25.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('133', 'CHAMBER ITALIAN', 'A Fateful Reflection of a Moose And a Husband who must Overcome a Monkey in Nigeria', '2006', '1', null, '7', '4.99', '117', '14.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('134', 'CHAMPION FLATLINERS', 'A Amazing Story of a Mad Cow And a Dog who must Kill a Husband in A Monastery', '2006', '1', null, '4', '4.99', '51', '21.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('135', 'CHANCE RESURRECTION', 'A Astounding Story of a Forensic Psychologist And a Forensic Psychologist who must Overcome a Moose in Ancient China', '2006', '1', null, '3', '2.99', '70', '22.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('136', 'CHAPLIN LICENSE', 'A Boring Drama of a Dog And a Forensic Psychologist who must Outrace a Explorer in Ancient India', '2006', '1', null, '7', '2.99', '146', '26.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('137', 'CHARADE DUFFEL', 'A Action-Packed Display of a Man And a Waitress who must Build a Dog in A MySQL Convention', '2006', '1', null, '3', '2.99', '66', '21.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('138', 'CHARIOTS CONSPIRACY', 'A Unbelieveable Epistle of a Robot And a Husband who must Chase a Robot in The First Manned Space Station', '2006', '1', null, '5', '2.99', '71', '29.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('139', 'CHASING FIGHT', 'A Astounding Saga of a Technical Writer And a Butler who must Battle a Butler in A Shark Tank', '2006', '1', null, '7', '4.99', '114', '21.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('140', 'CHEAPER CLYDE', 'A Emotional Character Study of a Pioneer And a Girl who must Discover a Dog in Ancient Japan', '2006', '1', null, '6', '0.99', '87', '23.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('141', 'CHICAGO NORTH', 'A Fateful Yarn of a Mad Cow And a Waitress who must Battle a Student in California', '2006', '1', null, '6', '4.99', '185', '11.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('142', 'CHICKEN HELLFIGHTERS', 'A Emotional Drama of a Dog And a Explorer who must Outrace a Technical Writer in Australia', '2006', '1', null, '3', '0.99', '122', '24.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('143', 'CHILL LUCK', 'A Lacklusture Epistle of a Boat And a Technical Writer who must Fight a A Shark in The Canadian Rockies', '2006', '1', null, '6', '0.99', '142', '17.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('144', 'CHINATOWN GLADIATOR', 'A Brilliant Panorama of a Technical Writer And a Lumberjack who must Escape a Butler in Ancient India', '2006', '1', null, '7', '4.99', '61', '24.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('145', 'CHISUM BEHAVIOR', 'A Epic Documentary of a Sumo Wrestler And a Butler who must Kill a Car in Ancient India', '2006', '1', null, '5', '4.99', '124', '25.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('146', 'CHITTY LOCK', 'A Boring Epistle of a Boat And a Database Administrator who must Kill a Sumo Wrestler in The First Manned Space Station', '2006', '1', null, '6', '2.99', '107', '24.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('147', 'CHOCOLAT HARRY', 'A Action-Packed Epistle of a Dentist And a Moose who must Meet a Mad Cow in Ancient Japan', '2006', '1', null, '5', '0.99', '101', '16.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('148', 'CHOCOLATE DUCK', 'A Unbelieveable Story of a Mad Scientist And a Technical Writer who must Discover a Composer in Ancient China', '2006', '1', null, '3', '2.99', '132', '13.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('149', 'CHRISTMAS MOONSHINE', 'A Action-Packed Epistle of a Feminist And a Astronaut who must Conquer a Boat in A Manhattan Penthouse', '2006', '1', null, '7', '0.99', '150', '21.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('150', 'CIDER DESIRE', 'A Stunning Character Study of a Composer And a Mad Cow who must Succumb a Cat in Soviet Georgia', '2006', '1', null, '7', '2.99', '101', '9.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('151', 'CINCINATTI WHISPERER', 'A Brilliant Saga of a Pastry Chef And a Hunter who must Confront a Butler in Berlin', '2006', '1', null, '5', '4.99', '143', '26.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('152', 'CIRCUS YOUTH', 'A Thoughtful Drama of a Pastry Chef And a Dentist who must Pursue a Girl in A Baloon', '2006', '1', null, '5', '2.99', '90', '13.99', 'PG-13', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('153', 'CITIZEN SHREK', 'A Fanciful Character Study of a Technical Writer And a Husband who must Redeem a Robot in The Outback', '2006', '1', null, '7', '0.99', '165', '18.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('154', 'CLASH FREDDY', 'A Amazing Yarn of a Composer And a Squirrel who must Escape a Astronaut in Australia', '2006', '1', null, '6', '2.99', '81', '12.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('155', 'CLEOPATRA DEVIL', 'A Fanciful Documentary of a Crocodile And a Technical Writer who must Fight a A Shark in A Baloon', '2006', '1', null, '6', '0.99', '150', '26.99', 'PG-13', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('156', 'CLERKS ANGELS', 'A Thrilling Display of a Sumo Wrestler And a Girl who must Confront a Man in A Baloon', '2006', '1', null, '3', '4.99', '164', '15.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('157', 'CLOCKWORK PARADISE', 'A Insightful Documentary of a Technical Writer And a Feminist who must Challenge a Cat in A Baloon', '2006', '1', null, '7', '0.99', '143', '29.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('158', 'CLONES PINOCCHIO', 'A Amazing Drama of a Car And a Robot who must Pursue a Dentist in New Orleans', '2006', '1', null, '6', '2.99', '124', '16.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('159', 'CLOSER BANG', 'A Unbelieveable Panorama of a Frisbee And a Hunter who must Vanquish a Monkey in Ancient India', '2006', '1', null, '5', '4.99', '58', '12.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('160', 'CLUB GRAFFITI', 'A Epic Tale of a Pioneer And a Hunter who must Escape a Girl in A U-Boat', '2006', '1', null, '4', '0.99', '65', '12.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('161', 'CLUE GRAIL', 'A Taut Tale of a Butler And a Mad Scientist who must Build a Crocodile in Ancient China', '2006', '1', null, '6', '4.99', '70', '27.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('162', 'CLUELESS BUCKET', 'A Taut Tale of a Car And a Pioneer who must Conquer a Sumo Wrestler in An Abandoned Fun House', '2006', '1', null, '4', '2.99', '95', '13.99', 'R', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('163', 'CLYDE THEORY', 'A Beautiful Yarn of a Astronaut And a Frisbee who must Overcome a Explorer in A Jet Boat', '2006', '1', null, '4', '0.99', '139', '29.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('164', 'COAST RAINBOW', 'A Astounding Documentary of a Mad Cow And a Pioneer who must Challenge a Butler in The Sahara Desert', '2006', '1', null, '4', '0.99', '55', '20.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('165', 'COLDBLOODED DARLING', 'A Brilliant Panorama of a Dentist And a Moose who must Find a Student in The Gulf of Mexico', '2006', '1', null, '7', '4.99', '70', '27.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('166', 'COLOR PHILADELPHIA', 'A Thoughtful Panorama of a Car And a Crocodile who must Sink a Monkey in The Sahara Desert', '2006', '1', null, '6', '2.99', '149', '19.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('167', 'COMA HEAD', 'A Awe-Inspiring Drama of a Boy And a Frisbee who must Escape a Pastry Chef in California', '2006', '1', null, '6', '4.99', '109', '10.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('168', 'COMANCHEROS ENEMY', 'A Boring Saga of a Lumberjack And a Monkey who must Find a Monkey in The Gulf of Mexico', '2006', '1', null, '5', '0.99', '67', '23.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('169', 'COMFORTS RUSH', 'A Unbelieveable Panorama of a Pioneer And a Husband who must Meet a Mad Cow in An Abandoned Mine Shaft', '2006', '1', null, '3', '2.99', '76', '19.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('170', 'COMMAND DARLING', 'A Awe-Inspiring Tale of a Forensic Psychologist And a Woman who must Challenge a Database Administrator in Ancient Japan', '2006', '1', null, '5', '4.99', '120', '28.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('171', 'COMMANDMENTS EXPRESS', 'A Fanciful Saga of a Student And a Mad Scientist who must Battle a Hunter in An Abandoned Mine Shaft', '2006', '1', null, '6', '4.99', '59', '13.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('172', 'CONEHEADS SMOOCHY', 'A Touching Story of a Womanizer And a Composer who must Pursue a Husband in Nigeria', '2006', '1', null, '7', '4.99', '112', '12.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('173', 'CONFESSIONS MAGUIRE', 'A Insightful Story of a Car And a Boy who must Battle a Technical Writer in A Baloon', '2006', '1', null, '7', '4.99', '65', '25.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('174', 'CONFIDENTIAL INTERVIEW', 'A Stunning Reflection of a Cat And a Woman who must Find a Astronaut in Ancient Japan', '2006', '1', null, '6', '4.99', '180', '13.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('175', 'CONFUSED CANDLES', 'A Stunning Epistle of a Cat And a Forensic Psychologist who must Confront a Pioneer in A Baloon', '2006', '1', null, '3', '2.99', '122', '27.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('176', 'CONGENIALITY QUEST', 'A Touching Documentary of a Cat And a Pastry Chef who must Find a Lumberjack in A Baloon', '2006', '1', null, '6', '0.99', '87', '21.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('177', 'CONNECTICUT TRAMP', 'A Unbelieveable Drama of a Crocodile And a Mad Cow who must Reach a Dentist in A Shark Tank', '2006', '1', null, '4', '4.99', '172', '20.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('178', 'CONNECTION MICROCOSMOS', 'A Fateful Documentary of a Crocodile And a Husband who must Face a Husband in The First Manned Space Station', '2006', '1', null, '6', '0.99', '115', '25.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('179', 'CONQUERER NUTS', 'A Taut Drama of a Mad Scientist And a Man who must Escape a Pioneer in An Abandoned Mine Shaft', '2006', '1', null, '4', '4.99', '173', '14.99', 'G', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('180', 'CONSPIRACY SPIRIT', 'A Awe-Inspiring Story of a Student And a Frisbee who must Conquer a Crocodile in An Abandoned Mine Shaft', '2006', '1', null, '4', '2.99', '184', '27.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('181', 'CONTACT ANONYMOUS', 'A Insightful Display of a A Shark And a Monkey who must Face a Database Administrator in Ancient India', '2006', '1', null, '7', '2.99', '166', '10.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('182', 'CONTROL ANTHEM', 'A Fateful Documentary of a Robot And a Student who must Battle a Cat in A Monastery', '2006', '1', null, '7', '4.99', '185', '9.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('183', 'CONVERSATION DOWNHILL', 'A Taut Character Study of a Husband And a Waitress who must Sink a Squirrel in A MySQL Convention', '2006', '1', null, '4', '4.99', '112', '14.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('184', 'CORE SUIT', 'A Unbelieveable Tale of a Car And a Explorer who must Confront a Boat in A Manhattan Penthouse', '2006', '1', null, '3', '2.99', '92', '24.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('185', 'COWBOY DOOM', 'A Astounding Drama of a Boy And a Lumberjack who must Fight a Butler in A Baloon', '2006', '1', null, '3', '2.99', '146', '10.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('186', 'CRAFT OUTFIELD', 'A Lacklusture Display of a Explorer And a Hunter who must Succumb a Database Administrator in A Baloon Factory', '2006', '1', null, '6', '0.99', '64', '17.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('187', 'CRANES RESERVOIR', 'A Fanciful Documentary of a Teacher And a Dog who must Outgun a Forensic Psychologist in A Baloon Factory', '2006', '1', null, '5', '2.99', '57', '12.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('188', 'CRAZY HOME', 'A Fanciful Panorama of a Boy And a Woman who must Vanquish a Database Administrator in The Outback', '2006', '1', null, '7', '2.99', '136', '24.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('189', 'CREATURES SHAKESPEARE', 'A Emotional Drama of a Womanizer And a Squirrel who must Vanquish a Crocodile in Ancient India', '2006', '1', null, '3', '0.99', '139', '23.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('190', 'CREEPERS KANE', 'A Awe-Inspiring Reflection of a Squirrel And a Boat who must Outrace a Car in A Jet Boat', '2006', '1', null, '5', '4.99', '172', '23.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('191', 'CROOKED FROGMEN', 'A Unbelieveable Drama of a Hunter And a Database Administrator who must Battle a Crocodile in An Abandoned Amusement Park', '2006', '1', null, '6', '0.99', '143', '27.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('192', 'CROSSING DIVORCE', 'A Beautiful Documentary of a Dog And a Robot who must Redeem a Womanizer in Berlin', '2006', '1', null, '4', '4.99', '50', '19.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('193', 'CROSSROADS CASUALTIES', 'A Intrepid Documentary of a Sumo Wrestler And a Astronaut who must Battle a Composer in The Outback', '2006', '1', null, '5', '2.99', '153', '20.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('194', 'CROW GREASE', 'A Awe-Inspiring Documentary of a Woman And a Husband who must Sink a Database Administrator in The First Manned Space Station', '2006', '1', null, '6', '0.99', '104', '22.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('195', 'CROWDS TELEMARK', 'A Intrepid Documentary of a Astronaut And a Forensic Psychologist who must Find a Frisbee in An Abandoned Fun House', '2006', '1', null, '3', '4.99', '112', '16.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('196', 'CRUELTY UNFORGIVEN', 'A Brilliant Tale of a Car And a Moose who must Battle a Dentist in Nigeria', '2006', '1', null, '7', '0.99', '69', '29.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('197', 'CRUSADE HONEY', 'A Fast-Paced Reflection of a Explorer And a Butler who must Battle a Madman in An Abandoned Amusement Park', '2006', '1', null, '4', '2.99', '112', '27.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('198', 'CRYSTAL BREAKING', 'A Fast-Paced Character Study of a Feminist And a Explorer who must Face a Pastry Chef in Ancient Japan', '2006', '1', null, '6', '2.99', '184', '22.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('199', 'CUPBOARD SINNERS', 'A Emotional Reflection of a Frisbee And a Boat who must Reach a Pastry Chef in An Abandoned Amusement Park', '2006', '1', null, '4', '2.99', '56', '29.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('200', 'CURTAIN VIDEOTAPE', 'A Boring Reflection of a Dentist And a Mad Cow who must Chase a Secret Agent in A Shark Tank', '2006', '1', null, '7', '0.99', '133', '27.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('201', 'CYCLONE FAMILY', 'A Lacklusture Drama of a Student And a Monkey who must Sink a Womanizer in A MySQL Convention', '2006', '1', null, '7', '2.99', '176', '18.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('202', 'DADDY PITTSBURGH', 'A Epic Story of a A Shark And a Student who must Confront a Explorer in The Gulf of Mexico', '2006', '1', null, '5', '4.99', '161', '26.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('203', 'DAISY MENAGERIE', 'A Fast-Paced Saga of a Pastry Chef And a Monkey who must Sink a Composer in Ancient India', '2006', '1', null, '5', '4.99', '84', '9.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('204', 'DALMATIONS SWEDEN', 'A Emotional Epistle of a Moose And a Hunter who must Overcome a Robot in A Manhattan Penthouse', '2006', '1', null, '4', '0.99', '106', '25.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('205', 'DANCES NONE', 'A Insightful Reflection of a A Shark And a Dog who must Kill a Butler in An Abandoned Amusement Park', '2006', '1', null, '3', '0.99', '58', '22.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('206', 'DANCING FEVER', 'A Stunning Story of a Explorer And a Forensic Psychologist who must Face a Crocodile in A Shark Tank', '2006', '1', null, '6', '0.99', '144', '25.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('207', 'DANGEROUS UPTOWN', 'A Unbelieveable Story of a Mad Scientist And a Woman who must Overcome a Dog in California', '2006', '1', null, '7', '4.99', '121', '26.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('208', 'DARES PLUTO', 'A Fateful Story of a Robot And a Dentist who must Defeat a Astronaut in New Orleans', '2006', '1', null, '7', '2.99', '89', '16.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('209', 'DARKNESS WAR', 'A Touching Documentary of a Husband And a Hunter who must Escape a Boy in The Sahara Desert', '2006', '1', null, '6', '2.99', '99', '24.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('210', 'DARKO DORADO', 'A Stunning Reflection of a Frisbee And a Husband who must Redeem a Dog in New Orleans', '2006', '1', null, '3', '4.99', '130', '13.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('211', 'DARLING BREAKING', 'A Brilliant Documentary of a Astronaut And a Squirrel who must Succumb a Student in The Gulf of Mexico', '2006', '1', null, '7', '4.99', '165', '20.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('212', 'DARN FORRESTER', 'A Fateful Story of a A Shark And a Explorer who must Succumb a Technical Writer in A Jet Boat', '2006', '1', null, '7', '4.99', '185', '14.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('213', 'DATE SPEED', 'A Touching Saga of a Composer And a Moose who must Discover a Dentist in A MySQL Convention', '2006', '1', null, '4', '0.99', '104', '19.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('214', 'DAUGHTER MADIGAN', 'A Beautiful Tale of a Hunter And a Mad Scientist who must Confront a Squirrel in The First Manned Space Station', '2006', '1', null, '3', '4.99', '59', '13.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('215', 'DAWN POND', 'A Thoughtful Documentary of a Dentist And a Forensic Psychologist who must Defeat a Waitress in Berlin', '2006', '1', null, '4', '4.99', '57', '27.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('216', 'DAY UNFAITHFUL', 'A Stunning Documentary of a Composer And a Mad Scientist who must Find a Technical Writer in A U-Boat', '2006', '1', null, '3', '4.99', '113', '16.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('217', 'DAZED PUNK', 'A Action-Packed Story of a Pioneer And a Technical Writer who must Discover a Forensic Psychologist in An Abandoned Amusement Park', '2006', '1', null, '6', '4.99', '120', '20.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('218', 'DECEIVER BETRAYED', 'A Taut Story of a Moose And a Squirrel who must Build a Husband in Ancient India', '2006', '1', null, '7', '0.99', '122', '22.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('219', 'DEEP CRUSADE', 'A Amazing Tale of a Crocodile And a Squirrel who must Discover a Composer in Australia', '2006', '1', null, '6', '4.99', '51', '20.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('220', 'DEER VIRGINIAN', 'A Thoughtful Story of a Mad Cow And a Womanizer who must Overcome a Mad Scientist in Soviet Georgia', '2006', '1', null, '7', '2.99', '106', '13.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('221', 'DELIVERANCE MULHOLLAND', 'A Astounding Saga of a Monkey And a Moose who must Conquer a Butler in A Shark Tank', '2006', '1', null, '4', '0.99', '100', '9.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('222', 'DESERT POSEIDON', 'A Brilliant Documentary of a Butler And a Frisbee who must Build a Astronaut in New Orleans', '2006', '1', null, '4', '4.99', '64', '27.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('223', 'DESIRE ALIEN', 'A Fast-Paced Tale of a Dog And a Forensic Psychologist who must Meet a Astronaut in The First Manned Space Station', '2006', '1', null, '7', '2.99', '76', '24.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('224', 'DESPERATE TRAINSPOTTING', 'A Epic Yarn of a Forensic Psychologist And a Teacher who must Face a Lumberjack in California', '2006', '1', null, '7', '4.99', '81', '29.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('225', 'DESTINATION JERK', 'A Beautiful Yarn of a Teacher And a Cat who must Build a Car in A U-Boat', '2006', '1', null, '3', '0.99', '76', '19.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('226', 'DESTINY SATURDAY', 'A Touching Drama of a Crocodile And a Crocodile who must Conquer a Explorer in Soviet Georgia', '2006', '1', null, '4', '4.99', '56', '20.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('227', 'DETAILS PACKER', 'A Epic Saga of a Waitress And a Composer who must Face a Boat in A U-Boat', '2006', '1', null, '4', '4.99', '88', '17.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('228', 'DETECTIVE VISION', 'A Fanciful Documentary of a Pioneer And a Woman who must Redeem a Hunter in Ancient Japan', '2006', '1', null, '4', '0.99', '143', '16.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('229', 'DEVIL DESIRE', 'A Beautiful Reflection of a Monkey And a Dentist who must Face a Database Administrator in Ancient Japan', '2006', '1', null, '6', '4.99', '87', '12.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('230', 'DIARY PANIC', 'A Thoughtful Character Study of a Frisbee And a Mad Cow who must Outgun a Man in Ancient India', '2006', '1', null, '7', '2.99', '107', '20.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('231', 'DINOSAUR SECRETARY', 'A Action-Packed Drama of a Feminist And a Girl who must Reach a Robot in The Canadian Rockies', '2006', '1', null, '7', '2.99', '63', '27.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('232', 'DIRTY ACE', 'A Action-Packed Character Study of a Forensic Psychologist And a Girl who must Build a Dentist in The Outback', '2006', '1', null, '7', '2.99', '147', '29.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('233', 'DISCIPLE MOTHER', 'A Touching Reflection of a Mad Scientist And a Boat who must Face a Moose in A Shark Tank', '2006', '1', null, '3', '0.99', '141', '17.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('234', 'DISTURBING SCARFACE', 'A Lacklusture Display of a Crocodile And a Butler who must Overcome a Monkey in A U-Boat', '2006', '1', null, '6', '2.99', '94', '27.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('235', 'DIVIDE MONSTER', 'A Intrepid Saga of a Man And a Forensic Psychologist who must Reach a Squirrel in A Monastery', '2006', '1', null, '6', '2.99', '68', '13.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('236', 'DIVINE RESURRECTION', 'A Boring Character Study of a Man And a Womanizer who must Succumb a Teacher in An Abandoned Amusement Park', '2006', '1', null, '4', '2.99', '100', '19.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('237', 'DIVORCE SHINING', 'A Unbelieveable Saga of a Crocodile And a Student who must Discover a Cat in Ancient India', '2006', '1', null, '3', '2.99', '47', '21.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('238', 'DOCTOR GRAIL', 'A Insightful Drama of a Womanizer And a Waitress who must Reach a Forensic Psychologist in The Outback', '2006', '1', null, '4', '2.99', '57', '29.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('239', 'DOGMA FAMILY', 'A Brilliant Character Study of a Database Administrator And a Monkey who must Succumb a Astronaut in New Orleans', '2006', '1', null, '5', '4.99', '122', '16.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('240', 'DOLLS RAGE', 'A Thrilling Display of a Pioneer And a Frisbee who must Escape a Teacher in The Outback', '2006', '1', null, '7', '2.99', '120', '10.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('241', 'DONNIE ALLEY', 'A Awe-Inspiring Tale of a Butler And a Frisbee who must Vanquish a Teacher in Ancient Japan', '2006', '1', null, '4', '0.99', '125', '20.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('242', 'DOOM DANCING', 'A Astounding Panorama of a Car And a Mad Scientist who must Battle a Lumberjack in A MySQL Convention', '2006', '1', null, '4', '0.99', '68', '13.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('243', 'DOORS PRESIDENT', 'A Awe-Inspiring Display of a Squirrel And a Woman who must Overcome a Boy in The Gulf of Mexico', '2006', '1', null, '3', '4.99', '49', '22.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('244', 'DORADO NOTTING', 'A Action-Packed Tale of a Sumo Wrestler And a A Shark who must Meet a Frisbee in California', '2006', '1', null, '5', '4.99', '139', '26.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('245', 'DOUBLE WRATH', 'A Thoughtful Yarn of a Womanizer And a Dog who must Challenge a Madman in The Gulf of Mexico', '2006', '1', null, '4', '0.99', '177', '28.99', 'R', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('246', 'DOUBTFIRE LABYRINTH', 'A Intrepid Panorama of a Butler And a Composer who must Meet a Mad Cow in The Sahara Desert', '2006', '1', null, '5', '4.99', '154', '16.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('247', 'DOWNHILL ENOUGH', 'A Emotional Tale of a Pastry Chef And a Forensic Psychologist who must Succumb a Monkey in The Sahara Desert', '2006', '1', null, '3', '0.99', '47', '19.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('248', 'DOZEN LION', 'A Taut Drama of a Cat And a Girl who must Defeat a Frisbee in The Canadian Rockies', '2006', '1', null, '6', '4.99', '177', '20.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('249', 'DRACULA CRYSTAL', 'A Thrilling Reflection of a Feminist And a Cat who must Find a Frisbee in An Abandoned Fun House', '2006', '1', null, '7', '0.99', '176', '26.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('250', 'DRAGON SQUAD', 'A Taut Reflection of a Boy And a Waitress who must Outgun a Teacher in Ancient China', '2006', '1', null, '4', '0.99', '170', '26.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('251', 'DRAGONFLY STRANGERS', 'A Boring Documentary of a Pioneer And a Man who must Vanquish a Man in Nigeria', '2006', '1', null, '6', '4.99', '133', '19.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('252', 'DREAM PICKUP', 'A Epic Display of a Car And a Composer who must Overcome a Forensic Psychologist in The Gulf of Mexico', '2006', '1', null, '6', '2.99', '135', '18.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('253', 'DRIFTER COMMANDMENTS', 'A Epic Reflection of a Womanizer And a Squirrel who must Discover a Husband in A Jet Boat', '2006', '1', null, '5', '4.99', '61', '18.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('254', 'DRIVER ANNIE', 'A Lacklusture Character Study of a Butler And a Car who must Redeem a Boat in An Abandoned Fun House', '2006', '1', null, '4', '2.99', '159', '11.99', 'PG-13', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('255', 'DRIVING POLISH', 'A Action-Packed Yarn of a Feminist And a Technical Writer who must Sink a Boat in An Abandoned Mine Shaft', '2006', '1', null, '6', '4.99', '175', '21.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('256', 'DROP WATERFRONT', 'A Fanciful Documentary of a Husband And a Explorer who must Reach a Madman in Ancient China', '2006', '1', null, '6', '4.99', '178', '20.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('257', 'DRUMLINE CYCLONE', 'A Insightful Panorama of a Monkey And a Sumo Wrestler who must Outrace a Mad Scientist in The Canadian Rockies', '2006', '1', null, '3', '0.99', '110', '14.99', 'G', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('258', 'DRUMS DYNAMITE', 'A Epic Display of a Crocodile And a Crocodile who must Confront a Dog in An Abandoned Amusement Park', '2006', '1', null, '6', '0.99', '96', '11.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('259', 'DUCK RACER', 'A Lacklusture Yarn of a Teacher And a Squirrel who must Overcome a Dog in A Shark Tank', '2006', '1', null, '4', '2.99', '116', '15.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('260', 'DUDE BLINDNESS', 'A Stunning Reflection of a Husband And a Lumberjack who must Face a Frisbee in An Abandoned Fun House', '2006', '1', null, '3', '4.99', '132', '9.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('261', 'DUFFEL APOCALYPSE', 'A Emotional Display of a Boat And a Explorer who must Challenge a Madman in A MySQL Convention', '2006', '1', null, '5', '0.99', '171', '13.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('262', 'DUMBO LUST', 'A Touching Display of a Feminist And a Dentist who must Conquer a Husband in The Gulf of Mexico', '2006', '1', null, '5', '0.99', '119', '17.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('263', 'DURHAM PANKY', 'A Brilliant Panorama of a Girl And a Boy who must Face a Mad Scientist in An Abandoned Mine Shaft', '2006', '1', null, '6', '4.99', '154', '14.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('264', 'DWARFS ALTER', 'A Emotional Yarn of a Girl And a Dog who must Challenge a Composer in Ancient Japan', '2006', '1', null, '6', '2.99', '101', '13.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('265', 'DYING MAKER', 'A Intrepid Tale of a Boat And a Monkey who must Kill a Cat in California', '2006', '1', null, '5', '4.99', '168', '28.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('266', 'DYNAMITE TARZAN', 'A Intrepid Documentary of a Forensic Psychologist And a Mad Scientist who must Face a Explorer in A U-Boat', '2006', '1', null, '4', '0.99', '141', '27.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('267', 'EAGLES PANKY', 'A Thoughtful Story of a Car And a Boy who must Find a A Shark in The Sahara Desert', '2006', '1', null, '4', '4.99', '140', '14.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('268', 'EARLY HOME', 'A Amazing Panorama of a Mad Scientist And a Husband who must Meet a Woman in The Outback', '2006', '1', null, '6', '4.99', '96', '27.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('269', 'EARRING INSTINCT', 'A Stunning Character Study of a Dentist And a Mad Cow who must Find a Teacher in Nigeria', '2006', '1', null, '3', '0.99', '98', '22.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('270', 'EARTH VISION', 'A Stunning Drama of a Butler And a Madman who must Outrace a Womanizer in Ancient India', '2006', '1', null, '7', '0.99', '85', '29.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('271', 'EASY GLADIATOR', 'A Fateful Story of a Monkey And a Girl who must Overcome a Pastry Chef in Ancient India', '2006', '1', null, '5', '4.99', '148', '12.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('272', 'EDGE KISSING', 'A Beautiful Yarn of a Composer And a Mad Cow who must Redeem a Mad Scientist in A Jet Boat', '2006', '1', null, '5', '4.99', '153', '9.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('273', 'EFFECT GLADIATOR', 'A Beautiful Display of a Pastry Chef And a Pastry Chef who must Outgun a Forensic Psychologist in A Manhattan Penthouse', '2006', '1', null, '6', '0.99', '107', '14.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('274', 'EGG IGBY', 'A Beautiful Documentary of a Boat And a Sumo Wrestler who must Succumb a Database Administrator in The First Manned Space Station', '2006', '1', null, '4', '2.99', '67', '20.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('275', 'EGYPT TENENBAUMS', 'A Intrepid Story of a Madman And a Secret Agent who must Outrace a Astronaut in An Abandoned Amusement Park', '2006', '1', null, '3', '0.99', '85', '11.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('276', 'ELEMENT FREDDY', 'A Awe-Inspiring Reflection of a Waitress And a Squirrel who must Kill a Mad Cow in A Jet Boat', '2006', '1', null, '6', '4.99', '115', '28.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('277', 'ELEPHANT TROJAN', 'A Beautiful Panorama of a Lumberjack And a Forensic Psychologist who must Overcome a Frisbee in A Baloon', '2006', '1', null, '4', '4.99', '126', '24.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('278', 'ELF MURDER', 'A Action-Packed Story of a Frisbee And a Woman who must Reach a Girl in An Abandoned Mine Shaft', '2006', '1', null, '4', '4.99', '155', '19.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('279', 'ELIZABETH SHANE', 'A Lacklusture Display of a Womanizer And a Dog who must Face a Sumo Wrestler in Ancient Japan', '2006', '1', null, '7', '4.99', '152', '11.99', 'NC-17', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('280', 'EMPIRE MALKOVICH', 'A Amazing Story of a Feminist And a Cat who must Face a Car in An Abandoned Fun House', '2006', '1', null, '7', '0.99', '177', '26.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('281', 'ENCINO ELF', 'A Astounding Drama of a Feminist And a Teacher who must Confront a Husband in A Baloon', '2006', '1', null, '6', '0.99', '143', '9.99', 'G', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('282', 'ENCOUNTERS CURTAIN', 'A Insightful Epistle of a Pastry Chef And a Womanizer who must Build a Boat in New Orleans', '2006', '1', null, '5', '0.99', '92', '20.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('283', 'ENDING CROWDS', 'A Unbelieveable Display of a Dentist And a Madman who must Vanquish a Squirrel in Berlin', '2006', '1', null, '6', '0.99', '85', '10.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('284', 'ENEMY ODDS', 'A Fanciful Panorama of a Mad Scientist And a Woman who must Pursue a Astronaut in Ancient India', '2006', '1', null, '5', '4.99', '77', '23.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('285', 'ENGLISH BULWORTH', 'A Intrepid Epistle of a Pastry Chef And a Pastry Chef who must Pursue a Crocodile in Ancient China', '2006', '1', null, '3', '0.99', '51', '18.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('286', 'ENOUGH RAGING', 'A Astounding Character Study of a Boat And a Secret Agent who must Find a Mad Cow in The Sahara Desert', '2006', '1', null, '7', '2.99', '158', '16.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('287', 'ENTRAPMENT SATISFACTION', 'A Thoughtful Panorama of a Hunter And a Teacher who must Reach a Mad Cow in A U-Boat', '2006', '1', null, '5', '0.99', '176', '19.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('288', 'ESCAPE METROPOLIS', 'A Taut Yarn of a Astronaut And a Technical Writer who must Outgun a Boat in New Orleans', '2006', '1', null, '7', '2.99', '167', '20.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('289', 'EVE RESURRECTION', 'A Awe-Inspiring Yarn of a Pastry Chef And a Database Administrator who must Challenge a Teacher in A Baloon', '2006', '1', null, '5', '4.99', '66', '25.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('290', 'EVERYONE CRAFT', 'A Fateful Display of a Waitress And a Dentist who must Reach a Butler in Nigeria', '2006', '1', null, '4', '0.99', '163', '29.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('291', 'EVOLUTION ALTER', 'A Fanciful Character Study of a Feminist And a Madman who must Find a Explorer in A Baloon Factory', '2006', '1', null, '5', '0.99', '174', '10.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('292', 'EXCITEMENT EVE', 'A Brilliant Documentary of a Monkey And a Car who must Conquer a Crocodile in A Shark Tank', '2006', '1', null, '3', '0.99', '51', '20.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('293', 'EXORCIST STING', 'A Touching Drama of a Dog And a Sumo Wrestler who must Conquer a Mad Scientist in Berlin', '2006', '1', null, '6', '2.99', '167', '17.99', 'G', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('294', 'EXPECATIONS NATURAL', 'A Amazing Drama of a Butler And a Husband who must Reach a A Shark in A U-Boat', '2006', '1', null, '5', '4.99', '138', '26.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('295', 'EXPENDABLE STALLION', 'A Amazing Character Study of a Mad Cow And a Squirrel who must Discover a Hunter in A U-Boat', '2006', '1', null, '3', '0.99', '97', '14.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('296', 'EXPRESS LONELY', 'A Boring Drama of a Astronaut And a Boat who must Face a Boat in California', '2006', '1', null, '5', '2.99', '178', '23.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('297', 'EXTRAORDINARY CONQUERER', 'A Stunning Story of a Dog And a Feminist who must Face a Forensic Psychologist in Berlin', '2006', '1', null, '6', '2.99', '122', '29.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('298', 'EYES DRIVING', 'A Thrilling Story of a Cat And a Waitress who must Fight a Explorer in The Outback', '2006', '1', null, '4', '2.99', '172', '13.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('299', 'FACTORY DRAGON', 'A Action-Packed Saga of a Teacher And a Frisbee who must Escape a Lumberjack in The Sahara Desert', '2006', '1', null, '4', '0.99', '144', '9.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('300', 'FALCON VOLUME', 'A Fateful Saga of a Sumo Wrestler And a Hunter who must Redeem a A Shark in New Orleans', '2006', '1', null, '5', '4.99', '102', '21.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('301', 'FAMILY SWEET', 'A Epic Documentary of a Teacher And a Boy who must Escape a Woman in Berlin', '2006', '1', null, '4', '0.99', '155', '24.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('302', 'FANTASIA PARK', 'A Thoughtful Documentary of a Mad Scientist And a A Shark who must Outrace a Feminist in Australia', '2006', '1', null, '5', '2.99', '131', '29.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('303', 'FANTASY TROOPERS', 'A Touching Saga of a Teacher And a Monkey who must Overcome a Secret Agent in A MySQL Convention', '2006', '1', null, '6', '0.99', '58', '27.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('304', 'FARGO GANDHI', 'A Thrilling Reflection of a Pastry Chef And a Crocodile who must Reach a Teacher in The Outback', '2006', '1', null, '3', '2.99', '130', '28.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('305', 'FATAL HAUNTED', 'A Beautiful Drama of a Student And a Secret Agent who must Confront a Dentist in Ancient Japan', '2006', '1', null, '6', '2.99', '91', '24.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('306', 'FEATHERS METAL', 'A Thoughtful Yarn of a Monkey And a Teacher who must Find a Dog in Australia', '2006', '1', null, '3', '0.99', '104', '12.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('307', 'FELLOWSHIP AUTUMN', 'A Lacklusture Reflection of a Dentist And a Hunter who must Meet a Teacher in A Baloon', '2006', '1', null, '6', '4.99', '77', '9.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('308', 'FERRIS MOTHER', 'A Touching Display of a Frisbee And a Frisbee who must Kill a Girl in The Gulf of Mexico', '2006', '1', null, '3', '2.99', '142', '13.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('309', 'FEUD FROGMEN', 'A Brilliant Reflection of a Database Administrator And a Mad Cow who must Chase a Woman in The Canadian Rockies', '2006', '1', null, '6', '0.99', '98', '29.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('310', 'FEVER EMPIRE', 'A Insightful Panorama of a Cat And a Boat who must Defeat a Boat in The Gulf of Mexico', '2006', '1', null, '5', '4.99', '158', '20.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('311', 'FICTION CHRISTMAS', 'A Emotional Yarn of a A Shark And a Student who must Battle a Robot in An Abandoned Mine Shaft', '2006', '1', null, '4', '0.99', '72', '14.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('312', 'FIDDLER LOST', 'A Boring Tale of a Squirrel And a Dog who must Challenge a Madman in The Gulf of Mexico', '2006', '1', null, '4', '4.99', '75', '20.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('313', 'FIDELITY DEVIL', 'A Awe-Inspiring Drama of a Technical Writer And a Composer who must Reach a Pastry Chef in A U-Boat', '2006', '1', null, '5', '4.99', '118', '11.99', 'G', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('314', 'FIGHT JAWBREAKER', 'A Intrepid Panorama of a Womanizer And a Girl who must Escape a Girl in A Manhattan Penthouse', '2006', '1', null, '3', '0.99', '91', '13.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('315', 'FINDING ANACONDA', 'A Fateful Tale of a Database Administrator And a Girl who must Battle a Squirrel in New Orleans', '2006', '1', null, '4', '0.99', '156', '10.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('316', 'FIRE WOLVES', 'A Intrepid Documentary of a Frisbee And a Dog who must Outrace a Lumberjack in Nigeria', '2006', '1', null, '5', '4.99', '173', '18.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('317', 'FIREBALL PHILADELPHIA', 'A Amazing Yarn of a Dentist And a A Shark who must Vanquish a Madman in An Abandoned Mine Shaft', '2006', '1', null, '4', '0.99', '148', '25.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('318', 'FIREHOUSE VIETNAM', 'A Awe-Inspiring Character Study of a Boat And a Boy who must Kill a Pastry Chef in The Sahara Desert', '2006', '1', null, '7', '0.99', '103', '14.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('319', 'FISH OPUS', 'A Touching Display of a Feminist And a Girl who must Confront a Astronaut in Australia', '2006', '1', null, '4', '2.99', '125', '22.99', 'R', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('320', 'FLAMINGOS CONNECTICUT', 'A Fast-Paced Reflection of a Composer And a Composer who must Meet a Cat in The Sahara Desert', '2006', '1', null, '4', '4.99', '80', '28.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('321', 'FLASH WARS', 'A Astounding Saga of a Moose And a Pastry Chef who must Chase a Student in The Gulf of Mexico', '2006', '1', null, '3', '4.99', '123', '21.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('322', 'FLATLINERS KILLER', 'A Taut Display of a Secret Agent And a Waitress who must Sink a Robot in An Abandoned Mine Shaft', '2006', '1', null, '5', '2.99', '100', '29.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('323', 'FLIGHT LIES', 'A Stunning Character Study of a Crocodile And a Pioneer who must Pursue a Teacher in New Orleans', '2006', '1', null, '7', '4.99', '179', '22.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('324', 'FLINTSTONES HAPPINESS', 'A Fateful Story of a Husband And a Moose who must Vanquish a Boy in California', '2006', '1', null, '3', '4.99', '148', '11.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('325', 'FLOATS GARDEN', 'A Action-Packed Epistle of a Robot And a Car who must Chase a Boat in Ancient Japan', '2006', '1', null, '6', '2.99', '145', '29.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('326', 'FLYING HOOK', 'A Thrilling Display of a Mad Cow And a Dog who must Challenge a Frisbee in Nigeria', '2006', '1', null, '6', '2.99', '69', '18.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('327', 'FOOL MOCKINGBIRD', 'A Lacklusture Tale of a Crocodile And a Composer who must Defeat a Madman in A U-Boat', '2006', '1', null, '3', '4.99', '158', '24.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('328', 'FOREVER CANDIDATE', 'A Unbelieveable Panorama of a Technical Writer And a Man who must Pursue a Frisbee in A U-Boat', '2006', '1', null, '7', '2.99', '131', '28.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('329', 'FORREST SONS', 'A Thrilling Documentary of a Forensic Psychologist And a Butler who must Defeat a Explorer in A Jet Boat', '2006', '1', null, '4', '2.99', '63', '15.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('330', 'FORRESTER COMANCHEROS', 'A Fateful Tale of a Squirrel And a Forensic Psychologist who must Redeem a Man in Nigeria', '2006', '1', null, '7', '4.99', '112', '22.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('331', 'FORWARD TEMPLE', 'A Astounding Display of a Forensic Psychologist And a Mad Scientist who must Challenge a Girl in New Orleans', '2006', '1', null, '6', '2.99', '90', '25.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('332', 'FRANKENSTEIN STRANGER', 'A Insightful Character Study of a Feminist And a Pioneer who must Pursue a Pastry Chef in Nigeria', '2006', '1', null, '7', '0.99', '159', '16.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('333', 'FREAKY POCUS', 'A Fast-Paced Documentary of a Pastry Chef And a Crocodile who must Chase a Squirrel in The Gulf of Mexico', '2006', '1', null, '7', '2.99', '126', '16.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('334', 'FREDDY STORM', 'A Intrepid Saga of a Man And a Lumberjack who must Vanquish a Husband in The Outback', '2006', '1', null, '6', '4.99', '65', '21.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('335', 'FREEDOM CLEOPATRA', 'A Emotional Reflection of a Dentist And a Mad Cow who must Face a Squirrel in A Baloon', '2006', '1', null, '5', '0.99', '133', '23.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('336', 'FRENCH HOLIDAY', 'A Thrilling Epistle of a Dog And a Feminist who must Kill a Madman in Berlin', '2006', '1', null, '5', '4.99', '99', '22.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('337', 'FRIDA SLIPPER', 'A Fateful Story of a Lumberjack And a Car who must Escape a Boat in An Abandoned Mine Shaft', '2006', '1', null, '6', '2.99', '73', '11.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('338', 'FRISCO FORREST', 'A Beautiful Documentary of a Woman And a Pioneer who must Pursue a Mad Scientist in A Shark Tank', '2006', '1', null, '6', '4.99', '51', '23.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('339', 'FROGMEN BREAKING', 'A Unbelieveable Yarn of a Mad Scientist And a Cat who must Chase a Lumberjack in Australia', '2006', '1', null, '5', '0.99', '111', '17.99', 'R', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('340', 'FRONTIER CABIN', 'A Emotional Story of a Madman And a Waitress who must Battle a Teacher in An Abandoned Fun House', '2006', '1', null, '6', '4.99', '183', '14.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('341', 'FROST HEAD', 'A Amazing Reflection of a Lumberjack And a Cat who must Discover a Husband in A MySQL Convention', '2006', '1', null, '5', '0.99', '82', '13.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('342', 'FUGITIVE MAGUIRE', 'A Taut Epistle of a Feminist And a Sumo Wrestler who must Battle a Crocodile in Australia', '2006', '1', null, '7', '4.99', '83', '28.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('343', 'FULL FLATLINERS', 'A Beautiful Documentary of a Astronaut And a Moose who must Pursue a Monkey in A Shark Tank', '2006', '1', null, '6', '2.99', '94', '14.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('344', 'FURY MURDER', 'A Lacklusture Reflection of a Boat And a Forensic Psychologist who must Fight a Waitress in A Monastery', '2006', '1', null, '3', '0.99', '178', '28.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('345', 'GABLES METROPOLIS', 'A Fateful Display of a Cat And a Pioneer who must Challenge a Pastry Chef in A Baloon Factory', '2006', '1', null, '3', '0.99', '161', '17.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('346', 'GALAXY SWEETHEARTS', 'A Emotional Reflection of a Womanizer And a Pioneer who must Face a Squirrel in Berlin', '2006', '1', null, '4', '4.99', '128', '13.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('347', 'GAMES BOWFINGER', 'A Astounding Documentary of a Butler And a Explorer who must Challenge a Butler in A Monastery', '2006', '1', null, '7', '4.99', '119', '17.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('348', 'GANDHI KWAI', 'A Thoughtful Display of a Mad Scientist And a Secret Agent who must Chase a Boat in Berlin', '2006', '1', null, '7', '0.99', '86', '9.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('349', 'GANGS PRIDE', 'A Taut Character Study of a Woman And a A Shark who must Confront a Frisbee in Berlin', '2006', '1', null, '4', '2.99', '185', '27.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('350', 'GARDEN ISLAND', 'A Unbelieveable Character Study of a Womanizer And a Madman who must Reach a Man in The Outback', '2006', '1', null, '3', '4.99', '80', '21.99', 'G', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('351', 'GASLIGHT CRUSADE', 'A Amazing Epistle of a Boy And a Astronaut who must Redeem a Man in The Gulf of Mexico', '2006', '1', null, '4', '2.99', '106', '10.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('352', 'GATHERING CALENDAR', 'A Intrepid Tale of a Pioneer And a Moose who must Conquer a Frisbee in A MySQL Convention', '2006', '1', null, '4', '0.99', '176', '22.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('353', 'GENTLEMEN STAGE', 'A Awe-Inspiring Reflection of a Monkey And a Student who must Overcome a Dentist in The First Manned Space Station', '2006', '1', null, '6', '2.99', '125', '22.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('354', 'GHOST GROUNDHOG', 'A Brilliant Panorama of a Madman And a Composer who must Succumb a Car in Ancient India', '2006', '1', null, '6', '4.99', '85', '18.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('355', 'GHOSTBUSTERS ELF', 'A Thoughtful Epistle of a Dog And a Feminist who must Chase a Composer in Berlin', '2006', '1', null, '7', '0.99', '101', '18.99', 'R', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('356', 'GIANT TROOPERS', 'A Fateful Display of a Feminist And a Monkey who must Vanquish a Monkey in The Canadian Rockies', '2006', '1', null, '5', '2.99', '102', '10.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('357', 'GILBERT PELICAN', 'A Fateful Tale of a Man And a Feminist who must Conquer a Crocodile in A Manhattan Penthouse', '2006', '1', null, '7', '0.99', '114', '13.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('358', 'GILMORE BOILED', 'A Unbelieveable Documentary of a Boat And a Husband who must Succumb a Student in A U-Boat', '2006', '1', null, '5', '0.99', '163', '29.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('359', 'GLADIATOR WESTWARD', 'A Astounding Reflection of a Squirrel And a Sumo Wrestler who must Sink a Dentist in Ancient Japan', '2006', '1', null, '6', '4.99', '173', '20.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('360', 'GLASS DYING', 'A Astounding Drama of a Frisbee And a Astronaut who must Fight a Dog in Ancient Japan', '2006', '1', null, '4', '0.99', '103', '24.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('361', 'GLEAMING JAWBREAKER', 'A Amazing Display of a Composer And a Forensic Psychologist who must Discover a Car in The Canadian Rockies', '2006', '1', null, '5', '2.99', '89', '25.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('362', 'GLORY TRACY', 'A Amazing Saga of a Woman And a Womanizer who must Discover a Cat in The First Manned Space Station', '2006', '1', null, '7', '2.99', '115', '13.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('363', 'GO PURPLE', 'A Fast-Paced Display of a Car And a Database Administrator who must Battle a Woman in A Baloon', '2006', '1', null, '3', '0.99', '54', '12.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('364', 'GODFATHER DIARY', 'A Stunning Saga of a Lumberjack And a Squirrel who must Chase a Car in The Outback', '2006', '1', null, '3', '2.99', '73', '14.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('365', 'GOLD RIVER', 'A Taut Documentary of a Database Administrator And a Waitress who must Reach a Mad Scientist in A Baloon Factory', '2006', '1', null, '4', '4.99', '154', '21.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('366', 'GOLDFINGER SENSIBILITY', 'A Insightful Drama of a Mad Scientist And a Hunter who must Defeat a Pastry Chef in New Orleans', '2006', '1', null, '3', '0.99', '93', '29.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('367', 'GOLDMINE TYCOON', 'A Brilliant Epistle of a Composer And a Frisbee who must Conquer a Husband in The Outback', '2006', '1', null, '6', '0.99', '153', '20.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('368', 'GONE TROUBLE', 'A Insightful Character Study of a Mad Cow And a Forensic Psychologist who must Conquer a A Shark in A Manhattan Penthouse', '2006', '1', null, '7', '2.99', '84', '20.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('369', 'GOODFELLAS SALUTE', 'A Unbelieveable Tale of a Dog And a Explorer who must Sink a Mad Cow in A Baloon Factory', '2006', '1', null, '4', '4.99', '56', '22.99', 'PG', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('370', 'GORGEOUS BINGO', 'A Action-Packed Display of a Sumo Wrestler And a Car who must Overcome a Waitress in A Baloon Factory', '2006', '1', null, '4', '2.99', '108', '26.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('371', 'GOSFORD DONNIE', 'A Epic Panorama of a Mad Scientist And a Monkey who must Redeem a Secret Agent in Berlin', '2006', '1', null, '5', '4.99', '129', '17.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('372', 'GRACELAND DYNAMITE', 'A Taut Display of a Cat And a Girl who must Overcome a Database Administrator in New Orleans', '2006', '1', null, '5', '4.99', '140', '26.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('373', 'GRADUATE LORD', 'A Lacklusture Epistle of a Girl And a A Shark who must Meet a Mad Scientist in Ancient China', '2006', '1', null, '7', '2.99', '156', '14.99', 'G', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('374', 'GRAFFITI LOVE', 'A Unbelieveable Epistle of a Sumo Wrestler And a Hunter who must Build a Composer in Berlin', '2006', '1', null, '3', '0.99', '117', '29.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('375', 'GRAIL FRANKENSTEIN', 'A Unbelieveable Saga of a Teacher And a Monkey who must Fight a Girl in An Abandoned Mine Shaft', '2006', '1', null, '4', '2.99', '85', '17.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('376', 'GRAPES FURY', 'A Boring Yarn of a Mad Cow And a Sumo Wrestler who must Meet a Robot in Australia', '2006', '1', null, '4', '0.99', '155', '20.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('377', 'GREASE YOUTH', 'A Emotional Panorama of a Secret Agent And a Waitress who must Escape a Composer in Soviet Georgia', '2006', '1', null, '7', '0.99', '135', '20.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('378', 'GREATEST NORTH', 'A Astounding Character Study of a Secret Agent And a Robot who must Build a A Shark in Berlin', '2006', '1', null, '5', '2.99', '93', '24.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('379', 'GREEDY ROOTS', 'A Amazing Reflection of a A Shark And a Butler who must Chase a Hunter in The Canadian Rockies', '2006', '1', null, '7', '0.99', '166', '14.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('380', 'GREEK EVERYONE', 'A Stunning Display of a Butler And a Teacher who must Confront a A Shark in The First Manned Space Station', '2006', '1', null, '7', '2.99', '176', '11.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('381', 'GRINCH MASSAGE', 'A Intrepid Display of a Madman And a Feminist who must Pursue a Pioneer in The First Manned Space Station', '2006', '1', null, '7', '4.99', '150', '25.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('382', 'GRIT CLOCKWORK', 'A Thoughtful Display of a Dentist And a Squirrel who must Confront a Lumberjack in A Shark Tank', '2006', '1', null, '3', '0.99', '137', '21.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('383', 'GROOVE FICTION', 'A Unbelieveable Reflection of a Moose And a A Shark who must Defeat a Lumberjack in An Abandoned Mine Shaft', '2006', '1', null, '6', '0.99', '111', '13.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('384', 'GROSSE WONDERFUL', 'A Epic Drama of a Cat And a Explorer who must Redeem a Moose in Australia', '2006', '1', null, '5', '4.99', '49', '19.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('385', 'GROUNDHOG UNCUT', 'A Brilliant Panorama of a Astronaut And a Technical Writer who must Discover a Butler in A Manhattan Penthouse', '2006', '1', null, '6', '4.99', '139', '26.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('386', 'GUMP DATE', 'A Intrepid Yarn of a Explorer And a Student who must Kill a Husband in An Abandoned Mine Shaft', '2006', '1', null, '3', '4.99', '53', '12.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('387', 'GUN BONNIE', 'A Boring Display of a Sumo Wrestler And a Husband who must Build a Waitress in The Gulf of Mexico', '2006', '1', null, '7', '0.99', '100', '27.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('388', 'GUNFIGHT MOON', 'A Epic Reflection of a Pastry Chef And a Explorer who must Reach a Dentist in The Sahara Desert', '2006', '1', null, '5', '0.99', '70', '16.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('389', 'GUNFIGHTER MUSSOLINI', 'A Touching Saga of a Robot And a Boy who must Kill a Man in Ancient Japan', '2006', '1', null, '3', '2.99', '127', '9.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('390', 'GUYS FALCON', 'A Boring Story of a Woman And a Feminist who must Redeem a Squirrel in A U-Boat', '2006', '1', null, '4', '4.99', '84', '20.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('391', 'HALF OUTFIELD', 'A Epic Epistle of a Database Administrator And a Crocodile who must Face a Madman in A Jet Boat', '2006', '1', null, '6', '2.99', '146', '25.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('392', 'HALL CASSIDY', 'A Beautiful Panorama of a Pastry Chef And a A Shark who must Battle a Pioneer in Soviet Georgia', '2006', '1', null, '5', '4.99', '51', '13.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('393', 'HALLOWEEN NUTS', 'A Amazing Panorama of a Forensic Psychologist And a Technical Writer who must Fight a Dentist in A U-Boat', '2006', '1', null, '6', '2.99', '47', '19.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('394', 'HAMLET WISDOM', 'A Touching Reflection of a Man And a Man who must Sink a Robot in The Outback', '2006', '1', null, '7', '2.99', '146', '21.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('395', 'HANDICAP BOONDOCK', 'A Beautiful Display of a Pioneer And a Squirrel who must Vanquish a Sumo Wrestler in Soviet Georgia', '2006', '1', null, '4', '0.99', '108', '28.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('396', 'HANGING DEEP', 'A Action-Packed Yarn of a Boat And a Crocodile who must Build a Monkey in Berlin', '2006', '1', null, '5', '4.99', '62', '18.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('397', 'HANKY OCTOBER', 'A Boring Epistle of a Database Administrator And a Explorer who must Pursue a Madman in Soviet Georgia', '2006', '1', null, '5', '2.99', '107', '26.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('398', 'HANOVER GALAXY', 'A Stunning Reflection of a Girl And a Secret Agent who must Succumb a Boy in A MySQL Convention', '2006', '1', null, '5', '4.99', '47', '21.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('399', 'HAPPINESS UNITED', 'A Action-Packed Panorama of a Husband And a Feminist who must Meet a Forensic Psychologist in Ancient Japan', '2006', '1', null, '6', '2.99', '100', '23.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('400', 'HARDLY ROBBERS', 'A Emotional Character Study of a Hunter And a Car who must Kill a Woman in Berlin', '2006', '1', null, '7', '2.99', '72', '15.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('401', 'HAROLD FRENCH', 'A Stunning Saga of a Sumo Wrestler And a Student who must Outrace a Moose in The Sahara Desert', '2006', '1', null, '6', '0.99', '168', '10.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('402', 'HARPER DYING', 'A Awe-Inspiring Reflection of a Woman And a Cat who must Confront a Feminist in The Sahara Desert', '2006', '1', null, '3', '0.99', '52', '15.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('403', 'HARRY IDAHO', 'A Taut Yarn of a Technical Writer And a Feminist who must Outrace a Dog in California', '2006', '1', null, '5', '4.99', '121', '18.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('404', 'HATE HANDICAP', 'A Intrepid Reflection of a Mad Scientist And a Pioneer who must Overcome a Hunter in The First Manned Space Station', '2006', '1', null, '4', '0.99', '107', '26.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('405', 'HAUNTED ANTITRUST', 'A Amazing Saga of a Man And a Dentist who must Reach a Technical Writer in Ancient India', '2006', '1', null, '6', '4.99', '76', '13.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('406', 'HAUNTING PIANIST', 'A Fast-Paced Story of a Database Administrator And a Composer who must Defeat a Squirrel in An Abandoned Amusement Park', '2006', '1', null, '5', '0.99', '181', '22.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('407', 'HAWK CHILL', 'A Action-Packed Drama of a Mad Scientist And a Composer who must Outgun a Car in Australia', '2006', '1', null, '5', '0.99', '47', '12.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('408', 'HEAD STRANGER', 'A Thoughtful Saga of a Hunter And a Crocodile who must Confront a Dog in The Gulf of Mexico', '2006', '1', null, '4', '4.99', '69', '28.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('409', 'HEARTBREAKERS BRIGHT', 'A Awe-Inspiring Documentary of a A Shark And a Dentist who must Outrace a Pastry Chef in The Canadian Rockies', '2006', '1', null, '3', '4.99', '59', '9.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('410', 'HEAVEN FREEDOM', 'A Intrepid Story of a Butler And a Car who must Vanquish a Man in New Orleans', '2006', '1', null, '7', '2.99', '48', '19.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('411', 'HEAVENLY GUN', 'A Beautiful Yarn of a Forensic Psychologist And a Frisbee who must Battle a Moose in A Jet Boat', '2006', '1', null, '5', '4.99', '49', '13.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('412', 'HEAVYWEIGHTS BEAST', 'A Unbelieveable Story of a Composer And a Dog who must Overcome a Womanizer in An Abandoned Amusement Park', '2006', '1', null, '6', '4.99', '102', '25.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('413', 'HEDWIG ALTER', 'A Action-Packed Yarn of a Womanizer And a Lumberjack who must Chase a Sumo Wrestler in A Monastery', '2006', '1', null, '7', '2.99', '169', '16.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('414', 'HELLFIGHTERS SIERRA', 'A Taut Reflection of a A Shark And a Dentist who must Battle a Boat in Soviet Georgia', '2006', '1', null, '3', '2.99', '75', '23.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('415', 'HIGH ENCINO', 'A Fateful Saga of a Waitress And a Hunter who must Outrace a Sumo Wrestler in Australia', '2006', '1', null, '3', '2.99', '84', '23.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('416', 'HIGHBALL POTTER', 'A Action-Packed Saga of a Husband And a Dog who must Redeem a Database Administrator in The Sahara Desert', '2006', '1', null, '6', '0.99', '110', '10.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('417', 'HILLS NEIGHBORS', 'A Epic Display of a Hunter And a Feminist who must Sink a Car in A U-Boat', '2006', '1', null, '5', '0.99', '93', '29.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('418', 'HOBBIT ALIEN', 'A Emotional Drama of a Husband And a Girl who must Outgun a Composer in The First Manned Space Station', '2006', '1', null, '5', '0.99', '157', '27.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('419', 'HOCUS FRIDA', 'A Awe-Inspiring Tale of a Girl And a Madman who must Outgun a Student in A Shark Tank', '2006', '1', null, '4', '2.99', '141', '19.99', 'G', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('420', 'HOLES BRANNIGAN', 'A Fast-Paced Reflection of a Technical Writer And a Student who must Fight a Boy in The Canadian Rockies', '2006', '1', null, '7', '4.99', '128', '27.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('421', 'HOLIDAY GAMES', 'A Insightful Reflection of a Waitress And a Madman who must Pursue a Boy in Ancient Japan', '2006', '1', null, '7', '4.99', '78', '10.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('422', 'HOLLOW JEOPARDY', 'A Beautiful Character Study of a Robot And a Astronaut who must Overcome a Boat in A Monastery', '2006', '1', null, '7', '4.99', '136', '25.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('423', 'HOLLYWOOD ANONYMOUS', 'A Fast-Paced Epistle of a Boy And a Explorer who must Escape a Dog in A U-Boat', '2006', '1', null, '7', '0.99', '69', '29.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('424', 'HOLOCAUST HIGHBALL', 'A Awe-Inspiring Yarn of a Composer And a Man who must Find a Robot in Soviet Georgia', '2006', '1', null, '6', '0.99', '149', '12.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('425', 'HOLY TADPOLE', 'A Action-Packed Display of a Feminist And a Pioneer who must Pursue a Dog in A Baloon Factory', '2006', '1', null, '6', '0.99', '88', '20.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('426', 'HOME PITY', 'A Touching Panorama of a Man And a Secret Agent who must Challenge a Teacher in A MySQL Convention', '2006', '1', null, '7', '4.99', '185', '15.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('427', 'HOMEWARD CIDER', 'A Taut Reflection of a Astronaut And a Squirrel who must Fight a Squirrel in A Manhattan Penthouse', '2006', '1', null, '5', '0.99', '103', '19.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('428', 'HOMICIDE PEACH', 'A Astounding Documentary of a Hunter And a Boy who must Confront a Boy in A MySQL Convention', '2006', '1', null, '6', '2.99', '141', '21.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('429', 'HONEY TIES', 'A Taut Story of a Waitress And a Crocodile who must Outrace a Lumberjack in A Shark Tank', '2006', '1', null, '3', '0.99', '84', '29.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('430', 'HOOK CHARIOTS', 'A Insightful Story of a Boy And a Dog who must Redeem a Boy in Australia', '2006', '1', null, '7', '0.99', '49', '23.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('431', 'HOOSIERS BIRDCAGE', 'A Astounding Display of a Explorer And a Boat who must Vanquish a Car in The First Manned Space Station', '2006', '1', null, '3', '2.99', '176', '12.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('432', 'HOPE TOOTSIE', 'A Amazing Documentary of a Student And a Sumo Wrestler who must Outgun a A Shark in A Shark Tank', '2006', '1', null, '4', '2.99', '139', '22.99', 'NC-17', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('433', 'HORN WORKING', 'A Stunning Display of a Mad Scientist And a Technical Writer who must Succumb a Monkey in A Shark Tank', '2006', '1', null, '4', '2.99', '95', '23.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('434', 'HORROR REIGN', 'A Touching Documentary of a A Shark And a Car who must Build a Husband in Nigeria', '2006', '1', null, '3', '0.99', '139', '25.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('435', 'HOTEL HAPPINESS', 'A Thrilling Yarn of a Pastry Chef And a A Shark who must Challenge a Mad Scientist in The Outback', '2006', '1', null, '6', '4.99', '181', '28.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('436', 'HOURS RAGE', 'A Fateful Story of a Explorer And a Feminist who must Meet a Technical Writer in Soviet Georgia', '2006', '1', null, '4', '0.99', '122', '14.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('437', 'HOUSE DYNAMITE', 'A Taut Story of a Pioneer And a Squirrel who must Battle a Student in Soviet Georgia', '2006', '1', null, '7', '2.99', '109', '13.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('438', 'HUMAN GRAFFITI', 'A Beautiful Reflection of a Womanizer And a Sumo Wrestler who must Chase a Database Administrator in The Gulf of Mexico', '2006', '1', null, '3', '2.99', '68', '22.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('439', 'HUNCHBACK IMPOSSIBLE', 'A Touching Yarn of a Frisbee And a Dentist who must Fight a Composer in Ancient Japan', '2006', '1', null, '4', '4.99', '151', '28.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('440', 'HUNGER ROOF', 'A Unbelieveable Yarn of a Student And a Database Administrator who must Outgun a Husband in An Abandoned Mine Shaft', '2006', '1', null, '6', '0.99', '105', '21.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('441', 'HUNTER ALTER', 'A Emotional Drama of a Mad Cow And a Boat who must Redeem a Secret Agent in A Shark Tank', '2006', '1', null, '5', '2.99', '125', '21.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('442', 'HUNTING MUSKETEERS', 'A Thrilling Reflection of a Pioneer And a Dentist who must Outrace a Womanizer in An Abandoned Mine Shaft', '2006', '1', null, '6', '2.99', '65', '24.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('443', 'HURRICANE AFFAIR', 'A Lacklusture Epistle of a Database Administrator And a Woman who must Meet a Hunter in An Abandoned Mine Shaft', '2006', '1', null, '6', '2.99', '49', '11.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('444', 'HUSTLER PARTY', 'A Emotional Reflection of a Sumo Wrestler And a Monkey who must Conquer a Robot in The Sahara Desert', '2006', '1', null, '3', '4.99', '83', '22.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('445', 'HYDE DOCTOR', 'A Fanciful Documentary of a Boy And a Woman who must Redeem a Womanizer in A Jet Boat', '2006', '1', null, '5', '2.99', '100', '11.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('446', 'HYSTERICAL GRAIL', 'A Amazing Saga of a Madman And a Dentist who must Build a Car in A Manhattan Penthouse', '2006', '1', null, '5', '4.99', '150', '19.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('447', 'ICE CROSSING', 'A Fast-Paced Tale of a Butler And a Moose who must Overcome a Pioneer in A Manhattan Penthouse', '2006', '1', null, '5', '2.99', '131', '28.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('448', 'IDAHO LOVE', 'A Fast-Paced Drama of a Student And a Crocodile who must Meet a Database Administrator in The Outback', '2006', '1', null, '3', '2.99', '172', '25.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('449', 'IDENTITY LOVER', 'A Boring Tale of a Composer And a Mad Cow who must Defeat a Car in The Outback', '2006', '1', null, '4', '2.99', '119', '12.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('450', 'IDOLS SNATCHERS', 'A Insightful Drama of a Car And a Composer who must Fight a Man in A Monastery', '2006', '1', null, '5', '2.99', '84', '29.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('451', 'IGBY MAKER', 'A Epic Documentary of a Hunter And a Dog who must Outgun a Dog in A Baloon Factory', '2006', '1', null, '7', '4.99', '160', '12.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('452', 'ILLUSION AMELIE', 'A Emotional Epistle of a Boat And a Mad Scientist who must Outrace a Robot in An Abandoned Mine Shaft', '2006', '1', null, '4', '0.99', '122', '15.99', 'R', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('453', 'IMAGE PRINCESS', 'A Lacklusture Panorama of a Secret Agent And a Crocodile who must Discover a Madman in The Canadian Rockies', '2006', '1', null, '3', '2.99', '178', '17.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('454', 'IMPACT ALADDIN', 'A Epic Character Study of a Frisbee And a Moose who must Outgun a Technical Writer in A Shark Tank', '2006', '1', null, '6', '0.99', '180', '20.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('455', 'IMPOSSIBLE PREJUDICE', 'A Awe-Inspiring Yarn of a Monkey And a Hunter who must Chase a Teacher in Ancient China', '2006', '1', null, '7', '4.99', '103', '11.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('456', 'INCH JET', 'A Fateful Saga of a Womanizer And a Student who must Defeat a Butler in A Monastery', '2006', '1', null, '6', '4.99', '167', '18.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('457', 'INDEPENDENCE HOTEL', 'A Thrilling Tale of a Technical Writer And a Boy who must Face a Pioneer in A Monastery', '2006', '1', null, '5', '0.99', '157', '21.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('458', 'INDIAN LOVE', 'A Insightful Saga of a Mad Scientist And a Mad Scientist who must Kill a Astronaut in An Abandoned Fun House', '2006', '1', null, '4', '0.99', '135', '26.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('459', 'INFORMER DOUBLE', 'A Action-Packed Display of a Woman And a Dentist who must Redeem a Forensic Psychologist in The Canadian Rockies', '2006', '1', null, '4', '4.99', '74', '23.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('460', 'INNOCENT USUAL', 'A Beautiful Drama of a Pioneer And a Crocodile who must Challenge a Student in The Outback', '2006', '1', null, '3', '4.99', '178', '26.99', 'PG-13', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('461', 'INSECTS STONE', 'A Epic Display of a Butler And a Dog who must Vanquish a Crocodile in A Manhattan Penthouse', '2006', '1', null, '3', '0.99', '123', '14.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('462', 'INSIDER ARIZONA', 'A Astounding Saga of a Mad Scientist And a Hunter who must Pursue a Robot in A Baloon Factory', '2006', '1', null, '5', '2.99', '78', '17.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('463', 'INSTINCT AIRPORT', 'A Touching Documentary of a Mad Cow And a Explorer who must Confront a Butler in A Manhattan Penthouse', '2006', '1', null, '4', '2.99', '116', '21.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('464', 'INTENTIONS EMPIRE', 'A Astounding Epistle of a Cat And a Cat who must Conquer a Mad Cow in A U-Boat', '2006', '1', null, '3', '2.99', '107', '13.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('465', 'INTERVIEW LIAISONS', 'A Action-Packed Reflection of a Student And a Butler who must Discover a Database Administrator in A Manhattan Penthouse', '2006', '1', null, '4', '4.99', '59', '17.99', 'R', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('466', 'INTOLERABLE INTENTIONS', 'A Awe-Inspiring Story of a Monkey And a Pastry Chef who must Succumb a Womanizer in A MySQL Convention', '2006', '1', null, '6', '4.99', '63', '20.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('467', 'INTRIGUE WORST', 'A Fanciful Character Study of a Explorer And a Mad Scientist who must Vanquish a Squirrel in A Jet Boat', '2006', '1', null, '6', '0.99', '181', '10.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('468', 'INVASION CYCLONE', 'A Lacklusture Character Study of a Mad Scientist And a Womanizer who must Outrace a Explorer in A Monastery', '2006', '1', null, '5', '2.99', '97', '12.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('469', 'IRON MOON', 'A Fast-Paced Documentary of a Mad Cow And a Boy who must Pursue a Dentist in A Baloon', '2006', '1', null, '7', '4.99', '46', '27.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('470', 'ISHTAR ROCKETEER', 'A Astounding Saga of a Dog And a Squirrel who must Conquer a Dog in An Abandoned Fun House', '2006', '1', null, '4', '4.99', '79', '24.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('471', 'ISLAND EXORCIST', 'A Fanciful Panorama of a Technical Writer And a Boy who must Find a Dentist in An Abandoned Fun House', '2006', '1', null, '7', '2.99', '84', '23.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('472', 'ITALIAN AFRICAN', 'A Astounding Character Study of a Monkey And a Moose who must Outgun a Cat in A U-Boat', '2006', '1', null, '3', '4.99', '174', '24.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('473', 'JACKET FRISCO', 'A Insightful Reflection of a Womanizer And a Husband who must Conquer a Pastry Chef in A Baloon', '2006', '1', null, '5', '2.99', '181', '16.99', 'PG-13', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('474', 'JADE BUNCH', 'A Insightful Panorama of a Squirrel And a Mad Cow who must Confront a Student in The First Manned Space Station', '2006', '1', null, '6', '2.99', '174', '21.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('475', 'JAPANESE RUN', 'A Awe-Inspiring Epistle of a Feminist And a Girl who must Sink a Girl in The Outback', '2006', '1', null, '6', '0.99', '135', '29.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('476', 'JASON TRAP', 'A Thoughtful Tale of a Woman And a A Shark who must Conquer a Dog in A Monastery', '2006', '1', null, '5', '2.99', '130', '9.99', 'NC-17', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('477', 'JAWBREAKER BROOKLYN', 'A Stunning Reflection of a Boat And a Pastry Chef who must Succumb a A Shark in A Jet Boat', '2006', '1', null, '5', '0.99', '118', '15.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('478', 'JAWS HARRY', 'A Thrilling Display of a Database Administrator And a Monkey who must Overcome a Dog in An Abandoned Fun House', '2006', '1', null, '4', '2.99', '112', '10.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('479', 'JEDI BENEATH', 'A Astounding Reflection of a Explorer And a Dentist who must Pursue a Student in Nigeria', '2006', '1', null, '7', '0.99', '128', '12.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('480', 'JEEPERS WEDDING', 'A Astounding Display of a Composer And a Dog who must Kill a Pastry Chef in Soviet Georgia', '2006', '1', null, '3', '2.99', '84', '29.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('481', 'JEKYLL FROGMEN', 'A Fanciful Epistle of a Student And a Astronaut who must Kill a Waitress in A Shark Tank', '2006', '1', null, '4', '2.99', '58', '22.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('482', 'JEOPARDY ENCINO', 'A Boring Panorama of a Man And a Mad Cow who must Face a Explorer in Ancient India', '2006', '1', null, '3', '0.99', '102', '12.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('483', 'JERICHO MULAN', 'A Amazing Yarn of a Hunter And a Butler who must Defeat a Boy in A Jet Boat', '2006', '1', null, '3', '2.99', '171', '29.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('484', 'JERK PAYCHECK', 'A Touching Character Study of a Pastry Chef And a Database Administrator who must Reach a A Shark in Ancient Japan', '2006', '1', null, '3', '2.99', '172', '13.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('485', 'JERSEY SASSY', 'A Lacklusture Documentary of a Madman And a Mad Cow who must Find a Feminist in Ancient Japan', '2006', '1', null, '6', '4.99', '60', '16.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('486', 'JET NEIGHBORS', 'A Amazing Display of a Lumberjack And a Teacher who must Outrace a Woman in A U-Boat', '2006', '1', null, '7', '4.99', '59', '14.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('487', 'JINGLE SAGEBRUSH', 'A Epic Character Study of a Feminist And a Student who must Meet a Woman in A Baloon', '2006', '1', null, '6', '4.99', '124', '29.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('488', 'JOON NORTHWEST', 'A Thrilling Panorama of a Technical Writer And a Car who must Discover a Forensic Psychologist in A Shark Tank', '2006', '1', null, '3', '0.99', '105', '23.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('489', 'JUGGLER HARDLY', 'A Epic Story of a Mad Cow And a Astronaut who must Challenge a Car in California', '2006', '1', null, '4', '0.99', '54', '14.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('490', 'JUMANJI BLADE', 'A Intrepid Yarn of a Husband And a Womanizer who must Pursue a Mad Scientist in New Orleans', '2006', '1', null, '4', '2.99', '121', '13.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('491', 'JUMPING WRATH', 'A Touching Epistle of a Monkey And a Feminist who must Discover a Boat in Berlin', '2006', '1', null, '4', '0.99', '74', '18.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('492', 'JUNGLE CLOSER', 'A Boring Character Study of a Boy And a Woman who must Battle a Astronaut in Australia', '2006', '1', null, '6', '0.99', '134', '11.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('493', 'KANE EXORCIST', 'A Epic Documentary of a Composer And a Robot who must Overcome a Car in Berlin', '2006', '1', null, '5', '0.99', '92', '18.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('494', 'KARATE MOON', 'A Astounding Yarn of a Womanizer And a Dog who must Reach a Waitress in A MySQL Convention', '2006', '1', null, '4', '0.99', '120', '21.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('495', 'KENTUCKIAN GIANT', 'A Stunning Yarn of a Woman And a Frisbee who must Escape a Waitress in A U-Boat', '2006', '1', null, '5', '2.99', '169', '10.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('496', 'KICK SAVANNAH', 'A Emotional Drama of a Monkey And a Robot who must Defeat a Monkey in New Orleans', '2006', '1', null, '3', '0.99', '179', '10.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('497', 'KILL BROTHERHOOD', 'A Touching Display of a Hunter And a Secret Agent who must Redeem a Husband in The Outback', '2006', '1', null, '4', '0.99', '54', '15.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('498', 'KILLER INNOCENT', 'A Fanciful Character Study of a Student And a Explorer who must Succumb a Composer in An Abandoned Mine Shaft', '2006', '1', null, '7', '2.99', '161', '11.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('499', 'KING EVOLUTION', 'A Action-Packed Tale of a Boy And a Lumberjack who must Chase a Madman in A Baloon', '2006', '1', null, '3', '4.99', '184', '24.99', 'NC-17', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('500', 'KISS GLORY', 'A Lacklusture Reflection of a Girl And a Husband who must Find a Robot in The Canadian Rockies', '2006', '1', null, '5', '4.99', '163', '11.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('501', 'KISSING DOLLS', 'A Insightful Reflection of a Pioneer And a Teacher who must Build a Composer in The First Manned Space Station', '2006', '1', null, '3', '4.99', '141', '9.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('502', 'KNOCK WARLOCK', 'A Unbelieveable Story of a Teacher And a Boat who must Confront a Moose in A Baloon', '2006', '1', null, '4', '2.99', '71', '21.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('503', 'KRAMER CHOCOLATE', 'A Amazing Yarn of a Robot And a Pastry Chef who must Redeem a Mad Scientist in The Outback', '2006', '1', null, '3', '2.99', '171', '24.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('504', 'KWAI HOMEWARD', 'A Amazing Drama of a Car And a Squirrel who must Pursue a Car in Soviet Georgia', '2006', '1', null, '5', '0.99', '46', '25.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('505', 'LABYRINTH LEAGUE', 'A Awe-Inspiring Saga of a Composer And a Frisbee who must Succumb a Pioneer in The Sahara Desert', '2006', '1', null, '6', '2.99', '46', '24.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('506', 'LADY STAGE', 'A Beautiful Character Study of a Woman And a Man who must Pursue a Explorer in A U-Boat', '2006', '1', null, '4', '4.99', '67', '14.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('507', 'LADYBUGS ARMAGEDDON', 'A Fateful Reflection of a Dog And a Mad Scientist who must Meet a Mad Scientist in New Orleans', '2006', '1', null, '4', '0.99', '113', '13.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('508', 'LAMBS CINCINATTI', 'A Insightful Story of a Man And a Feminist who must Fight a Composer in Australia', '2006', '1', null, '6', '4.99', '144', '18.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('509', 'LANGUAGE COWBOY', 'A Epic Yarn of a Cat And a Madman who must Vanquish a Dentist in An Abandoned Amusement Park', '2006', '1', null, '5', '0.99', '78', '26.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('510', 'LAWLESS VISION', 'A Insightful Yarn of a Boy And a Sumo Wrestler who must Outgun a Car in The Outback', '2006', '1', null, '6', '4.99', '181', '29.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('511', 'LAWRENCE LOVE', 'A Fanciful Yarn of a Database Administrator And a Mad Cow who must Pursue a Womanizer in Berlin', '2006', '1', null, '7', '0.99', '175', '23.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('512', 'LEAGUE HELLFIGHTERS', 'A Thoughtful Saga of a A Shark And a Monkey who must Outgun a Student in Ancient China', '2006', '1', null, '5', '4.99', '110', '25.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('513', 'LEATHERNECKS DWARFS', 'A Fateful Reflection of a Dog And a Mad Cow who must Outrace a Teacher in An Abandoned Mine Shaft', '2006', '1', null, '6', '2.99', '153', '21.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('514', 'LEBOWSKI SOLDIERS', 'A Beautiful Epistle of a Secret Agent And a Pioneer who must Chase a Astronaut in Ancient China', '2006', '1', null, '6', '2.99', '69', '17.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('515', 'LEGALLY SECRETARY', 'A Astounding Tale of a A Shark And a Moose who must Meet a Womanizer in The Sahara Desert', '2006', '1', null, '7', '4.99', '113', '14.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('516', 'LEGEND JEDI', 'A Awe-Inspiring Epistle of a Pioneer And a Student who must Outgun a Crocodile in The Outback', '2006', '1', null, '7', '0.99', '59', '18.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('517', 'LESSON CLEOPATRA', 'A Emotional Display of a Man And a Explorer who must Build a Boy in A Manhattan Penthouse', '2006', '1', null, '3', '0.99', '167', '28.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('518', 'LIAISONS SWEET', 'A Boring Drama of a A Shark And a Explorer who must Redeem a Waitress in The Canadian Rockies', '2006', '1', null, '5', '4.99', '140', '15.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('519', 'LIBERTY MAGNIFICENT', 'A Boring Drama of a Student And a Cat who must Sink a Technical Writer in A Baloon', '2006', '1', null, '3', '2.99', '138', '27.99', 'G', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('520', 'LICENSE WEEKEND', 'A Insightful Story of a Man And a Husband who must Overcome a Madman in A Monastery', '2006', '1', null, '7', '2.99', '91', '28.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('521', 'LIES TREATMENT', 'A Fast-Paced Character Study of a Dentist And a Moose who must Defeat a Composer in The First Manned Space Station', '2006', '1', null, '7', '4.99', '147', '28.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('522', 'LIFE TWISTED', 'A Thrilling Reflection of a Teacher And a Composer who must Find a Man in The First Manned Space Station', '2006', '1', null, '4', '2.99', '137', '9.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('523', 'LIGHTS DEER', 'A Unbelieveable Epistle of a Dog And a Woman who must Confront a Moose in The Gulf of Mexico', '2006', '1', null, '7', '0.99', '174', '21.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('524', 'LION UNCUT', 'A Intrepid Display of a Pastry Chef And a Cat who must Kill a A Shark in Ancient China', '2006', '1', null, '6', '0.99', '50', '13.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('525', 'LOATHING LEGALLY', 'A Boring Epistle of a Pioneer And a Mad Scientist who must Escape a Frisbee in The Gulf of Mexico', '2006', '1', null, '4', '0.99', '140', '29.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('526', 'LOCK REAR', 'A Thoughtful Character Study of a Squirrel And a Technical Writer who must Outrace a Student in Ancient Japan', '2006', '1', null, '7', '2.99', '120', '10.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('527', 'LOLA AGENT', 'A Astounding Tale of a Mad Scientist And a Husband who must Redeem a Database Administrator in Ancient Japan', '2006', '1', null, '4', '4.99', '85', '24.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('528', 'LOLITA WORLD', 'A Thrilling Drama of a Girl And a Robot who must Redeem a Waitress in An Abandoned Mine Shaft', '2006', '1', null, '4', '2.99', '155', '25.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('529', 'LONELY ELEPHANT', 'A Intrepid Story of a Student And a Dog who must Challenge a Explorer in Soviet Georgia', '2006', '1', null, '3', '2.99', '67', '12.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('530', 'LORD ARIZONA', 'A Action-Packed Display of a Frisbee And a Pastry Chef who must Pursue a Crocodile in A Jet Boat', '2006', '1', null, '5', '2.99', '108', '27.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('531', 'LOSE INCH', 'A Stunning Reflection of a Student And a Technical Writer who must Battle a Butler in The First Manned Space Station', '2006', '1', null, '3', '0.99', '137', '18.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('532', 'LOSER HUSTLER', 'A Stunning Drama of a Robot And a Feminist who must Outgun a Butler in Nigeria', '2006', '1', null, '5', '4.99', '80', '28.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('533', 'LOST BIRD', 'A Emotional Character Study of a Robot And a A Shark who must Defeat a Technical Writer in A Manhattan Penthouse', '2006', '1', null, '4', '2.99', '98', '21.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('534', 'LOUISIANA HARRY', 'A Lacklusture Drama of a Girl And a Technical Writer who must Redeem a Monkey in A Shark Tank', '2006', '1', null, '5', '0.99', '70', '18.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('535', 'LOVE SUICIDES', 'A Brilliant Panorama of a Hunter And a Explorer who must Pursue a Dentist in An Abandoned Fun House', '2006', '1', null, '6', '0.99', '181', '21.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('536', 'LOVELY JINGLE', 'A Fanciful Yarn of a Crocodile And a Forensic Psychologist who must Discover a Crocodile in The Outback', '2006', '1', null, '3', '2.99', '65', '18.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('537', 'LOVER TRUMAN', 'A Emotional Yarn of a Robot And a Boy who must Outgun a Technical Writer in A U-Boat', '2006', '1', null, '3', '2.99', '75', '29.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('538', 'LOVERBOY ATTACKS', 'A Boring Story of a Car And a Butler who must Build a Girl in Soviet Georgia', '2006', '1', null, '7', '0.99', '162', '19.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('539', 'LUCK OPUS', 'A Boring Display of a Moose And a Squirrel who must Outrace a Teacher in A Shark Tank', '2006', '1', null, '7', '2.99', '152', '21.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('540', 'LUCKY FLYING', 'A Lacklusture Character Study of a A Shark And a Man who must Find a Forensic Psychologist in A U-Boat', '2006', '1', null, '7', '2.99', '97', '10.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('541', 'LUKE MUMMY', 'A Taut Character Study of a Boy And a Robot who must Redeem a Mad Scientist in Ancient India', '2006', '1', null, '5', '2.99', '74', '21.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('542', 'LUST LOCK', 'A Fanciful Panorama of a Hunter And a Dentist who must Meet a Secret Agent in The Sahara Desert', '2006', '1', null, '3', '2.99', '52', '28.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('543', 'MADIGAN DORADO', 'A Astounding Character Study of a A Shark And a A Shark who must Discover a Crocodile in The Outback', '2006', '1', null, '5', '4.99', '116', '20.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('544', 'MADISON TRAP', 'A Awe-Inspiring Reflection of a Monkey And a Dentist who must Overcome a Pioneer in A U-Boat', '2006', '1', null, '4', '2.99', '147', '11.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('545', 'MADNESS ATTACKS', 'A Fanciful Tale of a Squirrel And a Boat who must Defeat a Crocodile in The Gulf of Mexico', '2006', '1', null, '4', '0.99', '178', '14.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('546', 'MADRE GABLES', 'A Intrepid Panorama of a Sumo Wrestler And a Forensic Psychologist who must Discover a Moose in The First Manned Space Station', '2006', '1', null, '7', '2.99', '98', '27.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('547', 'MAGIC MALLRATS', 'A Touching Documentary of a Pastry Chef And a Pastry Chef who must Build a Mad Scientist in California', '2006', '1', null, '3', '0.99', '117', '19.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('548', 'MAGNIFICENT CHITTY', 'A Insightful Story of a Teacher And a Hunter who must Face a Mad Cow in California', '2006', '1', null, '3', '2.99', '53', '27.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('549', 'MAGNOLIA FORRESTER', 'A Thoughtful Documentary of a Composer And a Explorer who must Conquer a Dentist in New Orleans', '2006', '1', null, '4', '0.99', '171', '28.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('550', 'MAGUIRE APACHE', 'A Fast-Paced Reflection of a Waitress And a Hunter who must Defeat a Forensic Psychologist in A Baloon', '2006', '1', null, '6', '2.99', '74', '22.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('551', 'MAIDEN HOME', 'A Lacklusture Saga of a Moose And a Teacher who must Kill a Forensic Psychologist in A MySQL Convention', '2006', '1', null, '3', '4.99', '138', '9.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('552', 'MAJESTIC FLOATS', 'A Thrilling Character Study of a Moose And a Student who must Escape a Butler in The First Manned Space Station', '2006', '1', null, '5', '0.99', '130', '15.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('553', 'MAKER GABLES', 'A Stunning Display of a Moose And a Database Administrator who must Pursue a Composer in A Jet Boat', '2006', '1', null, '4', '0.99', '136', '12.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('554', 'MALKOVICH PET', 'A Intrepid Reflection of a Waitress And a A Shark who must Kill a Squirrel in The Outback', '2006', '1', null, '6', '2.99', '159', '22.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('555', 'MALLRATS UNITED', 'A Thrilling Yarn of a Waitress And a Dentist who must Find a Hunter in A Monastery', '2006', '1', null, '4', '0.99', '133', '25.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('556', 'MALTESE HOPE', 'A Fast-Paced Documentary of a Crocodile And a Sumo Wrestler who must Conquer a Explorer in California', '2006', '1', null, '6', '4.99', '127', '26.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('557', 'MANCHURIAN CURTAIN', 'A Stunning Tale of a Mad Cow And a Boy who must Battle a Boy in Berlin', '2006', '1', null, '5', '2.99', '177', '27.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('558', 'MANNEQUIN WORST', 'A Astounding Saga of a Mad Cow And a Pastry Chef who must Discover a Husband in Ancient India', '2006', '1', null, '3', '2.99', '71', '18.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('559', 'MARRIED GO', 'A Fanciful Story of a Womanizer And a Dog who must Face a Forensic Psychologist in The Sahara Desert', '2006', '1', null, '7', '2.99', '114', '22.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('560', 'MARS ROMAN', 'A Boring Drama of a Car And a Dog who must Succumb a Madman in Soviet Georgia', '2006', '1', null, '6', '0.99', '62', '21.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('561', 'MASK PEACH', 'A Boring Character Study of a Student And a Robot who must Meet a Woman in California', '2006', '1', null, '6', '2.99', '123', '26.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('562', 'MASKED BUBBLE', 'A Fanciful Documentary of a Pioneer And a Boat who must Pursue a Pioneer in An Abandoned Mine Shaft', '2006', '1', null, '6', '0.99', '151', '12.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('563', 'MASSACRE USUAL', 'A Fateful Reflection of a Waitress And a Crocodile who must Challenge a Forensic Psychologist in California', '2006', '1', null, '6', '4.99', '165', '16.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('564', 'MASSAGE IMAGE', 'A Fateful Drama of a Frisbee And a Crocodile who must Vanquish a Dog in The First Manned Space Station', '2006', '1', null, '4', '2.99', '161', '11.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('565', 'MATRIX SNOWMAN', 'A Action-Packed Saga of a Womanizer And a Woman who must Overcome a Student in California', '2006', '1', null, '6', '4.99', '56', '9.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('566', 'MAUDE MOD', 'A Beautiful Documentary of a Forensic Psychologist And a Cat who must Reach a Astronaut in Nigeria', '2006', '1', null, '6', '0.99', '72', '20.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('567', 'MEET CHOCOLATE', 'A Boring Documentary of a Dentist And a Butler who must Confront a Monkey in A MySQL Convention', '2006', '1', null, '3', '2.99', '80', '26.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('568', 'MEMENTO ZOOLANDER', 'A Touching Epistle of a Squirrel And a Explorer who must Redeem a Pastry Chef in The Sahara Desert', '2006', '1', null, '4', '4.99', '77', '11.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('569', 'MENAGERIE RUSHMORE', 'A Unbelieveable Panorama of a Composer And a Butler who must Overcome a Database Administrator in The First Manned Space Station', '2006', '1', null, '7', '2.99', '147', '18.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('570', 'MERMAID INSECTS', 'A Lacklusture Drama of a Waitress And a Husband who must Fight a Husband in California', '2006', '1', null, '5', '4.99', '104', '20.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('571', 'METAL ARMAGEDDON', 'A Thrilling Display of a Lumberjack And a Crocodile who must Meet a Monkey in A Baloon Factory', '2006', '1', null, '6', '2.99', '161', '26.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('572', 'METROPOLIS COMA', 'A Emotional Saga of a Database Administrator And a Pastry Chef who must Confront a Teacher in A Baloon Factory', '2006', '1', null, '4', '2.99', '64', '9.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('573', 'MICROCOSMOS PARADISE', 'A Touching Character Study of a Boat And a Student who must Sink a A Shark in Nigeria', '2006', '1', null, '6', '2.99', '105', '22.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('574', 'MIDNIGHT WESTWARD', 'A Taut Reflection of a Husband And a A Shark who must Redeem a Pastry Chef in A Monastery', '2006', '1', null, '3', '0.99', '86', '19.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('575', 'MIDSUMMER GROUNDHOG', 'A Fateful Panorama of a Moose And a Dog who must Chase a Crocodile in Ancient Japan', '2006', '1', null, '3', '4.99', '48', '27.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('576', 'MIGHTY LUCK', 'A Astounding Epistle of a Mad Scientist And a Pioneer who must Escape a Database Administrator in A MySQL Convention', '2006', '1', null, '7', '2.99', '122', '13.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('577', 'MILE MULAN', 'A Lacklusture Epistle of a Cat And a Husband who must Confront a Boy in A MySQL Convention', '2006', '1', null, '4', '0.99', '64', '10.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('578', 'MILLION ACE', 'A Brilliant Documentary of a Womanizer And a Squirrel who must Find a Technical Writer in The Sahara Desert', '2006', '1', null, '4', '4.99', '142', '16.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('579', 'MINDS TRUMAN', 'A Taut Yarn of a Mad Scientist And a Crocodile who must Outgun a Database Administrator in A Monastery', '2006', '1', null, '3', '4.99', '149', '22.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('580', 'MINE TITANS', 'A Amazing Yarn of a Robot And a Womanizer who must Discover a Forensic Psychologist in Berlin', '2006', '1', null, '3', '4.99', '166', '12.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('581', 'MINORITY KISS', 'A Insightful Display of a Lumberjack And a Sumo Wrestler who must Meet a Man in The Outback', '2006', '1', null, '4', '0.99', '59', '16.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('582', 'MIRACLE VIRTUAL', 'A Touching Epistle of a Butler And a Boy who must Find a Mad Scientist in The Sahara Desert', '2006', '1', null, '3', '2.99', '162', '19.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('583', 'MISSION ZOOLANDER', 'A Intrepid Story of a Sumo Wrestler And a Teacher who must Meet a A Shark in An Abandoned Fun House', '2006', '1', null, '3', '4.99', '164', '26.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('584', 'MIXED DOORS', 'A Taut Drama of a Womanizer And a Lumberjack who must Succumb a Pioneer in Ancient India', '2006', '1', null, '6', '2.99', '180', '26.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('585', 'MOB DUFFEL', 'A Unbelieveable Documentary of a Frisbee And a Boat who must Meet a Boy in The Canadian Rockies', '2006', '1', null, '4', '0.99', '105', '25.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('586', 'MOCKINGBIRD HOLLYWOOD', 'A Thoughtful Panorama of a Man And a Car who must Sink a Composer in Berlin', '2006', '1', null, '4', '0.99', '60', '27.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('587', 'MOD SECRETARY', 'A Boring Documentary of a Mad Cow And a Cat who must Build a Lumberjack in New Orleans', '2006', '1', null, '6', '4.99', '77', '20.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('588', 'MODEL FISH', 'A Beautiful Panorama of a Boat And a Crocodile who must Outrace a Dog in Australia', '2006', '1', null, '4', '4.99', '175', '11.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('589', 'MODERN DORADO', 'A Awe-Inspiring Story of a Butler And a Sumo Wrestler who must Redeem a Boy in New Orleans', '2006', '1', null, '3', '0.99', '74', '20.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('590', 'MONEY HAROLD', 'A Touching Tale of a Explorer And a Boat who must Defeat a Robot in Australia', '2006', '1', null, '3', '2.99', '135', '17.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('591', 'MONSOON CAUSE', 'A Astounding Tale of a Crocodile And a Car who must Outrace a Squirrel in A U-Boat', '2006', '1', null, '6', '4.99', '182', '20.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('592', 'MONSTER SPARTACUS', 'A Fast-Paced Story of a Waitress And a Cat who must Fight a Girl in Australia', '2006', '1', null, '6', '2.99', '107', '28.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('593', 'MONTEREY LABYRINTH', 'A Awe-Inspiring Drama of a Monkey And a Composer who must Escape a Feminist in A U-Boat', '2006', '1', null, '6', '0.99', '158', '13.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('594', 'MONTEZUMA COMMAND', 'A Thrilling Reflection of a Waitress And a Butler who must Battle a Butler in A Jet Boat', '2006', '1', null, '6', '0.99', '126', '22.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('595', 'MOON BUNCH', 'A Beautiful Tale of a Astronaut And a Mad Cow who must Challenge a Cat in A Baloon Factory', '2006', '1', null, '7', '0.99', '83', '20.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('596', 'MOONSHINE CABIN', 'A Thoughtful Display of a Astronaut And a Feminist who must Chase a Frisbee in A Jet Boat', '2006', '1', null, '4', '4.99', '171', '25.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('597', 'MOONWALKER FOOL', 'A Epic Drama of a Feminist And a Pioneer who must Sink a Composer in New Orleans', '2006', '1', null, '5', '4.99', '184', '12.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('598', 'MOSQUITO ARMAGEDDON', 'A Thoughtful Character Study of a Waitress And a Feminist who must Build a Teacher in Ancient Japan', '2006', '1', null, '6', '0.99', '57', '22.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('599', 'MOTHER OLEANDER', 'A Boring Tale of a Husband And a Boy who must Fight a Squirrel in Ancient China', '2006', '1', null, '3', '0.99', '103', '20.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('600', 'MOTIONS DETAILS', 'A Awe-Inspiring Reflection of a Dog And a Student who must Kill a Car in An Abandoned Fun House', '2006', '1', null, '5', '0.99', '166', '16.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('601', 'MOULIN WAKE', 'A Astounding Story of a Forensic Psychologist And a Cat who must Battle a Teacher in An Abandoned Mine Shaft', '2006', '1', null, '4', '0.99', '79', '20.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('602', 'MOURNING PURPLE', 'A Lacklusture Display of a Waitress And a Lumberjack who must Chase a Pioneer in New Orleans', '2006', '1', null, '5', '0.99', '146', '14.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('603', 'MOVIE SHAKESPEARE', 'A Insightful Display of a Database Administrator And a Student who must Build a Hunter in Berlin', '2006', '1', null, '6', '4.99', '53', '27.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('604', 'MULAN MOON', 'A Emotional Saga of a Womanizer And a Pioneer who must Overcome a Dentist in A Baloon', '2006', '1', null, '4', '0.99', '160', '10.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('605', 'MULHOLLAND BEAST', 'A Awe-Inspiring Display of a Husband And a Squirrel who must Battle a Sumo Wrestler in A Jet Boat', '2006', '1', null, '7', '2.99', '157', '13.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('606', 'MUMMY CREATURES', 'A Fateful Character Study of a Crocodile And a Monkey who must Meet a Dentist in Australia', '2006', '1', null, '3', '0.99', '160', '15.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('607', 'MUPPET MILE', 'A Lacklusture Story of a Madman And a Teacher who must Kill a Frisbee in The Gulf of Mexico', '2006', '1', null, '5', '4.99', '50', '18.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('608', 'MURDER ANTITRUST', 'A Brilliant Yarn of a Car And a Database Administrator who must Escape a Boy in A MySQL Convention', '2006', '1', null, '6', '2.99', '166', '11.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('609', 'MUSCLE BRIGHT', 'A Stunning Panorama of a Sumo Wrestler And a Husband who must Redeem a Madman in Ancient India', '2006', '1', null, '7', '2.99', '185', '23.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('610', 'MUSIC BOONDOCK', 'A Thrilling Tale of a Butler And a Astronaut who must Battle a Explorer in The First Manned Space Station', '2006', '1', null, '7', '0.99', '129', '17.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('611', 'MUSKETEERS WAIT', 'A Touching Yarn of a Student And a Moose who must Fight a Mad Cow in Australia', '2006', '1', null, '7', '4.99', '73', '17.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('612', 'MUSSOLINI SPOILERS', 'A Thrilling Display of a Boat And a Monkey who must Meet a Composer in Ancient China', '2006', '1', null, '6', '2.99', '180', '10.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('613', 'MYSTIC TRUMAN', 'A Epic Yarn of a Teacher And a Hunter who must Outgun a Explorer in Soviet Georgia', '2006', '1', null, '5', '0.99', '92', '19.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('614', 'NAME DETECTIVE', 'A Touching Saga of a Sumo Wrestler And a Cat who must Pursue a Mad Scientist in Nigeria', '2006', '1', null, '5', '4.99', '178', '11.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('615', 'NASH CHOCOLAT', 'A Epic Reflection of a Monkey And a Mad Cow who must Kill a Forensic Psychologist in An Abandoned Mine Shaft', '2006', '1', null, '6', '2.99', '180', '21.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('616', 'NATIONAL STORY', 'A Taut Epistle of a Mad Scientist And a Girl who must Escape a Monkey in California', '2006', '1', null, '4', '2.99', '92', '19.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('617', 'NATURAL STOCK', 'A Fast-Paced Story of a Sumo Wrestler And a Girl who must Defeat a Car in A Baloon Factory', '2006', '1', null, '4', '0.99', '50', '24.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('618', 'NECKLACE OUTBREAK', 'A Astounding Epistle of a Database Administrator And a Mad Scientist who must Pursue a Cat in California', '2006', '1', null, '3', '0.99', '132', '21.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('619', 'NEIGHBORS CHARADE', 'A Fanciful Reflection of a Crocodile And a Astronaut who must Outrace a Feminist in An Abandoned Amusement Park', '2006', '1', null, '3', '0.99', '161', '20.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('620', 'NEMO CAMPUS', 'A Lacklusture Reflection of a Monkey And a Squirrel who must Outrace a Womanizer in A Manhattan Penthouse', '2006', '1', null, '5', '2.99', '131', '23.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('621', 'NETWORK PEAK', 'A Unbelieveable Reflection of a Butler And a Boat who must Outgun a Mad Scientist in California', '2006', '1', null, '5', '2.99', '75', '23.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('622', 'NEWSIES STORY', 'A Action-Packed Character Study of a Dog And a Lumberjack who must Outrace a Moose in The Gulf of Mexico', '2006', '1', null, '4', '0.99', '159', '25.99', 'G', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('623', 'NEWTON LABYRINTH', 'A Intrepid Character Study of a Moose And a Waitress who must Find a A Shark in Ancient India', '2006', '1', null, '4', '0.99', '75', '9.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('624', 'NIGHTMARE CHILL', 'A Brilliant Display of a Robot And a Butler who must Fight a Waitress in An Abandoned Mine Shaft', '2006', '1', null, '3', '4.99', '149', '25.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('625', 'NONE SPIKING', 'A Boring Reflection of a Secret Agent And a Astronaut who must Face a Composer in A Manhattan Penthouse', '2006', '1', null, '3', '0.99', '83', '18.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('626', 'NOON PAPI', 'A Unbelieveable Character Study of a Mad Scientist And a Astronaut who must Find a Pioneer in A Manhattan Penthouse', '2006', '1', null, '5', '2.99', '57', '12.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('627', 'NORTH TEQUILA', 'A Beautiful Character Study of a Mad Cow And a Robot who must Reach a Womanizer in New Orleans', '2006', '1', null, '4', '4.99', '67', '9.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('628', 'NORTHWEST POLISH', 'A Boring Character Study of a Boy And a A Shark who must Outrace a Womanizer in The Outback', '2006', '1', null, '5', '2.99', '172', '24.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('629', 'NOTORIOUS REUNION', 'A Amazing Epistle of a Woman And a Squirrel who must Fight a Hunter in A Baloon', '2006', '1', null, '7', '0.99', '128', '9.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('630', 'NOTTING SPEAKEASY', 'A Thoughtful Display of a Butler And a Womanizer who must Find a Waitress in The Canadian Rockies', '2006', '1', null, '7', '0.99', '48', '19.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('631', 'NOVOCAINE FLIGHT', 'A Fanciful Display of a Student And a Teacher who must Outgun a Crocodile in Nigeria', '2006', '1', null, '4', '0.99', '64', '11.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('632', 'NUTS TIES', 'A Thoughtful Drama of a Explorer And a Womanizer who must Meet a Teacher in California', '2006', '1', null, '5', '4.99', '145', '10.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('633', 'OCTOBER SUBMARINE', 'A Taut Epistle of a Monkey And a Boy who must Confront a Husband in A Jet Boat', '2006', '1', null, '6', '4.99', '54', '10.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('634', 'ODDS BOOGIE', 'A Thrilling Yarn of a Feminist And a Madman who must Battle a Hunter in Berlin', '2006', '1', null, '6', '0.99', '48', '14.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('635', 'OKLAHOMA JUMANJI', 'A Thoughtful Drama of a Dentist And a Womanizer who must Meet a Husband in The Sahara Desert', '2006', '1', null, '7', '0.99', '58', '15.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('636', 'OLEANDER CLUE', 'A Boring Story of a Teacher And a Monkey who must Succumb a Forensic Psychologist in A Jet Boat', '2006', '1', null, '5', '0.99', '161', '12.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('637', 'OPEN AFRICAN', 'A Lacklusture Drama of a Secret Agent And a Explorer who must Discover a Car in A U-Boat', '2006', '1', null, '7', '4.99', '131', '16.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('638', 'OPERATION OPERATION', 'A Intrepid Character Study of a Man And a Frisbee who must Overcome a Madman in Ancient China', '2006', '1', null, '7', '2.99', '156', '23.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('639', 'OPPOSITE NECKLACE', 'A Fateful Epistle of a Crocodile And a Moose who must Kill a Explorer in Nigeria', '2006', '1', null, '7', '4.99', '92', '9.99', 'PG', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('640', 'OPUS ICE', 'A Fast-Paced Drama of a Hunter And a Boy who must Discover a Feminist in The Sahara Desert', '2006', '1', null, '5', '4.99', '102', '21.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('641', 'ORANGE GRAPES', 'A Astounding Documentary of a Butler And a Womanizer who must Face a Dog in A U-Boat', '2006', '1', null, '4', '0.99', '76', '21.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('642', 'ORDER BETRAYED', 'A Amazing Saga of a Dog And a A Shark who must Challenge a Cat in The Sahara Desert', '2006', '1', null, '7', '2.99', '120', '13.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('643', 'ORIENT CLOSER', 'A Astounding Epistle of a Technical Writer And a Teacher who must Fight a Squirrel in The Sahara Desert', '2006', '1', null, '3', '2.99', '118', '22.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('644', 'OSCAR GOLD', 'A Insightful Tale of a Database Administrator And a Dog who must Face a Madman in Soviet Georgia', '2006', '1', null, '7', '2.99', '115', '29.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('645', 'OTHERS SOUP', 'A Lacklusture Documentary of a Mad Cow And a Madman who must Sink a Moose in The Gulf of Mexico', '2006', '1', null, '7', '2.99', '118', '18.99', 'PG', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('646', 'OUTBREAK DIVINE', 'A Unbelieveable Yarn of a Database Administrator And a Woman who must Succumb a A Shark in A U-Boat', '2006', '1', null, '6', '0.99', '169', '12.99', 'NC-17', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('647', 'OUTFIELD MASSACRE', 'A Thoughtful Drama of a Husband And a Secret Agent who must Pursue a Database Administrator in Ancient India', '2006', '1', null, '4', '0.99', '129', '18.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('648', 'OUTLAW HANKY', 'A Thoughtful Story of a Astronaut And a Composer who must Conquer a Dog in The Sahara Desert', '2006', '1', null, '7', '4.99', '148', '17.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('649', 'OZ LIAISONS', 'A Epic Yarn of a Mad Scientist And a Cat who must Confront a Womanizer in A Baloon Factory', '2006', '1', null, '4', '2.99', '85', '14.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('650', 'PACIFIC AMISTAD', 'A Thrilling Yarn of a Dog And a Moose who must Kill a Pastry Chef in A Manhattan Penthouse', '2006', '1', null, '3', '0.99', '144', '27.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('651', 'PACKER MADIGAN', 'A Epic Display of a Sumo Wrestler And a Forensic Psychologist who must Build a Woman in An Abandoned Amusement Park', '2006', '1', null, '3', '0.99', '84', '20.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('652', 'PAJAMA JAWBREAKER', 'A Emotional Drama of a Boy And a Technical Writer who must Redeem a Sumo Wrestler in California', '2006', '1', null, '3', '0.99', '126', '14.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('653', 'PANIC CLUB', 'A Fanciful Display of a Teacher And a Crocodile who must Succumb a Girl in A Baloon', '2006', '1', null, '3', '4.99', '102', '15.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('654', 'PANKY SUBMARINE', 'A Touching Documentary of a Dentist And a Sumo Wrestler who must Overcome a Boy in The Gulf of Mexico', '2006', '1', null, '4', '4.99', '93', '19.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('655', 'PANTHER REDS', 'A Brilliant Panorama of a Moose And a Man who must Reach a Teacher in The Gulf of Mexico', '2006', '1', null, '5', '4.99', '109', '22.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('656', 'PAPI NECKLACE', 'A Fanciful Display of a Car And a Monkey who must Escape a Squirrel in Ancient Japan', '2006', '1', null, '3', '0.99', '128', '9.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('657', 'PARADISE SABRINA', 'A Intrepid Yarn of a Car And a Moose who must Outrace a Crocodile in A Manhattan Penthouse', '2006', '1', null, '5', '2.99', '48', '12.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('658', 'PARIS WEEKEND', 'A Intrepid Story of a Squirrel And a Crocodile who must Defeat a Monkey in The Outback', '2006', '1', null, '7', '2.99', '121', '19.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('659', 'PARK CITIZEN', 'A Taut Epistle of a Sumo Wrestler And a Girl who must Face a Husband in Ancient Japan', '2006', '1', null, '3', '4.99', '109', '14.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('660', 'PARTY KNOCK', 'A Fateful Display of a Technical Writer And a Butler who must Battle a Sumo Wrestler in An Abandoned Mine Shaft', '2006', '1', null, '7', '2.99', '107', '11.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('661', 'PAST SUICIDES', 'A Intrepid Tale of a Madman And a Astronaut who must Challenge a Hunter in A Monastery', '2006', '1', null, '5', '4.99', '157', '17.99', 'PG-13', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('662', 'PATHS CONTROL', 'A Astounding Documentary of a Butler And a Cat who must Find a Frisbee in Ancient China', '2006', '1', null, '3', '4.99', '118', '9.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('663', 'PATIENT SISTER', 'A Emotional Epistle of a Squirrel And a Robot who must Confront a Lumberjack in Soviet Georgia', '2006', '1', null, '7', '0.99', '99', '29.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('664', 'PATRIOT ROMAN', 'A Taut Saga of a Robot And a Database Administrator who must Challenge a Astronaut in California', '2006', '1', null, '6', '2.99', '65', '12.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('665', 'PATTON INTERVIEW', 'A Thrilling Documentary of a Composer And a Secret Agent who must Succumb a Cat in Berlin', '2006', '1', null, '4', '2.99', '175', '22.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('666', 'PAYCHECK WAIT', 'A Awe-Inspiring Reflection of a Boy And a Man who must Discover a Moose in The Sahara Desert', '2006', '1', null, '4', '4.99', '145', '27.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('667', 'PEACH INNOCENT', 'A Action-Packed Drama of a Monkey And a Dentist who must Chase a Butler in Berlin', '2006', '1', null, '3', '2.99', '160', '20.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('668', 'PEAK FOREVER', 'A Insightful Reflection of a Boat And a Secret Agent who must Vanquish a Astronaut in An Abandoned Mine Shaft', '2006', '1', null, '7', '4.99', '80', '25.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('669', 'PEARL DESTINY', 'A Lacklusture Yarn of a Astronaut And a Pastry Chef who must Sink a Dog in A U-Boat', '2006', '1', null, '3', '2.99', '74', '10.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('670', 'PELICAN COMFORTS', 'A Epic Documentary of a Boy And a Monkey who must Pursue a Astronaut in Berlin', '2006', '1', null, '4', '4.99', '48', '17.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('671', 'PERDITION FARGO', 'A Fast-Paced Story of a Car And a Cat who must Outgun a Hunter in Berlin', '2006', '1', null, '7', '4.99', '99', '27.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('672', 'PERFECT GROOVE', 'A Thrilling Yarn of a Dog And a Dog who must Build a Husband in A Baloon', '2006', '1', null, '7', '2.99', '82', '17.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('673', 'PERSONAL LADYBUGS', 'A Epic Saga of a Hunter And a Technical Writer who must Conquer a Cat in Ancient Japan', '2006', '1', null, '3', '0.99', '118', '19.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('674', 'PET HAUNTING', 'A Unbelieveable Reflection of a Explorer And a Boat who must Conquer a Woman in California', '2006', '1', null, '3', '0.99', '99', '11.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('675', 'PHANTOM GLORY', 'A Beautiful Documentary of a Astronaut And a Crocodile who must Discover a Madman in A Monastery', '2006', '1', null, '6', '2.99', '60', '17.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('676', 'PHILADELPHIA WIFE', 'A Taut Yarn of a Hunter And a Astronaut who must Conquer a Database Administrator in The Sahara Desert', '2006', '1', null, '7', '4.99', '137', '16.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('677', 'PIANIST OUTFIELD', 'A Intrepid Story of a Boy And a Technical Writer who must Pursue a Lumberjack in A Monastery', '2006', '1', null, '6', '0.99', '136', '25.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('678', 'PICKUP DRIVING', 'A Touching Documentary of a Husband And a Boat who must Meet a Pastry Chef in A Baloon Factory', '2006', '1', null, '3', '2.99', '77', '23.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('679', 'PILOT HOOSIERS', 'A Awe-Inspiring Reflection of a Crocodile And a Sumo Wrestler who must Meet a Forensic Psychologist in An Abandoned Mine Shaft', '2006', '1', null, '6', '2.99', '50', '17.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('680', 'PINOCCHIO SIMON', 'A Action-Packed Reflection of a Mad Scientist And a A Shark who must Find a Feminist in California', '2006', '1', null, '4', '4.99', '103', '21.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('681', 'PIRATES ROXANNE', 'A Stunning Drama of a Woman And a Lumberjack who must Overcome a A Shark in The Canadian Rockies', '2006', '1', null, '4', '0.99', '100', '20.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('682', 'PITTSBURGH HUNCHBACK', 'A Thrilling Epistle of a Boy And a Boat who must Find a Student in Soviet Georgia', '2006', '1', null, '4', '4.99', '134', '17.99', 'PG-13', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('683', 'PITY BOUND', 'A Boring Panorama of a Feminist And a Moose who must Defeat a Database Administrator in Nigeria', '2006', '1', null, '5', '4.99', '60', '19.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('684', 'PIZZA JUMANJI', 'A Epic Saga of a Cat And a Squirrel who must Outgun a Robot in A U-Boat', '2006', '1', null, '4', '2.99', '173', '11.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('685', 'PLATOON INSTINCT', 'A Thrilling Panorama of a Man And a Woman who must Reach a Woman in Australia', '2006', '1', null, '6', '4.99', '132', '10.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('686', 'PLUTO OLEANDER', 'A Action-Packed Reflection of a Car And a Moose who must Outgun a Car in A Shark Tank', '2006', '1', null, '5', '4.99', '84', '9.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('687', 'POCUS PULP', 'A Intrepid Yarn of a Frisbee And a Dog who must Build a Astronaut in A Baloon Factory', '2006', '1', null, '6', '0.99', '138', '15.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('688', 'POLISH BROOKLYN', 'A Boring Character Study of a Database Administrator And a Lumberjack who must Reach a Madman in The Outback', '2006', '1', null, '6', '0.99', '61', '12.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('689', 'POLLOCK DELIVERANCE', 'A Intrepid Story of a Madman And a Frisbee who must Outgun a Boat in The Sahara Desert', '2006', '1', null, '5', '2.99', '137', '14.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('690', 'POND SEATTLE', 'A Stunning Drama of a Teacher And a Boat who must Battle a Feminist in Ancient China', '2006', '1', null, '7', '2.99', '185', '25.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('691', 'POSEIDON FOREVER', 'A Thoughtful Epistle of a Womanizer And a Monkey who must Vanquish a Dentist in A Monastery', '2006', '1', null, '6', '4.99', '159', '29.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('692', 'POTLUCK MIXED', 'A Beautiful Story of a Dog And a Technical Writer who must Outgun a Student in A Baloon', '2006', '1', null, '3', '2.99', '179', '10.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('693', 'POTTER CONNECTICUT', 'A Thrilling Epistle of a Frisbee And a Cat who must Fight a Technical Writer in Berlin', '2006', '1', null, '5', '2.99', '115', '16.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('694', 'PREJUDICE OLEANDER', 'A Epic Saga of a Boy And a Dentist who must Outrace a Madman in A U-Boat', '2006', '1', null, '6', '4.99', '98', '15.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('695', 'PRESIDENT BANG', 'A Fateful Panorama of a Technical Writer And a Moose who must Battle a Robot in Soviet Georgia', '2006', '1', null, '6', '4.99', '144', '12.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('696', 'PRIDE ALAMO', 'A Thoughtful Drama of a A Shark And a Forensic Psychologist who must Vanquish a Student in Ancient India', '2006', '1', null, '6', '0.99', '114', '20.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('697', 'PRIMARY GLASS', 'A Fateful Documentary of a Pastry Chef And a Butler who must Build a Dog in The Canadian Rockies', '2006', '1', null, '7', '0.99', '53', '16.99', 'G', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('698', 'PRINCESS GIANT', 'A Thrilling Yarn of a Pastry Chef And a Monkey who must Battle a Monkey in A Shark Tank', '2006', '1', null, '3', '2.99', '71', '29.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('699', 'PRIVATE DROP', 'A Stunning Story of a Technical Writer And a Hunter who must Succumb a Secret Agent in A Baloon', '2006', '1', null, '7', '4.99', '106', '26.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('700', 'PRIX UNDEFEATED', 'A Stunning Saga of a Mad Scientist And a Boat who must Overcome a Dentist in Ancient China', '2006', '1', null, '4', '2.99', '115', '13.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('701', 'PSYCHO SHRUNK', 'A Amazing Panorama of a Crocodile And a Explorer who must Fight a Husband in Nigeria', '2006', '1', null, '5', '2.99', '155', '11.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('702', 'PULP BEVERLY', 'A Unbelieveable Display of a Dog And a Crocodile who must Outrace a Man in Nigeria', '2006', '1', null, '4', '2.99', '89', '12.99', 'G', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('703', 'PUNK DIVORCE', 'A Fast-Paced Tale of a Pastry Chef And a Boat who must Face a Frisbee in The Canadian Rockies', '2006', '1', null, '6', '4.99', '100', '18.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('704', 'PURE RUNNER', 'A Thoughtful Documentary of a Student And a Madman who must Challenge a Squirrel in A Manhattan Penthouse', '2006', '1', null, '3', '2.99', '121', '25.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('705', 'PURPLE MOVIE', 'A Boring Display of a Pastry Chef And a Sumo Wrestler who must Discover a Frisbee in An Abandoned Amusement Park', '2006', '1', null, '4', '2.99', '88', '9.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('706', 'QUEEN LUKE', 'A Astounding Story of a Girl And a Boy who must Challenge a Composer in New Orleans', '2006', '1', null, '5', '4.99', '163', '22.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('707', 'QUEST MUSSOLINI', 'A Fateful Drama of a Husband And a Sumo Wrestler who must Battle a Pastry Chef in A Baloon Factory', '2006', '1', null, '5', '2.99', '177', '29.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('708', 'QUILLS BULL', 'A Thoughtful Story of a Pioneer And a Woman who must Reach a Moose in Australia', '2006', '1', null, '4', '4.99', '112', '19.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('709', 'RACER EGG', 'A Emotional Display of a Monkey And a Waitress who must Reach a Secret Agent in California', '2006', '1', null, '7', '2.99', '147', '19.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('710', 'RAGE GAMES', 'A Fast-Paced Saga of a Astronaut And a Secret Agent who must Escape a Hunter in An Abandoned Amusement Park', '2006', '1', null, '4', '4.99', '120', '18.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('711', 'RAGING AIRPLANE', 'A Astounding Display of a Secret Agent And a Technical Writer who must Escape a Mad Scientist in A Jet Boat', '2006', '1', null, '4', '4.99', '154', '18.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('712', 'RAIDERS ANTITRUST', 'A Amazing Drama of a Teacher And a Feminist who must Meet a Woman in The First Manned Space Station', '2006', '1', null, '4', '0.99', '82', '11.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('713', 'RAINBOW SHOCK', 'A Action-Packed Story of a Hunter And a Boy who must Discover a Lumberjack in Ancient India', '2006', '1', null, '3', '4.99', '74', '14.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('714', 'RANDOM GO', 'A Fateful Drama of a Frisbee And a Student who must Confront a Cat in A Shark Tank', '2006', '1', null, '6', '2.99', '73', '29.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('715', 'RANGE MOONWALKER', 'A Insightful Documentary of a Hunter And a Dentist who must Confront a Crocodile in A Baloon', '2006', '1', null, '3', '4.99', '147', '25.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('716', 'REAP UNFAITHFUL', 'A Thrilling Epistle of a Composer And a Sumo Wrestler who must Challenge a Mad Cow in A MySQL Convention', '2006', '1', null, '6', '2.99', '136', '26.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('717', 'REAR TRADING', 'A Awe-Inspiring Reflection of a Forensic Psychologist And a Secret Agent who must Succumb a Pastry Chef in Soviet Georgia', '2006', '1', null, '6', '0.99', '97', '23.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('718', 'REBEL AIRPORT', 'A Intrepid Yarn of a Database Administrator And a Boat who must Outrace a Husband in Ancient India', '2006', '1', null, '7', '0.99', '73', '24.99', 'G', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('719', 'RECORDS ZORRO', 'A Amazing Drama of a Mad Scientist And a Composer who must Build a Husband in The Outback', '2006', '1', null, '7', '4.99', '182', '11.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('720', 'REDEMPTION COMFORTS', 'A Emotional Documentary of a Dentist And a Woman who must Battle a Mad Scientist in Ancient China', '2006', '1', null, '3', '2.99', '179', '20.99', 'NC-17', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('721', 'REDS POCUS', 'A Lacklusture Yarn of a Sumo Wrestler And a Squirrel who must Redeem a Monkey in Soviet Georgia', '2006', '1', null, '7', '4.99', '182', '23.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('722', 'REEF SALUTE', 'A Action-Packed Saga of a Teacher And a Lumberjack who must Battle a Dentist in A Baloon', '2006', '1', null, '5', '0.99', '123', '26.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('723', 'REIGN GENTLEMEN', 'A Emotional Yarn of a Composer And a Man who must Escape a Butler in The Gulf of Mexico', '2006', '1', null, '3', '2.99', '82', '29.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('724', 'REMEMBER DIARY', 'A Insightful Tale of a Technical Writer And a Waitress who must Conquer a Monkey in Ancient India', '2006', '1', null, '5', '2.99', '110', '15.99', 'R', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('725', 'REQUIEM TYCOON', 'A Unbelieveable Character Study of a Cat And a Database Administrator who must Pursue a Teacher in A Monastery', '2006', '1', null, '6', '4.99', '167', '25.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('726', 'RESERVOIR ADAPTATION', 'A Intrepid Drama of a Teacher And a Moose who must Kill a Car in California', '2006', '1', null, '7', '2.99', '61', '29.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('727', 'RESURRECTION SILVERADO', 'A Epic Yarn of a Robot And a Explorer who must Challenge a Girl in A MySQL Convention', '2006', '1', null, '6', '0.99', '117', '12.99', 'PG', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('728', 'REUNION WITCHES', 'A Unbelieveable Documentary of a Database Administrator And a Frisbee who must Redeem a Mad Scientist in A Baloon Factory', '2006', '1', null, '3', '0.99', '63', '26.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('729', 'RIDER CADDYSHACK', 'A Taut Reflection of a Monkey And a Womanizer who must Chase a Moose in Nigeria', '2006', '1', null, '5', '2.99', '177', '28.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('730', 'RIDGEMONT SUBMARINE', 'A Unbelieveable Drama of a Waitress And a Composer who must Sink a Mad Cow in Ancient Japan', '2006', '1', null, '3', '0.99', '46', '28.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('731', 'RIGHT CRANES', 'A Fateful Character Study of a Boat And a Cat who must Find a Database Administrator in A Jet Boat', '2006', '1', null, '7', '4.99', '153', '29.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('732', 'RINGS HEARTBREAKERS', 'A Amazing Yarn of a Sumo Wrestler And a Boat who must Conquer a Waitress in New Orleans', '2006', '1', null, '5', '0.99', '58', '17.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('733', 'RIVER OUTLAW', 'A Thrilling Character Study of a Squirrel And a Lumberjack who must Face a Hunter in A MySQL Convention', '2006', '1', null, '4', '0.99', '149', '29.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('734', 'ROAD ROXANNE', 'A Boring Character Study of a Waitress And a Astronaut who must Fight a Crocodile in Ancient Japan', '2006', '1', null, '4', '4.99', '158', '12.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('735', 'ROBBERS JOON', 'A Thoughtful Story of a Mad Scientist And a Waitress who must Confront a Forensic Psychologist in Soviet Georgia', '2006', '1', null, '7', '2.99', '102', '26.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('736', 'ROBBERY BRIGHT', 'A Taut Reflection of a Robot And a Squirrel who must Fight a Boat in Ancient Japan', '2006', '1', null, '4', '0.99', '134', '21.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('737', 'ROCK INSTINCT', 'A Astounding Character Study of a Robot And a Moose who must Overcome a Astronaut in Ancient India', '2006', '1', null, '4', '0.99', '102', '28.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('738', 'ROCKETEER MOTHER', 'A Awe-Inspiring Character Study of a Robot And a Sumo Wrestler who must Discover a Womanizer in A Shark Tank', '2006', '1', null, '3', '0.99', '178', '27.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('739', 'ROCKY WAR', 'A Fast-Paced Display of a Squirrel And a Explorer who must Outgun a Mad Scientist in Nigeria', '2006', '1', null, '4', '4.99', '145', '17.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('740', 'ROLLERCOASTER BRINGING', 'A Beautiful Drama of a Robot And a Lumberjack who must Discover a Technical Writer in A Shark Tank', '2006', '1', null, '5', '2.99', '153', '13.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('741', 'ROMAN PUNK', 'A Thoughtful Panorama of a Mad Cow And a Student who must Battle a Forensic Psychologist in Berlin', '2006', '1', null, '7', '0.99', '81', '28.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('742', 'ROOF CHAMPION', 'A Lacklusture Reflection of a Car And a Explorer who must Find a Monkey in A Baloon', '2006', '1', null, '7', '0.99', '101', '25.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('743', 'ROOM ROMAN', 'A Awe-Inspiring Panorama of a Composer And a Secret Agent who must Sink a Composer in A Shark Tank', '2006', '1', null, '7', '0.99', '60', '27.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('744', 'ROOTS REMEMBER', 'A Brilliant Drama of a Mad Cow And a Hunter who must Escape a Hunter in Berlin', '2006', '1', null, '4', '0.99', '89', '23.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('745', 'ROSES TREASURE', 'A Astounding Panorama of a Monkey And a Secret Agent who must Defeat a Woman in The First Manned Space Station', '2006', '1', null, '5', '4.99', '162', '23.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('746', 'ROUGE SQUAD', 'A Awe-Inspiring Drama of a Astronaut And a Frisbee who must Conquer a Mad Scientist in Australia', '2006', '1', null, '3', '0.99', '118', '10.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('747', 'ROXANNE REBEL', 'A Astounding Story of a Pastry Chef And a Database Administrator who must Fight a Man in The Outback', '2006', '1', null, '5', '0.99', '171', '9.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('748', 'RUGRATS SHAKESPEARE', 'A Touching Saga of a Crocodile And a Crocodile who must Discover a Technical Writer in Nigeria', '2006', '1', null, '4', '0.99', '109', '16.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('749', 'RULES HUMAN', 'A Beautiful Epistle of a Astronaut And a Student who must Confront a Monkey in An Abandoned Fun House', '2006', '1', null, '6', '4.99', '153', '19.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('750', 'RUN PACIFIC', 'A Touching Tale of a Cat And a Pastry Chef who must Conquer a Pastry Chef in A MySQL Convention', '2006', '1', null, '3', '0.99', '145', '25.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('751', 'RUNAWAY TENENBAUMS', 'A Thoughtful Documentary of a Boat And a Man who must Meet a Boat in An Abandoned Fun House', '2006', '1', null, '6', '0.99', '181', '17.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('752', 'RUNNER MADIGAN', 'A Thoughtful Documentary of a Crocodile And a Robot who must Outrace a Womanizer in The Outback', '2006', '1', null, '6', '0.99', '101', '27.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('753', 'RUSH GOODFELLAS', 'A Emotional Display of a Man And a Dentist who must Challenge a Squirrel in Australia', '2006', '1', null, '3', '0.99', '48', '20.99', 'PG', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('754', 'RUSHMORE MERMAID', 'A Boring Story of a Woman And a Moose who must Reach a Husband in A Shark Tank', '2006', '1', null, '6', '2.99', '150', '17.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('755', 'SABRINA MIDNIGHT', 'A Emotional Story of a Squirrel And a Crocodile who must Succumb a Husband in The Sahara Desert', '2006', '1', null, '5', '4.99', '99', '11.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('756', 'SADDLE ANTITRUST', 'A Stunning Epistle of a Feminist And a A Shark who must Battle a Woman in An Abandoned Fun House', '2006', '1', null, '7', '2.99', '80', '10.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('757', 'SAGEBRUSH CLUELESS', 'A Insightful Story of a Lumberjack And a Hunter who must Kill a Boy in Ancient Japan', '2006', '1', null, '4', '2.99', '106', '28.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('758', 'SAINTS BRIDE', 'A Fateful Tale of a Technical Writer And a Composer who must Pursue a Explorer in The Gulf of Mexico', '2006', '1', null, '5', '2.99', '125', '11.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('759', 'SALUTE APOLLO', 'A Awe-Inspiring Character Study of a Boy And a Feminist who must Sink a Crocodile in Ancient China', '2006', '1', null, '4', '2.99', '73', '29.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('760', 'SAMURAI LION', 'A Fast-Paced Story of a Pioneer And a Astronaut who must Reach a Boat in A Baloon', '2006', '1', null, '5', '2.99', '110', '21.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('761', 'SANTA PARIS', 'A Emotional Documentary of a Moose And a Car who must Redeem a Mad Cow in A Baloon Factory', '2006', '1', null, '7', '2.99', '154', '23.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('762', 'SASSY PACKER', 'A Fast-Paced Documentary of a Dog And a Teacher who must Find a Moose in A Manhattan Penthouse', '2006', '1', null, '6', '0.99', '154', '29.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('763', 'SATISFACTION CONFIDENTIAL', 'A Lacklusture Yarn of a Dentist And a Butler who must Meet a Secret Agent in Ancient China', '2006', '1', null, '3', '4.99', '75', '26.99', 'G', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('764', 'SATURDAY LAMBS', 'A Thoughtful Reflection of a Mad Scientist And a Moose who must Kill a Husband in A Baloon', '2006', '1', null, '3', '4.99', '150', '28.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('765', 'SATURN NAME', 'A Fateful Epistle of a Butler And a Boy who must Redeem a Teacher in Berlin', '2006', '1', null, '7', '4.99', '182', '18.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('766', 'SAVANNAH TOWN', 'A Awe-Inspiring Tale of a Astronaut And a Database Administrator who must Chase a Secret Agent in The Gulf of Mexico', '2006', '1', null, '5', '0.99', '84', '25.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('767', 'SCALAWAG DUCK', 'A Fateful Reflection of a Car And a Teacher who must Confront a Waitress in A Monastery', '2006', '1', null, '6', '4.99', '183', '13.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('768', 'SCARFACE BANG', 'A Emotional Yarn of a Teacher And a Girl who must Find a Teacher in A Baloon Factory', '2006', '1', null, '3', '4.99', '102', '11.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('769', 'SCHOOL JACKET', 'A Intrepid Yarn of a Monkey And a Boy who must Fight a Composer in A Manhattan Penthouse', '2006', '1', null, '5', '4.99', '151', '21.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('770', 'SCISSORHANDS SLUMS', 'A Awe-Inspiring Drama of a Girl And a Technical Writer who must Meet a Feminist in The Canadian Rockies', '2006', '1', null, '5', '2.99', '147', '13.99', 'G', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('771', 'SCORPION APOLLO', 'A Awe-Inspiring Documentary of a Technical Writer And a Husband who must Meet a Monkey in An Abandoned Fun House', '2006', '1', null, '3', '4.99', '137', '23.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('772', 'SEA VIRGIN', 'A Fast-Paced Documentary of a Technical Writer And a Pastry Chef who must Escape a Moose in A U-Boat', '2006', '1', null, '4', '2.99', '80', '24.99', 'PG', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('773', 'SEABISCUIT PUNK', 'A Insightful Saga of a Man And a Forensic Psychologist who must Discover a Mad Cow in A MySQL Convention', '2006', '1', null, '6', '2.99', '112', '28.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('774', 'SEARCHERS WAIT', 'A Fast-Paced Tale of a Car And a Mad Scientist who must Kill a Womanizer in Ancient Japan', '2006', '1', null, '3', '2.99', '182', '22.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('775', 'SEATTLE EXPECATIONS', 'A Insightful Reflection of a Crocodile And a Sumo Wrestler who must Meet a Technical Writer in The Sahara Desert', '2006', '1', null, '4', '4.99', '110', '18.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('776', 'SECRET GROUNDHOG', 'A Astounding Story of a Cat And a Database Administrator who must Build a Technical Writer in New Orleans', '2006', '1', null, '6', '4.99', '90', '11.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('777', 'SECRETARY ROUGE', 'A Action-Packed Panorama of a Mad Cow And a Composer who must Discover a Robot in A Baloon Factory', '2006', '1', null, '5', '4.99', '158', '10.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('778', 'SECRETS PARADISE', 'A Fateful Saga of a Cat And a Frisbee who must Kill a Girl in A Manhattan Penthouse', '2006', '1', null, '3', '4.99', '109', '24.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('779', 'SENSE GREEK', 'A Taut Saga of a Lumberjack And a Pastry Chef who must Escape a Sumo Wrestler in An Abandoned Fun House', '2006', '1', null, '4', '4.99', '54', '23.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('780', 'SENSIBILITY REAR', 'A Emotional Tale of a Robot And a Sumo Wrestler who must Redeem a Pastry Chef in A Baloon Factory', '2006', '1', null, '7', '4.99', '98', '15.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('781', 'SEVEN SWARM', 'A Unbelieveable Character Study of a Dog And a Mad Cow who must Kill a Monkey in Berlin', '2006', '1', null, '4', '4.99', '127', '15.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('782', 'SHAKESPEARE SADDLE', 'A Fast-Paced Panorama of a Lumberjack And a Database Administrator who must Defeat a Madman in A MySQL Convention', '2006', '1', null, '6', '2.99', '60', '26.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('783', 'SHANE DARKNESS', 'A Action-Packed Saga of a Moose And a Lumberjack who must Find a Woman in Berlin', '2006', '1', null, '5', '2.99', '93', '22.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('784', 'SHANGHAI TYCOON', 'A Fast-Paced Character Study of a Crocodile And a Lumberjack who must Build a Husband in An Abandoned Fun House', '2006', '1', null, '7', '2.99', '47', '20.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('785', 'SHAWSHANK BUBBLE', 'A Lacklusture Story of a Moose And a Monkey who must Confront a Butler in An Abandoned Amusement Park', '2006', '1', null, '6', '4.99', '80', '20.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('786', 'SHEPHERD MIDSUMMER', 'A Thoughtful Drama of a Robot And a Womanizer who must Kill a Lumberjack in A Baloon', '2006', '1', null, '7', '0.99', '113', '14.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('787', 'SHINING ROSES', 'A Awe-Inspiring Character Study of a Astronaut And a Forensic Psychologist who must Challenge a Madman in Ancient India', '2006', '1', null, '4', '0.99', '125', '12.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('788', 'SHIP WONDERLAND', 'A Thrilling Saga of a Monkey And a Frisbee who must Escape a Explorer in The Outback', '2006', '1', null, '5', '2.99', '104', '15.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('789', 'SHOCK CABIN', 'A Fateful Tale of a Mad Cow And a Crocodile who must Meet a Husband in New Orleans', '2006', '1', null, '7', '2.99', '79', '15.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('790', 'SHOOTIST SUPERFLY', 'A Fast-Paced Story of a Crocodile And a A Shark who must Sink a Pioneer in Berlin', '2006', '1', null, '6', '0.99', '67', '22.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('791', 'SHOW LORD', 'A Fanciful Saga of a Student And a Girl who must Find a Butler in Ancient Japan', '2006', '1', null, '3', '4.99', '167', '24.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('792', 'SHREK LICENSE', 'A Fateful Yarn of a Secret Agent And a Feminist who must Find a Feminist in A Jet Boat', '2006', '1', null, '7', '2.99', '154', '15.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('793', 'SHRUNK DIVINE', 'A Fateful Character Study of a Waitress And a Technical Writer who must Battle a Hunter in A Baloon', '2006', '1', null, '6', '2.99', '139', '14.99', 'R', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('794', 'SIDE ARK', 'A Stunning Panorama of a Crocodile And a Womanizer who must Meet a Feminist in The Canadian Rockies', '2006', '1', null, '5', '0.99', '52', '28.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('795', 'SIEGE MADRE', 'A Boring Tale of a Frisbee And a Crocodile who must Vanquish a Moose in An Abandoned Mine Shaft', '2006', '1', null, '7', '0.99', '111', '23.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('796', 'SIERRA DIVIDE', 'A Emotional Character Study of a Frisbee And a Mad Scientist who must Build a Madman in California', '2006', '1', null, '3', '0.99', '135', '12.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('797', 'SILENCE KANE', 'A Emotional Drama of a Sumo Wrestler And a Dentist who must Confront a Sumo Wrestler in A Baloon', '2006', '1', null, '7', '0.99', '67', '23.99', 'R', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('798', 'SILVERADO GOLDFINGER', 'A Stunning Epistle of a Sumo Wrestler And a Man who must Challenge a Waitress in Ancient India', '2006', '1', null, '4', '4.99', '74', '11.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('799', 'SIMON NORTH', 'A Thrilling Documentary of a Technical Writer And a A Shark who must Face a Pioneer in A Shark Tank', '2006', '1', null, '3', '0.99', '51', '26.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('800', 'SINNERS ATLANTIS', 'A Epic Display of a Dog And a Boat who must Succumb a Mad Scientist in An Abandoned Mine Shaft', '2006', '1', null, '7', '2.99', '126', '19.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('801', 'SISTER FREDDY', 'A Stunning Saga of a Butler And a Woman who must Pursue a Explorer in Australia', '2006', '1', null, '5', '4.99', '152', '19.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('802', 'SKY MIRACLE', 'A Epic Drama of a Mad Scientist And a Explorer who must Succumb a Waitress in An Abandoned Fun House', '2006', '1', null, '7', '2.99', '132', '15.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('803', 'SLACKER LIAISONS', 'A Fast-Paced Tale of a A Shark And a Student who must Meet a Crocodile in Ancient China', '2006', '1', null, '7', '4.99', '179', '29.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('804', 'SLEEPING SUSPECTS', 'A Stunning Reflection of a Sumo Wrestler And a Explorer who must Sink a Frisbee in A MySQL Convention', '2006', '1', null, '7', '4.99', '129', '13.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('805', 'SLEEPLESS MONSOON', 'A Amazing Saga of a Moose And a Pastry Chef who must Escape a Butler in Australia', '2006', '1', null, '5', '4.99', '64', '12.99', 'G', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('806', 'SLEEPY JAPANESE', 'A Emotional Epistle of a Moose And a Composer who must Fight a Technical Writer in The Outback', '2006', '1', null, '4', '2.99', '137', '25.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('807', 'SLEUTH ORIENT', 'A Fateful Character Study of a Husband And a Dog who must Find a Feminist in Ancient India', '2006', '1', null, '4', '0.99', '87', '25.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('808', 'SLING LUKE', 'A Intrepid Character Study of a Robot And a Monkey who must Reach a Secret Agent in An Abandoned Amusement Park', '2006', '1', null, '5', '0.99', '84', '10.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('809', 'SLIPPER FIDELITY', 'A Taut Reflection of a Secret Agent And a Man who must Redeem a Explorer in A MySQL Convention', '2006', '1', null, '5', '0.99', '156', '14.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('810', 'SLUMS DUCK', 'A Amazing Character Study of a Teacher And a Database Administrator who must Defeat a Waitress in A Jet Boat', '2006', '1', null, '5', '0.99', '147', '21.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('811', 'SMILE EARRING', 'A Intrepid Drama of a Teacher And a Butler who must Build a Pastry Chef in Berlin', '2006', '1', null, '4', '2.99', '60', '29.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('812', 'SMOKING BARBARELLA', 'A Lacklusture Saga of a Mad Cow And a Mad Scientist who must Sink a Cat in A MySQL Convention', '2006', '1', null, '7', '0.99', '50', '13.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('813', 'SMOOCHY CONTROL', 'A Thrilling Documentary of a Husband And a Feminist who must Face a Mad Scientist in Ancient China', '2006', '1', null, '7', '0.99', '184', '18.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('814', 'SNATCH SLIPPER', 'A Insightful Panorama of a Woman And a Feminist who must Defeat a Forensic Psychologist in Berlin', '2006', '1', null, '6', '4.99', '110', '15.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('815', 'SNATCHERS MONTEZUMA', 'A Boring Epistle of a Sumo Wrestler And a Woman who must Escape a Man in The Canadian Rockies', '2006', '1', null, '4', '2.99', '74', '14.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('816', 'SNOWMAN ROLLERCOASTER', 'A Fateful Display of a Lumberjack And a Girl who must Succumb a Mad Cow in A Manhattan Penthouse', '2006', '1', null, '3', '0.99', '62', '27.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('817', 'SOLDIERS EVOLUTION', 'A Lacklusture Panorama of a A Shark And a Pioneer who must Confront a Student in The First Manned Space Station', '2006', '1', null, '7', '4.99', '185', '27.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('818', 'SOMETHING DUCK', 'A Boring Character Study of a Car And a Husband who must Outgun a Frisbee in The First Manned Space Station', '2006', '1', null, '4', '4.99', '180', '17.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('819', 'SONG HEDWIG', 'A Amazing Documentary of a Man And a Husband who must Confront a Squirrel in A MySQL Convention', '2006', '1', null, '3', '0.99', '165', '29.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('820', 'SONS INTERVIEW', 'A Taut Character Study of a Explorer And a Mad Cow who must Battle a Hunter in Ancient China', '2006', '1', null, '3', '2.99', '184', '11.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('821', 'SORORITY QUEEN', 'A Fast-Paced Display of a Squirrel And a Composer who must Fight a Forensic Psychologist in A Jet Boat', '2006', '1', null, '6', '0.99', '184', '17.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('822', 'SOUP WISDOM', 'A Fast-Paced Display of a Robot And a Butler who must Defeat a Butler in A MySQL Convention', '2006', '1', null, '6', '0.99', '169', '12.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('823', 'SOUTH WAIT', 'A Amazing Documentary of a Car And a Robot who must Escape a Lumberjack in An Abandoned Amusement Park', '2006', '1', null, '4', '2.99', '143', '21.99', 'R', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('824', 'SPARTACUS CHEAPER', 'A Thrilling Panorama of a Pastry Chef And a Secret Agent who must Overcome a Student in A Manhattan Penthouse', '2006', '1', null, '4', '4.99', '52', '19.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('825', 'SPEAKEASY DATE', 'A Lacklusture Drama of a Forensic Psychologist And a Car who must Redeem a Man in A Manhattan Penthouse', '2006', '1', null, '6', '2.99', '165', '22.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('826', 'SPEED SUIT', 'A Brilliant Display of a Frisbee And a Mad Scientist who must Succumb a Robot in Ancient China', '2006', '1', null, '7', '4.99', '124', '19.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('827', 'SPICE SORORITY', 'A Fateful Display of a Pioneer And a Hunter who must Defeat a Husband in An Abandoned Mine Shaft', '2006', '1', null, '5', '4.99', '141', '22.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('828', 'SPIKING ELEMENT', 'A Lacklusture Epistle of a Dentist And a Technical Writer who must Find a Dog in A Monastery', '2006', '1', null, '7', '2.99', '79', '12.99', 'G', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('829', 'SPINAL ROCKY', 'A Lacklusture Epistle of a Sumo Wrestler And a Squirrel who must Defeat a Explorer in California', '2006', '1', null, '7', '2.99', '138', '12.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('830', 'SPIRIT FLINTSTONES', 'A Brilliant Yarn of a Cat And a Car who must Confront a Explorer in Ancient Japan', '2006', '1', null, '7', '0.99', '149', '23.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('831', 'SPIRITED CASUALTIES', 'A Taut Story of a Waitress And a Man who must Face a Car in A Baloon Factory', '2006', '1', null, '5', '0.99', '138', '20.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('832', 'SPLASH GUMP', 'A Taut Saga of a Crocodile And a Boat who must Conquer a Hunter in A Shark Tank', '2006', '1', null, '5', '0.99', '175', '16.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('833', 'SPLENDOR PATTON', 'A Taut Story of a Dog And a Explorer who must Find a Astronaut in Berlin', '2006', '1', null, '5', '0.99', '134', '20.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('834', 'SPOILERS HELLFIGHTERS', 'A Fanciful Story of a Technical Writer And a Squirrel who must Defeat a Dog in The Gulf of Mexico', '2006', '1', null, '4', '0.99', '151', '26.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('835', 'SPY MILE', 'A Thrilling Documentary of a Feminist And a Feminist who must Confront a Feminist in A Baloon', '2006', '1', null, '6', '2.99', '112', '13.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('836', 'SQUAD FISH', 'A Fast-Paced Display of a Pastry Chef And a Dog who must Kill a Teacher in Berlin', '2006', '1', null, '3', '2.99', '136', '14.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('837', 'STAGE WORLD', 'A Lacklusture Panorama of a Woman And a Frisbee who must Chase a Crocodile in A Jet Boat', '2006', '1', null, '4', '2.99', '85', '19.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('838', 'STAGECOACH ARMAGEDDON', 'A Touching Display of a Pioneer And a Butler who must Chase a Car in California', '2006', '1', null, '5', '4.99', '112', '25.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('839', 'STALLION SUNDANCE', 'A Fast-Paced Tale of a Car And a Dog who must Outgun a A Shark in Australia', '2006', '1', null, '5', '0.99', '130', '23.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('840', 'STAMPEDE DISTURBING', 'A Unbelieveable Tale of a Woman And a Lumberjack who must Fight a Frisbee in A U-Boat', '2006', '1', null, '5', '0.99', '75', '26.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('841', 'STAR OPERATION', 'A Insightful Character Study of a Girl And a Car who must Pursue a Mad Cow in A Shark Tank', '2006', '1', null, '5', '2.99', '181', '9.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('842', 'STATE WASTELAND', 'A Beautiful Display of a Cat And a Pastry Chef who must Outrace a Mad Cow in A Jet Boat', '2006', '1', null, '4', '2.99', '113', '13.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('843', 'STEEL SANTA', 'A Fast-Paced Yarn of a Composer And a Frisbee who must Face a Moose in Nigeria', '2006', '1', null, '4', '4.99', '143', '15.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('844', 'STEERS ARMAGEDDON', 'A Stunning Character Study of a Car And a Girl who must Succumb a Car in A MySQL Convention', '2006', '1', null, '6', '4.99', '140', '16.99', 'PG', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('845', 'STEPMOM DREAM', 'A Touching Epistle of a Crocodile And a Teacher who must Build a Forensic Psychologist in A MySQL Convention', '2006', '1', null, '7', '4.99', '48', '9.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('846', 'STING PERSONAL', 'A Fanciful Drama of a Frisbee And a Dog who must Fight a Madman in A Jet Boat', '2006', '1', null, '3', '4.99', '93', '9.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('847', 'STOCK GLASS', 'A Boring Epistle of a Crocodile And a Lumberjack who must Outgun a Moose in Ancient China', '2006', '1', null, '7', '2.99', '160', '10.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('848', 'STONE FIRE', 'A Intrepid Drama of a Astronaut And a Crocodile who must Find a Boat in Soviet Georgia', '2006', '1', null, '3', '0.99', '94', '19.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('849', 'STORM HAPPINESS', 'A Insightful Drama of a Feminist And a A Shark who must Vanquish a Boat in A Shark Tank', '2006', '1', null, '6', '0.99', '57', '28.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('850', 'STORY SIDE', 'A Lacklusture Saga of a Boy And a Cat who must Sink a Dentist in An Abandoned Mine Shaft', '2006', '1', null, '7', '0.99', '163', '27.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('851', 'STRAIGHT HOURS', 'A Boring Panorama of a Secret Agent And a Girl who must Sink a Waitress in The Outback', '2006', '1', null, '3', '0.99', '151', '19.99', 'R', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('852', 'STRANGELOVE DESIRE', 'A Awe-Inspiring Panorama of a Lumberjack And a Waitress who must Defeat a Crocodile in An Abandoned Amusement Park', '2006', '1', null, '4', '0.99', '103', '27.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('853', 'STRANGER STRANGERS', 'A Awe-Inspiring Yarn of a Womanizer And a Explorer who must Fight a Woman in The First Manned Space Station', '2006', '1', null, '3', '4.99', '139', '12.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('854', 'STRANGERS GRAFFITI', 'A Brilliant Character Study of a Secret Agent And a Man who must Find a Cat in The Gulf of Mexico', '2006', '1', null, '4', '4.99', '119', '22.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('855', 'STREAK RIDGEMONT', 'A Astounding Character Study of a Hunter And a Waitress who must Sink a Man in New Orleans', '2006', '1', null, '7', '0.99', '132', '28.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('856', 'STREETCAR INTENTIONS', 'A Insightful Character Study of a Waitress And a Crocodile who must Sink a Waitress in The Gulf of Mexico', '2006', '1', null, '5', '4.99', '73', '11.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('857', 'STRICTLY SCARFACE', 'A Touching Reflection of a Crocodile And a Dog who must Chase a Hunter in An Abandoned Fun House', '2006', '1', null, '3', '2.99', '144', '24.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('858', 'SUBMARINE BED', 'A Amazing Display of a Car And a Monkey who must Fight a Teacher in Soviet Georgia', '2006', '1', null, '5', '4.99', '127', '21.99', 'R', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('859', 'SUGAR WONKA', 'A Touching Story of a Dentist And a Database Administrator who must Conquer a Astronaut in An Abandoned Amusement Park', '2006', '1', null, '3', '4.99', '114', '20.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('860', 'SUICIDES SILENCE', 'A Emotional Character Study of a Car And a Girl who must Face a Composer in A U-Boat', '2006', '1', null, '4', '4.99', '93', '13.99', 'G', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('861', 'SUIT WALLS', 'A Touching Panorama of a Lumberjack And a Frisbee who must Build a Dog in Australia', '2006', '1', null, '3', '4.99', '111', '12.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('862', 'SUMMER SCARFACE', 'A Emotional Panorama of a Lumberjack And a Hunter who must Meet a Girl in A Shark Tank', '2006', '1', null, '5', '0.99', '53', '25.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('863', 'SUN CONFESSIONS', 'A Beautiful Display of a Mad Cow And a Dog who must Redeem a Waitress in An Abandoned Amusement Park', '2006', '1', null, '5', '0.99', '141', '9.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('864', 'SUNDANCE INVASION', 'A Epic Drama of a Lumberjack And a Explorer who must Confront a Hunter in A Baloon Factory', '2006', '1', null, '5', '0.99', '92', '21.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('865', 'SUNRISE LEAGUE', 'A Beautiful Epistle of a Madman And a Butler who must Face a Crocodile in A Manhattan Penthouse', '2006', '1', null, '3', '4.99', '135', '19.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('866', 'SUNSET RACER', 'A Awe-Inspiring Reflection of a Astronaut And a A Shark who must Defeat a Forensic Psychologist in California', '2006', '1', null, '6', '0.99', '48', '28.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('867', 'SUPER WYOMING', 'A Action-Packed Saga of a Pastry Chef And a Explorer who must Discover a A Shark in The Outback', '2006', '1', null, '5', '4.99', '58', '10.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('868', 'SUPERFLY TRIP', 'A Beautiful Saga of a Lumberjack And a Teacher who must Build a Technical Writer in An Abandoned Fun House', '2006', '1', null, '5', '0.99', '114', '27.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('869', 'SUSPECTS QUILLS', 'A Emotional Epistle of a Pioneer And a Crocodile who must Battle a Man in A Manhattan Penthouse', '2006', '1', null, '4', '2.99', '47', '22.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('870', 'SWARM GOLD', 'A Insightful Panorama of a Crocodile And a Boat who must Conquer a Sumo Wrestler in A MySQL Convention', '2006', '1', null, '4', '0.99', '123', '12.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('871', 'SWEDEN SHINING', 'A Taut Documentary of a Car And a Robot who must Conquer a Boy in The Canadian Rockies', '2006', '1', null, '6', '4.99', '176', '19.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('872', 'SWEET BROTHERHOOD', 'A Unbelieveable Epistle of a Sumo Wrestler And a Hunter who must Chase a Forensic Psychologist in A Baloon', '2006', '1', null, '3', '2.99', '185', '27.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('873', 'SWEETHEARTS SUSPECTS', 'A Brilliant Character Study of a Frisbee And a Sumo Wrestler who must Confront a Woman in The Gulf of Mexico', '2006', '1', null, '3', '0.99', '108', '13.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('874', 'TADPOLE PARK', 'A Beautiful Tale of a Frisbee And a Moose who must Vanquish a Dog in An Abandoned Amusement Park', '2006', '1', null, '6', '2.99', '155', '13.99', 'PG', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('875', 'TALENTED HOMICIDE', 'A Lacklusture Panorama of a Dentist And a Forensic Psychologist who must Outrace a Pioneer in A U-Boat', '2006', '1', null, '6', '0.99', '173', '9.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('876', 'TARZAN VIDEOTAPE', 'A Fast-Paced Display of a Lumberjack And a Mad Scientist who must Succumb a Sumo Wrestler in The Sahara Desert', '2006', '1', null, '3', '2.99', '91', '11.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('877', 'TAXI KICK', 'A Amazing Epistle of a Girl And a Woman who must Outrace a Waitress in Soviet Georgia', '2006', '1', null, '4', '0.99', '64', '23.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('878', 'TEEN APOLLO', 'A Awe-Inspiring Drama of a Dog And a Man who must Escape a Robot in A Shark Tank', '2006', '1', null, '3', '4.99', '74', '25.99', 'G', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('879', 'TELEGRAPH VOYAGE', 'A Fateful Yarn of a Husband And a Dog who must Battle a Waitress in A Jet Boat', '2006', '1', null, '3', '4.99', '148', '20.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('880', 'TELEMARK HEARTBREAKERS', 'A Action-Packed Panorama of a Technical Writer And a Man who must Build a Forensic Psychologist in A Manhattan Penthouse', '2006', '1', null, '6', '2.99', '152', '9.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('881', 'TEMPLE ATTRACTION', 'A Action-Packed Saga of a Forensic Psychologist And a Woman who must Battle a Womanizer in Soviet Georgia', '2006', '1', null, '5', '4.99', '71', '13.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('882', 'TENENBAUMS COMMAND', 'A Taut Display of a Pioneer And a Man who must Reach a Girl in The Gulf of Mexico', '2006', '1', null, '4', '0.99', '99', '24.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('883', 'TEQUILA PAST', 'A Action-Packed Panorama of a Mad Scientist And a Robot who must Challenge a Student in Nigeria', '2006', '1', null, '6', '4.99', '53', '17.99', 'PG', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('884', 'TERMINATOR CLUB', 'A Touching Story of a Crocodile And a Girl who must Sink a Man in The Gulf of Mexico', '2006', '1', null, '5', '4.99', '88', '11.99', 'R', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('885', 'TEXAS WATCH', 'A Awe-Inspiring Yarn of a Student And a Teacher who must Fight a Teacher in An Abandoned Amusement Park', '2006', '1', null, '7', '0.99', '179', '22.99', 'NC-17', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('886', 'THEORY MERMAID', 'A Fateful Yarn of a Composer And a Monkey who must Vanquish a Womanizer in The First Manned Space Station', '2006', '1', null, '5', '0.99', '184', '9.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('887', 'THIEF PELICAN', 'A Touching Documentary of a Madman And a Mad Scientist who must Outrace a Feminist in An Abandoned Mine Shaft', '2006', '1', null, '5', '4.99', '135', '28.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('888', 'THIN SAGEBRUSH', 'A Emotional Drama of a Husband And a Lumberjack who must Build a Cat in Ancient India', '2006', '1', null, '5', '4.99', '53', '9.99', 'PG-13', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('889', 'TIES HUNGER', 'A Insightful Saga of a Astronaut And a Explorer who must Pursue a Mad Scientist in A U-Boat', '2006', '1', null, '3', '4.99', '111', '28.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('890', 'TIGHTS DAWN', 'A Thrilling Epistle of a Boat And a Secret Agent who must Face a Boy in A Baloon', '2006', '1', null, '5', '0.99', '172', '14.99', 'R', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('891', 'TIMBERLAND SKY', 'A Boring Display of a Man And a Dog who must Redeem a Girl in A U-Boat', '2006', '1', null, '3', '0.99', '69', '13.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('892', 'TITANIC BOONDOCK', 'A Brilliant Reflection of a Feminist And a Dog who must Fight a Boy in A Baloon Factory', '2006', '1', null, '3', '4.99', '104', '18.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('893', 'TITANS JERK', 'A Unbelieveable Panorama of a Feminist And a Sumo Wrestler who must Challenge a Technical Writer in Ancient China', '2006', '1', null, '4', '4.99', '91', '11.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('894', 'TOMATOES HELLFIGHTERS', 'A Thoughtful Epistle of a Madman And a Astronaut who must Overcome a Monkey in A Shark Tank', '2006', '1', null, '6', '0.99', '68', '23.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('895', 'TOMORROW HUSTLER', 'A Thoughtful Story of a Moose And a Husband who must Face a Secret Agent in The Sahara Desert', '2006', '1', null, '3', '2.99', '142', '21.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('896', 'TOOTSIE PILOT', 'A Awe-Inspiring Documentary of a Womanizer And a Pastry Chef who must Kill a Lumberjack in Berlin', '2006', '1', null, '3', '0.99', '157', '10.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('897', 'TORQUE BOUND', 'A Emotional Display of a Crocodile And a Husband who must Reach a Man in Ancient Japan', '2006', '1', null, '3', '4.99', '179', '27.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('898', 'TOURIST PELICAN', 'A Boring Story of a Butler And a Astronaut who must Outrace a Pioneer in Australia', '2006', '1', null, '4', '4.99', '152', '18.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('899', 'TOWERS HURRICANE', 'A Fateful Display of a Monkey And a Car who must Sink a Husband in A MySQL Convention', '2006', '1', null, '7', '0.99', '144', '14.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('900', 'TOWN ARK', 'A Awe-Inspiring Documentary of a Moose And a Madman who must Meet a Dog in An Abandoned Mine Shaft', '2006', '1', null, '6', '2.99', '136', '17.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('901', 'TRACY CIDER', 'A Touching Reflection of a Database Administrator And a Madman who must Build a Lumberjack in Nigeria', '2006', '1', null, '3', '0.99', '142', '29.99', 'G', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('902', 'TRADING PINOCCHIO', 'A Emotional Character Study of a Student And a Explorer who must Discover a Frisbee in The First Manned Space Station', '2006', '1', null, '6', '4.99', '170', '22.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('903', 'TRAFFIC HOBBIT', 'A Amazing Epistle of a Squirrel And a Lumberjack who must Succumb a Database Administrator in A U-Boat', '2006', '1', null, '5', '4.99', '139', '13.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('904', 'TRAIN BUNCH', 'A Thrilling Character Study of a Robot And a Squirrel who must Face a Dog in Ancient India', '2006', '1', null, '3', '4.99', '71', '26.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('905', 'TRAINSPOTTING STRANGERS', 'A Fast-Paced Drama of a Pioneer And a Mad Cow who must Challenge a Madman in Ancient Japan', '2006', '1', null, '7', '4.99', '132', '10.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('906', 'TRAMP OTHERS', 'A Brilliant Display of a Composer And a Cat who must Succumb a A Shark in Ancient India', '2006', '1', null, '4', '0.99', '171', '27.99', 'PG', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('907', 'TRANSLATION SUMMER', 'A Touching Reflection of a Man And a Monkey who must Pursue a Womanizer in A MySQL Convention', '2006', '1', null, '4', '0.99', '168', '10.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('908', 'TRAP GUYS', 'A Unbelieveable Story of a Boy And a Mad Cow who must Challenge a Database Administrator in The Sahara Desert', '2006', '1', null, '3', '4.99', '110', '11.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('909', 'TREASURE COMMAND', 'A Emotional Saga of a Car And a Madman who must Discover a Pioneer in California', '2006', '1', null, '3', '0.99', '102', '28.99', 'PG-13', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('910', 'TREATMENT JEKYLL', 'A Boring Story of a Teacher And a Student who must Outgun a Cat in An Abandoned Mine Shaft', '2006', '1', null, '3', '0.99', '87', '19.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('911', 'TRIP NEWTON', 'A Fanciful Character Study of a Lumberjack And a Car who must Discover a Cat in An Abandoned Amusement Park', '2006', '1', null, '7', '4.99', '64', '14.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('912', 'TROJAN TOMORROW', 'A Astounding Panorama of a Husband And a Sumo Wrestler who must Pursue a Boat in Ancient India', '2006', '1', null, '3', '2.99', '52', '9.99', 'PG', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('913', 'TROOPERS METAL', 'A Fanciful Drama of a Monkey And a Feminist who must Sink a Man in Berlin', '2006', '1', null, '3', '0.99', '115', '20.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('914', 'TROUBLE DATE', 'A Lacklusture Panorama of a Forensic Psychologist And a Woman who must Kill a Explorer in Ancient Japan', '2006', '1', null, '6', '2.99', '61', '13.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('915', 'TRUMAN CRAZY', 'A Thrilling Epistle of a Moose And a Boy who must Meet a Database Administrator in A Monastery', '2006', '1', null, '7', '4.99', '92', '9.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('916', 'TURN STAR', 'A Stunning Tale of a Man And a Monkey who must Chase a Student in New Orleans', '2006', '1', null, '3', '2.99', '80', '10.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('917', 'TUXEDO MILE', 'A Boring Drama of a Man And a Forensic Psychologist who must Face a Frisbee in Ancient India', '2006', '1', null, '3', '2.99', '152', '24.99', 'R', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('918', 'TWISTED PIRATES', 'A Touching Display of a Frisbee And a Boat who must Kill a Girl in A MySQL Convention', '2006', '1', null, '4', '4.99', '152', '23.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('919', 'TYCOON GATHERING', 'A Emotional Display of a Husband And a A Shark who must Succumb a Madman in A Manhattan Penthouse', '2006', '1', null, '3', '4.99', '82', '17.99', 'G', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('920', 'UNBREAKABLE KARATE', 'A Amazing Character Study of a Robot And a Student who must Chase a Robot in Australia', '2006', '1', null, '3', '0.99', '62', '16.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('921', 'UNCUT SUICIDES', 'A Intrepid Yarn of a Explorer And a Pastry Chef who must Pursue a Mad Cow in A U-Boat', '2006', '1', null, '7', '2.99', '172', '29.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('922', 'UNDEFEATED DALMATIONS', 'A Unbelieveable Display of a Crocodile And a Feminist who must Overcome a Moose in An Abandoned Amusement Park', '2006', '1', null, '7', '4.99', '107', '22.99', 'PG-13', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('923', 'UNFAITHFUL KILL', 'A Taut Documentary of a Waitress And a Mad Scientist who must Battle a Technical Writer in New Orleans', '2006', '1', null, '7', '2.99', '78', '12.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('924', 'UNFORGIVEN ZOOLANDER', 'A Taut Epistle of a Monkey And a Sumo Wrestler who must Vanquish a A Shark in A Baloon Factory', '2006', '1', null, '7', '0.99', '129', '15.99', 'PG', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('925', 'UNITED PILOT', 'A Fast-Paced Reflection of a Cat And a Mad Cow who must Fight a Car in The Sahara Desert', '2006', '1', null, '3', '0.99', '164', '27.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('926', 'UNTOUCHABLES SUNRISE', 'A Amazing Documentary of a Woman And a Astronaut who must Outrace a Teacher in An Abandoned Fun House', '2006', '1', null, '5', '2.99', '120', '11.99', 'NC-17', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('927', 'UPRISING UPTOWN', 'A Fanciful Reflection of a Boy And a Butler who must Pursue a Woman in Berlin', '2006', '1', null, '6', '2.99', '174', '16.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('928', 'UPTOWN YOUNG', 'A Fateful Documentary of a Dog And a Hunter who must Pursue a Teacher in An Abandoned Amusement Park', '2006', '1', null, '5', '2.99', '84', '16.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('929', 'USUAL UNTOUCHABLES', 'A Touching Display of a Explorer And a Lumberjack who must Fight a Forensic Psychologist in A Shark Tank', '2006', '1', null, '5', '4.99', '128', '21.99', 'PG-13', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('930', 'VACATION BOONDOCK', 'A Fanciful Character Study of a Secret Agent And a Mad Scientist who must Reach a Teacher in Australia', '2006', '1', null, '4', '2.99', '145', '23.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('931', 'VALENTINE VANISHING', 'A Thrilling Display of a Husband And a Butler who must Reach a Pastry Chef in California', '2006', '1', null, '7', '0.99', '48', '9.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('932', 'VALLEY PACKER', 'A Astounding Documentary of a Astronaut And a Boy who must Outrace a Sumo Wrestler in Berlin', '2006', '1', null, '3', '0.99', '73', '21.99', 'G', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('933', 'VAMPIRE WHALE', 'A Epic Story of a Lumberjack And a Monkey who must Confront a Pioneer in A MySQL Convention', '2006', '1', null, '4', '4.99', '126', '11.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('934', 'VANILLA DAY', 'A Fast-Paced Saga of a Girl And a Forensic Psychologist who must Redeem a Girl in Nigeria', '2006', '1', null, '7', '4.99', '122', '20.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('935', 'VANISHED GARDEN', 'A Intrepid Character Study of a Squirrel And a A Shark who must Kill a Lumberjack in California', '2006', '1', null, '5', '0.99', '142', '17.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('936', 'VANISHING ROCKY', 'A Brilliant Reflection of a Man And a Woman who must Conquer a Pioneer in A MySQL Convention', '2006', '1', null, '3', '2.99', '123', '21.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('937', 'VARSITY TRIP', 'A Action-Packed Character Study of a Astronaut And a Explorer who must Reach a Monkey in A MySQL Convention', '2006', '1', null, '7', '2.99', '85', '14.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('938', 'VELVET TERMINATOR', 'A Lacklusture Tale of a Pastry Chef And a Technical Writer who must Confront a Crocodile in An Abandoned Amusement Park', '2006', '1', null, '3', '4.99', '173', '14.99', 'R', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('939', 'VERTIGO NORTHWEST', 'A Unbelieveable Display of a Mad Scientist And a Mad Scientist who must Outgun a Mad Cow in Ancient Japan', '2006', '1', null, '4', '2.99', '90', '17.99', 'R', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('940', 'VICTORY ACADEMY', 'A Insightful Epistle of a Mad Scientist And a Explorer who must Challenge a Cat in The Sahara Desert', '2006', '1', null, '6', '0.99', '64', '19.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('941', 'VIDEOTAPE ARSENIC', 'A Lacklusture Display of a Girl And a Astronaut who must Succumb a Student in Australia', '2006', '1', null, '4', '4.99', '145', '10.99', 'NC-17', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('942', 'VIETNAM SMOOCHY', 'A Lacklusture Display of a Butler And a Man who must Sink a Explorer in Soviet Georgia', '2006', '1', null, '7', '0.99', '174', '27.99', 'PG-13', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('943', 'VILLAIN DESPERATE', 'A Boring Yarn of a Pioneer And a Feminist who must Redeem a Cat in An Abandoned Amusement Park', '2006', '1', null, '4', '4.99', '76', '27.99', 'PG-13', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('944', 'VIRGIN DAISY', 'A Awe-Inspiring Documentary of a Robot And a Mad Scientist who must Reach a Database Administrator in A Shark Tank', '2006', '1', null, '6', '4.99', '179', '29.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('945', 'VIRGINIAN PLUTO', 'A Emotional Panorama of a Dentist And a Crocodile who must Meet a Boy in Berlin', '2006', '1', null, '5', '0.99', '164', '22.99', 'R', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('946', 'VIRTUAL SPOILERS', 'A Fateful Tale of a Database Administrator And a Squirrel who must Discover a Student in Soviet Georgia', '2006', '1', null, '3', '4.99', '144', '14.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('947', 'VISION TORQUE', 'A Thoughtful Documentary of a Dog And a Man who must Sink a Man in A Shark Tank', '2006', '1', null, '5', '0.99', '59', '16.99', 'PG-13', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('948', 'VOICE PEACH', 'A Amazing Panorama of a Pioneer And a Student who must Overcome a Mad Scientist in A Manhattan Penthouse', '2006', '1', null, '6', '0.99', '139', '22.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('949', 'VOLCANO TEXAS', 'A Awe-Inspiring Yarn of a Hunter And a Feminist who must Challenge a Dentist in The Outback', '2006', '1', null, '6', '0.99', '157', '27.99', 'NC-17', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('950', 'VOLUME HOUSE', 'A Boring Tale of a Dog And a Woman who must Meet a Dentist in California', '2006', '1', null, '7', '4.99', '132', '12.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('951', 'VOYAGE LEGALLY', 'A Epic Tale of a Squirrel And a Hunter who must Conquer a Boy in An Abandoned Mine Shaft', '2006', '1', null, '6', '0.99', '78', '28.99', 'PG-13', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('952', 'WAGON JAWS', 'A Intrepid Drama of a Moose And a Boat who must Kill a Explorer in A Manhattan Penthouse', '2006', '1', null, '7', '2.99', '152', '17.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('953', 'WAIT CIDER', 'A Intrepid Epistle of a Woman And a Forensic Psychologist who must Succumb a Astronaut in A Manhattan Penthouse', '2006', '1', null, '3', '0.99', '112', '9.99', 'PG-13', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('954', 'WAKE JAWS', 'A Beautiful Saga of a Feminist And a Composer who must Challenge a Moose in Berlin', '2006', '1', null, '7', '4.99', '73', '18.99', 'G', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('955', 'WALLS ARTIST', 'A Insightful Panorama of a Teacher And a Teacher who must Overcome a Mad Cow in An Abandoned Fun House', '2006', '1', null, '7', '4.99', '135', '19.99', 'PG', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('956', 'WANDA CHAMBER', 'A Insightful Drama of a A Shark And a Pioneer who must Find a Womanizer in The Outback', '2006', '1', null, '7', '4.99', '107', '23.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('957', 'WAR NOTTING', 'A Boring Drama of a Teacher And a Sumo Wrestler who must Challenge a Secret Agent in The Canadian Rockies', '2006', '1', null, '7', '4.99', '80', '26.99', 'G', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('958', 'WARDROBE PHANTOM', 'A Action-Packed Display of a Mad Cow And a Astronaut who must Kill a Car in Ancient India', '2006', '1', null, '6', '2.99', '178', '19.99', 'G', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('959', 'WARLOCK WEREWOLF', 'A Astounding Yarn of a Pioneer And a Crocodile who must Defeat a A Shark in The Outback', '2006', '1', null, '6', '2.99', '83', '10.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('960', 'WARS PLUTO', 'A Taut Reflection of a Teacher And a Database Administrator who must Chase a Madman in The Sahara Desert', '2006', '1', null, '5', '2.99', '128', '15.99', 'G', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('961', 'WASH HEAVENLY', 'A Awe-Inspiring Reflection of a Cat And a Pioneer who must Escape a Hunter in Ancient China', '2006', '1', null, '7', '4.99', '161', '22.99', 'R', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('962', 'WASTELAND DIVINE', 'A Fanciful Story of a Database Administrator And a Womanizer who must Fight a Database Administrator in Ancient China', '2006', '1', null, '7', '2.99', '85', '18.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('963', 'WATCH TRACY', 'A Fast-Paced Yarn of a Dog And a Frisbee who must Conquer a Hunter in Nigeria', '2006', '1', null, '5', '0.99', '78', '12.99', 'PG', 'Trailers,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('964', 'WATERFRONT DELIVERANCE', 'A Unbelieveable Documentary of a Dentist And a Technical Writer who must Build a Womanizer in Nigeria', '2006', '1', null, '4', '4.99', '61', '17.99', 'G', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('965', 'WATERSHIP FRONTIER', 'A Emotional Yarn of a Boat And a Crocodile who must Meet a Moose in Soviet Georgia', '2006', '1', null, '6', '0.99', '112', '28.99', 'G', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('966', 'WEDDING APOLLO', 'A Action-Packed Tale of a Student And a Waitress who must Conquer a Lumberjack in An Abandoned Mine Shaft', '2006', '1', null, '3', '0.99', '70', '14.99', 'PG', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('967', 'WEEKEND PERSONAL', 'A Fast-Paced Documentary of a Car And a Butler who must Find a Frisbee in A Jet Boat', '2006', '1', null, '5', '2.99', '134', '26.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('968', 'WEREWOLF LOLA', 'A Fanciful Story of a Man And a Sumo Wrestler who must Outrace a Student in A Monastery', '2006', '1', null, '6', '4.99', '79', '19.99', 'G', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('969', 'WEST LION', 'A Intrepid Drama of a Butler And a Lumberjack who must Challenge a Database Administrator in A Manhattan Penthouse', '2006', '1', null, '4', '4.99', '159', '29.99', 'G', 'Trailers', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('970', 'WESTWARD SEABISCUIT', 'A Lacklusture Tale of a Butler And a Husband who must Face a Boy in Ancient China', '2006', '1', null, '7', '0.99', '52', '11.99', 'NC-17', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('971', 'WHALE BIKINI', 'A Intrepid Story of a Pastry Chef And a Database Administrator who must Kill a Feminist in A MySQL Convention', '2006', '1', null, '4', '4.99', '109', '11.99', 'PG-13', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('972', 'WHISPERER GIANT', 'A Intrepid Story of a Dentist And a Hunter who must Confront a Monkey in Ancient Japan', '2006', '1', null, '4', '4.99', '59', '24.99', 'PG-13', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('973', 'WIFE TURN', 'A Awe-Inspiring Epistle of a Teacher And a Feminist who must Confront a Pioneer in Ancient Japan', '2006', '1', null, '3', '4.99', '183', '27.99', 'NC-17', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('974', 'WILD APOLLO', 'A Beautiful Story of a Monkey And a Sumo Wrestler who must Conquer a A Shark in A MySQL Convention', '2006', '1', null, '4', '0.99', '181', '24.99', 'R', 'Trailers,Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('975', 'WILLOW TRACY', 'A Brilliant Panorama of a Boat And a Astronaut who must Challenge a Teacher in A Manhattan Penthouse', '2006', '1', null, '6', '2.99', '137', '22.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('976', 'WIND PHANTOM', 'A Touching Saga of a Madman And a Forensic Psychologist who must Build a Sumo Wrestler in An Abandoned Mine Shaft', '2006', '1', null, '6', '0.99', '111', '12.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('977', 'WINDOW SIDE', 'A Astounding Character Study of a Womanizer And a Hunter who must Escape a Robot in A Monastery', '2006', '1', null, '3', '2.99', '85', '25.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('978', 'WISDOM WORKER', 'A Unbelieveable Saga of a Forensic Psychologist And a Student who must Face a Squirrel in The First Manned Space Station', '2006', '1', null, '3', '0.99', '98', '12.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('979', 'WITCHES PANIC', 'A Awe-Inspiring Drama of a Secret Agent And a Hunter who must Fight a Moose in Nigeria', '2006', '1', null, '6', '4.99', '100', '10.99', 'NC-17', 'Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('980', 'WIZARD COLDBLOODED', 'A Lacklusture Display of a Robot And a Girl who must Defeat a Sumo Wrestler in A MySQL Convention', '2006', '1', null, '4', '4.99', '75', '12.99', 'PG', 'Commentaries,Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('981', 'WOLVES DESIRE', 'A Fast-Paced Drama of a Squirrel And a Robot who must Succumb a Technical Writer in A Manhattan Penthouse', '2006', '1', null, '7', '0.99', '55', '13.99', 'NC-17', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('982', 'WOMEN DORADO', 'A Insightful Documentary of a Waitress And a Butler who must Vanquish a Composer in Australia', '2006', '1', null, '4', '0.99', '126', '23.99', 'R', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('983', 'WON DARES', 'A Unbelieveable Documentary of a Teacher And a Monkey who must Defeat a Explorer in A U-Boat', '2006', '1', null, '7', '2.99', '105', '18.99', 'PG', 'Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('984', 'WONDERFUL DROP', 'A Boring Panorama of a Woman And a Madman who must Overcome a Butler in A U-Boat', '2006', '1', null, '3', '2.99', '126', '20.99', 'NC-17', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('985', 'WONDERLAND CHRISTMAS', 'A Awe-Inspiring Character Study of a Waitress And a Car who must Pursue a Mad Scientist in The First Manned Space Station', '2006', '1', null, '4', '4.99', '111', '19.99', 'PG', 'Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('986', 'WONKA SEA', 'A Brilliant Saga of a Boat And a Mad Scientist who must Meet a Moose in Ancient India', '2006', '1', null, '6', '2.99', '85', '24.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('987', 'WORDS HUNTER', 'A Action-Packed Reflection of a Composer And a Mad Scientist who must Face a Pioneer in A MySQL Convention', '2006', '1', null, '3', '2.99', '116', '13.99', 'PG', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('988', 'WORKER TARZAN', 'A Action-Packed Yarn of a Secret Agent And a Technical Writer who must Battle a Sumo Wrestler in The First Manned Space Station', '2006', '1', null, '7', '2.99', '139', '26.99', 'R', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('989', 'WORKING MICROCOSMOS', 'A Stunning Epistle of a Dentist And a Dog who must Kill a Madman in Ancient China', '2006', '1', null, '4', '4.99', '74', '22.99', 'R', 'Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('990', 'WORLD LEATHERNECKS', 'A Unbelieveable Tale of a Pioneer And a Astronaut who must Overcome a Robot in An Abandoned Amusement Park', '2006', '1', null, '3', '0.99', '171', '13.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('991', 'WORST BANGER', 'A Thrilling Drama of a Madman And a Dentist who must Conquer a Boy in The Outback', '2006', '1', null, '4', '2.99', '185', '26.99', 'PG', 'Deleted Scenes,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('992', 'WRATH MILE', 'A Intrepid Reflection of a Technical Writer And a Hunter who must Defeat a Sumo Wrestler in A Monastery', '2006', '1', null, '5', '0.99', '176', '17.99', 'NC-17', 'Trailers,Commentaries', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('993', 'WRONG BEHAVIOR', 'A Emotional Saga of a Crocodile And a Sumo Wrestler who must Discover a Mad Cow in New Orleans', '2006', '1', null, '6', '2.99', '178', '10.99', 'PG-13', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('994', 'WYOMING STORM', 'A Awe-Inspiring Panorama of a Robot And a Boat who must Overcome a Feminist in A U-Boat', '2006', '1', null, '6', '4.99', '100', '29.99', 'PG-13', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('995', 'YENTL IDAHO', 'A Amazing Display of a Robot And a Astronaut who must Fight a Womanizer in Berlin', '2006', '1', null, '5', '4.99', '86', '11.99', 'R', 'Trailers,Commentaries,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('996', 'YOUNG LANGUAGE', 'A Unbelieveable Yarn of a Boat And a Database Administrator who must Meet a Boy in The First Manned Space Station', '2006', '1', null, '6', '0.99', '183', '9.99', 'G', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('997', 'YOUTH KICK', 'A Touching Drama of a Teacher And a Cat who must Challenge a Technical Writer in A U-Boat', '2006', '1', null, '4', '0.99', '179', '14.99', 'NC-17', 'Trailers,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('998', 'ZHIVAGO CORE', 'A Fateful Yarn of a Composer And a Man who must Face a Boy in The Canadian Rockies', '2006', '1', null, '6', '0.99', '105', '10.99', 'NC-17', 'Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('999', 'ZOOLANDER FICTION', 'A Fateful Reflection of a Waitress And a Boat who must Discover a Sumo Wrestler in Ancient China', '2006', '1', null, '5', '2.99', '101', '28.99', 'R', 'Trailers,Deleted Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('1000', 'ZORRO ARK', 'A Intrepid Panorama of a Mad Scientist And a Boy who must Redeem a Boy in A Monastery', '2006', '1', null, '3', '4.99', '50', '18.99', 'NC-17', 'Trailers,Commentaries,Behind the Scenes', '2006-02-15 05:03:42');
INSERT INTO `hap_film` VALUES ('1001', 'qw', '22', null, '2', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-19 14:17:14');
INSERT INTO `hap_film` VALUES ('1005', 'zzzzzzzzzzzzz', 'xxxxxxxxxx', null, '5', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-19 14:23:12');
INSERT INTO `hap_film` VALUES ('1006', 'zzzzzzzzzzzzz', 'xxxxxxxxxx', null, '5', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-19 14:35:04');
INSERT INTO `hap_film` VALUES ('1008', 'qw', '22', null, '2', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-19 16:06:30');
INSERT INTO `hap_film` VALUES ('1009', '&#26159;&#30340;&#21457;&#36865;&#21040;', '&#37117;&#26159;', null, '3', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-19 16:27:24');
INSERT INTO `hap_film` VALUES ('1010', 'ww', 'www', null, '1', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-29 18:50:19');
INSERT INTO `hap_film` VALUES ('1011', 'zxzx', 'vvvv', null, '2', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-29 19:47:05');
INSERT INTO `hap_film` VALUES ('1012', 'wwq', 'eew', null, '2', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-29 19:48:38');
INSERT INTO `hap_film` VALUES ('1013', 'ty', 'tyu', null, '1', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-29 19:52:34');
INSERT INTO `hap_film` VALUES ('1014', 'xx', 'xx', null, '1', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-29 20:01:30');
INSERT INTO `hap_film` VALUES ('1015', '12', '3232', null, '1', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-29 20:27:35');
INSERT INTO `hap_film` VALUES ('1016', '213', '21321', null, '1', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-29 20:32:55');
INSERT INTO `hap_film` VALUES ('1017', 'e2e', '22', null, '1', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-29 20:33:21');
INSERT INTO `hap_film` VALUES ('1018', 'qw', 'wq', null, '2', null, '3', '4.99', null, '19.99', 'G', null, '2016-12-29 20:34:42');
INSERT INTO `hap_film` VALUES ('1021', 'ww', 'www', null, '1', null, '3', '4.99', null, '19.99', 'G', '', '2016-12-29 18:50:19');
INSERT INTO `hap_film` VALUES ('1022', 'iu', null, null, '5', null, '3', '4.99', null, '19.99', 'G', null, '2017-01-06 17:10:30');
INSERT INTO `hap_film` VALUES ('1024', '测试1', null, null, '2', null, '3', '4.99', null, '19.99', 'G', null, '2017-01-06 17:13:51');
INSERT INTO `hap_film` VALUES ('1026', 'ewewe', 'fdvdv', null, '2', null, '3', '4.99', null, '19.99', 'G', null, '2017-01-06 19:28:20');
INSERT INTO `hap_film` VALUES ('1027', 'sfafsaf', 'sfsafsaf', null, '1', null, '3', '4.99', null, '19.99', 'G', null, '2017-01-06 19:31:52');
INSERT INTO `hap_film` VALUES ('1028', 'qqqqqqqqqqqqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqqqqqqqqqqqqq', null, '1', null, '3', '4.99', null, '19.99', 'G', null, '2017-01-06 19:32:19');
INSERT INTO `hap_film` VALUES ('1029', 'htrhtr', 'htrhtrh', null, '2', null, '3', '4.99', null, '19.99', 'G', null, '2017-01-06 19:50:31');

-- ----------------------------
-- Table structure for hap_inv_inventory_items
-- ----------------------------
DROP TABLE IF EXISTS `hap_inv_inventory_items`;
CREATE TABLE `hap_inv_inventory_items` (
  `INVENTORY_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '物料ID',
  `ITEM_CODE` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物料编码',
  `ITEM_UOM` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物料单位',
  `ITEM_DESCRIPTION` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '物料描述',
  `ORDER_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '是否能用于销售',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '生效起始时间',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '生效结束时间',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '启用标识',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '请求号',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`INVENTORY_ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8 COMMENT='物料主数据';

-- ----------------------------
-- Records of hap_inv_inventory_items
-- ----------------------------
INSERT INTO `hap_inv_inventory_items` VALUES ('1001', 'ITEM001', 'EA', 'HFM财务管理软件', 'Y', null, null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_inv_inventory_items` VALUES ('1002', 'ITEM002', 'EA', 'HWMS仓储管理系统', 'Y', null, null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_inv_inventory_items` VALUES ('1003', 'ITEM003', 'EA', 'HAP应用开发平台', 'N', null, null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_inv_inventory_items` VALUES ('1004', 'ITEM004', 'EA', 'HEC费用控制系统', 'Y', null, null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_inv_inventory_items` VALUES ('1005', 'ITEM005', 'EA', 'HFS财务共享系统', 'Y', '2016-10-01 00:00:00', null, 'Y', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', '1', '-1', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_language
-- ----------------------------
DROP TABLE IF EXISTS `hap_language`;
CREATE TABLE `hap_language` (
  `language_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hap_language
-- ----------------------------
INSERT INTO `hap_language` VALUES ('1', 'English', '2006-02-15 05:02:19');
INSERT INTO `hap_language` VALUES ('2', 'Italian', '2006-02-15 05:02:19');
INSERT INTO `hap_language` VALUES ('3', 'Japanese', '2006-02-15 05:02:19');
INSERT INTO `hap_language` VALUES ('4', 'Mandarin', '2006-02-15 05:02:19');
INSERT INTO `hap_language` VALUES ('5', 'French', '2006-02-15 05:02:19');
INSERT INTO `hap_language` VALUES ('6', 'German', '2006-02-15 05:02:19');

-- ----------------------------
-- Table structure for hap_om_order_headers
-- ----------------------------
DROP TABLE IF EXISTS `hap_om_order_headers`;
CREATE TABLE `hap_om_order_headers` (
  `HEADER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单头ID',
  `ORDER_NUMBER` varchar(60) NOT NULL COMMENT '订单编号',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司ID',
  `ORDER_DATE` datetime NOT NULL COMMENT '订单日期',
  `ORDER_STATUS` varchar(30) NOT NULL COMMENT '订单状态',
  `CUSTOMER_ID` bigint(20) NOT NULL COMMENT '客户ID',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '请求号',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`HEADER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1218 DEFAULT CHARSET=utf8 COMMENT='销售订单头表';

-- ----------------------------
-- Records of hap_om_order_headers
-- ----------------------------
INSERT INTO `hap_om_order_headers` VALUES ('1201', '120101', '101', '2017-01-04 17:31:16', '已接收', '201', '1', '-1', '-1', '2017-01-11 17:33:34', '-1', '-1', '2017-01-11 17:33:34', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1202', '120102', '102', '2017-01-10 17:36:22', '已接收', '203', '1', '-1', '-1', '2017-01-11 17:36:51', '-1', '-1', '2017-01-11 17:36:51', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1203', '120103', '103', '2017-01-03 17:32:06', '未接收', '204', '1', '-1', '-1', '2017-01-11 17:37:59', '-1', '-1', '2017-01-11 17:37:59', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1204', '120104', '104', '2017-01-12 21:38:14', '已接收', '201', '1', '-1', '-1', '2017-01-11 17:38:36', '-1', '-1', '2017-01-11 17:38:36', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1205', '120105', '105', '2017-01-03 11:38:53', '未接收', '202', '1', '-1', '-1', '2017-01-11 17:39:16', '-1', '-1', '2017-01-11 17:39:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1206', '120106', '102', '2017-01-03 17:39:30', '已接收', '203', '1', '-1', '-1', '2017-01-11 17:39:49', '-1', '-1', '2017-01-11 17:39:49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1207', '120107', '102', '2017-01-03 17:39:30', '已接收', '203', '1', '-1', '-1', '2017-01-14 11:35:03', '-1', '-1', '2017-01-14 11:35:03', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1208', '120108', '102', '2017-01-03 17:39:30', '已接收', '203', '1', '-1', '-1', '2017-01-14 11:35:14', '-1', '-1', '2017-01-14 11:35:14', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1209', '120109', '102', '2017-01-03 17:39:30', '已接收', '203', '1', '-1', '-1', '2017-01-14 11:35:20', '-1', '-1', '2017-01-14 11:35:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1210', '120111', '102', '2017-01-03 17:39:30', '已接收', '203', '1', '-1', '-1', '2017-01-14 11:35:25', '-1', '-1', '2017-01-14 11:35:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1211', '120112', '102', '2017-01-03 17:39:30', '已接收', '203', '1', '-1', '-1', '2017-01-14 11:35:30', '-1', '-1', '2017-01-14 11:35:30', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1212', '122222', '123', '2017-01-11 00:47:13', '已接收', '202', '1', '-1', '-1', '2017-01-15 00:48:14', '-1', '-1', '2017-01-15 00:48:14', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1213', '121122', '105', '2017-01-15 00:50:03', '已接收', '204', '1', '-1', '-1', '2017-01-15 00:50:03', '-1', '-1', '2017-01-15 00:50:03', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1214', '121122', '105', '2017-01-15 01:40:41', '已接收', '204', '1', '-1', '-1', '2017-01-15 01:40:41', '-1', '-1', '2017-01-15 01:40:41', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1215', '1211', '102', '2017-01-06 00:00:00', '已接收', '202', '1', '-1', '-1', '2017-01-15 10:44:42', '10001', '10001', '2017-01-15 10:44:42', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1216', '1121', '103', '2017-01-06 00:00:00', '未接收', '202', '1', '-1', '-1', '2017-01-15 10:56:04', '10001', '10001', '2017-01-15 10:56:04', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_headers` VALUES ('1217', '2', '101', '2017-01-12 00:00:00', '已接收', '203', '1', '-1', '-1', '2017-01-15 18:05:04', '10001', '10001', '2017-01-15 18:05:04', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_om_order_lines
-- ----------------------------
DROP TABLE IF EXISTS `hap_om_order_lines`;
CREATE TABLE `hap_om_order_lines` (
  `LINE_ID` bigint(20) NOT NULL COMMENT '订单行ID',
  `HEADER_ID` bigint(20) NOT NULL COMMENT '订单头ID',
  `LINE_NUMBER` bigint(20) NOT NULL COMMENT '行号',
  `INVENTORY_ITEM_ID` bigint(20) NOT NULL COMMENT '产品ID',
  `ORDERD_QUANTITY` bigint(20) NOT NULL COMMENT '数量',
  `ORDER_QUANTITY_UOM` varchar(30) NOT NULL COMMENT '产品单位',
  `UNIT_SELLING_PRICE` bigint(20) NOT NULL COMMENT '销售单价',
  `DESCRIPTION` varchar(240) NOT NULL COMMENT '备注',
  `COMPANY_ID` bigint(20) NOT NULL COMMENT '公司ID',
  `ADDITION1` varchar(150) DEFAULT NULL COMMENT '附加信息1',
  `ADDITION2` varchar(150) DEFAULT NULL COMMENT '附加信息2',
  `ADDITION3` varchar(150) DEFAULT NULL COMMENT '附加信息3',
  `ADDITION4` varchar(150) DEFAULT NULL COMMENT '附加信息4',
  `ADDITION5` varchar(150) DEFAULT NULL COMMENT '附加信息5',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1' COMMENT '行版本号，用来处理锁',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '请求号',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LINE_ID`),
  KEY `HAP_OM_ORDER_LINES _N1` (`HEADER_ID`),
  KEY `HAP_OM_ORDER_LINES _N2` (`INVENTORY_ITEM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='销售订单行表';

-- ----------------------------
-- Records of hap_om_order_lines
-- ----------------------------
INSERT INTO `hap_om_order_lines` VALUES ('1', '1201', '2', '12011', '10', '个', '22', '小米', '101', null, null, null, null, null, '1', '-1', '-1', '2017-01-11 17:43:45', '-1', '-1', '2017-01-11 17:43:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines` VALUES ('2', '1202', '3', '12012', '3', '个', '23', '三星', '102', null, null, null, null, null, '1', '-1', '-1', '2017-01-11 17:44:20', '-1', '-1', '2017-01-11 17:44:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines` VALUES ('3', '1203', '2', '12013', '1', '个', '1', '高跟鞋', '103', null, null, null, null, null, '1', '-1', '-1', '2017-01-11 19:25:12', '-1', '-1', '2017-01-11 19:25:12', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines` VALUES ('4', '1204', '2', '12014', '2', '个', '3', 'f', '104', null, null, null, null, null, '1', '-1', '-1', '2017-01-19 19:25:52', '-1', '-1', '2016-12-06 19:26:02', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines` VALUES ('5', '1205', '4', '12011', '23', '个', '22', '猪', '102', null, null, null, null, null, '1', '-1', '-1', '2017-01-13 16:15:38', '-1', '-1', '2017-01-13 16:15:38', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines` VALUES ('6', '1206', '8', '12014', '12', '个', '10', '手机', '104', null, null, null, null, null, '1', '-1', '-1', '2017-01-13 16:16:25', '-1', '-1', '2017-01-13 16:16:25', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines` VALUES ('7', '1207', '8', '12014', '12', '个', '10', '手机', '104', null, null, null, null, null, '1', '-1', '-1', '2017-01-14 11:36:41', '-1', '-1', '2017-01-14 11:36:41', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_om_order_lines` VALUES ('8', '1208', '8', '12014', '12', '个', '10', '手机', '104', null, null, null, null, null, '1', '-1', '-1', '2017-01-14 11:36:45', '-1', '-1', '2017-01-14 11:36:45', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hap_org_companys
-- ----------------------------
DROP TABLE IF EXISTS `hap_org_companys`;
CREATE TABLE `hap_org_companys` (
  `COMPANY_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `COMPANY_NUMBER` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司编号',
  `COMPANY_NAME` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公司名称',
  `ENABLED_FLAG` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Y' COMMENT '启用标识',
  `OBJECT_VERSION_NUMBER` decimal(20,0) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1' COMMENT '请求号',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `CREATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATED_BY` decimal(20,0) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` decimal(20,0) DEFAULT NULL,
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`COMPANY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COMMENT='公司主数据';

-- ----------------------------
-- Records of hap_org_companys
-- ----------------------------
INSERT INTO `hap_org_companys` VALUES ('101', 'HAND001', '汉得信息', 'Y', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_org_companys` VALUES ('102', 'HAND002', '汉得教育', 'Y', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_org_companys` VALUES ('103', 'HAND003', '汉得保理', 'Y', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_org_companys` VALUES ('104', 'HAND004', '随身科技', 'Y', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `hap_org_companys` VALUES ('105', 'HAND005', '夏尔科技', 'N', '1', '-1', '-1', '2016-08-24 16:48:17', '-1', '-1', '2016-08-24 16:48:17', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for hr_employee
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee`;
CREATE TABLE `hr_employee` (
  `EMPLOYEE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_CODE` varchar(30) NOT NULL COMMENT '员工编码',
  `NAME` varchar(50) NOT NULL COMMENT '员工姓名',
  `BORN_DATE` date DEFAULT NULL COMMENT '出生日期',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `MOBIL` varchar(50) DEFAULT NULL COMMENT '移动电话',
  `JOIN_DATE` date DEFAULT NULL COMMENT '入职日期',
  `GENDER` varchar(1) DEFAULT NULL COMMENT '性别',
  `CERTIFICATE_ID` varchar(100) NOT NULL COMMENT 'ID',
  `STATUS` varchar(50) NOT NULL COMMENT '状态',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `HR_EMPLOYEE_U2` (`CERTIFICATE_ID`),
  UNIQUE KEY `HR_EMPLOYEE_U1` (`EMPLOYEE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_employee
-- ----------------------------
INSERT INTO `hr_employee` VALUES ('10001', 'ADMIN', '管理员', '2000-01-01', 'shengyang.zhou@hand-china.com', '13764784777', '2016-06-15', 'M', '1', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_employee` VALUES ('10002', 'Rodgers', '罗杰斯', '2000-01-02', 'shengyang.zhou@hand-china.com', '139', '2016-06-16', 'M', '37132502', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_employee` VALUES ('10003', 'Hailen', '林海伦', '2000-01-03', 'shengyang.zhou@hand-china.com', '189', '2016-06-17', 'F', '37132503', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_employee` VALUES ('10004', 'Jessen', '周杰森', '2000-01-04', 'shengyang.zhou@hand-china.com', '13764784776', '2016-06-18', 'M', '37132511', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_employee` VALUES ('10005', 'Eric', '刘丹', '2000-01-05', 'eric.hap@126.com', '13876499', '2016-06-19', 'M', '5675453', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_employee` VALUES ('10006', 'Tony', '辰东', '2000-01-06', 'tony.hap@126.com', '1889343', '2016-06-20', 'M', '3445562', 'NORMAL', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');

-- ----------------------------
-- Table structure for hr_employee_assign
-- ----------------------------
DROP TABLE IF EXISTS `hr_employee_assign`;
CREATE TABLE `hr_employee_assign` (
  `ASSIGN_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` bigint(20) NOT NULL COMMENT '员工ID',
  `POSITION_ID` bigint(20) NOT NULL COMMENT '岗位ID',
  `PRIMARY_POSITION_FLAG` varchar(1) DEFAULT NULL COMMENT '主岗位标示',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`ASSIGN_ID`),
  UNIQUE KEY `HR_EMPLOYEE_ASSIGN_U1` (`EMPLOYEE_ID`,`POSITION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_employee_assign
-- ----------------------------
INSERT INTO `hr_employee_assign` VALUES ('10001', '10001', '10001', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10002', '10006', '10003', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10003', '10002', '10011', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10004', '10002', '10012', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10005', '10004', '10012', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10006', '10003', '10010', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_employee_assign` VALUES ('10007', '10005', '10009', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');

-- ----------------------------
-- Table structure for hr_org_position_b
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_position_b`;
CREATE TABLE `hr_org_position_b` (
  `POSITION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UNIT_ID` bigint(20) NOT NULL COMMENT '组织ID',
  `POSITION_CODE` varchar(50) DEFAULT NULL COMMENT '岗位编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '岗位名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '岗位描述',
  `PARENT_POSITION_ID` bigint(20) DEFAULT NULL COMMENT '父岗位ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`POSITION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_position_b
-- ----------------------------
INSERT INTO `hr_org_position_b` VALUES ('10001', '10002', 'ADMIN', '管理员', '管理员', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10002', '10002', 'CEO', '首席执行官', '首席执行官', '10001', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10003', '10003', 'TECT_INSPECTOR', '技术总监', '技术总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10004', '10007', 'SALE_INSPECTOR', '销售总监', '销售部门总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10005', '10008', 'FIN_INSPECTOR', '财务总监', '财务部总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10006', '10006', 'MARKET_INSPECTOR', '市场部总监', '市场部总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10007', '10005', '111428', '人事总监', '人力资源部总监', '10002', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10008', '10005', '101662', '人事经理', '人力资源部经理', '10007', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10009', '10005', '115189', '人事主管', '人事主管', '10008', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10010', '10005', '110143', '人事专员', '人事专员', '10009', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10011', '10004', '115769', '研发总监', '研发部门总监', '10003', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_b` VALUES ('10012', '10004', '115731', '研发工程师', '研发工程师', '10011', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');

-- ----------------------------
-- Table structure for hr_org_position_tl
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_position_tl`;
CREATE TABLE `hr_org_position_tl` (
  `POSITION_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`POSITION_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_position_tl
-- ----------------------------
INSERT INTO `hr_org_position_tl` VALUES ('10001', 'en_GB', 'ADMIN', 'ADMIN', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10001', 'zh_CN', '管理员', '管理员', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10002', 'en_GB', 'CEO', 'CEO', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10002', 'zh_CN', '首席执行官', '首席执行官', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10003', 'en_GB', 'TECH', 'Technical Director', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10003', 'zh_CN', '技术总监', '技术总监', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10004', 'en_GB', 'Sales Director', 'Sales Director', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10004', 'zh_CN', '销售总监', '销售部门总监', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10005', 'en_GB', 'Financial Controller', 'Financial Controller', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10005', 'zh_CN', '财务总监', '财务部总监', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10006', 'en_GB', 'Marketing Director', 'Marketing Director', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10006', 'zh_CN', '市场部总监', '市场部总监', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10007', 'en_GB', 'Human Resources Director', 'Human Resources Director', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10007', 'zh_CN', '人事总监', '人力资源部总监', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10008', 'en_GB', 'HR Manager', 'HR Manager', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10008', 'zh_CN', '人事经理', '人力资源部经理', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10009', 'en_GB', 'Human Resources Supervisor', 'Human Resources Supervisor', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10009', 'zh_CN', '人事主管', '人事主管', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10010', 'en_GB', 'HR Consultant', 'HR Consultant', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10010', 'zh_CN', '人事专员', '人事专员', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10011', 'en_GB', 'R & D Director', 'Research & Development Director', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10011', 'zh_CN', '研发总监', '研发部门总监', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10012', 'en_GB', 'R & D Engineer', 'R & D Engineer', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');
INSERT INTO `hr_org_position_tl` VALUES ('10012', 'zh_CN', '研发工程师', '研发工程师', '1', '-1', '-1', '-1', '2017-01-13 11:15:08', '-1', '2017-01-13 11:15:08', '-1');

-- ----------------------------
-- Table structure for hr_org_unit_b
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_unit_b`;
CREATE TABLE `hr_org_unit_b` (
  `UNIT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '父组织',
  `UNIT_CODE` varchar(50) DEFAULT NULL COMMENT '组织编码',
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `MANAGER_POSITION` bigint(20) DEFAULT NULL COMMENT '组织管理岗位',
  `COMPANY_ID` bigint(20) DEFAULT NULL COMMENT '公司ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`UNIT_ID`),
  UNIQUE KEY `HR_ORG_UNIT_U1` (`UNIT_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_unit_b
-- ----------------------------
INSERT INTO `hr_org_unit_b` VALUES ('10001', null, '1000', '汉得信息技术股份有限公司', '汉得信息技术股份有限公司', '10002', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10002', '10001', '100000', '汉得信息', '汉得信息', '10002', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10003', '10002', '100020', '技术部', '技术服务中心', '10003', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10004', '10003', '100040', '基础研发部', '基础研发部', '10011', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10005', '10002', '100050', '人力资源部', '人力资源部', '10007', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10006', '10002', '100060', '市场部', '市场部', '10006', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10007', '10002', '100070', '销售部', '销售部门', '10004', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_b` VALUES ('10008', '10002', '100080', '财务部', '财务部门', '10005', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');

-- ----------------------------
-- Table structure for hr_org_unit_tl
-- ----------------------------
DROP TABLE IF EXISTS `hr_org_unit_tl`;
CREATE TABLE `hr_org_unit_tl` (
  `UNIT_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL COMMENT '组织名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '组织描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`UNIT_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_org_unit_tl
-- ----------------------------
INSERT INTO `hr_org_unit_tl` VALUES ('10001', 'en_GB', 'Hand China Co.,Ltd', 'Hand China Co.,Ltd', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10001', 'zh_CN', '汉得信息技术股份有限公司', '汉得信息技术股份有限公司', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10002', 'en_GB', 'Hand', 'Hand', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10002', 'zh_CN', '汉得信息', '汉得信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10003', 'en_GB', 'TECH', 'TECH', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10003', 'zh_CN', '技术部', '技术服务中心', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10004', 'en_GB', 'R&D', 'Research & Developement', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10004', 'zh_CN', '基础研发部', '基础研发部', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10005', 'en_GB', 'HR', 'HR', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10005', 'zh_CN', '人力资源部', '人力资源部', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10006', 'en_GB', 'Marketing Department', 'Marketing Department', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10006', 'zh_CN', '市场部', '市场部', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10007', 'en_GB', 'Sales Department', 'Sales Department', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10007', 'zh_CN', '销售部', '销售部门', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10008', 'en_GB', 'Financial', 'Financial Management Department）', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `hr_org_unit_tl` VALUES ('10008', 'zh_CN', '财务部', '财务部门', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('quartzScheduler', 'LAPTOP-D4DL5VUB1484447868639', '1484478218679', '20000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_account_retrieve
-- ----------------------------
DROP TABLE IF EXISTS `sys_account_retrieve`;
CREATE TABLE `sys_account_retrieve` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `RETRIEVE_TYPE` varchar(30) DEFAULT NULL COMMENT '类型:NAME/PWD',
  `RETRIEVE_DATE` datetime DEFAULT NULL COMMENT '时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_account_retrieve
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment` (
  `ATTACHMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `NAME` varchar(40) DEFAULT NULL COMMENT '附件名称',
  `SOURCE_TYPE` varchar(30) DEFAULT NULL COMMENT '对应业务类型',
  `SOURCE_KEY` varchar(40) DEFAULT NULL COMMENT '业务主键',
  `STATUS` varchar(1) DEFAULT NULL COMMENT '状态',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '开始生效日期',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '失效时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENT_ID`),
  KEY `SYS_ATTACHMENT_N1` (`CATEGORY_ID`),
  KEY `SYS_ATTACHMENT_N2` (`SOURCE_TYPE`,`SOURCE_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_attach_category_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach_category_b`;
CREATE TABLE `sys_attach_category_b` (
  `CATEGORY_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY_NAME` varchar(40) DEFAULT NULL,
  `LEAF_FLAG` varchar(1) DEFAULT NULL,
  `DESCRIPTION` varchar(240) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `PARENT_CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PATH` varchar(200) DEFAULT NULL COMMENT '层级路径',
  `SOURCE_TYPE` varchar(30) DEFAULT NULL,
  `ALLOWED_FILE_TYPE` varchar(30) DEFAULT NULL,
  `ALLOWED_FILE_SIZE` decimal(20,0) DEFAULT NULL,
  `IS_UNIQUE` varchar(1) DEFAULT NULL,
  `CATEGORY_PATH` varchar(255) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attach_category_b
-- ----------------------------
INSERT INTO `sys_attach_category_b` VALUES ('1', '目录1', '0', '目录1', '1', '-1', '1', 'FOLDER', null, null, 'Y', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_b` VALUES ('2', '目录2', '0', '目录2', '1', '1', '1.2', 'FOLDER', null, null, 'N', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_b` VALUES ('3', '目录3', '0', '叶节点1', '1', '2', '1.2.3', 'IMG', null, null, 'Y', '/Users/jessen/Pictures/hap/img', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_b` VALUES ('4', 'Leaf 1.1', '1', 'Leaf 1.1', '1', '3', '1.2.3.4', 'IMG2', '.jpg;.jpeg;.png', null, 'N', '/Users/jessen/Pictures/hap/img', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_attach_category_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach_category_tl`;
CREATE TABLE `sys_attach_category_tl` (
  `CATEGORY_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `CATEGORY_NAME` varchar(40) DEFAULT NULL COMMENT '类别名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attach_category_tl
-- ----------------------------
INSERT INTO `sys_attach_category_tl` VALUES ('1', 'en_GB', 'Category1', 'Category1', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('1', 'zh_CN', '目录1', '目录1', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('2', 'en_GB', 'Category2', 'Category2', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('2', 'zh_CN', '目录2', '目录2', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('3', 'en_GB', 'Category3', 'Left1', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('3', 'zh_CN', '目录3', '叶节点1', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('4', 'en_GB', 'Leaf1.1', 'Leaf 1.1', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_attach_category_tl` VALUES ('4', 'zh_CN', 'Leaf 1.1', 'Leaf 1.1', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_b`;
CREATE TABLE `sys_code_b` (
  `CODE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(30) NOT NULL COMMENT '快码类型',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码类型描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`),
  UNIQUE KEY `SYS_CODE_B_U1` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_code_b
-- ----------------------------
INSERT INTO `sys_code_b` VALUES ('10001', 'HR.EMPLOYEE_GENDER', '性别', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10002', 'HR.EMPLOYEE_STATUS', '员工状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10003', 'SYS.ALIGN_TYPE', '对齐方式', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10004', 'SYS.CAPTCHA_POLICY', '验证码策略', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10005', 'SYS.LOV_EDITOR_TYPE', 'LOV 编辑器类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10006', 'SYS.PRIORITY_LEVEL', '模板优先级', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10007', 'SYS.PROFILE_LEVEL_ID', '配置文件级别', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10008', 'SYS.RESOURCE_TYPE', '资源类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10009', 'SYS.TIME_ZONE', '时区', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10010', 'SYS.USER_STATUS', '用户状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10011', 'SYS.YES_NO', '是否 YN', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10012', 'SYS.PASSWORD_COMPLEXITY', '密码复杂度要求', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10013', 'SYS.IF.REQUEST_STATUS', '接口调用状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_b` VALUES ('10014', 'SYS.ORDER_TYPE', '订单状态', '2', '-1', '-1', '10001', '2017-01-14 11:07:21', '10001', '2017-01-14 17:03:59', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_tl`;
CREATE TABLE `sys_code_tl` (
  `CODE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_code_tl
-- ----------------------------
INSERT INTO `sys_code_tl` VALUES ('10001', 'en_GB', 'Gender', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10001', 'zh_CN', '性别', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10002', 'en_GB', 'Employee Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10002', 'zh_CN', '员工状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10003', 'en_GB', 'Align Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10003', 'zh_CN', '对齐方式', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10004', 'en_GB', 'Captcha Policy', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10004', 'zh_CN', '验证码策略', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10005', 'en_GB', 'LOV Editor Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10005', 'zh_CN', 'LOV 编辑器类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10006', 'en_GB', 'Template Priority', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10006', 'zh_CN', '模板优先级', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10007', 'en_GB', 'Profile Level', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10007', 'zh_CN', '配置文件级别', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10008', 'en_GB', 'Resource Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10008', 'zh_CN', '资源类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10009', 'en_GB', 'Time Zone', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10009', 'zh_CN', '时区', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10010', 'en_GB', 'User Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10010', 'zh_CN', '用户状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10011', 'en_GB', 'Yes No', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10011', 'zh_CN', '是否 YN', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10012', 'en_GB', 'Password Complexity', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10012', 'zh_CN', '密码复杂度要求', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10013', 'en_GB', 'Interface Invoke State', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10013', 'zh_CN', '接口调用状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10014', 'en_GB', '订单状态', '1', '-1', '-1', '10001', '2017-01-14 11:07:20', '10001', '2017-01-14 11:07:20', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_tl` VALUES ('10014', 'zh_CN', '订单状态', '1', '-1', '-1', '10001', '2017-01-14 11:07:20', '10001', '2017-01-14 17:03:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_code_value_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_value_b`;
CREATE TABLE `sys_code_value_b` (
  `CODE_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE_ID` bigint(20) DEFAULT NULL,
  `VALUE` varchar(150) DEFAULT NULL COMMENT '快码值',
  `MEANING` varchar(150) DEFAULT NULL COMMENT '快码意思',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `ORDER_SEQ` int(11) DEFAULT '10',
  PRIMARY KEY (`CODE_VALUE_ID`),
  UNIQUE KEY `SYS_CODE_VALUE_B_U1` (`CODE_ID`,`VALUE`)
) ENGINE=InnoDB AUTO_INCREMENT=10042 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_code_value_b
-- ----------------------------
INSERT INTO `sys_code_value_b` VALUES ('10001', '10008', 'HTML', 'HTML页面', 'HTML页面', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10002', '10008', 'SERVICE', 'URL服务', 'URL服务', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10003', '10005', 'INT', '数字框', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10004', '10005', 'POPUP', '值列表', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10005', '10005', 'SELECT', '下拉框', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10006', '10005', 'TEXT', '文本框', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10007', '10005', 'DATE', '日期框', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10008', '10011', 'N', '否', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10009', '10011', 'Y', '是', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10010', '10003', 'CENTER', '居中', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10011', '10003', 'LEFT', '左对齐', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10012', '10003', 'RIGHT', '右对齐', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10013', '10007', '10', '全局', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10014', '10007', '20', '角色', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10015', '10007', '30', '用户', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10016', '10006', 'NORMAL', '普通', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10017', '10006', 'VIP', 'VIP', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10018', '10009', 'GMT+0800', '(GMT+8)北京时间', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10019', '10009', 'GMT-0500', '(GMT-5)纽约', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10020', '10009', 'GMT-0800', '(GMT-8)旧金山', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10021', '10010', 'ACTV', '有效', '有效', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10022', '10010', 'EXPR', '过期', '过期', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10023', '10010', 'LOCK', '已锁定', '锁定', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10024', '10004', 'AFTER3', '登录失败3次启用验证码', '登录失败3次启用验证码', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10025', '10004', 'DISABLE', '禁用验证码', '禁用验证码', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10026', '10004', 'ENABLE', '启用验证码', '启用验证码', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10027', '10001', 'F', '女', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10028', '10001', 'M', '男', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10029', '10002', 'NORMAL', '正式', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10030', '10002', 'OFFWORK', '离职', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10031', '10002', 'PRAC', '实习', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10032', '10002', 'RETIRE', '退休', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10033', '10002', 'TRAIL', '试用', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10034', '10012', 'no_limit', '无限制', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10035', '10012', 'digits_and_letters', '必须混合数字和字母', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10036', '10012', 'digits_and_case_letters', '必须混合数字和大小写字母', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10037', '10013', 'success', '成功', '接口调用成功', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10038', '10013', 'failure', '失败', '接口调用失败', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10039', '10014', '已接收', '已接收', '已接收', '2', '-1', '-1', '10001', '2017-01-14 11:07:21', '10001', '2017-01-14 17:03:59', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');
INSERT INTO `sys_code_value_b` VALUES ('10040', '10014', '未接收', '未接收', '未接收', '2', '-1', '-1', '10001', '2017-01-14 11:07:21', '10001', '2017-01-14 17:03:59', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '10');

-- ----------------------------
-- Table structure for sys_code_value_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_code_value_tl`;
CREATE TABLE `sys_code_value_tl` (
  `CODE_VALUE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `MEANING` varchar(150) DEFAULT NULL COMMENT '快码意思',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '快码描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CODE_VALUE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_code_value_tl
-- ----------------------------
INSERT INTO `sys_code_value_tl` VALUES ('10001', 'en_GB', 'HTML页面', 'HTML页面', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10001', 'zh_CN', 'HTML页面', 'HTML页面', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10002', 'en_GB', 'URL服务', 'URL服务', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10002', 'zh_CN', 'URL服务', 'URL服务', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10003', 'en_GB', 'Number', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10003', 'zh_CN', '数字框', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10004', 'en_GB', 'Popup', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10004', 'zh_CN', '值列表', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10005', 'en_GB', 'Select', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10005', 'zh_CN', '下拉框', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10006', 'en_GB', 'Text', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10006', 'zh_CN', '文本框', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10007', 'en_GB', 'Date', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10007', 'zh_CN', '日期框', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10008', 'en_GB', 'No', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10008', 'zh_CN', '否', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10009', 'en_GB', 'Yes', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10009', 'zh_CN', '是', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10010', 'en_GB', 'Center', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10010', 'zh_CN', '居中', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10011', 'en_GB', 'Left', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10011', 'zh_CN', '左对齐', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10012', 'en_GB', 'Right', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10012', 'zh_CN', '右对齐', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10013', 'en_GB', 'Global', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10013', 'zh_CN', '全局', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10014', 'en_GB', 'Role', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10014', 'zh_CN', '角色', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10015', 'en_GB', 'User', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10015', 'zh_CN', '用户', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10016', 'en_GB', 'Normal', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10016', 'zh_CN', '普通', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10017', 'en_GB', 'VIP', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10017', 'zh_CN', 'VIP', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10018', 'en_GB', '(GMT+8)Beijing', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10018', 'zh_CN', '(GMT+8)北京时间', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10019', 'en_GB', '(GMT-5)New York', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10019', 'zh_CN', '(GMT-5)纽约', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10020', 'en_GB', '(GMT-8)San Francisco', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10020', 'zh_CN', '(GMT-8)旧金山', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10021', 'en_GB', 'Active', 'Active', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10021', 'zh_CN', '有效', '有效', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10022', 'en_GB', 'Expired', 'Expired', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10022', 'zh_CN', '过期', '过期', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10023', 'en_GB', 'Locked', 'Locked', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10023', 'zh_CN', '已锁定', '锁定', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10024', 'en_GB', 'Enable captcha after 3 failure', 'Enable captcha after login failed 3 times.', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10024', 'zh_CN', '登录失败3次启用验证码', '登录失败3次启用验证码', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10025', 'en_GB', 'Disable captcha', 'Disable captcha', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10025', 'zh_CN', '禁用验证码', '禁用验证码', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10026', 'en_GB', 'Enable captcha', 'Enable captcha', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10026', 'zh_CN', '启用验证码', '启用验证码', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10027', 'en_GB', 'Female', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10027', 'zh_CN', '女', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10028', 'en_GB', 'Male', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10028', 'zh_CN', '男', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10029', 'en_GB', '正式', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10029', 'zh_CN', '正式', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10030', 'en_GB', 'Off Work', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10030', 'zh_CN', '离职', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10031', 'en_GB', 'Practice', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10031', 'zh_CN', '实习', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10032', 'en_GB', 'Retired', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10032', 'zh_CN', '退休', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10033', 'en_GB', 'Trail', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10033', 'zh_CN', '试用', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10034', 'en_GB', 'No Limit', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10034', 'zh_CN', '无限制', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10035', 'en_GB', 'Contains Digits And Letters', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10035', 'zh_CN', '必须混合数字和字母', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10036', 'en_GB', 'Contains Digits And Case Letters', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10036', 'zh_CN', '必须混合数字和大小写字母', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10037', 'en_GB', 'SUCCESS', 'Successful Interface Invoke', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10037', 'zh_CN', '成功', '接口调用成功', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10038', 'en_GB', 'FAILURE', 'Fails Interface Invoke', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10038', 'zh_CN', '失败', '接口调用失败', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10039', 'en_GB', '审核中', '审核中', '1', '-1', '-1', '10001', '2017-01-14 11:07:20', '10001', '2017-01-14 11:07:20', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10039', 'zh_CN', '已接收', '已接收', '1', '-1', '-1', '10001', '2017-01-14 11:07:20', '10001', '2017-01-14 17:03:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10040', 'en_GB', '未处理', '未处理', '1', '-1', '-1', '10001', '2017-01-14 11:07:20', '10001', '2017-01-14 11:07:20', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_code_value_tl` VALUES ('10040', 'zh_CN', '未接收', '未接收', '1', '-1', '-1', '10001', '2017-01-14 11:07:20', '10001', '2017-01-14 17:03:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `CONFIG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONFIG_CODE` varchar(240) NOT NULL COMMENT '配置编码',
  `CONFIG_VALUE` varchar(240) DEFAULT NULL COMMENT '配置值',
  `CATEGORY` varchar(240) DEFAULT NULL COMMENT '配置分类',
  `ENABLED_FLAG` varchar(1) DEFAULT 'Y' COMMENT '启用标记',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`CONFIG_ID`),
  UNIQUE KEY `SYS_CONFIG_U1` (`CONFIG_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10009 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('10001', 'SYS_TITLE', 'HAND Application Platform', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_config` VALUES ('10002', 'CAPTCHA', 'AFTER3', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_config` VALUES ('10003', 'DEFAULT_PASSWORD', '123456', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_config` VALUES ('10004', 'PASSWORD_MIN_LENGTH', '8', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_config` VALUES ('10005', 'PASSWORD_COMPLEXITY', 'no_limit', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_config` VALUES ('10006', 'PASSWORD_INVALID_TIME', '0', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_config` VALUES ('10007', 'USER_ROLE_MERGE', 'Y', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_config` VALUES ('10008', 'DEFAULT_TARGET_URL', '/index', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');

-- ----------------------------
-- Table structure for sys_dashboard_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_dashboard_b`;
CREATE TABLE `sys_dashboard_b` (
  `DASHBOARD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DASHBOARD_CODE` varchar(100) NOT NULL COMMENT '仪表盘编码',
  `TITLE` varchar(100) DEFAULT NULL COMMENT '仪表盘标题',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '仪表盘描述',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源ID',
  `ENABLED_FLAG` varchar(1) NOT NULL DEFAULT 'Y' COMMENT '启用状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`DASHBOARD_ID`),
  UNIQUE KEY `SYS_DASHBOARD_B_U1` (`DASHBOARD_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dashboard_b
-- ----------------------------
INSERT INTO `sys_dashboard_b` VALUES ('10001', 'DB_WFL_TODO', '代办事项11', '代办事项', '10174', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_dashboard_b` VALUES ('10002', 'DB_WFL_TODO2', '代办事项22', '代办事项', '10174', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_dashboard_b` VALUES ('10003', 'DB_SYS_JVM_METRICS', '系统指标', '系统指标', '10175', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');

-- ----------------------------
-- Table structure for sys_dashboard_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_dashboard_tl`;
CREATE TABLE `sys_dashboard_tl` (
  `DASHBOARD_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `TITLE` varchar(100) DEFAULT NULL COMMENT '仪表盘标题',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '仪表盘描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`DASHBOARD_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dashboard_tl
-- ----------------------------
INSERT INTO `sys_dashboard_tl` VALUES ('10001', 'en_GB', '代办事项11', '代办事项', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10001', 'zh_CN', '代办事项11', '代办事项', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10002', 'en_GB', '代办事项22', '代办事项', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10002', 'zh_CN', '代办事项22', '代办事项', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10003', 'en_GB', 'system metrics', '系统指标', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_dashboard_tl` VALUES ('10003', 'zh_CN', '系统指标', '系统指标', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `FILE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ATTACHMENT_ID` bigint(20) DEFAULT NULL COMMENT '附件ID',
  `FILE_NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `FILE_PATH` varchar(255) DEFAULT NULL COMMENT '文件虚拟路径',
  `FILE_SIZE` decimal(20,0) DEFAULT NULL COMMENT '文件大小',
  `FILE_TYPE` varchar(240) DEFAULT NULL COMMENT '文件类型',
  `UPLOAD_DATE` datetime DEFAULT NULL COMMENT '上传时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `SYS_FILE_N1` (`ATTACHMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

-- ----------------------------
-- Table structure for sys_function_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_b`;
CREATE TABLE `sys_function_b` (
  `FUNCTION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_CODE` varchar(30) DEFAULT NULL COMMENT '模块编码',
  `FUNCTION_ICON` varchar(100) DEFAULT NULL COMMENT '功能图标',
  `FUNCTION_CODE` varchar(30) NOT NULL COMMENT '功能编码',
  `FUNCTION_NAME` varchar(150) DEFAULT NULL COMMENT '功能名称',
  `FUNCTION_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '功能入口',
  `TYPE` varchar(30) DEFAULT NULL COMMENT '功能类型',
  `PARENT_FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '父功能',
  `ENABLED_FLAG` varchar(1) DEFAULT 'Y' COMMENT '是否启用',
  `FUNCTION_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '排序号',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`),
  UNIQUE KEY `SYS_FUNCTION_B_U1` (`FUNCTION_CODE`),
  KEY `SYS_FUNCTION_B_N1` (`PARENT_FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10045 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_function_b
-- ----------------------------
INSERT INTO `sys_function_b` VALUES ('10001', 'SYS', 'fa fa-gears', 'SYSTEM', '系统管理', '系统管理', null, 'PAGE', null, 'Y', '99', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10002', 'SYS', 'fa fa-edit', 'PROMPT', '描述维护', '维护描述', '10139', 'PAGE', '10001', 'Y', '20', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10003', 'SYS', 'fa fa-code', 'CODE', '代码维护', '代码维护', '10130', 'PAGE', '10001', 'Y', '30', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10004', 'SYS', 'fa fa-search', 'LOV', 'LOV定义', 'LOV定义', '10133', 'PAGE', '10001', 'Y', '40', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10005', 'SYS', 'fa fa-flag', 'LANGUAGE', '语言维护', '语言维护', '10075', 'PAGE', '10001', 'Y', '50', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10006', 'SYS', 'fa fa-cogs', 'PROFILE', '配置维护', '配置维护', '10137', 'PAGE', '10001', 'Y', '50', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10007', 'SYSCONFIG', 'fa fa-cog', 'SYS_CONFIG', '系统配置', '系统配置', '10132', 'PAGE', '10001', 'Y', '6', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10008', 'ACCOUNT', 'fa fa-user', 'ACCOUNT', '账户管理', '账户管理', null, 'PAGE', '10001', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10009', 'ACCOUNT', 'fa fa-user-plus', 'ACCOUNT_USER', '用户管理', '用户管理', '10144', 'PAGE', '10008', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10010', 'ACCOUNT', 'fa fa-users', 'ACCOUNT_ROLE', '角色管理', '角色管理', '10140', 'PAGE', '10008', 'Y', '20', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10011', 'FUNCTION', 'fa fa-plug', 'FUNCTION', '功能管理', '功能管理', null, 'PAGE', '10001', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10012', 'FUNCTION', 'fa fa-puzzle-piece', 'FUNCTION_ADD', '功能维护', '功能定义', '10065', 'PAGE', '10011', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10013', 'FUNCTION', 'fa fa-share-alt-square', 'SYS_RESOURCE', '资源管理', '资源管理', '10115', 'PAGE', '10011', 'Y', '20', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10014', 'FUNCTION', 'fa fa-list', 'FUNCTION_ASSIGN', '功能分配', '功能分配', '10125', 'PAGE', '10011', 'Y', '90', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10015', 'JOB', 'fa fa-clock-o', 'JOB', '计划任务', '计划任务', null, 'PAGE', null, 'Y', '40', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10016', 'JOB', 'fa fa-tasks', 'JOB_DETAIL', '任务明细', '任务明细', '10023', 'PAGE', '10015', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10017', 'JOB', 'fa fa-list-ul', 'JOB_RUNNING_INFO', '执行记录', '执行记录', '10033', 'PAGE', '10015', 'Y', '20', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10018', 'ATTACH', 'fa fa-cloud-upload', 'ATTACH', '附件管理', '附件管理', null, 'PAGE', null, 'Y', '30', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10019', 'ATTACH', 'fa fa-file', 'ATTACH_FILE', '文件管理', '文件管理', '10049', 'PAGE', '10018', 'Y', '20', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10020', 'ATTACH', 'fa fa-file', 'ATTACH_TEST', '上传测试', '上传测试', '10058', 'PAGE', '10018', 'Y', '30', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10021', 'ATTACH', 'fa fa-folder-open', 'ATTACH_CATEGORY', '目录管理', '目录管理', '10045', 'PAGE', '10018', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10022', 'EMAIL', 'fa fa-envelope', 'EMAIL', '邮件', '邮件', null, 'PAGE', '10001', 'Y', '80', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10023', 'EMAIL', 'fa fa-envelope', 'EMAIL_ACCOUNT', '邮件账户', '邮件账户', '10085', 'PAGE', '10022', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10024', 'EMAIL', 'fa fa-envelope', 'EMAIL_TEMPLATE', '邮件模板', '邮件模板', '10096', 'PAGE', '10022', 'Y', '20', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10025', 'EMAIL', 'fa fa-envelope', 'EMAIL_TEST', '邮件测试', '邮件测试', '10102', 'PAGE', '10022', 'Y', '30', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10026', 'WFL', 'fa fa-sitemap', 'WFL', '工作流', '工作流', null, 'PAGE', null, 'Y', '40', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10027', 'WFL', 'fa fa-check-square-o', 'WFL_MY_TASK', '我的待办', '个人待办列表', '10005', 'PAGE', '10026', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10028', 'WFL', 'fa fa-check-square-o', 'WFL_TASK', '待办事项(管理员)', '待办事项', '10009', 'PAGE', '10026', 'Y', '20', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10029', 'WFL', 'fa fa-history', 'WFL_HISROTY', '历史流程', '历史流程', '10007', 'PAGE', '10026', 'Y', '30', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10030', 'WFL', 'fa fa-object-group', 'WFL_MODEL', '流程设计', '模型管理', '10004', 'PAGE', '10026', 'Y', '40', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10031', 'WFL', 'fa fa-wrench', 'WFL_TEST', '工作流测试', '工作流测试', '10008', 'PAGE', '10026', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10032', 'WFL', 'fa fa-share-alt', 'WFL_DEFINITION', '流程部署', '流程部署', '10006', 'PAGE', '10026', 'Y', '50', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10033', 'HR', 'fa fa-cubes', 'HR', '组织架构', '组织架构', null, 'PAGE', null, 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10034', 'HR', 'fa fa-cube', 'HR_UNIT', '组织管理', '组织管理', '10018', 'PAGE', '10033', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10035', 'HR', 'fa fa-user', 'HR_EMPLOYEE', '员工管理', '员工管理', '10011', 'PAGE', '10033', 'Y', '30', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10036', 'HR', 'fa fa-user-secret', 'HR_POSITION', '岗位管理', '岗位管理', '10014', 'PAGE', '10033', 'Y', '20', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10037', 'FND', 'fa fa-cube', 'FND_COMPANY', '公司管理', '公司管理', '10165', 'PAGE', '10033', 'Y', '40', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10038', 'SYS', 'fa fa-dashboard', 'SYS_DASHBOARD', '仪表盘配置', '仪表盘配置', '10170', 'PAGE', '10001', 'Y', '15', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10039', 'EMAIL', 'fa fa-envelope', 'EMAIL_STATUS', '邮件状态查询', '邮件状态查询', '10176', 'PAGE', '10022', 'Y', '40', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10040', 'IF', 'fa fa-plug', 'IF', '接口管理', '接口管理', null, 'PAGE', null, 'Y', '80', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10041', 'IF', 'fa fa-share-alt-square', 'IF_CONFIG', '接口定义', '接口定义', '10178', 'PAGE', '10040', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10042', 'IF', 'fa fa-bar-chart', 'IF_INVOKE', '调用记录', '调用记录', '10177', 'PAGE', '10040', 'Y', '20', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10043', 'SYS', 'fa fa-heartbeat', 'SYS_METRICS', '系统指标', '系统指标', '10181', 'PAGE', '10001', 'Y', '10', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_b` VALUES ('10044', 'FILM', 'fa fa-film', 'FILM', '电影', '电影管理', '10184', 'PAGE', null, 'Y', '1', '1', '-1', '-1', '10001', '2017-01-13 11:28:56', '10001', '2017-01-13 11:28:56', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_function_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_resource`;
CREATE TABLE `sys_function_resource` (
  `FUNC_SRC_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '外键，功能 ID',
  `RESOURCE_ID` bigint(20) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNC_SRC_ID`),
  UNIQUE KEY `SYS_FUNCTION_RESOURCE_U1` (`FUNCTION_ID`,`RESOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_function_resource
-- ----------------------------
INSERT INTO `sys_function_resource` VALUES ('10001', '10002', '10139', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10002', '10002', '10112', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10003', '10002', '10113', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10004', '10002', '10114', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10005', '10003', '10130', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10006', '10003', '10131', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10007', '10003', '10060', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10008', '10003', '10061', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10009', '10003', '10062', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10010', '10003', '10063', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10011', '10003', '10064', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10012', '10004', '10133', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10013', '10004', '10134', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10014', '10004', '10135', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10015', '10004', '10079', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10016', '10004', '10080', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10017', '10004', '10081', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10018', '10004', '10082', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10019', '10004', '10083', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10020', '10004', '10084', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10021', '10006', '10137', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10022', '10006', '10138', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10023', '10006', '10106', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10024', '10006', '10107', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10025', '10006', '10108', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10026', '10006', '10109', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10027', '10006', '10110', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10028', '10006', '10111', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10029', '10012', '10065', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10030', '10012', '10066', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10031', '10012', '10067', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10032', '10012', '10068', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10033', '10012', '10069', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10034', '10012', '10070', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10035', '10012', '10071', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10036', '10012', '10072', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10037', '10012', '10073', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10038', '10012', '10074', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10039', '10016', '10023', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10040', '10016', '10024', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10041', '10016', '10025', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10042', '10016', '10026', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10043', '10016', '10027', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10044', '10016', '10028', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10045', '10016', '10029', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10046', '10016', '10030', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10047', '10016', '10031', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10048', '10016', '10032', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10049', '10013', '10115', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10050', '10013', '10116', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10051', '10013', '10117', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10052', '10013', '10118', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10053', '10013', '10119', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10054', '10013', '10120', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10055', '10013', '10121', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10056', '10013', '10122', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10057', '10013', '10123', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10058', '10014', '10125', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10059', '10014', '10126', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10060', '10014', '10127', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10061', '10014', '10128', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10062', '10014', '10129', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10063', '10014', '10117', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10064', '10009', '10144', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10065', '10009', '10145', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10066', '10009', '10146', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10067', '10009', '10147', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10068', '10009', '10148', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10069', '10009', '10149', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10070', '10009', '10150', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10071', '10009', '10151', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10072', '10009', '10124', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10073', '10009', '10152', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10074', '10010', '10140', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10075', '10010', '10141', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10076', '10010', '10142', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10077', '10010', '10143', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10078', '10017', '10033', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10079', '10017', '10034', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10080', '10005', '10075', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10081', '10005', '10076', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10082', '10005', '10077', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10083', '10005', '10078', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10084', '10023', '10085', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10085', '10023', '10086', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10086', '10023', '10087', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10087', '10023', '10088', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10088', '10023', '10089', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10089', '10023', '10090', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10090', '10023', '10091', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10091', '10023', '10092', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10092', '10023', '10093', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10093', '10023', '10094', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10094', '10023', '10095', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10095', '10024', '10096', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10096', '10024', '10097', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10097', '10024', '10098', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10098', '10024', '10099', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10099', '10024', '10100', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10100', '10024', '10101', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10101', '10025', '10102', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10102', '10025', '10103', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10103', '10021', '10044', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10104', '10021', '10045', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10105', '10021', '10046', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10106', '10021', '10047', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10107', '10021', '10048', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10108', '10019', '10049', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10109', '10019', '10050', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10110', '10019', '10051', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10111', '10019', '10052', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10112', '10019', '10053', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10113', '10019', '10054', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10114', '10019', '10055', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10115', '10019', '10056', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10116', '10019', '10057', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10117', '10020', '10058', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10118', '10020', '10059', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10119', '10031', '10008', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10120', '10032', '10006', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10121', '10028', '10009', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10122', '10029', '10007', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10123', '10030', '10004', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10124', '10027', '10005', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10125', '10007', '10132', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10126', '10034', '10018', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10127', '10034', '10019', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10128', '10034', '10020', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10129', '10034', '10021', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10130', '10035', '10011', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10131', '10035', '10012', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10132', '10035', '10013', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10133', '10036', '10014', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10134', '10036', '10015', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10135', '10036', '10016', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10136', '10036', '10017', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10137', '10037', '10165', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10138', '10037', '10166', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10139', '10037', '10167', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10140', '10037', '10168', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10141', '10037', '10169', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10142', '10038', '10170', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10143', '10038', '10171', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10144', '10038', '10172', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10145', '10038', '10173', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10146', '10041', '10178', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10147', '10041', '10179', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10148', '10041', '10180', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10149', '10042', '10177', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10150', '10043', '10181', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10151', '10039', '10183', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10152', '10039', '10182', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_resource` VALUES ('10153', '10039', '10176', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_function_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_function_tl`;
CREATE TABLE `sys_function_tl` (
  `FUNCTION_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `FUNCTION_NAME` varchar(150) DEFAULT NULL COMMENT '功能名',
  `FUNCTION_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '功能描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`FUNCTION_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_function_tl
-- ----------------------------
INSERT INTO `sys_function_tl` VALUES ('10001', 'en_GB', 'System', 'System', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10001', 'zh_CN', '系统管理', '系统管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10002', 'en_GB', 'Prompt', 'Prompts', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10002', 'zh_CN', '描述维护', '维护描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10003', 'en_GB', 'Code', 'Lookup Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10003', 'zh_CN', '代码维护', '代码维护', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10004', 'en_GB', 'LOV', 'LOV', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10004', 'zh_CN', 'LOV定义', 'LOV定义', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10005', 'en_GB', 'Languages', 'Language', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10005', 'zh_CN', '语言维护', '语言维护', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10006', 'en_GB', 'Profile', 'Profiles', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10006', 'zh_CN', '配置维护', '配置维护', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10007', 'en_GB', 'System Config', 'System Config', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10007', 'zh_CN', '系统配置', '系统配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10008', 'en_GB', 'Account', 'Account', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10008', 'zh_CN', '账户管理', '账户管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10009', 'en_GB', 'User', 'Users', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10009', 'zh_CN', '用户管理', '用户管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10010', 'en_GB', 'Role', 'Roles', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10010', 'zh_CN', '角色管理', '角色管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10011', 'en_GB', 'Function', 'Functions', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10011', 'zh_CN', '功能管理', '功能管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10012', 'en_GB', 'Function Definition', 'Function Define', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10012', 'zh_CN', '功能维护', '功能定义', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10013', 'en_GB', 'Resource', 'Resources', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10013', 'zh_CN', '资源管理', '资源管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10014', 'en_GB', 'Function Assign', 'Function', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10014', 'zh_CN', '功能分配', '功能分配', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10015', 'en_GB', 'Task', 'Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10015', 'zh_CN', '计划任务', '计划任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10016', 'en_GB', 'Task Detail', 'Job Detail', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10016', 'zh_CN', '任务明细', '任务明细', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10017', 'en_GB', 'Execution Log', 'Execution Log', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10017', 'zh_CN', '执行记录', '执行记录', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10018', 'en_GB', 'Attachment', 'Attachment', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10018', 'zh_CN', '附件管理', '附件管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10019', 'en_GB', 'Files', 'Files', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10019', 'zh_CN', '文件管理', '文件管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10020', 'en_GB', 'Upload Test', 'Upload Test', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10020', 'zh_CN', '上传测试', '上传测试', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10021', 'en_GB', 'Category', 'Category', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10021', 'zh_CN', '目录管理', '目录管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10022', 'en_GB', 'Email', 'Email', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10022', 'zh_CN', '邮件', '邮件', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10023', 'en_GB', 'Email Account', 'Email Account', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10023', 'zh_CN', '邮件账户', '邮件账户', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10024', 'en_GB', 'Email Template', 'Email Template', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10024', 'zh_CN', '邮件模板', '邮件模板', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10025', 'en_GB', 'Email Test', 'Email Test', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10025', 'zh_CN', '邮件测试', '邮件测试', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10026', 'en_GB', 'Workflow', 'Workflow', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10026', 'zh_CN', '工作流', '工作流', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10027', 'en_GB', 'My Tasks', 'Personal Task List', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10027', 'zh_CN', '我的待办', '个人待办列表', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10028', 'en_GB', 'Tasks (ADMIN)', 'Task', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10028', 'zh_CN', '待办事项(管理员)', '待办事项', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10029', 'en_GB', 'Process History', 'Process History', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10029', 'zh_CN', '历史流程', '历史流程', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10030', 'en_GB', 'Model Design', 'Models', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10030', 'zh_CN', '流程设计', '模型管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10031', 'en_GB', 'Test', 'Test', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10031', 'zh_CN', '工作流测试', '工作流测试', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10032', 'en_GB', 'Definition', 'Definition', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10032', 'zh_CN', '流程部署', '流程部署', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10033', 'en_GB', '组织架构', '组织架构', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10033', 'zh_CN', '组织架构', '组织架构', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10034', 'en_GB', 'unit manage', 'unit manage', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10034', 'zh_CN', '组织管理', '组织管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10035', 'en_GB', 'Employee Mgr', 'Employee Management', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10035', 'zh_CN', '员工管理', '员工管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10036', 'en_GB', 'Position Mgr', 'Management', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10036', 'zh_CN', '岗位管理', '岗位管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10037', 'en_GB', 'Company Mgr', 'Company Management', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10037', 'zh_CN', '公司管理', '公司管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10038', 'en_GB', 'Dashboard Config', 'Dashboard Config', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10038', 'zh_CN', '仪表盘配置', '仪表盘配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10039', 'en_GB', 'Email Status', 'Email Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10039', 'zh_CN', '邮件状态查询', '邮件状态查询', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10040', 'en_GB', 'Interface Management', 'Interface Management', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10040', 'zh_CN', '接口管理', '接口管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10041', 'en_GB', 'Interface Definition', 'Interface Definition', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10041', 'zh_CN', '接口定义', '接口定义', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10042', 'en_GB', 'Invoke Records', 'Invoke Records', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10042', 'zh_CN', '调用记录', '调用记录', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10043', 'en_GB', 'System Metrics', 'System Metrics', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10043', 'zh_CN', '系统指标', '系统指标', '1', '-1', '-1', '-1', '2017-01-13 11:15:03', '-1', '2017-01-13 11:15:03', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10044', 'en_GB', '电影', '电影管理', '1', '-1', '-1', '10001', '2017-01-13 11:28:55', '10001', '2017-01-13 11:28:55', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_function_tl` VALUES ('10044', 'zh_CN', '电影', '电影管理', '1', '-1', '-1', '10001', '2017-01-13 11:28:55', '10001', '2017-01-13 11:28:55', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_if_config_header_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_config_header_b`;
CREATE TABLE `sys_if_config_header_b` (
  `HEADER_ID` varchar(255) NOT NULL,
  `INTERFACE_CODE` varchar(30) NOT NULL COMMENT '系统代码',
  `INTERFACE_TYPE` varchar(10) NOT NULL COMMENT '接口类型',
  `DOMAIN_URL` varchar(200) NOT NULL COMMENT '系统地址',
  `BODY_HEADER` varchar(2000) DEFAULT NULL COMMENT 'SOAP报文前缀',
  `BODY_TAIL` varchar(2000) DEFAULT NULL COMMENT 'SOAP报文后缀',
  `NAMESPACE` varchar(30) DEFAULT NULL COMMENT 'SOAP命名空间',
  `REQUEST_METHOD` varchar(10) NOT NULL COMMENT '请求方法',
  `REQUEST_FORMAT` varchar(30) NOT NULL COMMENT '请求形式',
  `REQUEST_CONTENTTYPE` varchar(80) DEFAULT NULL COMMENT '请求报文格式',
  `REQUEST_ACCEPT` varchar(80) DEFAULT NULL COMMENT '请求接收类型',
  `AUTH_FLAG` varchar(1) NOT NULL COMMENT '是否需要验证',
  `AUTH_USERNAME` varchar(80) DEFAULT NULL COMMENT '校验用户名',
  `AUTH_PASSWORD` varchar(200) DEFAULT NULL COMMENT '校验密码',
  `ENABLE_FLAG` varchar(1) NOT NULL COMMENT '是否有效',
  `NAME` varchar(200) NOT NULL COMMENT '系统名称',
  `DESCRIPTION` varchar(255) NOT NULL COMMENT '系统描述',
  `SYSTEM_TYPE` varchar(10) DEFAULT NULL COMMENT '系统类型',
  `MAPPER_CLASS` varchar(255) DEFAULT NULL COMMENT '包装类',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`HEADER_ID`),
  UNIQUE KEY `SYS_IF_CONFIG_HEADER_U1` (`INTERFACE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_config_header_b
-- ----------------------------

-- ----------------------------
-- Table structure for sys_if_config_header_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_config_header_tl`;
CREATE TABLE `sys_if_config_header_tl` (
  `HEADER_ID` varchar(255) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `NAME` varchar(200) DEFAULT NULL COMMENT '系统名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '系统描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`HEADER_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_config_header_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_if_config_line_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_config_line_b`;
CREATE TABLE `sys_if_config_line_b` (
  `LINE_ID` varchar(255) NOT NULL,
  `HEADER_ID` varchar(255) NOT NULL COMMENT '行Id',
  `LINE_CODE` varchar(30) NOT NULL COMMENT '接口代码',
  `IFT_URL` varchar(200) NOT NULL COMMENT '接口地址',
  `ENABLE_FLAG` varchar(1) NOT NULL COMMENT '是否有效',
  `LINE_NAME` varchar(50) DEFAULT NULL COMMENT '接口名称',
  `LINE_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '接口描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`LINE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_config_line_b
-- ----------------------------

-- ----------------------------
-- Table structure for sys_if_config_line_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_config_line_tl`;
CREATE TABLE `sys_if_config_line_tl` (
  `LINE_ID` varchar(255) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `LINE_NAME` varchar(50) DEFAULT NULL COMMENT '接口名称',
  `LINE_DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '接口描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`LINE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_config_line_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_if_invoke_inbound
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_invoke_inbound`;
CREATE TABLE `sys_if_invoke_inbound` (
  `INBOUND_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INTERFACE_NAME` varchar(255) NOT NULL COMMENT '接口名称',
  `INTERFACE_URL` varchar(200) NOT NULL COMMENT '接口地址',
  `REQUEST_TIME` datetime NOT NULL COMMENT '请求时间',
  `REQUEST_HEADER_PARAMETER` varchar(2000) DEFAULT NULL COMMENT '请求header参数',
  `REQUEST_BODY_PARAMETER` longtext COMMENT '请求body参数',
  `REQUEST_METHOD` varchar(10) DEFAULT NULL COMMENT '请求方式',
  `REQUEST_STATUS` varchar(10) DEFAULT NULL COMMENT '请求状态',
  `RESPONSE_CONTENT` longtext COMMENT '响应内容',
  `RESPONSE_TIME` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `STACKTRACE` longtext COMMENT '错误堆栈',
  `IP` varchar(40) DEFAULT NULL COMMENT 'ip地址',
  `REFERER` varchar(240) DEFAULT NULL,
  `USER_AGENT` varchar(240) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`INBOUND_ID`),
  KEY `SYS_IF_INVOKE_INBOUND_N1` (`INTERFACE_NAME`),
  KEY `SYS_IF_INVOKE_INBOUND_N2` (`INTERFACE_URL`),
  KEY `SYS_IF_INVOKE_INBOUND_N3` (`REQUEST_TIME`),
  KEY `SYS_IF_INVOKE_INBOUND_N4` (`REQUEST_STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=10041 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_invoke_inbound
-- ----------------------------
INSERT INTO `sys_if_invoke_inbound` VALUES ('10001', 'Login', '/login', '2017-01-13 11:21:42', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '95', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 11:21:42', '-1', '2017-01-13 11:21:42', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10002', 'Login', '/login', '2017-01-13 11:21:44', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 11:21:44', '-1', '2017-01-13 11:21:44', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10003', 'Login', '/login', '2017-01-13 11:56:30', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '87', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 11:56:30', '-1', '2017-01-13 11:56:30', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10004', 'Login', '/login', '2017-01-13 11:56:31', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 11:56:31', '-1', '2017-01-13 11:56:31', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10005', 'Login', '/login', '2017-01-13 12:08:44', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '117', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 12:08:43', '-1', '2017-01-13 12:08:43', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10006', 'Login', '/login', '2017-01-13 12:08:45', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 12:08:44', '-1', '2017-01-13 12:08:44', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10007', 'Login', '/login', '2017-01-13 17:41:48', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '106', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 17:41:47', '-1', '2017-01-13 17:41:47', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10008', 'Login', '/login', '2017-01-13 17:41:49', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 17:41:48', '-1', '2017-01-13 17:41:48', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10009', 'Login', '/login', '2017-01-13 17:48:21', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '114', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 17:48:21', '-1', '2017-01-13 17:48:21', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10010', 'Login', '/login', '2017-01-13 17:48:22', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 17:48:22', '-1', '2017-01-13 17:48:22', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10011', 'Login', '/login', '2017-01-13 19:50:54', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '101', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 19:50:54', '-1', '2017-01-13 19:50:54', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10012', 'Login', '/login', '2017-01-13 19:50:55', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 19:50:55', '-1', '2017-01-13 19:50:55', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10013', 'Login', '/login', '2017-01-13 20:30:13', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '88', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 20:30:13', '-1', '2017-01-13 20:30:13', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10014', 'Login', '/login', '2017-01-13 20:30:14', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 20:30:14', '-1', '2017-01-13 20:30:14', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10015', 'Login', '/login', '2017-01-13 20:33:56', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '83', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 20:33:55', '-1', '2017-01-13 20:33:55', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10016', 'Login', '/login', '2017-01-13 20:33:57', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '2', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 20:33:56', '-1', '2017-01-13 20:33:56', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10017', 'Login', '/login', '2017-01-13 20:56:28', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '100', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 20:56:28', '-1', '2017-01-13 20:56:28', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10018', 'Login', '/login', '2017-01-13 20:56:29', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '2', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 20:56:29', '-1', '2017-01-13 20:56:29', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10019', 'Login', '/login', '2017-01-13 22:40:42', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '88', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 22:40:41', '-1', '2017-01-13 22:40:41', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10020', 'Login', '/login', '2017-01-13 22:40:43', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 22:40:43', '-1', '2017-01-13 22:40:43', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10021', 'Login', '/login', '2017-01-13 23:01:51', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '94', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 23:01:51', '-1', '2017-01-13 23:01:51', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10022', 'Login', '/login', '2017-01-13 23:01:52', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-13 23:01:52', '-1', '2017-01-13 23:01:52', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10023', 'Login', '/login', '2017-01-14 09:05:26', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '80', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 09:05:25', '-1', '2017-01-14 09:05:25', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10024', 'Login', '/login', '2017-01-14 09:05:27', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 09:05:26', '-1', '2017-01-14 09:05:26', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10025', 'Login', '/login', '2017-01-14 09:05:28', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}', '1', null, '192.168.195.1', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '1', '-1', '-1', '-1', '2017-01-14 09:05:28', '-1', '2017-01-14 09:05:28', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10026', 'Login', '/login', '2017-01-14 16:02:17', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '559', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 16:02:17', '-1', '2017-01-14 16:02:17', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10027', 'Login', '/login', '2017-01-14 16:02:19', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '2', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 16:02:19', '-1', '2017-01-14 16:02:19', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10028', 'Login', '/login', '2017-01-14 16:25:17', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '93', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 16:25:16', '-1', '2017-01-14 16:25:16', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10029', 'Login', '/login', '2017-01-14 16:25:18', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '0', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 16:25:17', '-1', '2017-01-14 16:25:17', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10030', 'Login', '/login', '2017-01-14 17:02:43', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '89', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 17:02:43', '-1', '2017-01-14 17:02:43', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10031', 'Login', '/login', '2017-01-14 17:02:44', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '0', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 17:02:44', '-1', '2017-01-14 17:02:44', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10032', 'Login', '/login', '2017-01-14 17:14:28', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '92', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 17:14:28', '-1', '2017-01-14 17:14:28', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10033', 'Login', '/login', '2017-01-14 17:14:29', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-14 17:14:29', '-1', '2017-01-14 17:14:29', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10034', 'Login', '/login', '2017-01-14 17:22:51', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '2', null, '192.168.195.1', null, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586', '1', '-1', '-1', '-1', '2017-01-14 17:22:50', '-1', '2017-01-14 17:22:50', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10035', 'Login', '/login', '2017-01-15 01:07:39', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '92', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-15 01:07:39', '-1', '2017-01-15 01:07:39', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10036', 'Login', '/login', '2017-01-15 01:07:40', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.195.1', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-15 01:07:40', '-1', '2017-01-15 01:07:40', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10037', 'Login', '/login', '2017-01-15 10:38:08', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '99', null, '192.168.0.103', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-15 10:38:08', '-1', '2017-01-15 10:38:08', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10038', 'Login', '/login', '2017-01-15 10:38:10', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=true}', '1', null, '192.168.0.103', null, 'IntelliJ IDEA/163.9166.29', '1', '-1', '-1', '-1', '2017-01-15 10:38:09', '-1', '2017-01-15 10:38:09', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10039', 'Login', '/login', '2017-01-15 10:38:11', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}', '1', null, '192.168.0.103', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '1', '-1', '-1', '-1', '2017-01-15 10:38:11', '-1', '2017-01-15 10:38:11', '-1');
INSERT INTO `sys_if_invoke_inbound` VALUES ('10040', 'Login', '/login', '2017-01-15 17:27:17', null, null, 'GET', 'success', 'ModelAndView: reference to view with name \'/login\'; model is {ENABLE_CAPTCHA=false}', '1', null, '192.168.195.1', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '1', '-1', '-1', '-1', '2017-01-15 17:27:17', '-1', '2017-01-15 17:27:17', '-1');

-- ----------------------------
-- Table structure for sys_if_invoke_outbound
-- ----------------------------
DROP TABLE IF EXISTS `sys_if_invoke_outbound`;
CREATE TABLE `sys_if_invoke_outbound` (
  `OUTBOUND_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `INTERFACE_NAME` varchar(255) NOT NULL COMMENT '接口名称',
  `INTERFACE_URL` varchar(200) NOT NULL COMMENT '接口地址',
  `REQUEST_TIME` datetime NOT NULL COMMENT '请求时间',
  `REQUEST_PARAMETER` longtext COMMENT '请求参数',
  `REQUEST_STATUS` varchar(10) DEFAULT NULL COMMENT '请求状态',
  `RESPONSE_CONTENT` longtext COMMENT '响应内容',
  `RESPONSE_TIME` bigint(20) DEFAULT NULL COMMENT '响应时间',
  `RESPONSE_CODE` varchar(30) DEFAULT NULL COMMENT 'httpCode',
  `STACKTRACE` longtext COMMENT '错误堆栈',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`OUTBOUND_ID`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N1` (`INTERFACE_NAME`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N2` (`INTERFACE_URL`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N3` (`REQUEST_TIME`),
  KEY `SYS_IF_INVOKE_OUTBOUND_N4` (`REQUEST_STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_if_invoke_outbound
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_running_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_running_info`;
CREATE TABLE `sys_job_running_info` (
  `JOB_RUNNING_INFO_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(225) DEFAULT NULL,
  `JOB_GROUP` varchar(225) DEFAULT NULL,
  `JOB_RESULT` varchar(225) DEFAULT NULL,
  `JOB_STATUS` varchar(225) DEFAULT NULL,
  `JOB_STATUS_MESSAGE` varchar(225) DEFAULT NULL,
  `TRIGGER_NAME` varchar(225) DEFAULT NULL,
  `TRIGGER_GROUP` varchar(225) DEFAULT NULL,
  `PREVIOUS_FIRE_TIME` datetime DEFAULT NULL,
  `FIRE_TIME` datetime DEFAULT NULL,
  `NEXT_FIRE_TIME` datetime DEFAULT NULL,
  `REFIRE_COUNT` bigint(20) DEFAULT '0',
  `FIRE_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULER_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULED_FIRE_TIME` datetime DEFAULT NULL,
  `EXECUTION_SUMMARY` varchar(225) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`JOB_RUNNING_INFO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_job_running_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_lang_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_lang_b`;
CREATE TABLE `sys_lang_b` (
  `LANG_CODE` varchar(10) NOT NULL,
  `BASE_LANG` varchar(10) DEFAULT NULL COMMENT '基语言',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `JOB_RESULT` varchar(225) DEFAULT NULL,
  `JOB_STATUS` varchar(225) DEFAULT NULL,
  `JOB_STATUS_MESSAGE` varchar(225) DEFAULT NULL,
  `TRIGGER_NAME` varchar(225) DEFAULT NULL,
  `TRIGGER_GROUP` varchar(225) DEFAULT NULL,
  `PREVIOUS_FIRE_TIME` datetime DEFAULT NULL,
  `FIRE_TIME` datetime DEFAULT NULL,
  `NEXT_FIRE_TIME` datetime DEFAULT NULL,
  `REFIRE_COUNT` bigint(20) DEFAULT '0',
  `FIRE_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULER_INSTANCE_ID` varchar(225) DEFAULT NULL,
  `SCHEDULED_FIRE_TIME` datetime DEFAULT NULL,
  `EXECUTION_SUMMARY` varchar(225) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LANG_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lang_b
-- ----------------------------
INSERT INTO `sys_lang_b` VALUES ('en_GB', 'zh_CN', 'English', null, null, null, null, null, null, null, null, '0', null, null, null, null, '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lang_b` VALUES ('zh_CN', 'zh_CN', '简体中文', null, null, null, null, null, null, null, null, '0', null, null, null, null, '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_lov
-- ----------------------------
DROP TABLE IF EXISTS `sys_lov`;
CREATE TABLE `sys_lov` (
  `LOV_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(80) NOT NULL COMMENT 'LOV的code',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `SQL_ID` varchar(225) DEFAULT NULL COMMENT 'SQL ID',
  `VALUE_FIELD` varchar(80) DEFAULT NULL COMMENT ' VALUE_FIELD',
  `TEXT_FIELD` varchar(80) DEFAULT NULL COMMENT 'TEXT_FIELD',
  `TITLE` varchar(225) DEFAULT NULL COMMENT '标题',
  `WIDTH` decimal(20,0) DEFAULT NULL COMMENT '宽度',
  `HEIGHT` decimal(20,0) DEFAULT NULL COMMENT '高度',
  `PLACEHOLDER` varchar(80) DEFAULT NULL COMMENT '提示',
  `DELAY_LOAD` varchar(1) DEFAULT 'N' COMMENT '是否延迟加载',
  `NEED_QUERY_PARAM` varchar(1) DEFAULT 'N' COMMENT '是否需要查询条件',
  `EDITABLE` varchar(1) DEFAULT 'N' COMMENT '是否可编辑',
  `CAN_POPUP` varchar(1) DEFAULT 'Y' COMMENT '是否可弹出',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `CUSTOM_SQL` longtext COMMENT '自定义sql',
  `QUERY_COLUMNS` int(11) DEFAULT '1' COMMENT '查询框列数',
  PRIMARY KEY (`LOV_ID`),
  UNIQUE KEY `SYS_LOV_U1` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10018 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lov
-- ----------------------------
INSERT INTO `sys_lov` VALUES ('10001', 'user_lov', '查询用户', 'UserMapper.select', 'userId', 'userName', '查询用户', '400', '400', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10002', 'ATTACH_SOURCE_TYPE', '附件来源类型选择', 'AttachCategoryMapper.selectAllLeafCategory', 'sourceType', 'sourceType', 'attachcategory.sourcetype', '450', '200', 'attachcategory.sourcetype', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10003', 'LOV_PARENTFUNCTION', null, 'FunctionMapper.select', 'functionId', 'functionName', 'function.parentfunctionid', '550', '350', 'function.parentfunctionid', 'N', 'N', 'N', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10004', 'LOV_ROLE', '选择角色', 'RoleMapper.select', 'roleId', 'roleName', null, '450', '300', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10005', 'LOV_RESOURCE', '选择资源', 'ResourceMapper.select', 'resourceId', 'name', null, '500', '300', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10006', 'LOV_PARENTPOSITION', '上级岗位', 'PositionMapper.selectParentPositionName', 'positionId', 'name', 'position.parentpositionname', '500', '400', 'position.parentpositionname', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10007', 'LOV_UNIT', '部门', 'OrgUnitMapper.select', 'unitId', 'name', 'hrorgunit.parentname', '500', '400', 'hrorgunit.parentname', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10008', 'LOV_POSITION', '选择岗位', 'PositionMapper.select', 'positionId', 'name', 'position.name', '500', '200', 'position.name', 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10009', 'LOV_COMPANY', '选择公司', 'CompanyMapper.select', 'companyId', 'companyFullName', null, '500', '200', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10010', 'MESSAGE_TEMPLATE', '选择模板', 'MessageTemplateMapper.select', 'templateCode', 'templateCode', null, '500', '200', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10011', 'MESSAGE_ACCOUNT', '邮件账户', 'MessageEmailAccountMapper.selectMessageEmailAccounts', 'accountCode', 'userName', null, '500', '200', null, 'N', 'N', 'N', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `sys_lov` VALUES ('10012', 'LOV_COMP', '获得所有的共公司', 'OrgCompanysMapper.select', 'companyId', 'companyName', null, '450', '300', null, 'N', 'N', 'N', 'Y', '28', '-1', '-1', '10001', '2017-01-13 19:57:48', '10001', '2017-01-14 10:33:46', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '2');
INSERT INTO `sys_lov` VALUES ('10017', 'LOV_CUSTOMERS', '商户的ID', 'ArCustomersMapper.select', 'customerId', 'customerName', null, '450', '300', null, 'N', 'N', 'N', 'Y', '26', '-1', '-1', '10001', '2017-01-13 22:45:57', '10001', '2017-01-14 10:31:41', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '1');

-- ----------------------------
-- Table structure for sys_lov_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_lov_item`;
CREATE TABLE `sys_lov_item` (
  `LOV_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOV_ID` bigint(20) DEFAULT NULL COMMENT '头表ID',
  `DISPLAY` varchar(255) DEFAULT NULL COMMENT '描述字段',
  `IS_AUTOCOMPLETE` varchar(1) DEFAULT 'N' COMMENT '是否autocomplete',
  `CONDITION_FIELD` varchar(80) DEFAULT 'N' COMMENT ' 是否查询字段',
  `CONDITION_FIELD_WIDTH` decimal(20,0) DEFAULT NULL COMMENT '查询字段宽度',
  `CONDITION_FIELD_TYPE` varchar(30) DEFAULT NULL COMMENT '查询字段组件类型',
  `CONDITION_FIELD_NAME` varchar(80) DEFAULT NULL COMMENT '查询字段名',
  `CONDITION_FIELD_NEWLINE` varchar(1) DEFAULT NULL COMMENT '查询字段新一行',
  `CONDITION_FIELD_SELECT_CODE` varchar(80) DEFAULT NULL COMMENT '查询字段combobox对应的快码值',
  `CONDITION_FIELD_LOV_CODE` varchar(80) DEFAULT NULL COMMENT '查询字段lov对应的通用lov编码',
  `CONDITION_FIELD_SEQUENCE` decimal(20,0) DEFAULT NULL COMMENT '查询字段排序号',
  `CONDITION_FIELD_SELECT_URL` varchar(255) DEFAULT NULL COMMENT '查询字段combobox对应的URL',
  `CONDITION_FIELD_SELECT_VF` varchar(80) DEFAULT NULL COMMENT '查询字段combobox对应的valueField',
  `CONDITION_FIELD_SELECT_TF` varchar(80) DEFAULT NULL COMMENT '查询字段combobox对应的textField',
  `CONDITION_FIELD_TEXTFIELD` varchar(80) DEFAULT NULL COMMENT '查询字段对应的textField',
  `AUTOCOMPLETE_FIELD` varchar(1) DEFAULT 'Y' COMMENT 'autocomplete显示列',
  `GRID_FIELD` varchar(1) DEFAULT 'Y' COMMENT '是否显示表格列',
  `GRID_FIELD_NAME` varchar(80) DEFAULT NULL COMMENT '表格列字段名',
  `GRID_FIELD_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '表格列排序号',
  `GRID_FIELD_WIDTH` decimal(20,0) DEFAULT NULL COMMENT '表格列宽',
  `GRID_FIELD_ALIGN` varchar(10) DEFAULT 'center' COMMENT '表格列布局',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`LOV_ITEM_ID`),
  KEY `SYS_LOV_ITEM_N1` (`LOV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10030 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_lov_item
-- ----------------------------
INSERT INTO `sys_lov_item` VALUES ('10001', '10001', 'userName', 'Y', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'userName', '10', '100', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10002', '10002', 'attachcategory.categoryname', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'categoryName', '10', '100', 'left', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10003', '10002', 'attachcategory.sourcetype', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'sourceType', '20', '80', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10004', '10002', 'attachcategory.categorypath', 'N', 'N', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'categoryPath', '30', '200', 'left', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10005', '10003', 'function.functionCode', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'functionCode', '1', '100', 'left', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10006', '10003', 'function.functionName', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'functionName', '1', '120', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10007', '10004', 'role.roleCode', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'roleCode', '1', '80', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10008', '10004', 'role.roleName', 'N', 'Y', null, null, null, 'N', null, null, '2', null, null, null, null, 'Y', 'Y', 'roleName', '2', '120', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10009', '10004', 'role.roleDescription', 'N', 'N', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'roleDescription', '3', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10010', '10005', 'resource.name', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'name', '1', '160', null, '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10011', '10005', 'resource.url', 'N', 'Y', null, null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'url', '2', '220', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10012', '10006', 'position.name', 'N', 'Y', null, null, null, 'N', null, null, '2', null, null, null, null, 'Y', 'Y', 'name', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10013', '10006', 'position.description', 'N', 'Y', null, null, null, 'N', null, null, '3', null, null, null, null, 'Y', 'Y', 'description', '3', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10014', '10007', 'hrorgunit.name', 'N', 'Y', null, null, null, 'N', null, null, '2', null, null, null, null, 'Y', 'Y', 'name', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10015', '10007', 'hrorgunit.description', 'N', 'Y', null, null, null, 'N', null, null, '3', null, null, null, null, 'Y', 'Y', 'description', '3', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10016', '10008', 'position.name', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'name', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10017', '10008', 'position.positionCode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'positionCode', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10018', '10009', 'company.companycode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'companyCode', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10019', '10009', 'company.companyfullname', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'companyFullName', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10020', '10007', 'hrorgunit.unitcode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'unitCode', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10021', '10010', 'messagetemplate.templatecode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'templateCode', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10022', '10011', 'messageemailconfig.accountcode', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'accountCode', '1', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10023', '10011', 'messageaccount.name', 'N', 'Y', '200', null, null, 'N', null, null, '1', null, null, null, null, 'Y', 'Y', 'userName', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10024', '10010', 'messagetemplate.name', 'N', 'Y', '200', null, null, 'N', null, null, '2', null, null, null, null, 'Y', 'Y', 'description', '2', '200', 'center', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10025', '10012', 'ID', 'N', 'Y', '200', '', '', 'N', '', '', '1', '', '', '', '', 'Y', 'Y', 'companyId', '1', '200', 'center', '9', '-1', '-1', '10001', '2017-01-13 19:57:48', '10001', '2017-01-13 21:36:41', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10026', '10012', 'Name', 'N', 'Y', '200', '', '', 'N', '', '', '2', '', '', '', '', 'Y', 'Y', 'companyName', '2', '200', 'center', '10', '-1', '-1', '10001', '2017-01-13 19:58:23', '10001', '2017-01-14 09:40:59', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10027', '10017', 'customerNumber', 'N', 'Y', '200', '', '', 'N', '', '', '2', '', '', '', '', 'Y', 'Y', 'customerNumber', '2', '150', '', '7', '-1', '-1', '10001', '2017-01-13 22:45:57', '10001', '2017-01-14 09:41:39', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10028', '10017', 'ID', 'N', 'Y', '200', '', '', 'N', '', '', '3', '', '', '', '', 'Y', 'Y', 'customerId', '1', '100', '', '9', '-1', '-1', '10001', '2017-01-13 22:45:57', '10001', '2017-01-14 09:43:55', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_lov_item` VALUES ('10029', '10017', 'customerName', 'N', 'N', '200', '', '', 'N', '', '', '1', '', '', '', '', 'Y', 'Y', 'customerName', '3', '150', '', '18', '-1', '-1', '10001', '2017-01-13 22:46:23', '10001', '2017-01-14 10:31:41', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `MESSAGE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_TYPE` varchar(10) DEFAULT NULL COMMENT '信息类型,email/sms',
  `MESSAGE_HOST` varchar(255) DEFAULT NULL COMMENT '消息服务器',
  `MESSAGE_FROM` varchar(255) DEFAULT NULL COMMENT '消息发出人',
  `SUBJECT` varchar(255) DEFAULT NULL COMMENT ' 标题',
  `CONTENT` longtext COMMENT '内容',
  `PRIORITY_LEVEL` varchar(25) DEFAULT NULL COMMENT '优先级',
  `SEND_FLAG` varchar(1) DEFAULT 'N' COMMENT '发送标记',
  `MESSAGE_SOURCE` varchar(255) DEFAULT NULL COMMENT '消息来源',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `SYS_MESSAGE_N1` (`MESSAGE_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_account`;
CREATE TABLE `sys_message_account` (
  `ACCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_TYPE` varchar(50) DEFAULT NULL COMMENT '账号类型',
  `ACCOUNT_CODE` varchar(50) DEFAULT NULL COMMENT '编号',
  `USER_NAME` varchar(240) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(240) DEFAULT NULL COMMENT ' 密码',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_account
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_attachment`;
CREATE TABLE `sys_message_attachment` (
  `ATTACHMENT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `FILE_ID` bigint(20) DEFAULT NULL COMMENT '附件id',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ATTACHMENT_ID`),
  KEY `SYS_MESSAGE_ATTACHMENT_N1` (`FILE_ID`),
  KEY `SYS_MESSAGE_ATTACHMENT_N2` (`MESSAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_email_account
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_email_account`;
CREATE TABLE `sys_message_email_account` (
  `ACCOUNT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ACCOUNT_CODE` varchar(50) NOT NULL,
  `CONFIG_ID` bigint(20) DEFAULT NULL,
  `USER_NAME` varchar(240) DEFAULT NULL,
  `PASSWORD` varchar(240) DEFAULT NULL,
  `DESCRIPTION` varchar(240) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ACCOUNT_ID`),
  UNIQUE KEY `SYS_MESSAGE_EMAIL_ACCOUNT_U1` (`ACCOUNT_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_email_account
-- ----------------------------
INSERT INTO `sys_message_email_account` VALUES ('1', 'TEST', '5', 'hap_dev@126.com', null, null, '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message_email_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_email_config`;
CREATE TABLE `sys_message_email_config` (
  `CONFIG_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONFIG_CODE` varchar(50) NOT NULL COMMENT '编号',
  `HOST` varchar(50) DEFAULT NULL COMMENT '服务器',
  `PORT` varchar(10) DEFAULT NULL COMMENT '端口',
  `TRY_TIMES` decimal(20,0) DEFAULT '3' COMMENT '重试次数',
  `DESCRIPTION` varchar(20) DEFAULT NULL COMMENT '描述',
  `USE_WHITE_LIST` varchar(1) DEFAULT 'N' COMMENT '是否使用白名单',
  `USER_NAME` varchar(240) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(240) DEFAULT NULL COMMENT '密码',
  `ENABLE` varchar(1) DEFAULT 'N',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`CONFIG_ID`),
  UNIQUE KEY `SYS_MESSAGE_EMAIL_CONFIG_U1` (`CONFIG_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_email_config
-- ----------------------------
INSERT INTO `sys_message_email_config` VALUES ('5', 'TEST126', 'smtp.126.com', '25', '1', 'hap_dev on 126', 'N', 'hap_dev', 'hapdev11', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message_email_white_lt
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_email_white_lt`;
CREATE TABLE `sys_message_email_white_lt` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ADDRESS` varchar(240) DEFAULT NULL COMMENT '白名单地址',
  `CONFIG_ID` bigint(20) DEFAULT NULL COMMENT '邮箱配置id',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_email_white_lt
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_receiver
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_receiver`;
CREATE TABLE `sys_message_receiver` (
  `RECEIVER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `MESSAGE_TYPE` varchar(25) DEFAULT NULL COMMENT '消息类型,抄送/普通',
  `MESSAGE_ADDRESS` varchar(255) DEFAULT NULL COMMENT '消息地址,邮箱/手机号',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RECEIVER_ID`),
  KEY `SYS_MESSAGE_RECEIVER_N1` (`MESSAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_receiver
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_template`;
CREATE TABLE `sys_message_template` (
  `TEMPLATE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUBJECT` longtext COMMENT '模板标题',
  `CONTENT` longtext COMMENT '模板内容',
  `ACCOUNT_ID` bigint(20) DEFAULT NULL COMMENT '账号id',
  `TEMPLATE_CODE` varchar(50) NOT NULL COMMENT '模板编号',
  `TEMPLATE_TYPE` varchar(50) DEFAULT NULL COMMENT '模板类型,邮件/SMS',
  `PRIORITY_LEVEL` varchar(50) DEFAULT NULL COMMENT '优先级',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`TEMPLATE_ID`),
  UNIQUE KEY `SYS_MESSAGE_TEMPLATE_U1` (`TEMPLATE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_template
-- ----------------------------
INSERT INTO `sys_message_template` VALUES ('1', 'THis is a test email', 'test mail send by hap', null, 'TEST', null, 'NORMAL', 'Test Template', '1', '-1', '-1', '-1', '2017-01-13 11:14:57', '-1', '2017-01-13 11:14:57', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_message_transaction
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_transaction`;
CREATE TABLE `sys_message_transaction` (
  `TRANSACTION_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MESSAGE_ID` bigint(20) DEFAULT NULL COMMENT '消息id',
  `TRANSACTION_STATUS` varchar(25) DEFAULT NULL COMMENT '发送状态',
  `TRANSACTION_MESSAGE` longtext COMMENT '返回信息',
  `MESSAGE_ADDRESS` varchar(255) DEFAULT NULL COMMENT '消息地址,邮箱/手机号/会员/用户',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`),
  KEY `SYS_MESSAGE_TRANSACTION_N1` (`MESSAGE_ID`),
  KEY `SYS_MESSAGE_TRANSACTION_N2` (`TRANSACTION_STATUS`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_message_transaction
-- ----------------------------

-- ----------------------------
-- Table structure for sys_preferences
-- ----------------------------
DROP TABLE IF EXISTS `sys_preferences`;
CREATE TABLE `sys_preferences` (
  `PREFERENCES_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PREFERENCES` varchar(30) DEFAULT NULL COMMENT '首选项名',
  `PREFERENCES_VALUE` varchar(80) DEFAULT NULL COMMENT '首选项值',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '账号ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PREFERENCES_ID`),
  UNIQUE KEY `SYS_PREFERENCES_U1` (`PREFERENCES`,`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_preferences
-- ----------------------------

-- ----------------------------
-- Table structure for sys_profile
-- ----------------------------
DROP TABLE IF EXISTS `sys_profile`;
CREATE TABLE `sys_profile` (
  `PROFILE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROFILE_NAME` varchar(40) NOT NULL COMMENT '配置文件名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROFILE_ID`),
  UNIQUE KEY `SYS_PROFILE_U1` (`PROFILE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_profile
-- ----------------------------

-- ----------------------------
-- Table structure for sys_profile_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_profile_value`;
CREATE TABLE `sys_profile_value` (
  `PROFILE_VALUE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROFILE_ID` varchar(32) DEFAULT NULL COMMENT '配置文件ID',
  `LEVEL_ID` varchar(32) DEFAULT NULL COMMENT '层次ID',
  `LEVEL_VALUE` varchar(40) DEFAULT NULL COMMENT '层次值',
  `PROFILE_VALUE` varchar(80) DEFAULT NULL COMMENT '配置文件值',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROFILE_VALUE_ID`),
  UNIQUE KEY `SYS_PROFILE_VALUE_U1` (`PROFILE_ID`,`LEVEL_ID`,`LEVEL_VALUE`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_profile_value
-- ----------------------------

-- ----------------------------
-- Table structure for sys_prompts
-- ----------------------------
DROP TABLE IF EXISTS `sys_prompts`;
CREATE TABLE `sys_prompts` (
  `PROMPT_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PROMPT_CODE` varchar(255) DEFAULT NULL COMMENT '文本编码',
  `LANG` varchar(10) DEFAULT NULL COMMENT '语言',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`PROMPT_ID`),
  UNIQUE KEY `SYS_PROMPTS_U1` (`PROMPT_CODE`,`LANG`)
) ENGINE=InnoDB AUTO_INCREMENT=10707 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_prompts
-- ----------------------------
INSERT INTO `sys_prompts` VALUES ('10001', 'hap.main_menu', 'zh_CN', '主菜单', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10002', 'hap.main_menu', 'en_GB', 'Main Menu', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10003', 'hap.home', 'zh_CN', '首页', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10004', 'hap.hone', 'en_GB', 'Home', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10005', 'hap.query', 'zh_CN', '查询', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10006', 'hap.query', 'en_GB', 'Query', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10007', 'hap.cancel', 'zh_CN', '取消', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10008', 'hap.cancel', 'en_GB', 'Cancel', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10009', 'hap.new', 'zh_CN', '新建', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10010', 'hap.new', 'en_GB', 'New', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10011', 'hap.delete', 'zh_CN', '删除', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10012', 'hap.delete', 'en_GB', 'Delete', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10013', 'hap.save', 'zh_CN', '保存', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10014', 'hap.save', 'en_GB', 'Save', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10015', 'hap.reset', 'zh_CN', '重置', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10016', 'hap.reset', 'en_GB', 'Reset', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10017', 'hap.edit', 'zh_CN', '编辑', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10018', 'hap.edit', 'en_GB', 'Edit', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10019', 'hap.prompt', 'zh_CN', '提示', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10020', 'hap.prompt', 'en_GB', 'Prompt', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10021', 'hap.error', 'zh_CN', '错误', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10022', 'hap.error', 'en_GB', 'Error', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10023', 'hap.warning', 'zh_CN', '警告', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10024', 'hap.warning', 'en_GB', 'Warning', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10025', 'hap.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10026', 'hap.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10027', 'hap.validation.notempty', 'zh_CN', '{0}不能为空！', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10028', 'hap.validation.notempty', 'en_GB', '{0} can not be empty!', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10029', 'hap.validation.notnull', 'zh_CN', '{0}不能为空！', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10030', 'hap.validation.notnull', 'en_GB', '{0} can not be null!', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10031', 'hap.validation.email', 'zh_CN', '{0}不是有效的邮件地址。', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10032', 'hap.validation.email', 'en_GB', '{0} is not a email address.', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10033', 'hap.submit', 'zh_CN', '提交', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10034', 'hap.submit', 'en_GB', 'submit', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10035', 'hap.logout', 'zh_CN', '退出', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10036', 'hap.logout', 'en_GB', 'Logout', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10037', 'hap.preferences', 'zh_CN', '首选项', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10038', 'hap.preferences', 'en_GB', 'Preference', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10039', 'hap.ok', 'zh_CN', '确定', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10040', 'hap.ok', 'en_GB', 'OK', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10041', 'lov.placeholder', 'zh_CN', '提示', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10042', 'lov.placeholder', 'en_GB', 'tips', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10043', 'lov.dropdown', 'zh_CN', '自动完成', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10044', 'lov.dropdown', 'en_GB', 'autocomplete', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10045', 'lov.code', 'zh_CN', '代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10046', 'lov.code', 'en_GB', 'Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10047', 'lov.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10048', 'lov.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10049', 'lov.height', 'zh_CN', '高度', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10050', 'lov.height', 'en_GB', 'Height', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10051', 'lov.lovid', 'zh_CN', 'Lov Id', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10052', 'lov.lovid', 'en_GB', 'Lov Id', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10053', 'lov.lovitems', 'zh_CN', 'Lov Items', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10054', 'lov.lovitems', 'en_GB', 'Lov Items', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10055', 'lov.customsql', 'zh_CN', '自定义sql', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10056', 'lov.customsql', 'en_GB', 'Custom sql', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10057', 'lov.sqltype', 'zh_CN', 'Sql类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10058', 'ov.sqltype', 'en_GB', 'Sql Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10059', 'lov.sqlid', 'zh_CN', 'Sql Id', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10060', 'lov.sqlid', 'en_GB', 'Sql Id', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10061', 'lov.textfield', 'zh_CN', 'TextField', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10062', 'lov.textfield', 'en_GB', 'TextField', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10063', 'lov.title', 'zh_CN', '标题', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10064', 'lov.title', 'en_GB', 'Title', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10065', 'lov.valuefield', 'zh_CN', 'ValueField', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10066', 'lov.valuefield', 'en_GB', 'ValueField', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10067', 'lov.width', 'en_GB', 'Width', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10068', 'lov.width', 'zh_CN', '宽度', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10069', 'lov.querycolumns', 'zh_CN', '列数', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10070', 'lov.columns', 'en_GB', 'Columns', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10071', 'lovitem.display', 'zh_CN', '显示', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10072', 'lovitem.display', 'en_GB', 'Display', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10073', 'lovitem.name', 'zh_CN', '字段名', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10074', 'lovitem.name', 'en_GB', 'Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10075', 'lovitem.gridfieldwidth', 'zh_CN', '列宽度', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10076', 'lovitem.gridfieldwidth', 'en_GB', 'ColumnWidth', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10077', 'lovitem.conditionfield', 'zh_CN', '查询字段', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10078', 'lovitem.conditionfield', 'en_GB', 'Conditions', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10079', 'lovitem.newline', 'zh_CN', '新行', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10080', 'lovitem.newline', 'en_GB', 'Newline', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10081', 'lovitem.type', 'zh_CN', '查询配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10082', 'lovitem.type', 'en_GB', 'Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10083', 'lovitem.opts', 'zh_CN', '参数', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10084', 'lovitem.opts', 'en_GB', 'Opts', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10085', 'lovitem.dropdown', 'zh_CN', 'Dropdown', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10086', 'lovitem.dropdown', 'en_GB', 'Dropdown', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10087', 'lovitem.gridcolumn', 'zh_CN', '表格列', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10088', 'lovitem.gridcolumn', 'en_GB', 'GridColumn', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10089', 'lov.delayload', 'zh_CN', '延迟加载', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10090', 'lov.delayload', 'en_GB', 'DelayLoad', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10091', 'lov.needqueryparam', 'zh_CN', '查询条件必输', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10092', 'lov.needqueryparam', 'en_GB', 'NeedQueryParam', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10093', 'lovitem.conditionfieldwidth', 'zh_CN', '查询字段宽度', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10094', 'lovitem.conditionfieldwidth', 'en_GB', 'Width', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10095', 'lovitem.conditionfieldsequence', 'zh_CN', '查询字段序号', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10096', 'lovitem.conditionfieldsequence', 'en_GB', 'Sequence', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10097', 'lovitem.conditionfieldname', 'zh_CN', '查询字段名', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10098', 'lovitem.conditionfieldname', 'en_GB', 'Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10099', 'lovitem.conditionfieldselectcode', 'zh_CN', '快速编码', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10100', 'lovitem.conditionfieldselectcode', 'en_GB', 'Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10101', 'lovitem.conditionfieldlovcode', 'zh_CN', '通用lov编码', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10102', 'lovitem.conditionfieldlovcode', 'en_GB', 'LovCode', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10103', 'lovitem.gridfieldsequence', 'zh_CN', '列序号', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10104', 'lovitem.gridfieldsequence', 'en_GB', 'Sequence', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10105', 'lovitem.gridcolumnalign', 'zh_CN', '列对齐方式', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10106', 'lovitem.gridcolumnalign', 'en_GB', 'Column Align', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10107', 'lov.autocompletefield', 'zh_CN', '自动完成显示列', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10108', 'lov.autocompletefield', 'en_GB', 'AutoCompleteColumn', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10109', 'lov.canpopup', 'zh_CN', '弹出选择框', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10110', 'lov.canpopup', 'en_GB', 'popup', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10111', 'lov.editable', 'zh_CN', '可编辑', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10112', 'lov.editable', 'en_GB', 'editable', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10113', 'lovitem.field_type', 'zh_CN', '字段类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10114', 'lovitem.field_type', 'en_GB', 'field type', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10115', 'lovitem.ds_type', 'zh_CN', '数据来源', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10116', 'lovitem.ds_type', 'en_GB', '数据来源', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10117', 'lovitem.ds_type.url', 'zh_CN', 'URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10118', 'lovitem.ds_type.url', 'en_GB', 'URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10119', 'lovitem.ds_type.code', 'zh_CN', '快速编码', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10120', 'lovitem.ds_type.code', 'en_GB', 'Sys Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10121', 'user.username', 'zh_CN', '用户名', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10122', 'user.username', 'en_GB', 'User Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10123', 'user.password', 'zh_CN', '密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10124', 'user.password', 'en_GB', 'Password', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10125', 'user.email', 'zh_CN', '邮件', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10126', 'user.email', 'en_GB', 'Email', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10127', 'user.phone', 'zh_CN', '电话', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10128', 'user.phone', 'en_GB', 'Phone', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10129', 'role.rolecode', 'zh_CN', '角色代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10130', 'role.rolecode', 'en_GB', 'Role Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10131', 'role.rolename', 'zh_CN', '角色名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10132', 'role.rolename', 'en_GB', 'Role Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10133', 'role.roledescription', 'zh_CN', '角色描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10134', 'role.roledescription', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10135', 'user.allocationrole', 'zh_CN', '角色分配', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10136', 'user.allocationrole', 'en_GB', 'Role Allocate', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10137', 'code.code', 'zh_CN', '代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10138', 'code.code', 'en_GB', 'Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10139', 'code.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10140', 'code.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10141', 'hap.action', 'zh_CN', '操作', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10142', 'hap.action', 'en_GB', 'Operation', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10143', 'codevalue.value', 'zh_CN', '值', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10144', 'codevalue.value', 'en_GB', 'Value', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10145', 'codevalue.meaning', 'zh_CN', '含义', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10146', 'codevalue.meaning', 'en_GB', 'Meaning', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10147', 'codevalue.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10148', 'codevalue.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10149', 'profile.profilename', 'zh_CN', '名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10150', 'profile.profilename', 'en_GB', 'Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10151', 'profile.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10152', 'profile.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10153', 'language.langcode', 'zh_CN', '语言代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10154', 'language.langcode', 'en_GB', 'Lang Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10155', 'language.baselang', 'zh_CN', '基准语言', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10156', 'language.baselang', 'en_GB', 'Base Lang', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10157', 'language.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10158', 'language.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10159', 'jobdetaildto.jobname', 'zh_CN', '任务名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10160', 'jobdetaildto.jobname', 'en_GB', 'Job Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10161', 'jobdetaildto.jobgroup', 'zh_CN', '任务组', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10162', 'jobdetaildto.jobgroup', 'en_GB', 'Job Group', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10163', 'jobdetaildto.jobclassname', 'zh_CN', '任务类名', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10164', 'jobdetaildto.jobclassname', 'en_GB', 'Job Class', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10165', 'jobdetaildto.description', 'zh_CN', '任务描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10166', 'jobdetaildto.description', 'en_GB', 'Job Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10167', 'jobrunninginfodto.previousfiretime', 'zh_CN', '上次执行时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10168', 'jobrunninginfodto.previousfiretime', 'en_GB', 'Pre Fire Time', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10169', 'jobrunninginfodto.scheduledfiretime', 'zh_CN', '计划执行时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10170', 'jobrunninginfodto.scheduledfiretime', 'en_GB', 'Sched Fire Time', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10171', 'jobrunninginfodto.nextfiretime', 'zh_CN', '下次执行时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10172', 'jobrunninginfodto.nextfiretime', 'en_GB', 'Next Fire Time', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10173', 'jobrunninginfodto.firetime', 'zh_CN', '实际执行时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10174', 'jobrunninginfodto.firetime', 'en_GB', 'Accurate Fire Time', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10175', 'jobrunninginfodto.jobstatus', 'zh_CN', '任务状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10176', 'jobrunninginfodto.jobstatus', 'en_GB', 'Job Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10177', 'jobrunninginfodto.executionsummary', 'zh_CN', '执行概要', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10178', 'jobrunninginfodto.executionsummary', 'en_GB', 'Execution Summary', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10179', 'hap.pause', 'zh_CN', '暂停', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10180', 'hap.pause', 'en_GB', 'Pause', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10181', 'hap.resume', 'zh_CN', '恢复', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10182', 'hap.resume', 'en_GB', 'Resume', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10183', 'job.newcronjob', 'zh_CN', '新建 CRON 任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10184', 'job.newcronjob', 'en_GB', 'New Cron Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10185', 'job.newsimplejob', 'zh_CN', '新建简单任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10186', 'job.newsimplejob', 'en_GB', 'New Simple Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10187', 'prompt.promptcode', 'zh_CN', '代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10188', 'prompt.promptcode', 'en_GB', 'Prompt Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10189', 'prompt.sourcelang', 'zh_CN', '语言', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10190', 'prompt.sourcelang', 'en_GB', 'Language', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10191', 'prompt.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10192', 'prompt.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10193', 'function.modulecode', 'zh_CN', '模块代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10194', 'function.modulecode', 'en_GB', 'Module Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10195', 'function.functioncode', 'zh_CN', '功能代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10196', 'funciton.functioncode', 'en_GB', 'Function Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10197', 'function.functionname', 'zh_CN', '功能名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10198', 'function.functionname', 'en_GB', 'Function Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10199', 'function.parentfunctionid', 'zh_CN', '父级功能', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10200', 'function.parentfunctionid', 'en_GB', 'Parent Function', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10201', 'function.functionicon', 'zh_CN', '功能图标', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10202', 'function.functionicon', 'en_GB', 'Function Icon', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10203', 'function.functionsequence', 'zh_CN', '功能序号', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10204', 'function.functionsequence', 'en_GB', 'Function Seq', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10205', 'function.functiondescription', 'zh_CN', '功能描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10206', 'function.functiondescription', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10207', 'function.mainpage', 'zh_CN', '入口页面', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10208', 'function.mainpage', 'en_GB', 'Entry Page', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10209', 'function.functionresource', 'zh_CN', '功能资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10210', 'function.functionresource', 'en_GB', 'Resources', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10211', 'function.resourceallocation', 'zh_CN', '分配资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10212', 'function.resourceallocation', 'en_GB', 'Resource Allocation', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10213', 'resource.url', 'zh_CN', 'URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10214', 'resource.url', 'en_GB', 'URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10215', 'resource.type', 'zh_CN', '类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10216', 'resource.type', 'en_GB', 'Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10217', 'resource.name', 'zh_CN', '名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10218', 'resource.name', 'en_GB', 'Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10219', 'resource.loginrequire', 'zh_CN', '需要登录', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10220', 'resource.loginrequire', 'en_GB', 'Login Require', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10221', 'resource.accesscheck', 'zh_CN', '权限控制', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10222', 'resource.accesscheck', 'en_GB', 'Access Check', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10223', 'resource.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10224', 'resource.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10225', 'resource.resourceitem', 'zh_CN', '资源组件', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10226', 'resource.resourceitem', 'en_GB', 'Resource Item', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10227', 'resource.itemallocation', 'zh_CN', '组件定义', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10228', 'resource.itemallocation', 'en_GB', 'Items', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10229', 'resourceitem.itemid', 'zh_CN', '组件标识', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10230', 'resourceitem.itemid', 'en_GB', 'Item ID', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10231', 'resourceitem.itemname', 'zh_CN', '组件名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10232', 'resourceitem.itemname', 'en_GB', 'Item Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10233', 'resourceitem.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10234', 'resourceitem.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10235', 'resourceitem.resource', 'zh_CN', '目标资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10236', 'resourceitem.resource', 'en_GB', 'Target Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10237', 'hap.expand', 'zh_CN', '展开', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10238', 'hap.expand', 'en_GB', 'Expand', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10239', 'hap.collapse', 'zh_CN', '合并', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10240', 'hap.collapse', 'en_GB', 'Collapse', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10241', 'hap.comment', 'zh_CN', '备注', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10242', 'hap.comment', 'en_GB', 'Comment', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10243', 'messageemailconfig.configcode', 'zh_CN', '配置代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10244', 'messageemailconfig.configcode', 'en_GB', 'Config Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10245', 'messageemailconfig.introduction', 'zh_CN', '简介', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10246', 'messageemailconfig.introduction', 'en_GB', 'Introduction', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10247', 'messageemailconfig.host', 'zh_CN', '发送服务器', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10248', 'messageemailconfig.host', 'en_GB', 'SMTP Host', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10249', 'messageemailconfig.port', 'zh_CN', '端口', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10250', 'messageemailconfig.port', 'en_GB', 'Port', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10251', 'messageemailconfig.trytimes', 'zh_CN', '重试次数', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10252', 'messageemailconfig.trytimes', 'en_GB', 'Try Times', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10253', 'messageemailconfig.usewhitelist', 'zh_CN', '启用白名单', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10254', 'messageemailconfig.usewhitelist', 'en_GB', 'Use White List', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10255', 'messageemailconfig.username', 'zh_CN', '用户名', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10256', 'messageemailconfig.username', 'en_GB', 'User Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10257', 'messageemailconfig.password', 'zh_CN', '密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10258', 'messageemailconfig.password', 'en_GB', 'Password', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10259', 'messageemailconfig.accountcode', 'zh_CN', '账户代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10260', 'messageemailconfig.accountcode', 'en_GB', 'Account Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10261', 'messageemailconfig.account', 'zh_CN', '账户', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10262', 'messageemailconfig.account', 'en_GB', 'Account', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10263', 'messageemailconfig.whitelist', 'zh_CN', '白名单', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10264', 'messageemailconfig.whitelist', 'en_GB', 'White List', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10265', 'messageemailconfig.address', 'zh_CN', '地址', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10266', 'messageemailconfig.address', 'en_GB', 'Address', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10267', 'messagetemplate.templatecode', 'zh_CN', '模板代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10268', 'messagetemplate.templatecode', 'en_GB', 'Template Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10269', 'messagetemplate.name', 'zh_CN', '模板名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10270', 'messagetemplate.name', 'en_GB', 'Template Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10271', 'messagetemplate.prioritylevel', 'zh_CN', '优先级', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10272', 'messagetemplate.prioritylevel', 'en_GB', 'Priority', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10273', 'messagetemplate.subject', 'zh_CN', '主题', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10274', 'messagetemplate.subject', 'en_GB', 'Subject', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10275', 'messagetemplate.content', 'zh_CN', '内容', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10276', 'messagetemplate.content', 'en_GB', 'Content', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10277', 'message.subject', 'zh_CN', '主题', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10278', 'message.subject', 'en_GB', 'Subject', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10279', 'message.content', 'zh_CN', '内容', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10280', 'message.content', 'en_GB', 'Content', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10281', 'message.receivers', 'zh_CN', '收件人', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10282', 'message.receivers', 'en_GB', 'Receivers', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10283', 'user.info', 'zh_CN', '用户信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10284', 'user.info', 'en_GB', 'User Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10285', 'user.status', 'zh_CN', '状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10286', 'user.status', 'en_GB', 'Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10287', 'user.updatepassword', 'zh_CN', '修改密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10288', 'user.updatepassword', 'en_GB', 'Update Password', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10289', 'user.current_password', 'zh_CN', '当前密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10290', 'user.current_password', 'en_GB', 'Current Password', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10291', 'user.new_password', 'zh_CN', '新密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10292', 'user.new_password', 'en_GB', 'New Password', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10293', 'user.again_new_password', 'zh_CN', '确认新密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10294', 'user.again_new_password', 'en_GB', 'New Password Again', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10295', 'preference.timezone', 'zh_CN', '时区', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10296', 'preference.timezone', 'en_GB', 'TimeZone', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10297', 'profilevalue.levelid', 'zh_CN', '层级', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10298', 'profilevalue.levelid', 'en_GB', 'Level', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10299', 'profilevalue.levelvalue', 'zh_CN', '层级值', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10300', 'profilevalue.levelvalue', 'en_GB', 'Level Value', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10301', 'profilevalue.profilevalue', 'zh_CN', '配置值', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10302', 'profilevalue.profilevalue', 'en_GB', 'Profile Value', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10303', 'attachcategory.categoryname', 'zh_CN', '目录名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10304', 'attachcategory.categoryname', 'en_GB', 'Category Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10305', 'attachcategory.categorypath', 'zh_CN', '存储路径', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10306', 'attachcategory.categorypath', 'en_GB', 'Save Path', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10307', 'attachcategory.description', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10308', 'attachcategory.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10309', 'attachcategory.allowedfiletype', 'zh_CN', '文件类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10310', 'attachcategory.allowedfiletype', 'en_GB', 'File Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10311', 'attachcategory.allowedfilesize', 'zh_CN', '最大文件长度', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10312', 'attachcategory.allowedfilesize', 'en_GB', 'Allow File Size', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10313', 'attachcategory.sourcetype', 'zh_CN', '来源类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10314', 'attachcategory.sourcetype', 'en_GB', 'Source Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10315', 'attachcategory.isunique', 'zh_CN', '唯一', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10316', 'attachcategory.isunique', 'en_GB', 'Unique', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10317', 'attachcategory.statusname', 'zh_CN', '状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10318', 'attachcategory.statusname', 'en_GB', 'Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10319', 'attachcategory.statusname.normal', 'zh_CN', '普通', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10320', 'attachcategory.statusname.normal', 'en_GB', 'Normal', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10321', 'attachcategory.statusname.archived', 'zh_CN', '压缩', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10322', 'attachcategory.statusname.archived', 'en_GB', 'Archived', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10323', 'attachcategory.archive', 'zh_CN', '压缩', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10324', 'attachcategory.archive', 'en_GB', 'Archive', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10325', 'sysfile.filename', 'zh_CN', '文件名', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10326', 'sysfile.filename', 'en_GB', 'File Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10327', 'sysfile.filesize', 'zh_CN', '文件大小', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10328', 'sysfile.filesize', 'en_GB', 'File Size', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10329', 'sysfile.uploaddate', 'zh_CN', '上传日期', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10330', 'sysfile.uploaddate', 'en_GB', 'Upload Date', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10331', 'sysfile.filetype', 'zh_CN', '文件类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10332', 'sysfile.filetype', 'en_GB', 'File Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10333', 'hap.view', 'zh_CN', '查看', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10334', 'hap.view', 'en_GB', 'View', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10335', 'sysfile.upload', 'zh_CN', '上传', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10336', 'sysfile.upload', 'en_GB', 'Upload', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10337', 'hap.tip.info', 'zh_CN', '提示', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10338', 'hap.tip.info', 'en_GB', 'Information', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10339', 'hap.tip.success', 'zh_CN', '成功', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10340', 'hap.tip.success', 'en_GB', 'Success', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10341', 'function.resourcechoose', 'zh_CN', '选择资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10342', 'function.resourcechoose', 'en_GB', 'Choose Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10343', 'hap.tip.delete_confirm', 'zh_CN', '确定删除？', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10344', 'hap.tip.delete_confirm', 'en_GB', 'Confirm Delete?', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10345', 'hap.confirm', 'zh_CN', '确认', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10346', 'hap.confirm', 'en_GB', 'Confirm', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10347', 'role.changerole', 'zh_CN', '切换角色', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10348', 'role.changerole', 'en_GB', 'Change Role', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10349', 'user.verificode', 'zh_CN', '验证码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10350', 'user.verificode', 'en_GB', 'Verify Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10351', 'account.common.logintip', 'zh_CN', '请登录', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10352', 'account.common.logintip', 'en_GB', 'Please Login', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10353', 'hap.confirm_exit', 'zh_CN', '确定退出？', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10354', 'hap.confirm_exit', 'en_GB', 'Quit?', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10355', 'rolefunction.select_role', 'zh_CN', '选择角色', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10356', 'rolefunction.select_role', 'en_GB', 'Select Role', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10357', 'hap.login', 'zh_CN', '登录', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10358', 'hap.login', 'en_GB', 'Login', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10359', 'hap.multilanguage_editor', 'zh_CN', '多语言编辑', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10360', 'hap.multilanguage_editor', 'en_GB', 'MultiLangauge Edit', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10361', 'error.login.verification_code_error', 'zh_CN', '验证码错误', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10362', 'error.login.verification_code_error', 'en_GB', 'Verification Code Error', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10363', 'error.login.name_password_not_match', 'zh_CN', '用户名或密码错误', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10364', 'error.login.name_password_not_match', 'en_GB', 'Wrong user name or password', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10365', 'job.attributename', 'zh_CN', '参数名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10366', 'job.attributename', 'en_GB', 'Attribute Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10367', 'job.attributevalue', 'zh_CN', '参数值', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10368', 'job.attributevalue', 'en_GB', 'Attribute Value', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10369', 'crontriggerdto.cronexpression', 'zh_CN', 'Cron 表达式', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10370', 'crontriggerdto.cronexpression', 'en_GB', 'Cron Expression', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10371', 'triggerdto.starttime', 'zh_CN', '开始时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10372', 'triggerdto.starttime', 'en_GB', 'Start Time', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10373', 'triggerdto.endtime', 'zh_CN', '结束时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10374', 'triggerdto.endtime', 'en_GB', 'End Time', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10375', 'error.user.two_password_not_match', 'zh_CN', '两次密码不匹配', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10376', 'error.user.two_password_not_match', 'en_GB', 'Two Password Not Match', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10377', 'error.user.accout_locked', 'zh_CN', '账户已锁定', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10378', 'error.user.accout_locked', 'en_GB', 'Account Locked', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10379', 'error.user.account_not_active', 'zh_CN', '用户未激活', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10380', 'error.user.account_not_active', 'en_GB', 'User Not Active', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10381', 'error.user.account_expired', 'zh_CN', '用户已过期', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10382', 'error.user.account_expired', 'en_GB', 'User Expired', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10383', 'user.startactivedate', 'zh_CN', '开始有效日期', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10384', 'user.startactivedate', 'en_GB', 'Start Active Date', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10385', 'user.endactivedate', 'zh_CN', '失效日期', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10386', 'user.endactivedate', 'en_GB', 'End Active Date', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10387', 'error.record_not_exists_or_version_not_match', 'zh_CN', '记录不存在或版本不一致.', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10388', 'error.record_not_exists_or_version_not_match', 'en_GB', 'Record not exists or version NOT MATCH.', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10389', 'sys.config.configuration', 'en_GB', 'System Configuration', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10390', 'sys.config.configuration', 'zh_CN', '系统配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10391', 'sys.config.style', 'en_GB', 'Style', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10392', 'sys.config.style', 'zh_CN', '样式', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10393', 'sys.config.safety', 'en_GB', 'Safety Policy', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10394', 'sys.config.safety', 'zh_CN', '安全策略', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10395', 'sys.config.other', 'en_GB', 'PassWord Policy', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10396', 'sys.config.other', 'zh_CN', '密码策略', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10397', 'sys.config.system_title', 'en_GB', 'system title', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10398', 'sys.config.system_title', 'zh_CN', '系统标题', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10399', 'sys.config.systemlogo', 'en_GB', 'system logo', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10400', 'sys.config.systemlogo', 'zh_CN', '系统图标', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10401', 'sys.config.favicon', 'en_GB', 'favicon', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10402', 'sys.config.favicon', 'zh_CN', 'favicon', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10403', 'sys.config.captcha', 'en_GB', 'captcha', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10404', 'sys.config.captcha', 'zh_CN', '验证码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10405', 'sys.config.default_password', 'en_GB', 'new user default password', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10406', 'sys.config.default_password', 'zh_CN', '新用户默认密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10407', 'sys.config.systemlogo.desciption', 'en_GB', 'Please upload so. jpg, jpeg, png, gifsuffix, such as pictures, a ratio of 70 * 30', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10408', 'sys.config.systemlogo.desciption', 'zh_CN', '只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为70*30', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10409', 'sys.config.favicon.desciption', 'en_GB', 'Please upload so. jpg, jpeg, png, gifsuffix, such as pictures, a ratio of 32*32', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10410', 'sys.config.favicon.desciption', 'zh_CN', '只能上传.png,.jpg,.jpeg,.gif等后缀的图片,比例为32*32', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10411', 'hap.enableflag', 'zh_CN', '是否启用', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10412', 'hap.enableflag', 'en_GB', 'Enabled', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10413', 'role.isexpired', 'zh_CN', '是否过期', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10414', 'role.isexpired', 'en_GB', 'Expired', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10415', 'employee.employeelevelcode', 'en_GB', 'Level Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10416', 'employee.employeelevelcode', 'zh_CN', '员工等级代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10417', 'preference.locale', 'en_GB', 'Select Language', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10418', 'preference.locale', 'zh_CN', '选择语言', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10419', 'preference.timezone.description', 'en_GB', 'Select your time zone', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10420', 'preference.timezone.description', 'zh_CN', '请选择您所在的区域的时区', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10421', 'preference.locale.description', 'en_GB', 'Select your language', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10422', 'preference.locale.description', 'zh_CN', '请选择语言种类', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10423', 'preference.theme', 'en_GB', 'Select Theme', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10424', 'preference.theme', 'zh_CN', '选择皮肤', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10425', 'position.name', 'en_GB', 'Position Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10426', 'position.name', 'zh_CN', '岗位名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10427', 'position.description', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10428', 'position.description', 'zh_CN', '岗位描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10429', 'position.positioncode', 'en_GB', 'PositionCode', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10430', 'position.positioncode', 'zh_CN', '岗位编码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10431', 'position.parentpositionname', 'en_GB', 'Parent Position', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10432', 'position.parentpositionname', 'zh_CN', '上级岗位', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10433', 'hrorgunit.name', 'en_GB', 'Unit Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10434', 'hrorgunit.name', 'zh_CN', '组织名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10435', 'hrorgunit.description', 'en_GB', 'Unit Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10436', 'hrorgunit.description', 'zh_CN', '组织描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10437', 'hrorgunit.unitcode', 'en_GB', 'Unit Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10438', 'hrorgunit.unitcode', 'zh_CN', '组织编码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10439', 'hrorgunit.parentname', 'en_GB', 'Superior Unit', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10440', 'hrorgunit.parentname', 'zh_CN', '上级组织', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10441', 'hap.tip.noselect', 'en_GB', 'You did not select any item!', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10442', 'hap.tip.noselect', 'zh_CN', '您未选中任何项！', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10443', 'employee.employeecode', 'en_GB', 'Employee Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10444', 'employee.employeecode', 'zh_CN', '员工编码', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10445', 'employee.name', 'en_GB', 'Employee Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10446', 'employee.name', 'zh_CN', '员工姓名', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10447', 'employee.positionallocation', 'en_GB', 'Position Allocation', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10448', 'employee.positionallocation', 'zh_CN', '岗位分配', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10449', 'employee.borndate', 'en_GB', 'Born Date', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10450', 'employee.borndate', 'zh_CN', '出生日期', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10451', 'employee.mobile', 'en_GB', 'Phone Number', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10452', 'employee.mobile', 'zh_CN', '移动电话', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10453', 'employee.joindate', 'en_GB', 'Join Date', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10454', 'employee.joindate', 'zh_CN', '入职日期', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10455', 'employee.gender', 'en_GB', 'Gender', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10456', 'employee.gender', 'zh_CN', '性别', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10457', 'employee.status', 'en_GB', 'Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10458', 'employee.status', 'zh_CN', '状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10459', 'employee.enabledflag', 'en_GB', 'Enabled Flag', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10460', 'employee.enabledflag', 'zh_CN', '启用状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10461', 'employee.certificateid', 'en_GB', 'ID', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10462', 'employee.certificateid', 'zh_CN', '证件号', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10463', 'employee.companyinfo', 'en_GB', 'Company Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10464', 'employee.companyinfo', 'zh_CN', '公司信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10465', 'employee.otherinfo', 'en_GB', 'Other Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10466', 'employee.otherinfo', 'zh_CN', '其他信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:05', '-1', '2017-01-13 11:15:05', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10467', 'employee.personalinfo', 'en_GB', 'Personal Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10468', 'employee.personalinfo', 'zh_CN', '个人信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10469', 'employee.ismainposition', 'en_GB', 'Main Position', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10470', 'employee.ismainposition', 'zh_CN', '是否主岗位', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10471', 'position.selectposition', 'en_GB', 'Select Position', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10472', 'position.selectposition', 'zh_CN', '选择岗位', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10473', 'hrorgunit.unittreelist', 'zh_CN', '查看组织结构', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10474', 'hrorgunit.unittreelist', 'en_GB', 'Unit Structure', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10475', 'hrorgunit.unitinfo', 'zh_CN', '组织信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10476', 'hrorgunit.unitinfo', 'en_GB', 'Unit Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10477', 'sys.config.password_policy', 'en_GB', 'PassWord Policy', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10478', 'sys.config.password_policy', 'zh_CN', '密码策略', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10479', 'sys.config.password_min_length', 'en_GB', 'Password Min Length', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10480', 'sys.config.password_min_length', 'zh_CN', '密码最小长度', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10481', 'sys.config.password_complexity', 'en_GB', 'Password Complexity', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10482', 'sys.config.password_complexity', 'zh_CN', '密码复杂度要求', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10483', 'error.user.update_password', 'zh_CN', '用户密码失效，重新设置密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10484', 'error.user.update_password', 'en_GB', 'password expire ,reset your password', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10485', 'error.user.current_password_notempty', 'zh_CN', '当前密码不能为空', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10486', 'error.user.current_password_notempty', 'en_GB', 'current password can not be empty', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10487', 'error.user.new_password_notempty', 'zh_CN', '新密码不能为空', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10488', 'error.user.new_password_notempty', 'en_GB', 'new password can not be empty', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10489', 'error.user.new_password_again', 'zh_CN', '请再次输入新密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10490', 'error.user.new_password_again', 'en_GB', 'please input new password again', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10491', 'sys.config.password_invalid_time', 'zh_CN', '密码失效时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10492', 'sys.config.password_invalid_time', 'en_GB', 'password invalid time', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10493', 'user.passwordlength.insufficient', 'zh_CN', '密码长度不能小于', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10494', 'user.passwordlength.insufficient', 'en_GB', 'Password length cannot be less than', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10495', 'user.password.discord', 'zh_CN', '密码输入不一致', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10496', 'user.password.discord', 'en_GB', 'Do not match the password input', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10497', 'company.companycode', 'zh_CN', '公司代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10498', 'company.companycode', 'en_GB', 'company code', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10499', 'company.companyshortname', 'zh_CN', '公司简称', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10500', 'company.companyshortname', 'en_GB', 'company short name', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10501', 'company.companyfullname', 'en_GB', 'company full name', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10502', 'company.companyfullname', 'zh_CN', '公司全称', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10503', 'company.companytype', 'zh_CN', '公司类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10504', 'company.companytype', 'en_GB', 'company type', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10505', 'company.address', 'zh_CN', '公司地址', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10506', 'company.address', 'en_GB', 'company address', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10507', 'company.companylevelid', 'zh_CN', '公司等级', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10508', 'company.companylevelid', 'en_GB', 'company level id', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10509', 'company.positionname', 'zh_CN', '公司岗位', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10510', 'company.positionname', 'en_GB', 'position', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10511', 'company.parentcompanyname', 'zh_CN', '上级公司', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10512', 'company.parentcompanyname', 'en_GB', 'Superior Company', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10513', 'company.zipcode', 'zh_CN', '邮政编码', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10514', 'company.zipcode', 'en_GB', 'zipcode', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10515', 'company.phone', 'zh_CN', '联系电话', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10516', 'company.phone', 'en_GB', 'phone', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10517', 'company.contactperson', 'zh_CN', '联系人', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10518', 'company.contactperson', 'en_GB', 'contact person', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10519', 'company.fax', 'zh_CN', '传真', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10520', 'company.fax', 'en_GB', 'fax', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10521', 'sys.config.select_file', 'zh_CN', '选择文件', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10522', 'sys.config.select_file', 'en_GB', 'Select File', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10523', 'sys.config.upload_file', 'zh_CN', '上传', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10524', 'sys.config.upload_file', 'en_GB', 'Upload', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10525', 'error.user.email', 'zh_CN', '请输入正确的Email信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10526', 'error.user.email', 'en_GB', 'Please enter the correct Email information', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10527', 'error.user.phone', 'zh_CN', '请输入正确的电话信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10528', 'error.user.phone', 'en_GB', 'Please enter the correct Phone information', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10529', 'hap.quicknavigation', 'zh_CN', '输入功能代码或功能名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10530', 'hap.quicknavigation', 'en_GB', 'Please input function code or name', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10531', 'error.account_no_role', 'zh_CN', '该账户下无有效角色', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10532', 'error.account_no_role', 'en_GB', 'this account has no valid role', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10533', 'sys.config.password_invalid_describe', 'zh_CN', '单位:天 ,0表示密码不过期', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10534', 'sys.config.password_invalid_describe', 'en_GB', 'Unit: day, 0 means password not expired', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10535', 'sys.dashboard.dashboardtitle', 'zh_CN', '标题', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10536', 'sys.dashboard.dashboardtitle', 'en_GB', 'Title', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10537', 'sys.dashboard.dashboardcode', 'zh_CN', '代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10538', 'sys.dashboard.dashboardcode', 'en_GB', 'Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10539', 'sys.dashboard.dashboardmainpage', 'zh_CN', '入口页面', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10540', 'sys.dashboard.dashboardmainpage', 'en_GB', 'Mainpage', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10541', 'sys.dashboard.dashboarddescription', 'zh_CN', '描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10542', 'sys.dashboard.dashboarddescription', 'en_GB', 'Description', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10543', 'job.infodetail.jobinfo', 'zh_CN', '任务参数', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10544', 'job.infodetail.jobinfo', 'en_GB', 'Job Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10545', 'job.infodetail.notification', 'zh_CN', '结束通知', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10546', 'job.infodetail.notification', 'en_GB', 'Notification', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10547', 'job.infodetail.enable_notification', 'zh_CN', '启用通知', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10548', 'job.infodetail.enable_notification', 'en_GB', 'Enable Nofitication', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10549', 'job.infodetail.email_address', 'zh_CN', '邮件地址', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10550', 'job.infodetail.email_address', 'en_GB', 'Email Address', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10551', 'job.jobdetail', 'zh_CN', '任务明细', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10552', 'job.jobdetail', 'en_GB', 'Job Details', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10553', 'simpletriggerdto.repeatinterval', 'zh_CN', '重复间隔', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10554', 'simpletriggerdto.repeatinterval', 'en_GB', 'Repeat Interval', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10555', 'simpletriggerdto.repeatcount', 'zh_CN', '重复次数', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10556', 'simpletriggerdto.repeatcount', 'en_GB', 'Repeat Count', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10557', 'generator.projectpath', 'zh_CN', '项目路径', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10558', 'generator.projectpath', 'en_GB', 'Project path', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10559', 'generator.parentpackagepath', 'zh_CN', '包父路径', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10560', 'generator.parentpackagepath', 'en_GB', 'Parent Package Path', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10561', 'generator.packagepath', 'zh_CN', '包路径', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10562', 'generator.packagepath', 'en_GB', 'Package Path', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10563', 'generator.choosetable', 'zh_CN', '选择表', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10564', 'generator.choosetable', 'en_GB', 'choose table', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10565', 'generator.filetype', 'zh_CN', '文件类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10566', 'generator.filetype', 'en_GB', 'File Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10567', 'generator.filename', 'zh_CN', '文件名', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10568', 'generator.filename', 'en_GB', 'File Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10569', 'generator.iscreate', 'zh_CN', '是否创建', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10570', 'generator.iscreate', 'en_GB', 'is Created', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10571', 'generator.iscover', 'zh_CN', '是否覆盖', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10572', 'generator.iscover', 'en_GB', 'is Cover', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10573', 'generator.htmlmodel', 'zh_CN', '选则ftl模板', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10574', 'generator.htmlmodel', 'en_GB', 'Choose FTL Template', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10575', 'generator.submit', 'zh_CN', '创建文件', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10576', 'generator.submit', 'en_GB', 'Create File', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10577', 'generator.needchoosetable', 'zh_CN', '请选择一个表', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10578', 'generator.needchoosetable', 'en_GB', 'Please Choose a Table', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10579', 'hrorgunit.companyname', 'zh_CN', '公司', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10580', 'hrorgunit.companyname', 'en_GB', 'Company', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10581', 'hap.copy', 'zh_CN', '复制', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10582', 'hap.copy', 'en_GB', 'Copy', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10583', 'hap.tip.selectrow', 'zh_CN', '请选择一行', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10584', 'hap.tip.selectrow', 'en_GB', 'Please Select One', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10585', 'hap.tip.selectrows', 'zh_CN', '请至少选择一行', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10586', 'hap.tip.selectrows', 'en_GB', 'Please Select At Least One', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10587', 'hap.typeorkey_empty', 'zh_CN', '参数附件类型或者附件索引值为空', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10588', 'hap.typeorkey_empty', 'en_GB', 'Type Or Key Empty', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10589', 'hap.type_error', 'zh_CN', '主目录中没有对应的附件类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10590', 'hap.type_error', 'en_GB', 'Type Error', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10591', 'hap.database_error', 'zh_CN', '数据库错误', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10592', 'hap.database_error', 'en_GB', 'Database Error', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10593', 'hap.mesg_unique', 'zh_CN', '该文件目录只允许上传一个文件', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10594', 'hap.mesg_unique', 'en_GB', 'Category Unique', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10595', 'hap.download', 'zh_CN', '下载', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10596', 'hap.download', 'en_GB', 'Download', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10597', 'hap.mesg_delete', 'zh_CN', '删除成功', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10598', 'hap.mesg_delete', 'en_GB', 'Deleted', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10599', 'message.sendflag', 'zh_CN', '发送状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10600', 'message.sendflag', 'en_GB', 'Send Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10601', 'message.templatetest', 'zh_CN', '模板邮件定义', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10602', 'message.templatetest', 'en_GB', 'Template Message', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10603', 'message.customtest', 'zh_CN', '自定义邮件定义', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10604', 'message.customtest', 'en_GB', 'Custom Message', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10605', 'message.rensend', 'zh_CN', '重新发送', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10606', 'message.rensend', 'en_GB', 'ReSend Message', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10607', 'messagetemplate.creationdate', 'zh_CN', '邮件创建时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10608', 'messagetemplate.creationdate', 'en_GB', 'Message Create Time', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10609', 'messagetemplate.lastupdatedate', 'zh_CN', '邮件更新时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10610', 'messagetemplate.lastupdatedate', 'en_GB', 'Message Update Time', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10611', 'hap.upload_success', 'zh_CN', '上传成功', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10612', 'hap.upload_success', 'en_GB', 'Upload Success', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10613', 'codevalue.orderseq', 'zh_CN', '排序号', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10614', 'codevalue.orderseq', 'en_GB', 'Order Seq', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10615', 'sys.login.safety', 'zh_CN', '登录策略', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10616', 'sys.login.safety', 'en_GB', 'Login Policy', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10617', 'sys.config.rolemerge', 'zh_CN', '角色合并', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10618', 'sys.config.rolemerge', 'en_GB', 'Role Merge', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10619', 'sys.config.user_role_merge.describe', 'zh_CN', '合并后，登录不在需要选择角色，菜单、权限都是合并后的', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10620', 'sys.config.user_role_merge.describe', 'en_GB', 'After the merger, the login is not need to select roles, menus, permissions are combined', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10621', 'sys.config.default_target_url', 'zh_CN', '跳转URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10622', 'sys.config.default_target_url', 'en_GB', 'Target URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10623', 'sys.config.default_target_url.describe', 'zh_CN', '登录成功以后跳转的URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10624', 'sys.config.default_target_url.describe', 'en_GB', 'Login successful redirect URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10625', 'interface.systemname', 'zh_CN', '系统名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10626', 'interface.systemname', 'en_GB', 'System Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10627', 'interface.interfacetype', 'zh_CN', '接口类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10628', 'interface.interfacetype', 'en_GB', 'Interface Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10629', 'interface.systemurl', 'zh_CN', '系统地址', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10630', 'interface.systemurl', 'en_GB', 'System URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10631', 'interface.requestmethod', 'zh_CN', '请求方式', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10632', 'interface.requestmethod', 'en_GB', 'Request Method', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10633', 'interface.requestformat', 'zh_CN', '请求形式', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10634', 'interface.requestformat', 'en_GB', 'Request Format', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10635', 'interface.mapperclass', 'zh_CN', '映射类', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10636', 'interface.mapperclass', 'en_GB', 'Mapper Class', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10637', 'interface.namespace', 'zh_CN', '命名空间', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10638', 'interface.namespace', 'en_GB', 'Namespace', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10639', 'interface.enableflag', 'zh_CN', '是否有效', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10640', 'interface.enableflag', 'en_GB', 'Enable Flag', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10641', 'interface.authflag', 'zh_CN', '是否校验', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10642', 'interface.authflag', 'en_GB', 'Auth Flag', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10643', 'interface.requestcontenttype', 'zh_CN', '请求报文格式', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10644', 'interface.requestcontenttype', 'en_GB', 'Request Content Type', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10645', 'interface.requestaccept', 'zh_CN', '请求接受类型', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10646', 'interface.requestaccept', 'en_GB', 'Request Accept', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10647', 'interface.checkusername', 'zh_CN', '校验用户名', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10648', 'interface.checkusername', 'en_GB', 'Check User Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10649', 'interface.checkpassword', 'zh_CN', '校验密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10650', 'interface.checkpassword', 'en_GB', 'Check Password', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10651', 'interface.soapheader', 'zh_CN', 'SOAP报文前缀', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10652', 'interface.soapheader', 'en_GB', 'SOAP Header', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10653', 'interface.soaptail', 'zh_CN', 'SOAP报文后缀', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10654', 'interface.soaptail', 'en_GB', 'SOAP Tail', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10655', 'interface.headeredit', 'zh_CN', '编辑接口信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10656', 'interface.headeredit', 'en_GB', 'Interface Header Edit', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10657', 'interface.lineedit', 'zh_CN', '查看接口信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10658', 'interface.lineedit', 'en_GB', 'View Interface', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10659', 'interface.line.interfacecode', 'zh_CN', '接口代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10660', 'interface.line.interfacecode', 'en_GB', 'Interface Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10661', 'interface.systemcode', 'zh_CN', '系统代码', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10662', 'interface.systemcode', 'en_GB', 'System Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10663', 'interface.line.interfacename', 'zh_CN', '接口名称', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10664', 'interface.line.interfacename', 'en_GB', 'Interface Name', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10665', 'interface.lind.interfaceurl', 'zh_CN', '接口地址', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10666', 'interface.lind.interfaceurl', 'en_GB', 'Interface URL', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10667', 'interface.invoke.inbound', 'zh_CN', '入站请求', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10668', 'interface.invoke.inbound', 'en_GB', 'Inbound Request', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10669', 'interface.invoke.outbound', 'zh_CN', '出站请求', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10670', 'interface.invoke.outbound', 'en_GB', 'Outbound Request', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10671', 'interface.invoke.requeststatus', 'zh_CN', '请求状态', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10672', 'interface.invoke.requeststatus', 'en_GB', 'Request Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10673', 'interface.invoke.requesttime', 'zh_CN', '请求日期', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10674', 'interface.invoke.requesttime', 'en_GB', 'Request Date', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10675', 'interface.invoke.requestip', 'zh_CN', '用户IP', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10676', 'interface.invoke.requestip', 'en_GB', 'User IP', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10677', 'interface.invoke.responsetime', 'zh_CN', '响应时间', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10678', 'interface.invoke.responsetime', 'en_GB', 'Response Time', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10679', 'interface.invoke.detail', 'zh_CN', '详细信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10680', 'interface.invoke.detail', 'en_GB', 'Invoke Detail', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10681', 'interface.invoke.requestparameter', 'zh_CN', '请求参数', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10682', 'interface.invoke.requestparameter', 'en_GB', 'Request Parameter', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10683', 'interface.invoke.responsecode', 'zh_CN', 'HTTP CODE', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10684', 'interface.invoke.responsecode', 'en_GB', 'HTTP CODE', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10685', 'interface.invoke.requestbodyprm', 'zh_CN', '请求body', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10686', 'interface.invoke.requestbodyprm', 'en_GB', 'Body Parameter', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10687', 'interface.invoke.responsecontent', 'zh_CN', '响应内容', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10688', 'interface.invoke.responsecontent', 'en_GB', 'Response Date', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10689', 'interface.invoke.stacktrace', 'zh_CN', '错误堆栈', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10690', 'interface.invoke.stacktrace', 'en_GB', 'Stack Trace', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10691', 'interface.invoke.userreferer', 'zh_CN', 'Referer', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10692', 'interface.invoke.userreferer', 'en_GB', 'Referer', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10693', 'interface.invoke.useragent', 'zh_CN', 'User-Agent', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10694', 'interface.invoke.useragent', 'en_GB', 'User-Agent', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10695', 'interface.invoke.statsenddate', 'zh_CN', '开始日期', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10696', 'interface.invoke.statsenddate', 'en_GB', 'Begin Date', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10697', 'hap.error.uniqueexception', 'zh_CN', '数据重复', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10698', 'hap.error.uniqueexception', 'en_GB', 'Data Duplicated', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10699', 'hap.error.nullexception', 'zh_CN', '字段不能为空', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10700', 'hap.error.nullexception', 'en_GB', 'Field can not be null', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10701', 'hap.exportexcel', 'zh_CN', '导出Excel', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10702', 'hap.exportexcel', 'en_GB', 'Export Excel', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10703', 'interface.invoke.endsenddate', 'zh_CN', '截止日期', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10704', 'interface.invoke.endsenddate', 'en_GB', 'End Date', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10705', 'hap.invoke.apiname.interfacetranspond', 'zh_CN', '接口透传', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_prompts` VALUES ('10706', 'hap.invoke.apiname.interfacetranspond', 'en_GB', 'Interface Transpond', '1', '-1', '-1', '-1', '2017-01-13 11:15:06', '-1', '2017-01-13 11:15:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_resource_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_b`;
CREATE TABLE `sys_resource_b` (
  `RESOURCE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) NOT NULL COMMENT 'URL',
  `TYPE` varchar(15) DEFAULT NULL COMMENT '资源类型',
  `NAME` varchar(40) DEFAULT NULL COMMENT '资源名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `LOGIN_REQUIRE` varchar(1) DEFAULT 'Y' COMMENT '是否需要登录',
  `ACCESS_CHECK` varchar(1) DEFAULT 'Y' COMMENT '是否权限校验',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`),
  UNIQUE KEY `SYS_RESOURCE_B_U1` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=10187 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_b
-- ----------------------------
INSERT INTO `sys_resource_b` VALUES ('10001', '403.html', 'HTML', '403', '403', 'N', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10002', '404.html', 'HTML', '404', '404', 'N', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10003', '500.html', 'HTML', '500', '500', 'N', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10004', 'activiti/models.html', 'HTML', '流程设计', null, 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10005', 'activiti/my_task.html', 'HTML', '我的代办', null, 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10006', 'activiti/process_definitions.html', 'HTML', '部署管理', null, 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10007', 'activiti/process_history.html', 'HTML', '流程历史', null, 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10008', 'activiti/start_process_test.html', 'HTML', '流程测试', null, 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10009', 'activiti/task_list.html', 'HTML', '代办事项(管理员)', null, 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10010', 'home.html', 'HTML', '首页', '首页', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10011', 'hr/employee.html', 'HTML', '员工', '员工', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10012', 'hr/employee/query', 'SERVICE', '员工查询', '员工查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10013', 'hr/employee/submit', 'SERVICE', '员工更新', '员工更新', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10014', 'hr/position.html', 'HTML', '岗位', '部门岗位', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10015', 'hr/position/query', 'SERVICE', '岗位查询', '岗位查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10016', 'hr/position/remove', 'SERVICE', '删除岗位', '删除岗位', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10017', 'hr/position/submit', 'SERVICE', '岗位修改', '岗位修改', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10018', 'hr/org_unit.html', 'HTML', '组织', '组织部门', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10019', 'hr/unit/query', 'SERVICE', '部门查询', '部门查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10020', 'hr/unit/remove', 'SERVICE', '删除部门', '删除部门', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10021', 'hr/unit/submit', 'SERVICE', '部门修改', '部门修改', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10022', 'index.html', 'HTML', '首页', '首页', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10023', 'job/job_detail.html', 'HTML', '任务明细', '任务明细', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10024', 'job/job_cron_add.html', 'HTML', '新建 CRON 任务', '新建CRON 任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10025', 'job/job_simple_add.html', 'HTML', '新建简单任务', '新建简单任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10026', 'job/job_infodetail.html', 'HTML', '任务详细', '任务详细', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10027', 'job/create', 'SERVICE', '新建任务', '新建任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10028', 'job/deletejob', 'SERVICE', '删除任务', '删除任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10029', 'job/pausejob', 'SERVICE', '暂停任务', '暂停任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10030', 'job/query', 'SERVICE', '查询任务', '查询任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10031', 'job/queryInfo', 'SERVICE', '查询任务列表', '查询任务列表', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10032', 'job/resumejob', 'SERVICE', '恢复任务', '恢复任务', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10033', 'job/job_running_info.html', 'HTML', '执行记录', '执行记录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10034', 'job/jobinfo/query', 'SERVICE', '查询任务日志', '查询任务日志', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10035', 'job/scheduler.html', 'HTML', '调度器', '调度器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10036', 'job/scheduler/info', 'SERVICE', '调度器信息', '调度器信息', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10037', 'job/scheduler/pauseall', 'SERVICE', '暂停所有任务', '暂停所有任务', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10038', 'job/scheduler/query', 'SERVICE', '查询调度器', '查询调度器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10039', 'job/scheduler/resumeall', 'SERVICE', '恢复所有任务', '恢复所有任务', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10040', 'job/scheduler/standby', 'SERVICE', '暂停调度器', '暂停调度器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10041', 'job/scheduler/start', 'SERVICE', '启动调度器', '启动调度器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10042', 'login.html', 'HTML', '登录', '登录', 'N', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10043', 'role.html', 'HTML', '角色选择', '角色选择', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10044', 'attach/sys_attach_category_edit.html', 'HTML', '目录编辑', '目录编辑', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10045', 'attach/sys_attach_category_manage.html', 'HTML', '目录管理', '目录管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10046', 'sys/attachcategory/query', 'SERVICE', '查询目录', '查询目录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10047', 'sys/attachcategory/remove', 'SERVICE', '删除目录', '删除目录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10048', 'sys/attachcategory/submit', 'SERVICE', '更新目录', '更新目录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10049', 'attach/sys_file_manage.html', 'HTML', '文件管理', '文件管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10050', 'sys/attachcategory/tree', 'SERVICE', '查询目录树', '查询目录树', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10051', 'sys/attach/file/queryFiles', 'SERVICE', '查询文件', '查询目录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10052', 'sys/attach/file/remove', 'SERVICE', '删除附件', '删除附件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10053', 'sys/attach/file/detail', 'SERVICE', '查看附件内容', '查看附件内容', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10054', 'sys/attach/file/view', 'SERVICE', '查看附件', '查看附件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10055', 'sys/attach/remove', 'SERVICE', '删除附件', '删除附件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10056', 'sys/attach/file/query', 'SERVICE', '查询目录文件', '查询目录文件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10057', 'sys/attach/manage', 'SERVICE', '附件列表', '附件列表', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10058', 'attach/sys_attachment_create.html', 'HTML', '上传测试', '上传测试', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10059', 'sys/attach/upload', 'SERVICE', '附件上传', '附件上传', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10060', 'sys/code/query', 'SERVICE', '查询快码', '查询快码', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10061', 'sys/code/remove', 'SERVICE', '删除快码', '删除快码', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10062', 'sys/code/submit', 'SERVICE', '更新快码', '更新快码', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10063', 'sys/codevalue/query', 'SERVICE', '查询快码值', '查询快码值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10064', 'sys/codevalue/remove', 'SERVICE', '删除快码值', '删除快码值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10065', 'sys/sys_function.html', 'HTML', '功能管理', '功能管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10066', 'sys_function_resource.html', 'HTML', '功能资源', '功能资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10067', 'sys/sys_function_addresource.html', 'HTML', '添加资源', '添加资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10068', 'sys/function/fetchNotResource', 'SERVICE', '获取未分配资源', '获取未分配资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10069', 'sys/function/fetchResource', 'SERVICE', '获取已分配资源', '获取已分配资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10070', 'sys/function/menus', 'SERVICE', '获取菜单', '获取菜单', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10071', 'sys/function/query', 'SERVICE', '查询功能', '查询功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10072', 'sys/function/remove', 'SERVICE', '删除功能', '删除功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10073', 'sys/function/submit', 'SERVICE', '更新功能', '更新功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10074', 'sys/function/updateFunctionResource', 'SERVICE', '更新功能资源', '更新功能资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10075', 'sys/sys_language.html', 'HTML', '语言维护', '语言维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10076', 'sys/language/delete', 'SERVICE', '删除语言', '删除语言', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10077', 'sys/language/query', 'SERVICE', '查询语言', '查询语言', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10078', 'sys/language/submit', 'SERVICE', '更新语言', '更新语言', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10079', 'sys/lov/load', 'SERVICE', '加载 LOV', '加载 LOV', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10080', 'sys/lov/query', 'SERVICE', '查询 LOV', '查询 LOV', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10081', 'sys/lov/remove', 'SERVICE', '删除 LOV', '删除 LOV', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10082', 'sys/lov/submit', 'SERVICE', '更新 LOV', '更新 LOV', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10083', 'sys/lovitem/query', 'SERVICE', '查询 LOV 列', '查询 LOV 列', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10084', 'sys/lovitem/remove', 'SERVICE', '删除 LOV 列', '删除 LOV 列', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10085', 'mail/sys_message_email_config.html', 'HTML', '邮件账户', '邮件账户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10086', 'mail/sys_message_email_config_edit.html', 'HTML', '编辑邮件配置', '编辑邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10087', 'sys/messageEmailAccount/query', 'SERVICE', '查询邮件账户', '查询邮件账户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10088', 'sys/messageEmailAccount/remove', 'SERVICE', '删除邮件账户', '删除邮件账户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10089', 'sys/messageEmailConfig/load', 'SERVICE', '加载邮件配置', '加载邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10090', 'sys/messageEmailConfig/query', 'SERVICE', '查询邮件配置', '查询邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10091', 'sys/messageEmailConfig/queryMsgConfigQuanties', 'SERVICE', '查询邮件配置数量', '查询配置数量', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10092', 'sys/messageEmailConfig/remove', 'SERVICE', '删除邮件配置', '删除邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10093', 'sys/messageEmailConfig/submit', 'SERVICE', '更新邮件配置', '更新邮件配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10094', 'sys/messageEmailWhiteList/query', 'SERVICE', '查询邮件白名单', '查询邮件白名单', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10095', 'sys/messageEmailWhiteList/remove', 'SERVICE', '删除邮件白名单', '删除邮件白名单', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10096', 'mail/sys_message_template.html', 'HTML', '邮件模板', '邮件模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10097', 'mail/sys_message_template_edit.html', 'HTML', '编辑模板', '编辑模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10098', 'sys/messageTemplate/add', 'SERVICE', '新建模板', '新建模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10099', 'sys/messageTemplate/query', 'SERVICE', '查询模板', '查询模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10100', 'sys/messageTemplate/remove', 'SERVICE', '删除模板', '删除模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10101', 'sys/messageTemplate/update', 'SERVICE', '更新模板', '更新模板', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10102', 'mail/sys_message_test.html', 'HTML', '邮件测试', '邮件测试', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10103', 'sys/message/sendTest', 'SERVICE', '邮件发送测试', '邮件发送测试', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10104', 'sys/preferences/queryPreferences', 'SERVICE', '查询首选项', '查询首选项', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10105', 'sys/preferences/savePreferences', 'SERVICE', '保存首选项', '保存首选项', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10106', 'sys/profile/query', 'SERVICE', '查询配置', '查询配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10107', 'sys/profile/remove', 'SERVICE', '删除配置', '删除配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10108', 'sys/profile/submit', 'SERVICE', '更新配置', '更新配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10109', 'sys/profilevalue/query', 'SERVICE', '查询配置值', '查询配置值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10110', 'sys/profilevalue/querylevelvalues', 'SERVICE', '查询指定级别的配置值', '查询指定级别的配置值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10111', 'sys/profilevalue/remove', 'SERVICE', '删除配置值', '删除配置值', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10112', 'sys/prompt/query', 'SERVICE', '查询描述', '查询描述', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10113', 'sys/prompt/remove', 'SERVICE', '删除描述', '删除描述', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10114', 'sys/prompt/submit', 'SERVICE', '更改描述', '更改描述', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10115', 'sys/sys_resource.html', 'HTML', '资源注册', '资源注册', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10116', 'sys/sys_resource_item.html', 'HTML', '资源组件', '资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10117', 'sys/sys_role_resource_item.html', 'HTML', '分配资源组件', '分配资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10118', 'sys/resource/query', 'SERVICE', '查询资源', '查询资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10119', 'sys/resource/remove', 'SERVICE', '删除资源', '删除资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10120', 'sys/resource/submit', 'SERVICE', '更新资源', '更新资源', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10121', 'sys/resourceItem/query', 'SERVICE', '查询资源组件', '查询资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10122', 'sys/resourceItem/remove', 'SERVICE', '删除资源组件', '删除资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10123', 'sys/resourceItem/submit', 'SERVICE', '更新资源组件', '更新资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10124', 'sys/role/queryRoleNotUserRole', 'SERVICE', '选择非当前角色', '选择非当前角色', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10125', 'sys/sys_role_function.html', 'HTML', '功能分配', '功能分配', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10126', 'sys/rolefunction/query', 'SERVICE', '查询角色功能', '查询角色功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10127', 'sys/rolefunction/queryResourceItems', 'SERVICE', '查询功能资源组件', '查询功能资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10128', 'sys/rolefunction/submit', 'SERVICE', '更新角色功能', '更新角色功能', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10129', 'sys/rolefunction/submitResourceItems', 'SERVICE', '更新功能资源组件', '更新资源组件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10130', 'sys/sys_code.html', 'HTML', '代码维护', '代码维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10131', 'sys/sys_code_edit.html', 'HTML', '编辑快码', '编辑快码', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10132', 'sys/sys_config.html', 'HTML', '系统配置', '系统配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10133', 'sys/sys_lov.html', 'HTML', 'LOV维护', 'LOV维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10134', 'sys/sys_lov_edit.html', 'HTML', '编辑 LOV', '编辑 LOV', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10135', 'sys/sys_lov_preview.html', 'HTML', 'LOV 预览', 'LOV 预览', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10136', 'sys/sys_multilanguage_editor.html', 'HTML', '多语言编辑器', '多语言编辑器', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10137', 'sys/sys_profile.html', 'HTML', '配置维护', '配置维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10138', 'sys/sys_profile_edit.html', 'HTML', '编辑配置文件', '编辑配置文件', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10139', 'sys/sys_prompt.html', 'HTML', '描述维护', '描述维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10140', 'sys/sys_role.html', 'HTML', '角色管理', '角色管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10141', 'sys/role/delete', 'SERVICE', '角色删除', '角色删除', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10142', 'sys/role/query', 'SERVICE', '角色查询', '角色查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10143', 'sys/role/submit', 'SERVICE', '角色更新', '角色更新', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10144', 'sys/sys_user.html', 'HTML', '用户管理', '用户管理', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10145', 'sys/sys_user_role.html', 'HTML', '角色分配', '角色分配', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10146', 'sys/sys_user_chooserole.html', 'HTML', '选择角色', '选择角色', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10147', 'sys/user/query', 'SERVICE', '用户查询', '用户查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10148', 'sys/user/remove', 'SERVICE', '删除用户', '删除用户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10149', 'sys/user/submit', 'SERVICE', '更新用户', '更新用户', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10150', 'sys/userrole/queryUserRoles', 'SERVICE', '查询用户角色', '查询用户角色', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10151', 'sys/userrole/submit', 'SERVICE', '保存用户角色', '保存用户角色', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10152', 'sys/um/getSingleUser', 'SERVICE', '单条用户信息', '单条用户信息', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10153', 'sys/um/isExistsEmail', 'SERVICE', '用户邮件检查', '用户邮件检查', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10154', 'sys/um/isExistsPhone', 'SERVICE', '电话号码检查', '电话号码检查', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10155', 'sys/um/isExistsUser', 'SERVICE', '用户是否存在', '用户是否存在', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10156', 'sys/um/query', 'SERVICE', '用户信息查询', '用户信息查询', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10157', 'sys/um/sys_login_success.html', 'HTML', '登录成功', '登录成功', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10158', 'sys/um/sys_update_password.html', 'HTML', '更改密码', '更改密码', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10159', 'sys/um/sys_user_info.html', 'HTML', '用户信息', '用户信息', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10160', 'sys/um/updatePassword', 'SERVICE', '更改密码', '更改密码', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10161', 'sys/um/updateUserInfo', 'SERVICE', '更新个人信息', '更新个人信息', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10162', 'sys_icon.html', 'HTML', '图标选择', '图标选择', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10163', 'timeout.html', 'HTML', '超时', '超时', 'N', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10164', 'verifiCode', 'SERVICE', '验证码服务', '验证码服务', 'N', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10165', 'fnd/company.html', 'HTML', '公司维护', '公司信息维护', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10166', 'fnd/company/update', 'SERVICE', '公司信息修改', '公司信息修改', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10167', 'fnd/company/query', 'SERVICE', '公司信息查询', '公司信息查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10168', 'fnd/company/remove', 'SERVICE', '公司信息删除', '公司信息删除', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10169', 'fnd/company_edit.html', 'HTML', '公司编辑界面', '公司编辑界面', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10170', 'sys/sys_dashboard.html', 'HTML', '仪表盘配置界面', '仪表盘配置', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10171', 'sys/sys_dashboard/query', 'SERVICE', '查询仪表盘', '查询仪表盘', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10172', 'sys/sys_dashboard/submit', 'SERVICE', '更新仪表盘', '更新仪表盘', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10173', 'sys/sys_dashboard/remove', 'SERVICE', '删除仪表盘', '删除仪表盘', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10174', 'dashboard/task.html', 'SERVICE', '代办事项', '代办事项', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10175', 'sys/sys_jvm_metrics.html', 'HTML', '系统JVM指标', '系统JVM指标', 'Y', 'N', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10176', 'mail/message_status.html', 'HTML', '邮件状态查询', '邮件状态查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10177', 'intergration/sys_interface_invoke.html', 'HTML', '接口调用记录', '接口调用记录', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10178', 'intergration/sys_interface_header.html', 'HTML', '接口定义界面', '接口定义界面', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10179', 'intergration/sys_interface_header_edit.html', 'HTML', '接口系统信息', '接口系统信息', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10180', 'intergration/sys_interface_line_edit.html', 'HTML', '接口修改页面', '接口修改页面', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10181', 'sys/sys_detail_metrics.html', 'HTML', '系统指标详情页', '系统指标详情页', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10182', 'sys/message/query', 'SERVICE', '邮件状态查询', '邮件状态查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10183', 'message/error_mess', 'SERVICE', '邮件错误信息查询', '邮件错误信息查询', 'Y', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10184', 'kendogrid.html', 'HTML', '电影测试页面', null, 'N', 'N', '1', '-1', '-1', '10001', '2017-01-13 11:25:24', '10001', '2017-01-13 11:25:24', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10185', 'film/selectAllList', 'SERVICE', '查询所有电影', null, 'N', 'N', '3', '-1', '-1', '10001', '2017-01-13 12:10:52', '10001', '2017-01-13 12:11:54', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_b` VALUES ('10186', 'order/getAll', 'SERVICE', '获得所有的订单', null, 'N', 'N', '2', '-1', '-1', '10001', '2017-01-13 17:43:07', '10001', '2017-01-13 17:43:23', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_resource_item_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_item_b`;
CREATE TABLE `sys_resource_item_b` (
  `RESOURCE_ITEM_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OWNER_RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '功能资源ID',
  `TARGET_RESOURCE_ID` bigint(20) DEFAULT NULL COMMENT '目标资源ID',
  `ITEM_ID` varchar(50) DEFAULT NULL COMMENT 'HTML中控件ID',
  `ITEM_NAME` varchar(50) DEFAULT NULL COMMENT '控件名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `ITEM_TYPE` varchar(10) DEFAULT NULL COMMENT '控件类型',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ITEM_ID`),
  UNIQUE KEY `SYS_RESOURCE_ITEM_B_U1` (`ITEM_ID`,`OWNER_RESOURCE_ID`),
  KEY `SYS_RESOURCE_ITEM_B_N1` (`OWNER_RESOURCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_item_b
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource_item_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_item_tl`;
CREATE TABLE `sys_resource_item_tl` (
  `RESOURCE_ITEM_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `ITEM_NAME` varchar(150) DEFAULT NULL COMMENT '控件名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ITEM_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_item_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_resource_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource_tl`;
CREATE TABLE `sys_resource_tl` (
  `RESOURCE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL COMMENT '资源名称',
  `DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource_tl
-- ----------------------------
INSERT INTO `sys_resource_tl` VALUES ('10001', 'en_GB', '403', '403', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10001', 'zh_CN', '403', '403', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10002', 'en_GB', '404', '404', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10002', 'zh_CN', '404', '404', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10003', 'en_GB', '500', '500', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10003', 'zh_CN', '500', '500', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10004', 'en_GB', 'Process Design', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10004', 'zh_CN', '流程设计', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10005', 'en_GB', 'My Tasks', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10005', 'zh_CN', '我的代办', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10006', 'en_GB', 'Deployments', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10006', 'zh_CN', '部署管理', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10007', 'en_GB', 'Process History', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10007', 'zh_CN', '流程历史', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10008', 'en_GB', 'Process Test', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10008', 'zh_CN', '流程测试', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10009', 'en_GB', 'Tasks (ADMIN)', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10009', 'zh_CN', '代办事项(管理员)', null, '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10010', 'en_GB', 'Home', 'Home', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10010', 'zh_CN', '首页', '首页', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10011', 'en_GB', 'Employee', 'Employee', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10011', 'zh_CN', '员工', '员工', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10012', 'en_GB', 'Query Employee', 'Query Employee', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10012', 'zh_CN', '员工查询', '员工查询', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10013', 'en_GB', 'Update Employee', 'Update Employee', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10013', 'zh_CN', '员工更新', '员工更新', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10014', 'en_GB', 'Position', 'Unit Position', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10014', 'zh_CN', '岗位', '部门岗位', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10015', 'en_GB', 'Query Position', 'Query Position', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10015', 'zh_CN', '岗位查询', '岗位查询', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10016', 'en_GB', 'Remove Position', 'Remove Position', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10016', 'zh_CN', '删除岗位', '删除岗位', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10017', 'en_GB', 'Modify Position', 'Modify Position', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10017', 'zh_CN', '岗位修改', '岗位修改', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10018', 'en_GB', 'unit', 'unit', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10018', 'zh_CN', '组织', '组织部门', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10019', 'en_GB', 'query unit', 'query unit', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10019', 'zh_CN', '部门查询', '部门查询', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10020', 'en_GB', 'remove unit', 'remove unit', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10020', 'zh_CN', '删除部门', '删除部门', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10021', 'en_GB', 'submit unit change', 'submit unit change', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10021', 'zh_CN', '部门修改', '部门修改', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10022', 'en_GB', 'Index', 'Index', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10022', 'zh_CN', '首页', '首页', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10023', 'en_GB', 'Job Details', 'Job Details', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10023', 'zh_CN', '任务明细', '任务明细', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10024', 'en_GB', 'Add Cron Job', 'Add Cron Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10024', 'zh_CN', '新建 CRON 任务', '新建CRON 任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10025', 'en_GB', 'Add Simple Job', 'Add Simple Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10025', 'zh_CN', '新建简单任务', '新建简单任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10026', 'en_GB', 'Job Detail Info', 'Job Detail Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10026', 'zh_CN', '任务详细', '任务详细', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10027', 'en_GB', 'Create Job', 'Create Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10027', 'zh_CN', '新建任务', '新建任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10028', 'en_GB', 'Delete Job', 'Delete Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10028', 'zh_CN', '删除任务', '删除任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10029', 'en_GB', 'Pause Job', 'Pause Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10029', 'zh_CN', '暂停任务', '暂停任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10030', 'en_GB', 'Query Job', 'Query Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10030', 'zh_CN', '查询任务', '查询任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10031', 'en_GB', 'Query Job Info', 'Query Job Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10031', 'zh_CN', '查询任务列表', '查询任务列表', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10032', 'en_GB', 'Resume Job', 'Resume Job', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10032', 'zh_CN', '恢复任务', '恢复任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10033', 'en_GB', 'Execution Summary', 'Execution Summary', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10033', 'zh_CN', '执行记录', '执行记录', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10034', 'en_GB', 'Query Job Log', 'Query Job Log', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10034', 'zh_CN', '查询任务日志', '查询任务日志', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10035', 'en_GB', 'Scheduler', 'Scheduler', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10035', 'zh_CN', '调度器', '调度器', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10036', 'en_GB', 'Scheduler Info', 'Scheduler Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10036', 'zh_CN', '调度器信息', '调度器信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10037', 'en_GB', 'Pause All Jobs', 'Pause All Jobs', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10037', 'zh_CN', '暂停所有任务', '暂停所有任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10038', 'en_GB', 'Query Scheduler', 'Query Schedulers', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10038', 'zh_CN', '查询调度器', '查询调度器', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10039', 'en_GB', 'Resume All Jobs', 'Resume All Jobs', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10039', 'zh_CN', '恢复所有任务', '恢复所有任务', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10040', 'en_GB', 'Standby Scheduler', 'Standby Scheduler', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10040', 'zh_CN', '暂停调度器', '暂停调度器', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10041', 'en_GB', 'Start Scheduler', 'Start Scheduler', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10041', 'zh_CN', '启动调度器', '启动调度器', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10042', 'en_GB', 'Login', 'Login', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10042', 'zh_CN', '登录', '登录', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10043', 'en_GB', 'Role Select', 'Role Select', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10043', 'zh_CN', '角色选择', '角色选择', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10044', 'en_GB', 'Category Edit', 'Category Edit', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10044', 'zh_CN', '目录编辑', '目录编辑', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10045', 'en_GB', 'Category', 'Category', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10045', 'zh_CN', '目录管理', '目录管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10046', 'en_GB', 'Query Category', 'Query Category', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10046', 'zh_CN', '查询目录', '查询目录', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10047', 'en_GB', 'Delete Category', 'Delete Category', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10047', 'zh_CN', '删除目录', '删除目录', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10048', 'en_GB', 'Update Category', 'Update Category', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10048', 'zh_CN', '更新目录', '更新目录', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10049', 'en_GB', 'Files', 'Files', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10049', 'zh_CN', '文件管理', '文件管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10050', 'en_GB', 'Query Category Tree', 'Query Category Tree', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10050', 'zh_CN', '查询目录树', '查询目录树', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10051', 'en_GB', 'Query Files', 'Query Files', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10051', 'zh_CN', '查询文件', '查询目录', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10052', 'en_GB', 'Delete File', 'Delete Files', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10052', 'zh_CN', '删除附件', '删除附件', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10053', 'en_GB', 'Attachment Detail', 'Attachment Detail', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10053', 'zh_CN', '查看附件内容', '查看附件内容', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10054', 'en_GB', 'View Attachment', 'View Attachment', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10054', 'zh_CN', '查看附件', '查看附件', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10055', 'en_GB', 'Delete Attachment', 'Delete Attachment', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10055', 'zh_CN', '删除附件', '删除附件', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10056', 'en_GB', 'Query Category Files', 'Query Category Files', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10056', 'zh_CN', '查询目录文件', '查询目录文件', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10057', 'en_GB', 'Attachment List', 'Attachment List', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10057', 'zh_CN', '附件列表', '附件列表', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10058', 'en_GB', 'Upload Test', 'Upload Test', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10058', 'zh_CN', '上传测试', '上传测试', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10059', 'en_GB', 'Attachment Upload', 'Attachment Upload', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10059', 'zh_CN', '附件上传', '附件上传', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10060', 'en_GB', 'Query Code', 'Query Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10060', 'zh_CN', '查询快码', '查询快码', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10061', 'en_GB', 'Delete Code', 'Delete Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10061', 'zh_CN', '删除快码', '删除快码', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10062', 'en_GB', 'Update Code', 'Update Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10062', 'zh_CN', '更新快码', '更新快码', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10063', 'en_GB', 'Query Code Value', 'Query Code Value', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10063', 'zh_CN', '查询快码值', '查询快码值', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10064', 'en_GB', 'Delete Code Value', 'Query Code Value', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10064', 'zh_CN', '删除快码值', '删除快码值', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10065', 'en_GB', 'Function', 'Function', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10065', 'zh_CN', '功能管理', '功能管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10066', 'en_GB', 'Function Resource', 'Function Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10066', 'zh_CN', '功能资源', '功能资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10067', 'en_GB', 'Add Resource', 'Add Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10067', 'zh_CN', '添加资源', '添加资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10068', 'en_GB', 'Fetch Unassigned Resource', 'Fetch Unassigned Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10068', 'zh_CN', '获取未分配资源', '获取未分配资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10069', 'en_GB', 'Fetch Assigned Resource', 'Fetch Assigned Resouce', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10069', 'zh_CN', '获取已分配资源', '获取已分配资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10070', 'en_GB', 'Menus', 'Get Menus', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10070', 'zh_CN', '获取菜单', '获取菜单', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10071', 'en_GB', 'Query Funcitons', 'Query Functions', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10071', 'zh_CN', '查询功能', '查询功能', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10072', 'en_GB', 'Delete Function', 'Delete Functions', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10072', 'zh_CN', '删除功能', '删除功能', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10073', 'en_GB', 'Update Fuction', 'Update Function', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10073', 'zh_CN', '更新功能', '更新功能', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10074', 'en_GB', 'Update Function Resource', 'Update Function Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10074', 'zh_CN', '更新功能资源', '更新功能资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10075', 'en_GB', 'Language', 'Language', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10075', 'zh_CN', '语言维护', '语言维护', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10076', 'en_GB', 'Delete Language', 'Delete Language', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10076', 'zh_CN', '删除语言', '删除语言', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10077', 'en_GB', 'Query Language', 'Query Language', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10077', 'zh_CN', '查询语言', '查询语言', '1', '-1', '-1', '-1', '2017-01-13 11:15:00', '-1', '2017-01-13 11:15:00', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10078', 'en_GB', 'Update Language', 'Update Language', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10078', 'zh_CN', '更新语言', '更新语言', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10079', 'en_GB', 'Load Lov', 'Load Lov', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10079', 'zh_CN', '加载 LOV', '加载 LOV', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10080', 'en_GB', 'Query Lov', 'Query Lov', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10080', 'zh_CN', '查询 LOV', '查询 LOV', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10081', 'en_GB', 'Delete Lov', 'Delete Lov', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10081', 'zh_CN', '删除 LOV', '删除 LOV', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10082', 'en_GB', 'Update Lov', 'Update Lov', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10082', 'zh_CN', '更新 LOV', '更新 LOV', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10083', 'en_GB', 'Query Lov Item', 'Query Lov Item', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10083', 'zh_CN', '查询 LOV 列', '查询 LOV 列', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10084', 'en_GB', 'Delete Lov Item', 'Delete Lov Item', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10084', 'zh_CN', '删除 LOV 列', '删除 LOV 列', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10085', 'en_GB', 'Email Account', 'Email Account', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10085', 'zh_CN', '邮件账户', '邮件账户', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10086', 'en_GB', 'Edit Email Config', 'Edit Email Config', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10086', 'zh_CN', '编辑邮件配置', '编辑邮件配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10087', 'en_GB', 'Query Email Account', 'Query Email Acount', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10087', 'zh_CN', '查询邮件账户', '查询邮件账户', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10088', 'en_GB', 'Delete Email Account', 'Delete Email Account', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10088', 'zh_CN', '删除邮件账户', '删除邮件账户', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10089', 'en_GB', 'Load Email Config', 'Load Email Config', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10089', 'zh_CN', '加载邮件配置', '加载邮件配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10090', 'en_GB', 'Query Email Config', 'Query Email Config', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10090', 'zh_CN', '查询邮件配置', '查询邮件配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10091', 'en_GB', 'Query Config Count', 'Query Config Count', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10091', 'zh_CN', '查询邮件配置数量', '查询配置数量', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10092', 'en_GB', 'Delete Email Config', 'Delete Email Config', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10092', 'zh_CN', '删除邮件配置', '删除邮件配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10093', 'en_GB', 'Update Email Config', 'Update Email Config', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10093', 'zh_CN', '更新邮件配置', '更新邮件配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10094', 'en_GB', 'Query White List', 'Query Email White List', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10094', 'zh_CN', '查询邮件白名单', '查询邮件白名单', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10095', 'en_GB', 'Delete White List', 'Delete White List', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10095', 'zh_CN', '删除邮件白名单', '删除邮件白名单', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10096', 'en_GB', 'Email Template', 'Email Template', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10096', 'zh_CN', '邮件模板', '邮件模板', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10097', 'en_GB', 'Edit Template', 'Edit Template', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10097', 'zh_CN', '编辑模板', '编辑模板', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10098', 'en_GB', 'Add Template', 'Add Template', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10098', 'zh_CN', '新建模板', '新建模板', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10099', 'en_GB', 'Query Template', 'Query Template', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10099', 'zh_CN', '查询模板', '查询模板', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10100', 'en_GB', 'Delete Template', 'Delete Template', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10100', 'zh_CN', '删除模板', '删除模板', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10101', 'en_GB', 'Update Tempate', 'Update Template', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10101', 'zh_CN', '更新模板', '更新模板', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10102', 'en_GB', 'Email Test', 'Email Test', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10102', 'zh_CN', '邮件测试', '邮件测试', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10103', 'en_GB', 'Email Send Test', 'Email Send Test', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10103', 'zh_CN', '邮件发送测试', '邮件发送测试', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10104', 'en_GB', 'Query Preference', 'Query Preference', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10104', 'zh_CN', '查询首选项', '查询首选项', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10105', 'en_GB', 'Save Preference', 'Save Preference', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10105', 'zh_CN', '保存首选项', '保存首选项', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10106', 'en_GB', 'Query Profile', 'Query Profile', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10106', 'zh_CN', '查询配置', '查询配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10107', 'en_GB', 'Delete Profile', 'Delete Profile', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10107', 'zh_CN', '删除配置', '删除配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10108', 'en_GB', 'Update Profile', 'Update Profile', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10108', 'zh_CN', '更新配置', '更新配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10109', 'en_GB', 'Query Profile Value', 'Query Profile Value', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10109', 'zh_CN', '查询配置值', '查询配置值', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10110', 'en_GB', 'Query Profile Level Value', 'Query Profile Level Value', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10110', 'zh_CN', '查询指定级别的配置值', '查询指定级别的配置值', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10111', 'en_GB', 'Delete Profile Value', 'Delete Profile Value', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10111', 'zh_CN', '删除配置值', '删除配置值', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10112', 'en_GB', 'Query Prompt', 'Query Prompt', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10112', 'zh_CN', '查询描述', '查询描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10113', 'en_GB', 'Delete Prompt', 'Delete Prompt', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10113', 'zh_CN', '删除描述', '删除描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10114', 'en_GB', 'Update Prompt', 'Update Prompt', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10114', 'zh_CN', '更改描述', '更改描述', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10115', 'en_GB', 'Resource', 'Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10115', 'zh_CN', '资源注册', '资源注册', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10116', 'en_GB', 'Resource Item', 'Resource Item', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10116', 'zh_CN', '资源组件', '资源组件', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10117', 'en_GB', 'Role Resource Item', 'Role Resource Item', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10117', 'zh_CN', '分配资源组件', '分配资源组件', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10118', 'en_GB', 'Query Resource', 'Query Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10118', 'zh_CN', '查询资源', '查询资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10119', 'en_GB', 'Delete Resource', 'Delete Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10119', 'zh_CN', '删除资源', '删除资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10120', 'en_GB', 'Update Resource', 'Update Resource', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10120', 'zh_CN', '更新资源', '更新资源', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10121', 'en_GB', 'Query Resource Item', 'Query Resource Item', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10121', 'zh_CN', '查询资源组件', '查询资源组件', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10122', 'en_GB', 'Delete Resource Item', 'Delete Resource Item', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10122', 'zh_CN', '删除资源组件', '删除资源组件', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10123', 'en_GB', 'Update Resoruce Item', 'Update Resource Item', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10123', 'zh_CN', '更新资源组件', '更新资源组件', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10124', 'en_GB', 'Select Role', 'Select role not present', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10124', 'zh_CN', '选择非当前角色', '选择非当前角色', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10125', 'en_GB', 'Function Assign', 'Function Assign', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10125', 'zh_CN', '功能分配', '功能分配', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10126', 'en_GB', 'Query Role Function', 'Query Role Function', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10126', 'zh_CN', '查询角色功能', '查询角色功能', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10127', 'en_GB', 'Query Function Resource Item', 'Query Function Resource Items', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10127', 'zh_CN', '查询功能资源组件', '查询功能资源组件', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10128', 'en_GB', 'Update Role Function', 'Update Role Function', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10128', 'zh_CN', '更新角色功能', '更新角色功能', '1', '-1', '-1', '-1', '2017-01-13 11:15:01', '-1', '2017-01-13 11:15:01', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10129', 'en_GB', 'Update Function Resource Items', 'Update Function Resource Items', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10129', 'zh_CN', '更新功能资源组件', '更新资源组件', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10130', 'en_GB', 'Code', 'Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10130', 'zh_CN', '代码维护', '代码维护', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10131', 'en_GB', 'Edit Code', 'Edit Code', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10131', 'zh_CN', '编辑快码', '编辑快码', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10132', 'en_GB', 'System Config', 'System Config', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10132', 'zh_CN', '系统配置', '系统配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10133', 'en_GB', 'LOV', 'LOV', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10133', 'zh_CN', 'LOV维护', 'LOV维护', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10134', 'en_GB', 'Edit Lov', 'Edit Lov', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10134', 'zh_CN', '编辑 LOV', '编辑 LOV', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10135', 'en_GB', 'Lov Preview', 'Lov Preview', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10135', 'zh_CN', 'LOV 预览', 'LOV 预览', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10136', 'en_GB', 'MultiLanguage Editor', 'MultiLangauge Editor', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10136', 'zh_CN', '多语言编辑器', '多语言编辑器', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10137', 'en_GB', 'Profile', 'Profile', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10137', 'zh_CN', '配置维护', '配置维护', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10138', 'en_GB', 'Edit Profile', 'Edit Profile', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10138', 'zh_CN', '编辑配置文件', '编辑配置文件', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10139', 'en_GB', 'Prompt', 'Prompt', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10139', 'zh_CN', '描述维护', '描述维护', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10140', 'en_GB', 'Role', 'Role', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10140', 'zh_CN', '角色管理', '角色管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10141', 'en_GB', 'Delete Role', 'Delete Role', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10141', 'zh_CN', '角色删除', '角色删除', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10142', 'en_GB', 'Query Role', 'Query Role', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10142', 'zh_CN', '角色查询', '角色查询', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10143', 'en_GB', 'Update Role', 'Update Role', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10143', 'zh_CN', '角色更新', '角色更新', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10144', 'en_GB', 'User', 'User', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10144', 'zh_CN', '用户管理', '用户管理', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10145', 'en_GB', 'Role Assign', 'Role Assign', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10145', 'zh_CN', '角色分配', '角色分配', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10146', 'en_GB', 'Select Role', 'Role Select', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10146', 'zh_CN', '选择角色', '选择角色', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10147', 'en_GB', 'Query User', 'Query User', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10147', 'zh_CN', '用户查询', '用户查询', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10148', 'en_GB', 'Delete User', 'Delete User', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10148', 'zh_CN', '删除用户', '删除用户', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10149', 'en_GB', 'Update User', 'Update User', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10149', 'zh_CN', '更新用户', '更新用户', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10150', 'en_GB', 'Query User Role', 'Query User Role', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10150', 'zh_CN', '查询用户角色', '查询用户角色', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10151', 'en_GB', 'Update User Role', 'Update User Role', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10151', 'zh_CN', '保存用户角色', '保存用户角色', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10152', 'en_GB', 'Single User Info', 'Single User Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10152', 'zh_CN', '单条用户信息', '单条用户信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10153', 'en_GB', 'User email Check', 'User Email Check', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10153', 'zh_CN', '用户邮件检查', '用户邮件检查', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10154', 'en_GB', 'User Phone Check', 'User Phone Check', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10154', 'zh_CN', '电话号码检查', '电话号码检查', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10155', 'en_GB', 'User Exists check', 'User Exists check', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10155', 'zh_CN', '用户是否存在', '用户是否存在', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10156', 'en_GB', 'Query User Info', 'Query User Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10156', 'zh_CN', '用户信息查询', '用户信息查询', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10157', 'en_GB', 'Login Success', 'Login Success', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10157', 'zh_CN', '登录成功', '登录成功', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10158', 'en_GB', 'Update Password', 'Update Password', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10158', 'zh_CN', '更改密码', '更改密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10159', 'en_GB', 'User Info', 'User Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10159', 'zh_CN', '用户信息', '用户信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10160', 'en_GB', 'Update Password', 'Update Password', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10160', 'zh_CN', '更改密码', '更改密码', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10161', 'en_GB', 'Update User Info', 'Update User Info', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10161', 'zh_CN', '更新个人信息', '更新个人信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10162', 'en_GB', 'Icon Select', 'Icon Select', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10162', 'zh_CN', '图标选择', '图标选择', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10163', 'en_GB', 'Timeout', 'Timeout', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10163', 'zh_CN', '超时', '超时', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10164', 'en_GB', 'Captcha Service', 'Captcha Service', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10164', 'zh_CN', '验证码服务', '验证码服务', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10165', 'en_GB', 'company', 'company', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10165', 'zh_CN', '公司维护', '公司信息维护', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10166', 'en_GB', 'company info update', 'company info update', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10166', 'zh_CN', '公司信息修改', '公司信息修改', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10167', 'en_GB', 'company info query', 'company info query', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10167', 'zh_CN', '公司信息查询', '公司信息查询', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10168', 'en_GB', 'company info delete', 'company info delete', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10168', 'zh_CN', '公司信息删除', '公司信息删除', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10169', 'en_GB', 'company edit page', 'company edit page', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10169', 'zh_CN', '公司编辑界面', '公司编辑界面', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10170', 'en_GB', 'Dashboard Config Page', 'Dashboard Config Page', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10170', 'zh_CN', '仪表盘配置界面', '仪表盘配置', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10171', 'en_GB', 'Query dashboard info', 'Query dashboard info', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10171', 'zh_CN', '查询仪表盘', '查询仪表盘', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10172', 'en_GB', 'Update dashboard info', 'Update dashboard info', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10172', 'zh_CN', '更新仪表盘', '更新仪表盘', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10173', 'en_GB', 'Delete dashboard info', 'Delete dashboard info', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10173', 'zh_CN', '删除仪表盘', '删除仪表盘', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10174', 'en_GB', 'User Task', 'User Task', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10174', 'zh_CN', '代办事项', '代办事项', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10175', 'en_GB', 'system JVM metrics', 'system JVM metrics', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10175', 'zh_CN', '系统JVM指标', '系统JVM指标', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10176', 'en_GB', 'mail status search', 'mail status search', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10176', 'zh_CN', '邮件状态查询', '邮件状态查询', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10177', 'en_GB', 'Interface invoke records', 'Interface invoke records', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10177', 'zh_CN', '接口调用记录', '接口调用记录', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10178', 'en_GB', 'The interface definition interface', 'The interface definition interface', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10178', 'zh_CN', '接口定义界面', '接口定义界面', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10179', 'en_GB', 'Interface system information', 'Interface system information', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10179', 'zh_CN', '接口系统信息', '接口系统信息', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10180', 'en_GB', 'Interface to modify the page', 'Interface to modify the page', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10180', 'zh_CN', '接口修改页面', '接口修改页面', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10181', 'en_GB', 'System index page for details', 'System index page for details', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10181', 'zh_CN', '系统指标详情页', '系统指标详情页', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10182', 'en_GB', 'Email Status', 'Email Status', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10182', 'zh_CN', '邮件状态查询', '邮件状态查询', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10183', 'en_GB', 'Email Error', 'Email Error', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10183', 'zh_CN', '邮件错误信息查询', '邮件错误信息查询', '1', '-1', '-1', '-1', '2017-01-13 11:15:02', '-1', '2017-01-13 11:15:02', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10184', 'en_GB', '电影测试页面', null, '1', '-1', '-1', '10001', '2017-01-13 11:25:23', '10001', '2017-01-13 11:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10184', 'zh_CN', '电影测试页面', null, '1', '-1', '-1', '10001', '2017-01-13 11:25:23', '10001', '2017-01-13 11:25:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10185', 'en_GB', '查询所有电影', null, '1', '-1', '-1', '10001', '2017-01-13 12:10:51', '10001', '2017-01-13 12:10:51', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10185', 'zh_CN', '查询所有电影', null, '1', '-1', '-1', '10001', '2017-01-13 12:10:51', '10001', '2017-01-13 12:11:54', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10186', 'en_GB', '获得所有的订单', null, '1', '-1', '-1', '10001', '2017-01-13 17:43:06', '10001', '2017-01-13 17:43:06', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_resource_tl` VALUES ('10186', 'zh_CN', '获得所有的订单', null, '1', '-1', '-1', '10001', '2017-01-13 17:43:06', '10001', '2017-01-13 17:43:23', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_b`;
CREATE TABLE `sys_role_b` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_CODE` varchar(40) NOT NULL COMMENT '角色编码',
  `ROLE_NAME` varchar(150) NOT NULL COMMENT '角色名称',
  `ROLE_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
  `START_ACTIVE_DATE` date DEFAULT NULL COMMENT '开始生效日期',
  `END_ACTIVE_DATE` date DEFAULT NULL COMMENT '截至生效日期',
  `ENABLE_FLAG` varchar(1) DEFAULT 'Y' COMMENT '启用标记',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `SYS_ROLE_B_U1` (`ROLE_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_b
-- ----------------------------
INSERT INTO `sys_role_b` VALUES ('10001', 'ADMIN', '管理员', '系统管理员', '2016-06-15', null, 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_b` VALUES ('10002', 'EMPLOYEE', '员工', '员工', null, '2020-12-31', 'Y', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_function
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_function`;
CREATE TABLE `sys_role_function` (
  `SRF_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '功能ID',
  `FUNCTION_ID` bigint(20) DEFAULT NULL COMMENT '功能ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`SRF_ID`),
  UNIQUE KEY `SYS_ROLE_FUNCTION_U1` (`ROLE_ID`,`FUNCTION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10195 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_function
-- ----------------------------
INSERT INTO `sys_role_function` VALUES ('10038', '10002', '10003', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10039', '10002', '10022', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10040', '10002', '10023', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10041', '10002', '10024', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10042', '10002', '10025', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10043', '10002', '10015', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10044', '10002', '10016', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10045', '10002', '10017', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10046', '10002', '10004', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10047', '10002', '10006', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10048', '10002', '10002', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10049', '10002', '10027', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10050', '10002', '10029', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10051', '10002', '10031', '1', '-1', '-1', '-1', '2017-01-13 11:15:04', '-1', '2017-01-13 11:15:04', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10149', '10001', '10044', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10150', '10001', '10045', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10151', '10001', '10047', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10152', '10001', '10033', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10153', '10001', '10034', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10154', '10001', '10036', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10155', '10001', '10035', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10156', '10001', '10037', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10157', '10001', '10018', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10158', '10001', '10021', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10159', '10001', '10019', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10160', '10001', '10020', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10161', '10001', '10026', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10162', '10001', '10031', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10163', '10001', '10027', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10164', '10001', '10028', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10165', '10001', '10029', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10166', '10001', '10030', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10167', '10001', '10032', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10168', '10001', '10015', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10169', '10001', '10016', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10170', '10001', '10017', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10171', '10001', '10040', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10172', '10001', '10041', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10173', '10001', '10042', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10174', '10001', '10001', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10175', '10001', '10007', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10176', '10001', '10008', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10177', '10001', '10009', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10178', '10001', '10010', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10179', '10001', '10043', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10180', '10001', '10011', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10181', '10001', '10012', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10182', '10001', '10013', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10183', '10001', '10014', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10184', '10001', '10038', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10185', '10001', '10002', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10186', '10001', '10003', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10187', '10001', '10004', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10188', '10001', '10006', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10189', '10001', '10005', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10190', '10001', '10022', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10191', '10001', '10023', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10192', '10001', '10024', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10193', '10001', '10025', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_function` VALUES ('10194', '10001', '10039', '1', '-1', '-1', '10001', '2017-01-13 11:37:28', '10001', '2017-01-13 11:37:28', '10001', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_role_resource_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource_item`;
CREATE TABLE `sys_role_resource_item` (
  `RSI_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `RESOURCE_ITEM_ID` bigint(20) DEFAULT NULL COMMENT '功能控件ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`RSI_ID`),
  UNIQUE KEY `SYS_ROLE_RESOURCE_ITEM_U1` (`ROLE_ID`,`RESOURCE_ITEM_ID`),
  KEY `SYS_ROLE_RESOURCE_ITEM_N1` (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_resource_item
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_tl`;
CREATE TABLE `sys_role_tl` (
  `ROLE_ID` bigint(20) NOT NULL,
  `LANG` varchar(10) NOT NULL,
  `ROLE_NAME` varchar(150) DEFAULT NULL COMMENT '角色名称',
  `ROLE_DESCRIPTION` varchar(240) DEFAULT NULL COMMENT '角色描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_tl
-- ----------------------------
INSERT INTO `sys_role_tl` VALUES ('10001', 'en_GB', 'ADMIN', 'Administrator', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_tl` VALUES ('10001', 'zh_CN', '管理员', '系统管理员', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_tl` VALUES ('10002', 'en_GB', 'Employee', 'Employee', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_role_tl` VALUES ('10002', 'zh_CN', '员工', '员工', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_TYPE` varchar(30) DEFAULT NULL COMMENT '用户类型',
  `USER_NAME` varchar(40) NOT NULL COMMENT '用户名',
  `PASSWORD_ENCRYPTED` varchar(80) DEFAULT NULL COMMENT '加密过的密码',
  `EMAIL` varchar(150) DEFAULT NULL COMMENT '邮箱地址',
  `PHONE` varchar(40) DEFAULT NULL COMMENT '电话号码',
  `START_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期从',
  `END_ACTIVE_DATE` datetime DEFAULT NULL COMMENT '有效期至',
  `STATUS` varchar(30) DEFAULT NULL COMMENT '状态',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  `LAST_LOGIN_DATE` datetime DEFAULT NULL COMMENT '最后一次登录时间',
  `LAST_PASSWORD_UPDATE_DATE` datetime DEFAULT NULL COMMENT '最后一次修改密码时间',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `SYS_USER_U1` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('10001', null, 'ADMIN', '59baed859597b69548f28654af4125736915ea870252f8db664e3187dcfc298ead2b761e2acb576a', 'hap_dev@126.com', '13763784776', '2016-01-01 00:00:00', null, 'ACTV', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('10002', null, 'JESSEN', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'shengyang.zhou@hand-china.com', '13764784776', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('10003', null, 'HAILEN', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'hailen.hap@126.com', '186', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('10004', null, 'ERIC', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'eric.hap@126.com', '1893', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('10005', null, 'TONY', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'tony.hap@126.com', '1891', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('10006', null, 'RODGERS', '6c3f2b4ef2a4ef2783bfc3a9cd5436c34ac9984fb00ba0586faf962908c272f641d2f2d4e5bb63e2', 'Rodgers.hap@126.com', '1892', null, null, 'ACTV', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_user_dashboard
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_dashboard`;
CREATE TABLE `sys_user_dashboard` (
  `USER_DASHBOARD_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `DASHBOARD_ID` bigint(20) NOT NULL COMMENT '仪表盘ID',
  `DASHBOARD_SEQUENCE` decimal(20,0) DEFAULT '1' COMMENT '仪表盘排序号',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_DASHBOARD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_dashboard
-- ----------------------------
INSERT INTO `sys_user_dashboard` VALUES ('10001', '10001', '10001', '1', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_user_dashboard` VALUES ('10002', '10001', '10002', '2', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');
INSERT INTO `sys_user_dashboard` VALUES ('10003', '10001', '10003', '3', '1', '-1', '-1', '-1', '2017-01-13 11:15:07', '-1', '2017-01-13 11:15:07', '-1');

-- ----------------------------
-- Table structure for sys_user_demo_b
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_demo_b`;
CREATE TABLE `sys_user_demo_b` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_CODE` varchar(255) NOT NULL COMMENT '编码',
  `USER_NAME` varchar(255) NOT NULL COMMENT '姓名',
  `USER_AGE` bigint(20) DEFAULT NULL COMMENT '年龄',
  `USER_SEX` varchar(50) DEFAULT NULL COMMENT '性别',
  `USER_BIRTH` date DEFAULT NULL COMMENT '生日',
  `USER_EMAIL` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `USER_PHONE` bigint(20) DEFAULT NULL COMMENT '电话',
  `ENABLE_FLAG` varchar(1) DEFAULT NULL COMMENT '是否启用',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `ROLE_NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `START_ACTIVE_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_ACTIVE_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `SYS_USER_DEMO_B_U1` (`USER_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_demo_b
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_demo_tl
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_demo_tl`;
CREATE TABLE `sys_user_demo_tl` (
  `USER_ID` bigint(20) NOT NULL,
  `LANG` varchar(50) NOT NULL,
  `USER_NAME` varchar(255) DEFAULT NULL COMMENT '姓名',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`USER_ID`,`LANG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_demo_tl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login`;
CREATE TABLE `sys_user_login` (
  `login_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(40) DEFAULT NULL COMMENT 'ip地址',
  `referer` varchar(240) DEFAULT NULL,
  `user_agent` varchar(240) DEFAULT NULL,
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_login
-- ----------------------------
INSERT INTO `sys_user_login` VALUES ('10001', '10001', '2017-01-14 09:05:46', '192.168.195.1', 'http://localhost:8088/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '1', '-1', '-1', '-1', '2017-01-14 09:05:45', '-1', '2017-01-14 09:05:45', '-1');
INSERT INTO `sys_user_login` VALUES ('10002', '10001', '2017-01-14 17:23:00', '192.168.195.1', 'http://localhost:8088/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586', '1', '-1', '-1', '-1', '2017-01-14 17:22:59', '-1', '2017-01-14 17:22:59', '-1');
INSERT INTO `sys_user_login` VALUES ('10003', '10001', '2017-01-15 10:38:26', '192.168.0.103', 'http://localhost:8088/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '1', '-1', '-1', '-1', '2017-01-15 10:38:25', '-1', '2017-01-15 10:38:25', '-1');
INSERT INTO `sys_user_login` VALUES ('10004', '10001', '2017-01-15 17:27:22', '192.168.195.1', 'http://localhost:8088/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '1', '-1', '-1', '-1', '2017-01-15 17:27:22', '-1', '2017-01-15 17:27:22', '-1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `SUR_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `OBJECT_VERSION_NUMBER` bigint(20) DEFAULT '1',
  `REQUEST_ID` bigint(20) DEFAULT '-1',
  `PROGRAM_ID` bigint(20) DEFAULT '-1',
  `CREATED_BY` bigint(20) DEFAULT '-1',
  `CREATION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATED_BY` bigint(20) DEFAULT '-1',
  `LAST_UPDATE_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_UPDATE_LOGIN` bigint(20) DEFAULT '-1',
  `ATTRIBUTE_CATEGORY` varchar(30) DEFAULT NULL,
  `ATTRIBUTE1` varchar(240) DEFAULT NULL,
  `ATTRIBUTE2` varchar(240) DEFAULT NULL,
  `ATTRIBUTE3` varchar(240) DEFAULT NULL,
  `ATTRIBUTE4` varchar(240) DEFAULT NULL,
  `ATTRIBUTE5` varchar(240) DEFAULT NULL,
  `ATTRIBUTE6` varchar(240) DEFAULT NULL,
  `ATTRIBUTE7` varchar(240) DEFAULT NULL,
  `ATTRIBUTE8` varchar(240) DEFAULT NULL,
  `ATTRIBUTE9` varchar(240) DEFAULT NULL,
  `ATTRIBUTE10` varchar(240) DEFAULT NULL,
  `ATTRIBUTE11` varchar(240) DEFAULT NULL,
  `ATTRIBUTE12` varchar(240) DEFAULT NULL,
  `ATTRIBUTE13` varchar(240) DEFAULT NULL,
  `ATTRIBUTE14` varchar(240) DEFAULT NULL,
  `ATTRIBUTE15` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`SUR_ID`),
  UNIQUE KEY `SYS_USER_ROLE_U1` (`ROLE_ID`,`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('10001', '10001', '10001', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10002', '10001', '10002', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10003', '10002', '10002', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10004', '10003', '10002', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10005', '10004', '10002', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10006', '10005', '10002', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user_role` VALUES ('10007', '10006', '10002', '1', '-1', '-1', '-1', '2017-01-13 11:14:59', '-1', '2017-01-13 11:14:59', '-1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
DROP TRIGGER IF EXISTS `ins_film`;
DELIMITER ;;
CREATE TRIGGER `ins_film` AFTER INSERT ON `hap_film` FOR EACH ROW BEGIN
    INSERT INTO film_text (film_id, title, description)
        VALUES (new.film_id, new.title, new.description);
  END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `upd_film`;
DELIMITER ;;
CREATE TRIGGER `upd_film` AFTER UPDATE ON `hap_film` FOR EACH ROW BEGIN
    IF (old.title != new.title) OR (old.description != new.description) OR (old.film_id != new.film_id)
    THEN
        UPDATE film_text
            SET title=new.title,
                description=new.description,
                film_id=new.film_id
        WHERE film_id=old.film_id;
    END IF;
  END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `del_film`;
DELIMITER ;;
CREATE TRIGGER `del_film` AFTER DELETE ON `hap_film` FOR EACH ROW BEGIN
    DELETE FROM film_text WHERE film_id = old.film_id;
  END
;;
DELIMITER ;
