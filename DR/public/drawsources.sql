/*
Navicat MySQL Data Transfer

Source Server         : 10.10.197.2
Source Server Version : 50505
Source Host           : 10.10.197.2:3306
Source Database       : localssc

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-11-28 13:21:13
*/

SET FOREIGN_KEY_CHECKS=0;

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
