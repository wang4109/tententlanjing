/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : demo

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2019-11-13 16:31:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account_bkuser
-- ----------------------------
DROP TABLE IF EXISTS `account_bkuser`;
CREATE TABLE `account_bkuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chname` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_bkuser
-- ----------------------------
INSERT INTO `account_bkuser` VALUES ('3', '', '2019-10-23 17:07:27', '0', 'swain', '陈耿聪', '', '', '15812865217', '624420781@qq.com', '0', '2019-10-23 17:07:27');
INSERT INTO `account_bkuser` VALUES ('4', '', '2019-10-25 09:46:12', '1', 'admin', '', '', '', '', '', '1', '2019-10-25 09:46:12');

-- ----------------------------
-- Table structure for account_bkuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `account_bkuser_groups`;
CREATE TABLE `account_bkuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bkuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bkuser_id` (`bkuser_id`,`group_id`) USING BTREE,
  KEY `account_bkuser_groups_group_id_62e6d4600781d550_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `account_bkuser_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_bkuser_groups_ibfk_2` FOREIGN KEY (`bkuser_id`) REFERENCES `account_bkuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_bkuser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for account_bkuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `account_bkuser_user_permissions`;
CREATE TABLE `account_bkuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bkuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bkuser_id` (`bkuser_id`,`permission_id`) USING BTREE,
  KEY `account_bkus_permission_id_d5bec30ce864e6d_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `account_bkuser_user_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_bkuser_user_permissions_ibfk_2` FOREIGN KEY (`bkuser_id`) REFERENCES `account_bkuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_bkuser_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for app_control_functioncontroller
-- ----------------------------
DROP TABLE IF EXISTS `app_control_functioncontroller`;
CREATE TABLE `app_control_functioncontroller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `func_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `func_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `create_time` datetime NOT NULL,
  `func_developer` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `func_code` (`func_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_control_functioncontroller
-- ----------------------------
INSERT INTO `app_control_functioncontroller` VALUES ('1', 'func_test', '示例功能', '0', '2019-05-30 19:28:15', null);
INSERT INTO `app_control_functioncontroller` VALUES ('2', 'create_task', '创建任务', '0', '2019-05-30 19:28:15', null);
INSERT INTO `app_control_functioncontroller` VALUES ('3', 'execute_task', '执行任务', '0', '2019-05-30 19:28:15', null);
INSERT INTO `app_control_functioncontroller` VALUES ('4', 'tasks', '任务列表', '0', '2019-05-30 19:28:15', null);
INSERT INTO `app_control_functioncontroller` VALUES ('5', 'task', '任务详情', '0', '2019-05-30 19:28:15', null);
INSERT INTO `app_control_functioncontroller` VALUES ('6', 'pause_task', '任务暂停', '0', '2019-05-30 19:28:15', null);
INSERT INTO `app_control_functioncontroller` VALUES ('7', 'terminate_task', '任务终止', '0', '2019-05-30 19:28:15', null);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add content type', '3', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('8', 'Can change content type', '3', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete content type', '3', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('10', 'Can add session', '4', 'add_session');
INSERT INTO `auth_permission` VALUES ('11', 'Can change session', '4', 'change_session');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete session', '4', 'delete_session');
INSERT INTO `auth_permission` VALUES ('13', 'Can add site', '5', 'add_site');
INSERT INTO `auth_permission` VALUES ('14', 'Can change site', '5', 'change_site');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete site', '5', 'delete_site');
INSERT INTO `auth_permission` VALUES ('16', 'Can add log entry', '6', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('17', 'Can change log entry', '6', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete log entry', '6', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 功能控制器', '7', 'add_functioncontroller');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 功能控制器', '7', 'change_functioncontroller');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 功能控制器', '7', 'delete_functioncontroller');
INSERT INTO `auth_permission` VALUES ('22', 'Can add user', '8', 'add_bkuser');
INSERT INTO `auth_permission` VALUES ('23', 'Can change user', '8', 'change_bkuser');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete user', '8', 'delete_bkuser');
INSERT INTO `auth_permission` VALUES ('25', 'Can add menu', '9', 'add_menu');
INSERT INTO `auth_permission` VALUES ('26', 'Can change menu', '9', 'change_menu');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete menu', '9', 'delete_menu');
INSERT INTO `auth_permission` VALUES ('46', 'Can add task state', '16', 'add_taskmeta');
INSERT INTO `auth_permission` VALUES ('47', 'Can change task state', '16', 'change_taskmeta');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete task state', '16', 'delete_taskmeta');
INSERT INTO `auth_permission` VALUES ('49', 'Can add saved group result', '17', 'add_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('50', 'Can change saved group result', '17', 'change_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete saved group result', '17', 'delete_tasksetmeta');
INSERT INTO `auth_permission` VALUES ('52', 'Can add interval', '18', 'add_intervalschedule');
INSERT INTO `auth_permission` VALUES ('53', 'Can change interval', '18', 'change_intervalschedule');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete interval', '18', 'delete_intervalschedule');
INSERT INTO `auth_permission` VALUES ('55', 'Can add crontab', '19', 'add_crontabschedule');
INSERT INTO `auth_permission` VALUES ('56', 'Can change crontab', '19', 'change_crontabschedule');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete crontab', '19', 'delete_crontabschedule');
INSERT INTO `auth_permission` VALUES ('58', 'Can add periodic tasks', '20', 'add_periodictasks');
INSERT INTO `auth_permission` VALUES ('59', 'Can change periodic tasks', '20', 'change_periodictasks');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete periodic tasks', '20', 'delete_periodictasks');
INSERT INTO `auth_permission` VALUES ('61', 'Can add periodic task', '21', 'add_periodictask');
INSERT INTO `auth_permission` VALUES ('62', 'Can change periodic task', '21', 'change_periodictask');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete periodic task', '21', 'delete_periodictask');
INSERT INTO `auth_permission` VALUES ('64', 'Can add worker', '22', 'add_workerstate');
INSERT INTO `auth_permission` VALUES ('65', 'Can change worker', '22', 'change_workerstate');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete worker', '22', 'delete_workerstate');
INSERT INTO `auth_permission` VALUES ('67', 'Can add task', '23', 'add_taskstate');
INSERT INTO `auth_permission` VALUES ('68', 'Can change task', '23', 'change_taskstate');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete task', '23', 'delete_taskstate');
INSERT INTO `auth_permission` VALUES ('73', 'Can add task templet', '25', 'add_tasktemplet');
INSERT INTO `auth_permission` VALUES ('74', 'Can change task templet', '25', 'change_tasktemplet');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete task templet', '25', 'delete_tasktemplet');
INSERT INTO `auth_permission` VALUES ('76', 'Can add templet type', '26', 'add_templettype');
INSERT INTO `auth_permission` VALUES ('77', 'Can change templet type', '26', 'change_templettype');
INSERT INTO `auth_permission` VALUES ('78', 'Can delete templet type', '26', 'delete_templettype');

-- ----------------------------
-- Table structure for celery_taskmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_taskmeta`;
CREATE TABLE `celery_taskmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `date_done` datetime NOT NULL,
  `traceback` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`) USING BTREE,
  KEY `celery_taskmeta_662f707d` (`hidden`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_taskmeta
-- ----------------------------
INSERT INTO `celery_taskmeta` VALUES ('1', '218c23bd-281f-4b56-bc5a-2f3bf69d7c6b', 'SUCCESS', 'gAJLPC4=', '2019-07-11 15:45:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('2', '7ff16034-48f5-48ce-a62b-a4c7325e44f5', 'SUCCESS', 'gAJLQS4=', '2019-07-11 15:50:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('3', '999ee465-c2ce-40c5-b4fe-0f6786889af5', 'SUCCESS', 'gAJLRC4=', '2019-07-11 15:53:23', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('4', 'e0c31946-b8ed-437f-aaf6-d54394d2d22b', 'SUCCESS', 'gAJLRS4=', '2019-07-11 15:55:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('5', 'cff609db-6f21-4a60-aa4b-dd72c4a84760', 'SUCCESS', 'gAJLRi4=', '2019-07-11 15:55:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('6', 'f592ab3c-467a-4c01-b31b-b9219835e1a3', 'SUCCESS', 'gAJLRi4=', '2019-07-11 15:55:34', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('7', '842ccb47-b5e0-4d97-a681-618d7411cd54', 'SUCCESS', 'gAJLCy4=', '2019-07-11 15:57:24', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('8', 'c3cc0e44-b9f4-46e0-9c90-038f3096c204', 'SUCCESS', 'gAJLSS4=', '2019-07-11 15:58:17', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('9', '9fbf0d40-dff7-4775-abc1-028748e5174d', 'SUCCESS', 'gAJLEC4=', '2019-07-11 16:00:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('10', '3cbe7d49-cebf-4f29-818b-a2c92d5acf67', 'SUCCESS', 'gAJLFS4=', '2019-07-11 16:05:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('11', '4f33a781-20dc-4852-b716-afe10494fe6c', 'SUCCESS', 'gAJLGi4=', '2019-07-11 16:10:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('12', '3df3e88f-b429-4deb-9e8a-82ce01201f28', 'SUCCESS', 'gAJLGy4=', '2019-07-11 16:11:42', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('13', 'c723ff4e-21a0-4f47-b9e8-12a9362ff843', 'SUCCESS', 'gAJLLi4=', '2019-07-11 16:30:16', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('14', '9c401967-e210-4d96-9eae-a6db14850fba', 'SUCCESS', 'gAJLJi4=', '2019-07-11 17:21:32', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('15', '022c5bd9-286b-4272-a79c-f560f8a0c866', 'SUCCESS', 'gAJLFi4=', '2019-07-11 18:04:52', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('16', '232e9aff-190a-4590-8dc8-3d34a507bea3', 'SUCCESS', 'gAJLES4=', '2019-07-15 10:07:31', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('17', '62dbb70a-1a76-4f73-a6a2-993e1b8baa60', 'SUCCESS', 'gAJLEi4=', '2019-07-15 10:08:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('18', 'e184a97f-aada-4af7-a47f-ef5febb19267', 'SUCCESS', 'gAJLEy4=', '2019-07-15 10:09:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('19', 'a2931988-97e9-4c76-885d-2e6e6ce851a7', 'SUCCESS', 'gAJLFC4=', '2019-07-15 10:10:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('20', '3477793e-0804-4e11-bf1a-858d8f1192c0', 'SUCCESS', 'gAJLFS4=', '2019-07-15 10:11:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('21', '96ecd01c-54df-4d6b-b715-c870279ded61', 'SUCCESS', 'gAJLFi4=', '2019-07-15 10:12:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('22', '63154371-66eb-4cb8-b732-e3a0daaf5dd8', 'SUCCESS', 'gAJLFy4=', '2019-07-15 10:13:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('23', 'ec944076-a2ac-48ed-9080-dcf15e4d8e78', 'SUCCESS', 'gAJLGC4=', '2019-07-15 10:14:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('24', '4f6799db-e65f-4770-b45c-edee2ded680f', 'SUCCESS', 'gAJLGS4=', '2019-07-15 10:15:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('25', '13b4ed4f-0811-405c-8952-e9eba0563c6f', 'SUCCESS', 'gAJLGi4=', '2019-07-15 10:16:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('26', '16bf7b79-6085-4fd8-8842-897b41762d61', 'SUCCESS', 'gAJLGy4=', '2019-07-15 10:17:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('27', '98f14f17-d641-47d6-abeb-38480e77510f', 'SUCCESS', 'gAJLHC4=', '2019-07-15 10:18:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('28', 'b6c1db06-4f02-4453-b2da-6efa0d6c1afe', 'SUCCESS', 'gAJLHS4=', '2019-07-15 10:19:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('29', '4e7700d3-d26a-40bd-a9dc-f8911e9535a9', 'SUCCESS', 'gAJLHi4=', '2019-07-15 10:20:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('30', 'cc371cad-7b1e-48a6-b0ec-e164db9b048b', 'SUCCESS', 'gAJLHy4=', '2019-07-15 10:21:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('31', '9afebc7d-9fff-4a43-be8f-4bf8543411cb', 'SUCCESS', 'gAJLIC4=', '2019-07-15 10:22:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('32', '811bced7-3378-4000-ada4-e48b1145663e', 'SUCCESS', 'gAJLIS4=', '2019-07-15 10:23:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('33', '00109eb3-8567-4d95-8de3-34f25247cd6b', 'SUCCESS', 'gAJLIi4=', '2019-07-15 10:24:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('34', '59293276-21ac-4c56-bbef-1728f7499612', 'SUCCESS', 'gAJLIy4=', '2019-07-15 10:25:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('35', 'e7939d00-1b30-40a2-9949-4a4752b29421', 'SUCCESS', 'gAJLJC4=', '2019-07-15 10:26:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('36', '507f6160-8a33-4f8a-965e-acffc6d38764', 'SUCCESS', 'gAJLJS4=', '2019-07-15 10:27:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('37', 'f058385c-af52-4cb0-aa78-c5d92e35b650', 'SUCCESS', 'gAJLJi4=', '2019-07-15 10:28:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('38', '69f1fb0e-9f07-4e9f-b2c0-400bbef10840', 'SUCCESS', 'gAJLJy4=', '2019-07-15 10:29:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('39', '2305a181-f16c-48fb-88ae-8c537e1b1c31', 'SUCCESS', 'gAJLKC4=', '2019-07-15 10:30:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('40', 'a6318e5c-a4e6-46e4-a80e-b41cac22ed22', 'SUCCESS', 'gAJLKS4=', '2019-07-15 10:31:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('41', '14406f36-bcca-4704-8767-9cb16128581e', 'SUCCESS', 'gAJLKi4=', '2019-07-15 10:32:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('42', '005f3dc2-d5ad-4b13-b31f-554163d33450', 'SUCCESS', 'gAJLKy4=', '2019-07-15 10:33:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('43', '8cba8b58-7539-4550-b12d-6c5c70a1d7d0', 'SUCCESS', 'gAJLLC4=', '2019-07-15 10:34:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('44', '7caf6bc5-0b15-422a-9188-3661fd0d559d', 'SUCCESS', 'gAJLLS4=', '2019-07-15 10:35:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('45', '28589189-3af4-49c1-a76a-803e55672127', 'SUCCESS', 'gAJLLi4=', '2019-07-15 10:36:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('46', '3a540f96-7f62-4456-9f2c-352ef2a4959f', 'SUCCESS', 'gAJLLy4=', '2019-07-15 10:37:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('47', '3f08dffd-b98a-4d51-b3c3-ceadb99dbdf4', 'SUCCESS', 'gAJLMC4=', '2019-07-15 10:38:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('48', '4f2cc32e-efd9-498f-b362-7a0307583692', 'SUCCESS', 'gAJLMS4=', '2019-07-15 10:39:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('49', '92ba8c6a-a01c-4619-a87d-791b69f6cb20', 'SUCCESS', 'gAJLMi4=', '2019-07-15 10:40:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('50', '36ddc04e-2cad-4cff-94f4-157e8cbfd02c', 'SUCCESS', 'gAJLMy4=', '2019-07-15 10:41:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('51', 'd8e9e6db-9827-4ec6-a714-03ce366059cf', 'SUCCESS', 'gAJLNC4=', '2019-07-15 10:42:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('52', '4bf011eb-04fb-4412-b106-c80f645c95bc', 'SUCCESS', 'gAJLNS4=', '2019-07-15 10:43:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('53', '99bb1f49-977c-47c2-af34-1e5b2ae1d2b6', 'SUCCESS', 'gAJLNi4=', '2019-07-15 10:44:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('54', 'f1c47d64-d6bc-4dfa-b6ef-09bbeebd95a1', 'SUCCESS', 'gAJLNy4=', '2019-07-15 10:45:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('55', '372d53a1-7582-4f7a-b211-b687b2d0e64d', 'SUCCESS', 'gAJLOC4=', '2019-07-15 10:46:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('56', 'a1167ce9-b847-4fe7-8910-606bc6581dce', 'SUCCESS', 'gAJLOS4=', '2019-07-15 10:47:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('57', '10874251-be88-4315-bed1-39fde7720aed', 'SUCCESS', 'gAJLOi4=', '2019-07-15 10:48:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('58', '3c71402b-e747-4840-b195-217107bcb398', 'SUCCESS', 'gAJLOy4=', '2019-07-15 10:49:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('59', '95879645-2ba1-40d7-a18e-b071c00688f7', 'SUCCESS', 'gAJLFC4=', '2019-07-15 11:09:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('60', '5b67de4f-deb1-4716-8411-a494f3a2d9af', 'SUCCESS', 'gAJLFS4=', '2019-07-15 11:10:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('61', 'd5ea157d-7963-449b-bd06-de1c6e67cd78', 'SUCCESS', 'gAJLMC4=', '2019-07-15 14:34:38', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('62', 'd286e56f-9454-4d65-8ac0-3435d0b6202e', 'SUCCESS', 'gAJLOC4=', '2019-07-15 14:42:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('63', 'f0b55449-e0a4-45be-90dc-9ee04e99ec42', 'SUCCESS', 'gAJLOS4=', '2019-07-15 14:43:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('64', '7339abcb-5498-4aae-b457-a77e18ceb218', 'SUCCESS', 'gAJLOi4=', '2019-07-15 14:44:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('65', '1bd59580-97c3-4195-b5cd-168ab3bd9553', 'SUCCESS', 'gAJLOy4=', '2019-07-15 14:45:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('66', 'df713733-897b-4d68-b03e-c173d20a1106', 'SUCCESS', 'gAJLPC4=', '2019-07-15 14:46:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('67', 'eec7f874-70b9-42a0-bd13-e2f1da97d514', 'SUCCESS', 'gAJLPS4=', '2019-07-15 14:47:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('68', '9e4fbb8d-a4b3-4e6c-94c7-496d84e5dd62', 'SUCCESS', 'gAJLPi4=', '2019-07-15 14:48:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('69', '7a28d8b9-808c-47c6-922f-bdd237a39761', 'SUCCESS', 'gAJLPy4=', '2019-07-15 14:49:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('70', 'e64f05ac-d6c5-452c-b979-9c13a58c0317', 'SUCCESS', 'gAJLQC4=', '2019-07-15 14:50:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('71', '508e1855-f683-4cbf-a464-0485c98b3d40', 'SUCCESS', 'gAJLQS4=', '2019-07-15 14:51:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('72', 'd86a2111-2103-4a3b-ac5c-46cae9a939b7', 'SUCCESS', 'gAJLQi4=', '2019-07-15 14:52:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('73', 'bdf8a3ad-13c7-4614-9da5-7e8aa6b7ec85', 'SUCCESS', 'gAJLQy4=', '2019-07-15 14:53:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('74', '85583f10-418c-4ada-b9af-ec68e9cc7a03', 'SUCCESS', 'gAJLRC4=', '2019-07-15 14:54:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('75', '52dda671-8fec-417d-a2ca-2e3e010b38bc', 'SUCCESS', 'gAJLRS4=', '2019-07-15 14:55:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('76', '06887fe3-9be3-46fb-8ed4-5d017f974509', 'SUCCESS', 'gAJLRi4=', '2019-07-15 14:56:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('77', '0ab1e37d-43a7-40c1-ae6c-c5e2a7ec21e3', 'SUCCESS', 'gAJLRy4=', '2019-07-15 14:57:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('78', 'cc750fbc-75df-49dd-8e36-1c563df1298f', 'SUCCESS', 'gAJLSC4=', '2019-07-15 14:58:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('79', '86614167-1380-4605-9810-2123b9466a39', 'SUCCESS', 'gAJLSS4=', '2019-07-15 14:59:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('80', '6bfac209-8802-432b-aab8-5ac77c2ea719', 'SUCCESS', 'gAJLDy4=', '2019-07-15 15:00:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('81', '513477d9-b9f8-4d8c-a967-bf2650ae33e0', 'SUCCESS', 'gAJLEC4=', '2019-07-15 15:01:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('82', 'a26b845e-a6c8-4d53-8d2d-926f25524300', 'SUCCESS', 'gAJLES4=', '2019-07-15 15:02:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('83', '163f399b-8ec1-4932-a175-545a97d7edda', 'SUCCESS', 'gAJLEi4=', '2019-07-15 15:03:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('84', 'bec4094c-2448-4916-8236-de750d6d5c57', 'SUCCESS', 'gAJLEy4=', '2019-07-15 15:04:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('85', '0990063b-30ac-4049-90db-d6d92faf6128', 'SUCCESS', 'gAJLFC4=', '2019-07-15 15:05:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('86', 'c37c6e26-522a-4177-82f2-0c49daaf390b', 'SUCCESS', 'gAJLFS4=', '2019-07-15 15:06:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('87', '8e919bf9-daf7-4188-a4bc-bec9872617da', 'SUCCESS', 'gAJLFi4=', '2019-07-15 15:07:10', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('88', '72272012-63b0-4845-b180-bd6f973f8d16', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:07:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('89', 'dd1acc34-5027-4630-911c-1368a726ca5f', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:08:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('90', '52e7977e-dc53-4747-bf12-2de5eea73b68', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:09:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('91', '03731608-43e9-45d0-8b31-6d52da43c878', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:10:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('92', 'b84f3cf7-4ce6-43af-8b49-eb1ccabc942c', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:11:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('93', 'a9bb5e3c-3008-41ce-a7b2-f89b34578a88', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:12:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('94', '11687d06-5007-4f2f-b8f6-d0d9845739c9', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:13:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('95', '2b712221-e747-4562-9a22-c2b9839d086e', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:14:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('96', '2bbb1984-f614-4031-8e98-9f073fe64b78', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:15:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('97', '3ab29787-0c26-4605-9c23-8d2b4ed2e813', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:16:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('98', '33777497-781e-41f5-af1b-369630d47702', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:17:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('99', '236ee677-8a14-4f6b-a3e4-16971db07eb7', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:18:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('100', '48a2ff26-4b78-41dd-9209-612885b9678c', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:19:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('101', '18ff49a9-9448-44ce-894f-17790a241931', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:20:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('102', '4ebad833-717c-4847-a866-d0dab5d1b4d3', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:21:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('103', '9b942097-1454-4bee-b6ee-0763a4c24775', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:22:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('104', 'ddc175f7-ff13-453e-8acc-aa8641d7335b', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:23:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('105', '3afa6ed3-d324-44d0-8b95-259b847026f6', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:24:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('106', 'cb2f6883-4e72-430e-95de-455a1e815411', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:25:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('107', '5fca9c10-88cf-4ebe-84ee-60ed9b619734', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:26:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('108', '9b4c4b23-2ac4-4e4d-bd83-49f3029d16e4', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:27:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('109', '38e6ddb1-2090-4721-aa79-095fe104c97f', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:28:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('110', '060a8d78-a6f8-4535-919e-74d5eeacc705', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:29:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('111', '861a6386-3d1d-42c7-ba8e-dbbf10c80a3a', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:30:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('112', '057a0998-8c28-487f-bc25-2063f79c935d', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:31:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('113', 'dd7b0ad1-3c29-41ff-9958-99316e275a18', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:32:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('114', 'abd88b80-c1d9-4e19-900d-c4fa7150ff0e', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:33:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('115', '4e1ded8c-d41d-4c4c-958d-6186c3534a1d', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:34:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('116', 'bbb7cc0e-98fd-4736-b551-c64bb7db25db', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:35:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('117', 'f92f6cd1-3fba-4b4b-8daf-2ecc00f3eb82', 'SUCCESS', 'gAJLAi4=', '2019-07-15 16:36:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('118', '074f0ec0-0a29-4ca2-88a4-61b84b96cb70', 'SUCCESS', 'gAJVGT09PT09PT09PT09PT09PT09PT09PT09PT1xAS4=', '2019-07-15 17:41:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('119', '5a0928c2-04fc-4b4a-b3ed-4067fa399057', 'SUCCESS', 'gAJVGT09PT09PT09PT09PT09PT09PT09PT09PT1xAS4=', '2019-07-15 17:42:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('120', 'f4e63aaf-239b-4e1c-b334-9da0933a3e95', 'SUCCESS', 'gAJVGT09PT09PT09PT09PT09PT09PT09PT09PT1xAS4=', '2019-07-15 17:43:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('121', '08207d37-190d-4c31-8cd7-fed7c7ca9329', 'SUCCESS', 'gAJVGT09PT09PT09PT09PT09PT09PT09PT09PT1xAS4=', '2019-07-15 17:44:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');
INSERT INTO `celery_taskmeta` VALUES ('122', '1b04a303-0bcc-4fa4-9c22-c1bebec36eea', 'SUCCESS', 'gAJVGT09PT09PT09PT09PT09PT09PT09PT09PT1xAS4=', '2019-07-15 17:45:00', null, '0', 'eJxrYKotZIzgYGBgSM7IzEkpSs0rZIotZC7WAwBWuwcA');

-- ----------------------------
-- Table structure for celery_tasksetmeta
-- ----------------------------
DROP TABLE IF EXISTS `celery_tasksetmeta`;
CREATE TABLE `celery_tasksetmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskset_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_done` datetime NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taskset_id` (`taskset_id`) USING BTREE,
  KEY `celery_tasksetmeta_662f707d` (`hidden`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of celery_tasksetmeta
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_account_bkuser_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `account_bkuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_cache
-- ----------------------------
DROP TABLE IF EXISTS `django_cache`;
CREATE TABLE `django_cache` (
  `cache_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`cache_key`),
  KEY `django_cache_expires` (`expires`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_cache
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('8', 'account', 'bkuser');
INSERT INTO `django_content_type` VALUES ('6', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('9', 'api', 'menu');
INSERT INTO `django_content_type` VALUES ('25', 'api', 'tasktemplet');
INSERT INTO `django_content_type` VALUES ('26', 'api', 'templettype');
INSERT INTO `django_content_type` VALUES ('7', 'app_control', 'functioncontroller');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('1', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('19', 'djcelery', 'crontabschedule');
INSERT INTO `django_content_type` VALUES ('18', 'djcelery', 'intervalschedule');
INSERT INTO `django_content_type` VALUES ('21', 'djcelery', 'periodictask');
INSERT INTO `django_content_type` VALUES ('20', 'djcelery', 'periodictasks');
INSERT INTO `django_content_type` VALUES ('16', 'djcelery', 'taskmeta');
INSERT INTO `django_content_type` VALUES ('17', 'djcelery', 'tasksetmeta');
INSERT INTO `django_content_type` VALUES ('23', 'djcelery', 'taskstate');
INSERT INTO `django_content_type` VALUES ('22', 'djcelery', 'workerstate');
INSERT INTO `django_content_type` VALUES ('4', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('5', 'sites', 'site');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('9', 'account', '0001_initial', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('10', 'account', '0002_initial_user_data', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('11', 'account', '0003_auto_20190517_1045', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('13', 'app_control', '0001_initial', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('14', 'app_control', '0002_initial_app_control', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('15', 'djcelery', '0001_initial', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('16', 'sessions', '0001_initial', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('17', 'sites', '0001_initial', '2019-05-30 19:28:15');
INSERT INTO `django_migrations` VALUES ('24', 'api', '0001_initial', '2019-06-12 15:48:35');
INSERT INTO `django_migrations` VALUES ('25', 'api', '0002_auto_20190612_1614', '2019-06-12 16:15:05');
INSERT INTO `django_migrations` VALUES ('26', 'api', '0003_auto_20191101_1312', '2019-11-04 13:57:13');
INSERT INTO `django_migrations` VALUES ('27', 'api', '0004_auto_20191101_1317', '2019-11-04 13:57:14');
INSERT INTO `django_migrations` VALUES ('28', 'api', '0005_tasktemplet_templet_uid', '2019-11-04 13:57:14');
INSERT INTO `django_migrations` VALUES ('29', 'api', '0006_auto_20191104_1400', '2019-11-04 14:00:28');
INSERT INTO `django_migrations` VALUES ('30', 'api', '0007_auto_20191104_1401', '2019-11-04 14:02:01');
INSERT INTO `django_migrations` VALUES ('31', 'api', '0008_remove_tasktemplet_templet_uid', '2019-11-04 14:02:01');
INSERT INTO `django_migrations` VALUES ('32', 'api', '0009_tasktemplet_templet_uid', '2019-11-04 14:02:26');
INSERT INTO `django_migrations` VALUES ('33', 'api', '0010_auto_20191104_1456', '2019-11-04 14:57:11');
INSERT INTO `django_migrations` VALUES ('34', 'api', '0011_remove_tasktemplet_thetype', '2019-11-04 17:36:31');
INSERT INTO `django_migrations` VALUES ('35', 'api', '0012_tasktemplet_thetype', '2019-11-04 17:37:03');
INSERT INTO `django_migrations` VALUES ('36', 'api', '0013_auto_20191106_0948', '2019-11-06 09:48:49');
INSERT INTO `django_migrations` VALUES ('37', 'api', '0014_auto_20191106_1407', '2019-11-06 14:07:09');
INSERT INTO `django_migrations` VALUES ('38', 'api', '0015_auto_20191108_1507', '2019-11-08 15:07:56');
INSERT INTO `django_migrations` VALUES ('39', 'api', '0016_auto_20191111_1750', '2019-11-11 17:51:11');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2qhzcd7hdfblyi5ymujepb9gd3xhqujb', 'ODQyZGI5MTk5NTlmNTU1YmJiNmVkMWE5OTI4YmI5YTcxYzhhOWRlNDp7InN6R0RycGFwcCI6eyJpbmZvIjp7InVzZXJuYW1lIjoic3pnZF9zd2FpbiIsInN1cnBlcm1hbiI6MSwiZW1haWwiOiJzd2FpbkBkaWdpdGFsZ2QuY29tLmNuIiwiaXRlbUxpc3QiOltdLCJuaWNrbmFtZSI6Ilx1OGQ4NVx1N2VhN1x1N2JhMVx1NzQwNlx1NTQ1OCIsImlkIjoxfSwibWVudXMiOlt7InN1Ym1lbnUiOlt7IndlaWdoIjpudWxsLCJsaW5rIjoiL2RhaWx5L25ld3MiLCJuYW1lIjoiRGFpbHlOZXdzIiwidGl0bGUiOiJcdTY1ZTVcdTYyYTVcdTYwM2JcdTg5YzgifV0sIm5hbWUiOiJTdW1tYXJ5U3RhdGlzdGljcyIsInRpdGxlIjoiXHU2MDNiXHU4OWM4XHU3ZWRmXHU4YmExIiwibGluayI6Ii8iLCJ3ZWlnaCI6MSwiaWNvbiI6Im1kLXBvZGl1bSJ9LHsic3VibWVudSI6W3sid2VpZ2giOm51bGwsImxpbmsiOiIvZGFpbHkvd3JpdGUiLCJuYW1lIjoiRGFpbHlXcml0ZSIsInRpdGxlIjoiXHU2NWIwXHU1ZWZhXHU2NWU1XHU2MmE1In0seyJ3ZWlnaCI6bnVsbCwibGluayI6Ii9kYWlseS9tYW5hZ2UiLCJuYW1lIjoiRGFpbHlNYW5hZ2UiLCJ0aXRsZSI6Ilx1NjVlNVx1NjJhNVx1N2JhMVx1NzQwNiJ9XSwibmFtZSI6IkpvYldvcmsiLCJ0aXRsZSI6Ilx1NjVlNVx1NjJhNVx1NGY1Y1x1NGUxYSIsImxpbmsiOiIvIiwid2VpZ2giOjIsImljb24iOiJpb3MtYm9va21hcmtzIn0seyJzdWJtZW51IjpbeyJ3ZWlnaCI6bnVsbCwibGluayI6Ii90ZW1wbGV0L3dyaXRlIiwibmFtZSI6IlRlbXBsZXRXcml0ZSIsInRpdGxlIjoiXHU2NWIwXHU1ZWZhXHU2YTIxXHU2NzdmIn0seyJ3ZWlnaCI6bnVsbCwibGluayI6Ii90ZW1wbGV0L21hbmFnZSIsIm5hbWUiOiJUZW1wbGV0TWFuYWdlIiwidGl0bGUiOiJcdTZhMjFcdTY3N2ZcdTdiYTFcdTc0MDYifV0sIm5hbWUiOiJDb25maWd1cmUiLCJ0aXRsZSI6Ilx1OTE0ZFx1N2Y2ZVx1NWU3M1x1NTNmMCIsImxpbmsiOiIvIiwid2VpZ2giOjMsImljb24iOiJtZC1jb250YWN0cyJ9LHsic3VibWVudSI6W3sid2VpZ2giOm51bGwsImxpbmsiOiIvdXNlci91c2VyIiwibmFtZSI6IlVzZXJNYW5hZ2UiLCJ0aXRsZSI6Ilx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNiJ9LHsid2VpZ2giOm51bGwsImxpbmsiOiIvdXNlci9pdGVtIiwibmFtZSI6Ikl0ZW1NYW5hZ2UiLCJ0aXRsZSI6Ilx1OTg3OVx1NzZlZVx1N2JhMVx1NzQwNiJ9XSwibmFtZSI6IlJiYWMiLCJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1N2JhMVx1NzQwNiIsImxpbmsiOiIvIiwid2VpZ2giOjQsImljb24iOiJtZC1wZXJzb24ifV0sInBlcm1pc3Npb25zIjp7InVybCI6WyIvYXBpL2dldE1lbnVzLyIsIi9hcGkvZWRpdEl0ZW0vIiwiL2FwaS9zYXZlRGFpbHkvIiwiL2FwaS9kYWlseUxpc3QvIiwiL2FwaS9nZXREYWlseS8iLCIvYXBpL2dldFRlbXBsZXQvIiwiL2FwaS90ZW1wbGV0TGlzdC8iLCIvYXBpL3NhdmVUZW1wbGV0LyIsIi9hcGkvZ2V0VGFnLyIsIi9hcGkvZHVtcERhaWx5LyIsIi9hcGkvc2VuZERhaWx5LyIsIi9hcGkvdXNlckxpc3QvIiwiL2FwaS9yb2xlTGlzdC8iLCIvYXBpL2JrVXNlckxpc3QvIiwiL2FwaS9hZGRVc2VyLyIsIi9hcGkvZWRpdFJvbGUvIiwiL2FwaS9kZWxVc2VyLyIsIi9hcGkvY3JlYXRlSXRlbS8iLCIvYXBpL2l0ZW1MaXN0LyIsIi9hcGkvZGVsSXRlbS8iLCIvYXBpL2dldEl0ZW0vIl0sImNvZGUiOlsiZ2V0TWVudXMiLCJlZGl0SXRlbSIsInNhdmVEYWlseSIsImRhaWx5TGlzdCIsImdldERhaWx5IiwiZ2V0VGVtcGxldCIsInRlbXBsZXRMaXN0Iiwic2F2ZVRlbXBsZXQiLCJnZXRUYWciLCJkdW1wRGFpbHkiLCJzZW5kRGFpbHkiLCJ1c2VyTGlzdCIsInJvbGVMaXN0IiwiYmtVc2VyTGlzdCIsImFkZFVzZXIiLCJlZGl0Um9sZSIsImRlbFVzZXIiLCJjcmVhdGVJdGVtIiwiaXRlbUxpc3QiLCJkZWxJdGVtIiwiZ2V0SXRlbSJdfX0sInN6R0RycFBlcm1pc3Npb25zIjpbIi9hcGkvZ2V0TWVudXMvIiwiL2FwaS9lZGl0SXRlbS8iLCIvYXBpL3NhdmVEYWlseS8iLCIvYXBpL2RhaWx5TGlzdC8iLCIvYXBpL2dldERhaWx5LyIsIi9hcGkvZ2V0VGVtcGxldC8iLCIvYXBpL3RlbXBsZXRMaXN0LyIsIi9hcGkvc2F2ZVRlbXBsZXQvIiwiL2FwaS9nZXRUYWcvIiwiL2FwaS9kdW1wRGFpbHkvIiwiL2FwaS9zZW5kRGFpbHkvIiwiL2FwaS91c2VyTGlzdC8iLCIvYXBpL3JvbGVMaXN0LyIsIi9hcGkvYmtVc2VyTGlzdC8iLCIvYXBpL2FkZFVzZXIvIiwiL2FwaS9lZGl0Um9sZS8iLCIvYXBpL2RlbFVzZXIvIiwiL2FwaS9jcmVhdGVJdGVtLyIsIi9hcGkvaXRlbUxpc3QvIiwiL2FwaS9kZWxJdGVtLyIsIi9hcGkvZ2V0SXRlbS8iXSwic3pHRFN1cnBlcm1hbiI6MX0=', '2019-06-13 19:56:35');
INSERT INTO `django_session` VALUES ('mw0uzqfsl77vno9q7vje0o3dsopz8ksm', 'NWE2MTM1MzlmN2ZiZjI5NDlhMzVmYTUzNjY3ZTNjZDRjZWE1MDVhOTp7InN6R0RycGFwcCI6eyJ1c2VybmFtZSI6InN6Z2Rfc3dhaW4iLCJzdXJwZXJtYW4iOjEsImVtYWlsIjoic3dhaW5AZGlnaXRhbGdkLmNvbS5jbiIsIml0ZW1MaXN0IjpbMjcsMjgsMjksMzAsMzEsMzIsMzNdLCJuaWNrbmFtZSI6Ilx1OGQ4NVx1N2VhN1x1N2JhMVx1NzQwNlx1NTQ1OCIsImlkIjoxfSwic3pHRHJwUGVybWlzc2lvbnMiOlsiL2FwaS9nZXRNZW51cy8iLCIvYXBpL2VkaXRJdGVtLyIsIi9hcGkvc2F2ZURhaWx5LyIsIi9hcGkvZGFpbHlMaXN0LyIsIi9hcGkvZ2V0RGFpbHkvIiwiL2FwaS9nZXRUZW1wbGV0LyIsIi9hcGkvdGVtcGxldExpc3QvIiwiL2FwaS9zYXZlVGVtcGxldC8iLCIvYXBpL2dldFRhZy8iLCIvYXBpL2R1bXBEYWlseS8iLCIvYXBpL3NlbmREYWlseS8iLCIvYXBpL3VzZXJMaXN0LyIsIi9hcGkvcm9sZUxpc3QvIiwiL2FwaS9ia1VzZXJMaXN0LyIsIi9hcGkvYWRkVXNlci8iLCIvYXBpL2VkaXRSb2xlLyIsIi9hcGkvZGVsVXNlci8iLCIvYXBpL2NyZWF0ZUl0ZW0vIiwiL2FwaS9pdGVtTGlzdC8iLCIvYXBpL2RlbEl0ZW0vIiwiL2FwaS9nZXRJdGVtLyJdLCJzekdEU3VycGVybWFuIjoxLCJzekdETWVudXMiOlt7InN1Ym1lbnUiOlt7IndlaWdoIjpudWxsLCJsaW5rIjoiL2RhaWx5L25ld3MiLCJuYW1lIjoiRGFpbHlOZXdzIiwidGl0bGUiOiJcdTY1ZTVcdTYyYTVcdTYwM2JcdTg5YzgifV0sIm5hbWUiOiJTdW1tYXJ5U3RhdGlzdGljcyIsInRpdGxlIjoiXHU2MDNiXHU4OWM4XHU3ZWRmXHU4YmExIiwibGluayI6Ii8iLCJ3ZWlnaCI6MSwiaWNvbiI6Im1kLXBvZGl1bSJ9LHsic3VibWVudSI6W3sid2VpZ2giOm51bGwsImxpbmsiOiIvZGFpbHkvd3JpdGUiLCJuYW1lIjoiRGFpbHlXcml0ZSIsInRpdGxlIjoiXHU2NWIwXHU1ZWZhXHU2NWU1XHU2MmE1In0seyJ3ZWlnaCI6bnVsbCwibGluayI6Ii9kYWlseS9tYW5hZ2UiLCJuYW1lIjoiRGFpbHlNYW5hZ2UiLCJ0aXRsZSI6Ilx1NjVlNVx1NjJhNVx1N2JhMVx1NzQwNiJ9XSwibmFtZSI6IkpvYldvcmsiLCJ0aXRsZSI6Ilx1NjVlNVx1NjJhNVx1NGY1Y1x1NGUxYSIsImxpbmsiOiIvIiwid2VpZ2giOjIsImljb24iOiJpb3MtYm9va21hcmtzIn0seyJzdWJtZW51IjpbeyJ3ZWlnaCI6bnVsbCwibGluayI6Ii90ZW1wbGV0L3dyaXRlIiwibmFtZSI6IlRlbXBsZXRXcml0ZSIsInRpdGxlIjoiXHU2NWIwXHU1ZWZhXHU2YTIxXHU2NzdmIn0seyJ3ZWlnaCI6bnVsbCwibGluayI6Ii90ZW1wbGV0L21hbmFnZSIsIm5hbWUiOiJUZW1wbGV0TWFuYWdlIiwidGl0bGUiOiJcdTZhMjFcdTY3N2ZcdTdiYTFcdTc0MDYifV0sIm5hbWUiOiJDb25maWd1cmUiLCJ0aXRsZSI6Ilx1OTE0ZFx1N2Y2ZVx1NWU3M1x1NTNmMCIsImxpbmsiOiIvIiwid2VpZ2giOjMsImljb24iOiJtZC1jb250YWN0cyJ9LHsic3VibWVudSI6W3sid2VpZ2giOm51bGwsImxpbmsiOiIvdXNlci91c2VyIiwibmFtZSI6IlVzZXJNYW5hZ2UiLCJ0aXRsZSI6Ilx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNiJ9LHsid2VpZ2giOm51bGwsImxpbmsiOiIvdXNlci9pdGVtIiwibmFtZSI6Ikl0ZW1NYW5hZ2UiLCJ0aXRsZSI6Ilx1OTg3OVx1NzZlZVx1N2JhMVx1NzQwNiJ9XSwibmFtZSI6IlJiYWMiLCJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1N2JhMVx1NzQwNiIsImxpbmsiOiIvIiwid2VpZ2giOjQsImljb24iOiJtZC1wZXJzb24ifV19', '2019-06-14 16:34:20');
INSERT INTO `django_session` VALUES ('rtifdoixyweef081ktt2zyvucxuimmra', 'ZjkyMTBmNjczNDdjM2Q5NjI5ZjhhOGNjMzRmYzdiOGZlYzhlZGE4ZTp7InN6R0RycGFwcCI6eyJ1c2VybmFtZSI6InN6Z2Rfc3dhaW4iLCJzdXJwZXJtYW4iOjEsImVtYWlsIjoic3dhaW5AZGlnaXRhbGdkLmNvbS5jbiIsIml0ZW1MaXN0IjpbMjcsMjgsMjksMzAsMzEsMzIsMzNdLCJuaWNrbmFtZSI6Ilx1OGQ4NVx1N2VhN1x1N2JhMVx1NzQwNlx1NTQ1OCIsImlkIjoxfSwic3pHRHJwUGVybWlzc2lvbnMiOlsiL2FwaS9nZXRNZW51cy8iLCIvYXBpL2VkaXRJdGVtLyIsIi9hcGkvc2F2ZURhaWx5LyIsIi9hcGkvZGFpbHlMaXN0LyIsIi9hcGkvZ2V0RGFpbHkvIiwiL2FwaS9nZXRUZW1wbGV0LyIsIi9hcGkvdGVtcGxldExpc3QvIiwiL2FwaS9zYXZlVGVtcGxldC8iLCIvYXBpL2dldFRhZy8iLCIvYXBpL2R1bXBEYWlseS8iLCIvYXBpL3NlbmREYWlseS8iLCIvYXBpL3VzZXJMaXN0LyIsIi9hcGkvcm9sZUxpc3QvIiwiL2FwaS9ia1VzZXJMaXN0LyIsIi9hcGkvYWRkVXNlci8iLCIvYXBpL2VkaXRSb2xlLyIsIi9hcGkvZGVsVXNlci8iLCIvYXBpL2NyZWF0ZUl0ZW0vIiwiL2FwaS9pdGVtTGlzdC8iLCIvYXBpL2RlbEl0ZW0vIiwiL2FwaS9nZXRJdGVtLyJdLCJzekdETWVudXMiOlt7InN1Ym1lbnUiOlt7IndlaWdoIjpudWxsLCJsaW5rIjoiL2RhaWx5L25ld3MiLCJuYW1lIjoiRGFpbHlOZXdzIiwidGl0bGUiOiJcdTY1ZTVcdTYyYTVcdTYwM2JcdTg5YzgifV0sIm5hbWUiOiJTdW1tYXJ5U3RhdGlzdGljcyIsInRpdGxlIjoiXHU2MDNiXHU4OWM4XHU3ZWRmXHU4YmExIiwibGluayI6Ii8iLCJ3ZWlnaCI6MSwiaWNvbiI6Im1kLXBvZGl1bSJ9LHsic3VibWVudSI6W3sid2VpZ2giOm51bGwsImxpbmsiOiIvZGFpbHkvd3JpdGUiLCJuYW1lIjoiRGFpbHlXcml0ZSIsInRpdGxlIjoiXHU2NWIwXHU1ZWZhXHU2NWU1XHU2MmE1In0seyJ3ZWlnaCI6bnVsbCwibGluayI6Ii9kYWlseS9tYW5hZ2UiLCJuYW1lIjoiRGFpbHlNYW5hZ2UiLCJ0aXRsZSI6Ilx1NjVlNVx1NjJhNVx1N2JhMVx1NzQwNiJ9XSwibmFtZSI6IkpvYldvcmsiLCJ0aXRsZSI6Ilx1NjVlNVx1NjJhNVx1NGY1Y1x1NGUxYSIsImxpbmsiOiIvIiwid2VpZ2giOjIsImljb24iOiJpb3MtYm9va21hcmtzIn0seyJzdWJtZW51IjpbeyJ3ZWlnaCI6bnVsbCwibGluayI6Ii90ZW1wbGV0L3dyaXRlIiwibmFtZSI6IlRlbXBsZXRXcml0ZSIsInRpdGxlIjoiXHU2NWIwXHU1ZWZhXHU2YTIxXHU2NzdmIn0seyJ3ZWlnaCI6bnVsbCwibGluayI6Ii90ZW1wbGV0L21hbmFnZSIsIm5hbWUiOiJUZW1wbGV0TWFuYWdlIiwidGl0bGUiOiJcdTZhMjFcdTY3N2ZcdTdiYTFcdTc0MDYifV0sIm5hbWUiOiJDb25maWd1cmUiLCJ0aXRsZSI6Ilx1OTE0ZFx1N2Y2ZVx1NWU3M1x1NTNmMCIsImxpbmsiOiIvIiwid2VpZ2giOjMsImljb24iOiJtZC1jb250YWN0cyJ9LHsic3VibWVudSI6W3sid2VpZ2giOm51bGwsImxpbmsiOiIvdXNlci91c2VyIiwibmFtZSI6IlVzZXJNYW5hZ2UiLCJ0aXRsZSI6Ilx1NzUyOFx1NjIzN1x1N2JhMVx1NzQwNiJ9LHsid2VpZ2giOm51bGwsImxpbmsiOiIvdXNlci9pdGVtIiwibmFtZSI6Ikl0ZW1NYW5hZ2UiLCJ0aXRsZSI6Ilx1OTg3OVx1NzZlZVx1N2JhMVx1NzQwNiJ9XSwibmFtZSI6IlJiYWMiLCJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1N2JhMVx1NzQwNiIsImxpbmsiOiIvIiwid2VpZ2giOjQsImljb24iOiJtZC1wZXJzb24ifV19', '2019-06-18 17:15:43');

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES ('1', 'example.com', 'example.com');

-- ----------------------------
-- Table structure for djcelery_crontabschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_crontabschedule`;
CREATE TABLE `djcelery_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hour` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_of_week` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `day_of_month` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `month_of_year` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_crontabschedule
-- ----------------------------
INSERT INTO `djcelery_crontabschedule` VALUES ('1', '0', '4', '*', '*', '*');
INSERT INTO `djcelery_crontabschedule` VALUES ('2', '*/5', '*', '*', '*', '*');
INSERT INTO `djcelery_crontabschedule` VALUES ('3', '*', '*', '*', '*', '*');

-- ----------------------------
-- Table structure for djcelery_intervalschedule
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_intervalschedule`;
CREATE TABLE `djcelery_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_intervalschedule
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_periodictask
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictask`;
CREATE TABLE `djcelery_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `task` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `kwargs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `queue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `exchange` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `routing_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `djcel_crontab_id_1d8228f5b44b680a_fk_djcelery_crontabschedule_id` (`crontab_id`) USING BTREE,
  KEY `djc_interval_id_20cfc1cad060dfad_fk_djcelery_intervalschedule_id` (`interval_id`) USING BTREE,
  CONSTRAINT `djcelery_periodictask_ibfk_1` FOREIGN KEY (`interval_id`) REFERENCES `djcelery_intervalschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `djcelery_periodictask_ibfk_2` FOREIGN KEY (`crontab_id`) REFERENCES `djcelery_crontabschedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictask
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_periodictasks
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_periodictasks`;
CREATE TABLE `djcelery_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_periodictasks
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_taskstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_taskstate`;
CREATE TABLE `djcelery_taskstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `task_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tstamp` datetime NOT NULL,
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `kwargs` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `eta` datetime DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `result` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `traceback` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `runtime` double DEFAULT NULL,
  `retries` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `worker_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`) USING BTREE,
  KEY `djcelery_taskstate_9ed39e2e` (`state`) USING BTREE,
  KEY `djcelery_taskstate_b068931c` (`name`) USING BTREE,
  KEY `djcelery_taskstate_863bb2ee` (`tstamp`) USING BTREE,
  KEY `djcelery_taskstate_662f707d` (`hidden`) USING BTREE,
  KEY `djcelery_taskstate_ce77e6ef` (`worker_id`) USING BTREE,
  CONSTRAINT `djcelery_taskstate_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `djcelery_workerstate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_taskstate
-- ----------------------------

-- ----------------------------
-- Table structure for djcelery_workerstate
-- ----------------------------
DROP TABLE IF EXISTS `djcelery_workerstate`;
CREATE TABLE `djcelery_workerstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_heartbeat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`) USING BTREE,
  KEY `djcelery_workerstate_f129901a` (`last_heartbeat`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of djcelery_workerstate
-- ----------------------------

-- ----------------------------
-- Table structure for rp_menu
-- ----------------------------
DROP TABLE IF EXISTS `rp_menu`;
CREATE TABLE `rp_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createTime` datetime NOT NULL,
  `father_menu_id` int(11) DEFAULT NULL,
  `weigh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_category_father_menu_id_4bd8aae3_fk_i_category_id` (`father_menu_id`) USING BTREE,
  CONSTRAINT `rp_menu_ibfk_1` FOREIGN KEY (`father_menu_id`) REFERENCES `rp_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rp_menu
-- ----------------------------
INSERT INTO `rp_menu` VALUES ('1', '首页', 'bk-icon icon-home', 'Home', '/', '2019-10-30 17:31:53', null, null);
INSERT INTO `rp_menu` VALUES ('2', '任务中心', 'bk-icon icon-apps', 'Configure', '/', '2019-04-18 14:21:20', null, '3');
INSERT INTO `rp_menu` VALUES ('3', '任务模板', 'bk-icon icon-order', 'TempletManage', '/templet/manage', '2019-04-19 16:03:24', '2', null);

-- ----------------------------
-- Table structure for rp_task_templet
-- ----------------------------
DROP TABLE IF EXISTS `rp_task_templet`;
CREATE TABLE `rp_task_templet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(11) DEFAULT NULL,
  `update_user` varchar(11) DEFAULT NULL,
  `name` varchar(35) NOT NULL,
  `business` varchar(35) NOT NULL,
  `update_time` datetime NOT NULL,
  `createTime` datetime NOT NULL,
  `thetype_id` int(11) NOT NULL,
  `templet` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rp_task_templet_0a3b11e5` (`thetype_id`),
  CONSTRAINT `rp_task_templet_thetype_id_539f977b_fk_rp_templet_type_id` FOREIGN KEY (`thetype_id`) REFERENCES `rp_templet_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rp_task_templet
-- ----------------------------
INSERT INTO `rp_task_templet` VALUES ('4', 'admin', 'admin', '444', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('5', 'admin', 'admin', '555', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('6', 'admin', 'admin', '666', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('7', 'admin', 'admin', '777', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('9', 'admin', 'admin', '999', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('10', 'admin', 'admin', '000', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('11', 'admin', 'admin', '123', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('12', 'admin', 'admin', '122', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('13', 'admin', 'admin', '1112', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('14', 'admin', 'admin', '1234', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('15', 'admin', 'admin', '2222', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('16', 'admin', 'admin', '2223', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('17', 'admin', 'admin', '2224', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('18', 'admin', 'admin', '2226', 'test1', '2019-11-04 18:05:22', '2019-11-04 18:05:22', '4', '1');
INSERT INTO `rp_task_templet` VALUES ('21', 'admin', 'admin', '222223', '蓝鲸', '2019-11-08 15:52:04', '2019-11-08 15:52:04', '3', '1');
INSERT INTO `rp_task_templet` VALUES ('22', 'admin', 'admin', 'ces', '蓝鲸', '2019-11-11 17:33:25', '2019-11-11 17:33:25', '3', '1');
INSERT INTO `rp_task_templet` VALUES ('23', 'admin', 'admin', '222', '蓝鲸', '2019-11-11 17:56:04', '2019-11-11 17:56:04', '3', '\"76c7e370-0469-11ea-aeed-30d16be00458.xls\"');
INSERT INTO `rp_task_templet` VALUES ('24', 'admin', 'admin', 'x&#39;c&#39;x', '蓝鲸', '2019-11-11 18:00:55', '2019-11-11 18:00:55', '3', '\"ce3db84f-0469-11ea-b1a0-30d16be00458.xls\"');
INSERT INTO `rp_task_templet` VALUES ('25', 'admin', 'admin', 'www', '蓝鲸', '2019-11-11 18:08:48', '2019-11-11 18:08:48', '3', '\"995d1440-046a-11ea-818f-30d16be00458.xls\"');
INSERT INTO `rp_task_templet` VALUES ('26', 'admin', 'admin', 'sssa', '蓝鲸', '2019-11-11 18:13:16', '2019-11-11 18:13:16', '3', 'df6918c0-046b-11ea-84fc-30d16be00458.xls');
INSERT INTO `rp_task_templet` VALUES ('27', 'admin', 'admin', '2221', '蓝鲸', '2019-11-11 18:17:52', '2019-11-11 18:17:52', '5', '827d72e1-046c-11ea-870a-30d16be00458.xls');
INSERT INTO `rp_task_templet` VALUES ('28', 'admin', 'admin', '12121', '蓝鲸', '2019-11-11 18:22:38', '2019-11-11 18:22:38', '4', '24256bc0-046d-11ea-b0f0-30d16be00458.xls');
INSERT INTO `rp_task_templet` VALUES ('29', 'admin', 'admin', '222112', '蓝鲸', '2019-11-13 15:30:02', '2019-11-13 15:30:02', '3', '610b3491-05e7-11ea-94ac-30d16be00458.xls');
INSERT INTO `rp_task_templet` VALUES ('30', 'admin', 'admin', 'test', '蓝鲸', '2019-11-13 16:05:20', '2019-11-13 16:05:20', '3', '53c01761-05ec-11ea-a105-30d16be00458.xls');

-- ----------------------------
-- Table structure for rp_templet_type
-- ----------------------------
DROP TABLE IF EXISTS `rp_templet_type`;
CREATE TABLE `rp_templet_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rp_templet_type
-- ----------------------------
INSERT INTO `rp_templet_type` VALUES ('1', '变更发布', '2019-11-01 13:20:35');
INSERT INTO `rp_templet_type` VALUES ('2', '扩缩容', '2019-11-01 13:21:07');
INSERT INTO `rp_templet_type` VALUES ('3', '上线类', '2019-11-01 13:22:17');
INSERT INTO `rp_templet_type` VALUES ('4', '下架类', '2019-11-01 13:22:35');
INSERT INTO `rp_templet_type` VALUES ('5', '例行维护', '2019-11-01 13:22:50');
