/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : lrj-project

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-01-11 13:30:27
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_log
-- ----------------------------
INSERT INTO `ly_log` VALUES ('1', 'admin', '系统管理', '用户管理-修改用户', '148', '183.212.229.80', '2016-01-04 15:54:12', '执行成功!');
INSERT INTO `ly_log` VALUES ('2', 'admin', '系统管理', '用户管理/组管理-修改权限', '56', '0:0:0:0:0:0:0:1', '2016-01-07 14:55:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('3', 'admin', '系统管理', '用户管理/组管理-修改权限', '51', '0:0:0:0:0:0:0:1', '2016-01-07 14:58:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('4', 'admin', '系统管理', '用户管理-删除用户', '96', '183.206.172.32', '2016-01-08 09:29:59', '执行成功!');
INSERT INTO `ly_log` VALUES ('5', 'boss1', '系统管理', '用户管理-新增用户', '55', '180.110.134.157', '2016-01-09 14:15:02', '执行成功!');
INSERT INTO `ly_log` VALUES ('6', 'boss1', '系统管理', '用户管理-修改用户', '52', '180.110.134.157', '2016-01-09 14:15:15', '执行成功!');
INSERT INTO `ly_log` VALUES ('7', 'admin', '系统管理', '用户管理-新增用户', '73', '180.110.134.157', '2016-01-09 16:13:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('8', 'admin', '系统管理', '用户管理/组管理-修改权限', '29', '180.110.134.157', '2016-01-09 16:15:14', '执行成功!');
INSERT INTO `ly_log` VALUES ('9', 'admin', '系统管理', '用户管理/组管理-修改权限', '366', '0:0:0:0:0:0:0:1', '2016-01-11 12:58:01', '执行成功!');
INSERT INTO `ly_log` VALUES ('10', 'admin', '系统管理', '用户管理-密码初始化', '8', '0:0:0:0:0:0:0:1', '2016-01-11 13:10:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('11', 'leader', '系统管理', '用户管理-修改密码', '1', '0:0:0:0:0:0:0:1', '2016-01-11 13:11:43', '执行成功!');
INSERT INTO `ly_log` VALUES ('12', 'admin', '系统管理', '用户管理-密码初始化', '3', '0:0:0:0:0:0:0:1', '2016-01-11 13:12:23', '执行成功!');

-- ----------------------------
-- Table structure for `ly_resources`
-- ----------------------------
DROP TABLE IF EXISTS `ly_resources`;
CREATE TABLE `ly_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(4) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ishide` int(3) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_resources
-- ----------------------------
INSERT INTO `ly_resources` VALUES ('1', '系统基础管理', '0', 'system', '0', 'system', '1', 'fa-desktop', '0', '系统基础管理');
INSERT INTO `ly_resources` VALUES ('2', '员工管理', '1', 'account', '1', '/user/list.shtml', '2', null, '0', null);
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
INSERT INTO `ly_resources` VALUES ('34', '分配下属员工', '2', 'user_perss', '2', '', '6', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配下属员工&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('35', '告警列表', '32', 'monitor_warn', '1', '/monitor/list.shtml', null, null, '0', '告警列表');
INSERT INTO `ly_resources` VALUES ('36', '系统功能', '0', 'function', '0', '', '2', 'fa-desktop', '0', null);
INSERT INTO `ly_resources` VALUES ('37', '客户信息', '36', 'customer_list', '1', '/customer/list.shtml', '2', null, '0', null);
INSERT INTO `ly_resources` VALUES ('38', '下属员工', '36', 'lower_user', '1', '/lowuser/list.shtml', '1', null, '0', null);
INSERT INTO `ly_resources` VALUES ('39', '选中导出', '37', 'export_choose', '2', null, '1', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;chooseExport&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;选中导出&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('40', '全部导出', '37', 'export_all', '2', null, '2', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;allExport&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;全部导出&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('41', '客户端', '0', 'download', '0', '', '9', 'fa-desktop', '0', '客户端');
INSERT INTO `ly_resources` VALUES ('42', '客户端下载', '41', 'download_apk', '1', '/download/download.shtml', '1', null, '0', '客户端下载');
INSERT INTO `ly_resources` VALUES ('43', '地图定位', '0', 'map', '0', null, '10', 'fa-desktop', '0', '地图定位');
INSERT INTO `ly_resources` VALUES ('44', '员工定位', '43', 'user_location', '1', '/map/map.shtml', '1', null, '0', '员工定位');
INSERT INTO `ly_resources` VALUES ('46', '密码初始化', '2', 'init_pwd', '2', '/user/initPwd.shtml', '5', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;initPwd&quot;&nbsp;class=&quot;btn&nbsp;btn-warning&nbsp;marR10&quot;&gt;密码初始化&lt;/button&gt;');

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
  `parentId` int(10) DEFAULT NULL COMMENT '父级角色id，用于区分角色层级关系',
  `state` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_role
-- ----------------------------
INSERT INTO `ly_role` VALUES ('1', '-1', '0', '系统管理员', 'admin', '系统管理员');
INSERT INTO `ly_role` VALUES ('4', '5', '0', '业务员', 'salesman', '业务员角色');
INSERT INTO `ly_role` VALUES ('5', '6', '0', '团队长', 'caption', '团队长角色');
INSERT INTO `ly_role` VALUES ('6', '7', '0', '产品总监', 'chief', '产皮总监角色');
INSERT INTO `ly_role` VALUES ('7', '8', '0', '内审', 'innerCheckor', '内审角色');
INSERT INTO `ly_role` VALUES ('8', '0', '0', '总审', 'allCheckor', '总审角色');

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
INSERT INTO `ly_role_res` VALUES ('1', '34');
INSERT INTO `ly_role_res` VALUES ('1', '35');
INSERT INTO `ly_role_res` VALUES ('1', '36');
INSERT INTO `ly_role_res` VALUES ('1', '37');
INSERT INTO `ly_role_res` VALUES ('1', '38');
INSERT INTO `ly_role_res` VALUES ('1', '39');
INSERT INTO `ly_role_res` VALUES ('1', '40');
INSERT INTO `ly_role_res` VALUES ('1', '41');
INSERT INTO `ly_role_res` VALUES ('1', '42');
INSERT INTO `ly_role_res` VALUES ('1', '43');
INSERT INTO `ly_role_res` VALUES ('1', '44');
INSERT INTO `ly_role_res` VALUES ('1', '46');
INSERT INTO `ly_role_res` VALUES ('4', '36');
INSERT INTO `ly_role_res` VALUES ('4', '37');
INSERT INTO `ly_role_res` VALUES ('5', '36');
INSERT INTO `ly_role_res` VALUES ('5', '37');
INSERT INTO `ly_role_res` VALUES ('5', '38');
INSERT INTO `ly_role_res` VALUES ('5', '39');
INSERT INTO `ly_role_res` VALUES ('5', '40');
INSERT INTO `ly_role_res` VALUES ('6', '1');
INSERT INTO `ly_role_res` VALUES ('6', '2');
INSERT INTO `ly_role_res` VALUES ('6', '3');
INSERT INTO `ly_role_res` VALUES ('6', '5');
INSERT INTO `ly_role_res` VALUES ('6', '6');
INSERT INTO `ly_role_res` VALUES ('6', '7');
INSERT INTO `ly_role_res` VALUES ('6', '8');
INSERT INTO `ly_role_res` VALUES ('6', '9');
INSERT INTO `ly_role_res` VALUES ('6', '10');
INSERT INTO `ly_role_res` VALUES ('6', '11');
INSERT INTO `ly_role_res` VALUES ('6', '25');
INSERT INTO `ly_role_res` VALUES ('6', '26');
INSERT INTO `ly_role_res` VALUES ('6', '34');
INSERT INTO `ly_role_res` VALUES ('6', '36');
INSERT INTO `ly_role_res` VALUES ('6', '37');
INSERT INTO `ly_role_res` VALUES ('6', '38');
INSERT INTO `ly_role_res` VALUES ('6', '39');
INSERT INTO `ly_role_res` VALUES ('6', '40');
INSERT INTO `ly_role_res` VALUES ('7', '36');
INSERT INTO `ly_role_res` VALUES ('7', '37');
INSERT INTO `ly_role_res` VALUES ('7', '38');
INSERT INTO `ly_role_res` VALUES ('7', '39');
INSERT INTO `ly_role_res` VALUES ('7', '40');
INSERT INTO `ly_role_res` VALUES ('8', '36');
INSERT INTO `ly_role_res` VALUES ('8', '37');
INSERT INTO `ly_role_res` VALUES ('8', '38');
INSERT INTO `ly_role_res` VALUES ('8', '39');
INSERT INTO `ly_role_res` VALUES ('8', '40');

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
  `region` varchar(10) DEFAULT NULL COMMENT '用户负责的城市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user
-- ----------------------------
INSERT INTO `ly_user` VALUES ('3', '管理员', 'admin', 'a813f2811c43dbc91dad52fb99f954df', '5a8bc6da0ba9ea4dd1066d3f36e828c2', '3434', '0', '2015-12-31 11:35:42', '0', null);
INSERT INTO `ly_user` VALUES ('6', '团队长1', 'leader', 'b630bf43cc2045510b5df27335b7e44d', 'd7d39efacdd11dd527d685de478e9e5a', '', '0', '2016-01-11 13:11:43', '0', '');
INSERT INTO `ly_user` VALUES ('7', '业务员1', 'salesman1', '21940300cf372e0bdeafcd1f065ba33e', 'd278603b0142e42752b7c2f53af84008', null, '0', '2015-12-09 23:47:44', '0', '南京');
INSERT INTO `ly_user` VALUES ('8', '业务员2', 'salesman2', 'e400f0c6173fb88411d20d3a6e64996d', '674237efa5f82bc32726b157268356bf', null, '0', '2015-12-09 23:47:57', '0', '南京');
INSERT INTO `ly_user` VALUES ('9', '业务员3', 'salesman3', 'cdb92205bbd0b5201859d73ee1228b83', '8a48d11f74ea5acb494962ab4e53b28d', null, '0', '2015-12-09 20:57:31', '0', '扬州');
INSERT INTO `ly_user` VALUES ('10', '业务员4', 'salesman4', '22737e5eb23c04cf7e871d5385c17b38', 'ce100b6ba7a20851398397917b438997', null, '0', '2015-12-09 20:57:48', '0', '淮北');
INSERT INTO `ly_user` VALUES ('11', '业务员5', 'salesman5', 'c7d1eecc7f9b3dbaeb7d54f8cb8ff395', 'e4db0905bd5f5dc0793dde49c66b8772', '', '0', '2015-12-09 21:19:17', '0', '');
INSERT INTO `ly_user` VALUES ('12', '业务员6', 'salesman6', '94c3632ab1e9b5abcccf3c2abefb01bd', '5bb1b71cf7973a5f80eb82fab5482d15', null, '0', '2015-12-09 21:06:22', '0', null);
INSERT INTO `ly_user` VALUES ('13', '总审1', 'boss1', '36778364b5f488b79c80f79cf25ff4de', '265bfd1a92957bb21c103359e9ad1117', null, '0', '2015-12-09 22:27:55', '0', null);
INSERT INTO `ly_user` VALUES ('14', '张三', '111111', '6c6771afe176588942a6ae01733abce6', 'b9e6502856fee7cdcda958acf90c58dd', null, '0', '2016-01-09 14:15:15', '0', '南京');
INSERT INTO `ly_user` VALUES ('15', '王武', 'wagnw', 'fdc69764ae1327cdd80c0a113b4a2056', 'e2a92d84f5b63faf03fe7751c411c11d', null, '0', '2016-01-09 16:13:26', '0', '淮北');

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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_userlogin
-- ----------------------------
INSERT INTO `ly_userlogin` VALUES ('1', '13', 'boss1', '2015-12-15 23:11:06', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('2', '13', 'boss1', '2015-12-15 23:13:32', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('3', '13', 'boss1', '2015-12-15 23:26:52', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('4', '13', 'boss1', '2015-12-15 23:29:54', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('5', '13', 'boss1', '2015-12-15 23:36:29', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('6', '13', 'boss1', '2015-12-15 23:59:45', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('7', '13', 'boss1', '2015-12-16 00:01:55', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('8', '13', 'boss1', '2015-12-16 00:03:41', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('9', '13', 'boss1', '2015-12-16 00:04:41', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('10', '13', 'boss1', '2015-12-16 00:05:55', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('11', '13', 'boss1', '2015-12-16 00:08:54', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('12', '13', 'boss1', '2015-12-16 00:14:48', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('13', '13', 'boss1', '2015-12-16 19:23:45', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('14', '13', 'boss1', '2015-12-16 21:20:59', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('15', '13', 'boss1', '2015-12-16 21:30:22', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('16', '13', 'boss1', '2015-12-16 21:32:14', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('17', '13', 'boss1', '2015-12-16 21:33:46', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('18', '13', 'boss1', '2015-12-16 21:49:11', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('19', '3', 'admin', '2015-12-17 22:57:29', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('20', '3', 'admin', '2015-12-17 23:59:58', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('21', '3', 'admin', '2015-12-18 00:21:09', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('22', '3', 'admin', '2015-12-29 20:36:38', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('23', '3', 'admin', '2015-12-29 20:44:56', '183.206.168.1');
INSERT INTO `ly_userlogin` VALUES ('24', '13', 'boss1', '2015-12-29 20:47:14', '183.206.168.1');
INSERT INTO `ly_userlogin` VALUES ('25', '13', 'boss1', '2015-12-30 09:15:45', '183.206.168.1');
INSERT INTO `ly_userlogin` VALUES ('26', '3', 'admin', '2015-12-30 10:37:28', '183.206.171.199');
INSERT INTO `ly_userlogin` VALUES ('27', '13', 'boss1', '2015-12-30 10:37:37', '183.206.171.199');
INSERT INTO `ly_userlogin` VALUES ('28', '6', 'leader', '2015-12-30 10:37:59', '183.206.171.199');
INSERT INTO `ly_userlogin` VALUES ('29', '3', 'admin', '2015-12-30 11:19:19', '183.206.171.199');
INSERT INTO `ly_userlogin` VALUES ('30', '13', 'boss1', '2015-12-30 15:02:29', '183.206.171.199');
INSERT INTO `ly_userlogin` VALUES ('31', '13', 'boss1', '2015-12-31 11:34:45', '183.206.171.199');
INSERT INTO `ly_userlogin` VALUES ('32', '13', 'boss1', '2015-12-31 12:06:07', '183.206.171.199');
INSERT INTO `ly_userlogin` VALUES ('33', '3', 'admin', '2015-12-31 12:30:12', '183.206.171.199');
INSERT INTO `ly_userlogin` VALUES ('34', '3', 'admin', '2016-01-01 10:53:21', '175.188.227.11');
INSERT INTO `ly_userlogin` VALUES ('35', '13', 'boss1', '2016-01-01 10:55:23', '175.188.227.11');
INSERT INTO `ly_userlogin` VALUES ('36', '3', 'admin', '2016-01-01 10:57:29', '175.188.227.11');
INSERT INTO `ly_userlogin` VALUES ('37', '3', 'admin', '2016-01-04 15:19:17', '49.74.94.131');
INSERT INTO `ly_userlogin` VALUES ('38', '13', 'boss1', '2016-01-04 15:20:09', '183.212.229.80');
INSERT INTO `ly_userlogin` VALUES ('39', '13', 'boss1', '2016-01-04 15:20:41', '49.74.94.131');
INSERT INTO `ly_userlogin` VALUES ('40', '13', 'boss1', '2016-01-04 15:38:49', '183.212.229.80');
INSERT INTO `ly_userlogin` VALUES ('41', '3', 'admin', '2016-01-04 15:53:51', '183.212.229.80');
INSERT INTO `ly_userlogin` VALUES ('42', '13', 'boss1', '2016-01-04 15:54:18', '183.212.229.80');
INSERT INTO `ly_userlogin` VALUES ('43', '3', 'admin', '2016-01-04 15:56:56', '183.212.229.80');
INSERT INTO `ly_userlogin` VALUES ('44', '13', 'boss1', '2016-01-04 15:58:37', '180.110.18.224');
INSERT INTO `ly_userlogin` VALUES ('45', '13', 'boss1', '2016-01-04 16:04:08', '180.110.18.224');
INSERT INTO `ly_userlogin` VALUES ('46', '13', 'boss1', '2016-01-04 16:04:36', '180.110.18.224');
INSERT INTO `ly_userlogin` VALUES ('47', '13', 'boss1', '2016-01-04 16:34:50', '180.110.18.224');
INSERT INTO `ly_userlogin` VALUES ('48', '3', 'admin', '2016-01-05 12:27:18', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('49', '13', 'boss1', '2016-01-05 12:45:44', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('50', '13', 'boss1', '2016-01-05 12:47:20', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('51', '13', 'boss1', '2016-01-05 12:51:30', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('52', '13', 'boss1', '2016-01-05 13:09:41', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('53', '13', 'boss1', '2016-01-05 13:54:16', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('54', '8', 'salesman2', '2016-01-05 18:58:16', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('55', '13', 'boss1', '2016-01-05 20:23:20', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('56', '13', 'boss1', '2016-01-05 20:27:14', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('57', '13', 'boss1', '2016-01-06 10:56:17', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('58', '13', 'boss1', '2016-01-06 12:08:36', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('59', '13', 'boss1', '2016-01-06 17:56:45', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('60', '13', 'boss1', '2016-01-06 17:57:32', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('61', '13', 'boss1', '2016-01-06 18:02:55', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('62', '13', 'boss1', '2016-01-06 18:05:18', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('63', '13', 'boss1', '2016-01-06 18:08:09', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('64', '13', 'boss1', '2016-01-06 18:13:16', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('65', '13', 'boss1', '2016-01-06 18:18:25', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('66', '13', 'boss1', '2016-01-06 18:26:03', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('67', '13', 'boss1', '2016-01-06 18:31:22', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('68', '13', 'boss1', '2016-01-06 18:33:51', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('69', '13', 'boss1', '2016-01-06 18:38:37', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('70', '13', 'boss1', '2016-01-06 18:39:56', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('71', '13', 'boss1', '2016-01-06 19:09:57', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('72', '13', 'boss1', '2016-01-06 19:20:30', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('73', '13', 'boss1', '2016-01-06 19:32:43', '183.206.167.114');
INSERT INTO `ly_userlogin` VALUES ('74', '13', 'boss1', '2016-01-07 10:08:33', '183.206.172.32');
INSERT INTO `ly_userlogin` VALUES ('75', '3', 'admin', '2016-01-07 14:55:11', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('76', '3', 'admin', '2016-01-07 14:55:37', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('77', '3', 'admin', '2016-01-07 14:59:00', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('78', '3', 'admin', '2016-01-07 15:06:59', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('79', '3', 'admin', '2016-01-07 16:40:21', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('80', '3', 'admin', '2016-01-07 16:42:49', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('81', '3', 'admin', '2016-01-07 17:33:00', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('82', '3', 'admin', '2016-01-07 17:59:57', '183.206.172.32');
INSERT INTO `ly_userlogin` VALUES ('83', '3', 'admin', '2016-01-07 18:12:41', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('84', '3', 'admin', '2016-01-07 19:16:03', '183.206.172.32');
INSERT INTO `ly_userlogin` VALUES ('85', '3', 'admin', '2016-01-07 19:26:22', '183.206.172.32');
INSERT INTO `ly_userlogin` VALUES ('86', '3', 'admin', '2016-01-08 09:09:11', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('87', '3', 'admin', '2016-01-08 09:15:11', '183.206.172.32');
INSERT INTO `ly_userlogin` VALUES ('88', '3', 'admin', '2016-01-08 09:28:43', '183.206.172.32');
INSERT INTO `ly_userlogin` VALUES ('89', '3', 'admin', '2016-01-09 14:14:13', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('90', '13', 'boss1', '2016-01-09 14:14:34', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('91', '6', 'leader', '2016-01-09 14:15:52', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('92', '3', 'admin', '2016-01-09 14:18:14', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('93', '6', 'leader', '2016-01-09 14:34:25', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('94', '3', 'admin', '2016-01-09 14:35:10', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('95', '6', 'leader', '2016-01-09 14:36:59', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('96', '3', 'admin', '2016-01-09 14:43:34', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('97', '6', 'leader', '2016-01-09 14:48:40', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('98', '6', 'leader', '2016-01-09 15:36:14', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('99', '6', 'leader', '2016-01-09 15:45:36', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('100', '3', 'admin', '2016-01-09 15:48:22', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('101', '6', 'leader', '2016-01-09 15:54:18', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('102', '3', 'admin', '2016-01-09 16:07:27', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('103', '6', 'leader', '2016-01-09 16:08:02', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('104', '3', 'admin', '2016-01-09 16:09:48', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('105', '15', 'wagnw', '2016-01-09 16:16:06', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('106', '3', 'admin', '2016-01-09 16:17:21', '180.110.134.157');
INSERT INTO `ly_userlogin` VALUES ('107', '3', 'admin', '2016-01-10 11:09:08', '218.94.82.99');
INSERT INTO `ly_userlogin` VALUES ('108', '3', 'admin', '2016-01-10 11:09:09', '218.94.82.99');
INSERT INTO `ly_userlogin` VALUES ('109', '13', 'boss1', '2016-01-10 11:17:26', '218.94.82.99');
INSERT INTO `ly_userlogin` VALUES ('110', '6', 'leader', '2016-01-10 11:18:00', '218.94.82.99');
INSERT INTO `ly_userlogin` VALUES ('111', '3', 'admin', '2016-01-11 12:33:15', '183.206.174.204');
INSERT INTO `ly_userlogin` VALUES ('112', '3', 'admin', '2016-01-11 12:40:04', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('113', '3', 'admin', '2016-01-11 12:57:49', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('114', '3', 'admin', '2016-01-11 12:58:10', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('115', '3', 'admin', '2016-01-11 13:06:32', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('116', '3', 'admin', '2016-01-11 13:07:18', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('117', '3', 'admin', '2016-01-11 13:08:23', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('118', '3', 'admin', '2016-01-11 13:09:55', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('119', '6', 'leader', '2016-01-11 13:11:12', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('120', '6', 'leader', '2016-01-11 13:11:29', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('121', '6', 'leader', '2016-01-11 13:11:56', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('122', '3', 'admin', '2016-01-11 13:12:13', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('123', '6', 'leader', '2016-01-11 13:12:33', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('124', '3', 'admin', '2016-01-11 13:12:45', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('125', '6', 'leader', '2016-01-11 13:15:45', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('126', '6', 'leader', '2016-01-11 13:24:57', '0:0:0:0:0:0:0:1');

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
INSERT INTO `ly_user_role` VALUES ('3', '1');
INSERT INTO `ly_user_role` VALUES ('6', '5');
INSERT INTO `ly_user_role` VALUES ('7', '4');
INSERT INTO `ly_user_role` VALUES ('8', '4');
INSERT INTO `ly_user_role` VALUES ('9', '4');
INSERT INTO `ly_user_role` VALUES ('10', '4');
INSERT INTO `ly_user_role` VALUES ('11', '4');
INSERT INTO `ly_user_role` VALUES ('12', '4');
INSERT INTO `ly_user_role` VALUES ('13', '1');
INSERT INTO `ly_user_role` VALUES ('13', '8');
INSERT INTO `ly_user_role` VALUES ('14', '4');
INSERT INTO `ly_user_role` VALUES ('15', '4');

-- ----------------------------
-- Table structure for `tb_customer_basic`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_basic`;
CREATE TABLE `tb_customer_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `idCard` varchar(20) NOT NULL COMMENT '身份证号码',
  `name` varchar(20) DEFAULT NULL COMMENT '客户姓名',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别',
  `age` varchar(20) DEFAULT NULL COMMENT '年龄',
  `national` varchar(20) DEFAULT NULL COMMENT '民族',
  `phoneNumber` varchar(20) NOT NULL COMMENT '手机号码',
  `qqPhone` varchar(20) DEFAULT NULL COMMENT 'qq号码',
  `censusSeat` varchar(255) DEFAULT NULL COMMENT '户籍所在地',
  `parentsSeat` varchar(255) DEFAULT NULL COMMENT '父母所在地',
  `nowliveAddress` varchar(255) DEFAULT NULL COMMENT '现居住地址',
  `unitName` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `unitAddress` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `unitPhone` varchar(20) DEFAULT NULL COMMENT '单位电话',
  `descriPtion` varchar(255) DEFAULT NULL COMMENT '描述信息',
  `workYear` varchar(20) DEFAULT NULL COMMENT '工作年限',
  `commercial` varchar(20) DEFAULT NULL COMMENT '商业保险',
  `nickName` varchar(100) DEFAULT NULL COMMENT '职称',
  `socialYear` varchar(20) DEFAULT NULL COMMENT '社保年限',
  `houserProperty` varchar(20) DEFAULT NULL COMMENT '房产',
  `longLive` varchar(20) DEFAULT NULL COMMENT '长期居住地',
  `annualIncome` varchar(20) DEFAULT NULL COMMENT '年收入',
  `maritalStatus` varchar(20) DEFAULT NULL COMMENT '婚姻状况',
  `cusAge` varchar(20) DEFAULT NULL COMMENT '您的年龄',
  `educationDegree` varchar(20) DEFAULT NULL COMMENT '教育程度',
  `professional` varchar(20) DEFAULT NULL COMMENT '职业',
  `loanRecords` varchar(20) DEFAULT NULL COMMENT '贷款记录',
  `creditCards` varchar(20) DEFAULT NULL COMMENT '信用卡额度',
  `creditReport` varchar(20) DEFAULT NULL COMMENT '征信报告',
  `relativesName` varchar(20) DEFAULT NULL COMMENT '亲属姓名',
  `relativesPhoneNumber` varchar(20) DEFAULT NULL COMMENT '亲属手机',
  `socialFriendsName` varchar(20) DEFAULT NULL COMMENT '社会朋友姓名',
  `socialFriendsPhoneNumber` varchar(20) DEFAULT NULL COMMENT '社会朋友电话',
  `classmatesName` varchar(20) DEFAULT NULL COMMENT '同学姓名',
  `classmatesPhoneNubmer` varchar(20) DEFAULT NULL COMMENT '同学手机号码',
  `colleaguesName` varchar(20) DEFAULT NULL COMMENT '同事姓名',
  `colleaguesPhoneNumber` varchar(20) DEFAULT NULL COMMENT '同事手机号码',
  `simpleFriend` varchar(20) DEFAULT NULL COMMENT '普通朋友姓名',
  `simpleFriendPhoneNumber` varchar(20) DEFAULT NULL COMMENT '普通朋友手机号码',
  `borrowFriendsName` varchar(20) DEFAULT NULL COMMENT '贷友姓名',
  `borrowFriendsPhoneNumber` varchar(20) DEFAULT NULL COMMENT '贷友手机号码',
  `createTime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `updateTime` varchar(32) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customer_basic
-- ----------------------------
INSERT INTO `tb_customer_basic` VALUES ('24', '123456789123456789', '张三', '男', '60岁以上', '汉族', '13585390197', '12646797976764', '江苏', '啊哈哈是', '泯然众人矣', null, null, null, null, '5年以上', '5年以上', '高级管理人员、总公司总经历、中校以上(教授)', '5年以上', '自有未按揭，价值100万元以上(含)', '商业社区', '合计所得24.1-39万元', '已婚有子女', null, '本科', '一般上市公司员工', '5年以上', '60001-20000', '有', '你', '13979794948', '是', '13649797676', '谁', '13679797676', '你', '13131313133', '还', '13797976797', '好', '13527789767', '2016-01-09 14:21:43', '2016-01-09 14:40:16');
INSERT INTO `tb_customer_basic` VALUES ('25', '320322198909041134', '客户', '男', '43-50岁', '汉族', '13062505804', '1069355234', '江苏', '考虑他哦里', '考虑他哦里', '考虑他哦里', '考虑他哦里', '13062505804', '考虑他哦里', '5年以上', '5年以上', '中级管理人员、公司或分公司总经理', '3-5年(含)', '自有未按揭，价值0-100万元(不含)', '商业社区', '合计所得12.1-24万元', '已婚无子女', null, '本科', '优质公用事业单位员工', '5年以上', '3000以下', '有', '测试', '13062505804', '测试2', '13062505804', '测试3', '13062505804', '13062585804', '13062505804', '测试5', '13062505804', '测试5', '13062505804', '2016-01-09 14:30:45', '2016-01-09 14:47:33');

-- ----------------------------
-- Table structure for `tb_customer_loan`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer_loan`;
CREATE TABLE `tb_customer_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `salesman` varchar(20) NOT NULL COMMENT '对应的业务员',
  `idCard` varchar(20) NOT NULL COMMENT '客户身份证号码',
  `createTime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `applyloanKey` varchar(30) DEFAULT NULL COMMENT '标流水号',
  `applyloanBlx` varchar(20) DEFAULT NULL COMMENT '标类型',
  `applyloanJkje` varchar(20) DEFAULT NULL COMMENT '借款金额',
  `applyloanJkqx` varchar(20) DEFAULT NULL COMMENT '借款期限',
  `applyloanZgnll` varchar(20) DEFAULT NULL COMMENT '最高年利率',
  `applyloanHkfs` varchar(20) DEFAULT NULL COMMENT '还宽方式',
  `applyloanJklx` varchar(20) DEFAULT NULL COMMENT '借款类型',
  `applyloanJkQy` varchar(20) DEFAULT NULL COMMENT '借款区域',
  `applyloanJkmd` varchar(255) DEFAULT NULL COMMENT '借款目的',
  `applyloanMsxx` varchar(255) DEFAULT NULL COMMENT '描述信息',
  `applloanlbrs` varchar(255) DEFAULT NULL COMMENT '联保人数',
  `picPath` varchar(255) DEFAULT NULL COMMENT '图片文件服务器路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customer_loan
-- ----------------------------
INSERT INTO `tb_customer_loan` VALUES ('28', '111111', '123456789123456789', '2016-01-09 14:21:43', '20160109142038', '房贷', '1000000000', '一年', '16%', '等额本金', '生意周转', '辽宁', '不一点', '你在说我去洗', null, '/uploadFile/客户_20160109142038');
INSERT INTO `tb_customer_loan` VALUES ('29', 'salesman3', '320322198909041134', '2016-01-09 14:30:45', '20160109142808', '房贷', '10000', '半年', '16%', '等额本金', '个人消费', '江苏', '考虑他哦里', '考虑他哦里', null, '/uploadFile/客户_20160109142808');
INSERT INTO `tb_customer_loan` VALUES ('30', 'admin', '123456789123456789', '2016-01-09 14:33:06', '20160107165659', '房贷', '64979764', '一年', '16%', '等额本金', '翼车贷', '浙江', '不知道', '不想说', null, '/uploadFile/张三_20160107165659');

-- ----------------------------
-- Table structure for `tb_custom_pic`
-- ----------------------------
DROP TABLE IF EXISTS `tb_custom_pic`;
CREATE TABLE `tb_custom_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `filename` varchar(255) DEFAULT NULL COMMENT '文件名',
  `filepath` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `fileleng` int(10) DEFAULT NULL COMMENT '文件大小',
  `filetype` varchar(20) NOT NULL COMMENT '拍照类型',
  `applyloanKey` varchar(20) DEFAULT NULL COMMENT '标流水号',
  `username` varchar(20) NOT NULL COMMENT '业务员帐号',
  `idCard` varchar(20) NOT NULL COMMENT '客户身份证号码',
  `createTime` varchar(32) DEFAULT NULL COMMENT '保存时间(yyyy-MM-dd HH:mm:ss)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_custom_pic
-- ----------------------------
INSERT INTO `tb_custom_pic` VALUES ('116', '20160107165711.jpg', '/uploadFile/张三_20160107165659/房贷/央行征信报告/20160107165711.jpg', '1206725', '央行征信报告', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:33:06');
INSERT INTO `tb_custom_pic` VALUES ('117', '20160107165831.jpg', '/uploadFile/张三_20160107165659/房贷/本人身份证/20160107165831.jpg', '1368646', '本人身份证', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:40:13');
INSERT INTO `tb_custom_pic` VALUES ('118', '20160107165711.jpg', '/uploadFile/张三_20160107165659/房贷/央行征信报告/20160107165711.jpg', '1206725', '央行征信报告', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:40:16');
INSERT INTO `tb_custom_pic` VALUES ('119', '20160109143307.jpg', '/uploadFile/张三_20160107165659/房贷/户口本/20160109143307.jpg', '1388771', '户口本', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:40:18');
INSERT INTO `tb_custom_pic` VALUES ('120', '20160109133006.jpg', '/uploadFile/张三_20160107165659/房贷/亲属身份证/20160109133006.jpg', '1693306', '亲属身份证', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:40:20');
INSERT INTO `tb_custom_pic` VALUES ('121', '20160109143313.jpg', '/uploadFile/张三_20160107165659/房贷/结婚证/20160109143313.jpg', '1351308', '结婚证', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:40:22');
INSERT INTO `tb_custom_pic` VALUES ('122', '20160109143332.jpg', '/uploadFile/张三_20160107165659/房贷/家访记录/20160109143332.jpg', '1343375', '家访记录', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:40:28');
INSERT INTO `tb_custom_pic` VALUES ('123', '20160109143319.jpg', '/uploadFile/张三_20160107165659/房贷/与直系亲属合影照/20160109143319.jpg', '1388452', '与直系亲属合影照', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:40:29');
INSERT INTO `tb_custom_pic` VALUES ('124', '20160109143325.jpg', '/uploadFile/张三_20160107165659/房贷/场所照片/20160109143325.jpg', '1161619', '场所照片', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:40:32');
INSERT INTO `tb_custom_pic` VALUES ('125', '20160109143338.jpg', '/uploadFile/张三_20160107165659/房贷/房产证明及家访照片/20160109143338.jpg', '1359243', '房产证明及家访照片', '20160107165659', 'admin', '123456789123456789', '2016-01-09 14:40:32');
INSERT INTO `tb_custom_pic` VALUES ('126', '20160109142844.jpg', '/uploadFile/客户_20160109142808/房贷/亲属身份证/20160109142844.jpg', '4877572', '亲属身份证', '20160109142808', 'salesman3', '320322198909041134', '2016-01-09 14:47:23');
INSERT INTO `tb_custom_pic` VALUES ('127', '20160109142835.jpg', '/uploadFile/客户_20160109142808/房贷/本人身份证/20160109142835.jpg', '4694448', '本人身份证', '20160109142808', 'salesman3', '320322198909041134', '2016-01-09 14:47:27');
INSERT INTO `tb_custom_pic` VALUES ('128', '20160109142824.jpg', '/uploadFile/客户_20160109142808/房贷/央行征信报告/20160109142824.jpg', '5598427', '央行征信报告', '20160109142808', 'salesman3', '320322198909041134', '2016-01-09 14:47:33');
INSERT INTO `tb_custom_pic` VALUES ('129', '20160109142851.jpg', '/uploadFile/客户_20160109142808/房贷/户口本/20160109142851.jpg', '4813324', '户口本', '20160109142808', 'salesman3', '320322198909041134', '2016-01-09 14:47:52');
INSERT INTO `tb_custom_pic` VALUES ('130', '20160109142906.jpg', '/uploadFile/客户_20160109142808/房贷/与直系亲属合影照/20160109142906.jpg', '4392545', '与直系亲属合影照', '20160109142808', 'salesman3', '320322198909041134', '2016-01-09 14:48:01');
INSERT INTO `tb_custom_pic` VALUES ('131', '20160109142859.jpg', '/uploadFile/客户_20160109142808/房贷/结婚证/20160109142859.jpg', '4448971', '结婚证', '20160109142808', 'salesman3', '320322198909041134', '2016-01-09 14:48:07');
INSERT INTO `tb_custom_pic` VALUES ('132', '20160109142920.jpg', '/uploadFile/客户_20160109142808/房贷/家访记录/20160109142920.jpg', '3908720', '家访记录', '20160109142808', 'salesman3', '320322198909041134', '2016-01-09 14:48:24');
INSERT INTO `tb_custom_pic` VALUES ('133', '20160109142913.jpg', '/uploadFile/客户_20160109142808/房贷/场所照片/20160109142913.jpg', '4367325', '场所照片', '20160109142808', 'salesman3', '320322198909041134', '2016-01-09 14:48:25');
INSERT INTO `tb_custom_pic` VALUES ('134', '20160109142927.jpg', '/uploadFile/客户_20160109142808/房贷/房产证明及家访照片/20160109142927.jpg', '4568793', '房产证明及家访照片', '20160109142808', 'salesman3', '320322198909041134', '2016-01-09 14:48:32');

-- ----------------------------
-- Table structure for `tb_user_location`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_location`;
CREATE TABLE `tb_user_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `accountName` varchar(20) NOT NULL COMMENT '用户帐号',
  `longitude` double(10,4) DEFAULT NULL COMMENT '经度',
  `latitude` double(10,4) DEFAULT NULL COMMENT '纬度',
  `locationTime` varchar(32) NOT NULL COMMENT '定位时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_location
-- ----------------------------
INSERT INTO `tb_user_location` VALUES ('151', 'admin', '118.7207', '32.1313', '2016-01-08 09:29:57');
INSERT INTO `tb_user_location` VALUES ('152', '111111', '118.7919', '32.0480', '2016-01-09 14:15:50');
INSERT INTO `tb_user_location` VALUES ('153', '111111', '118.7918', '32.0481', '2016-01-09 14:16:54');
INSERT INTO `tb_user_location` VALUES ('154', 'admin', '118.7918', '32.0481', '2016-01-09 14:22:52');
INSERT INTO `tb_user_location` VALUES ('155', 'salesman1', '118.7918', '32.0492', '2016-01-09 14:23:38');
INSERT INTO `tb_user_location` VALUES ('156', 'salesman3', '118.7920', '32.0481', '2016-01-09 14:24:13');
INSERT INTO `tb_user_location` VALUES ('157', 'admin', '118.7918', '32.0493', '2016-01-09 14:26:34');
INSERT INTO `tb_user_location` VALUES ('158', 'admin', '118.7918', '32.0492', '2016-01-09 14:27:28');
INSERT INTO `tb_user_location` VALUES ('159', 'admin', '118.7919', '32.0481', '2016-01-09 14:31:04');
INSERT INTO `tb_user_location` VALUES ('160', 'admin', '118.7918', '32.0492', '2016-01-09 14:31:53');
INSERT INTO `tb_user_location` VALUES ('161', 'salesman3', '118.7918', '32.0480', '2016-01-09 14:32:19');
INSERT INTO `tb_user_location` VALUES ('162', 'admin', '118.7920', '32.0480', '2016-01-09 14:40:03');
INSERT INTO `tb_user_location` VALUES ('163', 'salesman2', '118.7919', '32.0483', '2016-01-09 14:46:16');
INSERT INTO `tb_user_location` VALUES ('164', 'salesman3', '118.7920', '32.0482', '2016-01-09 14:46:50');
INSERT INTO `tb_user_location` VALUES ('165', 'admin', '118.7207', '32.1314', '2016-01-09 15:41:05');
INSERT INTO `tb_user_location` VALUES ('166', '111111', '118.7921', '32.0481', '2016-01-09 15:50:31');
INSERT INTO `tb_user_location` VALUES ('167', 'admin', '118.7921', '32.0482', '2016-01-09 15:51:35');
INSERT INTO `tb_user_location` VALUES ('168', 'admin', '118.7874', '32.0388', '2016-01-09 16:03:10');
INSERT INTO `tb_user_location` VALUES ('169', 'admin', '118.7628', '31.9951', '2016-01-09 19:39:55');
INSERT INTO `tb_user_location` VALUES ('170', 'admin', '118.7628', '31.9951', '2016-01-09 19:41:26');
INSERT INTO `tb_user_location` VALUES ('171', 'admin', '118.7628', '31.9951', '2016-01-09 19:42:06');

-- ----------------------------
-- Table structure for `tb_user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_relation`;
CREATE TABLE `tb_user_relation` (
  `user_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父用户',
  `user_child_id` int(11) NOT NULL DEFAULT '0' COMMENT '自用户',
  PRIMARY KEY (`user_parent_id`,`user_child_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_relation
-- ----------------------------
INSERT INTO `tb_user_relation` VALUES ('6', '7');
INSERT INTO `tb_user_relation` VALUES ('6', '8');
INSERT INTO `tb_user_relation` VALUES ('6', '9');
INSERT INTO `tb_user_relation` VALUES ('6', '10');
INSERT INTO `tb_user_relation` VALUES ('6', '14');
INSERT INTO `tb_user_relation` VALUES ('6', '15');
