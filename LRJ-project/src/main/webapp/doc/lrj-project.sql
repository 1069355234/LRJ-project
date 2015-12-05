/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : lrj-project

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-12-05 16:01:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ly_buttom`
-- ----------------------------
DROP TABLE IF EXISTS `ly_buttom`;
CREATE TABLE `ly_buttom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `buttom` varchar(200) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_buttom
-- ----------------------------
INSERT INTO `ly_buttom` VALUES ('1', '新增', '<button type=\"button\" id=\"addFun\" class=\"btn btn-primary marR10\">新增</button>', '');
INSERT INTO `ly_buttom` VALUES ('2', '编辑', '<button type=\"button\" id=\"editFun\" class=\"btn btn-info marR10\">编辑</button>', null);
INSERT INTO `ly_buttom` VALUES ('3', '删除', '<button type=\"button\" id=\"delFun\" class=\"btn btn-danger marR10\">删除</button>', null);
INSERT INTO `ly_buttom` VALUES ('4', '上传', '<button type=\"button\" id=\"upLoad\" class=\"btn btn-primary marR10\">上传</button>', null);
INSERT INTO `ly_buttom` VALUES ('5', '下载', '<button type=\"button\" id=\"downLoad\" class=\"btn btn-primary marR10\">下载</button>', null);
INSERT INTO `ly_buttom` VALUES ('6', '上移', '<button type=\"button\" id=\"lyGridUp\" class=\"btn btn-success marR10\">上移</button>', null);
INSERT INTO `ly_buttom` VALUES ('7', '下移', '<button type=\"button\" id=\"lyGridDown\" class=\"btn btn btn-grey marR10\">下移</button>', null);
INSERT INTO `ly_buttom` VALUES ('8', '分配权限', '<button type=\"button\" id=\"permissions\" class=\"btn btn btn-grey marR10\">分配权限</button>', null);

-- ----------------------------
-- Table structure for `ly_log`
-- ----------------------------
DROP TABLE IF EXISTS `ly_log`;
CREATE TABLE `ly_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(30) DEFAULT NULL,
  `module` varchar(30) DEFAULT NULL,
  `methods` varchar(30) DEFAULT NULL,
  `actionTime` varchar(30) DEFAULT NULL,
  `userIP` varchar(30) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_log
-- ----------------------------
INSERT INTO `ly_log` VALUES ('135', 'admin', '系统管理', '用户管理/组管理-修改权限', '59', '192.168.20.119', '2015-12-04 17:15:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('136', 'admin', '系统管理', '用户管理/组管理-修改权限', '33', '0:0:0:0:0:0:0:1', '2015-12-05 13:09:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('137', 'admin', '系统管理', '用户管理-修改用户', '9', '0:0:0:0:0:0:0:1', '2015-12-05 13:16:08', '执行成功!');
INSERT INTO `ly_log` VALUES ('138', 'admin', '系统管理', '组管理-修改组', '40', '0:0:0:0:0:0:0:1', '2015-12-05 14:32:35', '执行成功!');
INSERT INTO `ly_log` VALUES ('139', 'admin', '系统管理', '组管理-修改组', '51', '0:0:0:0:0:0:0:1', '2015-12-05 14:32:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('140', 'admin', '系统管理', '用户管理/组管理-修改权限', '138', '0:0:0:0:0:0:0:1', '2015-12-05 14:33:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('141', 'admin', '系统管理', '用户管理-新增用户', '99', '0:0:0:0:0:0:0:1', '2015-12-05 14:52:20', '执行成功!');

-- ----------------------------
-- Table structure for `ly_resources`
-- ----------------------------
DROP TABLE IF EXISTS `ly_resources`;
CREATE TABLE `ly_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(4) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ishide` int(3) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_resources
-- ----------------------------
INSERT INTO `ly_resources` VALUES ('1', '系统基础管理', '0', 'system', '0', 'system', '1', 'fa-desktop', '0', '系统基础管理');
INSERT INTO `ly_resources` VALUES ('2', '用户管理', '1', 'account', '1', '/user/list.shtml', '2', null, '0', null);
INSERT INTO `ly_resources` VALUES ('3', '角色管理', '1', 'role', '1', '/role/list.shtml', '7', 'fa-list', '0', '组管理');
INSERT INTO `ly_resources` VALUES ('4', '菜单管理', '1', 'ly_resources', '1', '/resources/list.shtml', '12', 'fa-list-alt', '0', '菜单管理');
INSERT INTO `ly_resources` VALUES ('5', '新增用户', '2', 'account_add', '2', '/user/addUI.shtml', '3', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('6', '修改用户', '2', 'account_edit', '2', '/user/editUI.shtml', '4', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('7', '删除用户', '2', 'account_delete', '2', '/user/deleteById.shtml', '5', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delAccount&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('8', '新增角色', '3', 'role_add', '2', '/role/addUI.shtml', '8', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addRole&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('9', '修改角色', '3', 'role_edit', '2', '/role/editUI.shtml', '9', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editRole&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('10', '删除角色', '3', 'role_delete', '2', '/role/delete.shtml', '10', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delRole&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('11', '分配权限', '3', 'role_perss', '2', '/resources/permissions.shtml', '11', '无', '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('25', '登陆信息管理', '0', 'ly_login', '0', 'ly_login', '18', 'fa-calendar', '0', '登陆信息管理');
INSERT INTO `ly_resources` VALUES ('26', '用户登录记录', '25', 'ly_log_list', '1', '/userlogin/listUI.shtml', '19', null, '0', '用户登录记录');
INSERT INTO `ly_resources` VALUES ('27', '操作日志管理', '0', 'ly_log', '0', 'ly_log', '20', 'fa-picture-o', '1', '操作日志管理');
INSERT INTO `ly_resources` VALUES ('28', '日志查询', '27', 'ly_log', '1', '/log/list.shtml', '21', null, '0', null);
INSERT INTO `ly_resources` VALUES ('29', '新增菜单资源', '4', 'ly_resources_add', '2', '/resources/addUI.shtml', '13', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('30', '修改菜单资源', '4', 'ly_resources_edit', '2', '/resources/editUI.shtml', '14', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('31', '删除菜单资源', '4', 'ly_resources_delete', '2', '/resources/delete.shtml', '15', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('32', '系统监控管理', '0', 'monitor', '0', 'monitor', '16', 'fa-tag', '0', '系统监控管理');
INSERT INTO `ly_resources` VALUES ('33', '实时监控', '32', 'sysmonitor', '1', '/monitor/monitor.shtml', '17', null, '0', '实时监控');
INSERT INTO `ly_resources` VALUES ('35', '告警列表', '32', 'monitor_warn', '1', '/monitor/list.shtml', null, null, '0', '告警列表');

-- ----------------------------
-- Table structure for `ly_res_user`
-- ----------------------------
DROP TABLE IF EXISTS `ly_res_user`;
CREATE TABLE `ly_res_user` (
  `resId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_res_user
-- ----------------------------
INSERT INTO `ly_res_user` VALUES ('1', '3');
INSERT INTO `ly_res_user` VALUES ('2', '3');
INSERT INTO `ly_res_user` VALUES ('3', '3');
INSERT INTO `ly_res_user` VALUES ('5', '3');
INSERT INTO `ly_res_user` VALUES ('6', '3');
INSERT INTO `ly_res_user` VALUES ('7', '3');
INSERT INTO `ly_res_user` VALUES ('8', '3');
INSERT INTO `ly_res_user` VALUES ('9', '3');
INSERT INTO `ly_res_user` VALUES ('10', '3');
INSERT INTO `ly_res_user` VALUES ('11', '3');
INSERT INTO `ly_res_user` VALUES ('25', '3');
INSERT INTO `ly_res_user` VALUES ('26', '3');
INSERT INTO `ly_res_user` VALUES ('27', '3');
INSERT INTO `ly_res_user` VALUES ('28', '3');
INSERT INTO `ly_res_user` VALUES ('32', '3');
INSERT INTO `ly_res_user` VALUES ('33', '3');
INSERT INTO `ly_res_user` VALUES ('34', '3');
INSERT INTO `ly_res_user` VALUES ('35', '3');

-- ----------------------------
-- Table structure for `ly_role`
-- ----------------------------
DROP TABLE IF EXISTS `ly_role`;
CREATE TABLE `ly_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `state` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_role
-- ----------------------------
INSERT INTO `ly_role` VALUES ('1', '0', '系统管理员', 'admin', '系统管理员');
INSERT INTO `ly_role` VALUES ('2', '0', '普通角色', 'simple', '普通角色');
INSERT INTO `ly_role` VALUES ('3', '0', '总经理', 'SUPER', '总经理');

-- ----------------------------
-- Table structure for `ly_role_res`
-- ----------------------------
DROP TABLE IF EXISTS `ly_role_res`;
CREATE TABLE `ly_role_res` (
  `role_id` int(10) NOT NULL COMMENT '角色外键',
  `res_id` int(11) NOT NULL COMMENT '资源外键',
  PRIMARY KEY (`role_id`,`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_role_res
-- ----------------------------
INSERT INTO `ly_role_res` VALUES ('1', '1');
INSERT INTO `ly_role_res` VALUES ('1', '2');
INSERT INTO `ly_role_res` VALUES ('1', '3');
INSERT INTO `ly_role_res` VALUES ('1', '4');
INSERT INTO `ly_role_res` VALUES ('1', '5');
INSERT INTO `ly_role_res` VALUES ('1', '6');
INSERT INTO `ly_role_res` VALUES ('1', '7');
INSERT INTO `ly_role_res` VALUES ('1', '8');
INSERT INTO `ly_role_res` VALUES ('1', '9');
INSERT INTO `ly_role_res` VALUES ('1', '10');
INSERT INTO `ly_role_res` VALUES ('1', '11');
INSERT INTO `ly_role_res` VALUES ('1', '25');
INSERT INTO `ly_role_res` VALUES ('1', '26');
INSERT INTO `ly_role_res` VALUES ('1', '27');
INSERT INTO `ly_role_res` VALUES ('1', '28');
INSERT INTO `ly_role_res` VALUES ('1', '29');
INSERT INTO `ly_role_res` VALUES ('1', '30');
INSERT INTO `ly_role_res` VALUES ('1', '31');
INSERT INTO `ly_role_res` VALUES ('1', '32');
INSERT INTO `ly_role_res` VALUES ('1', '33');
INSERT INTO `ly_role_res` VALUES ('1', '35');

-- ----------------------------
-- Table structure for `ly_server_info`
-- ----------------------------
DROP TABLE IF EXISTS `ly_server_info`;
CREATE TABLE `ly_server_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `setCpuUsage` varchar(255) DEFAULT NULL,
  `jvmUsage` varchar(255) DEFAULT NULL,
  `setJvmUsage` varchar(255) DEFAULT NULL,
  `ramUsage` varchar(255) DEFAULT NULL,
  `setRamUsage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_server_info
-- ----------------------------
INSERT INTO `ly_server_info` VALUES ('5', '18', '40', '49', '40', '71', '40', '121261494@qq.com', '2015-04-25 18:07:02', '<font color=\"red\">JVM当前：49%,超出预设值 40%<br>内存当前：71%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('6', '3', '40', '50', '40', '71', '40', '121261494@qq.com', '2015-04-25 18:08:03', '<font color=\"red\">JVM当前：50%,超出预设值 40%<br>内存当前：71%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('7', '5', '40', '50', '40', '70', '40', '121261494@qq.com', '2015-04-25 18:09:02', '<font color=\"red\">JVM当前：50%,超出预设值 40%<br>内存当前：70%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('8', '5', '40', '52', '40', '69', '40', '121261494@qq.com', '2015-04-25 18:10:03', '<font color=\"red\">JVM当前：52%,超出预设值 40%<br>内存当前：69%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('9', '2', '40', '52', '40', '68', '40', '121261494@qq.com', '2015-04-25 18:11:02', '<font color=\"red\">JVM当前：52%,超出预设值 40%<br>内存当前：68%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('10', '7', '40', '53', '40', '67', '40', '121261494@qq.com', '2015-04-25 18:12:02', '<font color=\"red\">JVM当前：53%,超出预设值 40%<br>内存当前：67%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('11', '5', '40', '54', '40', '67', '40', '121261494@qq.com', '2015-04-25 18:13:02', '<font color=\"red\">JVM当前：54%,超出预设值 40%<br>内存当前：67%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('12', '16', '40', '55', '40', '66', '40', '121261494@qq.com', '2015-04-25 18:14:02', '<font color=\"red\">JVM当前：55%,超出预设值 40%<br>内存当前：66%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('13', '5', '40', '56', '40', '65', '40', '121261494@qq.com', '2015-04-25 18:15:02', '<font color=\"red\">JVM当前：56%,超出预设值 40%<br>内存当前：65%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('14', '8', '40', '57', '40', '64', '40', '121261494@qq.com', '2015-04-25 18:16:02', '<font color=\"red\">JVM当前：57%,超出预设值 40%<br>内存当前：64%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('15', '3', '40', '58', '40', '63', '40', '121261494@qq.com', '2015-04-25 18:17:02', '<font color=\"red\">JVM当前：58%,超出预设值 40%<br>内存当前：63%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('16', '6', '40', '59', '40', '62', '40', '121261494@qq.com', '2015-04-25 18:18:03', '<font color=\"red\">JVM当前：59%,超出预设值 40%<br>内存当前：62%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('17', '1', '40', '60', '40', '61', '40', '121261494@qq.com', '2015-04-25 18:19:02', '<font color=\"red\">JVM当前：60%,超出预设值 40%<br>内存当前：61%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('18', '5', '40', '61', '40', '61', '40', '121261494@qq.com', '2015-04-25 18:20:02', '<font color=\"red\">JVM当前：61%,超出预设值 40%<br>内存当前：61%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('19', '5', '40', '38', '40', '61', '40', '121261494@qq.com', '2015-04-25 18:21:02', '<font color=\"red\">内存当前：61%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('20', '5', '40', '39', '40', '60', '40', '121261494@qq.com', '2015-04-25 18:22:02', '<font color=\"red\">内存当前：60%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('21', '4', '40', '40', '40', '59', '40', '121261494@qq.com', '2015-04-25 18:23:02', '<font color=\"red\">内存当前：59%,超出预设值  40%</font>');
INSERT INTO `ly_server_info` VALUES ('22', '32', '80', '41', '80', '81', '80', '121261494@qq.com', '2015-04-26 01:43:05', '<font color=\"red\">内存当前：81%,超出预设值  80%</font>');
INSERT INTO `ly_server_info` VALUES ('23', '55', '80', '55', '80', '81', '80', '121261494@qq.com', '2015-04-26 01:50:03', '<font color=\"red\">内存当前：81%,超出预设值  80%</font>');
INSERT INTO `ly_server_info` VALUES ('24', '13', '80', '53', '80', '81', '80', '121261494@qq.com', '2015-04-26 01:59:08', '<font color=\"red\">内存当前：81%,超出预设值  80%</font>');
INSERT INTO `ly_server_info` VALUES ('25', '85', '80', '58', '80', '72', '80', '121261494@qq.com', '2015-04-26 02:46:06', '<font color=\"red\">CPU当前：85%,超出预设值  80%<br></font>');
INSERT INTO `ly_server_info` VALUES ('26', '34', '80', '59', '80', '81', '80', '121261494@qq.com', '2015-04-27 00:29:06', '<font color=\"red\">内存当前：81%,超出预设值  80%</font>');
INSERT INTO `ly_server_info` VALUES ('27', '92', '80', '47', '80', '64', '80', '121261494@qq.com', '2015-04-27 00:44:07', '<font color=\"red\">CPU当前：92%,超出预设值  80%<br></font>');
INSERT INTO `ly_server_info` VALUES ('28', '85', '80', '49', '80', '68', '80', '121261494@qq.com', '2015-04-27 23:38:04', '<font color=\"red\">CPU当前：85%,超出预设值  80%<br></font>');
INSERT INTO `ly_server_info` VALUES ('29', '94', '80', '69', '80', '73', '80', '121261494@qq.com', '2015-04-28 01:35:03', '<font color=\"red\">CPU当前：94%,超出预设值  80%<br></font>');
INSERT INTO `ly_server_info` VALUES ('30', '6', '80', '43', '80', '87', '80', '121261494@qq.com', '2015-05-09 00:00:08', '<font color=\"red\">内存当前：87%,超出预设值  80%</font>');
INSERT INTO `ly_server_info` VALUES ('31', '88', '80', '59', '80', '87', '80', '121261494@qq.com', '2015-05-09 00:01:14', '<font color=\"red\">CPU当前：88%,超出预设值  80%<br>内存当前：87%,超出预设值  80%</font>');

-- ----------------------------
-- Table structure for `ly_user`
-- ----------------------------
DROP TABLE IF EXISTS `ly_user`;
CREATE TABLE `ly_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `credentialsSalt` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `locked` varchar(3) DEFAULT '0',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deletestatus` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除',
  `region_id` int(11) DEFAULT NULL COMMENT '区域外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user
-- ----------------------------
INSERT INTO `ly_user` VALUES ('1', '蓝缘', 'simple', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '0', '1', '2015-05-17 22:23:15', '0', null);
INSERT INTO `ly_user` VALUES ('2', '超级管理员', 'ROOT', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '0000', '1', '2015-05-23 17:39:37', '0', null);
INSERT INTO `ly_user` VALUES ('3', '管理员', 'admin', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', '3434', '1', '2015-05-23 17:39:39', '0', null);
INSERT INTO `ly_user` VALUES ('4', 'zhangdf', 'zhangdf', '6ed1a356109c8cbd8cea1b476d5c610b', '5b44bfbe41d192ac387b5b32fabcce12', null, '0', '2015-12-05 14:52:19', '0', null);

-- ----------------------------
-- Table structure for `ly_userlogin`
-- ----------------------------
DROP TABLE IF EXISTS `ly_userlogin`;
CREATE TABLE `ly_userlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginIP` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_loginlist` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_userlogin
-- ----------------------------
INSERT INTO `ly_userlogin` VALUES ('143', '3', 'admin', '2015-12-04 10:00:04', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('144', '3', 'admin', '2015-12-04 10:12:20', '192.168.20.158');
INSERT INTO `ly_userlogin` VALUES ('145', '3', 'admin', '2015-12-04 10:48:00', '192.168.20.119');
INSERT INTO `ly_userlogin` VALUES ('146', '3', 'admin', '2015-12-04 15:13:42', '192.168.20.119');
INSERT INTO `ly_userlogin` VALUES ('147', '3', 'admin', '2015-12-04 16:44:25', '192.168.20.119');
INSERT INTO `ly_userlogin` VALUES ('148', '3', 'admin', '2015-12-04 16:45:11', '192.168.20.119');
INSERT INTO `ly_userlogin` VALUES ('149', '3', 'admin', '2015-12-04 17:10:48', '192.168.20.119');
INSERT INTO `ly_userlogin` VALUES ('150', '3', 'admin', '2015-12-04 17:12:11', '192.168.20.119');
INSERT INTO `ly_userlogin` VALUES ('151', '3', 'admin', '2015-12-04 17:16:18', '192.168.20.119');
INSERT INTO `ly_userlogin` VALUES ('152', '3', 'admin', '2015-12-05 13:05:28', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('153', '3', 'admin', '2015-12-05 13:09:28', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('154', '3', 'admin', '2015-12-05 13:15:59', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('155', '3', 'admin', '2015-12-05 13:24:52', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('156', '3', 'admin', '2015-12-05 13:25:17', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('157', '3', 'admin', '2015-12-05 14:18:19', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('158', '3', 'admin', '2015-12-05 14:19:32', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('159', '3', 'admin', '2015-12-05 14:21:12', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('160', '3', 'admin', '2015-12-05 14:22:14', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('161', '3', 'admin', '2015-12-05 14:22:46', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('162', '3', 'admin', '2015-12-05 14:24:45', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('163', '3', 'admin', '2015-12-05 14:26:25', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('164', '3', 'admin', '2015-12-05 14:27:21', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('165', '3', 'admin', '2015-12-05 14:28:41', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('166', '3', 'admin', '2015-12-05 14:29:27', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('167', '3', 'admin', '2015-12-05 14:31:55', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('168', '3', 'admin', '2015-12-05 14:33:29', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('169', '4', 'zhangdf', '2015-12-05 14:52:36', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('170', '4', 'zhangdf', '2015-12-05 14:55:39', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for `ly_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `ly_user_role`;
CREATE TABLE `ly_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user_role
-- ----------------------------
INSERT INTO `ly_user_role` VALUES ('1', '1');
INSERT INTO `ly_user_role` VALUES ('1', '2');
INSERT INTO `ly_user_role` VALUES ('2', '3');
INSERT INTO `ly_user_role` VALUES ('3', '1');
INSERT INTO `ly_user_role` VALUES ('4', '1');

-- ----------------------------
-- Table structure for `tb_customer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `customer_id` int(11) NOT NULL COMMENT '主键',
  `customer_name` varchar(20) DEFAULT NULL COMMENT '客户名称',
  `customer_phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `customer_card` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `customer_sex` int(1) DEFAULT NULL COMMENT '性别 0-女 1-男',
  `customer_company_phone` varchar(15) DEFAULT NULL COMMENT '单位电话',
  `customer_company_name` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `customer_age` int(4) DEFAULT NULL COMMENT '年龄',
  `customer_home_phone` varchar(15) DEFAULT NULL COMMENT '家庭电话',
  `customer_company_add` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `customer_nation` int(11) DEFAULT NULL COMMENT '民族外键',
  `customer_email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `customer_now_address` varchar(255) DEFAULT NULL COMMENT '现居住地',
  `customer_region_id` int(11) DEFAULT NULL COMMENT '户籍外键',
  `customer_qq` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `customer_parent_address` varchar(255) DEFAULT NULL COMMENT '父母所在地',
  `customer_industry` varchar(255) DEFAULT NULL COMMENT '从事行业',
  `customer_self_des` varchar(255) DEFAULT NULL COMMENT '个人描述',
  `customer_risk_type` varchar(50) DEFAULT NULL COMMENT '风险类别',
  `customer_work_years` varchar(50) DEFAULT NULL COMMENT '工作年限',
  `customer_insurance` tinyint(1) DEFAULT NULL COMMENT '是否有商业保险 0-没有 1-有',
  `customer_profession` varchar(100) DEFAULT NULL COMMENT '职称',
  `customer_social_age` varchar(50) DEFAULT NULL COMMENT '社保年限',
  `customer_long_term_home` varchar(50) DEFAULT NULL COMMENT '长期居住地',
  `customer_house_property` varchar(100) DEFAULT NULL COMMENT '房产',
  `customer_marital_status` varchar(50) DEFAULT NULL COMMENT '婚姻状况',
  `customer_annual_income` varchar(50) DEFAULT NULL COMMENT '年收入',
  `customer_education_level` varchar(20) DEFAULT NULL COMMENT '教育程度',
  `customer_loan_record` varchar(50) DEFAULT NULL COMMENT '贷款记录',
  `customer_credit_card` varchar(50) DEFAULT NULL COMMENT '信用卡额度',
  `customer_job` varchar(50) DEFAULT NULL COMMENT '职业',
  `customer_photo` varchar(100) DEFAULT NULL COMMENT '客户头像',
  `customer_family_name` varchar(10) DEFAULT NULL COMMENT '亲人名称',
  `customer_family_phone` varchar(20) DEFAULT NULL COMMENT '亲人电话',
  `customer_social_name` varchar(10) DEFAULT NULL COMMENT '社会朋友名称',
  `customer_social_phone` varchar(20) DEFAULT NULL COMMENT '社会朋友电话',
  `customer_classmate_name` varchar(10) DEFAULT NULL COMMENT '同学名称',
  `customer_classmate_phone` varchar(20) DEFAULT NULL COMMENT '同学电话',
  `customer_workmate_name` varchar(10) DEFAULT NULL COMMENT '同事名称',
  `customer_workmate_phone` varchar(20) DEFAULT NULL COMMENT '同事电话',
  `customer_normal_friend` varchar(10) DEFAULT NULL COMMENT '普通朋友名称',
  `customer_normal_phone` varchar(20) DEFAULT NULL COMMENT '普通朋友电话',
  `customer_loan_name` varchar(10) DEFAULT NULL COMMENT '贷友名称',
  `customer_loan_phone` varchar(20) DEFAULT NULL COMMENT '贷友电话',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_custom_pic`
-- ----------------------------
DROP TABLE IF EXISTS `tb_custom_pic`;
CREATE TABLE `tb_custom_pic` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `materials_id` int(11) DEFAULT NULL COMMENT '所属材料外键',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片保存路径(相对路径)，多个路径用逗号隔开',
  `pic_time` varchar(32) DEFAULT NULL COMMENT '保存时间(yyyy-MM-dd HH:mm:ss)',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_custom_pic
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_materials`
-- ----------------------------
DROP TABLE IF EXISTS `tb_materials`;
CREATE TABLE `tb_materials` (
  `materials_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借款材料类型编号',
  `materials_name` varchar(255) NOT NULL COMMENT '借款材料类型名称',
  `product_id` int(11) NOT NULL COMMENT '借款材料所属产品的类型',
  `materials_type` varchar(10) NOT NULL COMMENT '材料类型（系统、标记、普通、提现、可选）',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户外键',
  `user_id` int(11) DEFAULT NULL COMMENT '员工外键',
  PRIMARY KEY (`materials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_materials
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_nation`
-- ----------------------------
DROP TABLE IF EXISTS `tb_nation`;
CREATE TABLE `tb_nation` (
  `nation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '民族编号',
  `nation_name` varchar(255) NOT NULL COMMENT '民族名称',
  PRIMARY KEY (`nation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_nation
-- ----------------------------
INSERT INTO `tb_nation` VALUES ('1', '汉族');
INSERT INTO `tb_nation` VALUES ('2', '蒙古族');
INSERT INTO `tb_nation` VALUES ('3', '回族');
INSERT INTO `tb_nation` VALUES ('4', '藏族');
INSERT INTO `tb_nation` VALUES ('5', '维吾尔族');
INSERT INTO `tb_nation` VALUES ('6', '苗族');
INSERT INTO `tb_nation` VALUES ('7', '彝族');
INSERT INTO `tb_nation` VALUES ('8', '壮族');
INSERT INTO `tb_nation` VALUES ('9', '布依族');
INSERT INTO `tb_nation` VALUES ('10', '朝鲜族');
INSERT INTO `tb_nation` VALUES ('11', '满族');
INSERT INTO `tb_nation` VALUES ('12', '侗族');
INSERT INTO `tb_nation` VALUES ('13', '瑶族');
INSERT INTO `tb_nation` VALUES ('14', '白族');
INSERT INTO `tb_nation` VALUES ('15', '土家族');
INSERT INTO `tb_nation` VALUES ('16', '哈尼族');
INSERT INTO `tb_nation` VALUES ('17', '哈萨克族');
INSERT INTO `tb_nation` VALUES ('18', '傣族');
INSERT INTO `tb_nation` VALUES ('19', '黎族');
INSERT INTO `tb_nation` VALUES ('20', '傈僳族');
INSERT INTO `tb_nation` VALUES ('21', '佤族');
INSERT INTO `tb_nation` VALUES ('22', '畲族');
INSERT INTO `tb_nation` VALUES ('23', '高山族');
INSERT INTO `tb_nation` VALUES ('24', '拉祜族');
INSERT INTO `tb_nation` VALUES ('25', '水族');
INSERT INTO `tb_nation` VALUES ('26', '东乡族');
INSERT INTO `tb_nation` VALUES ('27', '纳西族');
INSERT INTO `tb_nation` VALUES ('28', '景颇族');
INSERT INTO `tb_nation` VALUES ('29', '柯尔克孜族');
INSERT INTO `tb_nation` VALUES ('30', '土族');
INSERT INTO `tb_nation` VALUES ('31', '布朗族');
INSERT INTO `tb_nation` VALUES ('32', '撒拉族');
INSERT INTO `tb_nation` VALUES ('33', '阿昌族');
INSERT INTO `tb_nation` VALUES ('34', '乌孜别克族');
INSERT INTO `tb_nation` VALUES ('35', '鄂温克族');
INSERT INTO `tb_nation` VALUES ('36', '仫佬族');
INSERT INTO `tb_nation` VALUES ('37', '毛难族');
INSERT INTO `tb_nation` VALUES ('38', '普米族');
INSERT INTO `tb_nation` VALUES ('39', '怒族');
INSERT INTO `tb_nation` VALUES ('40', '崩龙族');
INSERT INTO `tb_nation` VALUES ('41', '保安族');
INSERT INTO `tb_nation` VALUES ('42', '塔塔尔族');
INSERT INTO `tb_nation` VALUES ('43', '鄂伦春族');
INSERT INTO `tb_nation` VALUES ('44', '赫哲族');
INSERT INTO `tb_nation` VALUES ('45', '珞巴族');
INSERT INTO `tb_nation` VALUES ('46', '达斡尔族');
INSERT INTO `tb_nation` VALUES ('47', '仡佬族');
INSERT INTO `tb_nation` VALUES ('48', '锡伯族');
INSERT INTO `tb_nation` VALUES ('49', '塔吉克族');
INSERT INTO `tb_nation` VALUES ('50', '俄罗斯族');
INSERT INTO `tb_nation` VALUES ('51', '裕固族');
INSERT INTO `tb_nation` VALUES ('52', '京族');
INSERT INTO `tb_nation` VALUES ('53', '独龙族');
INSERT INTO `tb_nation` VALUES ('54', '门巴族');
INSERT INTO `tb_nation` VALUES ('55', '基诺族');
INSERT INTO `tb_nation` VALUES ('56', '羌族');

-- ----------------------------
-- Table structure for `tb_product`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `product_name` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `company_id` int(11) DEFAULT NULL COMMENT '归属那个公司的产品',
  `product_des` varchar(1024) DEFAULT NULL COMMENT '产品描述',
  `product_enable` tinyint(1) DEFAULT NULL COMMENT '产品是否可用 0-不可用 1-可用',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_region`
-- ----------------------------
DROP TABLE IF EXISTS `tb_region`;
CREATE TABLE `tb_region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区编号',
  `region_name` varchar(20) NOT NULL COMMENT '区域名称',
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_region
-- ----------------------------
INSERT INTO `tb_region` VALUES ('1', '北京市');
INSERT INTO `tb_region` VALUES ('2', '天津市');
INSERT INTO `tb_region` VALUES ('3', '上海市');
INSERT INTO `tb_region` VALUES ('4', '重庆市');
INSERT INTO `tb_region` VALUES ('5', '河北省');
INSERT INTO `tb_region` VALUES ('6', '山西省');
INSERT INTO `tb_region` VALUES ('7', '台湾省');
INSERT INTO `tb_region` VALUES ('8', '辽宁省');
INSERT INTO `tb_region` VALUES ('9', '吉林省');
INSERT INTO `tb_region` VALUES ('10', '黑龙江省');
INSERT INTO `tb_region` VALUES ('11', '江苏省');
INSERT INTO `tb_region` VALUES ('12', '浙江省');
INSERT INTO `tb_region` VALUES ('13', '安徽省');
INSERT INTO `tb_region` VALUES ('14', '福建省');
INSERT INTO `tb_region` VALUES ('15', '江西省');
INSERT INTO `tb_region` VALUES ('16', '山东省');
INSERT INTO `tb_region` VALUES ('17', '河南省');
INSERT INTO `tb_region` VALUES ('18', '湖北省');
INSERT INTO `tb_region` VALUES ('19', '湖南省');
INSERT INTO `tb_region` VALUES ('20', '广东省');
INSERT INTO `tb_region` VALUES ('21', '甘肃省');
INSERT INTO `tb_region` VALUES ('22', '四川省');
INSERT INTO `tb_region` VALUES ('23', '贵州省');
INSERT INTO `tb_region` VALUES ('24', '海南省');
INSERT INTO `tb_region` VALUES ('25', '云南省');
INSERT INTO `tb_region` VALUES ('26', '青海省');
INSERT INTO `tb_region` VALUES ('27', '陕西省');
INSERT INTO `tb_region` VALUES ('28', '广西壮族自治区');
INSERT INTO `tb_region` VALUES ('29', '西藏自治区');
INSERT INTO `tb_region` VALUES ('30', '宁夏回族自治区');
INSERT INTO `tb_region` VALUES ('31', '新疆维吾尔自治区');
INSERT INTO `tb_region` VALUES ('32', '内蒙古自治区');
INSERT INTO `tb_region` VALUES ('33', '澳门特别行政区');
INSERT INTO `tb_region` VALUES ('34', '香港特别行政区');
