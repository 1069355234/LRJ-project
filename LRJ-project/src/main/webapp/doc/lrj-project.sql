/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : lrj-project

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-12-09 23:56:57
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
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

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
INSERT INTO `ly_log` VALUES ('142', 'admin', '系统管理', '组管理-新增组', '57', '0:0:0:0:0:0:0:1', '2015-12-06 16:49:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('143', 'admin', '系统管理', '组管理-新增组', '13', '0:0:0:0:0:0:0:1', '2015-12-06 16:52:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('144', 'admin', '系统管理', '组管理-新增组', '134', '0:0:0:0:0:0:0:1', '2015-12-06 17:02:53', '执行成功!');
INSERT INTO `ly_log` VALUES ('145', 'admin', '系统管理', '组管理-新增组', '51', '0:0:0:0:0:0:0:1', '2015-12-06 17:03:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('146', 'admin', '系统管理', '组管理-新增组', '50', '0:0:0:0:0:0:0:1', '2015-12-06 17:04:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('147', 'admin', '系统管理', '组管理-删除组', '40', '0:0:0:0:0:0:0:1', '2015-12-06 17:05:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('148', 'admin', '系统管理', '组管理-删除组', '7', '0:0:0:0:0:0:0:1', '2015-12-06 17:05:18', '执行成功!');
INSERT INTO `ly_log` VALUES ('149', 'admin', '系统管理', '用户管理-新增用户', '35', '0:0:0:0:0:0:0:1', '2015-12-06 17:21:34', '执行成功!');
INSERT INTO `ly_log` VALUES ('150', 'admin', '系统管理', '用户管理-删除用户', '89', '0:0:0:0:0:0:0:1', '2015-12-06 17:23:46', '执行成功!');
INSERT INTO `ly_log` VALUES ('151', 'admin', '系统管理', '用户管理-删除用户', '21', '0:0:0:0:0:0:0:1', '2015-12-06 17:23:50', '执行成功!');
INSERT INTO `ly_log` VALUES ('152', 'admin', '系统管理', '用户管理-修改用户', '18', '0:0:0:0:0:0:0:1', '2015-12-06 17:35:26', '执行成功!');
INSERT INTO `ly_log` VALUES ('153', 'admin', '系统管理', '用户管理/组管理-修改权限', '118', '0:0:0:0:0:0:0:1', '2015-12-08 22:55:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('154', 'admin', '系统管理', '用户管理-修改密码', '26', '0:0:0:0:0:0:0:1', '2015-12-09 14:45:37', '执行成功!');
INSERT INTO `ly_log` VALUES ('155', 'admin', '系统管理', '用户管理-修改密码', '22', '0:0:0:0:0:0:0:1', '2015-12-09 14:46:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('156', 'admin', '系统管理', '用户管理/组管理-修改权限', '58', '0:0:0:0:0:0:0:1', '2015-12-09 16:46:11', '执行成功!');
INSERT INTO `ly_log` VALUES ('157', 'admin', '系统管理', '用户管理-新增用户', '16', '0:0:0:0:0:0:0:1', '2015-12-09 17:24:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('158', 'admin', '系统管理', '用户管理-新增用户', '20', '0:0:0:0:0:0:0:1', '2015-12-09 17:25:19', '执行成功!');
INSERT INTO `ly_log` VALUES ('159', 'admin', '系统管理', '用户管理-新增用户', '97', '0:0:0:0:0:0:0:1', '2015-12-09 20:22:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('160', 'admin', '系统管理', '用户管理-新增用户', '102', '0:0:0:0:0:0:0:1', '2015-12-09 20:57:31', '执行成功!');
INSERT INTO `ly_log` VALUES ('161', 'admin', '系统管理', '用户管理-新增用户', '45', '0:0:0:0:0:0:0:1', '2015-12-09 20:57:48', '执行成功!');
INSERT INTO `ly_log` VALUES ('162', 'admin', '系统管理', '用户管理-新增用户', '158', '0:0:0:0:0:0:0:1', '2015-12-09 21:05:40', '执行成功!');
INSERT INTO `ly_log` VALUES ('163', 'admin', '系统管理', '用户管理-新增用户', '167', '0:0:0:0:0:0:0:1', '2015-12-09 21:06:22', '执行成功!');
INSERT INTO `ly_log` VALUES ('164', 'admin', '系统管理', '用户管理-修改用户', '111', '0:0:0:0:0:0:0:1', '2015-12-09 21:08:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('165', 'admin', '系统管理', '用户管理-修改用户', '10', '0:0:0:0:0:0:0:1', '2015-12-09 21:09:54', '执行成功!');
INSERT INTO `ly_log` VALUES ('166', 'admin', '系统管理', '用户管理-修改用户', '52', '0:0:0:0:0:0:0:1', '2015-12-09 21:12:57', '执行成功!');
INSERT INTO `ly_log` VALUES ('167', 'admin', '系统管理', '用户管理-修改用户', '112179', '0:0:0:0:0:0:0:1', '2015-12-09 21:15:13', '执行成功!');
INSERT INTO `ly_log` VALUES ('168', 'admin', '系统管理', '用户管理-修改用户', '22603', '0:0:0:0:0:0:0:1', '2015-12-09 21:16:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('169', 'admin', '系统管理', '用户管理-修改用户', '129465', '0:0:0:0:0:0:0:1', '2015-12-09 21:18:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('170', 'admin', '系统管理', '用户管理-修改用户', '8', '0:0:0:0:0:0:0:1', '2015-12-09 21:19:17', '执行成功!');
INSERT INTO `ly_log` VALUES ('171', 'admin', '系统管理', '用户管理/组管理-修改权限', '93', '0:0:0:0:0:0:0:1', '2015-12-09 21:46:05', '执行成功!');
INSERT INTO `ly_log` VALUES ('172', 'admin', '系统管理', '用户管理-修改用户', '99', '0:0:0:0:0:0:0:1', '2015-12-09 22:24:49', '执行成功!');
INSERT INTO `ly_log` VALUES ('173', 'leader', '系统管理', '用户管理/组管理-修改权限', '46', '0:0:0:0:0:0:0:1', '2015-12-09 22:26:23', '执行成功!');
INSERT INTO `ly_log` VALUES ('174', 'leader', '系统管理', '用户管理-修改用户', '58', '0:0:0:0:0:0:0:1', '2015-12-09 22:26:38', '执行成功!');
INSERT INTO `ly_log` VALUES ('175', 'leader', '系统管理', '用户管理/组管理-修改权限', '27', '0:0:0:0:0:0:0:1', '2015-12-09 22:27:29', '执行成功!');
INSERT INTO `ly_log` VALUES ('176', 'leader', '系统管理', '用户管理-新增用户', '149', '0:0:0:0:0:0:0:1', '2015-12-09 22:27:55', '执行成功!');

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

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
INSERT INTO `ly_resources` VALUES ('34', '分配下属员工', '2', 'user_perss', '2', '', '6', null, '0', '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配下属员工&lt;/button&gt;');
INSERT INTO `ly_resources` VALUES ('35', '告警列表', '32', 'monitor_warn', '1', '/monitor/list.shtml', null, null, '0', '告警列表');
INSERT INTO `ly_resources` VALUES ('36', '系统功能', '0', 'function', '0', '', '2', 'fa-desktop', '0', null);
INSERT INTO `ly_resources` VALUES ('37', '客户信息', '36', 'customer_list', '1', '/customer/list.shtml', '2', null, '0', null);
INSERT INTO `ly_resources` VALUES ('38', '下属员工', '36', 'lower_user', '1', '/lowuser/list.shtml', '1', null, '0', null);

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
INSERT INTO `ly_role_res` VALUES ('5', '1');
INSERT INTO `ly_role_res` VALUES ('5', '2');
INSERT INTO `ly_role_res` VALUES ('5', '3');
INSERT INTO `ly_role_res` VALUES ('5', '4');
INSERT INTO `ly_role_res` VALUES ('5', '5');
INSERT INTO `ly_role_res` VALUES ('5', '6');
INSERT INTO `ly_role_res` VALUES ('5', '7');
INSERT INTO `ly_role_res` VALUES ('5', '8');
INSERT INTO `ly_role_res` VALUES ('5', '9');
INSERT INTO `ly_role_res` VALUES ('5', '10');
INSERT INTO `ly_role_res` VALUES ('5', '11');
INSERT INTO `ly_role_res` VALUES ('5', '25');
INSERT INTO `ly_role_res` VALUES ('5', '26');
INSERT INTO `ly_role_res` VALUES ('5', '27');
INSERT INTO `ly_role_res` VALUES ('5', '28');
INSERT INTO `ly_role_res` VALUES ('5', '29');
INSERT INTO `ly_role_res` VALUES ('5', '30');
INSERT INTO `ly_role_res` VALUES ('5', '31');
INSERT INTO `ly_role_res` VALUES ('5', '32');
INSERT INTO `ly_role_res` VALUES ('5', '33');
INSERT INTO `ly_role_res` VALUES ('5', '34');
INSERT INTO `ly_role_res` VALUES ('5', '35');
INSERT INTO `ly_role_res` VALUES ('5', '36');
INSERT INTO `ly_role_res` VALUES ('5', '37');
INSERT INTO `ly_role_res` VALUES ('5', '38');
INSERT INTO `ly_role_res` VALUES ('8', '1');
INSERT INTO `ly_role_res` VALUES ('8', '2');
INSERT INTO `ly_role_res` VALUES ('8', '3');
INSERT INTO `ly_role_res` VALUES ('8', '4');
INSERT INTO `ly_role_res` VALUES ('8', '5');
INSERT INTO `ly_role_res` VALUES ('8', '6');
INSERT INTO `ly_role_res` VALUES ('8', '7');
INSERT INTO `ly_role_res` VALUES ('8', '8');
INSERT INTO `ly_role_res` VALUES ('8', '9');
INSERT INTO `ly_role_res` VALUES ('8', '10');
INSERT INTO `ly_role_res` VALUES ('8', '11');
INSERT INTO `ly_role_res` VALUES ('8', '25');
INSERT INTO `ly_role_res` VALUES ('8', '26');
INSERT INTO `ly_role_res` VALUES ('8', '27');
INSERT INTO `ly_role_res` VALUES ('8', '28');
INSERT INTO `ly_role_res` VALUES ('8', '29');
INSERT INTO `ly_role_res` VALUES ('8', '30');
INSERT INTO `ly_role_res` VALUES ('8', '31');
INSERT INTO `ly_role_res` VALUES ('8', '32');
INSERT INTO `ly_role_res` VALUES ('8', '33');
INSERT INTO `ly_role_res` VALUES ('8', '34');
INSERT INTO `ly_role_res` VALUES ('8', '35');
INSERT INTO `ly_role_res` VALUES ('8', '36');
INSERT INTO `ly_role_res` VALUES ('8', '37');
INSERT INTO `ly_role_res` VALUES ('8', '38');

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
  `longitude` double(10,4) DEFAULT NULL COMMENT '用户所在经度',
  `latitude` double(10,4) DEFAULT NULL COMMENT '用户所在纬度',
  `locationTime` varchar(32) DEFAULT NULL COMMENT '定位时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ly_user
-- ----------------------------
INSERT INTO `ly_user` VALUES ('3', '管理员', 'admin', 'a813f2811c43dbc91dad52fb99f954df', '5a8bc6da0ba9ea4dd1066d3f36e828c2', '3434', '1', '2015-12-09 14:46:29', '0', null, null, null, null);
INSERT INTO `ly_user` VALUES ('4', 'zhangdf', 'zhangdf', '6ed1a356109c8cbd8cea1b476d5c610b', '5b44bfbe41d192ac387b5b32fabcce12', null, '0', '2015-12-05 14:52:19', '0', null, null, null, null);
INSERT INTO `ly_user` VALUES ('5', 'test', 'test', '304a462e232bb2ea5d75fe6c8f06755c', '3e0b8c9a05c6e0b06fa132e3070ac8fa', null, '0', '2015-12-06 17:35:25', '0', '扬州', null, null, null);
INSERT INTO `ly_user` VALUES ('6', '团队长1', 'leader', '3f2fc54551271bbd89cfcf9071a346f8', '35ced4c52f0b896c7c0c9488ee62c732', '', '0', '2015-12-09 23:44:19', '0', '', '117.0000', '34.0000', null);
INSERT INTO `ly_user` VALUES ('7', '业务员1', 'salesman1', '21940300cf372e0bdeafcd1f065ba33e', 'd278603b0142e42752b7c2f53af84008', null, '0', '2015-12-09 23:47:44', '0', '南京', '118.1100', '34.2300', null);
INSERT INTO `ly_user` VALUES ('8', '业务员2', 'salesman2', 'e400f0c6173fb88411d20d3a6e64996d', '674237efa5f82bc32726b157268356bf', null, '0', '2015-12-09 23:47:57', '0', '南京', '120.2100', '30.2000', null);
INSERT INTO `ly_user` VALUES ('9', '业务员3', 'salesman3', 'cdb92205bbd0b5201859d73ee1228b83', '8a48d11f74ea5acb494962ab4e53b28d', null, '0', '2015-12-09 20:57:31', '0', '扬州', null, null, null);
INSERT INTO `ly_user` VALUES ('10', '业务员4', 'salesman4', '22737e5eb23c04cf7e871d5385c17b38', 'ce100b6ba7a20851398397917b438997', null, '0', '2015-12-09 20:57:48', '0', '淮北', null, null, null);
INSERT INTO `ly_user` VALUES ('11', '业务员5', 'salesman5', 'c7d1eecc7f9b3dbaeb7d54f8cb8ff395', 'e4db0905bd5f5dc0793dde49c66b8772', '', '0', '2015-12-09 21:19:17', '0', '', null, null, null);
INSERT INTO `ly_user` VALUES ('12', '业务员6', 'salesman6', '94c3632ab1e9b5abcccf3c2abefb01bd', '5bb1b71cf7973a5f80eb82fab5482d15', null, '0', '2015-12-09 21:06:22', '0', null, null, null, null);
INSERT INTO `ly_user` VALUES ('13', '总审1', 'boss1', '36778364b5f488b79c80f79cf25ff4de', '265bfd1a92957bb21c103359e9ad1117', null, '0', '2015-12-09 22:27:55', '0', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8;

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
INSERT INTO `ly_userlogin` VALUES ('171', '4', 'zhangdf', '2015-12-06 11:46:04', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('172', '4', 'zhangdf', '2015-12-06 13:49:20', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('173', '4', 'zhangdf', '2015-12-06 13:54:35', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('174', '4', 'zhangdf', '2015-12-06 13:56:29', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('175', '4', 'zhangdf', '2015-12-06 14:11:44', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('176', '3', 'admin', '2015-12-06 14:12:36', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('177', '3', 'admin', '2015-12-06 16:48:09', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('178', '3', 'admin', '2015-12-06 17:20:43', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('179', '3', 'admin', '2015-12-06 17:23:30', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('180', '3', 'admin', '2015-12-08 22:39:51', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('181', '3', 'admin', '2015-12-08 22:52:13', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('182', '3', 'admin', '2015-12-08 22:56:01', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('183', '3', 'admin', '2015-12-08 23:20:56', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('184', '3', 'admin', '2015-12-08 23:51:11', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('185', '3', 'admin', '2015-12-09 12:25:19', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('186', '3', 'admin', '2015-12-09 12:33:33', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('187', '3', 'admin', '2015-12-09 12:39:27', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('188', '3', 'admin', '2015-12-09 14:45:17', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('189', '3', 'admin', '2015-12-09 14:45:45', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('190', '3', 'admin', '2015-12-09 14:46:14', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('191', '3', 'admin', '2015-12-09 14:54:14', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('192', '3', 'admin', '2015-12-09 15:00:48', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('193', '3', 'admin', '2015-12-09 15:37:26', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('194', '3', 'admin', '2015-12-09 16:45:55', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('195', '3', 'admin', '2015-12-09 16:46:19', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('196', '3', 'admin', '2015-12-09 16:56:23', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('197', '3', 'admin', '2015-12-09 17:04:53', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('198', '3', 'admin', '2015-12-09 17:23:30', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('199', '3', 'admin', '2015-12-09 17:27:50', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('200', '3', 'admin', '2015-12-09 19:15:35', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('201', '3', 'admin', '2015-12-09 19:28:01', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('202', '3', 'admin', '2015-12-09 19:29:48', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('203', '3', 'admin', '2015-12-09 19:36:49', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('204', '3', 'admin', '2015-12-09 19:42:59', '192.168.1.102');
INSERT INTO `ly_userlogin` VALUES ('205', '3', 'admin', '2015-12-09 19:48:22', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('206', '3', 'admin', '2015-12-09 19:55:36', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('207', '3', 'admin', '2015-12-09 19:58:17', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('208', '3', 'admin', '2015-12-09 20:00:46', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('209', '3', 'admin', '2015-12-09 20:03:34', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('210', '3', 'admin', '2015-12-09 20:05:43', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('211', '3', 'admin', '2015-12-09 20:10:04', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('212', '3', 'admin', '2015-12-09 20:15:03', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('213', '3', 'admin', '2015-12-09 20:37:14', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('214', '3', 'admin', '2015-12-09 20:42:03', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('215', '3', 'admin', '2015-12-09 20:45:04', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('216', '3', 'admin', '2015-12-09 20:54:05', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('217', '3', 'admin', '2015-12-09 20:54:40', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('218', '3', 'admin', '2015-12-09 20:56:18', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('219', '3', 'admin', '2015-12-09 21:12:48', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('220', '3', 'admin', '2015-12-09 21:19:03', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('221', '3', 'admin', '2015-12-09 21:41:15', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('222', '3', 'admin', '2015-12-09 21:46:16', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('223', '3', 'admin', '2015-12-09 22:19:32', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('224', '3', 'admin', '2015-12-09 22:23:06', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('225', '6', 'leader', '2015-12-09 22:24:18', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('226', '3', 'admin', '2015-12-09 22:24:28', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('227', '6', 'leader', '2015-12-09 22:25:17', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('228', '13', 'boss1', '2015-12-09 22:28:30', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('229', '13', 'boss1', '2015-12-09 22:45:36', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('230', '13', 'boss1', '2015-12-09 22:54:28', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('231', '13', 'boss1', '2015-12-09 23:07:09', '0:0:0:0:0:0:0:1');
INSERT INTO `ly_userlogin` VALUES ('232', '13', 'boss1', '2015-12-09 23:43:41', '0:0:0:0:0:0:0:1');

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
INSERT INTO `ly_user_role` VALUES ('4', '1');
INSERT INTO `ly_user_role` VALUES ('5', '1');
INSERT INTO `ly_user_role` VALUES ('6', '5');
INSERT INTO `ly_user_role` VALUES ('7', '4');
INSERT INTO `ly_user_role` VALUES ('8', '4');
INSERT INTO `ly_user_role` VALUES ('9', '4');
INSERT INTO `ly_user_role` VALUES ('10', '4');
INSERT INTO `ly_user_role` VALUES ('11', '4');
INSERT INTO `ly_user_role` VALUES ('12', '4');
INSERT INTO `ly_user_role` VALUES ('13', '8');

-- ----------------------------
-- Table structure for `tb_customer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `customer_id` int(11) unsigned zerofill NOT NULL COMMENT '主键',
  `customer_name` varchar(20) DEFAULT NULL COMMENT '客户名称',
  `customer_phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `customer_card` varchar(20) DEFAULT NULL COMMENT '身份证号码',
  `customer_sex` int(1) DEFAULT NULL COMMENT '性别 0-女 1-男',
  `customer_company_phone` varchar(15) DEFAULT NULL COMMENT '单位电话',
  `customer_company_name` varchar(255) DEFAULT NULL COMMENT '单位名称',
  `customer_age` varchar(4) DEFAULT NULL COMMENT '年龄外键',
  `customer_home_phone` varchar(15) DEFAULT NULL COMMENT '家庭电话',
  `customer_company_add` varchar(255) DEFAULT NULL COMMENT '单位地址',
  `customer_nation` varchar(11) DEFAULT NULL COMMENT '民族外键',
  `customer_email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `customer_now_address` varchar(255) DEFAULT NULL COMMENT '现居住地',
  `customer_region` varchar(11) DEFAULT NULL COMMENT '户籍外键',
  `customer_qq` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `customer_parent_address` varchar(255) DEFAULT NULL COMMENT '父母所在地',
  `customer_job_type` varchar(255) DEFAULT NULL COMMENT '从事行业外键',
  `customer_self_des` varchar(255) DEFAULT NULL COMMENT '个人描述',
  `customer_risk_type` varchar(50) DEFAULT NULL COMMENT '风险类别',
  `customer_work_years` varchar(50) DEFAULT NULL COMMENT '工作年限',
  `customer_insurance` varchar(10) DEFAULT NULL COMMENT '是否有商业保险 0-没有 1-有',
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
  `product_name` varchar(20) DEFAULT NULL COMMENT '客户选择的项目名称',
  `customer_time` varchar(32) DEFAULT NULL COMMENT '客户创建时间',
  `employee_id` int(11) DEFAULT NULL COMMENT '所属员工编号',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_customer
-- ----------------------------
INSERT INTO `tb_customer` VALUES ('00000000001', '张三', null, null, '1', null, null, '24', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '翼龙贷', '2015-12-08', '1');

-- ----------------------------
-- Table structure for `tb_custom_pic`
-- ----------------------------
DROP TABLE IF EXISTS `tb_custom_pic`;
CREATE TABLE `tb_custom_pic` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片编号',
  `customer_pic_type` varchar(11) DEFAULT NULL COMMENT '所属材料外键',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片保存路径(相对路径)，多个路径用逗号隔开',
  `pic_time` varchar(32) DEFAULT NULL COMMENT '保存时间(yyyy-MM-dd HH:mm:ss)',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_custom_pic
-- ----------------------------

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
