/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3307
Source Database       : esdb

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-19 17:36:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `emp`
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `salary` float NOT NULL,
  `designation` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '児童 1', '1', '3 - 1');
INSERT INTO `emp` VALUES ('2', '児童 2', '1', '3 - 1');
INSERT INTO `emp` VALUES ('3', '児童 3', '1', '3 - 1');
INSERT INTO `emp` VALUES ('4', '児童 4', '1', '3 - 1');
INSERT INTO `emp` VALUES ('5', '児童 5', '1', '3 - 1');
INSERT INTO `emp` VALUES ('6', '児童 6', '1', '3 - 1');
INSERT INTO `emp` VALUES ('7', '児童 7', '1', '3 - 1');
INSERT INTO `emp` VALUES ('8', '児童 8', '1', '3 - 1');
INSERT INTO `emp` VALUES ('9', '児童 9', '1', '3 - 1');
INSERT INTO `emp` VALUES ('10', '児童 10', '1', '3 - 1');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuId` int(1) NOT NULL AUTO_INCREMENT COMMENT 'menu id',
  `menuName` varchar(20) DEFAULT NULL COMMENT 'This is display menu name in the screen',
  `siteUrl` varchar(100) DEFAULT NULL COMMENT 'has rule to access url',
  `delFlag` int(1) NOT NULL COMMENT '1:true  0:false',
  `parentId` int(1) DEFAULT NULL,
  `menuIcon` varchar(50) DEFAULT NULL COMMENT 'page show''s icon picture',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '用户管理', '/user', '0', null, 'fa-odnoklassniki');
INSERT INTO `menu` VALUES ('2', '查看用户', '/user/review', '0', '1', 'fa-odnoklassniki-square');
INSERT INTO `menu` VALUES ('3', '建议意见', '/user/command', '0', '1', 'fa-commenting');
INSERT INTO `menu` VALUES ('4', '儿童管理', '/learner-springmvc-mybatis/children', '0', null, 'fa-meh-o');
INSERT INTO `menu` VALUES ('5', '婴儿期', '/children/baby', '0', '4', 'fa-male');
INSERT INTO `menu` VALUES ('6', '儿童期', '/children/sone', '0', '4', 'fa-magic');
INSERT INTO `menu` VALUES ('7', '菜单管理', '/systemInfo', '0', null, 'fa-bars');
INSERT INTO `menu` VALUES ('8', '菜单信息', '/learner-springmvc-mybatis/systemInfo/init', '0', '7', 'fa-bar-chart');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(500) NOT NULL,
  `realName` varchar(50) DEFAULT NULL,
  `delFlag` int(1) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '$2a$10$rCutIB8gsFWayMS1h9bUxetu83VlwFFB8BpdBIIVm1kdY39xwFWOy', 'Victor.Xue', '0');
