/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.20 : Database - api
*********************************************************************
*/




/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE  IF NOT EXISTS `api` DEFAULT CHARACTER SET utf8 ;

USE `api`;

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'qq1203943228' WITH GRANT OPTION;

/*Table structure for table `log_login_info` */

DROP TABLE IF EXISTS `log_login_info`;

CREATE TABLE `log_login_info` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `log_user_name` varchar(64) DEFAULT NULL COMMENT '用户账号',
  `log_user_login_time` bigint(20) DEFAULT NULL COMMENT '用户登录时间',
  `log_user_logout_time` bigint(20) DEFAULT NULL COMMENT '用户登出时间',
  `log_user_login_ip` varchar(32) DEFAULT NULL COMMENT '用户登录ip',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `role_id` int(11) DEFAULT NULL COMMENT '用户code\n',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='用户登录日志表';

/*Data for the table `log_login_info` */

/*Table structure for table `log_operation_info` */

DROP TABLE IF EXISTS `log_operation_info`;

CREATE TABLE `log_operation_info` (
  `operation_id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_user` varchar(32) DEFAULT NULL COMMENT '操作用户',
  `operation_date` bigint(20) DEFAULT NULL COMMENT '操作时间',
  `operation_url` varchar(64) DEFAULT NULL COMMENT '操作路径',
  `user_ip` varchar(32) DEFAULT NULL COMMENT '登录ip\n',
  `operation_params` varchar(255) DEFAULT NULL COMMENT '操作参数\n',
  `request_type` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `request_head` varchar(255) DEFAULT NULL COMMENT '请求头',
  `operation_method` varchar(64) DEFAULT NULL COMMENT '方法的相对路径',
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=613 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

/*Data for the table `log_operation_info` */

/*Table structure for table `sys_article_info` */

DROP TABLE IF EXISTS `sys_article_info`;

CREATE TABLE `sys_article_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_name` varchar(200) NOT NULL COMMENT '文章名称',
  `article_tag` varchar(100) DEFAULT NULL COMMENT '文章tag',
  `article_type` varchar(100) DEFAULT NULL COMMENT '文章类型',
  `article_file_name` varchar(200) NOT NULL COMMENT '文件名',
  `article_file_path` varchar(200) DEFAULT NULL COMMENT '文章文件地址',
  `article_push_status` int(11) DEFAULT '0' COMMENT '发布状态 0,未发布，1 已发布，2，已删除',
  `article_content` text COMMENT '内容',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '修改时间',
  `remarks` varchar(32) DEFAULT NULL COMMENT '备注',
  `cust_no` varchar(32) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_article_info_article_file_path_uindex` (`article_file_path`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='基础文章表';

/*Data for the table `sys_article_info` */

/*Table structure for table `sys_permission` */

DROP TABLE IF EXISTS `sys_permission`;

CREATE TABLE `sys_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_resource_name` varchar(64) NOT NULL COMMENT '资源名称',
  `permission_sort` int(11) DEFAULT NULL COMMENT '排序',
  `permission_state` char(1) NOT NULL DEFAULT '1' COMMENT '状态 1启用 0:删除',
  `permission_remarks` varchar(255) DEFAULT NULL,
  `update_date` bigint(20) NOT NULL,
  `update_by` varchar(32) NOT NULL,
  `create_date` bigint(20) NOT NULL,
  `create_by` varchar(32) NOT NULL,
  `resource_type` tinyint(4) NOT NULL COMMENT '资源类型1模块，2按钮',
  `resource_url` varchar(64) DEFAULT NULL,
  `permission_parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sys_permission` */

insert  into `sys_permission`(`permission_id`,`permission_resource_name`,`permission_sort`,`permission_state`,`permission_remarks`,`update_date`,`update_by`,`create_date`,`create_by`,`resource_type`,`resource_url`,`permission_parent_id`) values (1,'资源增加',1,'1',NULL,1234567890,'admin',1234567890123,'admin',2,'system:resource:add',0),(2,'资源删除',2,'1',NULL,1234567890123,'admin',1234567890123,'admin',2,'system:resource:delete',0),(3,'资源修改',3,'1',NULL,1234567890123,'admin',1234567890123,'admmin',2,'system:reource:update',0);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `role_status` tinyint(4) DEFAULT NULL COMMENT '角色的状态 0.正常.1,停用.2,删除',
  `role_remarks` varchar(64) DEFAULT NULL COMMENT '备注',
  `role_code` varchar(32) DEFAULT NULL COMMENT '角色编码',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `create_date` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '修改人',
  `update_date` bigint(20) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `sys_cust_role_cust_id_uindex` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_status`,`role_remarks`,`role_code`,`create_by`,`create_date`,`update_by`,`update_date`) values (1,'admin',0,NULL,'A','admin',1234567890123,'admin',1234567890123);

/*Table structure for table `sys_role_permission` */

DROP TABLE IF EXISTS `sys_role_permission`;

CREATE TABLE `sys_role_permission` (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`role_id`,`permission_id`),
  UNIQUE KEY `sys_role_permission_pk` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限-角色表';

/*Data for the table `sys_role_permission` */

insert  into `sys_role_permission`(`role_id`,`permission_id`) values (1,1);

/*Table structure for table `sys_user_basic` */

DROP TABLE IF EXISTS `sys_user_basic`;

CREATE TABLE `sys_user_basic` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) NOT NULL COMMENT '用户名',
  `user_salt` varchar(32) DEFAULT NULL COMMENT '用户salt',
  `user_pass` varchar(64) NOT NULL COMMENT '密码',
  `nick_name` varchar(64) NOT NULL COMMENT '名称',
  `USER_ICON` varchar(500) DEFAULT NULL COMMENT '头像图片',
  `SEX` char(1) DEFAULT NULL COMMENT '''性别, 1:男，2:女，3：保密''',
  `STAT` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态，0:未激活,1:正常，2:冻结,3:删除',
  `LAST_LOGIN_DATE` bigint(20) NOT NULL COMMENT '最后登录时间',
  `LAST_LOGIN_IP` varchar(64) NOT NULL COMMENT '最后登录的ip\n',
  `IS_DEL` char(1) DEFAULT '0' COMMENT '是否删除 0未删除 1已删除',
  `IS_EMAIL_CONFIRMED` char(1) DEFAULT '0' COMMENT '是否绑定邮箱',
  `IS_PHONE_CONFIRMED` char(1) DEFAULT '0' COMMENT '是否绑定手机',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` bigint(20) NOT NULL COMMENT '注册时间',
  `UPDATE_DATE` bigint(20) DEFAULT NULL COMMENT '修改时间',
  `LOGIN_FAIL_COUNTS` int(11) DEFAULT '0' COMMENT '登录失败次数',
  `EMAIL` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(64) DEFAULT NULL COMMENT '手机号',
  `ROLE_ID` int(11) DEFAULT NULL COMMENT '配置角色code',
  `CUST_NO` varchar(32) DEFAULT NULL COMMENT '角色权限',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `sys_user_basic_user_name_uindex` (`user_name`),
  UNIQUE KEY `sys_user_basic_pk` (`MOBILE`,`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='基础用户表';

/*Data for the table `sys_user_basic` */

insert  into `sys_user_basic`(`user_id`,`user_name`,`user_salt`,`user_pass`,`nick_name`,`USER_ICON`,`SEX`,`STAT`,`LAST_LOGIN_DATE`,`LAST_LOGIN_IP`,`IS_DEL`,`IS_EMAIL_CONFIRMED`,`IS_PHONE_CONFIRMED`,`CREATE_BY`,`CREATE_DATE`,`UPDATE_DATE`,`LOGIN_FAIL_COUNTS`,`EMAIL`,`MOBILE`,`ROLE_ID`,`CUST_NO`) values (1,'fulln','123456','3980e4044675f6339248ee0c735c7d72','fulln','/img/salt','1',1,20181023154538,'192.168.0.100','0','0','0','admin',20181023154626,NULL,1,'2',NULL,1,'A');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
