/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : draw

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-12-02 16:59:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `drawhistory`
-- ----------------------------
DROP TABLE IF EXISTS `drawhistory`;
CREATE TABLE `drawhistory` (
  `dh_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lottery_id` smallint(10) unsigned NOT NULL COMMENT '彩种ID',
  `issue` varchar(20) NOT NULL COMMENT '奖期号',
  `ds_id` smallint(5) unsigned NOT NULL COMMENT '号源ID',
  `rank` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '权重',
  `errno` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '错误码',
  `number` varchar(60) NOT NULL COMMENT '抓取的开奖号码',
  `retry` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '重试次数',
  `spent` float unsigned NOT NULL DEFAULT '0' COMMENT '抓号过程耗时(秒)',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`dh_id`),
  UNIQUE KEY `lotteryid__issue__sourceid` (`lottery_id`,`issue`,`ds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='抓号历史记录';

-- ----------------------------
-- Records of drawhistory
-- ----------------------------

-- ----------------------------
-- Table structure for `drawsources`
-- ----------------------------
DROP TABLE IF EXISTS `drawsources`;
CREATE TABLE `drawsources` (
  `ds_id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `lottery_id` smallint(5) unsigned NOT NULL COMMENT '彩种ID',
  `name` char(30) NOT NULL COMMENT '网站说明',
  `url` varchar(1024) NOT NULL COMMENT 'url ',
  `interface` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '接口是否已完成[0:未完成,1:已完成]',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '权重值',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0禁用1启用',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '入加日期',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`ds_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='开奖源';

-- ----------------------------
-- Records of drawsources
-- ----------------------------
INSERT INTO `drawsources` VALUES ('1', '1', '时时彩网_CQSSC', 'http://www.shishicai.cn/cqssc/', '1', '100', '0', '2012-11-02 15:05:16', '2015-09-10 00:50:05');
INSERT INTO `drawsources` VALUES ('2', '1', '彩乐乐_CQSSC', 'http://www.cailele.com/static/ssc/newlyopenlist.xml', '1', '50', '0', '2012-11-02 15:05:50', '2015-09-10 00:50:16');
INSERT INTO `drawsources` VALUES ('3', '1', '彩票直通车_CQSSC', 'http://tools.ecp888.com/lottery/ssc/cq/new.shtml?playStr=zh', '0', '50', '0', '2012-12-11 12:14:09', '2015-09-07 22:43:58');
INSERT INTO `drawsources` VALUES ('4', '2', '时时彩网_SD11Y', 'http://www.shishicai.cn/sd11x5/', '1', '100', '0', '2013-01-11 10:51:15', '2015-10-15 17:22:19');
INSERT INTO `drawsources` VALUES ('5', '3', '第一彩（原名彩视界）', 'http://goucai.caishijie.com/lottery/ssc/index.jsp', '1', '100', '1', '2013-08-02 10:59:08', '2013-08-02 10:59:08');
INSERT INTO `drawsources` VALUES ('6', '4', '新疆官网_XJSSC', 'http://www.xjflcp.com/ssc/', '1', '120', '0', '2013-08-02 10:59:32', '2015-11-09 16:57:42');
INSERT INTO `drawsources` VALUES ('7', '2', '彩乐乐_SD11Y', 'http://www.cailele.com/static/11yun/newlyopenlist.html', '1', '50', '0', '2013-12-15 14:17:46', '2015-09-10 01:28:23');
INSERT INTO `drawsources` VALUES ('8', '5', '时时彩网_CQ115', 'http://www.shishicai.cn/cq11x5/', '1', '105', '0', '2013-12-15 15:35:39', '2015-09-10 02:20:46');
INSERT INTO `drawsources` VALUES ('9', '5', '彩乐乐_CQ115', 'http://www.cailele.com/static/cq11x5/newlyopenlist.html', '1', '100', '0', '2013-12-15 15:35:58', '2015-09-10 02:21:26');
INSERT INTO `drawsources` VALUES ('10', '6', '时时彩网_JX115', 'http://www.shishicai.cn/jx11x5/', '1', '100', '0', '2013-12-17 10:34:18', '2015-09-10 01:31:21');
INSERT INTO `drawsources` VALUES ('11', '6', '彩乐乐_JX115', 'http://www.cailele.com/lottery/jx11x5/', '1', '50', '0', '2013-12-17 10:35:10', '2015-09-10 02:23:05');
INSERT INTO `drawsources` VALUES ('12', '6', '爱彩网_JX115', 'http://kaijiang.aicai.com/jx11x5/', '1', '120', '1', '2013-12-17 11:12:21', '2015-11-06 17:02:57');
INSERT INTO `drawsources` VALUES ('13', '7', '时时彩网_GD115', 'http://www.shishicai.cn/gd11x5/', '1', '100', '0', '2013-12-17 11:55:49', '2015-09-10 01:31:36');
INSERT INTO `drawsources` VALUES ('15', '7', '彩乐乐_GD115', 'http://www.cailele.com/lottery/gd11x5/', '1', '50', '0', '2013-12-17 12:00:44', '2015-09-10 01:32:36');
INSERT INTO `drawsources` VALUES ('16', '7', '爱彩网_GD115', 'http://kaijiang.aicai.com/gd11x5/', '1', '110', '1', '2013-12-17 12:01:05', '2015-11-06 17:06:33');
INSERT INTO `drawsources` VALUES ('17', '8', '华彩网_TJSSC', 'http://www.huacai.com/buy/index_163.html', '1', '105', '1', '2013-12-18 11:27:23', '2016-01-27 12:16:45');
INSERT INTO `drawsources` VALUES ('18', '8', '彩经网_TJSSC', 'http://shishicai.cjcp.com.cn/tianjin/kaijiang/', '1', '106', '1', '2013-12-18 11:29:22', '2016-01-27 12:16:33');
INSERT INTO `drawsources` VALUES ('19', '4', '彩经网_XJSSC', 'http://zst.cjcp.com.cn/cjwssc/view/ssc_zst5-xjssc.html', '1', '118', '1', '2014-01-16 20:47:35', '2015-12-26 19:39:52');
INSERT INTO `drawsources` VALUES ('20', '9', '500wan', 'http://kaijiang.500.com/sd.shtml', '1', '150', '1', '2014-04-01 16:03:20', '2015-11-09 20:33:19');
INSERT INTO `drawsources` VALUES ('21', '9', '彩乐乐', 'http://www.cailele.com/lottery/3d/', '1', '50', '0', '2014-04-01 16:03:50', '2015-11-09 16:58:12');
INSERT INTO `drawsources` VALUES ('22', '10', '500Wan', 'http://kaijiang.500.com/plw.shtml', '1', '120', '1', '2014-04-01 16:04:45', '2015-11-09 20:39:52');
INSERT INTO `drawsources` VALUES ('23', '10', '彩视界', 'http://goucai.caishijie.com/lottery/pl5/index.jsp', '1', '105', '0', '2014-04-01 17:03:24', '2015-11-09 16:40:03');
INSERT INTO `drawsources` VALUES ('24', '12', '彩经网_JSKS', 'http://kuai3.cjcp.com.cn/jiangsu/kaijiang/', '1', '105', '0', '2015-04-03 00:00:00', '2015-11-09 16:59:28');
INSERT INTO `drawsources` VALUES ('25', '12', '彩乐乐_JSKS', 'http://www.cailele.com/static/k3/newlyopenlist.html', '1', '103', '0', '2015-04-03 00:00:00', '2015-11-09 16:38:45');
INSERT INTO `drawsources` VALUES ('26', '12', '网易彩票_JSKS', 'http://caipiao.163.com/order/preBet_moreAwardNumberInfoForKuai3.html?gameId=2012112609YX00000002', '1', '100', '1', '2015-04-03 00:00:00', '2016-01-20 19:23:19');
INSERT INTO `drawsources` VALUES ('27', '12', '快三网_JSKS', 'http://www.kuai3.com/lottery/awardlist/JSKS', '1', '30', '1', '2015-06-04 16:48:25', '2016-01-06 23:11:01');
INSERT INTO `drawsources` VALUES ('28', '12', '双彩网_JSKS', 'http://www.touzhuzhan.com/bull/index.php/Index/list_jsks', '1', '50', '1', '2015-06-04 16:48:48', '2017-08-28 18:45:14');
INSERT INTO `drawsources` VALUES ('29', '15', '时时彩网_JXSSC', 'http://www.shishicai.cn/jxssc/', '1', '100', '0', '2015-08-28 19:55:28', '2015-09-10 01:34:35');
INSERT INTO `drawsources` VALUES ('30', '15', '360网_JXSSC', 'http://chart.cp.360.cn/kaijiang/sscjx/', '1', '120', '0', '2015-08-28 21:10:27', '2016-01-01 21:48:12');
INSERT INTO `drawsources` VALUES ('31', '4', '爱彩网_XJSSC', 'http://kaijiang.aicai.com/open/difangIssueDetailByKc.do?gameIndex=332&province=xinjiang', '1', '119', '1', '2015-08-31 21:57:28', '2015-11-06 21:08:24');
INSERT INTO `drawsources` VALUES ('32', '1', '360_CQSSC', 'http://chart.cp.360.cn/kaijiang/ssccq', '1', '121', '1', '2015-09-10 00:21:31', '2015-09-19 14:17:51');
INSERT INTO `drawsources` VALUES ('33', '1', '360day_CQSSC', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=255401&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '111', '1', '2015-09-10 00:49:53', '2015-09-25 10:51:34');
INSERT INTO `drawsources` VALUES ('34', '2', '163_SD11Y', 'http://caipiao.163.com/award/11xuan5/', '1', '125', '1', '2015-09-10 03:42:24', '2015-09-25 10:53:11');
INSERT INTO `drawsources` VALUES ('35', '2', '163day_SD11Y', 'http://caipiao.163.com/award/11xuan5/{Ymd}.html', '1', '111', '1', '2015-09-10 03:43:23', '2015-09-25 10:54:07');
INSERT INTO `drawsources` VALUES ('36', '0', '官网', 'http://www.sdticai.com/find/find_syxw.asp?page=1', '0', '100', '1', '2015-09-10 03:50:29', '2016-01-04 00:01:56');
INSERT INTO `drawsources` VALUES ('37', '2', '官网SD11Y', 'http://www.sdticai.com/find/find_syxw.asp?page=1', '0', '100', '0', '2015-09-10 03:51:18', '2015-09-10 03:51:18');
INSERT INTO `drawsources` VALUES ('38', '15', '163_JXSSC', 'http://caipiao.163.com/award/jxssc/', '1', '110', '0', '2015-09-11 14:41:30', '2016-01-01 21:48:30');
INSERT INTO `drawsources` VALUES ('39', '1', '163_CQSSC', 'http://caipiao.163.com/award/cqssc/', '1', '120', '1', '2015-09-11 14:56:21', '2015-09-19 14:17:34');
INSERT INTO `drawsources` VALUES ('40', '6', '163_JX115', 'http://caipiao.163.com/award/jx11xuan5/', '1', '110', '1', '2015-09-11 15:10:55', '2015-11-06 17:03:19');
INSERT INTO `drawsources` VALUES ('41', '2', '360_SD11Y', 'http://chart.cp.360.cn/kaijiang/syy/', '1', '124', '1', '2015-09-12 02:07:25', '2015-09-25 10:53:27');
INSERT INTO `drawsources` VALUES ('42', '2', '360day_SD11Y', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=166406&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '110', '1', '2015-09-12 02:19:16', '2015-09-25 10:54:31');
INSERT INTO `drawsources` VALUES ('43', '7', '360day_GD115', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=165707&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '100', '1', '2015-09-12 02:22:53', '2015-11-06 17:05:29');
INSERT INTO `drawsources` VALUES ('44', '7', '360_GD115', 'http://chart.cp.360.cn/kaijiang/gd11/', '1', '120', '1', '2015-09-12 02:24:29', '2015-11-06 17:06:14');
INSERT INTO `drawsources` VALUES ('45', '17', '360_HBKS', 'http://chart.cp.360.cn/kaijiang/k3hb/', '1', '120', '1', '2015-09-14 20:25:53', '2015-11-06 17:07:34');
INSERT INTO `drawsources` VALUES ('46', '17', '163_HBKS', 'http://caipiao.163.com/award/hbkuai3/', '1', '110', '1', '2015-09-14 20:27:21', '2015-11-06 17:07:22');
INSERT INTO `drawsources` VALUES ('47', '12', '360_JSKS', 'http://chart.cp.360.cn/kaijiang/k3js/', '1', '120', '1', '2015-09-15 22:04:44', '2016-01-15 20:51:23');
INSERT INTO `drawsources` VALUES ('48', '12', '360DAY_JSKS', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=255903&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '110', '1', '2015-09-15 22:07:57', '2016-01-15 20:51:44');
INSERT INTO `drawsources` VALUES ('49', '8', '新浪爱彩_TJSSC', 'http://kaijiang.aicai.com/open/difangIssueDetailByKc.do?gameIndex=325&province=tianjin', '1', '120', '1', '2015-09-15 22:21:15', '2015-11-10 19:40:48');
INSERT INTO `drawsources` VALUES ('50', '1', '163_CQSSC', 'http://caipiao.163.com/award/cqssc/{Ymd}.html', '1', '110', '1', '2015-09-19 13:56:34', '2015-09-19 14:18:18');
INSERT INTO `drawsources` VALUES ('51', '15', '360day_JXSSC', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=258001&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '102', '0', '2015-11-04 16:31:47', '2016-01-01 21:48:39');
INSERT INTO `drawsources` VALUES ('52', '16', '北京福彩网_pk10', 'http://www.bwlc.gov.cn/bulletin/prevtrax.html?page=1', '1', '110', '0', '2015-11-04 16:51:04', '2017-11-02 23:24:19');
INSERT INTO `drawsources` VALUES ('53', '16', '乐彩网_pk10', 'http://trend.baidu.lecai.com/pk10/tenthPlaceTrend.action?onlyBody=true', '1', '120', '0', '2015-11-04 16:51:33', '2017-11-02 23:23:28');
INSERT INTO `drawsources` VALUES ('54', '6', '163day_jx115', 'http://caipiao.163.com/award/jx11xuan5/{Ymd}.html', '1', '105', '1', '2015-11-06 17:02:34', '2015-11-06 17:02:34');
INSERT INTO `drawsources` VALUES ('55', '17', '360day_HBKS', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=257703&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '105', '1', '2015-11-06 17:08:40', '2015-11-06 17:08:40');
INSERT INTO `drawsources` VALUES ('56', '16', '北京福彩day_pk10', 'http://www.bwlc.gov.cn/bulletin/prevtrax.html?dates={Y-m-d}', '1', '101', '0', '2015-11-06 17:10:34', '2015-11-09 15:56:26');
INSERT INTO `drawsources` VALUES ('57', '16', '北京福彩issue_pk10', 'http://www.bwlc.gov.cn/bulletin/prevtrax.html?num={issue}', '1', '105', '0', '2015-11-06 20:23:59', '2015-11-09 15:56:14');
INSERT INTO `drawsources` VALUES ('58', '4', '新浪爱彩POST_xjssc', 'http://kaijiang.aicai.com/open/kcResultByDate.do_POST=gameIndex=332&searchDate={Y-m-d}&gameFrom=difangKc', '1', '105', '1', '2015-11-06 21:06:05', '2015-11-06 21:16:05');
INSERT INTO `drawsources` VALUES ('59', '16', '乐彩网DAY2_pk102', 'http://trend.baidu.lecai.com/pk10/tenthPlaceTrend.action?recentDay=2&onlyBody=true&phaseOrder=up', '1', '102', '0', '2015-11-09 16:01:09', '2017-11-02 23:24:50');
INSERT INTO `drawsources` VALUES ('60', '16', '新浪爱彩_pk10', 'http://kaijiang.aicai.com/open/difangIssueDetailByKc.do?gameIndex=329&province=beijing', '1', '110', '0', '2015-11-09 16:14:10', '2017-11-02 23:24:29');
INSERT INTO `drawsources` VALUES ('61', '0', '经典彩接口', 'http://10.10.248.83:6005/Lotto/GetLottoByLid', '1', '160', '0', '2015-11-09 16:37:22', '2017-11-02 23:37:40');
INSERT INTO `drawsources` VALUES ('62', '9', '360_福彩3D', 'http://chart.cp.360.cn/kaijiang/sd/', '1', '155', '1', '2015-11-09 20:32:47', '2016-04-18 21:32:12');
INSERT INTO `drawsources` VALUES ('63', '10', '360_p3p5', 'http://chart.cp.360.cn/kaijiang/p5/', '1', '101', '1', '2015-11-09 20:33:56', '2015-11-09 20:33:56');
INSERT INTO `drawsources` VALUES ('64', '8', '新浪爱彩POST_tjssc', 'http://kaijiang.aicai.com/open/kcResultByDate.do_POST=gameIndex=325&searchDate={Y-m-d}&gameFrom=difangKc', '1', '118', '1', '2015-11-10 19:40:33', '2016-01-27 12:17:33');
INSERT INTO `drawsources` VALUES ('65', '4', '彩经网issue_xjssc', 'http://zst.cjcp.com.cn/cjwssc/view/ssc_zst5-xjssc-1-{issue[0,8]}0{issue[9,2]}-{issue[0,8]}0{issue[9,2]}-9.html', '1', '101', '1', '2015-12-26 19:40:42', '2015-12-26 19:40:42');
INSERT INTO `drawsources` VALUES ('66', '15', '淘宝_jxssc', 'https://caipiao.taobao.com/lottery/order/lottery_jxssc.htm', '1', '120', '1', '2016-01-07 01:44:35', '2016-01-07 01:44:35');
INSERT INTO `drawsources` VALUES ('67', '1', '百度乐彩', 'http://baidu.lecai.com/lottery/cqssc/', '1', '122', '1', '2016-12-02 13:10:22', '2016-12-02 13:10:34');
INSERT INTO `drawsources` VALUES ('68', '1', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:38:12', '2017-09-27 11:27:49');
INSERT INTO `drawsources` VALUES ('69', '4', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:38:25', '2017-09-27 11:28:18');
INSERT INTO `drawsources` VALUES ('70', '8', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:38:38', '2017-09-27 11:29:07');
INSERT INTO `drawsources` VALUES ('71', '10', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:38:50', '2017-09-27 11:30:01');
INSERT INTO `drawsources` VALUES ('72', '2', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:39:59', '2017-09-27 11:28:00');
INSERT INTO `drawsources` VALUES ('73', '6', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:40:13', '2017-09-27 11:28:32');
INSERT INTO `drawsources` VALUES ('74', '7', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:40:23', '2017-09-27 11:28:46');
INSERT INTO `drawsources` VALUES ('75', '9', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:40:53', '2017-09-27 11:29:20');
INSERT INTO `drawsources` VALUES ('76', '12', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:41:04', '2017-09-27 11:29:53');
INSERT INTO `drawsources` VALUES ('77', '17', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:41:15', '2017-09-27 11:29:31');
INSERT INTO `drawsources` VALUES ('78', '0', '经典彩接口公网', 'http://10.10.248.83:6005/Lotto/GetLottoByLid', '1', '150', '1', '2017-06-27 17:41:28', '2017-11-02 23:27:44');
INSERT INTO `drawsources` VALUES ('79', '0', '经典彩接口', 'http://10.10.248.83:6005/Lotto/GetLottoByLid', '1', '160', '1', '2017-11-02 23:35:32', '2017-11-02 23:35:33');
INSERT INTO `drawsources` VALUES ('80', '16', '经典彩接口公网', 'http://10.10.248.83:6005/Lotto/GetLottoByLid', '1', '160', '1', '2017-11-02 23:36:42', '2017-11-02 23:38:43');

-- ----------------------------
-- Table structure for `d_adminlogs`
-- ----------------------------
DROP TABLE IF EXISTS `d_adminlogs`;
CREATE TABLE `d_adminlogs` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '' COMMENT '管理员名',
  `control` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `is_success` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否成功',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `client_ip` char(15) NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '动作日期',
  `get_data` text NOT NULL,
  `post_data` text NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员操作日志';

-- ----------------------------
-- Records of d_adminlogs
-- ----------------------------

-- ----------------------------
-- Table structure for `d_admins`
-- ----------------------------
DROP TABLE IF EXISTS `d_admins`;
CREATE TABLE `d_admins` (
  `u_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `u_username` char(50) NOT NULL COMMENT '用户名',
  `u_pwd` char(32) NOT NULL COMMENT '登录密码',
  `u_nickname` char(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `u_is_enabled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用 0是 1否',
  `u_last_ip` char(15) NOT NULL DEFAULT '0.0.0.0' COMMENT '上次登录ip',
  `u_last_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `u_date` datetime NOT NULL COMMENT '注册时间',
  `u_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  `u_login_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '登录时间',
  `u_login_ip` varchar(20) DEFAULT '' COMMENT '登录IP',
  `u_level` tinyint(4) DEFAULT '0' COMMENT '对应角色',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of d_admins
-- ----------------------------
INSERT INTO `d_admins` VALUES ('1', 'jimm123', 'd0dcbf0d12a6b1e7fbfa2ce5848f3eff', 'jimm123', '0', '127.0.0.1', '2017-12-01 16:41:34', '0000-00-00 00:00:00', '2017-12-01 16:42:42', '2017-12-02 13:06:45', '127.0.0.1', '0');
INSERT INTO `d_admins` VALUES ('2', 'qwe123456', 'd0dcbf0d12a6b1e7fbfa2ce5848f3eff', 'qwe123456', '0', '0.0.0.0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-12-01 17:23:47', '2017-12-01 16:32:51', '127.0.0.1', '1');
INSERT INTO `d_admins` VALUES ('4', 'wer123456', 'b21907c4e7cd71ddb88af752a9744698', 'wer1234561', '0', '0.0.0.0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-12-01 17:17:05', '0000-00-00 00:00:00', '', '3');
INSERT INTO `d_admins` VALUES ('5', 'tuu123456', '1f513646fdf64f48e997125d6e9a12ed', 'tuu123456', '0', '0.0.0.0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-12-01 11:42:24', '0000-00-00 00:00:00', '', '1');
INSERT INTO `d_admins` VALUES ('6', 'fgh12qw56', '66108bd50d35fbc8eb1f05dbb4100042', 'fgh12qw', '0', '0.0.0.0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2017-12-01 11:43:01', '0000-00-00 00:00:00', '', '1');

-- ----------------------------
-- Table structure for `d_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `d_admin_role`;
CREATE TABLE `d_admin_role` (
  `ar_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色关系id',
  `ar_u_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `ar_r_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `ar_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1为正常 0为冻结',
  `ar_is_del` tinyint(2) DEFAULT '0' COMMENT '0可用 1不可用',
  `ar_update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `ar_audit_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  `ar_create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `ar_delete_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  `ar_creator` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人id',
  `ar_updater` varchar(64) NOT NULL DEFAULT '' COMMENT '更新人id',
  `ar_ip` varchar(16) DEFAULT NULL COMMENT '加入IP',
  `ar_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序字段 0-9权值',
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台用户分组关系表';

-- ----------------------------
-- Records of d_admin_role
-- ----------------------------

-- ----------------------------
-- Table structure for `d_auths`
-- ----------------------------
DROP TABLE IF EXISTS `d_auths`;
CREATE TABLE `d_auths` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `a_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `a_desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `a_controller` varchar(50) DEFAULT NULL COMMENT '控制器',
  `a_action` varchar(50) DEFAULT NULL COMMENT '动作',
  `a_type` smallint(5) NOT NULL DEFAULT '2' COMMENT '权限类别',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='后台权限表';

-- ----------------------------
-- Records of d_auths
-- ----------------------------
INSERT INTO `d_auths` VALUES ('2', '添加管理员', null, 'Admin', 'addAdmin', '1');
INSERT INTO `d_auths` VALUES ('3', '编辑管理员', null, 'Admin', 'editAdmin', '1');
INSERT INTO `d_auths` VALUES ('4', '删除管理员', null, 'admin', 'deleleAdmin', '1');
INSERT INTO `d_auths` VALUES ('6', '抓号配置', null, 'System', 'drawConf', '2');
INSERT INTO `d_auths` VALUES ('7', '抓号历史', null, 'Draw', 'drawHistory', '3');
INSERT INTO `d_auths` VALUES ('8', '彩种奖期列表', null, 'Issue', 'List', '4');
INSERT INTO `d_auths` VALUES ('9', '抓奖源管理', null, 'Draw', 'drawResource', '3');

-- ----------------------------
-- Table structure for `d_drawhistory`
-- ----------------------------
DROP TABLE IF EXISTS `d_drawhistory`;
CREATE TABLE `d_drawhistory` (
  `dh_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lottery_id` smallint(10) unsigned NOT NULL COMMENT '彩种ID',
  `issue` varchar(20) NOT NULL COMMENT '奖期号',
  `ds_id` smallint(5) unsigned NOT NULL COMMENT '号源ID',
  `rank` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '权重',
  `errno` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '错误码',
  `number` varchar(60) NOT NULL COMMENT '抓取的开奖号码',
  `retry` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '重试次数',
  `spent` float unsigned NOT NULL DEFAULT '0' COMMENT '抓号过程耗时(秒)',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`dh_id`),
  UNIQUE KEY `lotteryid__issue__sourceid` (`lottery_id`,`issue`,`ds_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='抓号历史记录';

-- ----------------------------
-- Records of d_drawhistory
-- ----------------------------

-- ----------------------------
-- Table structure for `d_drawsources`
-- ----------------------------
DROP TABLE IF EXISTS `d_drawsources`;
CREATE TABLE `d_drawsources` (
  `ds_id` smallint(10) unsigned NOT NULL DEFAULT '0',
  `lottery_id` smallint(5) unsigned NOT NULL COMMENT '彩种ID',
  `name` char(30) NOT NULL COMMENT '网站说明',
  `url` varchar(1024) NOT NULL COMMENT 'url ',
  `interface` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '接口是否已完成[0:未完成,1:已完成]',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '权重值',
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0禁用1启用',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '入加日期',
  `ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  PRIMARY KEY (`ds_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_drawsources
-- ----------------------------
INSERT INTO `d_drawsources` VALUES ('1', '1', '时时彩网_CQSSC', 'http://www.shishicai.cn/cqssc/', '1', '100', '0', '2012-11-02 15:05:16', '2015-09-10 00:50:05');
INSERT INTO `d_drawsources` VALUES ('2', '1', '彩乐乐_CQSSC', 'http://www.cailele.com/static/ssc/newlyopenlist.xml', '1', '50', '0', '2012-11-02 15:05:50', '2015-09-10 00:50:16');
INSERT INTO `d_drawsources` VALUES ('3', '1', '彩票直通车_CQSSC', 'http://tools.ecp888.com/lottery/ssc/cq/new.shtml?playStr=zh', '0', '50', '0', '2012-12-11 12:14:09', '2015-09-07 22:43:58');
INSERT INTO `d_drawsources` VALUES ('4', '2', '时时彩网_SD11Y', 'http://www.shishicai.cn/sd11x5/', '1', '100', '0', '2013-01-11 10:51:15', '2015-10-15 17:22:19');
INSERT INTO `d_drawsources` VALUES ('5', '3', '第一彩（原名彩视界）', 'http://goucai.caishijie.com/lottery/ssc/index.jsp', '1', '100', '1', '2013-08-02 10:59:08', '2013-08-02 10:59:08');
INSERT INTO `d_drawsources` VALUES ('6', '4', '新疆官网_XJSSC', 'http://www.xjflcp.com/ssc/', '1', '120', '0', '2013-08-02 10:59:32', '2015-11-09 16:57:42');
INSERT INTO `d_drawsources` VALUES ('7', '2', '彩乐乐_SD11Y', 'http://www.cailele.com/static/11yun/newlyopenlist.html', '1', '50', '0', '2013-12-15 14:17:46', '2015-09-10 01:28:23');
INSERT INTO `d_drawsources` VALUES ('8', '5', '时时彩网_CQ115', 'http://www.shishicai.cn/cq11x5/', '1', '105', '0', '2013-12-15 15:35:39', '2015-09-10 02:20:46');
INSERT INTO `d_drawsources` VALUES ('9', '5', '彩乐乐_CQ115', 'http://www.cailele.com/static/cq11x5/newlyopenlist.html', '1', '100', '0', '2013-12-15 15:35:58', '2015-09-10 02:21:26');
INSERT INTO `d_drawsources` VALUES ('10', '6', '时时彩网_JX115', 'http://www.shishicai.cn/jx11x5/', '1', '100', '0', '2013-12-17 10:34:18', '2015-09-10 01:31:21');
INSERT INTO `d_drawsources` VALUES ('11', '6', '彩乐乐_JX115', 'http://www.cailele.com/lottery/jx11x5/', '1', '50', '0', '2013-12-17 10:35:10', '2015-09-10 02:23:05');
INSERT INTO `d_drawsources` VALUES ('12', '6', '爱彩网_JX115', 'http://kaijiang.aicai.com/jx11x5/', '1', '120', '1', '2013-12-17 11:12:21', '2015-11-06 17:02:57');
INSERT INTO `d_drawsources` VALUES ('13', '7', '时时彩网_GD115', 'http://www.shishicai.cn/gd11x5/', '1', '100', '0', '2013-12-17 11:55:49', '2015-09-10 01:31:36');
INSERT INTO `d_drawsources` VALUES ('15', '7', '彩乐乐_GD115', 'http://www.cailele.com/lottery/gd11x5/', '1', '50', '0', '2013-12-17 12:00:44', '2015-09-10 01:32:36');
INSERT INTO `d_drawsources` VALUES ('16', '7', '爱彩网_GD115', 'http://kaijiang.aicai.com/gd11x5/', '1', '110', '1', '2013-12-17 12:01:05', '2015-11-06 17:06:33');
INSERT INTO `d_drawsources` VALUES ('17', '8', '华彩网_TJSSC', 'http://www.huacai.com/buy/index_163.html', '1', '105', '1', '2013-12-18 11:27:23', '2016-01-27 12:16:45');
INSERT INTO `d_drawsources` VALUES ('18', '8', '彩经网_TJSSC', 'http://shishicai.cjcp.com.cn/tianjin/kaijiang/', '1', '106', '1', '2013-12-18 11:29:22', '2016-01-27 12:16:33');
INSERT INTO `d_drawsources` VALUES ('19', '4', '彩经网_XJSSC', 'http://zst.cjcp.com.cn/cjwssc/view/ssc_zst5-xjssc.html', '1', '118', '1', '2014-01-16 20:47:35', '2015-12-26 19:39:52');
INSERT INTO `d_drawsources` VALUES ('20', '9', '500wan', 'http://kaijiang.500.com/sd.shtml', '1', '150', '1', '2014-04-01 16:03:20', '2015-11-09 20:33:19');
INSERT INTO `d_drawsources` VALUES ('21', '9', '彩乐乐', 'http://www.cailele.com/lottery/3d/', '1', '50', '0', '2014-04-01 16:03:50', '2015-11-09 16:58:12');
INSERT INTO `d_drawsources` VALUES ('22', '10', '500Wan', 'http://kaijiang.500.com/plw.shtml', '1', '120', '1', '2014-04-01 16:04:45', '2015-11-09 20:39:52');
INSERT INTO `d_drawsources` VALUES ('23', '10', '彩视界', 'http://goucai.caishijie.com/lottery/pl5/index.jsp', '1', '105', '0', '2014-04-01 17:03:24', '2015-11-09 16:40:03');
INSERT INTO `d_drawsources` VALUES ('24', '12', '彩经网_JSKS', 'http://kuai3.cjcp.com.cn/jiangsu/kaijiang/', '1', '105', '0', '2015-04-03 00:00:00', '2015-11-09 16:59:28');
INSERT INTO `d_drawsources` VALUES ('25', '12', '彩乐乐_JSKS', 'http://www.cailele.com/static/k3/newlyopenlist.html', '1', '103', '0', '2015-04-03 00:00:00', '2015-11-09 16:38:45');
INSERT INTO `d_drawsources` VALUES ('26', '12', '网易彩票_JSKS', 'http://caipiao.163.com/order/preBet_moreAwardNumberInfoForKuai3.html?gameId=2012112609YX00000002', '1', '100', '1', '2015-04-03 00:00:00', '2016-01-20 19:23:19');
INSERT INTO `d_drawsources` VALUES ('27', '12', '快三网_JSKS', 'http://www.kuai3.com/lottery/awardlist/JSKS', '1', '30', '1', '2015-06-04 16:48:25', '2016-01-06 23:11:01');
INSERT INTO `d_drawsources` VALUES ('28', '12', '双彩网_JSKS', 'http://www.touzhuzhan.com/bull/index.php/Index/list_jsks', '1', '50', '1', '2015-06-04 16:48:48', '2017-08-28 18:45:14');
INSERT INTO `d_drawsources` VALUES ('29', '15', '时时彩网_JXSSC', 'http://www.shishicai.cn/jxssc/', '1', '100', '0', '2015-08-28 19:55:28', '2015-09-10 01:34:35');
INSERT INTO `d_drawsources` VALUES ('30', '15', '360网_JXSSC', 'http://chart.cp.360.cn/kaijiang/sscjx/', '1', '120', '0', '2015-08-28 21:10:27', '2016-01-01 21:48:12');
INSERT INTO `d_drawsources` VALUES ('31', '4', '爱彩网_XJSSC', 'http://kaijiang.aicai.com/open/difangIssueDetailByKc.do?gameIndex=332&province=xinjiang', '1', '119', '1', '2015-08-31 21:57:28', '2015-11-06 21:08:24');
INSERT INTO `d_drawsources` VALUES ('32', '1', '360_CQSSC', 'http://chart.cp.360.cn/kaijiang/ssccq', '1', '121', '1', '2015-09-10 00:21:31', '2015-09-19 14:17:51');
INSERT INTO `d_drawsources` VALUES ('33', '1', '360day_CQSSC', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=255401&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '111', '1', '2015-09-10 00:49:53', '2015-09-25 10:51:34');
INSERT INTO `d_drawsources` VALUES ('34', '2', '163_SD11Y', 'http://caipiao.163.com/award/11xuan5/', '1', '125', '1', '2015-09-10 03:42:24', '2015-09-25 10:53:11');
INSERT INTO `d_drawsources` VALUES ('35', '2', '163day_SD11Y', 'http://caipiao.163.com/award/11xuan5/{Ymd}.html', '1', '111', '1', '2015-09-10 03:43:23', '2015-09-25 10:54:07');
INSERT INTO `d_drawsources` VALUES ('36', '0', '官网', 'http://www.sdticai.com/find/find_syxw.asp?page=1', '0', '100', '1', '2015-09-10 03:50:29', '2016-01-04 00:01:56');
INSERT INTO `d_drawsources` VALUES ('37', '2', '官网SD11Y', 'http://www.sdticai.com/find/find_syxw.asp?page=1', '0', '100', '0', '2015-09-10 03:51:18', '2015-09-10 03:51:18');
INSERT INTO `d_drawsources` VALUES ('38', '15', '163_JXSSC', 'http://caipiao.163.com/award/jxssc/', '1', '110', '0', '2015-09-11 14:41:30', '2016-01-01 21:48:30');
INSERT INTO `d_drawsources` VALUES ('39', '1', '163_CQSSC', 'http://caipiao.163.com/award/cqssc/', '1', '120', '1', '2015-09-11 14:56:21', '2015-09-19 14:17:34');
INSERT INTO `d_drawsources` VALUES ('40', '6', '163_JX115', 'http://caipiao.163.com/award/jx11xuan5/', '1', '110', '1', '2015-09-11 15:10:55', '2015-11-06 17:03:19');
INSERT INTO `d_drawsources` VALUES ('41', '2', '360_SD11Y', 'http://chart.cp.360.cn/kaijiang/syy/', '1', '124', '1', '2015-09-12 02:07:25', '2015-09-25 10:53:27');
INSERT INTO `d_drawsources` VALUES ('42', '2', '360day_SD11Y', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=166406&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '110', '1', '2015-09-12 02:19:16', '2015-09-25 10:54:31');
INSERT INTO `d_drawsources` VALUES ('43', '7', '360day_GD115', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=165707&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '100', '1', '2015-09-12 02:22:53', '2015-11-06 17:05:29');
INSERT INTO `d_drawsources` VALUES ('44', '7', '360_GD115', 'http://chart.cp.360.cn/kaijiang/gd11/', '1', '120', '1', '2015-09-12 02:24:29', '2015-11-06 17:06:14');
INSERT INTO `d_drawsources` VALUES ('45', '17', '360_HBKS', 'http://chart.cp.360.cn/kaijiang/k3hb/', '1', '120', '1', '2015-09-14 20:25:53', '2015-11-06 17:07:34');
INSERT INTO `d_drawsources` VALUES ('46', '17', '163_HBKS', 'http://caipiao.163.com/award/hbkuai3/', '1', '110', '1', '2015-09-14 20:27:21', '2015-11-06 17:07:22');
INSERT INTO `d_drawsources` VALUES ('47', '12', '360_JSKS', 'http://chart.cp.360.cn/kaijiang/k3js/', '1', '120', '1', '2015-09-15 22:04:44', '2016-01-15 20:51:23');
INSERT INTO `d_drawsources` VALUES ('48', '12', '360DAY_JSKS', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=255903&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '110', '1', '2015-09-15 22:07:57', '2016-01-15 20:51:44');
INSERT INTO `d_drawsources` VALUES ('49', '8', '新浪爱彩_TJSSC', 'http://kaijiang.aicai.com/open/difangIssueDetailByKc.do?gameIndex=325&province=tianjin', '1', '120', '1', '2015-09-15 22:21:15', '2015-11-10 19:40:48');
INSERT INTO `d_drawsources` VALUES ('50', '1', '163_CQSSC', 'http://caipiao.163.com/award/cqssc/{Ymd}.html', '1', '110', '1', '2015-09-19 13:56:34', '2015-09-19 14:18:18');
INSERT INTO `d_drawsources` VALUES ('51', '15', '360day_JXSSC', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=258001&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '102', '0', '2015-11-04 16:31:47', '2016-01-01 21:48:39');
INSERT INTO `d_drawsources` VALUES ('52', '16', '北京福彩网_pk10', 'http://www.bwlc.gov.cn/bulletin/prevtrax.html?page=1', '1', '110', '0', '2015-11-04 16:51:04', '2017-11-02 23:24:19');
INSERT INTO `d_drawsources` VALUES ('53', '16', '乐彩网_pk10', 'http://trend.baidu.lecai.com/pk10/tenthPlaceTrend.action?onlyBody=true', '1', '120', '0', '2015-11-04 16:51:33', '2017-11-02 23:23:28');
INSERT INTO `d_drawsources` VALUES ('54', '6', '163day_jx115', 'http://caipiao.163.com/award/jx11xuan5/{Ymd}.html', '1', '105', '1', '2015-11-06 17:02:34', '2015-11-06 17:02:34');
INSERT INTO `d_drawsources` VALUES ('55', '17', '360day_HBKS', 'http://chart.cp.360.cn/kaijiang/kaijiang?lotId=257703&spanType=2&span={Y-m-d}_{Y-m-d}', '1', '105', '1', '2015-11-06 17:08:40', '2015-11-06 17:08:40');
INSERT INTO `d_drawsources` VALUES ('56', '16', '北京福彩day_pk10', 'http://www.bwlc.gov.cn/bulletin/prevtrax.html?dates={Y-m-d}', '1', '101', '0', '2015-11-06 17:10:34', '2015-11-09 15:56:26');
INSERT INTO `d_drawsources` VALUES ('57', '16', '北京福彩issue_pk10', 'http://www.bwlc.gov.cn/bulletin/prevtrax.html?num={issue}', '1', '105', '0', '2015-11-06 20:23:59', '2015-11-09 15:56:14');
INSERT INTO `d_drawsources` VALUES ('58', '4', '新浪爱彩POST_xjssc', 'http://kaijiang.aicai.com/open/kcResultByDate.do_POST=gameIndex=332&searchDate={Y-m-d}&gameFrom=difangKc', '1', '105', '1', '2015-11-06 21:06:05', '2015-11-06 21:16:05');
INSERT INTO `d_drawsources` VALUES ('59', '16', '乐彩网DAY2_pk102', 'http://trend.baidu.lecai.com/pk10/tenthPlaceTrend.action?recentDay=2&onlyBody=true&phaseOrder=up', '1', '102', '0', '2015-11-09 16:01:09', '2017-11-02 23:24:50');
INSERT INTO `d_drawsources` VALUES ('60', '16', '新浪爱彩_pk10', 'http://kaijiang.aicai.com/open/difangIssueDetailByKc.do?gameIndex=329&province=beijing', '1', '110', '0', '2015-11-09 16:14:10', '2017-11-02 23:24:29');
INSERT INTO `d_drawsources` VALUES ('61', '0', '经典彩接口', 'http://10.10.248.83:6005/Lotto/GetLottoByLid', '1', '160', '0', '2015-11-09 16:37:22', '2017-11-02 23:37:40');
INSERT INTO `d_drawsources` VALUES ('62', '9', '360_福彩3D', 'http://chart.cp.360.cn/kaijiang/sd/', '1', '155', '1', '2015-11-09 20:32:47', '2016-04-18 21:32:12');
INSERT INTO `d_drawsources` VALUES ('63', '10', '360_p3p5', 'http://chart.cp.360.cn/kaijiang/p5/', '1', '101', '1', '2015-11-09 20:33:56', '2015-11-09 20:33:56');
INSERT INTO `d_drawsources` VALUES ('64', '8', '新浪爱彩POST_tjssc', 'http://kaijiang.aicai.com/open/kcResultByDate.do_POST=gameIndex=325&searchDate={Y-m-d}&gameFrom=difangKc', '1', '118', '1', '2015-11-10 19:40:33', '2016-01-27 12:17:33');
INSERT INTO `d_drawsources` VALUES ('65', '4', '彩经网issue_xjssc', 'http://zst.cjcp.com.cn/cjwssc/view/ssc_zst5-xjssc-1-{issue[0,8]}0{issue[9,2]}-{issue[0,8]}0{issue[9,2]}-9.html', '1', '101', '1', '2015-12-26 19:40:42', '2015-12-26 19:40:42');
INSERT INTO `d_drawsources` VALUES ('66', '15', '淘宝_jxssc', 'https://caipiao.taobao.com/lottery/order/lottery_jxssc.htm', '1', '120', '1', '2016-01-07 01:44:35', '2016-01-07 01:44:35');
INSERT INTO `d_drawsources` VALUES ('67', '1', '百度乐彩', 'http://baidu.lecai.com/lottery/cqssc/', '1', '122', '1', '2016-12-02 13:10:22', '2016-12-02 13:10:34');
INSERT INTO `d_drawsources` VALUES ('68', '1', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:38:12', '2017-09-27 11:27:49');
INSERT INTO `d_drawsources` VALUES ('69', '4', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:38:25', '2017-09-27 11:28:18');
INSERT INTO `d_drawsources` VALUES ('70', '8', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:38:38', '2017-09-27 11:29:07');
INSERT INTO `d_drawsources` VALUES ('71', '10', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:38:50', '2017-09-27 11:30:01');
INSERT INTO `d_drawsources` VALUES ('72', '2', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:39:59', '2017-09-27 11:28:00');
INSERT INTO `d_drawsources` VALUES ('73', '6', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:40:13', '2017-09-27 11:28:32');
INSERT INTO `d_drawsources` VALUES ('74', '7', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:40:23', '2017-09-27 11:28:46');
INSERT INTO `d_drawsources` VALUES ('75', '9', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:40:53', '2017-09-27 11:29:20');
INSERT INTO `d_drawsources` VALUES ('76', '12', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:41:04', '2017-09-27 11:29:53');
INSERT INTO `d_drawsources` VALUES ('77', '17', '经典彩接口公网', 'http://47.52.39.127:6005/Lotto/GetLottoByLid', '1', '150', '0', '2017-06-27 17:41:15', '2017-09-27 11:29:31');
INSERT INTO `d_drawsources` VALUES ('78', '0', '经典彩接口公网', 'http://10.10.248.83:6005/Lotto/GetLottoByLid', '1', '150', '1', '2017-06-27 17:41:28', '2017-11-02 23:27:44');
INSERT INTO `d_drawsources` VALUES ('79', '0', '经典彩接口', 'http://10.10.248.83:6005/Lotto/GetLottoByLid', '1', '160', '1', '2017-11-02 23:35:32', '2017-11-02 23:35:33');
INSERT INTO `d_drawsources` VALUES ('80', '16', '经典彩接口公网', 'http://10.10.248.83:6005/Lotto/GetLottoByLid', '1', '160', '1', '2017-11-02 23:36:42', '2017-11-02 23:38:43');

-- ----------------------------
-- Table structure for `d_lottery`
-- ----------------------------
DROP TABLE IF EXISTS `d_lottery`;
CREATE TABLE `d_lottery` (
  `lottery_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `cname` varchar(50) NOT NULL COMMENT '中文名称',
  `lottery_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '彩种类型(1:数字类型，2:乐透同区型，3:乐透分区型(蓝红球)，4:低频3D，5:基诺型)',
  `property_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '业务性质 1时时彩 2十一选五',
  `description` text NOT NULL COMMENT '彩种描述',
  `settings` text NOT NULL COMMENT '奖期设置(序列化存储)开始销售时间，最后结束销售时间，销售周期，停售时间，号码录入时间，撤单时间',
  `issue_rule` varchar(255) NOT NULL COMMENT '奖期生成规则',
  `issue_weeks` varchar(255) NOT NULL DEFAULT '' COMMENT '星期过滤以逗号分割，为空表示不过滤',
  `zx_max_comb` int(11) NOT NULL DEFAULT '0' COMMENT '直选转直注数 上线前批量查找此字段是否真的需要 因为计算奖金不需要此字段',
  `total_profit` decimal(3,3) NOT NULL DEFAULT '0.000' COMMENT '总水率',
  `min_profit` decimal(3,3) NOT NULL DEFAULT '0.000' COMMENT '公司最小留水',
  `min_rebate_gaps` varchar(255) NOT NULL DEFAULT '' COMMENT '最小返点差，序列化',
  `yearly_start_closed` date NOT NULL DEFAULT '0000-00-00' COMMENT '年度休市开始时间（一般指春节前后）',
  `yearly_end_closed` date NOT NULL DEFAULT '0000-00-00' COMMENT '年度休市结束时间（一般指春节前后）',
  `catch_delay` smallint(5) NOT NULL DEFAULT '0' COMMENT '抓号延后秒数',
  `catch_retry` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '重试次数',
  `catch_interval` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '重试间隔秒数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0禁用 8正常',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序，越小越靠前',
  `ts` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录更新时间',
  PRIMARY KEY (`lottery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_lottery
-- ----------------------------
INSERT INTO `d_lottery` VALUES ('1', 'CQSSC', '重庆时时彩', '1', '1', '时时彩', 'a:3:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"00:05:00\";s:8:\"end_time\";s:8:\"01:55:00\";s:5:\"cycle\";s:3:\"300\";s:8:\"end_sale\";s:2:\"30\";s:9:\"drop_time\";s:2:\"30\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}i:1;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"02:00:00\";s:14:\"first_end_time\";s:8:\"10:00:00\";s:8:\"end_time\";s:8:\"22:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"60\";s:9:\"drop_time\";s:2:\"60\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"1\";}i:2;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"22:00:00\";s:14:\"first_end_time\";s:8:\"22:05:00\";s:8:\"end_time\";s:8:\"00:00:00\";s:5:\"cycle\";s:3:\"300\";s:8:\"end_sale\";s:2:\"30\";s:9:\"drop_time\";s:2:\"30\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"2\";}}', 'Ymd-[n3]|1,1,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2017-01-27', '2017-02-02', '0', '5', '65', '8', '2', '2017-08-26 22:35:43');
INSERT INTO `d_lottery` VALUES ('2', 'SD11Y', '山东11选5', '2', '2', '十一选五', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"08:35:00\";s:8:\"end_time\";s:8:\"22:55:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '990', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.10\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '0', '5', '78', '8', '100', '2017-04-06 13:41:43');
INSERT INTO `d_lottery` VALUES ('3', 'HLJSSC', '黑龙江时时彩', '1', '1', '时时彩，8:40~22:40，每天84期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"08:50:00\";s:8:\"end_time\";s:8:\"22:40:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:3:\"120\";s:9:\"drop_time\";s:3:\"120\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', '[n7]|1,1,1', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2016-02-07', '2016-02-13', '0', '5', '65', '0', '100', '2016-01-15 19:48:40');
INSERT INTO `d_lottery` VALUES ('4', 'XJSSC', '新疆时时彩', '1', '1', '10:00~02:00，10分钟一期，每天96期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"02:10:00\";s:14:\"first_end_time\";s:8:\"10:10:00\";s:8:\"end_time\";s:8:\"02:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n2]|0,0,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2017-01-27', '2017-02-02', '0', '5', '65', '8', '100', '2017-01-11 19:28:58');
INSERT INTO `d_lottery` VALUES ('5', 'CQ115', '重庆11选5', '2', '2', '首期09:00开奖，最后一期23:00开奖，每10分钟一期，全天85期，开奖准时。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:00:00\";s:8:\"end_time\";s:8:\"23:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:2:\"30\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '990', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.10\";s:3:\"gap\";s:5:\"0.005\";}}', '2016-02-07', '2016-02-13', '0', '5', '90', '0', '100', '2016-01-15 19:49:08');
INSERT INTO `d_lottery` VALUES ('6', 'JX115', '江西11选5', '2', '2', '首期09:10开奖，最后一期22:00开奖，每10分钟一期，全天78期，开奖准时。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:10:00\";s:8:\"end_time\";s:8:\"22:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '990', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.10\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '0', '5', '45', '8', '100', '2017-01-11 19:29:39');
INSERT INTO `d_lottery` VALUES ('7', 'GD115', '广东11选5', '2', '2', '首期09:10开奖，最后一期23:00开奖，每10分钟一期，全天84期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:10:00\";s:8:\"end_time\";s:8:\"23:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '990', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.10\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '0', '5', '45', '8', '100', '2017-01-11 19:30:05');
INSERT INTO `d_lottery` VALUES ('8', 'TJSSC', '天津时时彩', '1', '1', '首期09:09开奖，最后一期22:58开奖，10分钟一期，每天84期，不定时会提前一分钟08分的时候开，因此应统一按08分开奖。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:08:00\";s:8:\"end_time\";s:8:\"22:58:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2017-01-27', '2017-02-02', '0', '5', '65', '8', '100', '2017-01-11 19:40:55');
INSERT INTO `d_lottery` VALUES ('9', 'FC3D', '福彩3D', '4', '2', '一天开一期,20:30官方截止，我们可在20:20分截止。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"20:30:00\";s:8:\"end_time\";s:8:\"20:30:00\";s:5:\"cycle\";s:5:\"36000\";s:8:\"end_sale\";s:3:\"600\";s:9:\"drop_time\";s:3:\"600\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', '[n7]|1,1,1', '', '1000', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:3:\"0.1\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '60', '10', '115', '8', '100', '2017-01-11 19:40:38');
INSERT INTO `d_lottery` VALUES ('10', 'P3P5', '排列三/五', '1', '2', '一天开一期,20:30官方截止，我们可在20:20分截止。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"20:30:00\";s:8:\"end_time\";s:8:\"20:30:00\";s:5:\"cycle\";s:5:\"36000\";s:8:\"end_sale\";s:3:\"600\";s:9:\"drop_time\";s:3:\"600\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', '[n7]|1,1,1', '', '1000', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:3:\"0.1\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '60', '10', '115', '8', '100', '2017-01-11 19:40:23');
INSERT INTO `d_lottery` VALUES ('11', 'SSCFFC', 'DS机率彩', '1', '1', '时时彩', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"00:03:00\";s:8:\"end_time\";s:8:\"23:59:59\";s:5:\"cycle\";s:3:\"180\";s:8:\"end_sale\";s:1:\"8\";s:9:\"drop_time\";s:1:\"8\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n4]|1,1,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2016-02-07', '2016-02-13', '0', '1', '30', '0', '100', '2016-03-30 14:46:55');
INSERT INTO `d_lottery` VALUES ('12', 'JSKS', '江苏快三', '6', '3', '江苏快3 销售时间：每天 8：40--10：00 每10分钟一期 每天82期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"08:40:00\";s:8:\"end_time\";s:8:\"22:10:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:3:\"150\";s:9:\"drop_time\";s:2:\"60\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|1,1,0', '', '216', '0.300', '0.150', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:4:\"0.01\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:4:\"0.15\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '-200', '5', '30', '8', '100', '2017-01-11 19:39:59');
INSERT INTO `d_lottery` VALUES ('13', 'KSFFC', 'DS骰宝', '6', '3', '快三分分彩', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"00:01:00\";s:8:\"end_time\";s:8:\"23:59:59\";s:5:\"cycle\";s:2:\"60\";s:8:\"end_sale\";s:1:\"0\";s:9:\"drop_time\";s:1:\"0\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n4]|1,1,0', '', '216', '0.300', '0.150', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:4:\"0.01\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:4:\"0.15\";s:3:\"gap\";s:5:\"0.005\";}}', '2016-02-07', '2016-02-13', '0', '1', '30', '0', '100', '2017-01-11 19:18:58');
INSERT INTO `d_lottery` VALUES ('15', 'JXSSC', '江西时时彩', '1', '1', '时时彩，9:00~23:00，每天84期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:10:00\";s:8:\"end_time\";s:8:\"23:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"60\";s:9:\"drop_time\";s:2:\"60\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|1,1,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2016-02-07', '2016-02-13', '0', '5', '65', '0', '3', '2016-02-24 11:00:05');
INSERT INTO `d_lottery` VALUES ('16', 'PK10', 'PK拾', '8', '1', 'http://www.bwlc.gov.cn/help/pk10.jsp', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:07:00\";s:8:\"end_time\";s:8:\"23:57:00\";s:5:\"cycle\";s:3:\"300\";s:8:\"end_sale\";s:2:\"30\";s:9:\"drop_time\";s:2:\"30\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', '[n6]|1,1,1', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2017-01-27', '2017-02-02', '0', '10', '30', '8', '100', '2017-11-23 17:52:12');
INSERT INTO `d_lottery` VALUES ('17', 'HBKS', '湖北快3', '6', '3', '销售：9:00～22:00（78期）10分钟开奖　返奖59%', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:10:00\";s:8:\"end_time\";s:8:\"22:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"30\";s:9:\"drop_time\";s:2:\"60\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|1,1,0', '', '216', '0.300', '0.150', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:4:\"0.01\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:4:\"0.15\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '0', '5', '30', '8', '100', '2017-01-11 19:39:29');

-- ----------------------------
-- Table structure for `d_role`
-- ----------------------------
DROP TABLE IF EXISTS `d_role`;
CREATE TABLE `d_role` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `r_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `r_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `r_creator` varchar(64) NOT NULL DEFAULT '' COMMENT '创建人信息',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='后台角色表';

-- ----------------------------
-- Records of d_role
-- ----------------------------
INSERT INTO `d_role` VALUES ('0', 'superman', '超级管理员', 'jimm123');
INSERT INTO `d_role` VALUES ('1', 'php程序猿', '年度最佳导演', 'jimm123');
INSERT INTO `d_role` VALUES ('3', 'c#程序员', 'windows', 'jimm123');

-- ----------------------------
-- Table structure for `d_role_auth`
-- ----------------------------
DROP TABLE IF EXISTS `d_role_auth`;
CREATE TABLE `d_role_auth` (
  `ra_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ra_r_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID',
  `ra_a_id` int(11) NOT NULL DEFAULT '0' COMMENT '权限ID',
  `ra_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1为正常 0为冻结',
  PRIMARY KEY (`ra_id`),
  KEY `role_id_auth` (`ra_r_id`,`ra_a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COMMENT='后台角色权限关系表';

-- ----------------------------
-- Records of d_role_auth
-- ----------------------------
INSERT INTO `d_role_auth` VALUES ('18', '1', '2', '1');
INSERT INTO `d_role_auth` VALUES ('19', '1', '6', '1');
INSERT INTO `d_role_auth` VALUES ('20', '1', '7', '1');
INSERT INTO `d_role_auth` VALUES ('21', '1', '8', '1');

-- ----------------------------
-- Table structure for `issue_history`
-- ----------------------------
DROP TABLE IF EXISTS `issue_history`;
CREATE TABLE `issue_history` (
  `issue_id` int(8) unsigned NOT NULL COMMENT '奖期id',
  `lottery_id` tinyint(3) unsigned NOT NULL COMMENT '彩种类型',
  `issue` char(12) NOT NULL COMMENT '奖期期号',
  `belong_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '所属日期',
  `code` varchar(60) NOT NULL COMMENT '开奖号码',
  `miss_info` text COMMENT '每期的号码遗漏数据(定位)',
  `hot_info` text COMMENT '最近十期连续出现次数',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  `miss_k3` text COMMENT '快三奇偶大小和值遗漏',
  `hot_k3` text COMMENT '快三奇偶大小和值冷热',
  `hot_k3_opencode` text COMMENT '快三开奖遗漏',
  `miss_k3_opencode` text COMMENT '快三开奖冷热',
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='奖期号码，用于历史号码分析';

-- ----------------------------
-- Records of issue_history
-- ----------------------------

-- ----------------------------
-- Table structure for `lottery`
-- ----------------------------
DROP TABLE IF EXISTS `lottery`;
CREATE TABLE `lottery` (
  `lottery_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `cname` varchar(50) NOT NULL COMMENT '中文名称',
  `lottery_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '彩种类型(1:数字类型，2:乐透同区型，3:乐透分区型(蓝红球)，4:低频3D，5:基诺型)',
  `property_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '业务性质 1时时彩 2十一选五',
  `description` text NOT NULL COMMENT '彩种描述',
  `settings` text NOT NULL COMMENT '奖期设置(序列化存储)开始销售时间，最后结束销售时间，销售周期，停售时间，号码录入时间，撤单时间',
  `issue_rule` varchar(255) NOT NULL COMMENT '奖期生成规则',
  `issue_weeks` varchar(255) NOT NULL DEFAULT '' COMMENT '星期过滤以逗号分割，为空表示不过滤',
  `zx_max_comb` int(11) NOT NULL DEFAULT '0' COMMENT '直选转直注数 上线前批量查找此字段是否真的需要 因为计算奖金不需要此字段',
  `total_profit` decimal(3,3) NOT NULL DEFAULT '0.000' COMMENT '总水率',
  `min_profit` decimal(3,3) NOT NULL DEFAULT '0.000' COMMENT '公司最小留水',
  `min_rebate_gaps` varchar(255) NOT NULL DEFAULT '' COMMENT '最小返点差，序列化',
  `yearly_start_closed` date NOT NULL DEFAULT '0000-00-00' COMMENT '年度休市开始时间（一般指春节前后）',
  `yearly_end_closed` date NOT NULL DEFAULT '0000-00-00' COMMENT '年度休市结束时间（一般指春节前后）',
  `catch_delay` smallint(5) NOT NULL DEFAULT '0' COMMENT '抓号延后秒数',
  `catch_retry` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '重试次数',
  `catch_interval` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '重试间隔秒数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0禁用 8正常',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序，越小越靠前',
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
  PRIMARY KEY (`lottery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='彩种表';

-- ----------------------------
-- Records of lottery
-- ----------------------------
INSERT INTO `lottery` VALUES ('1', 'CQSSC', '重庆时时彩', '1', '1', '时时彩', 'a:3:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"00:05:00\";s:8:\"end_time\";s:8:\"01:55:00\";s:5:\"cycle\";s:3:\"300\";s:8:\"end_sale\";s:2:\"30\";s:9:\"drop_time\";s:2:\"30\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}i:1;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"02:00:00\";s:14:\"first_end_time\";s:8:\"10:00:00\";s:8:\"end_time\";s:8:\"22:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"60\";s:9:\"drop_time\";s:2:\"60\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"1\";}i:2;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"22:00:00\";s:14:\"first_end_time\";s:8:\"22:05:00\";s:8:\"end_time\";s:8:\"00:00:00\";s:5:\"cycle\";s:3:\"300\";s:8:\"end_sale\";s:2:\"30\";s:9:\"drop_time\";s:2:\"30\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"2\";}}', 'Ymd-[n3]|1,1,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2017-01-27', '2017-02-02', '0', '5', '65', '8', '2', '2017-08-26 22:35:43');
INSERT INTO `lottery` VALUES ('2', 'SD11Y', '山东11选5', '2', '2', '十一选五', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"08:35:00\";s:8:\"end_time\";s:8:\"22:55:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '990', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.10\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '0', '5', '78', '8', '100', '2017-04-06 13:41:43');
INSERT INTO `lottery` VALUES ('3', 'HLJSSC', '黑龙江时时彩', '1', '1', '时时彩，8:40~22:40，每天84期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"08:50:00\";s:8:\"end_time\";s:8:\"22:40:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:3:\"120\";s:9:\"drop_time\";s:3:\"120\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', '[n7]|1,1,1', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2016-02-07', '2016-02-13', '0', '5', '65', '0', '100', '2016-01-15 19:48:40');
INSERT INTO `lottery` VALUES ('4', 'XJSSC', '新疆时时彩', '1', '1', '10:00~02:00，10分钟一期，每天96期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"02:10:00\";s:14:\"first_end_time\";s:8:\"10:10:00\";s:8:\"end_time\";s:8:\"02:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n2]|0,0,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2017-01-27', '2017-02-02', '0', '5', '65', '8', '100', '2017-01-11 19:28:58');
INSERT INTO `lottery` VALUES ('5', 'CQ115', '重庆11选5', '2', '2', '首期09:00开奖，最后一期23:00开奖，每10分钟一期，全天85期，开奖准时。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:00:00\";s:8:\"end_time\";s:8:\"23:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:2:\"30\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '990', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.10\";s:3:\"gap\";s:5:\"0.005\";}}', '2016-02-07', '2016-02-13', '0', '5', '90', '0', '100', '2016-01-15 19:49:08');
INSERT INTO `lottery` VALUES ('6', 'JX115', '江西11选5', '2', '2', '首期09:10开奖，最后一期22:00开奖，每10分钟一期，全天78期，开奖准时。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:10:00\";s:8:\"end_time\";s:8:\"22:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '990', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.10\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '0', '5', '45', '8', '100', '2017-01-11 19:29:39');
INSERT INTO `lottery` VALUES ('7', 'GD115', '广东11选5', '2', '2', '首期09:10开奖，最后一期23:00开奖，每10分钟一期，全天84期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:10:00\";s:8:\"end_time\";s:8:\"23:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '990', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.10\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '0', '5', '45', '8', '100', '2017-01-11 19:30:05');
INSERT INTO `lottery` VALUES ('8', 'TJSSC', '天津时时彩', '1', '1', '首期09:09开奖，最后一期22:58开奖，10分钟一期，每天84期，不定时会提前一分钟08分的时候开，因此应统一按08分开奖。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:08:00\";s:8:\"end_time\";s:8:\"22:58:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"90\";s:9:\"drop_time\";s:2:\"90\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|0,0,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2017-01-27', '2017-02-02', '0', '5', '65', '8', '100', '2017-01-11 19:40:55');
INSERT INTO `lottery` VALUES ('9', 'FC3D', '福彩3D', '4', '2', '一天开一期,20:30官方截止，我们可在20:20分截止。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"20:30:00\";s:8:\"end_time\";s:8:\"20:30:00\";s:5:\"cycle\";s:5:\"36000\";s:8:\"end_sale\";s:3:\"600\";s:9:\"drop_time\";s:3:\"600\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', '[n7]|1,1,1', '', '1000', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:3:\"0.1\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '60', '10', '115', '8', '100', '2017-01-11 19:40:38');
INSERT INTO `lottery` VALUES ('10', 'P3P5', '排列三/五', '1', '2', '一天开一期,20:30官方截止，我们可在20:20分截止。', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"20:30:00\";s:8:\"end_time\";s:8:\"20:30:00\";s:5:\"cycle\";s:5:\"36000\";s:8:\"end_sale\";s:3:\"600\";s:9:\"drop_time\";s:3:\"600\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', '[n7]|1,1,1', '', '1000', '0.150', '0.050', 'a:1:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:3:\"0.1\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '60', '10', '115', '8', '100', '2017-01-11 19:40:23');
INSERT INTO `lottery` VALUES ('11', 'SSCFFC', 'DS机率彩', '1', '1', '时时彩', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"00:03:00\";s:8:\"end_time\";s:8:\"23:59:59\";s:5:\"cycle\";s:3:\"180\";s:8:\"end_sale\";s:1:\"8\";s:9:\"drop_time\";s:1:\"8\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n4]|1,1,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2016-02-07', '2016-02-13', '0', '1', '30', '0', '100', '2016-03-30 14:46:55');
INSERT INTO `lottery` VALUES ('12', 'JSKS', '江苏快三', '6', '3', '江苏快3 销售时间：每天 8：40--10：00 每10分钟一期 每天82期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"08:40:00\";s:8:\"end_time\";s:8:\"22:10:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:3:\"150\";s:9:\"drop_time\";s:2:\"60\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|1,1,0', '', '216', '0.300', '0.150', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:4:\"0.01\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:4:\"0.15\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '-200', '5', '30', '8', '100', '2017-01-11 19:39:59');
INSERT INTO `lottery` VALUES ('13', 'KSFFC', 'DS骰宝', '6', '3', '快三分分彩', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"00:01:00\";s:8:\"end_time\";s:8:\"23:59:59\";s:5:\"cycle\";s:2:\"60\";s:8:\"end_sale\";s:1:\"0\";s:9:\"drop_time\";s:1:\"0\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n4]|1,1,0', '', '216', '0.300', '0.150', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:4:\"0.01\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:4:\"0.15\";s:3:\"gap\";s:5:\"0.005\";}}', '2016-02-07', '2016-02-13', '0', '1', '30', '0', '100', '2017-01-11 19:18:58');
INSERT INTO `lottery` VALUES ('15', 'JXSSC', '江西时时彩', '1', '1', '时时彩，9:00~23:00，每天84期', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:10:00\";s:8:\"end_time\";s:8:\"23:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"60\";s:9:\"drop_time\";s:2:\"60\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|1,1,0', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2016-02-07', '2016-02-13', '0', '5', '65', '0', '3', '2016-02-24 11:00:05');
INSERT INTO `lottery` VALUES ('16', 'PK10', 'PK拾', '8', '1', 'http://www.bwlc.gov.cn/help/pk10.jsp', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:07:00\";s:8:\"end_time\";s:8:\"23:57:00\";s:5:\"cycle\";s:3:\"300\";s:8:\"end_sale\";s:2:\"30\";s:9:\"drop_time\";s:2:\"30\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', '[n6]|1,1,1', '', '1000', '0.150', '0.022', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:5:\"0.005\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:5:\"0.128\";s:3:\"gap\";s:5:\"0.001\";}}', '2017-01-27', '2017-02-02', '0', '10', '30', '8', '100', '2017-11-23 17:52:12');
INSERT INTO `lottery` VALUES ('17', 'HBKS', '湖北快3', '6', '3', '销售：9:00～22:00（78期）10分钟开奖　返奖59%', 'a:1:{i:0;a:9:{s:6:\"is_use\";s:1:\"1\";s:10:\"start_time\";s:8:\"00:00:00\";s:14:\"first_end_time\";s:8:\"09:10:00\";s:8:\"end_time\";s:8:\"22:00:00\";s:5:\"cycle\";s:3:\"600\";s:8:\"end_sale\";s:2:\"30\";s:9:\"drop_time\";s:2:\"60\";s:9:\"code_time\";s:1:\"0\";s:9:\"frag_sort\";s:1:\"0\";}}', 'Ymd-[n3]|1,1,0', '', '216', '0.300', '0.150', 'a:2:{i:0;a:3:{s:4:\"from\";s:1:\"0\";s:2:\"to\";s:4:\"0.12\";s:3:\"gap\";s:4:\"0.01\";}i:1;a:3:{s:4:\"from\";s:4:\"0.12\";s:2:\"to\";s:4:\"0.15\";s:3:\"gap\";s:5:\"0.005\";}}', '2017-01-27', '2017-02-02', '0', '5', '30', '8', '100', '2017-01-11 19:39:29');
