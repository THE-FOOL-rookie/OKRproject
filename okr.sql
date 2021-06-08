/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : okr

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-05-20 20:15:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for okr_admin
-- ----------------------------
DROP TABLE IF EXISTS `okr_admin`;
CREATE TABLE `okr_admin` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(50) NOT NULL COMMENT '账户',
  `password` char(32) NOT NULL COMMENT '密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 2关闭',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='后台管理员';

-- ----------------------------
-- Records of okr_admin
-- ----------------------------
INSERT INTO `okr_admin` VALUES ('1', 'liuzhuoxin', 'e10adc3949ba59abbe56e057f20f883e', '刘卓欣', '1', '1620063489');
INSERT INTO `okr_admin` VALUES ('2', 'lijiaxuan', 'e10adc3949ba59abbe56e057f20f883e', '李佳萱', '1', '1620063489');
INSERT INTO `okr_admin` VALUES ('3', 'tengchangyuanlang', 'e10adc3949ba59abbe56e057f20f883e', '藤常元烺', '1', '1620063489');

-- ----------------------------
-- Table structure for okr_cat
-- ----------------------------
DROP TABLE IF EXISTS `okr_cat`;
CREATE TABLE `okr_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) NOT NULL COMMENT '分类名',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 2关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='分类表';

-- ----------------------------
-- Records of okr_cat
-- ----------------------------
INSERT INTO `okr_cat` VALUES ('1', '公司', '1');
INSERT INTO `okr_cat` VALUES ('2', '部门', '1');
INSERT INTO `okr_cat` VALUES ('3', '团队', '1');
INSERT INTO `okr_cat` VALUES ('4', '个人', '1');

-- ----------------------------
-- Table structure for okr_lists
-- ----------------------------
DROP TABLE IF EXISTS `okr_lists`;
CREATE TABLE `okr_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT ' OKR_ID',
  `cat` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '分类',
  `title` varchar(200) NOT NULL COMMENT 'OKR',
  `supervisor` varchar(200) NOT NULL COMMENT '负责人',
  `layer` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '重要性',
  `confidence` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '信心',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 2关闭 3删除',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='OKR列表';

-- ----------------------------
-- Records of okr_lists
-- ----------------------------
INSERT INTO `okr_lists` VALUES ('1', '1', '根据需求文档完善Demo', '李 藤', '1', '1111', '1', '1620063489');
INSERT INTO `okr_lists` VALUES ('2', '1', '开始进行WEB开发', '刘', '2', '1111', '1', '1620163489');

-- ----------------------------
-- Table structure for okr_menu
-- ----------------------------
DROP TABLE IF EXISTS `okr_menu`;
CREATE TABLE `okr_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `fid` int(10) NOT NULL COMMENT '父ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 2关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='左侧菜单表';

-- ----------------------------
-- Records of okr_menu
-- ----------------------------
INSERT INTO `okr_menu` VALUES ('1', '个人信息', '0', '1');
INSERT INTO `okr_menu` VALUES ('2', '详细资料', '1', '1');
INSERT INTO `okr_menu` VALUES ('3', '私人OKR', '0', '1');
INSERT INTO `okr_menu` VALUES ('4', '制定OKR', '3', '1');
INSERT INTO `okr_menu` VALUES ('5', '修改内容', '3', '1');
INSERT INTO `okr_menu` VALUES ('6', '更新进度', '3', '1');
INSERT INTO `okr_menu` VALUES ('7', '动态追踪', '3', '1');
INSERT INTO `okr_menu` VALUES ('8', '目标树', '3', '1');
INSERT INTO `okr_menu` VALUES ('9', '公司OKR', '0', '1');
INSERT INTO `okr_menu` VALUES ('10', '制定与审核', '9', '1');
INSERT INTO `okr_menu` VALUES ('11', '修改与投票', '9', '1');
INSERT INTO `okr_menu` VALUES ('12', '更新与评分', '9', '1');
INSERT INTO `okr_menu` VALUES ('13', '动态追踪', '9', '1');
INSERT INTO `okr_menu` VALUES ('14', '目标树', '9', '1');

-- ----------------------------
-- Table structure for shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT ' 商品ID',
  `cat` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '分类ID',
  `title` varchar(200) NOT NULL COMMENT 'OKR',
  `price` varchar(10) NOT NULL COMMENT '负责人',
  `discount` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '重要性',
  `stock` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '信心',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1开启 2关闭 3删除',
  `add_time` date NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

-- ----------------------------
-- Records of shop_goods
-- ----------------------------
INSERT INTO `shop_goods` VALUES ('22', '3', '根据需求文档完善Demo', '李滕小分队', '8', '8', '1', '2021-05-01');
INSERT INTO `shop_goods` VALUES ('23', '4', '开始进行WEB开发', '刘卓欣', '8', '6', '1', '2021-05-05');
INSERT INTO `shop_goods` VALUES ('25', '2', '准备第二次中期汇报', '学生团队', '7', '9', '1', '2021-05-13');
INSERT INTO `shop_goods` VALUES ('20', '2', '准备第一次中期汇报', '学生团队', '7', '9', '0', '2021-04-10');
INSERT INTO `shop_goods` VALUES ('21', '1', '合同签订', '三方', '10', '10', '0', '2021-04-17');
INSERT INTO `shop_goods` VALUES ('24', '2', '完成需求文档', '学生团队', '10', '8', '0', '2021-05-07');
INSERT INTO `shop_goods` VALUES ('27', '4', '添加管理员表单', '刘卓欣', '1', '10', '0', '2021-05-12');
INSERT INTO `shop_goods` VALUES ('29', '2', '前后端业务代码', '学生团队', '10', '5', '1', '2021-05-12');
INSERT INTO `shop_goods` VALUES ('31', '3', '完善表单数据结构', '刘滕小分队', '9', '4', '1', '2021-05-13');
