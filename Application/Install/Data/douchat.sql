/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : douchat

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2016-02-20 13:37:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `dc_action`
-- ----------------------------
DROP TABLE IF EXISTS `dc_action`;
CREATE TABLE `dc_action` (
  `id` int(11) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` char(30) NOT NULL default '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL default '' COMMENT '行为说明',
  `remark` char(140) NOT NULL default '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL default '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL default '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL default '0' COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of dc_action
-- ----------------------------
INSERT INTO `dc_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了管理中心', '1', '0', '1393685660');
INSERT INTO `dc_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `dc_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '0', '1383285646');
INSERT INTO `dc_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `dc_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `dc_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `dc_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `dc_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `dc_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `dc_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `dc_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');
INSERT INTO `dc_action` VALUES ('12', 'admin_login', '登录后台', '管理员登录后台', '', '[user|get_nickname]在[time|time_format]登录了后台', '2', '1', '1393685618');

-- ----------------------------
-- Table structure for `dc_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `dc_action_log`;
CREATE TABLE `dc_action_log` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL default '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL default '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL default '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL default '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL default '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL default '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '执行行为的时间',
  PRIMARY KEY  (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表';

-- ----------------------------
-- Records of dc_action_log
-- ----------------------------
INSERT INTO `dc_action_log` VALUES ('1', '12', '1', '0', 'user', '1', 'admin在2015-12-18 22:54登录了后台', '1', '1450450499');
INSERT INTO `dc_action_log` VALUES ('2', '12', '1', '0', 'user', '1', 'admin在2016-01-10 17:11登录了后台', '1', '1452417078');
INSERT INTO `dc_action_log` VALUES ('3', '8', '1', '0', 'attribute', '12362', '操作url：/douchat_beta/index.php?s=/Admin/Attribute/update.html', '1', '1452417198');
INSERT INTO `dc_action_log` VALUES ('4', '12', '1', '0', 'user', '1', 'Array在2016-01-11 09:53登录了后台', '1', '1452477231');
INSERT INTO `dc_action_log` VALUES ('5', '12', '1', '0', 'user', '1', 'admin在2016-01-27 22:49登录了后台', '1', '1453906161');
INSERT INTO `dc_action_log` VALUES ('6', '12', '1', '0', 'user', '1', 'admin在2016-01-28 08:48登录了后台', '1', '1453942119');
INSERT INTO `dc_action_log` VALUES ('7', '12', '1', '0', 'user', '1', 'admin在2016-01-28 13:41登录了后台', '1', '1453959675');
INSERT INTO `dc_action_log` VALUES ('8', '12', '1', '0', 'user', '1', 'admin在2016-01-28 16:05登录了后台', '1', '1453968317');
INSERT INTO `dc_action_log` VALUES ('9', '12', '1', '2130706433', 'user', '1', 'admin在2016-01-28 16:23登录了后台', '1', '1453969414');
INSERT INTO `dc_action_log` VALUES ('10', '12', '1', '0', 'user', '1', 'admin在2016-01-29 21:03登录了后台', '1', '1454072639');
INSERT INTO `dc_action_log` VALUES ('11', '12', '1', '0', 'user', '1', 'admin在2016-02-02 13:28登录了后台', '1', '1454390884');
INSERT INTO `dc_action_log` VALUES ('12', '12', '1', '0', 'user', '1', 'admin在2016-02-19 10:21登录了后台', '1', '1455848476');
INSERT INTO `dc_action_log` VALUES ('13', '12', '1', '0', 'user', '1', 'admin在2016-02-19 12:26登录了后台', '1', '1455855982');
INSERT INTO `dc_action_log` VALUES ('14', '12', '1', '0', 'user', '1', 'admin在2016-02-20 10:30登录了后台', '1', '1455935431');
INSERT INTO `dc_action_log` VALUES ('15', '12', '1', '2130706433', 'user', '1', 'admin在2016-02-20 11:49登录了后台', '1', '1455940164');

-- ----------------------------
-- Table structure for `dc_addons`
-- ----------------------------
DROP TABLE IF EXISTS `dc_addons`;
CREATE TABLE `dc_addons` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL default '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL default '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) default '' COMMENT '作者',
  `version` varchar(20) default '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否有后台列表',
  `type` tinyint(1) default '0' COMMENT '插件类型 0 普通插件 1 微信插件 2 易信插件',
  `cate_id` int(11) default NULL,
  `is_show` tinyint(2) default '1',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`),
  KEY `sti` (`status`,`is_show`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信插件表';

-- ----------------------------
-- Records of dc_addons
-- ----------------------------
INSERT INTO `dc_addons` VALUES ('198', 'WeiSite', '微官网', '微3G网站、支持分类管理，文章管理、底部导航管理、微信引导信息配置，微网站统计代码部署。同时支持首页多模板切换、信息列表多模板切换、信息详情模板切换、底部导航多模板切换。并配置有详细的模板二次开发教程', '1', '{\"title\":\"\\u70b9\\u51fb\\u8fdb\\u5165\\u9996\\u9875\",\"cover\":\"\",\"info\":\"\",\"background\":\"\",\"code\":\"\",\"template_index\":\"ColorV1\",\"template_footer\":\"V1\",\"template_lists\":\"V1\",\"template_detail\":\"V1\"}', '艾逗笔', '1.0', '1450450573', '0', '0', '0', '1');
INSERT INTO `dc_addons` VALUES ('199', 'AutoReply', '自动回复', '实现配置关键词，用户回复此关键词后自动回复对应的文件，图文，图片信息', '1', 'null', '艾逗笔', '1.0', '1450450576', '1', '0', '0', '1');
INSERT INTO `dc_addons` VALUES ('218', 'CustomMenu', '自定义菜单', '自定义菜单能够帮助公众号丰富界面，让用户更好更快地理解公众号的功能', '1', 'null', '艾逗笔', '1.0', '1453347048', '1', '0', '0', '1');
INSERT INTO `dc_addons` VALUES ('201', 'YouaskService', '多客服', '一个支持指定客服，未识别回复，智能聊天(图灵机器人)的微信客服系统', '1', '{\"state\":\"1\",\"zrg\":\"\\u4eba\\u5de5\\u5ba2\\u670d\",\"jrkf\":\"\\u60a8\\u597d\\uff0c\\u6210\\u529f\\u63a5\\u5165\\u5ba2\\u670d\\uff0c\\u5ba2\\u670d[name]\\u4e3a\\u60a8\\u670d\\u52a1\\uff01\",\"zjkf\":\"\\u60a8\\u597d\\uff0c\\u5ba2\\u670d\\u8f6c\\u63a5\\u6210\\u529f\\uff0c\\u5ba2\\u670d[name]\\u4e3a\\u60a8\\u670d\\u52a1\\uff01\\uff01\",\"gbkf\":\"\\u60a8\\u597d\\uff0c\\u5ba2\\u670d\\u4f1a\\u8bdd\\u5df2\\u5173\\u95ed\\uff0c\\u611f\\u8c22\\u60a8\\u7684\\u6765\\u8bbf\\uff01\",\"kfbz\":\"\\u60a8\\u597d\\uff0c\\u5ba2\\u670d\\u5de5\\u4f5c\\u65f6\\u95f4\\uff1a\\u5468\\u4e00\\u81f3\\u5468\\u4e948:00-17:00\",\"zdkfbz\":\"\\u60a8\\u597d\\uff0c\\u60a8\\u6307\\u5b9a\\u7684\\u5ba2\\u670d\\u6682\\u65f6\\u4e0d\\u5728\\u7ebf\\uff0c\\u8bf7\\u9009\\u62e9\\u5176\\u4ed6\\u5ba2\\u670d,\\u67e5\\u8be2\\u5728\\u7ebf\\u5ba2\\u670d\\u5217\\u8868\\uff0c\\u8bf7\\u56de\\u590d\\u201c\\u67e5\\u8be2\\u5728\\u7ebf\\u5ba2\\u670d\\u201d\",\"model2\":\"0\",\"model\":\"1\",\"tcrg\":\"\\u9000\\u51fa\\u4eba\\u5de5\\u5ba2\\u670d\",\"cxkey\":\"\\u67e5\\u8be2\\u5728\\u7ebf\\u5ba2\\u670d\",\"type3\":\"1\",\"title3\":\"\\u5728\\u7ebf\\u5ba2\\u670d\\u5217\\u8868\",\"pic_url3\":\"\",\"description_head\":\"\\u5ba2\\u670d\\u5217\\u8868\\u9876\\u90e8\\u5185\\u5bb9\\u533a\",\"description_foot\":\"\\u5ba2\\u670d\\u5217\\u8868\\u5e95\\u90e8\\u5185\\u5bb9\\u533a\"}', '梦醒', '0.1', '1451825104', '1', '0', '0', '1');
INSERT INTO `dc_addons` VALUES ('227', 'CustomReply', '自定义回复', '支持图文回复、多图文回复、文本回复功能', '1', 'null', '凡星', '0.1', '1455870871', '1', '0', '1', '1');
INSERT INTO `dc_addons` VALUES ('220', 'Panorama', '360全景', '三维全景展示全面的展示360度球型范围内的所有景致；用鼠标左键按住拖动，观看场景的各个方向；最大限度的保留了场景的真实性；给人以三维立体的空间感觉，使观者如身在其中。', '1', 'null', '流风回雪', '0.1', '1453969716', '1', '0', '4', '1');
INSERT INTO `dc_addons` VALUES ('202', 'Tmplmsg', '模板消息', '通用的模板消息发送插件', '1', 'null', '艾逗笔', '1.0', '1451825112', '1', '0', '0', '1');
INSERT INTO `dc_addons` VALUES ('204', 'SceneQrcode', '场景二维码', '设置不同的场景生成对应的二维码，用于营销推广、用户绑定、数据统计等场景。', '1', 'null', '艾逗笔', '1.0', '1451825121', '1', '0', '0', '1');
INSERT INTO `dc_addons` VALUES ('205', 'UserCenter', '微信用户中心', '实现3G首页、微信登录，微信用户绑定，微信用户信息初始化等基本功能', '1', '{\"score\":\"100\",\"experience\":\"100\",\"need_bind\":\"0\",\"bind_start\":\"0\",\"jumpurl\":\"\"}', '凡星', '0.1', '1451825125', '1', '0', null, '1');
INSERT INTO `dc_addons` VALUES ('206', 'Shop', '微商城', '支持后台发布商品 banner管理 前端多模板选择 订单管理等', '1', 'null', '艾逗笔', '1.0', '1451825141', '1', '0', '5', '1');
INSERT INTO `dc_addons` VALUES ('207', 'Example', '功能演示', '对豆信框架的功能进行演示', '1', '{\"random\":\"1\"}', '艾逗笔', '1.0', '1451825144', '0', '0', '10', '1');
INSERT INTO `dc_addons` VALUES ('208', 'Donations', '微捐赠', '在线捐赠功能，用户可以在微信端捐赠', '1', '{\"title\":\"\\u6350\\u8d60\\u6211\\u4eec\",\"cover\":\"\",\"desc\":\"\\u60a8\\u7684\\u652f\\u6301\\uff0c\\u662f\\u6211\\u4eec\\u524d\\u8fdb\\u7684\\u52a8\\u529b\"}', '洛杉矶豪哥', '1.0', '1451825173', '0', '0', '1', '1');
INSERT INTO `dc_addons` VALUES ('209', 'Extensions', '融合第三方', '第三方功能扩展', '1', 'null', '凡星', '0.1', '1451825178', '1', '0', '4', '1');
INSERT INTO `dc_addons` VALUES ('210', 'Forms', '通用表单', '管理员可以轻松地增加一个表单用于收集用户的信息，如活动报名、调查反馈、预约填单等', '1', 'null', '凡星', '0.1', '1451825181', '1', '0', '1', '1');
INSERT INTO `dc_addons` VALUES ('211', 'Dg', '在线点歌', '使用百度音乐api实现微信端在线点歌功能', '1', '{\"keyword\":\"\\u70b9\\u6b4c\"}', '艾逗笔', '1.0', '1451825183', '0', '0', '1', '1');
INSERT INTO `dc_addons` VALUES ('212', 'Suggestions', '意见反馈', '用户在微信里输入“意见反馈”四个字时，返回一个图文信息，引导用户进入填写建议意见的3G页面，用户填写信息提交后显示感谢之意并提示关闭页面返回微信\r\n管理员可以在管理中心里看到用户反馈的内容列表，并对内容进行编辑，删除操作', '1', '{\"title\":\"\\u610f\\u89c1\\u53cd\\u9988\",\"cover\":\"\",\"desc\":\"\\u70b9\\u6b64\\u8fdb\\u5165\",\"need_nickname\":\"1\",\"need_mobile\":\"1\",\"admin_id\":\"\"}', '艾逗笔', '1.0', '1451825186', '0', '0', '2', '1');
INSERT INTO `dc_addons` VALUES ('213', 'Leaflets', '微信宣传页', '微信公众号二维码推广页面，用作推广或者制作广告易拉宝，可以发布到QQ群微博博客论坛等等...', '1', '{\"title\":\"\\u8c46\\u4fe1\\u5b98\\u65b9\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7\",\"img\":\"\",\"info\":\"\\u8c46\\u4fe1\\u662f\\u4e00\\u4e2a\\u4f18\\u96c5\\u7684\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7\\u5f00\\u53d1\\u6846\\u67b6\\uff0c\\u4ea7\\u54c1\\u7406\\u5ff5\\u662f\\u201c\\u9ad8\\u5ea6\\u5c01\\u88c5\\u3001\\u7075\\u6d3b\\u8c03\\u7528\\u201d\",\"copyright\":\"\\u00a92015 \\u8c46\\u4fe1\\u7248\\u6743\\u6240\\u6709\"}', '凡星', '1.0', '1451825189', '0', '0', '3', '1');
INSERT INTO `dc_addons` VALUES ('214', 'AddressManage', '地址管理', '通用地址管理插件', '1', 'null', '艾逗笔', '1.0', '1452417210', '1', '0', '0', '1');
INSERT INTO `dc_addons` VALUES ('215', 'Payment', '支付通', '微信支付,财富通,支付宝', '1', '{\"isopen\":\"1\",\"isopenload\":\"1\",\"isopenwx\":\"1\"}', '拉帮姐派(陌路生人)', '0.1', '1452417237', '1', '0', '0', '1');
INSERT INTO `dc_addons` VALUES ('217', 'Tuling', '图灵机器人', '使用图灵机器人接口实现微信端智能聊天，支持语音识别', '1', '{\"tuling_key\":\"d812d695a5e0df258df952698faca6cc\",\"tuling_url\":\"http:\\/\\/www.tuling123.com\\/openapi\\/api\",\"rand_reply\":\"\\r\\n\\u6211\\u4eca\\u5929\\u7d2f\\u4e86\\uff0c\\u660e\\u5929\\u518d\\u966a\\u4f60\\u804a\\u5929\\u5427\\r\\n\\u54c8\\u54c8~~\\r\\n\\u4f60\\u8bdd\\u597d\\u591a\\u554a\\uff0c\\u4e0d\\u8ddf\\u4f60\\u804a\\u4e86\\r\\n\\u867d\\u7136\\u4e0d\\u61c2\\uff0c\\u4f46\\u89c9\\u5f97\\u4f60\\u8bf4\\u5f97\\u5f88\\u5bf9\"}', '艾逗笔', '2.0', '1452477316', '0', '0', '1', '1');
INSERT INTO `dc_addons` VALUES ('221', 'Weather', '天气预报', '百度天气预报，输入关键字：城市+天气', '1', 'null', 'Arthur', '0.1', '1453969719', '1', '0', '4', '1');
INSERT INTO `dc_addons` VALUES ('225', 'Scratch', '刮刮卡', '刮刮卡', '1', 'null', '凡星', '0.1', '1455856166', '1', '0', '4', '1');
INSERT INTO `dc_addons` VALUES ('226', 'Idioms', '成语接龙', '当用户在微信中回复“成语接龙”时开始成语接龙游戏', '1', 'null', '艾逗笔', '1.0', '1455856170', '0', '0', null, '1');
INSERT INTO `dc_addons` VALUES ('224', 'Xydzp', '幸运大转盘', '网络上最热门的抽奖活动 支持作弊等各种详细配置', '1', '{\"need_trueljinfo\":\"1\"}', '南方卫视', '0.1', '1455856163', '1', '0', '4', '1');

-- ----------------------------
-- Table structure for `dc_addon_category`
-- ----------------------------
DROP TABLE IF EXISTS `dc_addon_category`;
CREATE TABLE `dc_addon_category` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `icon` int(10) unsigned default NULL COMMENT '分类图标',
  `title` varchar(255) default NULL COMMENT '分类名',
  `sort` int(10) default '0' COMMENT '排序号',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件分类表';

-- ----------------------------
-- Records of dc_addon_category
-- ----------------------------
INSERT INTO `dc_addon_category` VALUES ('1', '0', '主要业务', '1');
INSERT INTO `dc_addon_category` VALUES ('2', '0', '客户关系', '2');
INSERT INTO `dc_addon_category` VALUES ('3', '0', '营销及活动', '3');
INSERT INTO `dc_addon_category` VALUES ('4', '0', '常用服务及工具', '4');
INSERT INTO `dc_addon_category` VALUES ('5', '0', '行业解决方案', '5');
INSERT INTO `dc_addon_category` VALUES ('10', '0', '其他', '6');

-- ----------------------------
-- Table structure for `dc_address`
-- ----------------------------
DROP TABLE IF EXISTS `dc_address`;
CREATE TABLE `dc_address` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `token` varchar(255) NOT NULL COMMENT '公众号token',
  `openid` varchar(255) NOT NULL COMMENT '微信用户id',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `sex` int(10) NOT NULL COMMENT '性别',
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `country` varchar(255) NOT NULL COMMENT '国家',
  `province` varchar(255) NOT NULL COMMENT '省份',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `area` varchar(255) NOT NULL COMMENT '地区',
  `is_default` int(10) NOT NULL default '0' COMMENT '是否默认',
  `postcode` varchar(255) default NULL COMMENT '邮政编码',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_address
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_analysis`
-- ----------------------------
DROP TABLE IF EXISTS `dc_analysis`;
CREATE TABLE `dc_analysis` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `sports_id` int(10) default NULL COMMENT 'sports_id',
  `type` varchar(30) default NULL COMMENT 'type',
  `time` varchar(50) default NULL COMMENT 'time',
  `total_count` int(10) default '0' COMMENT 'total_count',
  `follow_count` int(10) default '0' COMMENT 'follow_count',
  `aver_count` int(10) default '0' COMMENT 'aver_count',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_analysis
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_article_style`
-- ----------------------------
DROP TABLE IF EXISTS `dc_article_style`;
CREATE TABLE `dc_article_style` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `group_id` int(10) default '0' COMMENT '分组样式',
  `style` text COMMENT '样式内容',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_article_style
-- ----------------------------
INSERT INTO `dc_article_style` VALUES ('1', '1', '<section style=\"border: 0px none; padding: 0px; box-sizing: border-box; margin: 0px; font-family: 微软雅黑;\"><section class=\"main\" style=\"border: none rgb(0,187,236); margin: 0.8em 5% 0.3em; box-sizing: border-box; padding: 0px;\"><section class=\"main2 wxqq-color wxqq-bordertopcolor wxqq-borderleftcolor wxqq-borderrightcolor wxqq-borderbottomcolor\" data-brushtype=\"text\" style=\"color: rgb(0,187,236); font-size: 20px; letter-spacing: 3px; padding: 9px 4px 14px; text-align: center; margin: 0px auto; border: 4px solid rgb(0,187,236); border-top-left-radius: 8px; border-top-right-radius: 8px; border-bottom-right-radius: 8px; border-bottom-left-radius: 8px; box-sizing: border-box;\">理念<span class=\"main3 wxqq-color\" data-brushtype=\"text\" style=\"display: block; font-size: 10px; line-height: 12px; border-color: rgb(0,187,236); color: inherit; box-sizing: border-box; padding: 0px; margin: 0px;\">PHILOSOPHY</span></section><section class=\"main4 wxqq-bordertopcolor wxqq-borderbottomcolor\" style=\"width: 0px; margin-right: auto; margin-left: auto; border-top-width: 0.6em; border-top-style: solid; border-bottom-color: rgb(0,187,236); border-top-color: rgb(0,187,236); height: 10px; color: inherit; border-left-width: 0.7em !important; border-left-style: solid !important; border-left-color: transparent !important; border-right-width: 0.7em !important; border-right-style: solid !important; border-right-color: transparent !important; box-sizing: border-box; padding: 0px;\" data-width=\"0px\"></section></section></section>');
INSERT INTO `dc_article_style` VALUES ('2', '3', '<section label=\"Copyright © 2015 playhudong All Rights Reserved.\" style=\"\r\nmargin:1em auto;\r\npadding: 1em 2em;\r\nborder-style: none;\" id=\"shifu_c_001\"><span style=\"\r\nfloat: left;\r\nmargin-left: 19px;\r\nmargin-top: -9px;\r\noverflow: hidden;\r\ndisplay:block;\"><img style=\"\r\nvertical-align: top;\r\ndisplay:inline-block;\" src=\"http://1251001145.cdn.myqcloud.com/1251001145/style/images/card-3.gif\"><section class=\"color\" style=\"\r\nmin-height: 30px;\r\ncolor: #fff;\r\ndisplay: inline-block;\r\ntext-align: center;\r\nbackground: #999999;\r\nfont-size: 15px;\r\npadding: 7px 5px;\r\nmin-width: 30px;\"><span style=\"font-size:15px;\"> 01 </span></section></span><section style=\"\r\npadding: 16px;\r\npadding-top: 28px;\r\nborder: 2px solid #999999;\r\nwidth: 100%;\r\nfont-size: 14px;\r\nline-height: 1.4;\"><span>星期一天气晴我离开你／不带任何行李／除了一本陪我放逐的日记／今天天晴／心情很低／突然决定离开你</span></section></section>');
INSERT INTO `dc_article_style` VALUES ('3', '1', '<section><section class=\"wxqq-borderleftcolor wxqq-borderRightcolor wxqq-bordertopcolor wxqq-borderbottomcolor\" style=\"border:5px solid #A50003;padding:5px;width:100%;\"><section class=\"wxqq-borderleftcolor wxqq-borderRightcolor wxqq-bordertopcolor wxqq-borderbottomcolor\" style=\"border:1px solid #A50003;padding:15px 20px;\"><p style=\"color:#A50003;text-align:center;border-bottom:1px solid #A50003\"><span class=\"wxqq-color\" data-brushtype=\"text\" style=\"font-size:48px\">情人节快乐</span></p><section data-style=\"color:#A50003;text-align:center;font-size:18px\" style=\"color:#A50003;text-align:center;width:96%;margin-left:5px;\"><p class=\"wxqq-color\" style=\"color:#A50003;text-align:center;font-size:18px\">happy valentine\'s day<span style=\"color:inherit; font-size:24px; line-height:1.6em; text-align:right; text-indent:2em\"></span><span style=\"color:rgb(227, 108, 9); font-size:24px; line-height:1.6em; text-align:right; text-indent:2em\"></span></p><section style=\"width:100%;\"><section><section><p style=\"color:#000;text-align:left;\">我们没有秘密，整天花前月下，别人以为我们不懂爱情，我们乐呵呵地笑大人们都太傻。</p></section></section></section></section></section></section></section>');
INSERT INTO `dc_article_style` VALUES ('4', '4', '<p><img src=\"http://www.wxbj.cn//ys/gz/gx2.gif\"></p>');
INSERT INTO `dc_article_style` VALUES ('5', '5', '<section class=\"tn-Powered-by-XIUMI\" style=\"margin-top: 0.5em; margin-bottom: 0.5em; border: none rgb(142, 201, 101); font-size: 14px; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: rgb(142, 201, 101);\"><img data-src=\"http://mmbiz.qpic.cn/mmbiz/4HiaqFGEibVwaxcmNMU5abRHm7bkZ9icUxC3DrlItWpOnXSjEpZXIeIr2K0923xw43aKw8oibucqm8wkMYZvmibqDkg/0?wx_fmt=png\" class=\"tn-Powered-by-XIUMI\" data-type=\"png\" data-ratio=\"0.8055555555555556\" data-w=\"36\" _width=\"2.6em\" src=\"https://mmbiz.qlogo.cn/mmbiz/4HiaqFGEibVwaxcmNMU5abRHm7bkZ9icUxC3DrlItWpOnXSjEpZXIeIr2K0923xw43aKw8oibucqm8wkMYZvmibqDkg/640?wx_fmt=png\" style=\"float: right; width: 2.6em !important; visibility: visible !important; background-color: rgb(142, 201, 101);\"><section class=\"tn-Powered-by-XIUMI\" style=\"clear: both;\"></section><section class=\"tn-Powered-by-XIUMI\" style=\"padding-right: 10px; padding-left: 10px; text-align: center;\"><section class=\"tn-Powered-by-XIUMI\" style=\"text-align: left;\">炎热的夏季，应该吃点什么好呢！我们为您打造7月盛夏美食狂欢季，清暑解渴的热带水果之王【芒果下午茶】，海鲜盛宴上的【生蚝狂欢】，肉食者的天堂【澳洲之夜】，呼朋唤友，户外聚餐的最佳攻略【夏季BBQ】，消暑瘦身利器【迷你冬瓜盅】，清淡亦或重口味，总有一款是你所爱！</section></section><img data-src=\"http://mmbiz.qpic.cn/mmbiz/4HiaqFGEibVwaxcmNMU5abRHm7bkZ9icUxCkEmrfLmAXYYOXO0q4RGYsQqfzhO6SOdoFCTqYqwlS87ovGrQjCYmWw/0?wx_fmt=png\" class=\"tn-Powered-by-XIUMI\" data-type=\"png\" data-ratio=\"0.8055555555555556\" data-w=\"36\" _width=\"2.6em\" src=\"https://mmbiz.qlogo.cn/mmbiz/4HiaqFGEibVwaxcmNMU5abRHm7bkZ9icUxCkEmrfLmAXYYOXO0q4RGYsQqfzhO6SOdoFCTqYqwlS87ovGrQjCYmWw/640?wx_fmt=png\" style=\"width: 2.6em !important; visibility: visible !important; background-color: rgb(142, 201, 101);\"><p><br></p></section>');
INSERT INTO `dc_article_style` VALUES ('8', '6', '<blockquote class=\"wxqq-borderTopColor wxqq-borderRightColor wxqq-borderBottomColor wxqq-borderLeftColor\" style=\"border: 3px dotted rgb(230, 37, 191); padding: 10px; margin: 10px 0px; font-weight: normal; border-top-left-radius: 5px !important; border-top-right-radius: 5px !important; border-bottom-right-radius: 5px !important; border-bottom-left-radius: 5px !important;\"><h3 style=\"color:rgb(89,89,89);font-size:14px;margin:0;\"><span class=\"wxqq-bg\" style=\"background-color: rgb(230, 37, 191); color: rgb(255, 255, 255); padding: 2px 5px; font-size: 14px; margin-right: 15px; border-top-left-radius: 5px !important; border-top-right-radius: 5px !important; border-bottom-right-radius: 5px !important; border-bottom-left-radius: 5px !important;\">微信编辑器</span>微信号：<span class=\"wxqq-bg\" style=\"background-color: rgb(230, 37, 191); color: rgb(255, 255, 255); padding: 2px 5px; font-size: 14px; border-top-left-radius: 5px !important; border-top-right-radius: 5px !important; border-bottom-right-radius: 5px !important; border-bottom-left-radius: 5px !important;\">wxbj.cn</span></h3><p style=\"margin:10px 0 5px 0;\">微信公众号简介，欢迎使用微信在线图文排版编辑器助手！</p></blockquote>');
INSERT INTO `dc_article_style` VALUES ('9', '8', '<p><img src=\"http://www.wxbj.cn/ys/gz/yw1.gif\"></p>');
INSERT INTO `dc_article_style` VALUES ('7', '7', '<p><img src=\"https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhuxibIOsThcH7HF1lpQ0Yvkvh88U3ia9AbTPJSmriawnJ7W7S5iblSlSianbHLGO6IvD0N4g2y2JEFRoA/0/mmbizgif\"></p>');

-- ----------------------------
-- Table structure for `dc_article_style_group`
-- ----------------------------
DROP TABLE IF EXISTS `dc_article_style_group`;
CREATE TABLE `dc_article_style_group` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `group_name` varchar(255) default NULL COMMENT '分组名称',
  `desc` text COMMENT '说明',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_article_style_group
-- ----------------------------
INSERT INTO `dc_article_style_group` VALUES ('1', '标题', '标题样式');
INSERT INTO `dc_article_style_group` VALUES ('3', '卡片', '类卡片样式');
INSERT INTO `dc_article_style_group` VALUES ('4', '关注', '引导关注公众号的样式');
INSERT INTO `dc_article_style_group` VALUES ('5', '内容', '内容样式');
INSERT INTO `dc_article_style_group` VALUES ('6', '互推', '互推公众号的样式');
INSERT INTO `dc_article_style_group` VALUES ('7', '分割', '分割样式');
INSERT INTO `dc_article_style_group` VALUES ('8', '原文引导', '原文引导样式');

-- ----------------------------
-- Table structure for `dc_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `dc_attachment`;
CREATE TABLE `dc_attachment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) default '0' COMMENT '用户ID',
  `title` char(30) NOT NULL default '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL default '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL default '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL default '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL default '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL default '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL default '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL default '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL default '0' COMMENT '状态',
  PRIMARY KEY  (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of dc_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `dc_attribute`;
CREATE TABLE `dc_attribute` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '' COMMENT '字段名',
  `title` varchar(100) NOT NULL default '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL default '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL default '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL default '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL default '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL default '1' COMMENT '是否显示',
  `extra` text NOT NULL COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL default '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL default '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL default '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL default '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL default '',
  `validate_time` tinyint(1) unsigned NOT NULL default '0',
  `error_info` varchar(100) NOT NULL default '',
  `validate_type` varchar(25) NOT NULL default '',
  `auto_rule` varchar(100) NOT NULL default '',
  `auto_time` tinyint(1) unsigned NOT NULL default '0',
  `auto_type` varchar(25) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of dc_attribute
-- ----------------------------
INSERT INTO `dc_attribute` VALUES ('5', 'nickname', '用户名', 'text NULL', 'string', '', '', '0', '', '1', '1', '1', '1447302832', '1436929161', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('6', 'password', '登录密码', 'varchar(100) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302859', '1436929210', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('7', 'truename', '真实姓名', 'varchar(30) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302886', '1436929252', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('8', 'mobile', '联系电话', 'varchar(30) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302825', '1436929280', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('9', 'email', '邮箱地址', 'varchar(100) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302817', '1436929305', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('10', 'sex', '性别', 'tinyint(2) NULL', 'radio', '', '', '0', '0:保密\r\n1:男\r\n2:女', '1', '0', '1', '1447302800', '1436929397', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11', 'headimgurl', '头像地址', 'varchar(255) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302811', '1436929482', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12', 'city', '城市', 'varchar(30) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302793', '1436929506', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('13', 'province', '省份', 'varchar(30) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302787', '1436929524', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('14', 'country', '国家', 'varchar(30) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302781', '1436929541', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('15', 'language', '语言', 'varchar(20) NULL', 'string', 'zh-cn', '', '0', '', '1', '0', '1', '1447302725', '1436929571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('16', 'score', '金币值', 'int(10) NULL', 'num', '0', '', '0', '', '1', '0', '1', '1447302731', '1436929597', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('17', 'experience', '经验值', 'int(10) NULL', 'num', '0', '', '0', '', '1', '0', '1', '1447302738', '1436929619', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('18', 'unionid', '微信第三方ID', 'varchar(50) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302717', '1436929681', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('19', 'login_count', '登录次数', 'int(10) NULL', 'num', '0', '', '0', '', '1', '0', '1', '1447302710', '1436930011', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('20', 'reg_ip', '注册IP', 'varchar(30) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302746', '1436930035', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('21', 'reg_time', '注册时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1', '0', '1', '1447302754', '1436930051', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('22', 'last_login_ip', '最近登录IP', 'varchar(30) NULL', 'string', '', '', '0', '', '1', '0', '1', '1447302761', '1436930072', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('23', 'last_login_time', '最近登录时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1', '0', '1', '1447302770', '1436930087', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('24', 'status', '状态', 'tinyint(2) NULL', 'bool', '1', '', '0', '0:禁用\r\n1:启用', '1', '0', '1', '1447302703', '1436930138', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('25', 'is_init', '初始化状态', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:未初始化\r\n1:已初始化', '1', '0', '1', '1447302696', '1436930184', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('26', 'is_audit', '审核状态', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:未审核\r\n1:已审核', '1', '0', '1', '1447302688', '1436930216', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('27', 'subscribe_time', '用户关注公众号时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1', '0', '1', '1437720655', '1437720655', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('28', 'remark', '微信用户备注', 'varchar(100) NULL', 'string', '', '', '0', '', '1', '0', '1', '1437720686', '1437720686', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('29', 'groupid', '微信端的分组ID', 'int(10) NULL', 'num', '', '', '0', '', '1', '0', '1', '1437720714', '1437720714', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('4', 'come_from', '来源', 'tinyint(1) NULL', 'select', '0', '', '0', '0:PC注册用户\r\n1:微信同步用户\r\n2:手机注册用户', '1', '0', '1', '1447302852', '1438331357', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('31', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '1', '', '2', '1', '1', '1436932588', '1436932588', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('32', 'has_public', '是否配置公众号', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '2', '0', '1', '1436933464', '1436933464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('33', 'headface_url', '管理员头像', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '2', '0', '1', '1436933503', '1436933503', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('34', 'GammaAppId', '摇电视的AppId', 'varchar(30) NULL', 'string', '', '', '1', '', '2', '0', '1', '1436933562', '1436933562', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('35', 'GammaSecret', '摇电视的Secret', 'varchar(100) NULL', 'string', '', '', '1', '', '2', '0', '1', '1436933602', '1436933602', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('36', 'copy_right', '授权信息', 'varchar(255) NULL', 'string', '', '', '1', '', '2', '0', '1', '1436933690', '1436933690', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('37', 'tongji_code', '统计代码', 'text NULL', 'textarea', '', '', '1', '', '2', '0', '1', '1436933778', '1436933778', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('38', 'website_logo', '网站LOGO', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '2', '0', '1', '1436934006', '1436934006', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('39', 'menu_type', '菜单类型', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:顶级菜单|pid@hide\r\n1:侧栏菜单|pid@show', '3', '0', '1', '1435218508', '1435216049', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('40', 'pid', '上级菜单', 'varchar(50) NULL', 'cascade', '0', '', '1', 'type=db&table=manager_menu&menu_type=0&uid=[manager_id]', '3', '0', '1', '1438858450', '1435216147', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('41', 'title', '菜单名', 'varchar(50) NULL', 'string', '', '', '1', '', '3', '1', '1', '1435216185', '1435216185', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('42', 'url_type', '链接类型', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:插件|addon_name@show,url@hide\r\n1:外链|addon_name@hide,url@show', '3', '0', '1', '1435218596', '1435216291', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('43', 'addon_name', '插件名', 'varchar(30) NULL', 'dynamic_select', '', '', '1', 'table=addons&type=0&value_field=name&title_field=title&order=id asc', '3', '0', '1', '1439433250', '1435216373', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('44', 'url', '外链', 'varchar(255) NULL', 'string', '', '', '1', '', '3', '0', '1', '1435216436', '1435216436', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('45', 'target', '打开方式', 'char(50) NULL', 'select', '_self', '', '1', '_self:当前窗口打开\r\n_blank:在新窗口打开', '3', '0', '1', '1435216626', '1435216626', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('46', 'is_hide', '是否隐藏', 'tinyint(2) NULL', 'radio', '0', '', '1', '0:否\r\n1:是', '3', '0', '1', '1435216697', '1435216697', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('47', 'sort', '排序号', 'int(10) NULL', 'num', '0', '值越小越靠前', '1', '', '3', '0', '1', '1435217270', '1435217270', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('48', 'uid', '管理员ID', 'int(10) NULL', 'num', '', '', '4', '', '3', '0', '1', '1435224916', '1435223957', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('49', 'keyword', '关键词', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '4', '1', '1', '1388815953', '1388815953', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('50', 'addon', '关键词所属插件', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '4', '1', '1', '1388816207', '1388816207', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('51', 'aim_id', '插件表里的ID值', 'int(10) unsigned NOT NULL ', 'num', '', '', '1', '', '4', '1', '1', '1388816287', '1388816287', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('52', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '4', '0', '1', '1407251221', '1388816392', '', '1', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('53', 'token', 'Token', 'varchar(100) NULL ', 'string', '', '', '0', '', '4', '0', '1', '1408945788', '1391399528', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('54', 'keyword_length', '关键词长度', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '4', '0', '1', '1407251147', '1393918566', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('55', 'keyword_type', '匹配类型', 'tinyint(2) NULL ', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '4', '0', '1', '1417745067', '1393919686', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('56', 'extra_text', '文本扩展', 'text NULL ', 'textarea', '', '', '0', '', '4', '0', '1', '1407251248', '1393919736', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('57', 'extra_int', '数字扩展', 'int(10) NULL ', 'num', '', '', '0', '', '4', '0', '1', '1407251240', '1393919798', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('58', 'request_count', '请求数', 'int(10) NULL', 'num', '0', '用户回复的次数', '0', '', '4', '0', '1', '1401938983', '1401938983', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('59', 'qr_code', '二维码', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '1', '1', '1406127577', '1388815953', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('60', 'addon', '二维码所属插件', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '1', '1', '1406127594', '1388816207', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('61', 'aim_id', '插件表里的ID值', 'int(10) unsigned NOT NULL ', 'num', '', '', '1', '', '5', '1', '1', '1388816287', '1388816287', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('62', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '1', '', '5', '0', '1', '1388816392', '1388816392', '', '1', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('63', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '5', '0', '1', '1391399528', '1391399528', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('64', 'action_name', '二维码类型', 'char(30) NULL', 'select', 'QR_SCENE', 'QR_SCENE为临时,QR_LIMIT_SCENE为永久 ', '1', 'QR_SCENE:临时二维码\r\nQR_LIMIT_SCENE:永久二维码', '5', '0', '1', '1406130162', '1393919686', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('65', 'extra_text', '文本扩展', 'text NULL ', 'textarea', '', '', '1', '', '5', '0', '1', '1393919736', '1393919736', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('66', 'extra_int', '数字扩展', 'int(10) NULL ', 'num', '', '', '1', '', '5', '0', '1', '1393919798', '1393919798', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('67', 'request_count', '请求数', 'int(10) NULL', 'num', '0', '用户回复的次数', '0', '', '5', '0', '1', '1402547625', '1401938983', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('68', 'scene_id', '场景ID', 'int(10) NULL', 'num', '0', '', '1', '', '5', '0', '1', '1406127542', '1406127542', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('69', 'is_use', '是否为当前公众号', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '6', '0', '1', '1391682184', '1391682184', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('70', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '6', '0', '1', '1402453598', '1391597344', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('71', 'uid', '用户ID', 'int(10) NULL ', 'num', '', '', '0', '', '6', '1', '1', '1391575873', '1391575210', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('72', 'public_name', '公众号名称', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '6', '1', '1', '1391576452', '1391575955', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('73', 'public_id', '公众号原始id', 'varchar(100) NOT NULL', 'string', '', '请正确填写，保存后不能再修改，且无法接收到微信的信息', '1', '', '6', '1', '1', '1402453976', '1391576015', '', '1', '公众号原始ID已经存在，请不要重复增加', 'unique', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('74', 'wechat', '微信号', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '6', '1', '1', '1391576484', '1391576144', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('75', 'interface_url', '接口地址', 'varchar(255) NULL', 'string', '', '', '0', '', '6', '0', '1', '1392946881', '1391576234', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('76', 'headface_url', '公众号头像', 'varchar(255) NULL', 'picture', '', '', '1', '', '6', '0', '1', '1429847363', '1391576300', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('77', 'area', '地区', 'varchar(50) NULL', 'string', '', '', '0', '', '6', '0', '1', '1392946934', '1391576435', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('78', 'addon_config', '插件配置', 'text NULL', 'textarea', '', '', '0', '', '6', '0', '1', '1391576537', '1391576537', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('79', 'addon_status', '插件状态', 'text NULL', 'textarea', '', '', '0', '198:微官网\r\n199:自动回复\r\n218:自定义菜单\r\n201:多客服\r\n227:自定义回复\r\n220:360全景\r\n202:模板消息\r\n204:场景二维码\r\n205:微信用户中心\r\n206:微商城\r\n207:功能演示\r\n208:微捐赠\r\n209:融合第三方\r\n210:通用表单\r\n211:在线点歌\r\n212:意见反馈\r\n213:微信宣传页\r\n214:地址管理\r\n215:支付通\r\n217:图灵机器人\r\n221:天气预报\r\n225:刮刮卡\r\n226:成语接龙\r\n224:幸运大转盘\r\n', '6', '0', '1', '1391576571', '1391576571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12114', 'qrcode_url', '二维码地址', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1448957495', '1448957495', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('80', 'type', '公众号类型', 'char(10) NULL', 'radio', '0', '', '1', '0:普通订阅号\r\n1:认证订阅号/普通服务号\r\n2:认证服务号', '6', '0', '1', '1416904702', '1393718575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('81', 'appid', 'AppID', 'varchar(255) NULL', 'string', '', '应用ID', '1', '', '6', '0', '1', '1416904750', '1393718735', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('82', 'secret', 'AppSecret', 'varchar(255) NULL', 'string', '', '应用密钥', '1', '', '6', '0', '1', '1416904771', '1393718806', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('83', 'group_id', '等级', 'int(10) unsigned NULL ', 'select', '0', '', '0', '', '6', '0', '1', '1393753499', '1393724468', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('84', 'is_audit', '是否审核', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '6', '1', '1', '1430879018', '1430879007', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('85', 'is_init', '是否初始化', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '6', '1', '1', '1430888244', '1430878899', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('86', 'encodingaeskey', 'EncodingAESKey', 'varchar(255) NULL', 'string', '', '安全模式下必填', '1', '', '6', '0', '1', '1419775850', '1419775850', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('87', 'tips_url', '提示关注公众号的文章地址', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1420789769', '1420789769', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('88', 'GammaAppId', 'GammaAppId', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1424529968', '1424529968', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('89', 'GammaSecret', 'GammaSecret', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1424529990', '1424529990', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('90', 'public_copy_right', '版权信息', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1431141576', '1431141576', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('91', 'domain', '自定义域名', 'varchar(30) NULL', 'string', '', '', '0', '', '6', '0', '1', '1439698931', '1439698931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('92', 'title', '等级名', 'varchar(50) NULL', 'string', '', '', '1', '', '7', '0', '1', '1393724854', '1393724854', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('93', 'addon_status', '插件权限', 'text NULL', 'checkbox', '', '', '1', '198:微官网\r\n199:自动回复\r\n218:自定义菜单\r\n201:多客服\r\n227:自定义回复\r\n220:360全景\r\n202:模板消息\r\n204:场景二维码\r\n205:微信用户中心\r\n206:微商城\r\n207:功能演示\r\n208:微捐赠\r\n209:融合第三方\r\n210:通用表单\r\n211:在线点歌\r\n212:意见反馈\r\n213:微信宣传页\r\n214:地址管理\r\n215:支付通\r\n217:图灵机器人\r\n221:天气预报\r\n225:刮刮卡\r\n226:成语接龙\r\n224:幸运大转盘\r\n', '7', '0', '1', '1393731903', '1393725072', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12113', 'mp_token', '公众号接入验证Token', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1448956397', '1448956397', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('94', 'uid', '管理员UID', 'int(10) NULL ', 'admin', '', '', '1', '', '8', '1', '1', '1447215599', '1398933236', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('95', 'mp_id', '公众号ID', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '8', '1', '1', '1398933300', '1398933300', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('96', 'is_creator', '是否为创建者', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:不是\r\n1:是', '8', '0', '1', '1398933380', '1398933380', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('97', 'addon_status', '插件权限', 'text NULL', 'checkbox', '', '', '1', '198:微官网\r\n199:自动回复\r\n218:自定义菜单\r\n201:多客服\r\n227:自定义回复\r\n220:360全景\r\n202:模板消息\r\n204:场景二维码\r\n205:微信用户中心\r\n206:微商城\r\n207:功能演示\r\n208:微捐赠\r\n209:融合第三方\r\n210:通用表单\r\n211:在线点歌\r\n212:意见反馈\r\n213:微信宣传页\r\n214:地址管理\r\n215:支付通\r\n217:图灵机器人\r\n221:天气预报\r\n225:刮刮卡\r\n226:成语接龙\r\n224:幸运大转盘\r\n', '8', '0', '1', '1398933475', '1398933475', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12111', 'mp_username', '公众号登陆用户名', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1448956330', '1448956330', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12112', 'mp_password', '公众号登陆密码', 'varchar(255) NULL', 'string', '', '', '1', '', '6', '0', '1', '1448956378', '1448956378', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('98', 'is_use', '是否为当前管理的公众号', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:不是\r\n1:是', '8', '0', '1', '1398996982', '1398996975', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('99', 'attach', '上传文件', 'int(10) unsigned NOT NULL ', 'file', '', '支持xls,xlsx两种格式', '1', '', '9', '1', '1', '1407554177', '1407554177', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('100', 'icon', '分类图标', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '10', '0', '1', '1400047745', '1400047745', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('101', 'title', '分类名', 'varchar(255) NULL', 'string', '', '', '1', '', '10', '0', '1', '1400047764', '1400047764', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('102', 'sort', '排序号', 'int(10) NULL', 'num', '0', '值越小越靠前', '1', '', '10', '0', '1', '1400050453', '1400047786', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('110', 'name', '分类标识', 'varchar(255) NULL', 'string', '', '只能使用英文', '0', '', '12', '0', '1', '1403711345', '1397529355', '', '3', '只能输入由数字、26个英文字母或者下划线组成的标识名', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('111', 'title', '分类标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '12', '1', '1', '1397529407', '1397529407', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('112', 'icon', '分类图标', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '12', '0', '1', '1397529461', '1397529461', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('113', 'pid', '上一级分类', 'int(10) unsigned NULL ', 'select', '0', '如果你要增加一级分类，这里选择“无”即可', '1', '0:无', '12', '0', '1', '1398266132', '1397529555', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('114', 'path', '分类路径', 'varchar(255) NULL', 'string', '', '', '0', '', '12', '0', '1', '1397529604', '1397529604', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('115', 'module', '分类所属功能', 'varchar(255) NULL', 'string', '', '', '0', '', '12', '0', '1', '1397529671', '1397529671', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('116', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '数值越小越靠前', '1', '', '12', '0', '1', '1397529705', '1397529705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('117', 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '12', '0', '1', '1397532496', '1397529809', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('118', 'intro', '分类描述', 'varchar(255) NULL', 'string', '', '', '1', '', '12', '0', '1', '1398414247', '1398414247', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('119', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '12', '0', '1', '1398593086', '1398523502', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('120', 'code', '分类扩展编号', 'varchar(255) NULL', 'string', '', '原分类或者导入分类的扩展编号', '0', '', '12', '0', '1', '1404182741', '1404182630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('121', 'cTime', '发布时间', 'int(10) UNSIGNED NULL', 'datetime', '', '', '0', '', '13', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('122', 'name', '分组标识', 'varchar(100) NOT NULL', 'string', '', '英文字母或者下划线，长度不超过30', '1', '', '13', '1', '1', '1403624543', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('123', 'title', '分组标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '13', '1', '1', '1403624556', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('124', 'level', '最多级数', 'tinyint(1) unsigned NULL', 'select', '3', '', '1', '1:1级\r\n2:2级\r\n3:3级\r\n4:4级\r\n5:5级\r\n6:6级\r\n7:7级', '13', '0', '1', '1404193097', '1404192897', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('125', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '13', '1', '1', '1408947244', '1396602859', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('126', 'title', '积分描述', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '14', '1', '1', '1438589622', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('127', 'name', '积分标识', 'varchar(50) NULL', 'string', '', '', '1', '', '14', '0', '1', '1438589601', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('128', 'mTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '14', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('129', 'experience', '经验值', 'int(10) NULL', 'num', '0', '可以是正数，也可以是负数，如 -10 表示减10个经验值', '1', '', '14', '0', '1', '1398564024', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('130', 'score', '金币值', 'int(10) NULL', 'num', '0', '可以是正数，也可以是负数，如 -10 表示减10个金币值', '1', '', '14', '0', '1', '1398564097', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('131', 'token', 'Token', 'varchar(255) NULL', 'string', '0', '', '0', '', '14', '0', '1', '1398564146', '1396602859', '', '3', '', 'regex', '', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('132', 'credit_name', '积分标识', 'varchar(50) NULL', 'string', '', '', '1', '', '15', '0', '1', '1398564405', '1398564405', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('133', 'uid', '用户ID', 'int(10) NULL', 'num', '0', '', '1', '', '15', '0', '1', '1398564351', '1398564351', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('134', 'experience', '经验值', 'int(10) NULL', 'num', '0', '', '1', '', '15', '0', '1', '1398564448', '1398564448', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('135', 'score', '金币值', 'int(10) NULL', 'num', '0', '', '1', '', '15', '0', '1', '1398564486', '1398564486', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('136', 'cTime', '记录时间', 'int(10) NULL', 'datetime', '', '', '0', '', '15', '0', '1', '1398564567', '1398564567', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('137', 'admin_uid', '操作者UID', 'int(10) NULL', 'num', '0', '', '0', '', '15', '0', '1', '1398564629', '1398564629', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('138', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '15', '0', '1', '1400603451', '1400603451', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('139', 'cover_id', '图片在本地的ID', 'int(10) NULL', 'num', '', '', '0', '', '16', '0', '1', '1438684652', '1438684652', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('140', 'cover_url', '本地URL', 'varchar(255) NULL', 'string', '', '', '0', '', '16', '0', '1', '1438684692', '1438684692', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('141', 'media_id', '微信端图文消息素材的media_id', 'varchar(100) NULL', 'string', '0', '', '0', '', '16', '0', '1', '1438744962', '1438684776', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('142', 'wechat_url', '微信端的图片地址', 'varchar(255) NULL', 'string', '', '', '0', '', '16', '0', '1', '1439973558', '1438684807', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('143', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '16', '0', '1', '1438684829', '1438684829', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('144', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '16', '0', '1', '1438684847', '1438684847', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('145', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '16', '0', '1', '1438684865', '1438684865', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('146', 'title', '标题', 'varchar(100) NULL', 'string', '', '', '1', '', '17', '1', '1', '1438670933', '1438670933', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('147', 'author', '作者', 'varchar(30) NULL', 'string', '', '', '1', '', '17', '0', '1', '1438670961', '1438670961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('148', 'cover_id', '封面', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '17', '0', '1', '1438674438', '1438670980', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('149', 'intro', '摘要', 'varchar(255) NULL', 'textarea', '', '', '1', '', '17', '0', '1', '1438671024', '1438671024', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('150', 'content', '内容', 'longtext  NULL', 'editor', '', '', '1', '', '17', '0', '1', '1440473839', '1438671049', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('151', 'link', '外链', 'varchar(255) NULL', 'string', '', '', '1', '', '17', '0', '1', '1438671066', '1438671066', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('152', 'group_id', '多图文组的ID', 'int(10) NULL', 'num', '0', '0 表示单图文，多于0 表示多图文中的第一个图文的ID值', '0', '', '17', '0', '1', '1438671163', '1438671163', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('153', 'thumb_media_id', '图文消息的封面图片素材id（必须是永久mediaID）', 'varchar(100) NULL', 'string', '', '', '0', '', '17', '0', '1', '1438671302', '1438671285', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('154', 'media_id', '微信端图文消息素材的media_id', 'varchar(100) NULL', 'string', '0', '', '1', '', '17', '0', '1', '1438744941', '1438671373', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('155', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '17', '0', '1', '1438683172', '1438683172', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('156', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '17', '0', '1', '1438683194', '1438683194', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('157', 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', '0', '', '17', '0', '1', '1438683499', '1438683499', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('158', 'bind_keyword', '关联关键词', 'varchar(50) NULL', 'string', '', '先在自定义回复里增加图文，多图文或者文本内容，再把它的关键词填写到这里', '1', '', '18', '0', '1', '1437984209', '1437984184', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('159', 'preview_openids', '预览人OPENID', 'text NULL', 'textarea', '', '选填，多个可用逗号或者换行分开，OpenID值可在微信用户的列表中找到', '1', '', '18', '0', '1', '1438049470', '1437985038', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('160', 'group_id', '群发对象', 'int(10) NULL', 'dynamic_select', '0', '全部用户或者某分组用户', '1', 'table=auth_group&manager_id=[manager_id]&token=[token]&value_field=id&title_field=title&first_option=全部用户', '18', '0', '1', '1438049058', '1437985498', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('161', 'type', '素材来源', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:站内关键词|bind_keyword@show,media_id@hide\r\n1:微信永久素材ID|bind_keyword@hide,media_id@show', '18', '0', '1', '1437988869', '1437988869', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('162', 'media_id', '微信素材ID', 'varchar(100) NULL', 'string', '', '微信后台的素材管理里永久素材的media_id值', '1', '', '18', '0', '1', '1437988973', '1437988973', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('163', 'send_type', '发送方式', 'tinyint(1) NULL', 'bool', '0', '', '1', '0:按用户组发送|group_id@show,send_openids@hide\r\n1:指定OpenID发送|group_id@hide,send_openids@show', '18', '0', '1', '1438049241', '1438049241', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('164', 'send_openids', '要发送的OpenID', 'text NULL', 'textarea', '', '多个可用逗号或者换行分开，OpenID值可在微信用户的列表中找到', '1', '', '18', '0', '1', '1438049362', '1438049362', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('165', 'msg_id', 'msg_id', 'varchar(255) NULL', 'string', '', '', '0', '', '18', '0', '1', '1439980539', '1438054616', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('166', 'publicid', '公众号ID', 'int(10) NULL', 'num', '0', '', '0', '', '19', '0', '1', '1439448400', '1439448400', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('167', 'module_name', '类型名', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448516', '1439448516', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('168', 'controller_name', '控制器名', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448567', '1439448567', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('169', 'action_name', '方法名', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448616', '1439448616', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('170', 'uid', '访问者ID', 'varchar(255) NULL', 'string', '0', '', '0', '', '19', '0', '1', '1439448654', '1439448654', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('171', 'ip', 'ip地址', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448742', '1439448742', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('172', 'brower', '浏览器', 'varchar(30) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448792', '1439448792', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('173', 'param', '其它GET参数', 'text NULL', 'textarea', '', '', '0', '', '19', '0', '1', '1439448834', '1439448834', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('174', 'referer', '访问的URL', 'varchar(255) NULL', 'string', '', '', '0', '', '19', '0', '1', '1439448886', '1439448874', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('175', 'cTime', '时间', 'int(10) NULL', 'datetime', '', '', '0', '', '19', '0', '1', '1439450668', '1439450668', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('176', 'wechat_group_name', '微信端的分组名', 'varchar(100) NULL', 'string', '', '', '0', '', '20', '0', '1', '1437635205', '1437635205', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('177', 'wechat_group_id', '微信端的分组ID', 'int(10) NULL', 'num', '-1', '', '0', '', '20', '0', '1', '1447659224', '1437635149', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('178', 'qr_code', '微信二维码', 'varchar(255) NULL', 'string', '', '', '0', '', '20', '0', '1', '1437635117', '1437635117', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('179', 'is_default', '是否默认自动加入', 'tinyint(1) NULL', 'radio', '0', '只有设置一个默认组，设置当前为默认组后之前的默认组将取消', '0', '0:否\r\n1:是', '20', '0', '1', '1437642358', '1437635042', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('180', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '20', '0', '1', '1437634089', '1437634089', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('181', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '0', '为0时表示系统用户组', '0', '', '20', '0', '1', '1437634309', '1437634062', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('182', 'rules', '权限', 'text NULL', 'textarea', '', '', '0', '', '20', '0', '1', '1437634022', '1437634022', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('183', 'type', '类型', 'tinyint(2) NULL', 'bool', '1', '', '0', '0:普通用户组\r\n1:微信用户组\r\n2:等级用户组\r\n3:认证用户组', '20', '0', '1', '1437633981', '1437633981', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('184', 'status', '状态', 'tinyint(2) NULL', 'bool', '1', '', '0', '1:正常\r\n0:禁用\r\n-1:删除', '20', '0', '1', '1437633826', '1437633826', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('185', 'description', '描述信息', 'text NULL', 'textarea', '', '', '1', '', '20', '0', '1', '1437633751', '1437633751', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('186', 'icon', '图标', 'int(10) UNSIGNED NULL', 'picture', '', '', '0', '', '20', '0', '1', '1437633711', '1437633711', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('187', 'title', '分组名称', 'varchar(30) NULL', 'string', '', '', '1', '', '20', '1', '1', '1437641907', '1437633598', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('188', 'wechat_group_count', '微信端用户数', 'int(10) NULL', 'num', '', '', '0', '', '20', '0', '1', '1437644061', '1437644061', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('189', 'is_del', '是否已删除', 'tinyint(1) NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '20', '0', '1', '1437650054', '1437650044', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('190', 'sports_id', 'sports_id', 'int(10) NULL', 'num', '', '', '0', '', '21', '0', '1', '1432806979', '1432806979', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('191', 'type', 'type', 'varchar(30) NULL', 'string', '', '', '0', '', '21', '0', '1', '1432807001', '1432807001', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('192', 'time', 'time', 'varchar(50) NULL', 'string', '', '', '0', '', '21', '0', '1', '1432807028', '1432807028', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('193', 'total_count', 'total_count', 'int(10) NULL', 'num', '0', '', '0', '', '21', '0', '1', '1432807049', '1432807049', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('194', 'follow_count', 'follow_count', 'int(10) NULL', 'num', '0', '', '0', '', '21', '0', '1', '1432807063', '1432807063', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('195', 'aver_count', 'aver_count', 'int(10) NULL', 'num', '0', '', '0', '', '21', '0', '1', '1432807079', '1432807079', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('196', 'group_id', '分组样式', 'int(10) NULL', 'num', '0', '', '1', '', '22', '0', '1', '1436845570', '1436845570', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('197', 'style', '样式内容', 'text NULL', 'textarea', '', '请填写html', '1', '', '22', '1', '1', '1436846111', '1436846111', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('198', 'group_name', '分组名称', 'varchar(255) NULL', 'string', '', '', '1', '', '23', '1', '1', '1436845332', '1436845332', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('199', 'desc', '说明', 'text NULL', 'textarea', '', '', '1', '', '23', '0', '1', '1436845361', '1436845361', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('723', 'sn', 'SN码', 'varchar(255) NULL', 'string', '', '', '0', '', '81', '0', '1', '1399272236', '1399272228', '', '3', '', 'regex', 'uniqid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('724', 'uid', '粉丝UID', 'int(10) NULL', 'num', '', '', '0', '', '81', '0', '1', '1399772738', '1399272401', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('725', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '81', '0', '1', '1399272456', '1399272456', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('726', 'is_use', '是否已使用', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:未使用\r\n1:已使用', '81', '0', '1', '1400601159', '1399272514', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('727', 'use_time', '使用时间', 'int(10) NULL', 'datetime', '', '', '0', '', '81', '0', '1', '1399272560', '1399272537', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('728', 'addon', '来自的插件', 'varchar(255) NULL', 'string', 'Coupon', '', '4', '', '81', '0', '1', '1399272651', '1399272651', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('729', 'target_id', '来源ID', 'int(10) unsigned NULL ', 'num', '', '', '4', '', '81', '0', '1', '1399272705', '1399272705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('730', 'prize_id', '奖项ID', 'int(10) unsigned NULL ', 'num', '', '', '0', '', '81', '0', '1', '1399686317', '1399686317', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('731', 'prize_title', '奖项', 'varchar(255) NULL', 'string', '', '', '1', '', '81', '0', '1', '1399790367', '1399790367', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('732', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '81', '0', '1', '1404525481', '1404525481', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('733', 'can_use', '是否可用', 'tinyint(2) NULL', 'bool', '1', '', '0', '0:不可用\r\n1:可用', '81', '0', '1', '1418890020', '1418890020', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('734', 'server_addr', '服务器IP', 'varchar(50) NULL', 'string', '', '', '1', '', '81', '0', '1', '1425807865', '1425807865', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('776', 'title', '应用标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '87', '1', '1', '1402758132', '1394033402', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('777', 'uid', '用户ID', 'int(10) NULL ', 'num', '0', '', '0', '', '87', '0', '1', '1394087733', '1394033447', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('778', 'content', '应用详细介绍', 'text NULL ', 'editor', '', '', '1', '', '87', '1', '1', '1402758118', '1394033484', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('779', 'cTime', '发布时间', 'int(10) NULL ', 'datetime', '', '', '0', '', '87', '0', '1', '1394033571', '1394033571', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('780', 'attach', '应用压缩包', 'varchar(255) NULL ', 'file', '', '需要上传zip文件', '1', '', '87', '0', '1', '1402758100', '1394033674', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('781', 'is_top', '置顶', 'int(10) NULL ', 'bool', '0', '0表示不置顶，否则其它值表示置顶且值是置顶的时间', '1', '0:不置顶\r\n1:置顶', '87', '0', '1', '1402800009', '1394068787', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('782', 'cid', '分类', 'tinyint(4) NULL ', 'select', '', '', '0', '1:基础模块\r\n2:行业模块\r\n3:会议活动\r\n4:娱乐模块\r\n5:其它模块', '87', '0', '1', '1402758069', '1394069964', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('783', 'view_count', '浏览数', 'int(11) unsigned NULL ', 'num', '0', '', '0', '', '87', '0', '1', '1394072168', '1394072168', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('784', 'download_count', '下载数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '87', '0', '1', '1394085763', '1394085763', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('785', 'img_2', '应用截图2', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '87', '0', '1', '1402758035', '1394084714', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('786', 'img_1', '应用截图1', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '87', '0', '1', '1402758046', '1394084635', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('787', 'img_3', '应用截图3', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '87', '0', '1', '1402758021', '1394084757', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('788', 'img_4', '应用截图4', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '87', '0', '1', '1402758011', '1394084797', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('789', 'uid', 'uid', 'int(10) NULL', 'num', '', '', '1', '', '24', '0', '1', '1430880974', '1430880974', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('790', 'name', '素材名称', 'varchar(100) NULL', 'string', '', '', '1', '', '24', '0', '1', '1424612322', '1424611929', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('791', 'status', '状态', 'char(10) NULL', 'radio', 'UnSubmit', '', '1', 'UnSubmit:未提交\r\nWaiting:入库中\r\nSuccess:入库成功\r\nFailure:入库失败', '24', '0', '1', '1424612039', '1424612039', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('792', 'cTime', '提交时间', 'int(10) NULL', 'datetime', '', '', '1', '', '24', '0', '1', '1424612114', '1424612114', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('793', 'url', '实际摇一摇所使用的页面URL', 'varchar(255) NULL', 'string', '', '', '1', '', '24', '0', '1', '1424612483', '1424612154', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('794', 'type', '素材类型', 'varchar(255) NULL', 'string', '', '', '1', '', '24', '0', '1', '1424612421', '1424612421', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('795', 'detail', '素材内容', 'text NULL', 'textarea', '', '', '1', '', '24', '0', '1', '1424612456', '1424612456', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('796', 'reason', '入库失败的原因', 'text NULL', 'textarea', '', '', '1', '', '24', '0', '1', '1424612509', '1424612509', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('797', 'create_time', '申请时间', 'int(10) NULL', 'datetime', '', '', '1', '', '24', '0', '1', '1424612542', '1424612542', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('798', 'checked_time', '入库时间', 'int(10) NULL', 'datetime', '', '', '1', '', '24', '0', '1', '1424612571', '1424612571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('799', 'source', '来源', 'varchar(50) NULL', 'string', '', '', '1', '', '24', '0', '1', '1424836818', '1424836818', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('800', 'source_id', '来源ID', 'int(10) NULL', 'num', '', '', '1', '', '24', '0', '1', '1424836842', '1424836842', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('801', 'wechat_id', '微信端的素材ID', 'int(10) NULL', 'num', '', '', '0', '', '24', '0', '1', '1425370605', '1425370605', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('802', 'uid', '管理员id', 'int(10) NULL', 'num', '', '', '1', '', '25', '0', '1', '1431575588', '1431575588', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('803', 'token', '用户token', 'varchar(255) NULL', 'string', '', '', '1', '', '25', '0', '1', '1431575617', '1431575617', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('804', 'addons', '插件名称', 'varchar(255) NULL', 'string', '', '', '1', '', '25', '0', '1', '1431590322', '1431575667', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('805', 'template', '模版名称', 'varchar(255) NULL', 'string', '', '', '1', '', '25', '0', '1', '1431575691', '1431575691', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('832', 'title', '公告标题', 'varchar(255) NULL', 'string', '', '', '1', '', '26', '1', '1', '1431143985', '1431143985', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('833', 'content', '公告内容', 'text  NULL', 'editor', '', '', '1', '', '26', '1', '1', '1431144020', '1431144020', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('834', 'create_time', '发布时间', 'int(10) NULL', 'datetime', '', '', '4', '', '26', '0', '1', '1431146373', '1431144069', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('835', 'version', '版本号', 'int(10) unsigned NOT NULL ', 'num', '', '', '1', '', '27', '1', '1', '1393770457', '1393770457', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('836', 'title', '升级包名', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '27', '1', '1', '1393770499', '1393770499', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('837', 'description', '描述', 'text NULL', 'textarea', '', '', '1', '', '27', '0', '1', '1393770546', '1393770546', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('838', 'create_date', '创建时间', 'int(10) NULL', 'datetime', '', '', '1', '', '27', '0', '1', '1393770591', '1393770591', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('839', 'download_count', '下载统计', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '27', '0', '1', '1393770659', '1393770659', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('840', 'package', '升级包地址', 'varchar(255) NOT NULL', 'textarea', '', '', '1', '', '27', '1', '1', '1393812247', '1393770727', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('896', 'ToUserName', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143065', '1438143065', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('897', 'FromUserName', 'OpenID', 'varchar(100) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143098', '1438143098', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('898', 'CreateTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '28', '0', '1', '1438143120', '1438143120', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('899', 'MsgType', '消息类型', 'varchar(30) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143139', '1438143139', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('900', 'MsgId', '消息ID', 'varchar(100) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143182', '1438143182', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('901', 'Content', '文本消息内容', 'text NULL', 'textarea', '', '', '0', '', '28', '0', '1', '1438143218', '1438143218', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('902', 'PicUrl', '图片链接', 'varchar(255) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143273', '1438143273', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('903', 'MediaId', '多媒体文件ID', 'varchar(100) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143357', '1438143357', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('904', 'Format', '语音格式', 'varchar(30) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143397', '1438143397', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('905', 'ThumbMediaId', '缩略图的媒体id', 'varchar(30) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143445', '1438143426', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('906', 'Title', '消息标题', 'varchar(100) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143471', '1438143471', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('907', 'Description', '消息描述', 'text NULL', 'textarea', '', '', '0', '', '28', '0', '1', '1438143535', '1438143535', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('908', 'Url', 'Url', 'varchar(255) NULL', 'string', '', '', '0', '', '28', '0', '1', '1438143558', '1438143558', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('909', 'collect', '收藏状态', 'tinyint(1) NULL', 'bool', '0', '', '0', '0:未收藏\r\n1:已收藏', '28', '0', '1', '1438153936', '1438153936', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('910', 'deal', '处理状态', 'tinyint(1) NULL', 'bool', '0', '', '0', '0:未处理\r\n1:已处理', '28', '0', '1', '1438165005', '1438153991', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('911', 'is_read', '是否已读', 'tinyint(1) NULL', 'bool', '0', '', '1', '0:未读\r\n1:已读', '28', '0', '1', '1438165062', '1438165062', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('912', 'type', '消息分类', 'tinyint(1) NULL', 'bool', '0', '', '1', '0:用户消息\r\n1:管理员回复消息', '28', '0', '1', '1438168301', '1438168301', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1062', 'login_name', 'login_name', 'varchar(100) NULL', 'string', '', '', '1', '', '1', '0', '1', '1447302647', '1439978705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1063', 'content', '文本消息内容', 'text NULL', 'textarea', '', '', '0', '', '18', '0', '1', '1439980070', '1439980070', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1071', 'is_bind', '是否为微信开放平台绑定账号', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:否\r\n1:是', '6', '0', '1', '1440746890', '1440746890', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1101', 'url', '图文页url', 'varchar(255) NULL', 'string', '', '', '0', '', '17', '0', '1', '1441077355', '1441077355', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1825', 'ToUserName', 'token', 'varchar(255) NULL', 'string', '', '', '1', '', '29', '0', '1', '1447241964', '1447241964', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1826', 'FromUserName', 'openid', 'varchar(255) NULL', 'string', '', '', '1', '', '29', '0', '1', '1447242006', '1447242006', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1827', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '1', '', '29', '0', '1', '1447242030', '1447242030', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1828', 'msgType', '消息类型', 'varchar(255) NULL', 'string', '', '', '1', '', '29', '0', '1', '1447242059', '1447242059', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1829', 'manager_id', '管理员id', 'int(10) NULL', 'num', '', '', '1', '', '29', '0', '1', '1447242090', '1447242090', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1830', 'content', '内容', 'text NULL', 'textarea', '', '', '1', '', '29', '0', '1', '1447242120', '1447242120', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1831', 'media_id', '多媒体文件id', 'varchar(255) NULL', 'string', '', '', '1', '', '29', '0', '1', '1447242146', '1447242146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1832', 'is_send', '是否已经发送', 'int(10) NULL', 'num', '', '', '1', '0:未发\r\n1:已发', '29', '0', '1', '1447242181', '1447242181', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1833', 'uid', '粉丝uid', 'int(10) NULL', 'num', '', '', '1', '', '29', '0', '1', '1447242202', '1447242202', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1834', 'news_group_id', '图文组id', 'varchar(255) NULL', 'string', '', '', '1', '', '29', '0', '1', '1447242229', '1447242229', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1835', 'video_title', '视频标题', 'varchar(255) NULL', 'string', '', '', '1', '', '29', '0', '1', '1447242267', '1447242267', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1836', 'video_description', '视频描述', 'text NULL', 'textarea', '', '', '1', '', '29', '0', '1', '1447242291', '1447242291', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1837', 'video_thumb', '视频缩略图', 'varchar(255) NULL', 'string', '', '', '1', '', '29', '0', '1', '1447242366', '1447242366', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1844', 'voice_id', '语音id', 'int(10) NULL', 'num', '', '', '1', '', '29', '0', '1', '1447242400', '1447242400', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1845', 'image_id', '图片id', 'int(10) NULL', 'num', '', '', '1', '', '29', '0', '1', '1447242440', '1447242440', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1846', 'video_id', '视频id', 'int(10) NULL', 'num', '', '', '1', '', '29', '0', '1', '1447242464', '1447242464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1847', 'send_type', '发送方式', 'int(10) NULL', 'num', '', '', '1', '0:分组\r\n1:指定用户', '29', '0', '1', '1447242498', '1447242498', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1848', 'send_opends', '指定用户', 'text NULL', 'textarea', '', '', '1', '', '29', '0', '1', '1447242529', '1447242529', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1849', 'group_id', '分组id', 'int(10) NULL', 'num', '', '', '1', '', '29', '0', '1', '1447242553', '1447242553', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1850', 'diff', '区分消息标识', 'int(10) NULL', 'num', '0', '', '1', '', '29', '0', '1', '1447242584', '1447242584', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1326', 'content', '文本内容', 'text NULL', 'textarea', '', '', '1', '', '30', '1', '1', '1442976151', '1442976151', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1327', 'token', 'Token', 'varchar(50) NULL', 'string', '', '', '0', '', '30', '0', '1', '1442978004', '1442978004', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('1328', 'uid', 'uid', 'int(10) NULL', 'num', '', '', '0', '', '30', '0', '1', '1442978041', '1442978041', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('1820', 'is_use', '可否使用', 'int(10) NULL', 'num', '1', '', '0', '0:不可用\r\n1:可用', '30', '0', '1', '1445496947', '1445496947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1821', 'aim_id', '添加来源标识id', 'int(10) NULL', 'num', '', '', '0', '', '30', '0', '1', '1445497010', '1445497010', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1822', 'aim_table', '来源表名', 'varchar(255) NULL', 'string', '', '', '0', '', '30', '0', '1', '1445497218', '1445497218', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1329', 'file_id', '上传文件', 'int(10) NULL', 'file', '', '', '1', '', '31', '0', '1', '1442982169', '1438684652', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1330', 'cover_url', '本地URL', 'varchar(255) NULL', 'string', '', '', '0', '', '31', '0', '1', '1438684692', '1438684692', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1331', 'media_id', '微信端图文消息素材的media_id', 'varchar(100) NULL', 'string', '0', '', '0', '', '31', '0', '1', '1438744962', '1438684776', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1332', 'wechat_url', '微信端的文件地址', 'varchar(255) NULL', 'string', '', '', '0', '', '31', '0', '1', '1439973558', '1438684807', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1333', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '31', '0', '1', '1443004484', '1438684829', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('1334', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '31', '0', '1', '1442982446', '1438684847', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('1335', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '31', '0', '1', '1442982460', '1438684865', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('1336', 'title', '素材名称', 'varchar(100) NULL', 'string', '', '', '1', '', '31', '0', '1', '1442981165', '1442981165', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1341', 'type', '类型', 'int(10) NULL', 'num', '', '', '0', '1:语音素材\r\n2:视频素材', '31', '0', '1', '1445599238', '1443006101', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1838', 'introduction', '描述', 'text NULL', 'textarea', '', '', '0', '', '31', '0', '1', '1447299133', '1445684769', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1121', 'level', '管理等级', 'tinyint(2) NULL', 'num', '0', '', '0', '', '1', '0', '1', '1441522953', '1441522953', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1112', 'login_password', '登录密码', 'varchar(255) NULL', 'string', '', '', '1', '', '1', '0', '1', '1441187439', '1441187439', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1114', 'manager_id', '公众号管理员ID', 'int(10) NULL', 'num', '0', '', '0', '', '1', '0', '1', '1441512815', '1441512815', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1155', 'membership', '会员等级', 'char(50) NULL', 'select', '0', '请在会员等级 添加会员级别名称', '0', '', '1', '0', '1', '1447302405', '1441795509', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1542', 'score', '修改积分', 'int(10) NULL', 'num', '', '', '1', '', '32', '1', '1', '1444302622', '1444302410', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1543', 'branch_id', '修改门店', 'int(10) NULL', 'num', '', '', '1', '', '32', '0', '1', '1444302450', '1444302450', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1544', 'operator', '操作员', 'varchar(255) NULL', 'string', '', '', '1', '', '32', '0', '1', '1444302474', '1444302474', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1545', 'cTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '32', '0', '1', '1444302508', '1444302508', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1546', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '1', '', '32', '0', '1', '1444302539', '1444302539', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1547', 'member_id', '会员卡id', 'int(10) NULL', 'num', '', '', '4', '', '32', '0', '1', '1444302566', '1444302566', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1548', 'manager_id', '管理员id', 'int(10) NULL', 'num', '', '', '1', '', '32', '0', '1', '1444302595', '1444302595', '', '3', '', 'regex', 'get_mid', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1663', 'credit_title', '积分标题', 'varchar(50) NULL', 'string', '', '', '0', '', '15', '0', '1', '1444731976', '1444731976', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1823', 'is_material', '设置为文本素材', 'int(10) NULL', 'num', '0', '', '0', '0:不设置\r\n1:设置', '28', '0', '1', '1445497359', '1445497359', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1824', 'admin_uid', '核销管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '81', '0', '1', '1445504807', '1445504807', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1839', 'msgtype', '消息类型', 'varchar(255) NULL', 'string', '', '', '1', '', '18', '0', '1', '1445833955', '1445833955', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1840', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '1', '', '18', '0', '1', '1445834006', '1445834006', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1841', 'appmsg_id', '图文id', 'int(10) NULL', 'num', '', '', '1', '', '18', '0', '1', '1445840292', '1445834101', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1842', 'voice_id', '语音id', 'int(10) NULL', 'num', '', '', '1', '', '18', '0', '1', '1445834144', '1445834144', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1843', 'video_id', '视频id', 'int(10) NULL', 'num', '', '', '1', '', '18', '0', '1', '1445834174', '1445834174', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('1851', 'cTime', '群发时间', 'int(10) NULL', 'datetime', '', '', '1', '', '18', '0', '1', '1445856491', '1445856442', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11242', 'is_use', '可否使用', 'int(10) NULL', 'num', '1', '', '0', '0:不可用\r\n1:可用', '31', '0', '1', '1447405173', '1447403730', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11243', 'aim_id', '添加来源标识id', 'int(10) NULL', 'num', '', '', '0', '', '31', '0', '1', '1447404930', '1447404930', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11244', 'aim_table', '来源表名', 'varchar(255) NULL', 'string', '', '', '1', '', '31', '0', '1', '1447405156', '1447405156', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11245', 'is_use', '可否使用', 'int(10) NULL', 'num', '1', '', '0', '0:不可用\r\n1:可用', '16', '0', '1', '1447405234', '1447405234', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11246', 'aim_id', '添加来源标识id', 'int(10) NULL', 'num', '', '', '0', '', '16', '0', '1', '1447405283', '1447405283', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11247', 'aim_table', '来源表名', 'varchar(255) NULL', 'string', '', '', '1', '', '16', '0', '1', '1447405301', '1447405301', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11248', 'is_use', '可否使用', 'int(10) NULL', 'num', '1', '', '0', '0:不可用\r\n1:可用', '17', '0', '1', '1447405553', '1447405510', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11249', 'aim_id', '添加来源标识id', 'int(10) NULL', 'num', '', '', '0', '', '17', '0', '1', '1447405545', '1447405545', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('11250', 'aim_table', '来源表名', 'varchar(255) NULL', 'string', '', '', '0', '', '17', '0', '1', '1447405577', '1447405577', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12088', 'keyword', '关键词', 'varchar(50) NOT NULL', 'string', '', '用户在微信里回复此关键词将会触发此投票。', '1', '', '1232', '1', '1', '1392969972', '1388930888', 'keyword_unique', '1', '此关键词已经存在，请换成别的关键词再试试', 'function', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12089', 'title', '投票标题', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '1232', '1', '1', '1388931041', '1388931041', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12090', 'description', '投票描述', 'text NULL', 'textarea', '', '', '1', '', '1232', '0', '1', '1400633517', '1388931173', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12091', 'picurl', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '支持JPG、PNG格式，较好的效果为大图360*200，小图200*200', '1', '', '1232', '0', '1', '1388931285', '1388931285', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12092', 'type', '选择类型', 'char(10) NOT NULL', 'radio', '0', '', '0', '0:单选\r\n1:多选', '1232', '1', '1', '1430376146', '1388931487', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12093', 'start_date', '开始日期', 'int(10) NULL', 'datetime', '', '', '1', '', '1232', '0', '1', '1388931734', '1388931734', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12094', 'end_date', '结束日期', 'int(10) NULL', 'datetime', '', '', '1', '', '1232', '0', '1', '1388931769', '1388931769', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12095', 'is_img', '文字/图片投票', 'tinyint(2) NULL', 'radio', '0', '', '0', '0:文字投票\r\n1:图片投票', '1232', '1', '1', '1389081985', '1388931941', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12096', 'vote_count', '投票数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '1232', '0', '1', '1388932035', '1388932035', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12097', 'cTime', '投票创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1232', '1', '1', '1388932128', '1388932128', '', '1', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12098', 'mTime', '更新时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1232', '0', '1', '1430379170', '1390634006', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12099', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1232', '0', '1', '1391397388', '1391397388', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12100', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '1232', '0', '1', '1430188739', '1430188739', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12101', 'vote_id', '投票ID', 'int(10) unsigned NULL ', 'num', '', '', '1', '', '1233', '1', '1', '1429846753', '1388934189', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12102', 'user_id', '用户ID', 'int(10) NULL ', 'num', '', '', '1', '', '1233', '1', '1', '1429855665', '1388934265', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12103', 'token', '用户TOKEN', 'varchar(255) NULL', 'string', '', '', '0', '', '1233', '1', '1', '1429855713', '1388934296', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12104', 'options', '选择选项', 'varchar(255) NULL', 'string', '', '', '1', '', '1233', '1', '1', '1429855086', '1388934351', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12105', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1233', '0', '1', '1429874378', '1388934392', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12106', 'order', '选项排序', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '1234', '0', '1', '1388933951', '1388933951', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12107', 'opt_count', '当前选项投票数', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '1234', '0', '1', '1429861248', '1388933860', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12108', 'image', '图片选项', 'int(10) unsigned NULL ', 'picture', '', '', '5', '', '1234', '0', '1', '1388984467', '1388933679', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12109', 'name', '选项标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1234', '1', '1', '1388933552', '1388933552', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12110', 'vote_id', '投票ID', 'int(10) unsigned NOT NULL ', 'num', '', '', '4', '', '1234', '1', '1', '1388982678', '1388933478', '', '3', '', 'regex', '$_REQUEST[\'vote_id\']', '3', 'string');
INSERT INTO `dc_attribute` VALUES ('12115', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '1235', '1', '1', '1396061575', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12116', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '1235', '0', '1', '1396061814', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12117', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1235', '1', '1', '1396061877', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12118', 'intro', '简介', 'text NULL', 'textarea', '', '', '1', '', '1235', '0', '1', '1396061947', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12119', 'cate_id', '所属类别', 'int(10) unsigned NULL ', 'select', '0', '要先在微官网分类里配置好分类才可选择', '1', '0:请选择分类', '1235', '0', '1', '1396078914', '1396062003', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12120', 'cover', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '1235', '0', '1', '1396062093', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12121', 'content', '内容', 'text NULL', 'editor', '', '', '1', '', '1235', '0', '1', '1396062146', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12122', 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1235', '0', '1', '1396075102', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12123', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '数值越小越靠前', '1', '', '1235', '0', '1', '1396510508', '1396510508', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12124', 'view_count', '浏览数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '1235', '0', '1', '1396510630', '1396510630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12125', 'title', '分类标题', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '1236', '1', '1', '1408950771', '1395988016', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12126', 'icon', '分类图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '1236', '0', '1', '1395988966', '1395988966', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12127', 'url', '外链', 'varchar(255) NULL', 'string', '', '为空时默认跳转到该分类的文章列表页面', '1', '', '1236', '0', '1', '1401408363', '1395989660', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12128', 'is_show', '显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0: 不显示\r\n1: 显示', '1236', '0', '1', '1395989709', '1395989709', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12129', 'token', 'Token', 'varchar(100) NULL ', 'string', '', '', '0', '', '1236', '0', '1', '1395989760', '1395989760', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12130', 'sort', '排序号', 'int(10) NULL ', 'num', '0', '数值越小越靠前', '1', '', '1236', '0', '1', '1396340334', '1396340334', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12131', 'pid', '一级目录', 'int(10) NULL', 'cascade', '0', '', '1', 'type=db&table=weisite_category&pid=id', '1236', '0', '1', '1439522271', '1439469294', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12132', 'title', '标题', 'varchar(255) NULL', 'string', '', '可为空', '1', '', '1237', '0', '1', '1396098316', '1396098316', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12133', 'img', '图片', 'int(10) unsigned NOT NULL ', 'picture', '', '', '1', '', '1237', '1', '1', '1396098349', '1396098349', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12134', 'url', '链接地址', 'varchar(255) NULL', 'string', '', '', '1', '', '1237', '0', '1', '1396098380', '1396098380', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12135', 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '1237', '0', '1', '1396098464', '1396098464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12136', 'sort', '排序', 'int(10) unsigned NULL ', 'num', '0', '值越小越靠前', '1', '', '1237', '0', '1', '1396098682', '1396098682', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12137', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '1237', '0', '1', '1396098747', '1396098747', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12138', 'url', '关联URL', 'varchar(255) NULL ', 'string', '', '', '1', '', '1238', '0', '1', '1394519090', '1394519090', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12139', 'title', '菜单名', 'varchar(50) NOT NULL', 'string', '', '可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。', '1', '', '1238', '1', '1', '1408950832', '1394518988', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12140', 'pid', '一级菜单', 'tinyint(2) NULL', 'select', '0', '如果是一级菜单，选择“无”即可', '1', '0:无', '1238', '0', '1', '1409045931', '1394518930', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12141', 'sort', '排序号', 'tinyint(4) NULL ', 'num', '0', '数值越小越靠前', '1', '', '1238', '0', '1', '1394523288', '1394519175', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12142', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1238', '0', '1', '1394526820', '1394526820', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12143', 'icon', '图标', 'int(10) unsigned NULL ', 'picture', '', '根据选择的底部模板决定是否需要上传图标', '1', '', '1238', '0', '1', '1396506297', '1396506297', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12144', 'keyword', '关键词', 'varchar(255) NULL', 'string', '', '多个关键词可以用空格分开，如“高富帅 白富美”', '1', '', '1239', '1', '1', '1439194858', '1439194849', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12145', 'msg_type', '消息类型', 'char(50) NULL', 'select', 'text', '', '0', 'text:文本|content@show,group_id@hide,image_id@hide\r\nnews:图文|content@hide,group_id@show,image_id@hide\r\nimage:图片|content@hide,group_id@hide,image_id@show', '1239', '1', '1', '1439204529', '1439194979', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12146', 'content', '文本内容', 'text NULL', 'textarea', '', '', '1', '', '1239', '0', '1', '1439195826', '1439195091', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12147', 'group_id', '图文', 'int(10) NULL', 'news', '', '', '1', '', '1239', '0', '1', '1439204192', '1439195901', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12148', 'image_id', '上传图片', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '1239', '0', '1', '1439195945', '1439195945', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12149', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '1239', '0', '1', '1439203621', '1439203575', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12150', 'token', 'Token', 'varchar(50) NULL', 'string', '', '', '0', '', '1239', '0', '1', '1439203612', '1439203612', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12151', 'image_material', '素材图片id', 'int(10) NULL', 'num', '', '', '0', '', '1239', '0', '1', '1447738833', '1447738833', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12152', 'voice_id', '语音id', 'int(10) NULL', 'num', '0', '', '0', '', '1239', '0', '1', '1449152539', '1449150873', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12153', 'video_id', '视频id', 'int(10) NULL', 'num', '0', '', '0', '', '1239', '0', '1', '1449152532', '1449150935', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12154', 'reply_scene', '回复场景（0：关注时回复；1：默认回复；2：关键词回复）', 'int(10) NULL', 'num', '', '', '1', '', '1239', '0', '1', '1449154529', '1449154529', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12415', 'sucai_type', '素材类型', 'char(50) NULL', 'select', '0', '', '1', '0:请选择\r\n1:图文\r\n2:文本\r\n3:图片\r\n4:语音\r\n5:视频', '1268', '0', '1', '1447208890', '1447208890', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12414', 'target_id', '选择内容', 'int(10) NULL', 'num', '', '', '4', '0:请选择', '1268', '0', '1', '1447208825', '1447208825', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12413', 'addon', '选择插件', 'char(50) NULL', 'select', '0', '', '1', '0:请选择', '1268', '0', '1', '1447208750', '1447208750', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12412', 'from_type', '配置动作', 'char(50) NULL', 'select', '-1', '', '1', '0:站内信息|keyword@hide,url@hide,type@hide,sucai_type@hide,addon@show,jump_type@show\r\n1:站内素材|keyword@hide,url@hide,type@hide,sucai_type@show,addon@hide,jump_type@hide\r\n9:自定义|keyword@show,url@hide,type@show,addon@hide,sucai_type@hide,jump_type@hide\r\n-1:请选择|keyword@hide,url@hide,type@hide,addon@hide,sucai_type@hide,jump_type@hide', '1268', '0', '1', '1447318552', '1447208677', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12408', 'keyword', '关联关键词', 'varchar(100) NULL', 'string', '', '', '1', '', '1268', '0', '1', '1416812109', '1394519054', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12409', 'url', '关联URL', 'varchar(255) NULL ', 'string', '', '', '1', '', '1268', '0', '1', '1394519090', '1394519090', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12410', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1268', '0', '1', '1394526820', '1394526820', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12411', 'type', '类型', 'varchar(30) NULL', 'bool', 'click', '', '1', 'click:点击推事件|keyword@show,url@hide\r\nview:跳转URL|keyword@hide,url@show\r\nscancode_push:扫码推事件|keyword@show,url@hide\r\nscancode_waitmsg:扫码带提示|keyword@show,url@hide\r\npic_sysphoto:弹出系统拍照发图|keyword@show,url@hide\r\npic_photo_or_album:弹出拍照或者相册发图|keyword@show,url@hide\r\npic_weixin:弹出微信相册发图器|keyword@show,url@hide\r\nlocation_select:弹出地理位置选择器|keyword@show,url@hide\r\nnone:无事件的一级菜单|keyword@hide,url@hide', '1268', '0', '1', '1416812039', '1416810588', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12407', 'title', '菜单名', 'varchar(50) NOT NULL', 'string', '', '可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。', '1', '', '1268', '1', '1', '1408951570', '1394518988', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12405', 'sort', '排序号', 'tinyint(4) NULL ', 'num', '0', '数值越小越靠前', '1', '', '1268', '0', '1', '1394523288', '1394519175', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12406', 'pid', '一级菜单', 'int(10) NULL', 'select', '0', '如果是一级菜单，选择“无”即可', '1', '0:无', '1268', '0', '1', '1416810279', '1394518930', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12167', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '0', '', '1241', '0', '1', '1404485505', '1404475530', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12168', 'groupname', '分组名称', 'varchar(255) NULL', 'string', '', '', '1', '', '1241', '0', '1', '1404475556', '1404475556', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12169', 'groupdata', '分组数据源', 'text NULL', 'textarea', '', '', '0', '', '1241', '0', '1', '1404476127', '1404476127', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12170', 'msgkeyword', '消息关键字', 'varchar(555) NULL', 'string', '', '当用户发送的消息中含有关键字时,将自动转到分配的客服人员', '1', '', '1242', '0', '1', '1404399336', '1404399336', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12171', 'msgkeyword_type', '关键字类型', 'char(50) NULL', 'select', '3', '选择关键字匹配的类型', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '1242', '0', '1', '1404399466', '1404399466', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12172', 'msgkfaccount', '接待的客服人员', 'varchar(255) NULL', 'string', '', '', '0', '', '1242', '0', '1', '1404403340', '1404399587', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12173', 'cTime', '创建时间', 'int(10) NULL', 'date', '', '', '0', '', '1242', '0', '1', '1404399629', '1404399629', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12174', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '0', '', '1242', '0', '1', '1404399656', '1404399656', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12175', 'msgstate', '关键字状态', 'tinyint(2) NULL', 'bool', '1', '停用后用户将不会触发此关键词', '1', '0:停用\r\n1:启用', '1242', '0', '1', '1404399749', '1404399749', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12176', 'zjnum', '转接次数', 'int(10) NULL', 'num', '', '', '0', '', '1242', '0', '1', '1404399784', '1404399784', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12177', 'zdtype', '指定类型', 'char(10) NULL', 'radio', '0', '选择关键字匹配时是按指定人员或者指定客服组', '1', '0:指定客服人员\r\n1:指定客服组', '1242', '0', '1', '1404474672', '1404474672', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12178', 'kfgroupid', '客服分组id', 'int(10) NULL', 'num', '0', '', '0', '', '1242', '0', '1', '1404474777', '1404474777', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12179', 'kf_explain', '客服说明', 'varchar(255) NULL', 'string', '', '客服说明', '1', '', '1242', '0', '1', '1450018523', '1450018523', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12180', 'name', '客服昵称', 'varchar(60) NULL ', 'string', '', '', '1', '', '1243', '0', '1', '1403959775', '1403947255', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12181', 'token', 'token', 'varchar(60) NULL ', 'string', '', '', '0', '', '1243', '0', '1', '1403959638', '1403947256', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12182', 'userName', '客服帐号', 'varchar(60) NULL ', 'string', '', '', '1', '', '1243', '0', '1', '1403959752', '1403947256', '', '3', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12183', 'userPwd', '客服密码', 'varchar(32) NULL ', 'string', '', '', '1', '', '1243', '0', '1', '1403959722', '1403947257', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12184', 'endJoinDate', '客服加入时间', 'int(11) NULL ', 'string', '', '', '0', '', '1243', '0', '1', '1403959825', '1403947257', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12185', 'status', '客服在线状态', 'tinyint(1) NULL ', 'bool', '0', '', '0', '0:离线\r\n1:在线', '1243', '0', '1', '1404016782', '1403947258', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12186', 'state', '客服状态', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:停用\r\n1:启用', '1243', '0', '1', '1404016877', '1404016877', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12187', 'isdelete', '是否删除', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:正常\r\n1:已被删除', '1243', '0', '1', '1404016931', '1404016931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12188', 'kfid', '客服编号', 'varchar(255) NULL', 'string', '', '', '1', '', '1243', '0', '1', '1404398387', '1404398387', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12189', 'openid', 'openid', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1244', '0', '1', '1409247462', '1409247462', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12190', 'template_id', '模板ID', 'varchar(500) NOT NULL', 'string', '', '', '1', '', '1244', '0', '1', '1409247489', '1409247489', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12191', 'message', '消息内容', 'text NOT NULL', 'textarea', '', '', '1', '', '1244', '0', '1', '1409247512', '1409247512', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12192', 'MsgID', '消息ID', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1244', '0', '1', '1409247552', '1409247552', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12193', 'sendstatus', '发送状态', 'char(50) NOT NULL', 'select', '', '', '1', '0:成功\r\n1:失败', '1244', '0', '1', '1409247862', '1409247608', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12194', 'Status', '送达报告', 'char(50) NOT NULL', 'select', '', '', '1', '0:成功\r\n1:失败：用户拒收\r\n2:失败：其他原因', '1244', '0', '1', '1409247873', '1409247697', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12195', 'token', 'token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1244', '0', '1', '1409247732', '1409247713', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12196', 'ctime', '发送时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '1244', '0', '1', '1409247759', '1409247759', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12203', 'token', '公众号Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1246', '0', '1', '1448517984', '1448517984', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12204', 'scene_name', '场景名称', 'varchar(255) NULL', 'string', '', '', '1', '', '1246', '1', '1', '1448518657', '1448518006', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12205', 'keyword', '关联关键词', 'varchar(255) NULL', 'string', '', '', '1', '', '1246', '0', '1', '1448518039', '1448518039', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12206', 'scene_type', '二维码类型', 'char(10) NULL', 'radio', '0', '', '1', '0:临时二维码\r\n1:永久二维码', '1246', '0', '1', '1448518150', '1448518150', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12207', 'scene_id', '场景值ID', 'int(32) NULL', 'num', '', '', '0', '', '1246', '0', '1', '1448518272', '1448518252', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12208', 'scene_str', '场景值字符串', 'varchar(255) NULL', 'string', '', '临时二维码不用填。永久二维码填写字符串或汉字，也可以不填。', '1', '', '1246', '0', '1', '1448518467', '1448518467', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12209', 'expire', '过期时间', 'int(10) NULL', 'num', '', '以秒为单位， 最大不超过604800（即7天）。 只对临时二维码有效，永久二维码不用填。', '1', '', '1246', '0', '1', '1448526699', '1448518643', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12210', 'ticket', '二维码Ticket', 'varchar(255) NULL', 'string', '', '', '0', '', '1246', '0', '1', '1448519266', '1448519266', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12211', 'url', '二维码图片解析后的地址', 'varchar(255) NULL', 'string', '', '', '0', '', '1246', '0', '1', '1448519304', '1448519304', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12212', 'ctime', '二维码创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1246', '0', '1', '1448519406', '1448519406', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12213', 'short_url', '二维码短地址', 'varchar(255) NULL', 'string', '', '', '0', '', '1246', '0', '1', '1448526642', '1448524998', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12214', 'token', '公众号Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1247', '0', '1', '1448529447', '1448529447', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12215', 'openid', '扫码者openid', 'varchar(255) NULL', 'string', '', '', '0', '', '1247', '0', '1', '1448529507', '1448529507', '', '3', '', 'regex', 'get_openid', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12216', 'scene_name', '场景名称', 'varchar(255) NULL', 'string', '', '', '1', '', '1247', '0', '1', '1448529541', '1448529541', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12217', 'keyword', '关联关键词', 'varchar(255) NULL', 'string', '', '', '1', '', '1247', '0', '1', '1448529562', '1448529562', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12218', 'scene_id', '场景ID/场景字符串', 'varchar(255) NULL', 'string', '', '', '1', '', '1247', '0', '1', '1448529722', '1448529722', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12219', 'scan_type', '扫描类型', 'varchar(255) NULL', 'string', '', '', '1', '', '1247', '0', '1', '1448529758', '1448529758', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12220', 'ctime', '扫描时间', 'int(10) NULL', 'datetime', '', '', '1', '', '1247', '0', '1', '1448529808', '1448529808', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12221', 'qrcode_id', '二维码ID', 'int(10) NULL', 'num', '', '', '0', '', '1247', '0', '1', '1448534367', '1448533103', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12222', 'title', '商店名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1248', '1', '1', '1422671603', '1422671261', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12223', 'logo', '商店LOGO', 'int(10) NULL', 'picture', '', '', '1', '', '1248', '0', '1', '1422950521', '1422671295', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12224', 'intro', '店铺简介', 'text NULL', 'textarea', '', '', '1', '', '1248', '0', '1', '1422671570', '1422671345', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12225', 'mobile', '联系电话', 'varchar(30) NULL', 'string', '', '', '1', '', '1248', '0', '1', '1422671410', '1422671410', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12226', 'qq', 'QQ', 'int(10) NULL', 'num', '', '', '1', '', '1248', '0', '1', '1422671498', '1422671498', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12227', 'wechat', '微信', 'varchar(50) NULL', 'string', '', '', '1', '', '1248', '0', '1', '1422671544', '1422671544', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12228', 'template', '模板', 'varchar(30) NULL', 'string', '', '', '0', '', '1248', '0', '1', '1422950165', '1422950165', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12229', 'content', '店铺介绍', 'text  NULL', 'editor', '', '', '1', '', '1248', '0', '1', '1423108654', '1423108654', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12230', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '1248', '0', '1', '1439456512', '1439455806', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12231', 'manager_id', '管理员ID', 'int(10) NULL', 'num', '', '', '0', '', '1248', '0', '1', '1439456496', '1439455828', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12232', 'cover', '商品封面图', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '1249', '0', '1', '1431071756', '1422672306', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12233', 'content', '商品介绍', 'text NOT NULL', 'editor', '', '', '1', '', '1249', '0', '1', '1422672255', '1422672255', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12234', 'title', '商品名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1249', '1', '1', '1422672113', '1422672113', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12235', 'price', '价格', 'decimal(10,2) NULL', 'num', '0', '', '1', '', '1249', '0', '1', '1439468076', '1422672186', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12236', 'imgs', '商品图片', 'varchar(255) NOT NULL', 'mult_picture', '', '可以上传多个图片', '1', '', '1249', '0', '1', '1438331467', '1422672449', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12237', 'inventory', '库存数量', 'int(10) NULL', 'num', '0', '', '1', '', '1249', '0', '1', '1422935578', '1422672560', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12238', 'shop_id', '商店ID', 'int(10) NULL', 'num', '0', '', '4', '', '1249', '0', '1', '1422934861', '1422931951', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12239', 'is_show', '是否上架', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '1249', '0', '1', '1422935533', '1422935533', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12240', 'sale_count', '销售量', 'int(10) NULL', 'num', '0', '', '0', '', '1249', '0', '1', '1422935712', '1422935600', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12241', 'is_recommend', '是否推荐', 'tinyint(2) NULL', 'bool', '', '推荐后首页的推荐商品里显示', '1', '0:否\r\n1:是', '1249', '0', '1', '1423107236', '1423107213', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12242', 'rank', '热销度', 'int(10) NULL', 'num', '0', '热销度由发布时间、推荐状态、销量三个维度进行计算得到', '0', '', '1249', '0', '1', '1423474955', '1423126715', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12243', 'show_time', '上架时间', 'int(10) NULL', 'datetime', '0', '', '0', '', '1249', '0', '1', '1423127849', '1423127833', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12244', 'old_price', '原价', 'int(10) NULL', 'num', '', '', '1', '', '1249', '0', '1', '1423132272', '1423132272', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12245', 'type', '商品类型', 'tinyint(2) NULL', 'bool', '0', '注：虚拟商品不支持货到付款', '0', '0:实物商品（需要快递）\r\n1:虚拟商品（不需要快递）', '1249', '0', '1', '1439549244', '1439458735', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12246', 'category_id', '商品分类', 'char(50) NULL', 'select', '', '', '1', '', '1249', '0', '1', '1440126604', '1440066901', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12247', 'uid', '使用UID', 'int(10) NULL', 'num', '', '', '0', '', '1250', '0', '1', '1423471296', '1423471296', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12248', 'goods_id', '商品ID', 'int(10) NULL', 'num', '', '', '0', '', '1250', '0', '1', '1423471321', '1423471321', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12249', 'cTime', '收藏时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1250', '0', '1', '1423471348', '1423471348', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12250', 'uid', '用户ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '0', '', '1251', '0', '1', '1419577913', '1419577913', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12251', 'shop_id', '商店id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1251', '0', '1', '1419578098', '1419577949', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12252', 'goods_id', '商品id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1251', '0', '1', '1419578025', '1419578025', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12253', 'num', '数量', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '1251', '0', '1', '1419578075', '1419578075', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12254', 'price', '单价', 'varchar(30) NOT NULL', 'num', '', '', '0', '', '1251', '0', '1', '1419578162', '1419578154', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12255', 'goods_type', '商品类型', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '', '1251', '0', '1', '1420551825', '1420551825', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12256', 'openid', 'openid', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1251', '0', '1', '1420195356', '1420195356', '', '3', '', 'regex', 'get_openid', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12257', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '1252', '1', '1', '1429522999', '1423477509', '', '3', '', 'regex', 'get_mid', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12258', 'truename', '收货人姓名', 'varchar(100) NULL', 'string', '', '', '1', '', '1252', '1', '1', '1423477690', '1423477548', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12259', 'mobile', '手机号码', 'varchar(50) NULL', 'string', '', '', '1', '', '1252', '1', '1', '1423477580', '1423477580', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12260', 'city', '城市', 'varchar(255) NULL', 'cascade', '', '', '1', 'module=city', '1252', '1', '1', '1423477660', '1423477660', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12261', 'address', '具体地址', 'varchar(255) NULL', 'string', '', '', '1', '', '1252', '1', '1', '1423477681', '1423477681', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12262', 'is_use', '是否设置为默认', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '1252', '0', '1', '1423536697', '1423477729', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12263', 'title', '标题', 'varchar(255) NULL', 'string', '', '可为空', '1', '', '1253', '0', '1', '1396098316', '1396098316', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12264', 'img', '图片', 'int(10) unsigned NOT NULL ', 'picture', '', '', '1', '', '1253', '1', '1', '1396098349', '1396098349', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12265', 'url', '链接地址', 'varchar(255) NULL', 'string', '', '', '1', '', '1253', '0', '1', '1396098380', '1396098380', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12266', 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '1253', '0', '1', '1396098464', '1396098464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12267', 'sort', '排序', 'int(10) unsigned NULL ', 'num', '0', '值越小越靠前', '1', '', '1253', '0', '1', '1396098682', '1396098682', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12268', 'token', 'Token', 'varchar(100) NULL', 'string', '', '', '0', '', '1253', '0', '1', '1396098747', '1396098747', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12269', 'shop_id', '商店ID', 'int(10) NULL', 'num', '0', '', '4', '', '1253', '0', '1', '1422934490', '1422932093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12270', 'order_id', '订单ID', 'int(10) NULL', 'num', '', '', '0', '', '1254', '0', '1', '1439525588', '1439525588', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12271', 'status_code', '状态码', 'char(50) NULL', 'select', '0', '', '0', '0:待支付\r\n1:待商家确认\r\n2:待发货\r\n3:配送中\r\n4:确认已收货\r\n5:确认已收款\r\n6:待评价\r\n7:已评价', '1254', '0', '1', '1439536678', '1439525934', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12272', 'remark', '备注内容', 'varchar(255) NULL', 'string', '', '', '0', '', '1254', '0', '1', '1439525979', '1439525979', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12273', 'cTime', '时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1254', '0', '1', '1439526002', '1439526002', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12274', 'extend', '扩展信息', 'varchar(255) NULL', 'string', '', '', '0', '', '1254', '0', '1', '1439526038', '1439526038', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12275', 'goods_datas', '商品序列化数据', 'text NOT NULL', 'textarea', '', '', '1', '', '1255', '0', '1', '1423534050', '1420269321', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12276', 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '1255', '0', '1', '1420269348', '1420269348', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12277', 'remark', '备注', 'text NOT NULL', 'textarea', '', '', '1', '', '1255', '0', '1', '1423534071', '1420269399', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12278', 'order_number', '订单编号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1255', '0', '1', '1423534179', '1420269451', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12279', 'cTime', '订单时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '1255', '0', '1', '1423534102', '1420269666', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12280', 'total_price', '总价', 'decimal(10,2) NULL', 'num', '', '', '1', '', '1255', '0', '1', '1439812371', '1420272711', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12281', 'openid', 'OpenID', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1255', '0', '1', '1420526437', '1420526437', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12282', 'pay_status', '支付状态', 'int(10)  NULL', 'num', '', '', '0', '', '1255', '0', '1', '1423537847', '1420596969', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12283', 'pay_type', '支付类型', 'int(10) NULL', 'num', '', '', '0', '', '1255', '0', '1', '1423537868', '1420596998', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12284', 'address_id', '配送信息', 'int(10) NULL', 'num', '', '', '1', '', '1255', '0', '1', '1423534264', '1423534264', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12285', 'is_send', '是否发货', 'int(10) NULL', 'num', '0', '', '1', '', '1255', '0', '1', '1438336095', '1438336095', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12286', 'send_code', '快递公司编号', 'varchar(255) NULL', 'string', '', '', '1', '', '1255', '0', '1', '1438336511', '1438336511', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12287', 'send_number', '快递单号', 'varchar(255) NULL', 'string', '', '', '1', '', '1255', '0', '1', '1438336556', '1438336556', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12288', 'send_type', '发货类型', 'char(10) NULL', 'radio', '', '', '1', '0|线上发货\r\n1|物流公司发货', '1255', '0', '1', '1438336756', '1438336756', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12289', 'is_new', '是否为新订单', 'tinyint(2) NULL', 'bool', '1', '', '0', '0:否\r\n1:是', '1255', '0', '1', '1439435979', '1439435969', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12290', 'shop_id', '商店编号', 'int(10) NULL', 'num', '0', '', '1', '', '1255', '0', '1', '1439455026', '1439455026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12291', 'status_code', '订单跟踪状态码', 'char(50) NULL', 'select', '0', '', '0', '0:待支付\r\n1:待商家确认\r\n2:待发货\r\n3:配送中\r\n4:确认已收货\r\n5:确认已收款\r\n6:待评价\r\n7:已评价', '1255', '0', '1', '1439536746', '1439526095', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12292', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '1256', '0', '1', '1422931055', '1422930936', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12293', 'goods_id', '商品ID', 'int(10) NULL', 'num', '', '', '0', '', '1256', '0', '1', '1422930970', '1422930970', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12294', 'score', '得分', 'int(10) NULL', 'num', '0', '', '0', '', '1256', '0', '1', '1422931004', '1422931004', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12295', 'cTime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1256', '0', '1', '1422931044', '1422931044', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12296', 'title', '分类标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1257', '1', '1', '1397529407', '1397529407', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12297', 'icon', '分类图标', 'int(10) unsigned NULL ', 'picture', '', '建议上传100X100的正方形图片', '1', '', '1257', '0', '1', '1431072029', '1397529461', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12298', 'pid', '上一级分类', 'int(10) unsigned NULL ', 'select', '0', '如果你要增加一级分类，这里选择“无”即可', '0', '0:无', '1257', '0', '1', '1422934148', '1397529555', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12299', 'path', '分类路径', 'varchar(255) NULL', 'string', '', '', '0', '', '1257', '0', '1', '1397529604', '1397529604', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12300', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '数值越小越靠前', '1', '', '1257', '0', '1', '1397529705', '1397529705', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12301', 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', '1', '0:不显示\r\n1:显示', '1257', '0', '1', '1397532496', '1397529809', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12302', 'shop_id', '商店ID', 'int(10) NOT NULL', 'num', '0', '', '4', '', '1257', '0', '1', '1422934193', '1422672025', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12303', 'is_recommend', '是否推荐', 'tinyint(2) NULL', 'bool', '0', '', '1', '0:否\r\n1:是', '1257', '0', '1', '1423106432', '1423106432', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12304', 'content', '捐赠者留言', 'text NULL', 'textarea', '', '', '1', '', '1258', '0', '1', '1446095026', '1446095026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12305', 'money', '捐赠金额', 'float(10) NULL', 'num', '', '', '1', '', '1258', '0', '1', '1446094995', '1446094995', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12306', 'email', '捐赠者邮箱', 'varchar(255) NULL', 'string', '', '', '1', '', '1258', '0', '1', '1446094966', '1446094966', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12307', 'nickname', '捐赠者昵称', 'varchar(255) NULL', 'string', '', '', '1', '', '1258', '0', '1', '1446094946', '1446094946', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12308', 'ctime', '捐赠时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1258', '0', '1', '1446094933', '1446094933', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12309', 'openid', '捐赠者openid', 'varchar(255) NULL', 'string', '', '', '0', '', '1258', '0', '1', '1446094904', '1446094904', '', '3', '', 'regex', 'get_openid', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12310', 'token', '公众号token', 'varchar(255) NULL', 'string', '', '', '0', '', '1258', '0', '1', '1446094880', '1446094880', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12311', 'desc', '描述', 'text NULL', 'textarea', '', '', '1', '', '1259', '0', '1', '1446094736', '1446094736', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12312', 'money', '金额', 'int(10) NULL', 'num', '', '', '1', '', '1259', '0', '1', '1446094722', '1446094722', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12313', 'token', '公众号token', 'varchar(255) NULL', 'string', '', '', '0', '', '1259', '0', '1', '1446094688', '1446094688', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12314', 'keyword_type', '关键词匹配类型', 'tinyint(2) NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '1260', '0', '1', '1394268247', '1393921586', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12315', 'api_token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1260', '0', '1', '1393922455', '1393912408', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12316', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '1260', '0', '1', '1393913608', '1393913608', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12317', 'api_url', '第三方URL', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1260', '0', '1', '1393912354', '1393912354', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12318', 'output_format', '数据输出格式', 'tinyint(1) NULL', 'select', '0', '', '1', '0:标准微信xml\r\n1:json格式', '1260', '0', '1', '1394268422', '1393912288', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12319', 'keyword_filter', '关键词过滤', 'tinyint(2) NOT NULL', 'bool', '0', '如设置电影为触发词,用户输入 电影 美国派 时，如果启用过滤只将美国派这个词发送到的你的接口，如果不过滤 就是整个 电影 美国派全部发送到的接口', '1', '0:不过滤\r\n1:过滤', '1260', '0', '1', '1394268410', '1393912057', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12320', 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '多个关键词请用空格格开', '1', '', '1260', '1', '1', '1393912492', '1393911842', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12321', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1260', '0', '1', '1402454223', '1402454223', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12322', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1261', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12323', 'cTime', '发布时间', 'int(10) UNSIGNED NULL', 'datetime', '', '', '0', '', '1261', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12324', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1261', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12325', 'password', '表单密码', 'varchar(255) NULL', 'string', '', '如要用户输入密码才能进入表单，则填写此项。否则留空，用户可直接进入表单', '0', '', '1261', '0', '1', '1396871497', '1396672643', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12326', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '1261', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12327', 'jump_url', '提交后跳转的地址', 'varchar(255) NULL', 'string', '', '要以http://开头的完整地址，为空时不跳转', '1', '', '1261', '0', '1', '1402458121', '1399800276', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12328', 'content', '详细介绍', 'text NULL', 'editor', '', '可不填', '1', '', '1261', '0', '1', '1396865295', '1396865295', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12329', 'finish_tip', '用户提交后提示内容', 'text NULL', 'string', '', '为空默认为：提交成功，谢谢参与', '1', '', '1261', '0', '1', '1447497102', '1396673689', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12330', 'can_edit', '是否允许编辑', 'tinyint(2) NULL', 'bool', '0', '用户提交表单是否可以再编辑', '1', '0:不允许\r\n1:允许', '1261', '0', '1', '1396688624', '1396688624', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12331', 'intro', '封面简介', 'text NULL', 'textarea', '', '', '1', '', '1261', '1', '1', '1439371986', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12332', 'mTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1261', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12333', 'cover', '封面图片', 'int(10) UNSIGNED NULL', 'picture', '', '', '1', '', '1261', '1', '1', '1439372018', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12334', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '1261', '1', '1', '1396866048', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12335', 'template', '模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '1261', '0', '1', '1431661124', '1431661124', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12336', 'is_show', '是否显示', 'tinyint(2) NULL', 'select', '1', '是否显示在表单中', '1', '1:显示\r\n0:不显示', '1262', '0', '1', '1396848437', '1396848437', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12337', 'forms_id', '表单ID', 'int(10) UNSIGNED NULL', 'num', '', '', '4', '', '1262', '0', '1', '1396710040', '1396690613', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12338', 'error_info', '出错提示', 'varchar(255) NULL', 'string', '', '验证不通过时的提示语', '1', '', '1262', '0', '1', '1396685920', '1396685920', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12339', 'sort', '排序号', 'int(10) UNSIGNED NULL', 'num', '0', '值越小越靠前', '1', '', '1262', '0', '1', '1396685825', '1396685825', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12340', 'validate_rule', '正则验证', 'varchar(255) NULL', 'string', '', '为空表示不作验证', '1', '', '1262', '0', '1', '1396685776', '1396685776', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12341', 'is_must', '是否必填', 'tinyint(2) NULL', 'bool', '', '用于自动验证', '1', '0:否\r\n1:是', '1262', '0', '1', '1396685579', '1396685579', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12342', 'remark', '字段备注', 'varchar(255) NULL', 'string', '', '用于表单中的提示', '1', '', '1262', '0', '1', '1396685482', '1396685482', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12343', 'name', '字段名', 'varchar(100) NULL', 'string', '', '请输入字段名 英文字母开头，长度不超过30', '1', '', '1262', '1', '1', '1447638080', '1396676792', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12344', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1262', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12345', 'value', '默认值', 'varchar(255) NULL', 'string', '', '字段的默认值', '1', '', '1262', '0', '1', '1396685291', '1396685291', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12346', 'title', '字段标题', 'varchar(255) NOT NULL', 'string', '', '请输入字段标题，用于表单显示', '1', '', '1262', '1', '1', '1396676830', '1396676830', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12347', 'mTime', '修改时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1262', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12348', 'extra', '参数', 'text NULL', 'textarea', '', '字段类型为单选、多选、下拉选择和级联选择时的定义数据，其它字段类型为空', '1', '', '1262', '0', '1', '1396835020', '1396685105', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12349', 'type', '字段类型', 'char(50) NOT NULL', 'select', 'string', '用于表单中的展示方式', '1', 'string:单行输入\r\ntextarea:多行输入\r\nradio:单选\r\ncheckbox:多选\r\nselect:下拉选择\r\ndatetime:时间\r\npicture:上传图片', '1262', '1', '1', '1396871262', '1396683600', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12350', 'forms_id', '表单ID', 'int(10) UNSIGNED NULL', 'num', '', '', '4', '', '1263', '0', '1', '1396710064', '1396688308', '', '3', '', 'regex', '', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12351', 'value', '表单值', 'text NULL', 'textarea', '', '', '0', '', '1263', '0', '1', '1396688355', '1396688355', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12352', 'cTime', '增加时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1263', '0', '1', '1396688434', '1396688434', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12353', 'openid', 'OpenId', 'varchar(255) NULL', 'string', '', '', '0', '', '1263', '0', '1', '1396688187', '1396688187', '', '3', '', 'regex', 'get_openid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12354', 'uid', '用户ID', 'int(10) NULL', 'num', '', '', '0', '', '1263', '0', '1', '1396688042', '1396688042', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12355', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1263', '0', '1', '1396690911', '1396690911', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12356', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '1264', '0', '1', '1393234678', '1393234678', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12357', 'content', '内容', 'text NOT NULL', 'textarea', '', '', '1', '', '1264', '1', '1', '1393234583', '1393234583', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12358', 'uid', '用户ID', 'int(10) NOT NULL', 'num', '0', '', '0', '', '1264', '0', '1', '1393234534', '1393234534', '', '3', '', 'regex', 'get_mid', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12359', 'nickname', '用户昵称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1264', '0', '1', '1400687052', '1400687052', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12360', 'mobile', '手机号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1264', '0', '1', '1400687075', '1400687075', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12361', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1264', '0', '1', '1400687900', '1400687900', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12362', 'public_count', '可创建公众号数', 'int(10) NULL', 'num', '', '', '1', '', '1', '0', '1', '1452417198', '1452417198', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12363', 'token', '公众号token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1265', '0', '1', '1447736812', '1447736812', '', '3', '', 'regex', 'get_token', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12364', 'openid', '微信用户id', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1265', '0', '1', '1447736895', '1447736895', '', '3', '', 'regex', 'get_openid', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12365', 'name', '姓名', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1265', '0', '1', '1447736947', '1447736947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12366', 'sex', '性别', 'int(10) NOT NULL', 'select', '', '', '1', '0:保密\r\n1:男性\r\n2:女性', '1265', '0', '1', '1452331282', '1447737042', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12367', 'mobile', '手机号', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1265', '0', '1', '1447737168', '1447737168', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12368', 'address', '详细地址', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1265', '0', '1', '1447737246', '1447737246', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12369', 'country', '国家', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1265', '0', '1', '1447737319', '1447737319', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12370', 'province', '省份', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1265', '0', '1', '1447737345', '1447737345', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12371', 'city', '城市', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1265', '0', '1', '1447737405', '1447737405', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12372', 'area', '地区', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1265', '0', '1', '1447737430', '1447737430', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12373', 'is_default', '是否默认', 'int(10) NOT NULL', 'select', '0', '', '1', '0:否\r\n1:是', '1265', '0', '1', '1452331302', '1447737493', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12374', 'postcode', '邮政编码', 'varchar(255) NULL', 'string', '', '', '1', '', '1265', '0', '1', '1452324019', '1452324019', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12375', 'wxmchid', '微信支付商户号', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '1', '1', '1439364696', '1436437067', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12376', 'shop_id', '商店ID', 'int(10) NULL', 'num', '0', '', '0', '', '1266', '0', '1', '1436437020', '1436437003', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12377', 'quick_merid', '银联在线merid', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436949', '1436436949', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12378', 'quick_merabbr', '商户名称', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436970', '1436436970', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12379', 'wxpartnerid', '微信partnerid', 'varchar(255) NULL', 'string', '', '', '0', '', '1266', '0', '1', '1436437196', '1436436910', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12380', 'wxpartnerkey', '微信partnerkey', 'varchar(255) NULL', 'string', '', '', '0', '', '1266', '0', '1', '1436437236', '1436436888', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12381', 'partnerid', '财付通标识', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436798', '1436436798', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12382', 'key', 'KEY', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436771', '1436436771', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12383', 'ctime', '创建时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1266', '0', '1', '1436436498', '1436436498', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12384', 'quick_security_key', '银联在线Key', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436931', '1436436931', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12385', 'wappartnerkey', 'WAP财付通Key', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436863', '1436436863', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12386', 'wappartnerid', '财付通标识WAP', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436834', '1436436834', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12387', 'partnerkey', '财付通Key', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436816', '1436436816', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12388', 'pid', 'PID', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436707', '1436436707', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12389', 'zfbname', '帐号', 'varchar(255) NULL', 'string', '', '', '1', '', '1266', '0', '1', '1436436653', '1436436653', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12390', 'wxappsecret', 'AppSecret', 'varchar(255) NULL', 'string', '', '微信支付中的公众号应用密钥', '1', '', '1266', '1', '1', '1439364612', '1436436618', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12391', 'wxpaysignkey', '支付密钥', 'varchar(255) NULL', 'string', '', 'PartnerKey', '1', '', '1266', '1', '1', '1439364810', '1436436569', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12392', 'wxappid', 'AppID', 'varchar(255) NULL', 'string', '', '微信支付中的公众号应用ID', '1', '', '1266', '1', '1', '1439364573', '1436436534', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12393', 'token', 'token', 'varchar(255) NULL', 'string', '', '', '0', '', '1266', '0', '1', '1436436415', '1436436415', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12394', 'wx_cert_pem', '上传证书', 'int(10) UNSIGNED NULL', 'file', '', 'apiclient_cert.pem', '1', '', '1266', '0', '1', '1439804529', '1439550487', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12395', 'wx_key_pem', '上传密匙', 'int(10) UNSIGNED NULL', 'file', '', 'apiclient_key.pem', '1', '', '1266', '0', '1', '1439804544', '1439804014', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12396', 'from', '回调地址', 'varchar(50) NOT NULL', 'string', '', '', '1', '', '1267', '0', '1', '1420596347', '1420596347', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12397', 'orderName', '订单名称', 'varchar(255) NULL', 'string', '', '', '1', '', '1267', '0', '1', '1439976366', '1420596373', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12398', 'single_orderid', '订单号', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '1267', '0', '1', '1420596415', '1420596415', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12399', 'price', '价格', 'decimal(10,2) NULL', 'num', '', '', '1', '', '1267', '0', '1', '1439812508', '1420596472', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12400', 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '1267', '0', '1', '1420596492', '1420596492', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12401', 'wecha_id', 'OpenID', 'varchar(200) NOT NULL', 'string', '', '', '1', '', '1267', '0', '1', '1420596530', '1420596530', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12402', 'paytype', '支付方式', 'varchar(30) NOT NULL', 'string', '', '', '1', '', '1267', '0', '1', '1420596929', '1420596929', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12403', 'showwxpaytitle', '是否显示标题', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '0:不显示\r\n1:显示', '1267', '0', '1', '1420596980', '1420596980', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12404', 'status', '支付状态', 'tinyint(2) NOT NULL', 'bool', '0', '', '1', '0:未支付\r\n1:已支付\r\n2:支付失败', '1267', '0', '1', '1420597026', '1420597026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12416', 'jump_type', '推送类型', 'char(10) NULL', 'radio', '0', '', '1', '1:URL|keyword@hide,url@show\r\n0:关键词|keyword@show,url@hide', '1268', '0', '1', '1447208981', '1447208981', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12417', 'menu_id', '对应菜单ID，禁止修改', 'int(10) NULL', 'num', '', '', '1', '', '1268', '0', '1', '1453345667', '1453345667', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12418', 'title', '菜单标题', 'varchar(255) NULL', 'string', '', '用于区分菜单类型', '1', '', '1269', '1', '1', '1453098869', '1453098869', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12419', 'type', '菜单类型', 'char(50) NULL', 'select', '0', '菜单类型', '1', '0:默认菜单\r\n1:个性菜单', '1269', '1', '1', '1453098999', '1453098999', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12420', 'group_id', '用户分组id', 'varchar(255) NULL', 'string', '', '', '1', '', '1269', '0', '1', '1453305419', '1453099301', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12421', 'sex', '性别', 'char(50) NULL', 'select', '', '', '1', '1:男\r\n2:女', '1269', '0', '1', '1453099368', '1453099368', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12422', 'country', '国家信息', 'varchar(255) NULL', 'string', '', '国家信息', '1', '', '1269', '0', '1', '1453099469', '1453099469', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12423', 'province', '省份信息', 'varchar(255) NULL', 'string', '', '省份信息', '1', '', '1269', '0', '1', '1453099495', '1453099495', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12424', 'city', '城市信息', 'varchar(255) NULL', 'string', '', '城市信息', '1', '', '1269', '0', '1', '1453099551', '1453099551', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12425', 'client_platform_type', '手机操作系统类型', 'char(50) NULL', 'select', '', '手机操作系统类型', '1', '1:IOS\r\n2:Android\r\n3:Others', '1269', '0', '1', '1453099676', '1453099676', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12426', 'menuid', '微信端菜单ID', 'varchar(255) NULL', 'string', '', '', '1', '', '1269', '0', '1', '1453307372', '1453100271', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12427', 'token', 'Token', 'varchar(255) NULL', 'string', '', 'Token', '0', '', '1269', '0', '1', '1453116330', '1453116321', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12428', 'cTime', '菜单发布时间', 'int(10) NULL', 'datetime', '', '菜单发布时间', '1', '', '1269', '0', '1', '1453116920', '1453116525', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12429', 'show', '是否发布', 'char(50) NULL', 'select', '0', '是否发布', '1', '0:未发布\r\n1:已发布', '1269', '0', '1', '1453306537', '1453219041', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12641', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '1291', '0', '1', '1396580674', '1396580674', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12640', 'view_count', '浏览数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '1291', '0', '1', '1396580643', '1396580643', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12639', 'content', '回复内容', 'text NULL', 'textarea', '', '请不要多于1000字否则无法发送。支持加超链接，但URL必须带http://', '1', '', '1291', '0', '1', '1396607362', '1396578597', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12637', 'keyword', '关键词', 'varchar(255) NULL', 'string', '', '多个关键词请用空格分开：例如: 高 富 帅', '1', '', '1291', '0', '1', '1396578460', '1396578212', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12638', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '1291', '0', '1', '1396623302', '1396578249', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12636', 'author', '作者', 'varchar(50) NULL', 'string', '', '为空时取当前用户名', '1', '', '1290', '0', '1', '1437988055', '1437988055', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12635', 'jump_url', '外链', 'varchar(255) NULL', 'string', '', '如需跳转填写网址(记住必须有http://)如果填写了图文详细内容，这里请留空，不要设置！', '1', '', '1290', '0', '1', '1402482073', '1402482073', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12629', 'cover', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '1290', '0', '1', '1396062093', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12628', 'cate_id', '所属类别', 'int(10) unsigned NULL ', 'select', '0', '要先在微官网分类里配置好分类才可选择', '1', '0:请选择分类', '1290', '0', '1', '1396078914', '1396062003', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12634', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1290', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12633', 'view_count', '浏览数', 'int(10) unsigned NULL ', 'num', '0', '', '0', '', '1290', '0', '1', '1396510630', '1396510630', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12632', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '数值越小越靠前', '1', '', '1290', '0', '1', '1396510508', '1396510508', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12631', 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1290', '0', '1', '1396075102', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12630', 'content', '内容', 'text NULL', 'editor', '', '', '1', '', '1290', '0', '1', '1396062146', '1396062146', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12626', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1290', '1', '1', '1396061877', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12627', 'intro', '简介', 'text NULL', 'textarea', '', '', '1', '', '1290', '0', '1', '1396061947', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12625', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '1290', '0', '1', '1396061814', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12623', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1289', '0', '1', '1396602821', '1396602821', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12622', 'mult_ids', '多图文ID', 'varchar(255) NULL', 'string', '', '', '0', '', '1289', '0', '1', '1396602601', '1396602578', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12624', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '1290', '1', '1', '1396061575', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12621', 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配\r\n4:正则匹配\r\n5:随机匹配', '1289', '0', '1', '1396602706', '1396602548', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12453', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '1273', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12454', 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '1273', '1', '1', '1396624426', '1396061765', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12455', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1273', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12456', 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', '1', '', '1273', '0', '1', '1396624505', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12457', 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '1273', '0', '1', '1396624664', '1396624664', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12458', 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '1273', '0', '1', '1396624534', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12459', 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', '0', '', '1273', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12460', 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', '0', '', '1273', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12461', 'picture1', '前', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '1273', '1', '1', '1398317579', '1398317579', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12462', 'picture2', '右', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '1273', '1', '1', '1398317609', '1398317609', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12463', 'picture3', '后', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '1273', '1', '1', '1398317631', '1398317631', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12464', 'picture4', '左', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '1273', '1', '1', '1398317658', '1398317658', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12465', 'picture5', '上', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '1273', '1', '1', '1398317678', '1398317678', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12466', 'picture6', '下', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '1273', '1', '1', '1398317695', '1398317695', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12467', 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '1274', '0', '1', '1397783022', '1397783022', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12468', 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1274', '0', '1', '1397782948', '1397782948', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12469', 'keyword_type', '关键词类型', 'char(50) NOT NULL', 'select', '0', '', '1', '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', '1274', '1', '1', '1397793022', '1397793022', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12554', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1282', '0', '1', '1395396571', '1395396571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12555', 'keyword', '关键词', 'varchar(255) NULL ', 'string', '', '用户发送 “关键词” 触发', '1', '', '1282', '0', '1', '1395395713', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12591', 'addon', '来源插件', 'varchar(255) NULL', 'string', 'Scratch', '', '0', '', '1287', '0', '1', '1399348676', '1399348676', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12589', 'num', '已经抽奖的次数', 'int(10) UNSIGNED NULL', 'num', '0', '', '1', '', '1286', '0', '1', '1395567486', '1395567486', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12588', 'xydzp_id', '幸运大转盘关联的活动id', 'int(10) UNSIGNED NULL', 'num', '', '幸运大转盘关联的活动id', '0', '', '1286', '0', '1', '1395567452', '1395567452', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12587', 'uid', '用户id', 'varchar(255) NULL', 'string', '', '用户id', '0', '', '1286', '0', '1', '1395567404', '1395567404', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12586', 'card_url', '领取卡券的地址', 'varchar(255) NULL', 'string', '', '', '1', '', '1285', '0', '1', '1420207297', '1420207297', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12585', 'experience', '奖励经验值', 'int(10) NULL', 'num', '0', '', '1', '', '1285', '0', '1', '1419300396', '1419300396', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12583', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1285', '0', '1', '1395554191', '1395554191', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12593', 'title', '奖项标题', 'varchar(255) NULL', 'string', '', '如特等奖、一等奖。。。', '1', '', '1287', '1', '1', '1439370111', '1399348734', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12592', 'target_id', '来源ID', 'int(10) unsigned NULL ', '', '', '', '1', '', '1287', '0', '1', '1420980352', '1399348699', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12590', 'cjdate', '抽奖日期', 'int(10) NULL', 'datetime', '', '', '1', '', '1286', '0', '1', '1395567537', '1395567537', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12584', 'coupon_id', '优惠券编号', 'int(10) NULL', 'num', '', '', '1', '', '1285', '0', '1', '1419300336', '1419300336', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12582', 'isdf', '是否为谢谢惠顾类', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:中奖品\r\n1:该奖为谢谢惠顾类', '1285', '0', '1', '1419392345', '1396191564', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12581', 'num', '库存数量', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '1285', '0', '1', '1396667941', '1395395190', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12580', 'miaoshu', '奖品描述', 'text NULL ', 'textarea', '', '', '1', '', '1285', '0', '1', '1418628021', '1395395190', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12579', 'pic', '奖品图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '1285', '0', '1', '1395495279', '1395395190', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12577', 'duijma', '兑奖码', 'text NULL', 'textarea', '', '请输入兑奖码，一行一个', '0', '', '1285', '0', '1', '1419300292', '1396253842', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12576', 'jptype', '奖品类型', 'char(10) NULL ', 'select', '0', '奖品的类型', '1', '0:经验值|coupon_id@hide,experience@show,num@show,card_url@hide\r\n1:优惠券|coupon_id@show,experience@hide,num@show,card_url@hide\r\n2:谢谢参与|coupon_id@hide,experience@hide,num@hide,card_url@hide\r\n3:微信卡券|coupon_id@hide,experience@hide,num@show,card_url@show', '1285', '0', '1', '1420207419', '1395395190', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12578', 'title', '奖品名称', 'varchar(255) NULL ', 'string', '', '', '1', '', '1285', '0', '1', '1395495283', '1395395190', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12575', 'zjdate', '中奖时间', 'int(10) UNSIGNED NULL', 'num', '', '', '0', '', '1284', '0', '1', '1396191999', '1396191999', '', '3', '', 'regex', 'time()', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12574', 'xydzp_id', '活动id', 'int(10) unsigned NULL ', 'string', '0', '', '1', '', '1284', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `dc_attribute` VALUES ('12573', 'xydzp_option_id', '奖品id', 'int(10) unsigned NULL ', 'string', '0', '', '1', '', '1284', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `dc_attribute` VALUES ('12572', 'state', '领奖状态', 'tinyint(2) NULL', 'bool', '0', '', '0', '0:未领取\r\n1:已领取', '1284', '0', '1', '1396705093', '1395395200', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12568', 'message', '留言', 'text NULL ', 'string', '', '', '1', '', '1284', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `dc_attribute` VALUES ('12571', 'zip', '邮编', 'int(10) unsigned NULL ', 'string', '', '', '1', '', '1284', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `dc_attribute` VALUES ('12570', 'iphone', '电话', 'varchar(255) NULL ', 'string', '', '', '1', '', '1284', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `dc_attribute` VALUES ('12569', 'address', '收件地址', 'text NULL ', 'string', '', '', '1', '', '1284', '0', '1', '1395395200', '1395395200', '', '0', '', '', '', '0', '');
INSERT INTO `dc_attribute` VALUES ('12566', 'xydzp_option_id', '幸运大转盘关联的全局奖品id', 'int(10) UNSIGNED NULL', 'num', '', '幸运大转盘关联的全局奖品id', '0', '', '1283', '0', '1', '1395555085', '1395555085', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12567', 'uid', '用户openid', 'varchar(255) NULL', 'string', '', '', '0', '', '1284', '0', '1', '1396686415', '1396686415', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12565', 'gailv_maxnum', '单日发放上限', 'int(10) UNSIGNED NULL', 'num', '0', '每天最多发放奖品的数量', '1', '', '1283', '0', '1', '1395559281', '1395559281', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12564', 'type', '奖品中奖方式', 'char(50) NULL', 'select', '0', '选择奖品中奖的方式', '0', '0:按概率中奖\r\n1:按时间中奖(未启用)\r\n2:按顺序中奖(未启用)\r\n3:按指定用户id中奖(未启用)', '1283', '0', '1', '1419303723', '1395559102', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12560', 'gailv', '中奖概率', 'int(10) UNSIGNED NULL', 'num', '0', '请输入0-100之间的整数', '1', '', '1283', '0', '1', '1419303857', '1395559151', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12563', 'jlnum', '奖励数量', 'int(10) UNSIGNED NULL', 'num', '1', '中奖后，获得该奖品的数量', '0', '', '1283', '0', '1', '1419303776', '1395559386', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12562', 'xydzp_id', '幸运大转盘关联的活动id', 'int(10) UNSIGNED NULL', 'num', '0', '幸运大转盘关联的活动id', '0', '', '1283', '0', '1', '1395555019', '1395555019', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12561', 'gailv_str', '参数', 'varchar(255) NULL', 'string', '', '请输入对应中奖方式的相应值 多个以英文状态下的 逗号(,)分隔', '0', '', '1283', '0', '1', '1419303819', '1395559219', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12559', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '1282', '0', '1', '1431659474', '1431659474', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12558', 'background', '背景图', 'int(10) UNSIGNED NULL', 'picture', '', '图片尺寸建议是760X421 并且主要内容要居中并留出大转盘位置', '1', '', '1282', '0', '1', '1419997464', '1419997464', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12557', 'experience', '消耗经验值', 'int(10) NULL', 'num', '0', '', '1', '', '1282', '0', '1', '1419299966', '1419299966', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12556', 'start_date', '开始时间', 'int(10) NULL ', 'datetime', '', '', '1', '', '1282', '0', '1', '1395395676', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12545', 'end_date', '结束日期', 'int(10) NULL ', 'datetime', '', '', '1', '', '1282', '0', '1', '1395395670', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12546', 'cTime', '活动创建时间', 'int(10) NULL ', 'datetime', '', '', '0', '', '1282', '0', '1', '1395395963', '1395395179', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12547', 'states', '活动状态', 'char(10) NULL ', 'radio', '0', '', '0', '0:未开始\r\n1:已结束', '1282', '0', '1', '1395395602', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12548', 'picurl', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '1282', '1', '1', '1439370422', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12549', 'title', '活动标题', 'varchar(255) NULL ', 'string', '', '', '1', '', '1282', '0', '1', '1395395535', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12550', 'guiz', '活动规则', 'text NULL ', 'textarea', '', '', '1', '', '1282', '0', '1', '1418369751', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12551', 'choujnum', '每日抽奖次数', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '1282', '0', '1', '1395395485', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12552', 'des', '活动介绍', 'text NULL ', 'textarea', '', '', '0', '', '1282', '0', '1', '1431068356', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12553', 'des_jj', '活动介绍', 'text NULL ', 'textarea', '', '活动介绍简介 用于给用户发送消息时候的图文描述', '1', '', '1282', '0', '1', '1431068323', '1395395179', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `dc_attribute` VALUES ('12613', 'credit_conditon', '积分限制', 'int(10) unsigned NULL ', 'num', '0', '粉丝达到多少积分后才能领取，领取后不扣积分', '1', '', '1288', '0', '1', '1399260618', '1399260618', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12612', 'follower_condtion', '粉丝状态', 'char(50) NULL', 'select', '1', '粉丝达到设置的状态才能获取', '1', '0:不限制\r\n1:已关注\r\n2:已绑定信息\r\n3:会员卡成员', '1288', '0', '1', '1399260479', '1399260479', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12610', 'predict_num', '预计参与人数', 'int(10) unsigned NOT NULL ', 'num', '', '预计人数直接影响抽奖概率：中奖概率 = 奖品总数/(预估活动人数*每人抽奖次数) 要确保100%中奖可设置为1', '1', '', '1288', '1', '1', '1399710446', '1399259992', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12608', 'end_tips', '过期说明', 'text NULL', 'textarea', '', '活动过期或者结束说明', '1', '', '1288', '0', '1', '1399259570', '1399259570', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12606', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1288', '0', '1', '1396602871', '1396602859', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12607', 'start_time', '开始时间', 'int(10) NULL', 'datetime', '', '', '1', '', '1288', '0', '1', '1399259416', '1399259416', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12603', 'end_time', '结束时间', 'int(10) NULL', 'datetime', '', '', '1', '', '1288', '0', '1', '1399259433', '1399259433', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12601', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1288', '1', '1', '1396624461', '1396061859', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12600', 'use_tips', '使用说明', 'varchar(255) NOT NULL', 'textarea', '', '用户获取刮刮卡后显示的提示信息', '1', '', '1288', '1', '1', '1420989679', '1399259489', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12598', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1287', '0', '1', '1404525428', '1404525428', '', '3', '', 'regex', 'get_token', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12599', 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', '1', '', '1288', '1', '1', '1396624337', '1396061575', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12595', 'num', '名额数量', 'int(10) unsigned NULL ', 'num', '', '', '1', '', '1287', '1', '1', '1439370137', '1399348843', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12594', 'name', '奖项', 'varchar(255) NULL', 'string', '', '如iphone、吹风机等', '1', '', '1287', '1', '1', '1439370125', '1399348785', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12611', 'max_num', '每人最多允许抽奖次数', 'int(10) unsigned NULL ', 'num', '1', '0表示不限制数量', '1', '', '1288', '0', '1', '1399260079', '1399260079', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12609', 'end_img', '过期提示图片', 'int(10) unsigned NULL ', 'picture', '', '可为空', '1', '', '1288', '0', '1', '1399712676', '1399711987', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12605', 'cTime', '发布时间', 'int(10) unsigned NULL ', 'datetime', '', '', '0', '', '1288', '0', '1', '1396624612', '1396075102', '', '3', '', 'regex', 'time', '1', 'function');
INSERT INTO `dc_attribute` VALUES ('12604', 'cover', '封面图片', 'int(10) unsigned NULL ', 'picture', '', '可为空', '1', '', '1288', '0', '1', '1399710705', '1396062093', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12602', 'intro', '封面简介', 'text NULL', 'editor', '', '', '1', '', '1288', '0', '1', '1420983308', '1396061947', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12597', 'img', '奖品图片', 'int(10) unsigned NULL ', 'picture', '', '', '1', '', '1287', '0', '1', '1399557997', '1399557997', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12596', 'sort', '排序号', 'int(10) unsigned NULL ', 'num', '0', '值越小越靠前', '1', '', '1287', '0', '1', '1399557716', '1399557716', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12614', 'credit_bug', '积分消费', 'int(10) unsigned NULL ', 'num', '0', '用积分中的财富兑换、兑换后扣除相应的积分财富', '1', '', '1288', '0', '1', '1399260764', '1399260764', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12615', 'addon_condition', '插件场景限制', 'varchar(255) NULL', 'string', '', '格式：[插件名:id值]，如[投票:10]表示对ID为10的投票投完才能领取，更多的说明见表单上的提示', '1', '', '1288', '0', '1', '1399274022', '1399261026', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12616', 'collect_count', '已领取人数', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '1288', '0', '1', '1420980201', '1399270900', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12617', 'view_count', '浏览人数', 'int(10) unsigned NULL ', 'num', '0', '', '1', '', '1288', '0', '1', '1420980183', '1399270926', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12618', 'update_time', '更新时间', 'int(10) NULL', 'datetime', '', '', '0', '', '1288', '0', '1', '1399562468', '1399359204', '', '3', '', 'regex', 'time', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12619', 'template', '素材模板', 'varchar(255) NULL', 'string', 'default', '', '1', '', '1288', '0', '1', '1430201266', '1430201266', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12620', 'keyword', '关键词', 'varchar(255) NULL', 'string', '', '', '1', '', '1289', '0', '1', '1396602514', '1396602514', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `dc_attribute` VALUES ('12642', 'token', 'Token', 'varchar(255) NULL', 'string', '', '', '0', '', '1291', '0', '1', '1396603007', '1396603007', '', '3', '', 'regex', 'get_token', '1', 'function');

-- ----------------------------
-- Table structure for `dc_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `dc_auth_extend`;
CREATE TABLE `dc_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of dc_auth_extend
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `dc_auth_group`;
CREATE TABLE `dc_auth_group` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(30) default NULL COMMENT '分组名称',
  `icon` int(10) unsigned default NULL COMMENT '图标',
  `description` text COMMENT '描述信息',
  `status` tinyint(2) default '1' COMMENT '状态',
  `type` tinyint(2) default '1' COMMENT '类型',
  `rules` text COMMENT '权限',
  `manager_id` int(10) default '0' COMMENT '管理员ID',
  `token` varchar(100) default NULL COMMENT 'Token',
  `is_default` tinyint(1) default '0' COMMENT '是否默认自动加入',
  `qr_code` varchar(255) default NULL COMMENT '微信二维码',
  `wechat_group_id` int(10) default '-1' COMMENT '微信端的分组ID',
  `wechat_group_name` varchar(100) default NULL COMMENT '微信端的分组名',
  `wechat_group_count` int(10) default NULL COMMENT '微信端用户数',
  `is_del` tinyint(1) default '0' COMMENT '是否已删除',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_auth_group
-- ----------------------------
INSERT INTO `dc_auth_group` VALUES ('1', '默认用户组', null, '通用的用户组', '1', '0', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106', '0', '', '0', '', null, '', null, '0');
INSERT INTO `dc_auth_group` VALUES ('2', '公众号粉丝组', null, '所有从公众号自动注册的粉丝用户都会自动加入这个用户组', '1', '0', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195', '0', '', '0', '', null, '', null, '0');
INSERT INTO `dc_auth_group` VALUES ('3', '公众号管理组', null, '公众号管理员注册时会自动加入这个用户组', '1', '0', '', '0', '', '0', '', null, '', null, '0');
INSERT INTO `dc_auth_group` VALUES ('17', '黑名单', null, null, '1', '1', null, '2', 'gh_72c21308d5d5', '0', '', '1', '黑名单', '0', '0');
INSERT INTO `dc_auth_group` VALUES ('16', '未分组', null, null, '1', '1', null, '2', 'gh_72c21308d5d5', '0', '', '0', '未分组', '1', '0');
INSERT INTO `dc_auth_group` VALUES ('15', '星标组', null, '', '1', '1', null, '2', 'gh_72c21308d5d5', '0', '', '100', '星标组', '0', '0');
INSERT INTO `dc_auth_group` VALUES ('18', '星标组', null, null, '1', '1', null, '2', 'gh_72c21308d5d5', '0', '', '2', '星标组', '1', '0');
INSERT INTO `dc_auth_group` VALUES ('19', '未分组', null, null, '1', '1', null, '2', 'gh_6019aad69b3f', '0', '', '0', '未分组', '0', '0');
INSERT INTO `dc_auth_group` VALUES ('20', '黑名单', null, null, '1', '1', null, '2', 'gh_6019aad69b3f', '0', '', '1', '黑名单', '0', '0');
INSERT INTO `dc_auth_group` VALUES ('21', '星标组', null, null, '1', '1', null, '2', 'gh_6019aad69b3f', '0', '', '2', '星标组', '0', '0');
INSERT INTO `dc_auth_group` VALUES ('22', '我的好友', null, '', '1', '1', null, '2', 'gh_6019aad69b3f', '0', null, '100', '我的好友', '1', '0');

-- ----------------------------
-- Table structure for `dc_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `dc_auth_group_access`;
CREATE TABLE `dc_auth_group_access` (
  `uid` int(10) default NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_auth_group_access
-- ----------------------------
INSERT INTO `dc_auth_group_access` VALUES ('1', '3');
INSERT INTO `dc_auth_group_access` VALUES ('2', '3');
INSERT INTO `dc_auth_group_access` VALUES ('3', '16');
INSERT INTO `dc_auth_group_access` VALUES ('4', '18');
INSERT INTO `dc_auth_group_access` VALUES ('5', '3');
INSERT INTO `dc_auth_group_access` VALUES ('6', '22');
INSERT INTO `dc_auth_group_access` VALUES ('72', '22');

-- ----------------------------
-- Table structure for `dc_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `dc_auth_rule`;
CREATE TABLE `dc_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL auto_increment COMMENT '规则id,自增主键',
  `name` char(80) NOT NULL default '' COMMENT '规则唯一英文标识',
  `title` char(100) NOT NULL default '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL default '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL default '' COMMENT '规则附加条件',
  `group` char(30) default '默认分组',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_auth_rule
-- ----------------------------
INSERT INTO `dc_auth_rule` VALUES ('241', 'Admin/Rule/createRule', '权限节点管理', '1', '', '默认分组');
INSERT INTO `dc_auth_rule` VALUES ('242', 'Admin/AuthManager/index', '用户组管理', '1', '', '默认分组');
INSERT INTO `dc_auth_rule` VALUES ('243', 'Admin/User/index', '用户信息', '1', '', '用户管理');

-- ----------------------------
-- Table structure for `dc_auto_reply`
-- ----------------------------
DROP TABLE IF EXISTS `dc_auto_reply`;
CREATE TABLE `dc_auto_reply` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `keyword` varchar(255) default NULL COMMENT '关键词',
  `msg_type` char(50) default 'text' COMMENT '消息类型',
  `content` text COMMENT '文本内容',
  `group_id` int(10) default NULL COMMENT '图文',
  `image_id` int(10) unsigned default NULL COMMENT '上传图片',
  `manager_id` int(10) default NULL COMMENT '管理员ID',
  `token` varchar(50) default NULL COMMENT 'Token',
  `image_material` int(10) default NULL COMMENT '素材图片id',
  `voice_id` int(10) default '0' COMMENT '语音id',
  `video_id` int(10) default '0' COMMENT '视频id',
  `reply_scene` int(10) default NULL COMMENT '回复场景（0：关注时回复；1：默认回复；2：关键词回复）',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_auto_reply
-- ----------------------------
INSERT INTO `dc_auto_reply` VALUES ('10', '', 'text', '欢迎关注！', '0', '0', null, 'gh_6019aad69b3f', '0', '0', '0', '0');
INSERT INTO `dc_auto_reply` VALUES ('11', '', 'voice', '', '0', '0', null, 'gh_6019aad69b3f', '0', '18', '0', '1');

-- ----------------------------
-- Table structure for `dc_channel`
-- ----------------------------
DROP TABLE IF EXISTS `dc_channel`;
CREATE TABLE `dc_channel` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL default '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL default '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL default '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL default '0' COMMENT '新窗口打开',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_channel
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_common_category`
-- ----------------------------
DROP TABLE IF EXISTS `dc_common_category`;
CREATE TABLE `dc_common_category` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` varchar(255) default NULL COMMENT '分类标识',
  `title` varchar(255) NOT NULL COMMENT '分类标题',
  `icon` int(10) unsigned default NULL COMMENT '分类图标',
  `pid` int(10) unsigned default '0' COMMENT '上一级分类',
  `path` varchar(255) default NULL COMMENT '分类路径',
  `module` varchar(255) default NULL COMMENT '分类所属功能',
  `sort` int(10) unsigned default '0' COMMENT '排序号',
  `is_show` tinyint(2) default '1' COMMENT '是否显示',
  `intro` varchar(255) default NULL COMMENT '分类描述',
  `token` varchar(255) default NULL COMMENT 'Token',
  `code` varchar(255) default NULL COMMENT '分类扩展编号',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_common_category
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_common_category_group`
-- ----------------------------
DROP TABLE IF EXISTS `dc_common_category_group`;
CREATE TABLE `dc_common_category_group` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '分组标识',
  `title` varchar(255) NOT NULL COMMENT '分组标题',
  `cTime` int(10) unsigned default NULL COMMENT '发布时间',
  `token` varchar(100) default NULL COMMENT 'Token',
  `level` tinyint(1) unsigned default '3' COMMENT '最多级数',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_common_category_group
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_config`
-- ----------------------------
DROP TABLE IF EXISTS `dc_config`;
CREATE TABLE `dc_config` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '配置ID',
  `name` varchar(30) NOT NULL default '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL default '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL default '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL default '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL default '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL default '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL default '0' COMMENT '排序',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Records of dc_config
-- ----------------------------
INSERT INTO `dc_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1430825115', '1', '微信公众号管理平台', '0');
INSERT INTO `dc_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '最好用的微信公众号管理平台', '1');
INSERT INTO `dc_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '豆信,微信公众号,微信第三方', '8');
INSERT INTO `dc_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭\r\n1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1406859591', '1', '1', '1');
INSERT INTO `dc_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `dc_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `dc_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `dc_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `dc_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'blue_color', '10');
INSERT INTO `dc_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n3:用户\r\n4:系统\r\n5:站点', '4');
INSERT INTO `dc_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `dc_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `dc_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `dc_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `dc_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '4', '', '后台数据每页显示记录数', '1379503896', '1391938052', '1', '20', '10');
INSERT INTO `dc_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '0');
INSERT INTO `dc_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `dc_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `dc_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `dc_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `dc_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `dc_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1440555973', '1', '1', '0');
INSERT INTO `dc_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname', '0');
INSERT INTO `dc_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `dc_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '20', '0');
INSERT INTO `dc_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `dc_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `dc_config` VALUES ('38', 'WEB_SITE_VERIFY', '4', '登录验证码', '1', '0:关闭\r\n1:开启', '登录时是否需要验证码', '1378898976', '1406859544', '1', '0', '2');
INSERT INTO `dc_config` VALUES ('42', 'ACCESS', '2', '未登录时可访问的页面', '4', '', '不区分大小写', '1390656601', '1390664079', '1', 'Home/User/*\r\nHome/Index/*\r\nhome/weixin/*\r\nadmin/File/*\r\nhome/File/*\r\nhome/Forum/*\r\nHome/Material/detail', '0');
INSERT INTO `dc_config` VALUES ('44', 'DEFAULT_PUBLIC_GROUP_ID', '0', '公众号默认等级ID', '3', '', '前台新增加的公众号的默认等级，值为0表示不做权限控制，公众号拥有全部插件的权限', '1393759885', '1393759981', '1', '0', '2');
INSERT INTO `dc_config` VALUES ('45', 'SYSTEM_UPDATE_REMIND', '4', '系统升级提醒', '4', '0:关闭\r\n1:开启', '开启后官方有新升级信息会及时在后台的网站设置页面头部显示升级提醒', '1393764263', '1393764263', '1', '0', '5');
INSERT INTO `dc_config` VALUES ('46', 'SYSTEM_UPDATRE_VERSION', '0', '系统升级最新版本号', '4', '', '记录当前系统的版本号，这是与官方比较是否有升级包的唯一标识，不熟悉者只勿改变其数值', '1393764702', '1394337646', '1', '1.0.20160101', '0');
INSERT INTO `dc_config` VALUES ('47', 'FOLLOW_YOUKE_UID', '0', '粉丝游客ID', '0', '', '', '1398927704', '1398927704', '1', '-11967', '0');
INSERT INTO `dc_config` VALUES ('48', 'DEFAULT_PUBLIC', '0', '注册后默认可管理的公众号ID', '3', '', '可为空。配置用户注册后即可管理的公众号ID，多个时用英文逗号分割', '1398928794', '1398929088', '1', '', '3');
INSERT INTO `dc_config` VALUES ('49', 'DEFAULT_PUBLIC_CREATE_MAX_NUMB', '0', '默认用户最多可创建的公众号数', '3', '', '注册用户最多的创建数，也可以在用户管理里对每个用户设置不同的值', '1398949652', '1398950115', '1', '5', '4');
INSERT INTO `dc_config` VALUES ('50', 'COPYRIGHT', '1', '版权信息', '1', '', '', '1401018910', '1401018910', '1', '武汉市艾豆网络科技有限公司所有', '3');
INSERT INTO `dc_config` VALUES ('51', 'WEIPHP_STORE_LICENSE', '1', '应用商店授权许可证', '1', '', '要与 应用商店》网站信息 里的授权许可证保持一致', '1402972720', '1402977473', '1', '', '0');
INSERT INTO `dc_config` VALUES ('52', 'SYSTEM_LOGO', '1', '网站LOGO', '5', '', '填写LOGO的网址，为空时默认显示豆信的logo', '1403566699', '1403566746', '1', '', '0');
INSERT INTO `dc_config` VALUES ('53', 'SYSTEM_CLOSE_REGISTER', '4', '前台注册开关', '5', '0:不关闭\r\n1:关闭', '关闭后在登录页面不再显示注册链接', '1403568006', '1403568006', '1', '0', '0');
INSERT INTO `dc_config` VALUES ('54', 'SYSTEM_CLOSE_ADMIN', '4', '后台管理开关', '5', '0:不关闭\r\n1:关闭', '关闭后在登录页面不再显示后台登录链接', '1403568006', '1403568006', '1', '0', '0');
INSERT INTO `dc_config` VALUES ('55', 'SYSTEM_CLOSE_WIKI', '4', '二次开发开关', '5', '0:不关闭\r\n1:关闭', '关闭后在登录页面不再显示二次开发链接', '1403568006', '1403568006', '1', '0', '0');
INSERT INTO `dc_config` VALUES ('56', 'SYSTEM_CLOSE_BBS', '4', '官方论坛开关', '5', '0:不关闭\r\n1:关闭', '关闭后在登录页面不再显示官方论坛链接', '1403568006', '1403568006', '1', '0', '0');
INSERT INTO `dc_config` VALUES ('57', 'LOGIN_BACKGROUP', '1', '登录界面背景图', '5', '', '请输入图片网址，为空时默认使用自带的背景图', '1403568006', '1403570059', '1', '', '0');
INSERT INTO `dc_config` VALUES ('60', 'TONGJI_CODE', '2', '第三方统计JS代码', '5', '', '', '1428634717', '1428634717', '1', '', '0');
INSERT INTO `dc_config` VALUES ('61', 'SENSITIVE_WORDS', '1', '敏感词', '0', '', '当出现有敏感词的地方，会用*号代替, (多个敏感词用 , 隔开 )', '1433125977', '1435062628', '1', 'bitch,shit', '0');
INSERT INTO `dc_config` VALUES ('63', 'PUBLIC_BIND', '4', '公众号第三方平台', '5', '0:关闭\r\n1:开启', '申请审核通过微信开放平台里的公众号第三方平台账号后，就可以开启体验了', '1434542818', '1434542818', '1', '0', '0');
INSERT INTO `dc_config` VALUES ('64', 'COMPONENT_APPID', '1', '公众号开放平台的AppID', '5', '', '公众号第三方平台开启后必填的参数', '1434542891', '1434542975', '1', '', '0');
INSERT INTO `dc_config` VALUES ('65', 'COMPONENT_APPSECRET', '1', '公众号开放平台的AppSecret', '5', '', '公众号第三方平台开启后必填的参数', '1434542936', '1434542984', '1', '', '0');
INSERT INTO `dc_config` VALUES ('62', 'REG_AUDIT', '4', '注册审核', '3', '0:需要审核\r\n1:不需要审核', '', '1439811099', '1439811099', '1', '1', '1');

-- ----------------------------
-- Table structure for `dc_credit_config`
-- ----------------------------
DROP TABLE IF EXISTS `dc_credit_config`;
CREATE TABLE `dc_credit_config` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '积分描述',
  `name` varchar(50) default NULL COMMENT '积分标识',
  `mTime` int(10) default NULL COMMENT '修改时间',
  `experience` varchar(30) default '0' COMMENT '经验值',
  `score` varchar(30) default '0' COMMENT '金币值',
  `token` varchar(255) default '0' COMMENT 'Token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_credit_config
-- ----------------------------
INSERT INTO `dc_credit_config` VALUES ('1', '关注公众号', 'subscribe', '1438587911', '100', '100', '0');
INSERT INTO `dc_credit_config` VALUES ('2', '取消关注公众号', 'unsubscribe', '1438596459', '-100', '-100', '0');
INSERT INTO `dc_credit_config` VALUES ('3', '参与投票', 'vote', '1398565597', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('4', '参与调研', 'survey', '1398565640', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('5', '参与考试', 'exam', '1398565659', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('6', '参与测试', 'test', '1398565681', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('7', '微信聊天', 'chat', '1398565740', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('8', '建议意见反馈', 'suggestions', '1398565798', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('9', '会员卡绑定', 'card_bind', '1438596438', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('10', '获取优惠卷', 'coupons', '1398565926', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('11', '访问微网站', 'weisite', '1398565973', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('12', '查看自定义回复内容', 'custom_reply', '1398566068', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('13', '填写通用表单', 'forms', '1398566118', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('14', '访问微商店', 'shop', '1398566206', '0', '0', '0');
INSERT INTO `dc_credit_config` VALUES ('32', '程序自由增加', 'auto_add', '1442659667', '￥', '￥', '0');

-- ----------------------------
-- Table structure for `dc_credit_data`
-- ----------------------------
DROP TABLE IF EXISTS `dc_credit_data`;
CREATE TABLE `dc_credit_data` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` int(10) default '0' COMMENT '用户ID',
  `credit_name` varchar(50) default NULL COMMENT '积分标识',
  `experience` int(10) default '0' COMMENT '体力值',
  `score` int(10) default '0' COMMENT '积分值',
  `cTime` int(10) default NULL COMMENT '记录时间',
  `admin_uid` int(10) default '0' COMMENT '操作者UID',
  `token` varchar(255) default NULL COMMENT 'Token',
  `credit_title` varchar(50) default NULL COMMENT '积分标题',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_credit_data
-- ----------------------------
INSERT INTO `dc_credit_data` VALUES ('27', '73', 'subscribe', '100', '100', '1455897142', '0', 'gh_6019aad69b3f', '关注公众号');
INSERT INTO `dc_credit_data` VALUES ('26', '0', 'custom_reply', '0', '0', '1455871047', '0', 'gh_6019aad69b3f', '查看自定义回复内容');

-- ----------------------------
-- Table structure for `dc_customer`
-- ----------------------------
DROP TABLE IF EXISTS `dc_customer`;
CREATE TABLE `dc_customer` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `userid` bigint(20) unsigned NOT NULL default '0',
  `name` varchar(50) default '',
  `sex` varchar(4) default '',
  `mobile` varchar(200) default '',
  `tel` varchar(200) default '',
  `email` varchar(200) default '',
  `company` varchar(100) default '',
  `job` varchar(20) default '',
  `address` varchar(120) default '',
  `website` varchar(200) default '',
  `qq` varchar(16) default '',
  `weixin` varchar(50) default '',
  `yixin` varchar(50) default '',
  `weibo` varchar(50) default '',
  `laiwang` varchar(50) default '',
  `remark` varchar(255) default '',
  `origin` bigint(20) unsigned NOT NULL default '0',
  `originName` varchar(50) NOT NULL default '',
  `status` tinyint(1) unsigned NOT NULL default '1',
  `createUser` varchar(32) NOT NULL default '',
  `createTime` int(10) unsigned NOT NULL default '0',
  `groupId` varchar(20) NOT NULL default '',
  `groupName` varchar(200) default '',
  `group` varchar(50) default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_custom_menu`
-- ----------------------------
DROP TABLE IF EXISTS `dc_custom_menu`;
CREATE TABLE `dc_custom_menu` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `sort` tinyint(4) default '0' COMMENT '排序号',
  `pid` int(10) default '0' COMMENT '一级菜单',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `keyword` varchar(100) default NULL COMMENT '关联关键词',
  `url` varchar(255) default NULL COMMENT '关联URL',
  `token` varchar(255) default NULL COMMENT 'Token',
  `type` varchar(30) default 'click' COMMENT '类型',
  `from_type` char(50) default '-1' COMMENT '配置动作',
  `addon` char(50) default '0' COMMENT '选择插件',
  `target_id` int(10) default NULL COMMENT '选择内容',
  `sucai_type` char(50) default '0' COMMENT '素材类型',
  `jump_type` char(10) default '0' COMMENT '推送类型',
  `menu_id` int(10) default NULL COMMENT '对应菜单ID，禁止修改',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_custom_menu
-- ----------------------------
INSERT INTO `dc_custom_menu` VALUES ('1', '0', '0', '梦.生活', '', 'http://m.baidu.com', 'gh_6019aad69b3f', 'view', '9', '0', '0', '0', '0', '1');
INSERT INTO `dc_custom_menu` VALUES ('2', '0', '0', '油中感谢', 'custom_sucai_appmsg_16', '', 'gh_6019aad69b3f', 'click', '1', '0', '16', '1', '0', '2');
INSERT INTO `dc_custom_menu` VALUES ('3', '0', '0', '加油卡', '', 'http://m.baidu.com', 'gh_6019aad69b3f', 'view', '9', '0', '21', '3', '0', '2');

-- ----------------------------
-- Table structure for `dc_custom_menu_type`
-- ----------------------------
DROP TABLE IF EXISTS `dc_custom_menu_type`;
CREATE TABLE `dc_custom_menu_type` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(255) default NULL COMMENT '菜单标题',
  `type` char(50) default '0' COMMENT '菜单类型',
  `group_id` varchar(255) default NULL COMMENT '用户分组id',
  `sex` char(50) default NULL COMMENT '性别',
  `country` varchar(255) default NULL COMMENT '国家信息',
  `province` varchar(255) default NULL COMMENT '省份信息',
  `city` varchar(255) default NULL COMMENT '城市信息',
  `client_platform_type` char(50) default NULL COMMENT '手机操作系统类型',
  `menuid` varchar(255) default NULL COMMENT '微信端菜单ID',
  `token` varchar(255) default NULL COMMENT 'Token',
  `cTime` int(10) default NULL COMMENT '菜单发布时间',
  `show` char(50) default '0' COMMENT '是否发布',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_custom_menu_type
-- ----------------------------
INSERT INTO `dc_custom_menu_type` VALUES ('1', '2016-02-19', '0', null, null, null, null, null, null, null, 'gh_6019aad69b3f', '0', '0');
INSERT INTO `dc_custom_menu_type` VALUES ('2', '2016-02-20', '0', null, null, null, null, null, null, null, 'gh_6019aad69b3f', '1455898012', '1');

-- ----------------------------
-- Table structure for `dc_custom_reply_mult`
-- ----------------------------
DROP TABLE IF EXISTS `dc_custom_reply_mult`;
CREATE TABLE `dc_custom_reply_mult` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `keyword` varchar(255) default NULL COMMENT '关键词',
  `keyword_type` tinyint(2) default '0' COMMENT '关键词类型',
  `mult_ids` varchar(255) default NULL COMMENT '多图文ID',
  `token` varchar(255) default NULL COMMENT 'Token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_custom_reply_mult
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_custom_reply_news`
-- ----------------------------
DROP TABLE IF EXISTS `dc_custom_reply_news`;
CREATE TABLE `dc_custom_reply_news` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) default NULL COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `cate_id` int(10) unsigned default '0' COMMENT '所属类别',
  `cover` int(10) unsigned default NULL COMMENT '封面图片',
  `content` text COMMENT '内容',
  `cTime` int(10) default NULL COMMENT '发布时间',
  `sort` int(10) unsigned default '0' COMMENT '排序号',
  `view_count` int(10) unsigned default '0' COMMENT '浏览数',
  `token` varchar(255) default NULL COMMENT 'Token',
  `jump_url` varchar(255) default NULL COMMENT '外链',
  `author` varchar(50) default NULL COMMENT '作者',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_custom_reply_news
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_custom_reply_text`
-- ----------------------------
DROP TABLE IF EXISTS `dc_custom_reply_text`;
CREATE TABLE `dc_custom_reply_text` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `keyword` varchar(255) default NULL COMMENT '关键词',
  `keyword_type` tinyint(2) default '0' COMMENT '关键词类型',
  `content` text COMMENT '回复内容',
  `view_count` int(10) unsigned default '0' COMMENT '浏览数',
  `sort` int(10) unsigned default '0' COMMENT '排序号',
  `token` varchar(255) default NULL COMMENT 'Token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_custom_reply_text
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_custom_sendall`
-- ----------------------------
DROP TABLE IF EXISTS `dc_custom_sendall`;
CREATE TABLE `dc_custom_sendall` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `ToUserName` varchar(255) default NULL COMMENT 'token',
  `FromUserName` varchar(255) default NULL COMMENT 'openid',
  `cTime` int(10) default NULL COMMENT '创建时间',
  `msgType` varchar(255) default NULL COMMENT '消息类型',
  `manager_id` int(10) default NULL COMMENT '管理员id',
  `content` text COMMENT '内容',
  `media_id` varchar(255) default NULL COMMENT '多媒体文件id',
  `is_send` int(10) default NULL COMMENT '是否已经发送',
  `uid` int(10) default NULL COMMENT '粉丝uid',
  `news_group_id` varchar(10) default NULL COMMENT '图文组id',
  `video_title` varchar(255) default NULL COMMENT '视频标题',
  `video_description` text COMMENT '视频描述',
  `video_thumb` varchar(255) default NULL COMMENT '视频缩略图',
  `voice_id` int(10) default NULL COMMENT '语音id',
  `image_id` int(10) default NULL COMMENT '图片id',
  `video_id` int(10) default NULL COMMENT '视频id',
  `send_type` int(10) default NULL COMMENT '发送方式',
  `send_opends` text COMMENT '指定用户',
  `group_id` int(10) default NULL COMMENT '分组id',
  `diff` int(10) default '0' COMMENT '区分消息标识',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_custom_sendall
-- ----------------------------
INSERT INTO `dc_custom_sendall` VALUES ('59', 'gh_6019aad69b3f', 'oHEGDw9PZ7ZgE3drhWpvOKJ9_4Ho', '1454678355', 'text', '2', '群发 文字消息', null, '0', '6', null, null, null, null, null, null, null, '0', null, '0', '1');
INSERT INTO `dc_custom_sendall` VALUES ('60', 'gh_6019aad69b3f', 'oHEGDw9PZ7ZgE3drhWpvOKJ9_4Ho', '1454678588', 'news', '2', '', null, '0', '6', '16', null, null, null, null, null, null, '0', null, '0', '2');
INSERT INTO `dc_custom_sendall` VALUES ('61', 'gh_6019aad69b3f', 'oHEGDw9PZ7ZgE3drhWpvOKJ9_4Ho', '1455788412', 'news', '2', '', null, '1', '6', '16', null, null, null, null, null, null, '0', null, '0', '3');

-- ----------------------------
-- Table structure for `dc_donations_list`
-- ----------------------------
DROP TABLE IF EXISTS `dc_donations_list`;
CREATE TABLE `dc_donations_list` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `content` text COMMENT '捐赠者留言',
  `money` float default NULL COMMENT '捐赠金额',
  `email` varchar(255) default NULL COMMENT '捐赠者邮箱',
  `nickname` varchar(255) default NULL COMMENT '捐赠者昵称',
  `ctime` int(10) default NULL COMMENT '捐赠时间',
  `openid` varchar(255) default NULL COMMENT '捐赠者openid',
  `token` varchar(255) default NULL COMMENT '公众号token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_donations_list
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_donations_money`
-- ----------------------------
DROP TABLE IF EXISTS `dc_donations_money`;
CREATE TABLE `dc_donations_money` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `desc` text COMMENT '描述',
  `money` int(10) default NULL COMMENT '金额',
  `token` varchar(255) default NULL COMMENT '公众号token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_donations_money
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_extensions`
-- ----------------------------
DROP TABLE IF EXISTS `dc_extensions`;
CREATE TABLE `dc_extensions` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `keyword_type` tinyint(2) default '0' COMMENT '关键词匹配类型',
  `api_token` varchar(255) NOT NULL COMMENT 'Token',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `api_url` varchar(255) NOT NULL COMMENT '第三方URL',
  `output_format` tinyint(1) default '0' COMMENT '数据输出格式',
  `keyword_filter` tinyint(2) NOT NULL default '0' COMMENT '关键词过滤',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_extensions
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_file`
-- ----------------------------
DROP TABLE IF EXISTS `dc_file`;
CREATE TABLE `dc_file` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '文件ID',
  `name` char(30) NOT NULL default '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL default '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL default '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL default '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL default '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  `md5` char(32) default '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL default '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL default '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of dc_file
-- ----------------------------
INSERT INTO `dc_file` VALUES ('1', '01.起床.mp3', '56b29a2a0d9c1.mp3', '2016-02-04/', 'mp3', 'application/octet-stream', '2378657', 'e57a81e297cf6b48b040926cc38a4cee', '21ad361302174c3e0dda3a5204a25249634f8675', '0', '1453962339');
INSERT INTO `dc_file` VALUES ('2', 'englishpod_B0001dg.mp3', '56b5672991196.mp3', '2016-02-06/', 'mp3', 'application/octet-stream', '624578', '2bdc8d18069b0737c64233ab64e151a0', 'a81ffbc8203e3472040803d00d3ea2f0a8ae5758', '0', '1453962381');
INSERT INTO `dc_file` VALUES ('3', 'englishpod_B0001pb.mp3', '56b56c2d37d71.mp3', '2016-02-06/', 'mp3', 'application/octet-stream', '3689682', '64517040ef345a50360f79d9f4df1e09', 'd69a1741c28a9372098aa747a24f6e259bb1f0ee', '0', '1453962392');
INSERT INTO `dc_file` VALUES ('4', '1、基本标签介绍.mp4', '56b4b931645f0.mp4', '2016-02-05/', 'mp4', 'application/octet-stream', '18709036', '4b33e8860019dd2cc7ac843f9dbbc0f7', 'a6d84ca9eb4268e2576ce73694f330f0fac29dae', '0', '1453976948');
INSERT INTO `dc_file` VALUES ('5', '03.居家住房.mp3', '56a9fc3b2fbf7.mp3', '2016-01-28/', 'mp3', 'application/octet-stream', '3108419', '3f8afc2c0deefbf323269718f919b2c6', 'cdb6ae436bcf22ac7565c35f5dd31d1fb8f94403', '0', '1453980730');
INSERT INTO `dc_file` VALUES ('6', '1、HTML5开发前的准备.mp4', '56a9fc4e67332.mp4', '2016-01-28/', 'mp4', 'application/octet-stream', '11400652', '88a9d00e798ed1d6c84778a1c47a8d95', '54ab8fdfcd220b05749be1d59c7fa3bd844d3c24', '0', '1453980750');
INSERT INTO `dc_file` VALUES ('7', '06.做饭.mp3', '56b1ccffcfc47.mp3', '2016-02-03/', 'mp3', 'application/octet-stream', '3375907', '2fbcee7b040de3139f9c069b9dd6a51a', 'fa9f43c0e153865a0620a3cb6c0bde5817f94453', '0', '1454492927');
INSERT INTO `dc_file` VALUES ('8', '2、页面跳转的实现.mp4', '56b29b11f142a.mp4', '2016-02-04/', 'mp4', 'application/octet-stream', '12690971', '91e500dc070f3a6f6dcc392349de7703', 'b94a7df2d59ba9a63decc46d4befb42c77ebb972', '0', '1454509832');
INSERT INTO `dc_file` VALUES ('9', '1、照片墙布局.mp4', '56b20fdc05d05.mp4', '2016-02-03/', 'mp4', 'application/octet-stream', '15456515', '360e9db1fcb62e978e76c688a5e8d1a5', '5ad9b842e1764e16444daa1afb83271c07c584d7', '0', '1454510043');
INSERT INTO `dc_file` VALUES ('10', 'englishpod_B0002dg.mp3', '56b574167881c.mp3', '2016-02-06/', 'mp3', 'application/octet-stream', '556179', '38dcd9b1f9bef39bf0cf59791673d70b', 'baa208f87ff9c53dc27998ef4b73561541dfde8e', '0', '1454510144');
INSERT INTO `dc_file` VALUES ('11', 'englishpod_B0002rv.mp3', '56b57f6ed0c87.mp3', '2016-02-06/', 'mp3', 'application/octet-stream', '4393421', '5e0c5ba8250f9dad7e86182ceae33b00', 'd1181d0a71433f01da7f3dc37477e20f7d8d78c0', '0', '1454510156');
INSERT INTO `dc_file` VALUES ('12', '1、CSS基础-介绍及语法.mp4', '56b210ad636cf.mp4', '2016-02-03/', 'mp4', 'application/octet-stream', '12512269', 'fb7bc82cf4a7cf1171eb94931c6258a0', 'f0ecc44a233df2e58e5e55009e71ede4d81d0890', '0', '1454510252');
INSERT INTO `dc_file` VALUES ('13', '04.离家前.mp3', '56b4b8ec14b04.mp3', '2016-02-05/', 'mp3', 'application/octet-stream', '2643646', '9a844145c1eba8286a727f998cd5fd35', 'dc955647bdb35175ac3114351416f2d426a26dd6', '0', '1454684395');
INSERT INTO `dc_file` VALUES ('14', 'englishpod_B0001rv.mp3', '56b56bd4301d4.mp3', '2016-02-06/', 'mp3', 'application/octet-stream', '2165406', '352ea0c7900c68c13d494149d9ba9e59', 'fcd42eb8101cee717dcb976fcaceea0632535d87', '0', '1454729052');

-- ----------------------------
-- Table structure for `dc_forms`
-- ----------------------------
DROP TABLE IF EXISTS `dc_forms`;
CREATE TABLE `dc_forms` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `cTime` int(10) unsigned default NULL COMMENT '发布时间',
  `token` varchar(255) default NULL COMMENT 'Token',
  `password` varchar(255) default NULL COMMENT '表单密码',
  `keyword_type` tinyint(2) NOT NULL default '0' COMMENT '关键词类型',
  `jump_url` varchar(255) default NULL COMMENT '提交后跳转的地址',
  `content` text COMMENT '详细介绍',
  `finish_tip` text COMMENT '用户提交后提示内容',
  `can_edit` tinyint(2) default '0' COMMENT '是否允许编辑',
  `intro` text COMMENT '封面简介',
  `mTime` int(10) default NULL COMMENT '修改时间',
  `cover` int(10) unsigned default NULL COMMENT '封面图片',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `template` varchar(255) default 'default' COMMENT '模板',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_forms
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_forms_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `dc_forms_attribute`;
CREATE TABLE `dc_forms_attribute` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `is_show` tinyint(2) default '1' COMMENT '是否显示',
  `forms_id` int(10) unsigned default NULL COMMENT '表单ID',
  `error_info` varchar(255) default NULL COMMENT '出错提示',
  `sort` int(10) unsigned default '0' COMMENT '排序号',
  `validate_rule` varchar(255) default NULL COMMENT '正则验证',
  `is_must` tinyint(2) default NULL COMMENT '是否必填',
  `remark` varchar(255) default NULL COMMENT '字段备注',
  `name` varchar(100) default NULL COMMENT '字段名',
  `token` varchar(255) default NULL COMMENT 'Token',
  `value` varchar(255) default NULL COMMENT '默认值',
  `title` varchar(255) NOT NULL COMMENT '字段标题',
  `mTime` int(10) default NULL COMMENT '修改时间',
  `extra` text COMMENT '参数',
  `type` char(50) NOT NULL default 'string' COMMENT '字段类型',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_forms_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_forms_value`
-- ----------------------------
DROP TABLE IF EXISTS `dc_forms_value`;
CREATE TABLE `dc_forms_value` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `forms_id` int(10) unsigned default NULL COMMENT '表单ID',
  `value` text COMMENT '表单值',
  `cTime` int(10) default NULL COMMENT '增加时间',
  `openid` varchar(255) default NULL COMMENT 'OpenId',
  `uid` int(10) default NULL COMMENT '用户ID',
  `token` varchar(255) default NULL COMMENT 'Token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_forms_value
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_forum`
-- ----------------------------
DROP TABLE IF EXISTS `dc_forum`;
CREATE TABLE `dc_forum` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `uid` int(10) default '0' COMMENT '用户ID',
  `content` text COMMENT '内容',
  `cTime` int(10) default NULL COMMENT '发布时间',
  `attach` varchar(255) default NULL COMMENT '附件',
  `is_top` int(10) default '0' COMMENT '置顶',
  `cid` tinyint(4) default NULL COMMENT '分类',
  `view_count` int(11) unsigned default '0' COMMENT '浏览数',
  `reply_count` int(11) unsigned default '0' COMMENT '回复数',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_forum
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `dc_hooks`;
CREATE TABLE `dc_hooks` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` varchar(40) NOT NULL default '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL default '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  `addons` text NOT NULL COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `搜索索引` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件钩子表';

-- ----------------------------
-- Records of dc_hooks
-- ----------------------------
INSERT INTO `dc_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `dc_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `dc_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', '');
INSERT INTO `dc_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'SocialComment');
INSERT INTO `dc_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `dc_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', '');
INSERT INTO `dc_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `dc_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `dc_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `dc_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `dc_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');
INSERT INTO `dc_hooks` VALUES ('17', 'weixin', '微信插件必须加载的钩子', '1', '1388810858', 'Hitegg,Diy,RedBag,WeMedia,ShopCoupon,Card,SingIn,Seckill,WeiSite,AutoReply,YouaskService,Tmplmsg,SceneQrcode,UserCenter,Shop,Example,Donations,Extensions,Forms,Dg,Suggestions,Leaflets,AddressManage,Payment,Tuling,CustomMenu,Panorama,Weather,Xydzp,Scratch,Idioms,CustomReply');
INSERT INTO `dc_hooks` VALUES ('18', 'cascade', '级联菜单', '1', '1398694587', 'Cascade');
INSERT INTO `dc_hooks` VALUES ('19', 'page_diy', '万能页面的钩子', '1', '1399040364', 'Diy');
INSERT INTO `dc_hooks` VALUES ('20', 'dynamic_select', '动态下拉菜单', '1', '1435223189', 'DynamicSelect');
INSERT INTO `dc_hooks` VALUES ('21', 'news', '图文素材选择', '1', '1439196828', 'News');

-- ----------------------------
-- Table structure for `dc_import`
-- ----------------------------
DROP TABLE IF EXISTS `dc_import`;
CREATE TABLE `dc_import` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `attach` int(10) unsigned NOT NULL COMMENT '上传文件',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_import
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_invite_code`
-- ----------------------------
DROP TABLE IF EXISTS `dc_invite_code`;
CREATE TABLE `dc_invite_code` (
  `id` int(11) NOT NULL auto_increment,
  `openid` varchar(100) default NULL,
  `code` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_invite_code
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_join_count`
-- ----------------------------
DROP TABLE IF EXISTS `dc_join_count`;
CREATE TABLE `dc_join_count` (
  `follow_id` int(10) default NULL,
  `id` int(10) NOT NULL auto_increment,
  `aim_id` int(10) default NULL,
  `count` int(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fid_aim` (`follow_id`,`aim_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_join_count
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `dc_keyword`;
CREATE TABLE `dc_keyword` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `token` varchar(100) default NULL COMMENT 'Token',
  `addon` varchar(255) NOT NULL COMMENT '关键词所属插件',
  `aim_id` int(10) unsigned NOT NULL COMMENT '插件表里的ID值',
  `cTime` int(10) default NULL COMMENT '创建时间',
  `keyword_length` int(10) unsigned default '0' COMMENT '关键词长度',
  `keyword_type` tinyint(2) default '0' COMMENT '匹配类型',
  `extra_text` text COMMENT '文本扩展',
  `extra_int` int(10) default NULL COMMENT '数字扩展',
  `request_count` int(10) default '0' COMMENT '请求数',
  PRIMARY KEY  (`id`),
  KEY `keyword_token` (`keyword`,`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_keyword
-- ----------------------------
INSERT INTO `dc_keyword` VALUES ('12', '', 'gh_6019aad69b3f', 'AutoReply', '10', '1455863609', '0', '0', '', '0', '0');
INSERT INTO `dc_keyword` VALUES ('13', '', 'gh_6019aad69b3f', 'AutoReply', '11', '1455864040', '0', '0', '', '0', '0');

-- ----------------------------
-- Table structure for `dc_manager`
-- ----------------------------
DROP TABLE IF EXISTS `dc_manager`;
CREATE TABLE `dc_manager` (
  `uid` int(10) NOT NULL default '0' COMMENT '用户ID',
  `has_public` tinyint(2) default '0' COMMENT '是否配置公众号',
  `headface_url` int(10) unsigned default NULL COMMENT '管理员头像',
  `GammaAppId` varchar(30) default NULL COMMENT '摇电视的AppId',
  `GammaSecret` varchar(100) default NULL COMMENT '摇电视的Secret',
  `copy_right` varchar(255) default NULL COMMENT '授权信息',
  `tongji_code` text COMMENT '统计代码',
  `website_logo` int(10) unsigned default NULL COMMENT '网站LOGO',
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_manager
-- ----------------------------
INSERT INTO `dc_manager` VALUES ('1', '0', '1', null, null, '', '', '2');
INSERT INTO `dc_manager` VALUES ('2', '1', '2', null, null, 'xxxx', '', '5');
INSERT INTO `dc_manager` VALUES ('5', '0', '6', null, null, '', '', '7');

-- ----------------------------
-- Table structure for `dc_manager_menu`
-- ----------------------------
DROP TABLE IF EXISTS `dc_manager_menu`;
CREATE TABLE `dc_manager_menu` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `menu_type` tinyint(2) default '0' COMMENT '菜单类型',
  `pid` varchar(50) default '0' COMMENT '上级菜单',
  `title` varchar(50) default NULL COMMENT '菜单名',
  `url_type` tinyint(2) default '0' COMMENT '链接类型',
  `addon_name` varchar(30) default NULL COMMENT '插件名',
  `url` varchar(255) default NULL COMMENT '外链',
  `target` char(50) default '_self' COMMENT '打开方式',
  `is_hide` tinyint(2) default '0' COMMENT '是否隐藏',
  `sort` int(10) default '0' COMMENT '排序号',
  `uid` int(10) default NULL COMMENT '管理员ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_manager_menu
-- ----------------------------
INSERT INTO `dc_manager_menu` VALUES ('1', '0', '', '系统管理', '1', '', 'Home/Index/main', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('2', '1', '1', '公众号管理', '1', '', 'Home/Public/lists', '_self', '0', '2', '1');
INSERT INTO `dc_manager_menu` VALUES ('3', '1', '1', '消息管理', '1', '', 'Home/WeixinMessage/lists', '_self', '0', '3', '1');
INSERT INTO `dc_manager_menu` VALUES ('4', '1', '1', '素材管理', '1', '', 'Home/Material/material_lists', '_self', '0', '4', '1');
INSERT INTO `dc_manager_menu` VALUES ('5', '1', '1', '群发管理', '1', '', 'Home/Message/add', '_self', '0', '5', '1');
INSERT INTO `dc_manager_menu` VALUES ('6', '0', '', '基本功能', '0', 'AutoReply', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('7', '1', '6', '自动回复', '0', 'AutoReply', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('8', '1', '6', '自定义菜单', '0', 'CustomMenu', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('9', '0', '', '高级功能', '0', 'YouaskService', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('10', '1', '9', '多客服', '0', 'YouaskService', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('11', '1', '9', '模板消息', '0', 'Tmplmsg', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('12', '1', '9', '场景二维码', '0', 'SceneQrcode', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('13', '1', '9', '地址管理', '0', 'AddressManage', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('14', '1', '9', '支付通', '0', 'Payment', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('15', '0', '', '微站功能', '0', 'WeiSite', '', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('16', '1', '15', '微站设置', '1', '', 'addon/WeiSite/WeiSite/config', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('17', '1', '15', '首页幻灯片', '1', '', 'addon/WeiSite/Slideshow/lists', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('18', '1', '15', '分类管理', '1', '', 'addon/WeiSite/Category/lists', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('19', '1', '15', '文章管理', '1', '', 'addon/WeiSite/Category/lists', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('20', '1', '15', '底部导航', '1', '', 'addon/WeiSite/Footer/lists', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('21', '1', '15', '模板管理', '1', '', 'addon/WeiSite/Template/index', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('22', '0', '', '粉丝营销', '1', '', 'Home/UserCenter/lists', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('23', '1', '22', '用户列表', '1', '', 'Home/UserCenter/lists', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('24', '1', '22', '用户分组', '1', '', 'Home/AuthGroup/lists', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('25', '1', '22', '积分记录', '1', '', 'Home/CreditData/lists', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('26', '1', '22', '积分配置', '1', '', 'Home/CreditConfig/lists', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('27', '1', '22', '基础配置', '1', '', 'addon/UserCenter/UserCenter/config', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('28', '0', '', '扩展功能', '1', '', 'Home/Index/addons_list', '_self', '0', '0', '1');
INSERT INTO `dc_manager_menu` VALUES ('29', '1', '1', '首页', '1', '', 'Home/Index/main', '_self', '0', '1', '1');

-- ----------------------------
-- Table structure for `dc_material_file`
-- ----------------------------
DROP TABLE IF EXISTS `dc_material_file`;
CREATE TABLE `dc_material_file` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `file_id` int(10) default NULL COMMENT '上传文件',
  `cover_url` varchar(255) default NULL COMMENT '本地URL',
  `media_id` varchar(100) default '0' COMMENT '微信端图文消息素材的media_id',
  `wechat_url` varchar(255) default NULL COMMENT '微信端的文件地址',
  `cTime` int(10) default NULL COMMENT '创建时间',
  `manager_id` int(10) default NULL COMMENT '管理员ID',
  `token` varchar(100) default NULL COMMENT 'Token',
  `title` varchar(100) default NULL COMMENT '素材名称',
  `type` int(10) default NULL COMMENT '类型',
  `introduction` text COMMENT '描述',
  `is_use` int(10) default '1' COMMENT '可否使用',
  `aim_id` int(10) default NULL COMMENT '添加来源标识id',
  `aim_table` varchar(255) default NULL COMMENT '来源表名',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_material_file
-- ----------------------------
INSERT INTO `dc_material_file` VALUES ('5', '7', null, '0', null, '1454492930', '2', 'gh_72c21308d5d5', '06.做饭', '1', null, '1', null, null);
INSERT INTO `dc_material_file` VALUES ('2', '4', null, '0', null, '1453976955', '2', 'gh_72c21308d5d5', '基本标签介绍', '2', '基本标签介绍', '1', null, '');
INSERT INTO `dc_material_file` VALUES ('4', '6', null, '0', null, '1453980755', '2', 'gh_72c21308d5d5', 'HTML5开发前的准备', '2', 'HTML5开发前的准备', '1', null, 'HTML5开发前的准备');
INSERT INTO `dc_material_file` VALUES ('17', '4', null, '0', null, '1454684471', '2', 'gh_6019aad69b3f', '基本标签介绍', '2', '', '1', null, '');
INSERT INTO `dc_material_file` VALUES ('18', '10', null, 'jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4', null, '1454728955', '2', 'gh_6019aad69b3f', 'englishpod_B0002dg', '1', null, '1', null, null);

-- ----------------------------
-- Table structure for `dc_material_image`
-- ----------------------------
DROP TABLE IF EXISTS `dc_material_image`;
CREATE TABLE `dc_material_image` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `cover_id` int(10) default NULL COMMENT '图片在本地的ID',
  `cover_url` varchar(255) default NULL COMMENT '本地URL',
  `media_id` varchar(100) default '0' COMMENT '微信端图文消息素材的media_id',
  `wechat_url` varchar(255) default NULL COMMENT '微信端的图片地址',
  `cTime` int(10) default NULL COMMENT '创建时间',
  `manager_id` int(10) default NULL COMMENT '管理员ID',
  `token` varchar(100) default NULL COMMENT 'Token',
  `is_use` int(10) default '1' COMMENT '可否使用',
  `aim_id` int(10) default NULL COMMENT '添加来源标识id',
  `aim_table` varchar(255) default NULL COMMENT '来源表名',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_material_image
-- ----------------------------
INSERT INTO `dc_material_image` VALUES ('11', '16', '/douchat/Uploads/Picture/2016-02-03/56b1c19bee364.png', '0', null, '1454490012', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('12', '5', '/douchat/Uploads/Picture/2016-02-02/56b06c40ec915.png', '0', null, '1454490019', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('13', '3', '/douchat/Uploads/Picture/2016-01-28/56a9fc189cc08.png', '0', null, '1454490023', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('22', '25', 'http://localhost/douchat/Uploads/Picture/2016-02-04/56b356ac006ba.jpg', 'bLYigFLmPBUHKTDgpXxtP-9ACO9XusurJ43UXZEIins', 'https://mmbiz.qlogo.cn/mmbiz/iaEaCWlxaVqd3mW5HohGGtOfulr6ia0JpKcbCUbX7jFtXWFJU4q0AdojGO6ia07iaMW90b1OTeNH2BvQN1eXa2VyxQ/0?wx_fmt=jpeg', '1454593707', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('23', '13', 'http://localhost/douchat/Uploads/Picture/2016-02-03/56b1490ee04b3.png', 'E8FNHXYWI9PKEHVALMDi2vXJfuxEYS4UHAPhoBzbK4M', 'https://mmbiz.qlogo.cn/mmbiz/iaEaCWlxaVqfuqbezfmr6vw89m2fgbUiaLwg5yEOIosFZtFSKOZSEmfeBj98RA2GERnEibn3DeyMJl7b40kqEyfcg/0?wx_fmt=png', '1454593707', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('19', '23', 'http://127.0.0.1/douchat/Uploads/Picture/2016-02-04/56b2996694575.png', '3vacVuXIvFFf6lIH1sHzJDuL7mgV8jfZzNbJhQ-D8dI', 'https://mmbiz.qlogo.cn/mmbiz/5QHu1tKEYHtMaN2HhcoWHIr5cRuibqia9Ww8hUmrOZ6oFPJpFqhVco8tS26zVuqWB67CfePXtEdibTC1A4yGIMSfA/0?wx_fmt=png', '1454545253', '2', 'gh_6019aad69b3f', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('20', '21', 'http://127.0.0.1/douchat/Uploads/Picture/2016-02-03/56b2091946509.png', 'BYg3P2ut0zFUuJ_HanLc9LSRsUOlP0UNFveUp1_ykqc', 'https://mmbiz.qlogo.cn/mmbiz/5QHu1tKEYHtMaN2HhcoWHIr5cRuibqia9WZIfGicI4FGHPvYdFGkib4cqNrdXORA71RgfTM3WlesB8BSQIGakfNtBw/0?wx_fmt=png', '1454545253', '2', 'gh_6019aad69b3f', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('21', '22', 'http://127.0.0.1/douchat/Uploads/Picture/2016-02-04/56b299665b9b6.png', 'BYg3P2ut0zFUuJ_HanLc9DkFWEGzbeHjT6z1GQNTxCk', 'https://mmbiz.qlogo.cn/mmbiz/5QHu1tKEYHtMaN2HhcoWHIr5cRuibqia9Wu3IKExvcw8yLM3xENWLku0jBZqXIRicybibqwicYicGThEwWiaUalmoorbQ/0?wx_fmt=png', '1454545253', '2', 'gh_6019aad69b3f', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('24', '14', 'http://localhost/douchat/Uploads/Picture/2016-02-03/56b1490f2659d.jpg', 'E8FNHXYWI9PKEHVALMDi2m85HlxmFTJMYgZAYPwKF5M', 'https://mmbiz.qlogo.cn/mmbiz/iaEaCWlxaVqfuqbezfmr6vw89m2fgbUiaL5MYPNiaBxzXsBKibvlP6BPXXLvaSn8QzyhMfo5ghfrShLPZAic3CCEgwQ/0?wx_fmt=jpeg', '1454593707', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('25', '10', 'http://localhost/douchat/Uploads/Picture/2016-02-02/56b0c490a8a08.png', 'E8FNHXYWI9PKEHVALMDi2iIQlytEt89OwhmxNOEjyEc', 'https://mmbiz.qlogo.cn/mmbiz/iaEaCWlxaVqfJRpTAJkDls8Eo0yc5Q8BD7bCWY3r2Yxz5gSVUKWGSXdC1jkCF0LuFxDh1AXJh2TJrm9Mb0dCAUg/0?wx_fmt=png', '1454593707', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('26', '10', 'http://localhost/douchat/Uploads/Picture/2016-02-02/56b0c490a8a08.png', 'E8FNHXYWI9PKEHVALMDi2jzqXrFws-uCAp6TWm5yliI', 'https://mmbiz.qlogo.cn/mmbiz/iaEaCWlxaVqfJRpTAJkDls8Eo0yc5Q8BD7bCWY3r2Yxz5gSVUKWGSXdC1jkCF0LuFxDh1AXJh2TJrm9Mb0dCAUg/0?wx_fmt=png', '1454593707', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('27', '10', 'http://localhost/douchat/Uploads/Picture/2016-02-02/56b0c490a8a08.png', 'E8FNHXYWI9PKEHVALMDi2pfFsay5v5P3PiuG9y9tLhs', 'https://mmbiz.qlogo.cn/mmbiz/iaEaCWlxaVqfJRpTAJkDls8Eo0yc5Q8BD7bCWY3r2Yxz5gSVUKWGSXdC1jkCF0LuFxDh1AXJh2TJrm9Mb0dCAUg/0?wx_fmt=png', '1454593707', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('28', '11', 'http://localhost/douchat/Uploads/Picture/2016-02-02/56b0c490db66d.png', 'C1GZ1dOet5dVdxe3pmv4CjwBuceCbELGVSPPp3OAdBU', 'https://mmbiz.qlogo.cn/mmbiz/iaEaCWlxaVqd6u5ia5Ckks3UbL9NkFQPiaicseuTl6wcB5jTicZqamN4CVbdw7SUZmCdznnyEd7WwXibYeM7gh9w8Rrg/0?wx_fmt=png', '1454593707', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('29', '12', 'http://localhost/douchat/Uploads/Picture/2016-02-02/56b0c4910a61d.png', 'C1GZ1dOet5dVdxe3pmv4CtOiUA3H5CKHHYBKe5dwd68', 'https://mmbiz.qlogo.cn/mmbiz/iaEaCWlxaVqd6u5ia5Ckks3UbL9NkFQPiaicrA8IpTLT59MiaG3qhjExzGgsYD1ic5nB4hMZ2bqA2bgEOhVq6YNeBd3A/0?wx_fmt=png', '1454593707', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('30', '14', 'http://localhost/douchat/Uploads/Picture/2016-02-03/56b1490f2659d.jpg', 'Us8B-9WMvMJ3BV6StNqcpF_YQeIMUdG0wGOr6EBzAVo', 'https://mmbiz.qlogo.cn/mmbiz/iaEaCWlxaVqcTQFwbfa2icHhGbGhAsL09J571a3Cnmjdd5KctKNvBP1jEpNvj4HibRIlSGKHZleUqA9iaHCzT6PmQg/0?wx_fmt=jpeg', '1454593707', '2', 'gh_72c21308d5d5', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('32', '26', '/douchat/Uploads/Picture/2016-02-04/56b3590f24566.jpg', '0', null, '1454594319', '2', 'gh_6019aad69b3f', '1', null, null);
INSERT INTO `dc_material_image` VALUES ('33', '27', '/douchat/Uploads/Picture/2016-02-05/56b43c23cacac.jpg', '0', null, '1454652451', '2', 'gh_6019aad69b3f', '1', null, null);

-- ----------------------------
-- Table structure for `dc_material_news`
-- ----------------------------
DROP TABLE IF EXISTS `dc_material_news`;
CREATE TABLE `dc_material_news` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(100) default NULL COMMENT '标题',
  `author` varchar(30) default NULL COMMENT '作者',
  `cover_id` int(10) unsigned default NULL COMMENT '封面',
  `intro` varchar(255) default NULL COMMENT '摘要',
  `content` longtext COMMENT '内容',
  `link` varchar(255) default NULL COMMENT '外链',
  `group_id` int(10) default '0' COMMENT '多图文组的ID',
  `thumb_media_id` varchar(100) default NULL COMMENT '图文消息的封面图片素材id（必须是永久mediaID）',
  `media_id` varchar(100) default '0' COMMENT '微信端图文消息素材的media_id',
  `manager_id` int(10) default NULL COMMENT '管理员ID',
  `token` varchar(100) default NULL COMMENT 'Token',
  `cTime` int(10) default NULL COMMENT '发布时间',
  `url` varchar(255) default NULL COMMENT '图文页url',
  `is_use` int(10) default '1' COMMENT '可否使用',
  `aim_id` int(10) default NULL COMMENT '添加来源标识id',
  `aim_table` varchar(255) default NULL COMMENT '来源表名',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_material_news
-- ----------------------------
INSERT INTO `dc_material_news` VALUES ('14', 'Android', '', '8', '', '<p>Android</p>', null, '14', 'C1GZ1dOet5dVdxe3pmv4CjwBuceCbELGVSPPp3OAdBU', 'C1GZ1dOet5dVdxe3pmv4CmLeHJF9x-M4pao2mp-Win0', '2', 'gh_72c21308d5d5', '1454593735', 'http://mp.weixin.qq.com/s?__biz=MzAxOTU5MjUzMg==&mid=402242567&idx=1&sn=32a7f1ec166384a9a7f9b3883d0b6380#rd', '1', null, null);
INSERT INTO `dc_material_news` VALUES ('12', '.net', '', '24', '.net', '<p>.net</p>', null, '12', '3vacVuXIvFFf6lIH1sHzJBAc1udcSq7lj2YzhUyG1hY', '3vacVuXIvFFf6lIH1sHzJHNeedhJ7qb_E15mIVG29Sg', '2', 'gh_6019aad69b3f', '1454545266', 'http://mp.weixin.qq.com/s?__biz=MzI4MDE1OTAwNA==&mid=401710243&idx=1&sn=3527dcec1947aaacf3a711555fb8f451#rd', '1', null, null);
INSERT INTO `dc_material_news` VALUES ('9', 'xxx', '', '17', '', 'xxx<p></p>', '', '9', null, 'bLYigFLmPBUHKTDgpXxtPzTWcorkuZELEkYHRTnOydA', '2', 'gh_72c21308d5d5', '1454493963', null, '1', null, null);
INSERT INTO `dc_material_news` VALUES ('13', 'xxx', '', '15', '', 'xxx<p></p>', null, '13', 'E8FNHXYWI9PKEHVALMDi2pfFsay5v5P3PiuG9y9tLhs', 'E8FNHXYWI9PKEHVALMDi2mjTnAcgeN4xDHtGG5KGBhI', '2', 'gh_72c21308d5d5', '1454593735', 'http://mp.weixin.qq.com/s?__biz=MzAxOTU5MjUzMg==&mid=402398308&idx=1&sn=e357967adff2a22b300bc45fa816c59b#rd', '1', null, null);
INSERT INTO `dc_material_news` VALUES ('11', 'Java', '', '18', 'Java', '<p>Java</p>', '', '11', '3vacVuXIvFFf6lIH1sHzJDuL7mgV8jfZzNbJhQ-D8dI', '3vacVuXIvFFf6lIH1sHzJLGdSeRFnnwbQuQCuGSHcVU', '2', 'gh_6019aad69b3f', '1454508715', 'http://mp.weixin.qq.com/s?__biz=MzI4MDE1OTAwNA==&mid=401710236&idx=1&sn=1368a4de923578446c9be33b9c302fa3#rd', '1', null, null);
INSERT INTO `dc_material_news` VALUES ('15', '关注成功', '', '9', '欢迎加入Java阵营！', 'Java是一门流行的软件开发语言<p></p>', null, '15', 'C1GZ1dOet5dVdxe3pmv4CtOiUA3H5CKHHYBKe5dwd68', 'C1GZ1dOet5dVdxe3pmv4CmHivxMCl2ly1Yojwd047aQ', '2', 'gh_72c21308d5d5', '1454593735', 'http://mp.weixin.qq.com/s?__biz=MzAxOTU5MjUzMg==&mid=402242517&idx=1&sn=3063ea2019fffdcb76f7ec6819b56c64#rd', '1', null, null);
INSERT INTO `dc_material_news` VALUES ('16', 'Android', '', '20', 'Android', '<p>Android</p>', '', '16', null, 'ihVuy0CUTXFa-URU5-HFS9k3tCPS2IFBxCvWAt5mxac', '2', 'gh_6019aad69b3f', '1454594343', null, '1', null, null);
INSERT INTO `dc_material_news` VALUES ('17', 'new', '', '27', 'new', '<p>new</p>', '', '17', null, 'Q4IgKnoHuSt16ssxFSe5koVBYka176Agxhy_4NPRG_I', '2', 'gh_6019aad69b3f', '1454652629', null, '1', null, null);
INSERT INTO `dc_material_news` VALUES ('18', 'ssss', '', '26', 'ssss', 'ssss<p></p>', '', '18', null, '0', '2', 'gh_6019aad69b3f', '1454683892', null, '1', null, null);

-- ----------------------------
-- Table structure for `dc_material_text`
-- ----------------------------
DROP TABLE IF EXISTS `dc_material_text`;
CREATE TABLE `dc_material_text` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `content` text COMMENT '文本内容',
  `token` varchar(50) default NULL COMMENT 'Token',
  `uid` int(10) default NULL COMMENT 'uid',
  `is_use` int(10) default '1' COMMENT '可否使用',
  `aim_id` int(10) default NULL COMMENT '添加来源标识id',
  `aim_table` varchar(255) default NULL COMMENT '来源表名',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_material_text
-- ----------------------------
INSERT INTO `dc_material_text` VALUES ('2', 'Java', 'gh_6019aad69b3f', '2', '1', null, null);

-- ----------------------------
-- Table structure for `dc_menu`
-- ----------------------------
DROP TABLE IF EXISTS `dc_menu`;
CREATE TABLE `dc_menu` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '文档ID',
  `title` varchar(50) NOT NULL default '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL default '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL default '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL default '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL default '' COMMENT '提示',
  `group` varchar(50) default '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台导航数据表';

-- ----------------------------
-- Records of dc_menu
-- ----------------------------
INSERT INTO `dc_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('16', '用户', '0', '2', 'User/index', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `dc_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `dc_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `dc_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `dc_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `dc_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `dc_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `dc_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `dc_menu` VALUES ('27', '用户组管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `dc_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `dc_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `dc_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `dc_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `dc_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `dc_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `dc_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `dc_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `dc_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `dc_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `dc_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `dc_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `dc_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `dc_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `dc_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `dc_menu` VALUES ('43', '插件管理', '0', '7', 'Addons/index', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('44', '插件管理', '43', '1', 'Admin/Plugin/index', '0', '', '扩展', '0');
INSERT INTO `dc_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `dc_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `dc_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `dc_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `dc_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `dc_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `dc_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `dc_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `dc_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `dc_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `dc_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `dc_menu` VALUES ('57', '钩子管理', '43', '3', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `dc_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('68', '系统', '0', '1', 'Config/group', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `dc_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `dc_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `dc_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `dc_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('146', '权限节点', '16', '0', 'Admin/Rule/index', '0', '', '用户管理', '1');
INSERT INTO `dc_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `dc_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `dc_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `dc_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `dc_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `dc_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `dc_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `dc_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `dc_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `dc_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `dc_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `dc_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `dc_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `dc_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('124', '微信插件', '43', '0', 'Admin/Addons/index', '0', '', '扩展', '0');
INSERT INTO `dc_menu` VALUES ('126', '公众号等级', '16', '0', 'admin/PublicGroup/PublicGroup', '0', '', '公众号管理', '0');
INSERT INTO `dc_menu` VALUES ('127', '公众号管理', '16', '1', 'admin/PublicGroup/PublicAdmin', '0', '', '公众号管理', '0');
INSERT INTO `dc_menu` VALUES ('128', '在线升级', '68', '5', 'Admin/Update/index', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('129', '清除缓存', '68', '10', 'Admin/Update/delcache', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('130', '应用商店', '0', '8', 'admin/store/index', '0', '', '', '1');
INSERT INTO `dc_menu` VALUES ('131', '素材图标', '130', '2', 'admin/store/index?type=material', '0', '', '应用类型', '0');
INSERT INTO `dc_menu` VALUES ('132', '微站模板', '130', '1', 'admin/store/index?type=template', '0', '', '应用类型', '0');
INSERT INTO `dc_menu` VALUES ('133', '我是开发者', '130', '1', '/index.php?s=/home/developer/myApps', '0', '', '开发者', '0');
INSERT INTO `dc_menu` VALUES ('134', '新手安装指南', '130', '0', 'admin/store/index?type=help', '0', '', '我是站长', '0');
INSERT INTO `dc_menu` VALUES ('135', '万能页面', '130', '3', 'admin/store/index?type=diy', '0', '', '应用类型', '0');
INSERT INTO `dc_menu` VALUES ('136', '上传新应用', '130', '2', '/index.php?s=/home/developer/submitApp', '0', '', '开发者', '0');
INSERT INTO `dc_menu` VALUES ('137', '二次开发教程', '130', '3', '/wiki', '0', '', '开发者', '0');
INSERT INTO `dc_menu` VALUES ('138', '网站信息', '130', '0', 'admin/store/index?type=home', '0', '', '我是站长', '0');
INSERT INTO `dc_menu` VALUES ('139', '充值记录', '130', '0', 'admin/store/index?type=recharge', '0', '', '我是站长', '0');
INSERT INTO `dc_menu` VALUES ('140', '消费记录', '130', '0', 'admin/store/index?type=bug', '0', '', '我是站长', '0');
INSERT INTO `dc_menu` VALUES ('141', '官方交流论坛', '130', '4', '/bbs', '0', '', '开发者', '0');
INSERT INTO `dc_menu` VALUES ('142', '在线充值', '130', '0', 'admin/store/index?type=online_recharge', '0', '', '我是站长', '0');
INSERT INTO `dc_menu` VALUES ('143', '微信插件', '130', '0', 'admin/store/index?type=addon', '0', '', '应用类型', '0');
INSERT INTO `dc_menu` VALUES ('144', '公告管理', '68', '4', 'Notice/lists', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('147', '图文样式编辑', '68', '4', 'ArticleStyle/lists', '0', '', '系统设置', '0');
INSERT INTO `dc_menu` VALUES ('148', '增加', '147', '0', 'ArticleStyle/add', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('149', '分组管理', '147', '0', 'ArticleStyle/group', '0', '', '', '0');
INSERT INTO `dc_menu` VALUES ('150', '微信接口节点', '16', '0', 'Admin/Rule/wechat', '0', '', '用户管理', '0');
INSERT INTO `dc_menu` VALUES ('151', '公众号组管理', '16', '0', 'Admin/AuthManager/wechat', '0', '', '用户管理', '0');
INSERT INTO `dc_menu` VALUES ('152', '积分选项管理', '16', '6', 'Admin/Credit/lists', '0', '', '用户管理', '1');

-- ----------------------------
-- Table structure for `dc_message`
-- ----------------------------
DROP TABLE IF EXISTS `dc_message`;
CREATE TABLE `dc_message` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `bind_keyword` varchar(50) default NULL COMMENT '关联关键词',
  `preview_openids` text COMMENT '预览人OPENID',
  `group_id` int(10) default '0' COMMENT '群发对象',
  `type` tinyint(2) default '0' COMMENT '素材来源',
  `media_id` varchar(100) default NULL COMMENT '微信素材ID',
  `send_type` tinyint(1) default '0' COMMENT '发送方式',
  `send_openids` text COMMENT '要发送的OpenID',
  `msg_id` varchar(255) default NULL COMMENT 'msg_id',
  `content` text COMMENT '文本消息内容',
  `msgtype` varchar(255) default NULL COMMENT '消息类型',
  `token` varchar(255) default NULL COMMENT 'token',
  `appmsg_id` int(10) default NULL COMMENT '图文id',
  `voice_id` int(10) default NULL COMMENT '语音id',
  `video_id` int(10) default NULL COMMENT '视频id',
  `cTime` int(10) default NULL COMMENT '群发时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_message
-- ----------------------------
INSERT INTO `dc_message` VALUES ('11', null, '', '0', '0', null, '0', '', '401789487', '群发 文本消息', 'text', 'gh_6019aad69b3f', '0', '0', '0', '1454678395');

-- ----------------------------
-- Table structure for `dc_model`
-- ----------------------------
DROP TABLE IF EXISTS `dc_model`;
CREATE TABLE `dc_model` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '模型ID',
  `name` char(30) NOT NULL default '' COMMENT '模型标识',
  `title` char(30) NOT NULL default '' COMMENT '模型名称',
  `extend` int(10) unsigned default '0' COMMENT '继承的模型',
  `relation` varchar(30) default '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned default '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) default '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) default '' COMMENT '列表模板',
  `template_add` varchar(100) default '' COMMENT '新增模板',
  `template_edit` varchar(100) default '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned default '10' COMMENT '列表数据长度',
  `search_key` varchar(50) default '' COMMENT '默认搜索字段',
  `search_list` varchar(255) default '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned default '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned default '0' COMMENT '状态',
  `engine_type` varchar(25) default 'MyISAM' COMMENT '数据库引擎',
  `addon` varchar(50) default NULL COMMENT '所属插件',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统模型表';

-- ----------------------------
-- Records of dc_model
-- ----------------------------
INSERT INTO `dc_model` VALUES ('1', 'user', '用户信息表', '0', '', '0', '[\"come_from\",\"nickname\",\"password\",\"truename\",\"mobile\",\"email\",\"sex\",\"headimgurl\",\"city\",\"province\",\"country\",\"language\",\"score\",\"experience\",\"unionid\",\"login_count\",\"reg_ip\",\"reg_time\",\"last_login_ip\",\"last_login_time\",\"status\",\"is_init\",\"is_audit\"]', '1:基础', '', '', '', '', 'headimgurl|url_img_html:头像\r\nlogin_name:登录账号\r\nlogin_password:登录密码\r\nnickname|deal_emoji:用户昵称\r\nsex|get_name_by_status:性别\r\ngroup:分组\r\nscore:金币值\r\nexperience:经历值\r\nids:操作:set_login?uid=[uid]|设置登录账号,detail?uid=[uid]|详细资料,[EDIT]|编辑', '20', '', '', '1436929111', '1441187405', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('2', 'manager', '公众号管理员配置', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1436932532', '1436942362', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('3', 'manager_menu', '公众号管理员菜单', '0', '', '1', '[\"menu_type\",\"pid\",\"title\",\"url_type\",\"addon_name\",\"url\",\"target\",\"is_hide\",\"sort\"]', '1:基础', '', '', '', '', 'title:菜单名\r\nmenu_type|get_name_by_status:菜单类型\r\naddon_name:插件名\r\nurl:外链\r\ntarget|get_name_by_status:打开方式\r\nis_hide|get_name_by_status:隐藏\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', '', '', '1435215960', '1437623073', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('4', 'keyword', '关键词表', '0', '', '1', '[\"keyword\",\"keyword_type\",\"addon\",\"aim_id\",\"keyword_length\",\"cTime\",\"extra_text\",\"extra_int\"]', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:关键词\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'keyword', '', '1388815871', '1407251192', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('5', 'qr_code', '二维码表', '0', '', '1', '[\"qr_code\",\"addon\",\"aim_id\",\"cTime\",\"extra_text\",\"extra_int\",\"scene_id\",\"action_name\"]', '1:基础', '', '', '', '', 'scene_id:事件KEY值\r\nqr_code|get_code_img:二维码\r\naction_name|get_name_by_status:  二维码类型\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nrequest_count|intval:请求数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'qr_code', '', '1388815871', '1406130247', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('6', 'public', '公众号管理', '0', '', '1', '[\"public_name\",\"public_id\",\"wechat\",\"headface_url\",\"type\",\"appid\",\"secret\",\"encodingaeskey\",\"tips_url\",\"GammaAppId\",\"GammaSecret\",\"public_copy_right\"]', '1:基础', '', '', '', '', 'id:公众号ID\r\npublic_name:公众号名称\r\ntoken:Token\r\ncount:管理员数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,main&public_id=[id]|进入管理', '20', 'public_name', '', '1391575109', '1447231672', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('7', 'public_group', '公众号等级', '0', '', '1', '[\"title\",\"addon_status\"]', '1:基础', '', '', '', '', 'id:等级ID\r\ntitle:等级名\r\naddon_status:授权的插件\r\npublic_count:公众号数\r\nids:操作:editPublicGroup&id=[id]|编辑,delPublicGroup&id=[id]|删除', '20', 'title', '', '1393724788', '1393730663', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('8', 'public_link', '公众号与管理员的关联关系', '0', '', '1', '[\"uid\",\"addon_status\"]', '1:基础', '', '', '', '', 'uid|get_nickname|deal_emoji:18%管理员(不包括创始人)\r\naddon_status:授权的插件\r\nids:12%操作:[EDIT]|编辑,[DELETE]|删除', '20', '', '', '1398933192', '1447233745', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('9', 'import', '导入数据', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1407554076', '1407554076', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('10', 'addon_category', '插件分类', '0', '', '1', '[\"icon\",\"title\",\"sort\"]', '1:基础', '', '', '', '', 'icon|get_img_html:分类图标\r\ntitle:分类名\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1400047655', '1437451028', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('12', 'common_category', '通用分类', '0', '', '1', '[\"pid\",\"title\",\"icon\",\"intro\",\"sort\",\"is_show\"]', '1:基础', '', '', '', '', 'code:编号\r\ntitle:标题\r\nicon|get_img_html:图标\r\nsort:排序号\r\nis_show|get_name_by_status:显示\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1397529095', '1404182789', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('13', 'common_category_group', '通用分类分组', '0', '', '1', '[\"name\",\"title\"]', '1:基础', '', '', '', '', 'name:分组标识\r\ntitle:分组标题\r\nids:操作:cascade?target=_blank&module=[name]|数据管理,[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1396061373', '1403664378', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('14', 'credit_config', '积分配置', '0', '', '1', '[\"name\",\"title\",\"score\",\"experience\"]', '1:基础', '', '', '', '', 'title:积分描述\r\nname:积分标识\r\nexperience:经验值\r\nscore:金币值\r\nids:操作:[EDIT]|配置', '20', 'title', '', '1396061373', '1438591151', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('15', 'credit_data', '用户积分记录', '0', '', '1', '[\"uid\",\"experience\",\"score\",\"credit_name\"]', '1:基础', '', '', '', '', 'uid:用户\r\ncredit_title:积分来源\r\nexperience:经验值\r\nscore:金币值\r\ncTime|time_format:记录时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'uid', '', '1398564291', '1447250833', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('16', 'material_image', '图片素材', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1438684613', '1438684613', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('17', 'material_news', '图文素材', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1438670890', '1438670890', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('18', 'message', '群发消息', '0', '', '1', '[\"type\",\"bind_keyword\",\"media_id\",\"openid\",\"send_type\",\"group_id\",\"send_openids\"]', '1:基础', '', '', '', '', '', '20', '', '', '1437984111', '1438049406', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('19', 'visit_log', '网站访问日志', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1439448351', '1439448351', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('20', 'auth_group', '用户组', '0', '', '1', '[\"title\",\"description\"]', '1:基础', '', '', '', '', 'title:分组名称\r\ndescription:描述\r\nqr_code:二维码\r\nids:操作:export?id=[id]|导出用户,[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1437633503', '1447660681', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('21', 'analysis', '统计分析', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1432806941', '1432806941', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('22', 'article_style', '图文样式', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1436845488', '1436845488', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('23', 'article_style_group', '图文样式分组', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1436845186', '1436845186', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('24', 'sucai', '素材管理', '0', '', '1', '[\"name\",\"status\",\"cTime\",\"url\",\"type\",\"detail\",\"reason\",\"create_time\",\"checked_time\",\"source\",\"source_id\"]', '1:基础', '', '', '', '', 'name:素材名称\r\nstatus|get_name_by_status:状态\r\nurl:页面URL\r\ncreate_time|time_format:申请时间\r\nchecked_time|time_format:入库时间\r\nids:操作', '20', 'name', '', '1424611702', '1425386629', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('25', 'sucai_template', '素材模板库', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1431575544', '1431575544', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('26', 'system_notice', '系统公告表', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1431141043', '1431141043', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('27', 'update_version', '系统版本升级', '0', '', '1', '[\"version\",\"title\",\"description\",\"create_date\",\"package\"]', '1:基础', '', '', '', '', 'version:版本号\r\ntitle:升级包名\r\ndescription:描述\r\ncreate_date|time_format:创建时间\r\ndownload_count:下载统计数\r\nids:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '20', '', '', '1393770420', '1393771807', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('28', 'weixin_message', '微信消息管理', '0', '', '1', '', '1:基础', '', '', '', '', 'FromUserName:用户\r\ncontent:内容\r\nCreateTime:时间', '20', '', '', '1438142999', '1438151555', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('29', 'custom_sendall', '客服群发消息', '0', '', '1', '', '1:基础', null, '', '', '', null, '10', '', '', '1447241925', '1447241925', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('30', 'material_text', '文本素材', '0', '', '1', '[\"content\"]', '1:基础', '', '', '', '', 'id:编号\r\ncontent:文本内容\r\nids:操作:text_edit?id=[id]|编辑,text_del?id=[id]|删除', '10', 'content:请输入文本内容搜索', '', '1442976119', '1442977453', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('31', 'material_file', '文件素材', '0', '', '1', '[\"title\",\"file_id\"]', '1:基础', '', '', '', '', '', '10', '', '', '1438684613', '1442982212', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('32', 'update_score_log', '修改积分记录', '0', '', '1', '', '1:基础', null, '', '', '', null, '10', '', '', '1444302325', '1444302325', '1', 'MyISAM', 'Core');
INSERT INTO `dc_model` VALUES ('1235', 'weisite_cms', '文章管理', '0', '', '1', '[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cate_id\",\"cover\",\"content\",\"sort\"]', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncate_id:所属分类\r\nsort:排序号\r\nview_count:浏览数\r\nids:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除', '20', 'title', '', '1396061373', '1408326292', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1236', 'weisite_category', '微官网分类', '0', '', '1', '[\"title\",\"icon\",\"url\",\"is_show\",\"sort\",\"pid\"]', '1:基础', '', '', '', '', 'title:15%分类标题\r\nicon|get_img_html:分类图片\r\nurl:30%外链\r\nsort:10%排序号\r\npid:10%一级目录\r\nis_show|get_name_by_status:10%显示\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1395987942', '1439522869', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1237', 'weisite_slideshow', '幻灯片', '0', '', '1', '[\"title\",\"img\",\"url\",\"is_show\",\"sort\"]', '1:基础', '', '', '', '', 'title:标题\r\nimg:图片\r\nurl:链接地址\r\nis_show|get_name_by_status:显示\r\nsort:排序\r\nids:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除', '20', 'title', '', '1396098264', '1408323347', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1238', 'weisite_footer', '底部导航', '0', '', '1', '[\"pid\",\"title\",\"url\",\"sort\"]', '1:基础', '', '', '', '', 'title:菜单名\r\nicon:图标\r\nurl:关联URL\r\nsort:排序号\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1394518309', '1396507698', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1239', 'auto_reply', '自动回复', '0', '', '1', '[\"keyword\",\"content\",\"group_id\",\"image_id\",\"reply_scene\"]', '1:基础', '', '', '', '', 'keyword:关键词\r\nmsg_type:回复类型\r\ncontent:文本\r\ngroup_id:图文\r\nimage_id:图片\r\nid:操作:add&id=[id]|编辑,[DELETE]|删除', '10', 'keyword:请输入关键词', '', '1439194522', '1449200272', '1', 'MyISAM', 'AutoReply');
INSERT INTO `dc_model` VALUES ('1268', 'custom_menu', '自定义菜单', '0', '', '1', '[\"pid\",\"title\",\"from_type\",\"type\",\"jump_type\",\"addon\",\"sucai_type\",\"keyword\",\"url\",\"sort\"]', '1:基础', '', '', '', '', 'title:10%菜单名\r\nkeyword:10%关联关键词\r\nurl:50%关联URL\r\nsort:5%排序号\r\nid:10%操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1394518309', '1447317015', '1', 'MyISAM', 'CustomMenu');
INSERT INTO `dc_model` VALUES ('1241', 'youaskservice_group', '你问我答-客服分组', '0', '', '1', '[\"groupname\"]', '1:基础', '', '', '', '', 'id:编号\r\ngroupname:分组名称\r\ntoken:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'groupname', '', '1404475456', '1404491410', '1', 'MyISAM', 'YouaskService');
INSERT INTO `dc_model` VALUES ('1242', 'youaskservice_keyword', '你问我答-关键词指配', '0', '', '1', '[\"msgkeyword\",\"msgkeyword_type\",\"zdtype\",\"msgstate\"]', '1:基础', '', '', '', '', 'id:编号\r\nmsgkeyword:关键字\r\nkf_explain:客服说明\r\nmsgkeyword_type|get_name_by_status:匹配类型\r\nmsgkfaccount:指定的接待客服或分组\r\nmsgstate|get_name_by_status:状态\r\nzdtype:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'msgkeyword', '', '1404399143', '1450018481', '1', 'MyISAM', 'YouaskService');
INSERT INTO `dc_model` VALUES ('1243', 'youaskservice_user', '你问我答-客服工号', '0', '', '1', '[\"name\",\"userName\",\"userPwd\",\"state\",\"kfid\"]', '1:基础', '', '', '', '', 'kfid:客服编号\r\nname:客服昵称\r\nuserName:客服帐号\r\ntoken:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'name', 'userName', '1403947253', '1450018368', '1', 'MyISAM', 'YouaskService');
INSERT INTO `dc_model` VALUES ('1244', 'tmplmsg', '模板消息', '0', '', '1', '{\"1\":[\"openid\",\"template_id\",\"message\",\"MsgID\",\"sendstatus\",\"Status\",\"ctime\"]}', '1:基础', '', '', '', '', 'id:ID\r\nopenid:OPENID\r\ntemplate_id:模板ID\r\nsendstatus|get_name_by_status:发送状态\r\nStatus|get_name_by_status:送达报告\r\nMsgID:消息ID\r\nctime|time_format:发送时间\r\nid:操作:[DELETE]|删除', '10', 'openid', '', '1409247434', '1409276606', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1246', 'scene_qrcode', '场景二维码', '0', '', '1', '[\"scene_name\",\"keyword\",\"scene_type\",\"scene_str\",\"expire\"]', '1:基础', '', '', '', '', 'scene_name:场景名称\r\nkeyword:关联关键词\r\nscene_type:类型\r\nid|getSceneIdOrStr:场景值ID/字符串\r\nshort_url:二维码\r\nexpire:过期时间\r\nid|getScanTimes:扫描次数\r\nid|getScanPersons:扫描人数\r\nctime|time_format:创建时间\r\nid|getExpiretime:到期时间\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除,viewScan&id=[id]|查看扫描统计', '10', 'scene_name', '', '1448517943', '1448544430', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1247', 'scene_qrcode_statistics', '场景二维码扫描统计', '0', '', '1', '[\"scene_name\",\"keyword\",\"scene_id\",\"scan_type\",\"ctime\"]', '1:基础', '', '', '', '', 'scene_name:场景名称\r\nkeyword:关联关键词\r\nopenid|getFollowNickname:扫码者昵称\r\nopenid|getFollowHeadimg:扫码者头像\r\nscan_type|getScanType:扫码类型\r\nctime|time_format:扫码时间', '10', 'scene_name', '', '1448529386', '1448530035', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1248', 'shop', '微商城', '0', '', '1', '[\"title\",\"logo\",\"intro\",\"mobile\",\"qq\",\"wechat\",\"content\"]', '1:基础', '', '', '', '', 'title:商店名称\r\nlogo|get_img_html:商店LOGO\r\nmobile:联系电话\r\nqq:QQ号\r\nwechat:微信号\r\nids:操作:[EDIT]&id=[id]|编辑,lists&_controller=Category&target=_blank&shop_id=[id]|商品分类,lists&_controller=Slideshow&target=_blank&shop_id=[id]|幻灯片,lists&_controller=Goods&target=_blank&shop_id=[id]|商品管理,lists&_controller=Order&target=_blank&shop_id=[id]|订单管理,lists&_addons=Payment&_controller=Payment&target=_blank&shop_id=[id]|支付配置,lists&_controller=Template&target=_blank&shop_id=[id]|模板选择,[DELETE]|删除,index&_controller=Wap&target=_blank&shop_id=[id]|预览', '20', 'title:请输入商店名称', '', '1422670956', '1423640744', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1249', 'shop_goods', '商品列表', '0', '', '1', '[\"title\",\"imgs\",\"category_id\",\"price\",\"is_recommend\",\"content\",\"cover\",\"inventory\",\"is_show\",\"old_price\"]', '1:基础', '', '', '', '', 'category_id:商品分类\r\ncover|get_img_html:封面图\r\ntitle:商品名称\r\nprice:价格\r\ninventory:库存量\r\nsale_count:销售量\r\nis_show|get_name_by_status:是否上架\r\nids:操作:set_show?id=[id]&is_show=[is_show]|改变上架状态,[EDIT]|编辑,[DELETE]|删除', '20', 'title:请输入商品名称', '', '1422672084', '1440124560', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1250', 'shop_collect', '商品收藏', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1423471275', '1423471275', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1251', 'shop_cart', '购物车', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1419577864', '1419577864', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1252', 'shop_address', '收货地址', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1423477477', '1423477477', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1253', 'shop_slideshow', '幻灯片', '0', '', '1', '[\"title\",\"img\",\"url\",\"is_show\",\"sort\"]', '1:基础', '', '', '', '', 'title:标题\r\nimg:图片\r\nurl:链接地址\r\nis_show|get_name_by_status:显示\r\nsort:排序\r\nids:操作:[EDIT]&module_id=[pid]|编辑,[DELETE]|删除', '20', 'title', '', '1396098264', '1408323347', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1254', 'shop_order_log', '订单跟踪', '0', '', '1', '', '1:基础', '', '', '', '', '', '10', '', '', '1439525562', '1439525562', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1255', 'shop_order', '订单记录', '0', '', '1', '[\"uid\",\"goods_datas\",\"remark\",\"order_number\",\"cTime\",\"total_price\",\"address_id\",\"is_send\",\"send_code\",\"send_number\",\"send_type\",\"shop_id\"]', '1:基础', '', '', '', '', 'order_number:15%订单编号\r\ngoods:20%下单商品\r\nuid:10%客户\r\ntotal_price:7%总价\r\ncTime|time_format:17%下单时间\r\ncommon|get_name_by_status:10%支付类型\r\nstatus_code|get_name_by_status:10%订单跟踪\r\naction:11%操作', '20', 'order_number:请输入订单编号 或 客户昵称', '', '1420269240', '1440147136', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1256', 'shop_goods_score', '商品评分记录', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1422930901', '1422930901', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1257', 'shop_goods_category', '商品分类', '0', '', '1', '[\"title\",\"icon\",\"sort\",\"is_show\",\"is_recommend\"]', '1:基础', '', '', '', '', 'title:20%分组\r\nicon|get_img_html:20%图标\r\nsort:20%排序号\r\nis_show|get_name_by_status:20%显示\r\nids:20%操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1397529095', '1438326713', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1258', 'donations_list', '捐赠列表', '0', '', '1', '[\"nickname\",\"email\",\"money\",\"content\"]', '1:基础', '', '', '', '', 'nickname:捐赠者姓名\r\nmoney:捐赠金额\r\nemail:捐赠者邮箱\r\ncontent:捐赠者留言\r\nctime|time_format:捐赠时间\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '10', 'nickname', '', '1446094856', '1446095155', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1259', 'donations_money', '捐赠说明', '0', '', '1', '[\"money\",\"desc\"]', '1:基础', '', '', '', '', 'money:金额\r\ndesc:回报\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '10', 'money', '', '1446094664', '1446094831', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1260', 'extensions', '融合第三方', '0', '', '1', '', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_filter|get_name_by_status:关键词过滤\r\noutput_format|get_name_by_status:数据输出格式\r\napi_url:第三方地址\r\napi_token:Token\r\ncTime|time_format:增加时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', 'keyword', '', '1393911774', '1394267850', '1', 'MyISAM', 'Extensions');
INSERT INTO `dc_model` VALUES ('1261', 'forms', '通用表单', '0', '', '1', '[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cover\",\"can_edit\",\"finish_tip\",\"jump_url\",\"content\",\"template\"]', '1:基础', '', '', '', '', 'id:通用表单ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,forms_attribute&id=[id]|字段管理,forms_value&id=[id]|数据管理,preview&id=[id]|预览', '20', 'title', '', '1396061373', '1437450012', '1', 'MyISAM', 'Forms');
INSERT INTO `dc_model` VALUES ('1262', 'forms_attribute', '表单字段', '0', '', '1', '[\"name\",\"title\",\"type\",\"extra\",\"value\",\"remark\",\"is_must\",\"validate_rule\",\"error_info\",\"sort\"]', '1:基础', '', '', '', '', 'title:字段标题\r\nname:字段名\r\ntype|get_name_by_status:字段类型\r\nids:操作:[EDIT]&forms_id=[forms_id]|编辑,[DELETE]|删除', '20', 'title', '', '1396061373', '1396710959', '1', 'MyISAM', 'Forms');
INSERT INTO `dc_model` VALUES ('1263', 'forms_value', '通用表单数据', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1396687959', '1396687959', '1', 'MyISAM', 'Forms');
INSERT INTO `dc_model` VALUES ('1264', 'suggestions', '建议意见', '0', '', '1', '{\"1\":[\"content\",\"nickname\",\"mobile\"]}', '1:基础', '', '', '', '', 'nickname:昵称\r\ncontent:内容\r\nmobile:联系方式\r\ncTime|time_format:创建时间\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '10', 'content', '', '1393234169', '1400687145', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1265', 'address', '用户地址表', '0', '', '1', '[\"name\",\"sex\",\"mobile\",\"address\",\"country\",\"province\",\"city\",\"area\",\"is_default\",\"postcode\"]', '1:基础', '', '', '', '', 'openid|get_nickname:用户昵称\r\nname:用户姓名\r\nsex|getSex:用户性别\r\nmobile:用户手机号\r\nprovince:所在省份\r\ncity:所在城市\r\narea:所在地区\r\naddress:详细地址\r\npostcode:邮政编码\r\nis_default|getYesOrNo:是否默认\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '10', 'name', '', '1447736688', '1452331063', '1', 'MyISAM', '');
INSERT INTO `dc_model` VALUES ('1266', 'payment_set', '支付配置', '0', '', '1', '[\"wxappid\",\"wxappsecret\",\"wxpaysignkey\",\"zfbname\",\"pid\",\"key\",\"partnerid\",\"partnerkey\",\"wappartnerid\",\"wappartnerkey\",\"quick_security_key\",\"quick_merid\",\"quick_merabbr\",\"wxmchid\"]', '1:基础', '', '', '', '', '', '10', '', '', '1406958084', '1439364636', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1267', 'payment_order', '订单支付记录', '0', '', '1', '[\"from\",\"orderName\",\"single_orderid\",\"price\",\"token\",\"wecha_id\",\"paytype\",\"showwxpaytitle\",\"status\"]', '1:基础', '', '', '', '', '', '20', '', '', '1420596259', '1423534012', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1269', 'custom_menu_type', '自定义菜单类型', '0', '', '1', '[\"title\",\"type\",\"group_id\",\"sex\",\"country\",\"province\",\"city\",\"client_platform_type\",\"menuid\",\"cTime\",\"show\"]', '1:基础', '', '', '', '', 'type:菜单类型\r\ntitle:菜单标题\r\nmenuid:微信端菜单ID\r\nsex:性别筛选\r\nshow:是否发布\r\ngroup_id:用户分组\r\ncountry:国家信息\r\nprovince:省份信息\r\ncity:城市信息\r\nclient_platform_type:手机操作系统\r\nid:操作:[EDIT]&[id]|编辑,[DELETE]&id=[id]|删除', '20', 'title', '', '1453098567', '1453281147', '1', 'MyISAM', 'CustomMenu');
INSERT INTO `dc_model` VALUES ('1291', 'custom_reply_text', '文本回复', '0', '', '1', '[\"keyword\",\"keyword_type\",\"content\",\"sort\"]', '1:基础', '', '', '', '', 'id:ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\nsort:排序号\r\nview_count:浏览数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'keyword', '', '1396578172', '1401017369', '1', 'MyISAM', 'CustomReply');
INSERT INTO `dc_model` VALUES ('1289', 'custom_reply_mult', '多图文配置', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1396602475', '1396602475', '1', 'MyISAM', 'CustomReply');
INSERT INTO `dc_model` VALUES ('1290', 'custom_reply_news', '图文回复', '0', '', '1', '[\"keyword\",\"keyword_type\",\"title\",\"intro\",\"cate_id\",\"cover\",\"content\",\"sort\"]', '1:基础', '', '', '', '', 'id:ID\r\nkeyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncate_id:所属分类\r\nsort:排序号\r\nview_count:浏览数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1396061373', '1401368247', '1', 'MyISAM', 'CustomReply');
INSERT INTO `dc_model` VALUES ('1273', 'panorama', '360全景', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\",\"title\",\"cover\",\"intro\",\"picture1\",\"picture2\",\"picture3\",\"picture4\",\"picture5\",\"picture6\"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nid:操作:show&id=[id]|预览,[EDIT]|编辑,[DELETE]|删除', '10', 'title', '', '1396061373', '1398319281', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1274', 'weather', '天气预报', '0', '', '1', '{\"1\":[\"keyword\",\"keyword_type\"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\ncTime|time_format:创建时间\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除', '10', '', '', '1397782828', '1397826207', '1', 'MyISAM', null);
INSERT INTO `dc_model` VALUES ('1286', 'xydzp_userlog', '幸运大转盘用户抽奖记录', '0', '', '1', '', '1:基础', '', '', '', '', '', '20', '', '', '1395567366', '1395567366', '1', 'MyISAM', 'Xydzp');
INSERT INTO `dc_model` VALUES ('1287', 'prize', '奖项设置', '0', '', '1', '[\"title\",\"name\",\"num\",\"img\",\"sort\"]', '1:基础', '', '', '', '', 'title:奖项标题\r\nname:奖项\r\nnum:名额数量\r\nimg|get_img_html:奖品图片\r\nids:操作:[EDIT]|编辑,[DELETE]|删除', '20', 'title', '', '1399348610', '1399702991', '1', 'MyISAM', 'Scratch');
INSERT INTO `dc_model` VALUES ('1285', 'xydzp_option', '幸运大转盘奖品库设置', '0', '', '1', '[\"title\",\"jptype\",\"coupon_id\",\"experience\",\"num\",\"pic\",\"miaoshu\"]', '1:基础', '', '', '', '', 'pic|get_img_html:奖品图片\r\ntitle:奖品名称\r\njptype|get_name_by_status:奖品类型\r\nnum:库存数量\r\nids:操作:jpopedit?id=[id]|编辑,jpopdel?id=[id]|删除', '20', 'title', '', '1395395190', '1419303406', '1', 'MyISAM', 'Xydzp');
INSERT INTO `dc_model` VALUES ('1284', 'xydzp_log', '幸运大转盘中奖列表', '0', '', '1', '[\"xydzp_id\",\"xydzp_option_id\",\"zip\",\"iphone\",\"address\",\"message\"]', '1:基础', '', '', '', '', 'id:编号\r\ntruename:用户名称\r\nopenid:用户ID\r\nmobile:联系电话\r\ntitle:奖品名称\r\nstate|get_name_by_status:领奖状态\r\nzjdate|time_format:中奖时间\r\nid:标记:ylingqu?id=[id]|已领取,wlingqu?id=[id]|未领取', '20', '', '', '1395395200', '1420358394', '1', 'MyISAM', 'Xydzp');
INSERT INTO `dc_model` VALUES ('1283', 'xydzp_jplist', '幸运大转盘奖品列表', '0', '', '1', '[\"gailv\",\"gailv_maxnum\"]', '1:基础', '', '', '', '', 'xydzp_option_id:奖品名称\r\ngailv:中奖概率（0-100）\r\ngailv_maxnum:单日发放上限\r\nids:操作:jpedit?id=[id]|编辑,jpdel?id=[id]|删除', '20', '', '', '1395554963', '1419305652', '1', 'MyISAM', 'Xydzp');
INSERT INTO `dc_model` VALUES ('1282', 'xydzp', '幸运大转盘', '0', '', '1', '[\"keyword\",\"title\",\"picurl\",\"des_jj\",\"guiz\",\"choujnum\",\"start_date\",\"end_date\",\"experience\",\"background\",\"template\"]', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:触发关键词\r\ntitle:标题\r\nstart_date|time_format:开始时间\r\nend_date|time_format:结束日期\r\nchoujnum:每日抽奖次数\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,zjloglists?id=[id]|中奖记录,jplists?xydzp_id=[id]|奖品设置,preview?id=[id]&target=_blank|预览', '20', 'title', 'des', '1395395179', '1437449460', '1', 'MyISAM', 'Xydzp');
INSERT INTO `dc_model` VALUES ('1288', 'scratch', '刮刮卡', '0', '', '1', '[\"keyword\",\"title\",\"intro\",\"cover\",\"use_tips\",\"start_time\",\"end_time\",\"end_tips\",\"end_img\",\"predict_num\",\"max_num\",\"follower_condtion\",\"credit_conditon\",\"credit_bug\",\"addon_condition\",\"collect_count\",\"view_count\",\"template\"]', '1:基础', '', '', '', '', 'id:刮刮卡ID\r\nkeyword:关键词\r\ntitle:标题\r\ncollect_count:获取人数\r\ncTime|time_format:发布时间\r\nids:操作:[EDIT]|编辑,[DELETE]|删除,lists?target_id=[id]&target=_blank&_controller=Sn|中奖管理,lists?target_id=[id]&target=_blank&_controller=Prize|奖品管理,preview?id=[id]&target=_blank|预览', '20', 'title', '', '1396061373', '1437035669', '1', 'MyISAM', 'Scratch');

-- ----------------------------
-- Table structure for `dc_model_copy`
-- ----------------------------
DROP TABLE IF EXISTS `dc_model_copy`;
CREATE TABLE `dc_model_copy` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '模型ID',
  `name` char(30) NOT NULL default '' COMMENT '模型标识',
  `title` char(30) NOT NULL default '' COMMENT '模型名称',
  `extend` int(10) unsigned default '0' COMMENT '继承的模型',
  `relation` varchar(30) default '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned default '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) default '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) default '' COMMENT '列表模板',
  `template_add` varchar(100) default '' COMMENT '新增模板',
  `template_edit` varchar(100) default '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned default '10' COMMENT '列表数据长度',
  `search_key` varchar(50) default '' COMMENT '默认搜索字段',
  `search_list` varchar(255) default '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned default '0' COMMENT '创建时间',
  `update_time` int(10) unsigned default '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned default '0' COMMENT '状态',
  `engine_type` varchar(25) default 'MyISAM' COMMENT '数据库引擎',
  `addon` varchar(50) default NULL COMMENT '所属插件',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统模型表';

-- ----------------------------
-- Records of dc_model_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_online_count`
-- ----------------------------
DROP TABLE IF EXISTS `dc_online_count`;
CREATE TABLE `dc_online_count` (
  `publicid` int(11) default NULL,
  `addon` varchar(30) default NULL,
  `aim_id` int(11) default NULL,
  `time` bigint(12) default NULL,
  `count` int(11) default NULL,
  KEY `tc` (`time`,`count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_online_count
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_panorama`
-- ----------------------------
DROP TABLE IF EXISTS `dc_panorama`;
CREATE TABLE `dc_panorama` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL default '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `picture1` int(10) unsigned NOT NULL COMMENT '前',
  `picture2` int(10) unsigned NOT NULL COMMENT '右',
  `picture3` int(10) unsigned NOT NULL COMMENT '后',
  `picture4` int(10) unsigned NOT NULL COMMENT '左',
  `picture5` int(10) unsigned NOT NULL COMMENT '上',
  `picture6` int(10) unsigned NOT NULL COMMENT '下',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_panorama
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_payment_order`
-- ----------------------------
DROP TABLE IF EXISTS `dc_payment_order`;
CREATE TABLE `dc_payment_order` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `from` varchar(50) NOT NULL COMMENT '回调地址',
  `orderName` varchar(255) default NULL COMMENT '订单名称',
  `single_orderid` varchar(100) NOT NULL COMMENT '订单号',
  `price` decimal(10,2) default NULL COMMENT '价格',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `wecha_id` varchar(200) NOT NULL COMMENT 'OpenID',
  `paytype` varchar(30) NOT NULL COMMENT '支付方式',
  `showwxpaytitle` tinyint(2) NOT NULL default '0' COMMENT '是否显示标题',
  `status` tinyint(2) NOT NULL default '0' COMMENT '支付状态',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_payment_order
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_payment_set`
-- ----------------------------
DROP TABLE IF EXISTS `dc_payment_set`;
CREATE TABLE `dc_payment_set` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `wxmchid` varchar(255) default NULL COMMENT '微信支付商户号',
  `shop_id` int(10) default '0' COMMENT '商店ID',
  `quick_merid` varchar(255) default NULL COMMENT '银联在线merid',
  `quick_merabbr` varchar(255) default NULL COMMENT '商户名称',
  `wxpartnerid` varchar(255) default NULL COMMENT '微信partnerid',
  `wxpartnerkey` varchar(255) default NULL COMMENT '微信partnerkey',
  `partnerid` varchar(255) default NULL COMMENT '财付通标识',
  `key` varchar(255) default NULL COMMENT 'KEY',
  `ctime` int(10) default NULL COMMENT '创建时间',
  `quick_security_key` varchar(255) default NULL COMMENT '银联在线Key',
  `wappartnerkey` varchar(255) default NULL COMMENT 'WAP财付通Key',
  `wappartnerid` varchar(255) default NULL COMMENT '财付通标识WAP',
  `partnerkey` varchar(255) default NULL COMMENT '财付通Key',
  `pid` varchar(255) default NULL COMMENT 'PID',
  `zfbname` varchar(255) default NULL COMMENT '帐号',
  `wxappsecret` varchar(255) default NULL COMMENT 'AppSecret',
  `wxpaysignkey` varchar(255) default NULL COMMENT '支付密钥',
  `wxappid` varchar(255) default NULL COMMENT 'AppID',
  `token` varchar(255) default NULL COMMENT 'token',
  `wx_cert_pem` int(10) unsigned default NULL COMMENT '上传证书',
  `wx_key_pem` int(10) unsigned default NULL COMMENT '上传密匙',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_payment_set
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_picture`
-- ----------------------------
DROP TABLE IF EXISTS `dc_picture`;
CREATE TABLE `dc_picture` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键id自增',
  `path` varchar(255) NOT NULL default '' COMMENT '路径',
  `url` varchar(255) NOT NULL default '' COMMENT '图片链接',
  `md5` char(32) NOT NULL default '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL default '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL default '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  `token` varchar(255) NOT NULL default '' COMMENT 'Token',
  PRIMARY KEY  (`id`),
  KEY `status` (`id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_picture
-- ----------------------------
INSERT INTO `dc_picture` VALUES ('1', '/Uploads/Picture/2016-01-28/56a9b43663e1c.png', '', 'f794da20a79b40306479e6f047cf2354', 'eceda53fc5e51d349dfd83a21c6bc5796ed9f0a6', '1', '1453962294', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('2', '/Uploads/Picture/2016-01-28/56a9ed52cd00c.jpg', '', 'd7c168545dc86a9d329ca74eb43bcc6f', '8f47271b1bcd388614a5506c6dcdcf7cb0cd6f73', '1', '1453976914', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('3', '/Uploads/Picture/2016-01-28/56a9fc189cc08.png', '', '4933456d56d22939c3f17e6a1a5e2082', 'c0921e5e5d89488c15d16433a5075b00644971ae', '1', '1453980696', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('4', '/Uploads/Picture/2016-02-02/56b066e909b65.png', '', '32a2f3e1cf40b86a4eba5b39c95a6c9f', 'e3baa0e94a9710fc643e8eb2a2efbfb71a69bc55', '1', '1454401256', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('5', '/Uploads/Picture/2016-02-02/56b06c40ec915.png', '', '9bacbf763651aaa07e2652fdab6d6c4f', '1ceb792000fe4c2616d0649fd3884b7be08d6217', '1', '1454402624', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('6', '/Uploads/Picture/2016-02-02/56b07e2c1d7c6.png', '', '4933456d56d22939c3f17e6a1a5e2082', 'c0921e5e5d89488c15d16433a5075b00644971ae', '1', '1454407211', '-1');
INSERT INTO `dc_picture` VALUES ('7', '/Uploads/Picture/2016-02-02/56b07e3001678.png', '', '8fdca09e96d8b071154a3953ce291130', '8548b983d58f36d3393b4084b88b6488aa939fb6', '1', '1454407215', '-1');
INSERT INTO `dc_picture` VALUES ('8', '/Uploads/Picture/2016-02-02/56b0c40eddf62.jpg', '', 'adaaee34d4afac6a9ab09fffb036cae6', '4d87e9f4e664705ee5aa409ef630d10c5a6c1d24', '1', '1454425102', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('9', '/Uploads/Picture/2016-02-02/56b0c40f11ada.jpg', '', '0f44d82493bce84aa091adff19229583', '447cc799fad277b97575074eb71cada3c13de96c', '1', '1454425102', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('10', '/Uploads/Picture/2016-02-02/56b0c490a8a08.png', '', 'a935e7236881b49e7c439edbf3bf8ff4', '6fd38cdf3949204483636520dcbbddbbd7d9285f', '1', '1454425232', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('11', '/Uploads/Picture/2016-02-02/56b0c490db66d.png', '', '8b54c861981662de500460c1adc4a97e', '4137b3bc01fed0366fb47f6e0776f89debf3af05', '1', '1454425232', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('12', '/Uploads/Picture/2016-02-02/56b0c4910a61d.png', '', '3a96d9ee692ceabe4c7b8291a14fa8ba', '3d9dffc8943fd8336afcf5a2d49495099833d5e9', '1', '1454425232', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('13', '/Uploads/Picture/2016-02-03/56b1490ee04b3.png', '', '353cdbf6f3177ea265c1dadcf7f450e2', 'e8f76d24c10f7358d6ef097e2a53f505d1bd78e6', '1', '1454459150', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('14', '/Uploads/Picture/2016-02-03/56b1490f2659d.jpg', '', 'ab7569be395b93f7a36db5fade1673b7', '3a8b57da496b01042863b456e839bb09acec72d5', '1', '1454459150', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('15', '/Uploads/Picture/2016-02-03/56b1491facca5.jpg', '', '8c5a67fa0218a2bf282311f92c6231a9', '5e0f4a42585fbb260e9afe58179d3432391e29d0', '1', '1454459167', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('16', '/Uploads/Picture/2016-02-03/56b1c19bee364.png', '', '8fdca09e96d8b071154a3953ce291130', '8548b983d58f36d3393b4084b88b6488aa939fb6', '1', '1454490011', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('17', '/Uploads/Picture/2016-02-03/56b1d106cef6b.jpg', '', '93100775293e6961d29ad43eaaf6f261', '48c0e8c2bf69485ff3707cb538d7411065fdf4ef', '1', '1454493958', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('18', '/Uploads/Picture/2016-02-03/56b20677d8d2c.png', '', '9bacbf763651aaa07e2652fdab6d6c4f', '1ceb792000fe4c2616d0649fd3884b7be08d6217', '1', '1454507639', 'gh_6019aad69b3f');
INSERT INTO `dc_picture` VALUES ('19', '/Uploads/Picture/2016-02-03/56b206e978a32.png', '', '4933456d56d22939c3f17e6a1a5e2082', 'c0921e5e5d89488c15d16433a5075b00644971ae', '1', '1454507753', 'gh_6019aad69b3f');
INSERT INTO `dc_picture` VALUES ('20', '/Uploads/Picture/2016-02-03/56b208829fc0b.png', '', '8fdca09e96d8b071154a3953ce291130', '8548b983d58f36d3393b4084b88b6488aa939fb6', '1', '1454508162', 'gh_6019aad69b3f');
INSERT INTO `dc_picture` VALUES ('21', '/Uploads/Picture/2016-02-03/56b2091946509.png', '', '8b54c861981662de500460c1adc4a97e', '4137b3bc01fed0366fb47f6e0776f89debf3af05', '1', '1454508240', 'gh_6019aad69b3f');
INSERT INTO `dc_picture` VALUES ('22', '/Uploads/Picture/2016-02-04/56b299665b9b6.png', '', '353cdbf6f3177ea265c1dadcf7f450e2', 'e8f76d24c10f7358d6ef097e2a53f505d1bd78e6', '1', '1454545253', 'gh_6019aad69b3f');
INSERT INTO `dc_picture` VALUES ('23', '/Uploads/Picture/2016-02-04/56b2996694575.png', '', '3a96d9ee692ceabe4c7b8291a14fa8ba', '3d9dffc8943fd8336afcf5a2d49495099833d5e9', '1', '1454545253', 'gh_6019aad69b3f');
INSERT INTO `dc_picture` VALUES ('24', '/Uploads/Picture/2016-02-04/56b299736e140.jpg', '', '394b2e14daa78e0eb05e1b2c962e47c6', '914df6a43e2720d806caf0f70d5fb9332d58ac84', '1', '1454545266', 'gh_6019aad69b3f');
INSERT INTO `dc_picture` VALUES ('25', '/Uploads/Picture/2016-02-04/56b356ac006ba.jpg', '', 'be6d65e5fae8cc316dfba142e38299b0', '24203c21c2bf5395b43fd88db15731623532aa3a', '1', '1454593707', 'gh_72c21308d5d5');
INSERT INTO `dc_picture` VALUES ('26', '/Uploads/Picture/2016-02-04/56b3590f24566.jpg', '', '93100775293e6961d29ad43eaaf6f261', '48c0e8c2bf69485ff3707cb538d7411065fdf4ef', '1', '1454594319', 'gh_6019aad69b3f');
INSERT INTO `dc_picture` VALUES ('27', '/Uploads/Picture/2016-02-05/56b43c23cacac.jpg', '', 'd061113088c11f6f71ddb9117b049038', '9be7d1867c5257b2ce6e287854bd892b81270ff8', '1', '1454652451', 'gh_6019aad69b3f');
INSERT INTO `dc_picture` VALUES ('28', '/Uploads/Picture/2016-02-19/56c6e0c4a477c.png', '', 'f794da20a79b40306479e6f047cf2354', 'eceda53fc5e51d349dfd83a21c6bc5796ed9f0a6', '1', '1455874244', 'gh_6019aad69b3f');

-- ----------------------------
-- Table structure for `dc_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `dc_plugin`;
CREATE TABLE `dc_plugin` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL default '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL default '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) default '' COMMENT '作者',
  `version` varchar(20) default '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL default '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL default '0' COMMENT '是否有后台列表',
  `cate_id` int(11) default NULL,
  `is_show` tinyint(2) default '1',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`),
  KEY `sti` (`status`,`is_show`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统插件表';

-- ----------------------------
-- Records of dc_plugin
-- ----------------------------
INSERT INTO `dc_plugin` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"2\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0', null, '1');
INSERT INTO `dc_plugin` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '0', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512015', '0', null, '1');
INSERT INTO `dc_plugin` VALUES ('22', 'DevTeam', '开发团队信息', '开发团队成员信息', '0', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1391687096', '0', null, '1');
INSERT INTO `dc_plugin` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0', null, '1');
INSERT INTO `dc_plugin` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0', null, '1');
INSERT INTO `dc_plugin` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"1669260\",\"comment_short_name_duoshuo\":\"\",\"comment_form_pos_duoshuo\":\"buttom\",\"comment_data_list_duoshuo\":\"10\",\"comment_data_order_duoshuo\":\"asc\"}', 'thinkphp', '0.1', '1380273962', '0', null, '1');
INSERT INTO `dc_plugin` VALUES ('58', 'Cascade', '级联菜单', '支持无级级联菜单，用于地区选择、多层分类选择等场景。菜单的数据来源支持查询数据库和直接用户按格式输入两种方式', '1', 'null', '凡星', '0.1', '1398694996', '0', null, '1');
INSERT INTO `dc_plugin` VALUES ('120', 'DynamicSelect', '动态下拉菜单', '支持动态从数据库里取值显示', '1', 'null', '凡星', '0.1', '1435223177', '0', null, '1');
INSERT INTO `dc_plugin` VALUES ('125', 'News', '图文素材选择器', '', '1', 'null', '凡星', '0.1', '1439198046', '0', null, '1');

-- ----------------------------
-- Table structure for `dc_prize`
-- ----------------------------
DROP TABLE IF EXISTS `dc_prize`;
CREATE TABLE `dc_prize` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `addon` varchar(255) default 'Scratch' COMMENT '来源插件',
  `target_id` int(10) unsigned default NULL COMMENT '来源ID',
  `title` varchar(255) default NULL COMMENT '奖项标题',
  `name` varchar(255) default NULL COMMENT '奖项',
  `num` int(10) unsigned default NULL COMMENT '名额数量',
  `sort` int(10) unsigned default '0' COMMENT '排序号',
  `img` int(10) unsigned default NULL COMMENT '奖品图片',
  `token` varchar(255) default NULL COMMENT 'Token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_prize
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_public`
-- ----------------------------
DROP TABLE IF EXISTS `dc_public`;
CREATE TABLE `dc_public` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` int(10) default NULL COMMENT '用户ID',
  `public_name` varchar(50) default NULL COMMENT '公众号名称',
  `public_id` varchar(100) default NULL COMMENT '公众号原始id',
  `wechat` varchar(100) default NULL COMMENT '微信号',
  `interface_url` varchar(255) default NULL COMMENT '接口地址',
  `headface_url` varchar(255) default NULL COMMENT '公众号头像',
  `area` varchar(50) default NULL COMMENT '地区',
  `addon_config` text COMMENT '插件配置',
  `addon_status` text COMMENT '插件状态',
  `token` varchar(100) default NULL COMMENT 'Token',
  `is_use` tinyint(2) default '0' COMMENT '是否为当前公众号',
  `type` char(10) default '0' COMMENT '公众号类型',
  `appid` varchar(255) default NULL COMMENT 'AppID',
  `secret` varchar(255) default NULL COMMENT 'AppSecret',
  `group_id` int(10) unsigned default '0' COMMENT '等级',
  `encodingaeskey` varchar(255) default NULL COMMENT 'EncodingAESKey',
  `tips_url` varchar(255) default NULL COMMENT '提示关注公众号的文章地址',
  `domain` varchar(30) default NULL COMMENT '自定义域名',
  `is_bind` tinyint(2) default '0' COMMENT '是否为微信开放平台绑定账号',
  `mp_username` varchar(255) default NULL COMMENT '公众号登陆用户名',
  `mp_password` varchar(255) default NULL COMMENT '公众号登陆密码',
  `mp_token` varchar(255) default NULL COMMENT '公众号接入验证Token',
  `qrcode_url` varchar(255) default NULL COMMENT '二维码地址',
  PRIMARY KEY  (`id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_public
-- ----------------------------
INSERT INTO `dc_public` VALUES ('5', '2', '艾豆乐园', 'gh_a16860f75a5c', 'idouly', 'http://127.0.0.1/douchat/index.php?s=/home/weixin/index.html', './Uploads/Picture/WechatLogin/headpic_idouly@163.com.jpg', null, null, null, 'gh_a16860f75a5c', '0', '2', 'wxd9f3df9efc1e47dc', null, '0', 'bc0adf7e6895eb76a22cbac1f2cb776d7dd7cb7ae1c', null, null, '0', 'idouly@163.com', 'idouly123', '6WMCxdpJg6yZ5xM6n0dhYtqgdoxgWL6Z', './Uploads/Picture/WechatLogin/qrcode_idouly@163.com.jpg');
INSERT INTO `dc_public` VALUES ('4', '2', 'gh_6019aad69b3f', 'gh_6019aad69b3f', 'gh_6019aad69b3f', 'http://localhost/douchat/index.php?s=/home/weixin/index.html', null, null, '{\"WeiSite\":{\"template_index\":\"ColorV3\",\"template_footer\":\"tvs\"}}', null, 'gh_6019aad69b3f', '0', '1', 'wxf3aff5baeeae191d', '8e07eb34ce4b5affbba144f0058032f9', '0', '', null, null, '0', null, null, '1I1cRbgbZWF9ud33YJLlwHF1JP5xHlSS', null);
INSERT INTO `dc_public` VALUES ('6', '2', '111', '111', '111', 'http://127.0.0.1/douchat/index.php?s=/home/weixin/index.html', null, null, null, null, '111', '0', '0', '', '', '0', '', null, null, '0', null, null, 'pp6Q16p167hqdb1zrvwopO6mbkBsnKo9', null);
INSERT INTO `dc_public` VALUES ('7', '2', '222', '222', '222', 'http://127.0.0.1/douchat/index.php?s=/home/weixin/index.html', null, null, null, null, '222', '0', '0', '', '', '0', '', null, null, '0', null, null, 'jQoSsT0X9TjV1yDd86PP7ged1fGmtMxH', null);

-- ----------------------------
-- Table structure for `dc_public_auth`
-- ----------------------------
DROP TABLE IF EXISTS `dc_public_auth`;
CREATE TABLE `dc_public_auth` (
  `name` char(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type_0` tinyint(1) default '0' COMMENT '普通订阅号的开关',
  `type_1` tinyint(1) default '0' COMMENT '认证订阅号的开关',
  `type_2` tinyint(1) default '0' COMMENT '普通服务号的开关',
  `type_3` tinyint(1) default '0' COMMENT '认证服务号的开关',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_public_auth
-- ----------------------------
INSERT INTO `dc_public_auth` VALUES ('GET_ACCESS_TOKEN', '基础支持-获取access_token', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('GET_WECHAT_IP', '基础支持-获取微信服务器IP地址', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('GET_MSG', '接收消息-验证消息真实性、接收普通消息、接收事件推送、接收语音识别结果', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('SEND_REPLY_MSG', '发送消息-被动回复消息', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('SEND_CUSTOM_MSG', '发送消息-客服接口', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('SEND_GROUP_MSG', '发送消息-群发接口', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('SEND_NOTICE', '发送消息-模板消息接口（发送业务通知）', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('USER_GROUP', '用户管理-用户分组管理', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('USER_REMARK', '用户管理-设置用户备注名', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('USER_BASE_INFO', '用户管理-获取用户基本信息', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('USER_LIST', '用户管理-获取用户列表', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('USER_LOCATION', '用户管理-获取用户地理位置', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('USER_OAUTH', '用户管理-网页授权获取用户openid/用户基本信息', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('QRCODE', '推广支持-生成带参数二维码', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('LONG_URL', '推广支持-长链接转短链接口', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('MENU', '界面丰富-自定义菜单', '0', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('MATERIAL', '素材管理-素材管理接口', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('SEMANTIC', '智能接口-语义理解接口', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('CUSTOM_SERVICE', '多客服-获取多客服消息记录、客服管理', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('PAYMENT', '微信支付接口', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('SHOP', '微信小店接口', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('CARD', '微信卡券接口', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('DEVICE', '微信设备功能接口', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_BASE', '微信JS-SDK-基础接口', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_SHARE', '微信JS-SDK-分享接口', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_IMG', '微信JS-SDK-图像接口', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_AUDIO', '微信JS-SDK-音频接口', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_SEMANTIC', '微信JS-SDK-智能接口（网页语音识别）', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_DEVICE', '微信JS-SDK-设备信息', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_LOCATION', '微信JS-SDK-地理位置', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_MENU', '微信JS-SDK-界面操作', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_SCAN', '微信JS-SDK-微信扫一扫', '1', '1', '1', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_SHOP', '微信JS-SDK-微信小店', '0', '0', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_CARD', '微信JS-SDK-微信卡券', '0', '1', '0', '1');
INSERT INTO `dc_public_auth` VALUES ('JSSKD_PAYMENT', '微信JS-SDK-微信支付', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `dc_public_follow`
-- ----------------------------
DROP TABLE IF EXISTS `dc_public_follow`;
CREATE TABLE `dc_public_follow` (
  `openid` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `uid` int(11) default NULL,
  `has_subscribe` tinyint(1) default '0',
  `syc_status` tinyint(1) default '2' COMMENT '0 开始同步中 1 更新用户信息中 2 完成同步',
  `remark` varchar(100) default NULL,
  UNIQUE KEY `openid` (`openid`,`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_public_follow
-- ----------------------------
INSERT INTO `dc_public_follow` VALUES ('oVFP7s-1D7vEZT0wmvmLbXvDt1_8', 'gh_6019aad69b3f', '73', '1', '2', null);
INSERT INTO `dc_public_follow` VALUES ('oHEGDw9PZ7ZgE3drhWpvOKJ9_4Ho', 'gh_6019aad69b3f', '72', '1', '2', null);

-- ----------------------------
-- Table structure for `dc_public_group`
-- ----------------------------
DROP TABLE IF EXISTS `dc_public_group`;
CREATE TABLE `dc_public_group` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(50) default NULL COMMENT '等级名',
  `addon_status` text COMMENT '插件权限',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_public_group
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_public_link`
-- ----------------------------
DROP TABLE IF EXISTS `dc_public_link`;
CREATE TABLE `dc_public_link` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` int(10) default NULL COMMENT '管理员UID',
  `mp_id` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `is_creator` tinyint(2) default '0' COMMENT '是否为创建者',
  `addon_status` text COMMENT '插件权限',
  `is_use` tinyint(2) default '0' COMMENT '是否为当前管理的公众号',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `um` (`uid`,`mp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_public_link
-- ----------------------------
INSERT INTO `dc_public_link` VALUES ('6', '2', '5', '1', null, '0');
INSERT INTO `dc_public_link` VALUES ('7', '2', '6', '1', null, '0');
INSERT INTO `dc_public_link` VALUES ('5', '2', '4', '1', null, '0');
INSERT INTO `dc_public_link` VALUES ('8', '2', '7', '1', null, '0');

-- ----------------------------
-- Table structure for `dc_qr_code`
-- ----------------------------
DROP TABLE IF EXISTS `dc_qr_code`;
CREATE TABLE `dc_qr_code` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `qr_code` varchar(255) NOT NULL COMMENT '二维码',
  `addon` varchar(255) NOT NULL COMMENT '二维码所属插件',
  `aim_id` int(10) unsigned NOT NULL COMMENT '插件表里的ID值',
  `cTime` int(10) default NULL COMMENT '创建时间',
  `token` varchar(255) default NULL COMMENT 'Token',
  `action_name` char(30) default 'QR_SCENE' COMMENT '二维码类型',
  `extra_text` text COMMENT '文本扩展',
  `extra_int` int(10) default NULL COMMENT '数字扩展',
  `request_count` int(10) default '0' COMMENT '请求数',
  `scene_id` int(10) default '0' COMMENT '场景ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_qr_code
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_scene_qrcode`
-- ----------------------------
DROP TABLE IF EXISTS `dc_scene_qrcode`;
CREATE TABLE `dc_scene_qrcode` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `token` varchar(255) default NULL COMMENT '公众号Token',
  `scene_name` varchar(255) default NULL COMMENT '场景名称',
  `keyword` varchar(255) default NULL COMMENT '关联关键词',
  `scene_type` char(10) default '0' COMMENT '二维码类型',
  `scene_id` int(32) default NULL COMMENT '场景值ID',
  `scene_str` varchar(255) default NULL COMMENT '场景值字符串',
  `expire` int(10) default NULL COMMENT '过期时间',
  `ticket` varchar(255) default NULL COMMENT '二维码Ticket',
  `url` varchar(255) default NULL COMMENT '二维码图片解析后的地址',
  `ctime` int(10) default NULL COMMENT '二维码创建时间',
  `short_url` varchar(255) default NULL COMMENT '二维码短地址',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_scene_qrcode
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_scene_qrcode_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `dc_scene_qrcode_statistics`;
CREATE TABLE `dc_scene_qrcode_statistics` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `token` varchar(255) default NULL COMMENT '公众号Token',
  `openid` varchar(255) default NULL COMMENT '扫码者openid',
  `scene_name` varchar(255) default NULL COMMENT '场景名称',
  `keyword` varchar(255) default NULL COMMENT '关联关键词',
  `scene_id` varchar(255) default NULL COMMENT '场景ID/场景字符串',
  `scan_type` varchar(255) default NULL COMMENT '扫描类型',
  `ctime` int(10) default NULL COMMENT '扫描时间',
  `qrcode_id` int(10) default NULL COMMENT '二维码ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_scene_qrcode_statistics
-- ----------------------------
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('1', 'gh_72c21308d5d5', 'gh_72c21308d5d5', null, null, '', 'subscribe', '1453948272', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('2', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453955386', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('3', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453955386', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('4', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453958296', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('5', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453958296', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('6', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453958479', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('7', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453958479', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('8', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453958479', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('9', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453958479', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('10', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453958479', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('11', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453959095', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('12', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453959095', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('13', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453959095', null);
INSERT INTO `dc_scene_qrcode_statistics` VALUES ('14', 'gh_72c21308d5d5', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', null, null, '', 'subscribe', '1453959095', null);

-- ----------------------------
-- Table structure for `dc_scratch`
-- ----------------------------
DROP TABLE IF EXISTS `dc_scratch`;
CREATE TABLE `dc_scratch` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `use_tips` varchar(255) NOT NULL COMMENT '使用说明',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '封面简介',
  `end_time` int(10) default NULL COMMENT '结束时间',
  `cover` int(10) unsigned default NULL COMMENT '封面图片',
  `cTime` int(10) unsigned default NULL COMMENT '发布时间',
  `token` varchar(255) default NULL COMMENT 'Token',
  `start_time` int(10) default NULL COMMENT '开始时间',
  `end_tips` text COMMENT '过期说明',
  `end_img` int(10) unsigned default NULL COMMENT '过期提示图片',
  `predict_num` int(10) unsigned NOT NULL COMMENT '预计参与人数',
  `max_num` int(10) unsigned default '1' COMMENT '每人最多允许抽奖次数',
  `follower_condtion` char(50) default '1' COMMENT '粉丝状态',
  `credit_conditon` int(10) unsigned default '0' COMMENT '积分限制',
  `credit_bug` int(10) unsigned default '0' COMMENT '积分消费',
  `addon_condition` varchar(255) default NULL COMMENT '插件场景限制',
  `collect_count` int(10) unsigned default '0' COMMENT '已领取人数',
  `view_count` int(10) unsigned default '0' COMMENT '浏览人数',
  `update_time` int(10) default NULL COMMENT '更新时间',
  `template` varchar(255) default 'default' COMMENT '素材模板',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_scratch
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop`;
CREATE TABLE `dc_shop` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '商店名称',
  `logo` int(10) default NULL COMMENT '商店LOGO',
  `intro` text COMMENT '店铺简介',
  `mobile` varchar(30) default NULL COMMENT '联系电话',
  `qq` int(10) default NULL COMMENT 'QQ',
  `wechat` varchar(50) default NULL COMMENT '微信',
  `template` varchar(30) default NULL COMMENT '模板',
  `content` text COMMENT '店铺介绍',
  `token` varchar(100) default NULL COMMENT 'Token',
  `manager_id` int(10) default NULL COMMENT '管理员ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop_address`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop_address`;
CREATE TABLE `dc_shop_address` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` int(10) default NULL COMMENT '用户ID',
  `truename` varchar(100) default NULL COMMENT '收货人姓名',
  `mobile` varchar(50) default NULL COMMENT '手机号码',
  `city` varchar(255) default NULL COMMENT '城市',
  `address` varchar(255) default NULL COMMENT '具体地址',
  `is_use` tinyint(2) default '0' COMMENT '是否设置为默认',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop_address
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop_cart`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop_cart`;
CREATE TABLE `dc_shop_cart` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `shop_id` varchar(255) NOT NULL COMMENT '商店id',
  `goods_id` varchar(255) NOT NULL COMMENT '商品id',
  `num` int(10) unsigned NOT NULL COMMENT '数量',
  `price` varchar(30) NOT NULL COMMENT '单价',
  `goods_type` tinyint(2) NOT NULL default '0' COMMENT '商品类型',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop_collect`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop_collect`;
CREATE TABLE `dc_shop_collect` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` int(10) default NULL COMMENT '使用UID',
  `goods_id` int(10) default NULL COMMENT '商品ID',
  `cTime` int(10) default NULL COMMENT '收藏时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop_goods`;
CREATE TABLE `dc_shop_goods` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `cover` int(10) unsigned default NULL COMMENT '商品封面图',
  `content` text NOT NULL COMMENT '商品介绍',
  `title` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) default '0.00' COMMENT '价格',
  `imgs` varchar(255) NOT NULL COMMENT '商品图片',
  `inventory` int(10) default '0' COMMENT '库存数量',
  `shop_id` int(10) default '0' COMMENT '商店ID',
  `is_show` tinyint(2) default '0' COMMENT '是否上架',
  `sale_count` int(10) default '0' COMMENT '销售量',
  `is_recommend` tinyint(2) default NULL COMMENT '是否推荐',
  `rank` int(10) default '0' COMMENT '热销度',
  `show_time` int(10) default '0' COMMENT '上架时间',
  `old_price` int(10) default NULL COMMENT '原价',
  `type` tinyint(2) default '0' COMMENT '商品类型',
  `category_id` char(50) default NULL COMMENT '商品分类',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop_goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop_goods_category`;
CREATE TABLE `dc_shop_goods_category` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '分类标题',
  `icon` int(10) unsigned default NULL COMMENT '分类图标',
  `pid` int(10) unsigned default '0' COMMENT '上一级分类',
  `path` varchar(255) default NULL COMMENT '分类路径',
  `sort` int(10) unsigned default '0' COMMENT '排序号',
  `is_show` tinyint(2) default '1' COMMENT '是否显示',
  `shop_id` int(10) NOT NULL default '0' COMMENT '商店ID',
  `is_recommend` tinyint(2) default '0' COMMENT '是否推荐',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop_goods_category
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop_goods_score`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop_goods_score`;
CREATE TABLE `dc_shop_goods_score` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` int(10) default NULL COMMENT '用户ID',
  `goods_id` int(10) default NULL COMMENT '商品ID',
  `score` int(10) default '0' COMMENT '得分',
  `cTime` int(10) default NULL COMMENT '创建时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop_goods_score
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop_order`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop_order`;
CREATE TABLE `dc_shop_order` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `goods_datas` text NOT NULL COMMENT '商品序列化数据',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `remark` text NOT NULL COMMENT '备注',
  `order_number` varchar(255) NOT NULL COMMENT '订单编号',
  `cTime` int(10) NOT NULL COMMENT '订单时间',
  `total_price` decimal(10,2) default NULL COMMENT '总价',
  `openid` varchar(255) NOT NULL COMMENT 'OpenID',
  `pay_status` int(10) default NULL COMMENT '支付状态',
  `pay_type` int(10) default NULL COMMENT '支付类型',
  `address_id` int(10) default NULL COMMENT '配送信息',
  `is_send` int(10) default '0' COMMENT '是否发货',
  `send_code` varchar(255) default NULL COMMENT '快递公司编号',
  `send_number` varchar(255) default NULL COMMENT '快递单号',
  `send_type` char(10) default NULL COMMENT '发货类型',
  `is_new` tinyint(2) default '1' COMMENT '是否为新订单',
  `shop_id` int(10) default '0' COMMENT '商店编号',
  `status_code` char(50) default '0' COMMENT '订单跟踪状态码',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop_order
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop_order_log`;
CREATE TABLE `dc_shop_order_log` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `order_id` int(10) default NULL COMMENT '订单ID',
  `status_code` char(50) default '0' COMMENT '状态码',
  `remark` varchar(255) default NULL COMMENT '备注内容',
  `cTime` int(10) default NULL COMMENT '时间',
  `extend` varchar(255) default NULL COMMENT '扩展信息',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_shop_slideshow`
-- ----------------------------
DROP TABLE IF EXISTS `dc_shop_slideshow`;
CREATE TABLE `dc_shop_slideshow` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(255) default NULL COMMENT '标题',
  `img` int(10) unsigned NOT NULL COMMENT '图片',
  `url` varchar(255) default NULL COMMENT '链接地址',
  `is_show` tinyint(2) default '1' COMMENT '是否显示',
  `sort` int(10) unsigned default '0' COMMENT '排序',
  `token` varchar(100) default NULL COMMENT 'Token',
  `shop_id` int(10) default '0' COMMENT '商店ID',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_shop_slideshow
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_smalltools`
-- ----------------------------
DROP TABLE IF EXISTS `dc_smalltools`;
CREATE TABLE `dc_smalltools` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `tooltype` tinyint(2) default '0' COMMENT '工具类型',
  `keyword` varchar(255) default NULL COMMENT ' 关键词 ',
  `cTime` int(10) default NULL COMMENT '创建时间',
  `toolname` varchar(255) default NULL COMMENT '工具名称',
  `tooldes` text COMMENT '工具描述',
  `toolnum` varchar(255) default NULL COMMENT '工具唯一编号',
  `toolstate` tinyint(2) default '0' COMMENT '工具状态',
  `token` varchar(255) default NULL COMMENT 'Token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_smalltools
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_sucai`
-- ----------------------------
DROP TABLE IF EXISTS `dc_sucai`;
CREATE TABLE `dc_sucai` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` varchar(100) default NULL COMMENT '素材名称',
  `status` char(10) default 'UnSubmit' COMMENT '状态',
  `cTime` int(10) default NULL COMMENT '提交时间',
  `url` varchar(255) default NULL COMMENT '实际摇一摇所使用的页面URL',
  `type` varchar(255) default NULL COMMENT '素材类型',
  `detail` text COMMENT '素材内容',
  `reason` text COMMENT '入库失败的原因',
  `create_time` int(10) default NULL COMMENT '申请时间',
  `checked_time` int(10) default NULL COMMENT '入库时间',
  `source` varchar(50) default NULL COMMENT '来源',
  `source_id` int(10) default NULL COMMENT '来源ID',
  `wechat_id` int(10) default NULL COMMENT '微信端的素材ID',
  `uid` int(10) default NULL COMMENT 'uid',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_sucai
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_sucai_template`
-- ----------------------------
DROP TABLE IF EXISTS `dc_sucai_template`;
CREATE TABLE `dc_sucai_template` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` int(10) default NULL COMMENT '管理员id',
  `token` varchar(255) default NULL COMMENT '用户token',
  `addons` varchar(255) default NULL COMMENT '插件名称',
  `template` varchar(255) default NULL COMMENT '模版名称',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_sucai_template
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_suggestions`
-- ----------------------------
DROP TABLE IF EXISTS `dc_suggestions`;
CREATE TABLE `dc_suggestions` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `content` text NOT NULL COMMENT '内容',
  `uid` int(10) NOT NULL default '0' COMMENT '用户ID',
  `nickname` varchar(255) NOT NULL COMMENT '用户昵称',
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_suggestions
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_system_notice`
-- ----------------------------
DROP TABLE IF EXISTS `dc_system_notice`;
CREATE TABLE `dc_system_notice` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(255) default NULL COMMENT '公告标题',
  `content` text COMMENT '公告内容',
  `create_time` int(10) default NULL COMMENT '发布时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_system_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_tmplmsg`
-- ----------------------------
DROP TABLE IF EXISTS `dc_tmplmsg`;
CREATE TABLE `dc_tmplmsg` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `template_id` varchar(500) NOT NULL COMMENT '模板ID',
  `message` text NOT NULL COMMENT '消息内容',
  `MsgID` varchar(255) NOT NULL COMMENT '消息ID',
  `sendstatus` char(50) NOT NULL COMMENT '发送状态',
  `Status` char(50) NOT NULL COMMENT '送达报告',
  `token` varchar(255) NOT NULL COMMENT 'token',
  `ctime` int(10) NOT NULL COMMENT '发送时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_tmplmsg
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_update_score_log`
-- ----------------------------
DROP TABLE IF EXISTS `dc_update_score_log`;
CREATE TABLE `dc_update_score_log` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `score` int(10) default NULL COMMENT '修改积分',
  `branch_id` int(10) default NULL COMMENT '修改门店',
  `operator` varchar(255) default NULL COMMENT '操作员',
  `cTime` int(10) default NULL COMMENT '修改时间',
  `token` varchar(255) default NULL COMMENT 'token',
  `member_id` int(10) default NULL COMMENT '会员卡id',
  `manager_id` int(10) default NULL COMMENT '管理员id',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_update_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_update_version`
-- ----------------------------
DROP TABLE IF EXISTS `dc_update_version`;
CREATE TABLE `dc_update_version` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `version` int(10) unsigned NOT NULL COMMENT '版本号',
  `title` varchar(50) NOT NULL COMMENT '升级包名',
  `description` text COMMENT '描述',
  `create_date` int(10) default NULL COMMENT '创建时间',
  `download_count` int(10) unsigned default '0' COMMENT '下载统计',
  `package` varchar(255) NOT NULL COMMENT '升级包地址',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_update_version
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_user`
-- ----------------------------
DROP TABLE IF EXISTS `dc_user`;
CREATE TABLE `dc_user` (
  `uid` int(11) NOT NULL auto_increment,
  `nickname` text COMMENT '用户名',
  `password` varchar(100) default NULL COMMENT '登录密码',
  `truename` varchar(30) default NULL COMMENT '真实姓名',
  `mobile` varchar(30) default NULL COMMENT '联系电话',
  `email` varchar(100) default NULL COMMENT '邮箱地址',
  `sex` tinyint(2) default NULL COMMENT '性别',
  `headimgurl` varchar(255) default NULL COMMENT '头像地址',
  `city` varchar(30) default NULL COMMENT '城市',
  `province` varchar(30) default NULL COMMENT '省份',
  `country` varchar(30) default NULL COMMENT '国家',
  `language` varchar(20) default 'zh-cn' COMMENT '语言',
  `score` int(10) default '0' COMMENT '金币值',
  `experience` int(10) default '0' COMMENT '经验值',
  `unionid` varchar(50) default NULL COMMENT '微信第三方ID',
  `login_count` int(10) default '0' COMMENT '登录次数',
  `reg_ip` varchar(30) default NULL COMMENT '注册IP',
  `reg_time` int(10) default NULL COMMENT '注册时间',
  `last_login_ip` varchar(30) default NULL COMMENT '最近登录IP',
  `last_login_time` int(10) default NULL COMMENT '最近登录时间',
  `status` tinyint(2) default '1' COMMENT '状态',
  `is_init` tinyint(2) default '0' COMMENT '初始化状态',
  `is_audit` tinyint(2) default '0' COMMENT '审核状态',
  `subscribe_time` int(10) default NULL COMMENT '用户关注公众号时间',
  `remark` varchar(100) default NULL COMMENT '微信用户备注',
  `groupid` int(10) default NULL COMMENT '微信端的分组ID',
  `come_from` tinyint(1) default '0' COMMENT '来源',
  `login_name` varchar(100) default NULL COMMENT 'login_name',
  `login_password` varchar(255) default NULL COMMENT '登录密码',
  `manager_id` int(10) default '0' COMMENT '公众号管理员ID',
  `level` tinyint(2) default '0' COMMENT '管理等级',
  `membership` char(50) default '0' COMMENT '会员等级',
  `public_count` int(10) default NULL COMMENT '可创建公众号数',
  PRIMARY KEY  (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_user
-- ----------------------------
INSERT INTO `dc_user` VALUES ('1', 'admin', '3db53638112041d2009075396247fc26', null, '', 'lzc0088@foxmail.com', null, null, null, null, null, 'zh-cn', '0', '0', null, '14', '0', '1453906142', '2130706433', '1455940164', '1', '0', '1', null, null, null, '0', 'admin', null, '0', '0', '0', null);
INSERT INTO `dc_user` VALUES ('2', '\"lzc0088\"', 'ad33599eb72f2cbbe87b1ee491cb1ab6', '', '', 'lzc0088@foxmail.com', null, null, null, null, null, 'zh-cn', '0', '0', null, '58', '0', '1454402446', '2130706433', '1455943354', '1', '1', '1', null, null, null, '0', 'lzc0088', null, '0', '0', '0', '5');
INSERT INTO `dc_user` VALUES ('73', null, null, null, null, null, null, null, null, null, null, 'zh-cn', '200', '200', null, '0', '0', '1455897142', '0', '1455897142', '1', '1', '1', null, null, null, '1', null, null, '0', '0', '0', null);
INSERT INTO `dc_user` VALUES ('72', '\"Arthur\"', null, null, null, null, '1', '', 'Suzhou', 'Jiangsu', 'China', 'zh_CN', '100', '100', null, '0', null, '1454511430', null, null, '1', '1', '1', '1454511430', '', '100', '0', null, null, '0', '0', '0', null);

-- ----------------------------
-- Table structure for `dc_user_follow`
-- ----------------------------
DROP TABLE IF EXISTS `dc_user_follow`;
CREATE TABLE `dc_user_follow` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `publicid` int(11) default NULL,
  `follow_id` int(11) default NULL,
  `url` varchar(250) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_user_follow
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_visit_log`
-- ----------------------------
DROP TABLE IF EXISTS `dc_visit_log`;
CREATE TABLE `dc_visit_log` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `publicid` int(10) default '0' COMMENT 'publicid',
  `module_name` varchar(30) default NULL COMMENT 'module_name',
  `controller_name` varchar(30) default NULL COMMENT 'controller_name',
  `action_name` varchar(30) default NULL COMMENT 'action_name',
  `uid` varchar(255) default '0' COMMENT 'uid',
  `ip` varchar(30) default NULL COMMENT 'ip',
  `brower` varchar(30) default NULL COMMENT 'brower',
  `param` text COMMENT 'param',
  `referer` varchar(255) default NULL COMMENT 'referer',
  `cTime` int(10) default NULL COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_visit_log
-- ----------------------------
INSERT INTO `dc_visit_log` VALUES ('4807', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455946545');
INSERT INTO `dc_visit_log` VALUES ('4806', '4', 'AutoReply', 'AutoReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455946542');
INSERT INTO `dc_visit_log` VALUES ('4805', '4', 'WeiSite', 'WeiSite', 'config', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/WeiSite/WeiSite/config.html', '1455946539');
INSERT INTO `dc_visit_log` VALUES ('4804', '4', 'Home', 'UserCenter', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/UserCenter/lists.html', '1455946536');
INSERT INTO `dc_visit_log` VALUES ('4803', '4', 'Home', 'Index', 'addons_list', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/addons_list.html', '1455946521');
INSERT INTO `dc_visit_log` VALUES ('4802', '4', 'Home', 'UserCenter', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/UserCenter/lists.html', '1455946519');
INSERT INTO `dc_visit_log` VALUES ('4801', '4', 'WeiSite', 'WeiSite', 'config', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/WeiSite/WeiSite/config.html', '1455946516');
INSERT INTO `dc_visit_log` VALUES ('4800', '4', 'YouaskService', 'YouaskService', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/YouaskService/YouaskService/lists.html', '1455946515');
INSERT INTO `dc_visit_log` VALUES ('4799', '4', 'AutoReply', 'AutoReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455946512');
INSERT INTO `dc_visit_log` VALUES ('4798', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455946510');
INSERT INTO `dc_visit_log` VALUES ('4797', '4', 'AutoReply', 'AutoReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455946494');
INSERT INTO `dc_visit_log` VALUES ('4796', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455946489');
INSERT INTO `dc_visit_log` VALUES ('4795', '4', 'AutoReply', 'AutoReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455946486');
INSERT INTO `dc_visit_log` VALUES ('4794', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455946484');
INSERT INTO `dc_visit_log` VALUES ('4793', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main.html', '1455946481');
INSERT INTO `dc_visit_log` VALUES ('4792', '4', 'YouaskService', 'YouaskService', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/YouaskService/YouaskService/lists.html', '1455946409');
INSERT INTO `dc_visit_log` VALUES ('4791', '4', 'AutoReply', 'AutoReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455946405');
INSERT INTO `dc_visit_log` VALUES ('4790', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455946402');
INSERT INTO `dc_visit_log` VALUES ('4789', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main.html', '1455946395');
INSERT INTO `dc_visit_log` VALUES ('4788', '4', 'Home', 'Message', 'add', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Message/add.html', '1455946349');
INSERT INTO `dc_visit_log` VALUES ('4787', '4', 'Home', 'Message', 'add', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Message/add.html', '1455945847');
INSERT INTO `dc_visit_log` VALUES ('4786', '4', 'Home', 'Material', 'material_lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Material/material_lists.html', '1455945846');
INSERT INTO `dc_visit_log` VALUES ('4785', '4', 'Home', 'WeixinMessage', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455945844');
INSERT INTO `dc_visit_log` VALUES ('4784', '4', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455945841');
INSERT INTO `dc_visit_log` VALUES ('4783', '4', 'Home', 'Message', 'add', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Message/add.html', '1455945835');
INSERT INTO `dc_visit_log` VALUES ('4782', '4', 'Home', 'Material', 'material_lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Material/material_lists.html', '1455945830');
INSERT INTO `dc_visit_log` VALUES ('4781', '4', 'Home', 'WeixinMessage', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455945829');
INSERT INTO `dc_visit_log` VALUES ('4780', '4', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455945827');
INSERT INTO `dc_visit_log` VALUES ('4779', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/4.html', '1455945824');
INSERT INTO `dc_visit_log` VALUES ('4778', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/5.html', '1455945822');
INSERT INTO `dc_visit_log` VALUES ('4777', '7', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455945817');
INSERT INTO `dc_visit_log` VALUES ('4776', '7', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455945812');
INSERT INTO `dc_visit_log` VALUES ('4775', '7', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"7\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/7.html', '1455945807');
INSERT INTO `dc_visit_log` VALUES ('4774', '7', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"7\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/7.html', '1455945266');
INSERT INTO `dc_visit_log` VALUES ('4773', '7', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"7\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/7.html', '1455945262');
INSERT INTO `dc_visit_log` VALUES ('4772', '7', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455945259');
INSERT INTO `dc_visit_log` VALUES ('4771', '7', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455945255');
INSERT INTO `dc_visit_log` VALUES ('4770', '7', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455945252');
INSERT INTO `dc_visit_log` VALUES ('4769', '7', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455945246');
INSERT INTO `dc_visit_log` VALUES ('4768', '7', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455945210');
INSERT INTO `dc_visit_log` VALUES ('4767', '7', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455945208');
INSERT INTO `dc_visit_log` VALUES ('4766', '7', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"7\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/7.html', '1455945197');
INSERT INTO `dc_visit_log` VALUES ('4765', '7', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"7\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/7.html', '1455945192');
INSERT INTO `dc_visit_log` VALUES ('4764', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455945180');
INSERT INTO `dc_visit_log` VALUES ('4763', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455945172');
INSERT INTO `dc_visit_log` VALUES ('4762', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455945171');
INSERT INTO `dc_visit_log` VALUES ('4761', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455945097');
INSERT INTO `dc_visit_log` VALUES ('4760', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455945087');
INSERT INTO `dc_visit_log` VALUES ('4759', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455945081');
INSERT INTO `dc_visit_log` VALUES ('4758', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455945022');
INSERT INTO `dc_visit_log` VALUES ('4757', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455945020');
INSERT INTO `dc_visit_log` VALUES ('4756', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455945016');
INSERT INTO `dc_visit_log` VALUES ('4755', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455945014');
INSERT INTO `dc_visit_log` VALUES ('4754', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455944997');
INSERT INTO `dc_visit_log` VALUES ('4753', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455944989');
INSERT INTO `dc_visit_log` VALUES ('4752', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455944985');
INSERT INTO `dc_visit_log` VALUES ('4751', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455944982');
INSERT INTO `dc_visit_log` VALUES ('4750', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455944978');
INSERT INTO `dc_visit_log` VALUES ('4749', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455944935');
INSERT INTO `dc_visit_log` VALUES ('4748', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455944931');
INSERT INTO `dc_visit_log` VALUES ('4747', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455944928');
INSERT INTO `dc_visit_log` VALUES ('4746', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455944924');
INSERT INTO `dc_visit_log` VALUES ('4745', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455944886');
INSERT INTO `dc_visit_log` VALUES ('4744', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455944832');
INSERT INTO `dc_visit_log` VALUES ('4743', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455944746');
INSERT INTO `dc_visit_log` VALUES ('4742', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455944743');
INSERT INTO `dc_visit_log` VALUES ('4741', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455944724');
INSERT INTO `dc_visit_log` VALUES ('4740', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455944722');
INSERT INTO `dc_visit_log` VALUES ('4739', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455944717');
INSERT INTO `dc_visit_log` VALUES ('4738', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455944711');
INSERT INTO `dc_visit_log` VALUES ('4737', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455944707');
INSERT INTO `dc_visit_log` VALUES ('4736', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455944700');
INSERT INTO `dc_visit_log` VALUES ('4735', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455944695');
INSERT INTO `dc_visit_log` VALUES ('4734', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455944694');
INSERT INTO `dc_visit_log` VALUES ('4733', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455944693');
INSERT INTO `dc_visit_log` VALUES ('4732', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455944689');
INSERT INTO `dc_visit_log` VALUES ('4731', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/5.html', '1455944687');
INSERT INTO `dc_visit_log` VALUES ('4730', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455944683');
INSERT INTO `dc_visit_log` VALUES ('4729', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455944675');
INSERT INTO `dc_visit_log` VALUES ('4728', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455944673');
INSERT INTO `dc_visit_log` VALUES ('4727', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455944672');
INSERT INTO `dc_visit_log` VALUES ('4726', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455944669');
INSERT INTO `dc_visit_log` VALUES ('4725', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455944667');
INSERT INTO `dc_visit_log` VALUES ('4724', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455944640');
INSERT INTO `dc_visit_log` VALUES ('4723', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455944635');
INSERT INTO `dc_visit_log` VALUES ('4722', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455944632');
INSERT INTO `dc_visit_log` VALUES ('4721', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455944630');
INSERT INTO `dc_visit_log` VALUES ('4720', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455944600');
INSERT INTO `dc_visit_log` VALUES ('4719', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455944591');
INSERT INTO `dc_visit_log` VALUES ('4718', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944585');
INSERT INTO `dc_visit_log` VALUES ('4717', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/5.html', '1455944581');
INSERT INTO `dc_visit_log` VALUES ('4716', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944564');
INSERT INTO `dc_visit_log` VALUES ('4715', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944556');
INSERT INTO `dc_visit_log` VALUES ('4714', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/5.html', '1455944554');
INSERT INTO `dc_visit_log` VALUES ('4713', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944363');
INSERT INTO `dc_visit_log` VALUES ('4712', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944359');
INSERT INTO `dc_visit_log` VALUES ('4711', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/5.html', '1455944357');
INSERT INTO `dc_visit_log` VALUES ('4710', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944356');
INSERT INTO `dc_visit_log` VALUES ('4709', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944352');
INSERT INTO `dc_visit_log` VALUES ('4708', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/5.html', '1455944350');
INSERT INTO `dc_visit_log` VALUES ('4707', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944348');
INSERT INTO `dc_visit_log` VALUES ('4706', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944308');
INSERT INTO `dc_visit_log` VALUES ('4705', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455944306');
INSERT INTO `dc_visit_log` VALUES ('4704', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455943363');
INSERT INTO `dc_visit_log` VALUES ('4703', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455943359');
INSERT INTO `dc_visit_log` VALUES ('4702', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455943355');
INSERT INTO `dc_visit_log` VALUES ('4701', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/4.html', '1455943074');
INSERT INTO `dc_visit_log` VALUES ('4700', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455943017');
INSERT INTO `dc_visit_log` VALUES ('4699', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455943010');
INSERT INTO `dc_visit_log` VALUES ('4698', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455942987');
INSERT INTO `dc_visit_log` VALUES ('4697', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455942965');
INSERT INTO `dc_visit_log` VALUES ('4696', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455942909');
INSERT INTO `dc_visit_log` VALUES ('4695', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455942899');
INSERT INTO `dc_visit_log` VALUES ('4694', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455942851');
INSERT INTO `dc_visit_log` VALUES ('4693', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/4.html', '1455941003');
INSERT INTO `dc_visit_log` VALUES ('4692', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/4.html', '1455940338');
INSERT INTO `dc_visit_log` VALUES ('4691', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/5.html', '1455940334');
INSERT INTO `dc_visit_log` VALUES ('4690', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940328');
INSERT INTO `dc_visit_log` VALUES ('4689', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940319');
INSERT INTO `dc_visit_log` VALUES ('4688', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940311');
INSERT INTO `dc_visit_log` VALUES ('4687', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940310');
INSERT INTO `dc_visit_log` VALUES ('4686', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940238');
INSERT INTO `dc_visit_log` VALUES ('4685', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940146');
INSERT INTO `dc_visit_log` VALUES ('4684', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940145');
INSERT INTO `dc_visit_log` VALUES ('4683', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940130');
INSERT INTO `dc_visit_log` VALUES ('4682', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940115');
INSERT INTO `dc_visit_log` VALUES ('4681', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940100');
INSERT INTO `dc_visit_log` VALUES ('4680', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940088');
INSERT INTO `dc_visit_log` VALUES ('4679', '6', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/home/index/main/publicid/6.html', '1455940017');
INSERT INTO `dc_visit_log` VALUES ('4678', '5', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455940011');
INSERT INTO `dc_visit_log` VALUES ('4677', '6', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"6\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/6.html', '1455939763');
INSERT INTO `dc_visit_log` VALUES ('4676', '6', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"6\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/6.html', '1455939627');
INSERT INTO `dc_visit_log` VALUES ('4675', '6', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"6\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/6.html', '1455939397');
INSERT INTO `dc_visit_log` VALUES ('4674', '6', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"6\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/6.html', '1455939393');
INSERT INTO `dc_visit_log` VALUES ('4673', '6', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"6\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/6.html', '1455939389');
INSERT INTO `dc_visit_log` VALUES ('4672', '6', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455939386');
INSERT INTO `dc_visit_log` VALUES ('4671', '6', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '{\"id\":\"6\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0/id/6.html', '1455939383');
INSERT INTO `dc_visit_log` VALUES ('4670', '6', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '{\"id\":\"6\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0/id/6.html', '1455939375');
INSERT INTO `dc_visit_log` VALUES ('4669', '6', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"6\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/6.html', '1455939370');
INSERT INTO `dc_visit_log` VALUES ('4668', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455939361');
INSERT INTO `dc_visit_log` VALUES ('4667', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455939357');
INSERT INTO `dc_visit_log` VALUES ('4666', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455939352');
INSERT INTO `dc_visit_log` VALUES ('4665', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455939346');
INSERT INTO `dc_visit_log` VALUES ('4664', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455939331');
INSERT INTO `dc_visit_log` VALUES ('4663', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455939330');
INSERT INTO `dc_visit_log` VALUES ('4662', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455939328');
INSERT INTO `dc_visit_log` VALUES ('4661', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455939323');
INSERT INTO `dc_visit_log` VALUES ('4660', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455939317');
INSERT INTO `dc_visit_log` VALUES ('4659', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455939315');
INSERT INTO `dc_visit_log` VALUES ('4658', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/5.html', '1455939308');
INSERT INTO `dc_visit_log` VALUES ('4657', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455939295');
INSERT INTO `dc_visit_log` VALUES ('4656', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/5.html', '1455939288');
INSERT INTO `dc_visit_log` VALUES ('4655', '5', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/5.html', '1455939282');
INSERT INTO `dc_visit_log` VALUES ('4654', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455939273');
INSERT INTO `dc_visit_log` VALUES ('4653', '5', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455939270');
INSERT INTO `dc_visit_log` VALUES ('4652', '5', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_0.html', '1455939267');
INSERT INTO `dc_visit_log` VALUES ('4651', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0/id/5.html', '1455939261');
INSERT INTO `dc_visit_log` VALUES ('4650', '5', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0/id/5.html', '1455939259');
INSERT INTO `dc_visit_log` VALUES ('4649', '5', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"5\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/5.html', '1455939252');
INSERT INTO `dc_visit_log` VALUES ('4648', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455939236');
INSERT INTO `dc_visit_log` VALUES ('4647', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455939234');
INSERT INTO `dc_visit_log` VALUES ('4646', '4', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455939232');
INSERT INTO `dc_visit_log` VALUES ('4645', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455939229');
INSERT INTO `dc_visit_log` VALUES ('4644', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/auto_bind_0.html', '1455939188');
INSERT INTO `dc_visit_log` VALUES ('4642', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/auto_bind_0.html', '1455939179');
INSERT INTO `dc_visit_log` VALUES ('4643', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/auto_bind_0.html', '1455939186');
INSERT INTO `dc_visit_log` VALUES ('4641', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/auto_bind_0.html', '1455939175');
INSERT INTO `dc_visit_log` VALUES ('4640', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455939165');
INSERT INTO `dc_visit_log` VALUES ('4639', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455939156');
INSERT INTO `dc_visit_log` VALUES ('4638', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455939155');
INSERT INTO `dc_visit_log` VALUES ('4637', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455939149');
INSERT INTO `dc_visit_log` VALUES ('4636', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455939118');
INSERT INTO `dc_visit_log` VALUES ('4635', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455939117');
INSERT INTO `dc_visit_log` VALUES ('4634', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455939102');
INSERT INTO `dc_visit_log` VALUES ('4633', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455939101');
INSERT INTO `dc_visit_log` VALUES ('4632', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455939095');
INSERT INTO `dc_visit_log` VALUES ('4631', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455939089');
INSERT INTO `dc_visit_log` VALUES ('4630', '4', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455939086');
INSERT INTO `dc_visit_log` VALUES ('4629', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455939075');
INSERT INTO `dc_visit_log` VALUES ('4628', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455939063');
INSERT INTO `dc_visit_log` VALUES ('4627', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455939059');
INSERT INTO `dc_visit_log` VALUES ('4626', '4', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455939057');
INSERT INTO `dc_visit_log` VALUES ('4625', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455939042');
INSERT INTO `dc_visit_log` VALUES ('4624', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455938978');
INSERT INTO `dc_visit_log` VALUES ('4623', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455938974');
INSERT INTO `dc_visit_log` VALUES ('4622', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455938968');
INSERT INTO `dc_visit_log` VALUES ('4621', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455938965');
INSERT INTO `dc_visit_log` VALUES ('4620', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455938960');
INSERT INTO `dc_visit_log` VALUES ('4619', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455938955');
INSERT INTO `dc_visit_log` VALUES ('4618', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455938938');
INSERT INTO `dc_visit_log` VALUES ('4617', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455938869');
INSERT INTO `dc_visit_log` VALUES ('4616', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455938645');
INSERT INTO `dc_visit_log` VALUES ('4615', '4', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/step_0.html', '1455938449');
INSERT INTO `dc_visit_log` VALUES ('4614', '4', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/step_0.html', '1455938443');
INSERT INTO `dc_visit_log` VALUES ('4613', '4', 'Home', 'Public', 'auto_bind_0', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/auto_bind_0.html', '1455938437');
INSERT INTO `dc_visit_log` VALUES ('4612', '4', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/step_0/id/4.html', '1455938432');
INSERT INTO `dc_visit_log` VALUES ('4611', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/step_1/id/4.html', '1455938431');
INSERT INTO `dc_visit_log` VALUES ('4610', '4', 'Home', 'Public', 'mp_interface', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/mp_interface/id/4.html', '1455938428');
INSERT INTO `dc_visit_log` VALUES ('4609', '4', 'Home', 'Public', 'step_1', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/step_1/id/4.html', '1455938425');
INSERT INTO `dc_visit_log` VALUES ('4608', '4', 'Home', 'Public', 'step_0', '2', '127.0.0.1', 'Google', '{\"id\":\"4\"}', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/step_0/id/4.html', '1455938421');
INSERT INTO `dc_visit_log` VALUES ('4607', '4', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Public/lists.html', '1455938385');
INSERT INTO `dc_visit_log` VALUES ('4606', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455938380');
INSERT INTO `dc_visit_log` VALUES ('4605', '4', 'Home', 'Public', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Public/lists.html', '1455938356');
INSERT INTO `dc_visit_log` VALUES ('4604', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat-copy/index.php?s=/Home/Index/main.html', '1455938307');
INSERT INTO `dc_visit_log` VALUES ('4603', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455938201');
INSERT INTO `dc_visit_log` VALUES ('4602', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455938199');
INSERT INTO `dc_visit_log` VALUES ('4601', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455938196');
INSERT INTO `dc_visit_log` VALUES ('4600', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0.html', '1455938085');
INSERT INTO `dc_visit_log` VALUES ('4599', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/step_0.html', '1455938000');
INSERT INTO `dc_visit_log` VALUES ('4598', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455937998');
INSERT INTO `dc_visit_log` VALUES ('4597', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455937995');
INSERT INTO `dc_visit_log` VALUES ('4596', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455937992');
INSERT INTO `dc_visit_log` VALUES ('4595', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455937990');
INSERT INTO `dc_visit_log` VALUES ('4594', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455937987');
INSERT INTO `dc_visit_log` VALUES ('4593', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455937984');
INSERT INTO `dc_visit_log` VALUES ('4592', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455937949');
INSERT INTO `dc_visit_log` VALUES ('4591', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455937926');
INSERT INTO `dc_visit_log` VALUES ('4590', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455937853');
INSERT INTO `dc_visit_log` VALUES ('4589', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455937847');
INSERT INTO `dc_visit_log` VALUES ('4588', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455937843');
INSERT INTO `dc_visit_log` VALUES ('4587', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455937824');
INSERT INTO `dc_visit_log` VALUES ('4586', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455937820');
INSERT INTO `dc_visit_log` VALUES ('4585', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455937266');
INSERT INTO `dc_visit_log` VALUES ('4584', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455937232');
INSERT INTO `dc_visit_log` VALUES ('4583', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455937140');
INSERT INTO `dc_visit_log` VALUES ('4582', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455937104');
INSERT INTO `dc_visit_log` VALUES ('4581', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455937094');
INSERT INTO `dc_visit_log` VALUES ('4580', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455937084');
INSERT INTO `dc_visit_log` VALUES ('4579', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936993');
INSERT INTO `dc_visit_log` VALUES ('4578', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936978');
INSERT INTO `dc_visit_log` VALUES ('4577', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936973');
INSERT INTO `dc_visit_log` VALUES ('4576', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936969');
INSERT INTO `dc_visit_log` VALUES ('4575', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936955');
INSERT INTO `dc_visit_log` VALUES ('4574', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936901');
INSERT INTO `dc_visit_log` VALUES ('4573', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936896');
INSERT INTO `dc_visit_log` VALUES ('4572', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936882');
INSERT INTO `dc_visit_log` VALUES ('4571', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936878');
INSERT INTO `dc_visit_log` VALUES ('4570', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936765');
INSERT INTO `dc_visit_log` VALUES ('4569', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936750');
INSERT INTO `dc_visit_log` VALUES ('4568', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936744');
INSERT INTO `dc_visit_log` VALUES ('4567', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936738');
INSERT INTO `dc_visit_log` VALUES ('4566', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936731');
INSERT INTO `dc_visit_log` VALUES ('4565', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936729');
INSERT INTO `dc_visit_log` VALUES ('4564', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936725');
INSERT INTO `dc_visit_log` VALUES ('4563', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936701');
INSERT INTO `dc_visit_log` VALUES ('4562', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936694');
INSERT INTO `dc_visit_log` VALUES ('4561', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936660');
INSERT INTO `dc_visit_log` VALUES ('4560', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936607');
INSERT INTO `dc_visit_log` VALUES ('4559', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936605');
INSERT INTO `dc_visit_log` VALUES ('4558', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936570');
INSERT INTO `dc_visit_log` VALUES ('4557', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936568');
INSERT INTO `dc_visit_log` VALUES ('4556', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936559');
INSERT INTO `dc_visit_log` VALUES ('4555', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936550');
INSERT INTO `dc_visit_log` VALUES ('4554', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936500');
INSERT INTO `dc_visit_log` VALUES ('4553', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936422');
INSERT INTO `dc_visit_log` VALUES ('4552', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936407');
INSERT INTO `dc_visit_log` VALUES ('4551', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936371');
INSERT INTO `dc_visit_log` VALUES ('4550', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936363');
INSERT INTO `dc_visit_log` VALUES ('4549', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936297');
INSERT INTO `dc_visit_log` VALUES ('4548', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455936234');
INSERT INTO `dc_visit_log` VALUES ('4547', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455936231');
INSERT INTO `dc_visit_log` VALUES ('4546', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455936229');
INSERT INTO `dc_visit_log` VALUES ('4545', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455936227');
INSERT INTO `dc_visit_log` VALUES ('4544', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455936138');
INSERT INTO `dc_visit_log` VALUES ('4543', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455936111');
INSERT INTO `dc_visit_log` VALUES ('4542', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455935522');
INSERT INTO `dc_visit_log` VALUES ('4541', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455935421');
INSERT INTO `dc_visit_log` VALUES ('4540', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455934510');
INSERT INTO `dc_visit_log` VALUES ('4539', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455933848');
INSERT INTO `dc_visit_log` VALUES ('4538', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933803');
INSERT INTO `dc_visit_log` VALUES ('4537', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455933800');
INSERT INTO `dc_visit_log` VALUES ('4536', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455933796');
INSERT INTO `dc_visit_log` VALUES ('4535', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455933794');
INSERT INTO `dc_visit_log` VALUES ('4534', '4', 'Home', 'PublicLink', 'lists', '2', '::1', 'Google', '{\"mp_id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/PublicLink/lists/mp_id/4.html', '1455933792');
INSERT INTO `dc_visit_log` VALUES ('4533', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455933789');
INSERT INTO `dc_visit_log` VALUES ('4532', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/step_0.html', '1455933780');
INSERT INTO `dc_visit_log` VALUES ('4531', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/step_0.html', '1455933774');
INSERT INTO `dc_visit_log` VALUES ('4530', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455933772');
INSERT INTO `dc_visit_log` VALUES ('4529', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455933770');
INSERT INTO `dc_visit_log` VALUES ('4528', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455933764');
INSERT INTO `dc_visit_log` VALUES ('4527', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455933763');
INSERT INTO `dc_visit_log` VALUES ('4526', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455933761');
INSERT INTO `dc_visit_log` VALUES ('4525', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455933756');
INSERT INTO `dc_visit_log` VALUES ('4524', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933749');
INSERT INTO `dc_visit_log` VALUES ('4523', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933729');
INSERT INTO `dc_visit_log` VALUES ('4522', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933671');
INSERT INTO `dc_visit_log` VALUES ('4521', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933651');
INSERT INTO `dc_visit_log` VALUES ('4520', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933645');
INSERT INTO `dc_visit_log` VALUES ('4519', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933639');
INSERT INTO `dc_visit_log` VALUES ('4518', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933634');
INSERT INTO `dc_visit_log` VALUES ('4517', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933621');
INSERT INTO `dc_visit_log` VALUES ('4516', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933606');
INSERT INTO `dc_visit_log` VALUES ('4515', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933573');
INSERT INTO `dc_visit_log` VALUES ('4514', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455933570');
INSERT INTO `dc_visit_log` VALUES ('4513', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455933567');
INSERT INTO `dc_visit_log` VALUES ('4512', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933535');
INSERT INTO `dc_visit_log` VALUES ('4511', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933523');
INSERT INTO `dc_visit_log` VALUES ('4510', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933517');
INSERT INTO `dc_visit_log` VALUES ('4509', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933509');
INSERT INTO `dc_visit_log` VALUES ('4508', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455933438');
INSERT INTO `dc_visit_log` VALUES ('4507', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455932895');
INSERT INTO `dc_visit_log` VALUES ('4506', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455932891');
INSERT INTO `dc_visit_log` VALUES ('4505', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/step_0.html', '1455932889');
INSERT INTO `dc_visit_log` VALUES ('4504', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/step_0.html', '1455932875');
INSERT INTO `dc_visit_log` VALUES ('4503', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/step_0.html', '1455932627');
INSERT INTO `dc_visit_log` VALUES ('4502', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/step_0.html', '1455932621');
INSERT INTO `dc_visit_log` VALUES ('4501', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455932616');
INSERT INTO `dc_visit_log` VALUES ('4500', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455932614');
INSERT INTO `dc_visit_log` VALUES ('4499', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455932613');
INSERT INTO `dc_visit_log` VALUES ('4498', '4', 'Home', 'Public', 'auto_bind_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/auto_bind_0/id/4.html', '1455932610');
INSERT INTO `dc_visit_log` VALUES ('4497', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455932598');
INSERT INTO `dc_visit_log` VALUES ('4496', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455932592');
INSERT INTO `dc_visit_log` VALUES ('4495', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455932566');
INSERT INTO `dc_visit_log` VALUES ('4494', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455898086');
INSERT INTO `dc_visit_log` VALUES ('4493', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455898083');
INSERT INTO `dc_visit_log` VALUES ('4492', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455898080');
INSERT INTO `dc_visit_log` VALUES ('4491', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/1.html', '1455898078');
INSERT INTO `dc_visit_log` VALUES ('4490', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455898074');
INSERT INTO `dc_visit_log` VALUES ('4489', '4', 'CustomMenu', 'CustomMenu', 'edit', '2', '::1', 'Google', '{\"menu_id\":\"2\",\"id\":\"3\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/edit/menu_id/2/id/3.html', '1455898069');
INSERT INTO `dc_visit_log` VALUES ('4488', '4', 'CustomMenu', 'CustomMenu', 'edit', '2', '::1', 'Google', '{\"menu_id\":\"2\",\"id\":\"3\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/edit/menu_id/2/id/3.html', '1455898063');
INSERT INTO `dc_visit_log` VALUES ('4487', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/2.html', '1455898015');
INSERT INTO `dc_visit_log` VALUES ('4486', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/2.html', '1455898008');
INSERT INTO `dc_visit_log` VALUES ('4485', '4', 'CustomMenu', 'CustomMenu', 'edit', '2', '::1', 'Google', '{\"menu_id\":\"2\",\"id\":\"3\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/edit/menu_id/2/id/3.html', '1455897981');
INSERT INTO `dc_visit_log` VALUES ('4484', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/2.html', '1455897978');
INSERT INTO `dc_visit_log` VALUES ('4483', '4', 'CustomMenu', 'CustomMenu', 'edit', '2', '::1', 'Google', '{\"menu_id\":\"2\",\"id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/edit/menu_id/2/id/2.html', '1455897945');
INSERT INTO `dc_visit_log` VALUES ('4482', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists.html', '1455897942');
INSERT INTO `dc_visit_log` VALUES ('4481', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455897897');
INSERT INTO `dc_visit_log` VALUES ('4480', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455897896');
INSERT INTO `dc_visit_log` VALUES ('4479', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455897894');
INSERT INTO `dc_visit_log` VALUES ('4478', '4', 'Home', 'Public', 'step_1', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_1/id/4.html', '1455897891');
INSERT INTO `dc_visit_log` VALUES ('4477', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455897842');
INSERT INTO `dc_visit_log` VALUES ('4476', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455897839');
INSERT INTO `dc_visit_log` VALUES ('4475', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455897739');
INSERT INTO `dc_visit_log` VALUES ('4474', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/2.html', '1455897732');
INSERT INTO `dc_visit_log` VALUES ('4473', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/2.html', '1455897727');
INSERT INTO `dc_visit_log` VALUES ('4472', '4', 'CustomMenu', 'CustomMenu', 'add', '2', '::1', 'Google', '{\"menu_id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/add/menu_id/2.html', '1455897706');
INSERT INTO `dc_visit_log` VALUES ('4471', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/2.html', '1455897700');
INSERT INTO `dc_visit_log` VALUES ('4470', '4', 'CustomMenu', 'CustomMenu', 'add', '2', '::1', 'Google', '{\"menu_id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/add/menu_id/2.html', '1455897673');
INSERT INTO `dc_visit_log` VALUES ('4469', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"2\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/2.html', '1455897661');
INSERT INTO `dc_visit_log` VALUES ('4468', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455897657');
INSERT INTO `dc_visit_log` VALUES ('4467', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455897641');
INSERT INTO `dc_visit_log` VALUES ('4466', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists.html', '1455897638');
INSERT INTO `dc_visit_log` VALUES ('4465', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455897592');
INSERT INTO `dc_visit_log` VALUES ('4464', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists.html', '1455897587');
INSERT INTO `dc_visit_log` VALUES ('4463', '4', 'CustomMenu', 'CustomMenu', 'edit', '2', '::1', 'Google', '{\"menu_id\":\"1\",\"id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/edit/menu_id/1/id/1.html', '1455897583');
INSERT INTO `dc_visit_log` VALUES ('4462', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/1.html', '1455897513');
INSERT INTO `dc_visit_log` VALUES ('4461', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/1.html', '1455897508');
INSERT INTO `dc_visit_log` VALUES ('4460', '4', 'CustomMenu', 'CustomMenu', 'edit', '2', '::1', 'Google', '{\"menu_id\":\"1\",\"id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/edit/menu_id/1/id/1.html', '1455897489');
INSERT INTO `dc_visit_log` VALUES ('4459', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/1.html', '1455897475');
INSERT INTO `dc_visit_log` VALUES ('4458', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455897473');
INSERT INTO `dc_visit_log` VALUES ('4457', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455897471');
INSERT INTO `dc_visit_log` VALUES ('4456', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455897469');
INSERT INTO `dc_visit_log` VALUES ('4455', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455897462');
INSERT INTO `dc_visit_log` VALUES ('4454', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455897461');
INSERT INTO `dc_visit_log` VALUES ('4453', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455897458');
INSERT INTO `dc_visit_log` VALUES ('4452', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455897455');
INSERT INTO `dc_visit_log` VALUES ('4451', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455897442');
INSERT INTO `dc_visit_log` VALUES ('4450', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455897441');
INSERT INTO `dc_visit_log` VALUES ('4449', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455897439');
INSERT INTO `dc_visit_log` VALUES ('4448', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455897437');
INSERT INTO `dc_visit_log` VALUES ('4447', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455897435');
INSERT INTO `dc_visit_log` VALUES ('4446', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455897432');
INSERT INTO `dc_visit_log` VALUES ('4445', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455897431');
INSERT INTO `dc_visit_log` VALUES ('4444', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455897428');
INSERT INTO `dc_visit_log` VALUES ('4443', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455897391');
INSERT INTO `dc_visit_log` VALUES ('4442', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455897375');
INSERT INTO `dc_visit_log` VALUES ('4441', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455897368');
INSERT INTO `dc_visit_log` VALUES ('4440', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455897356');
INSERT INTO `dc_visit_log` VALUES ('4439', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455897350');
INSERT INTO `dc_visit_log` VALUES ('4438', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455897341');
INSERT INTO `dc_visit_log` VALUES ('4437', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455897340');
INSERT INTO `dc_visit_log` VALUES ('4436', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists/model/custom_reply_news.html', '1455897338');
INSERT INTO `dc_visit_log` VALUES ('4435', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/custom_reply_news.html', '1455897331');
INSERT INTO `dc_visit_log` VALUES ('4434', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists/model/custom_reply_news.html', '1455897329');
INSERT INTO `dc_visit_log` VALUES ('4433', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/custom_reply_news.html', '1455897321');
INSERT INTO `dc_visit_log` VALUES ('4432', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists/model/custom_reply_news.html', '1455897313');
INSERT INTO `dc_visit_log` VALUES ('4431', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists/model/custom_reply_news.html', '1455897306');
INSERT INTO `dc_visit_log` VALUES ('4430', '4', 'CustomReply', 'CustomReply', 'edit', '2', '::1', 'Google', '{\"id\":\"7\",\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/edit/id/7/model/1290.html', '1455897300');
INSERT INTO `dc_visit_log` VALUES ('4429', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455897286');
INSERT INTO `dc_visit_log` VALUES ('4428', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455897284');
INSERT INTO `dc_visit_log` VALUES ('4427', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455897276');
INSERT INTO `dc_visit_log` VALUES ('4426', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455897269');
INSERT INTO `dc_visit_log` VALUES ('4425', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455897260');
INSERT INTO `dc_visit_log` VALUES ('4424', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"26\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/edit/id/26/model/custom_reply_text.html', '1455897255');
INSERT INTO `dc_visit_log` VALUES ('4423', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455897249');
INSERT INTO `dc_visit_log` VALUES ('4422', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"26\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/edit/id/26/model/custom_reply_text.html', '1455897245');
INSERT INTO `dc_visit_log` VALUES ('4421', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455897242');
INSERT INTO `dc_visit_log` VALUES ('4420', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"26\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/edit/id/26/model/custom_reply_text.html', '1455897238');
INSERT INTO `dc_visit_log` VALUES ('4419', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455897235');
INSERT INTO `dc_visit_log` VALUES ('4418', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1291\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455897223');
INSERT INTO `dc_visit_log` VALUES ('4417', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455897218');
INSERT INTO `dc_visit_log` VALUES ('4416', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455897187');
INSERT INTO `dc_visit_log` VALUES ('4415', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455897185');
INSERT INTO `dc_visit_log` VALUES ('4414', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455897183');
INSERT INTO `dc_visit_log` VALUES ('4413', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455897182');
INSERT INTO `dc_visit_log` VALUES ('4412', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455897179');
INSERT INTO `dc_visit_log` VALUES ('4411', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455897176');
INSERT INTO `dc_visit_log` VALUES ('4410', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455897173');
INSERT INTO `dc_visit_log` VALUES ('4409', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455897171');
INSERT INTO `dc_visit_log` VALUES ('4408', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455897168');
INSERT INTO `dc_visit_log` VALUES ('4407', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455897146');
INSERT INTO `dc_visit_log` VALUES ('4406', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455897137');
INSERT INTO `dc_visit_log` VALUES ('4405', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455897066');
INSERT INTO `dc_visit_log` VALUES ('4404', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455897055');
INSERT INTO `dc_visit_log` VALUES ('4403', '4', 'Home', 'WeixinMessage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455897052');
INSERT INTO `dc_visit_log` VALUES ('4402', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455897051');
INSERT INTO `dc_visit_log` VALUES ('4401', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455897045');
INSERT INTO `dc_visit_log` VALUES ('4400', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455896161');
INSERT INTO `dc_visit_log` VALUES ('4399', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455877731');
INSERT INTO `dc_visit_log` VALUES ('4398', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455877729');
INSERT INTO `dc_visit_log` VALUES ('4397', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455877726');
INSERT INTO `dc_visit_log` VALUES ('4396', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455877725');
INSERT INTO `dc_visit_log` VALUES ('4395', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455877137');
INSERT INTO `dc_visit_log` VALUES ('4394', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455877135');
INSERT INTO `dc_visit_log` VALUES ('4393', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455877134');
INSERT INTO `dc_visit_log` VALUES ('4392', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455877126');
INSERT INTO `dc_visit_log` VALUES ('4391', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455877124');
INSERT INTO `dc_visit_log` VALUES ('4390', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455877122');
INSERT INTO `dc_visit_log` VALUES ('4389', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1291\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455877110');
INSERT INTO `dc_visit_log` VALUES ('4388', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455877108');
INSERT INTO `dc_visit_log` VALUES ('4387', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455877066');
INSERT INTO `dc_visit_log` VALUES ('4386', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455877065');
INSERT INTO `dc_visit_log` VALUES ('4385', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455877051');
INSERT INTO `dc_visit_log` VALUES ('4383', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455877049');
INSERT INTO `dc_visit_log` VALUES ('4384', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455877050');
INSERT INTO `dc_visit_log` VALUES ('4382', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455877036');
INSERT INTO `dc_visit_log` VALUES ('4381', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455877034');
INSERT INTO `dc_visit_log` VALUES ('4380', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455877032');
INSERT INTO `dc_visit_log` VALUES ('4379', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876873');
INSERT INTO `dc_visit_log` VALUES ('4378', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876868');
INSERT INTO `dc_visit_log` VALUES ('4377', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876867');
INSERT INTO `dc_visit_log` VALUES ('4376', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists/model/custom_reply_news.html', '1455876858');
INSERT INTO `dc_visit_log` VALUES ('4375', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455876852');
INSERT INTO `dc_visit_log` VALUES ('4374', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876850');
INSERT INTO `dc_visit_log` VALUES ('4373', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876847');
INSERT INTO `dc_visit_log` VALUES ('4372', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876844');
INSERT INTO `dc_visit_log` VALUES ('4371', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876838');
INSERT INTO `dc_visit_log` VALUES ('4370', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876810');
INSERT INTO `dc_visit_log` VALUES ('4369', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"2\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/2/model/1289.html', '1455876806');
INSERT INTO `dc_visit_log` VALUES ('4368', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876803');
INSERT INTO `dc_visit_log` VALUES ('4367', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"2\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/2/model/1289.html', '1455876799');
INSERT INTO `dc_visit_log` VALUES ('4366', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876796');
INSERT INTO `dc_visit_log` VALUES ('4365', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"2\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/2/model/1289.html', '1455876793');
INSERT INTO `dc_visit_log` VALUES ('4364', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"2\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/2/model/1289.html', '1455876770');
INSERT INTO `dc_visit_log` VALUES ('4363', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876769');
INSERT INTO `dc_visit_log` VALUES ('4362', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455876766');
INSERT INTO `dc_visit_log` VALUES ('4361', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1291\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455876765');
INSERT INTO `dc_visit_log` VALUES ('4360', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455876763');
INSERT INTO `dc_visit_log` VALUES ('4359', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"2\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/2/model/1289.html', '1455876751');
INSERT INTO `dc_visit_log` VALUES ('4358', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"2\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/2/model/1289.html', '1455876703');
INSERT INTO `dc_visit_log` VALUES ('4357', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876700');
INSERT INTO `dc_visit_log` VALUES ('4356', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876679');
INSERT INTO `dc_visit_log` VALUES ('4355', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876670');
INSERT INTO `dc_visit_log` VALUES ('4354', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876667');
INSERT INTO `dc_visit_log` VALUES ('4353', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876654');
INSERT INTO `dc_visit_log` VALUES ('4352', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876652');
INSERT INTO `dc_visit_log` VALUES ('4351', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876606');
INSERT INTO `dc_visit_log` VALUES ('4350', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876599');
INSERT INTO `dc_visit_log` VALUES ('4349', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876565');
INSERT INTO `dc_visit_log` VALUES ('4348', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876516');
INSERT INTO `dc_visit_log` VALUES ('4347', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876514');
INSERT INTO `dc_visit_log` VALUES ('4346', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876512');
INSERT INTO `dc_visit_log` VALUES ('4345', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455876508');
INSERT INTO `dc_visit_log` VALUES ('4344', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876505');
INSERT INTO `dc_visit_log` VALUES ('4343', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455876499');
INSERT INTO `dc_visit_log` VALUES ('4342', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876497');
INSERT INTO `dc_visit_log` VALUES ('4341', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455876443');
INSERT INTO `dc_visit_log` VALUES ('4340', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876441');
INSERT INTO `dc_visit_log` VALUES ('4339', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876434');
INSERT INTO `dc_visit_log` VALUES ('4338', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876420');
INSERT INTO `dc_visit_log` VALUES ('4337', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455876410');
INSERT INTO `dc_visit_log` VALUES ('4336', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876392');
INSERT INTO `dc_visit_log` VALUES ('4335', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876390');
INSERT INTO `dc_visit_log` VALUES ('4334', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455876384');
INSERT INTO `dc_visit_log` VALUES ('4333', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876382');
INSERT INTO `dc_visit_log` VALUES ('4332', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876281');
INSERT INTO `dc_visit_log` VALUES ('4331', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"1\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/1/model/1289.html', '1455876271');
INSERT INTO `dc_visit_log` VALUES ('4330', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"1\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/1/model/1289.html', '1455876258');
INSERT INTO `dc_visit_log` VALUES ('4329', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876257');
INSERT INTO `dc_visit_log` VALUES ('4328', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876237');
INSERT INTO `dc_visit_log` VALUES ('4327', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"1\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/1/model/1289.html', '1455876224');
INSERT INTO `dc_visit_log` VALUES ('4326', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876220');
INSERT INTO `dc_visit_log` VALUES ('4325', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876215');
INSERT INTO `dc_visit_log` VALUES ('4324', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876201');
INSERT INTO `dc_visit_log` VALUES ('4323', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876180');
INSERT INTO `dc_visit_log` VALUES ('4322', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455876178');
INSERT INTO `dc_visit_log` VALUES ('4321', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876176');
INSERT INTO `dc_visit_log` VALUES ('4320', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455876174');
INSERT INTO `dc_visit_log` VALUES ('4319', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876173');
INSERT INTO `dc_visit_log` VALUES ('4318', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876167');
INSERT INTO `dc_visit_log` VALUES ('4317', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876165');
INSERT INTO `dc_visit_log` VALUES ('4316', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876164');
INSERT INTO `dc_visit_log` VALUES ('4315', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455876163');
INSERT INTO `dc_visit_log` VALUES ('4314', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876151');
INSERT INTO `dc_visit_log` VALUES ('4313', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455876103');
INSERT INTO `dc_visit_log` VALUES ('4312', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875993');
INSERT INTO `dc_visit_log` VALUES ('4311', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875954');
INSERT INTO `dc_visit_log` VALUES ('4310', '4', 'CustomReply', 'CustomReplyMult', 'edit', '2', '::1', 'Google', '{\"id\":\"1\",\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/edit/id/1/model/1289.html', '1455875951');
INSERT INTO `dc_visit_log` VALUES ('4309', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875948');
INSERT INTO `dc_visit_log` VALUES ('4308', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455875936');
INSERT INTO `dc_visit_log` VALUES ('4307', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875934');
INSERT INTO `dc_visit_log` VALUES ('4306', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists/model/custom_reply_news.html', '1455875932');
INSERT INTO `dc_visit_log` VALUES ('4305', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455875923');
INSERT INTO `dc_visit_log` VALUES ('4304', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875920');
INSERT INTO `dc_visit_log` VALUES ('4303', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455875910');
INSERT INTO `dc_visit_log` VALUES ('4302', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455875894');
INSERT INTO `dc_visit_log` VALUES ('4301', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1289\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1289.html', '1455875841');
INSERT INTO `dc_visit_log` VALUES ('4300', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875838');
INSERT INTO `dc_visit_log` VALUES ('4299', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875835');
INSERT INTO `dc_visit_log` VALUES ('4298', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875772');
INSERT INTO `dc_visit_log` VALUES ('4297', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875755');
INSERT INTO `dc_visit_log` VALUES ('4296', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875754');
INSERT INTO `dc_visit_log` VALUES ('4295', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455875751');
INSERT INTO `dc_visit_log` VALUES ('4294', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875749');
INSERT INTO `dc_visit_log` VALUES ('4293', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455875747');
INSERT INTO `dc_visit_log` VALUES ('4292', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875743');
INSERT INTO `dc_visit_log` VALUES ('4291', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875741');
INSERT INTO `dc_visit_log` VALUES ('4290', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists/model/custom_reply_news.html', '1455875722');
INSERT INTO `dc_visit_log` VALUES ('4289', '4', 'CustomReply', 'CustomReply', 'edit', '2', '::1', 'Google', '{\"id\":\"1\",\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/edit/id/1/model/1290.html', '1455875715');
INSERT INTO `dc_visit_log` VALUES ('4288', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875712');
INSERT INTO `dc_visit_log` VALUES ('4287', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875709');
INSERT INTO `dc_visit_log` VALUES ('4286', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875700');
INSERT INTO `dc_visit_log` VALUES ('4285', '4', 'CustomReply', 'CustomReply', 'edit', '2', '::1', 'Google', '{\"id\":\"1\",\"model\":\"1290\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/edit/id/1/model/1290.html', '1455875698');
INSERT INTO `dc_visit_log` VALUES ('4284', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875695');
INSERT INTO `dc_visit_log` VALUES ('4283', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875672');
INSERT INTO `dc_visit_log` VALUES ('4282', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875667');
INSERT INTO `dc_visit_log` VALUES ('4281', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875514');
INSERT INTO `dc_visit_log` VALUES ('4280', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455875484');
INSERT INTO `dc_visit_log` VALUES ('4279', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875480');
INSERT INTO `dc_visit_log` VALUES ('4278', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455875474');
INSERT INTO `dc_visit_log` VALUES ('4277', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875472');
INSERT INTO `dc_visit_log` VALUES ('4276', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455875382');
INSERT INTO `dc_visit_log` VALUES ('4275', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"25\",\"model\":\"1291\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/edit/id/25/model/1291.html', '1455875351');
INSERT INTO `dc_visit_log` VALUES ('4274', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455875349');
INSERT INTO `dc_visit_log` VALUES ('4273', '4', 'CustomReply', 'CustomReply', 'edit', '2', '::1', 'Google', '{\"id\":\"1\",\"model\":\"1290\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/edit/id/1/model/1290.html', '1455875346');
INSERT INTO `dc_visit_log` VALUES ('4272', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875113');
INSERT INTO `dc_visit_log` VALUES ('4271', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455875110');
INSERT INTO `dc_visit_log` VALUES ('4270', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"25\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/edit/id/25/model/custom_reply_text.html', '1455875104');
INSERT INTO `dc_visit_log` VALUES ('4269', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455875089');
INSERT INTO `dc_visit_log` VALUES ('4268', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"25\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/edit/id/25/model/custom_reply_text.html', '1455875083');
INSERT INTO `dc_visit_log` VALUES ('4267', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455875072');
INSERT INTO `dc_visit_log` VALUES ('4266', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1291\"}', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455875060');
INSERT INTO `dc_visit_log` VALUES ('4265', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455875054');
INSERT INTO `dc_visit_log` VALUES ('4264', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455875052');
INSERT INTO `dc_visit_log` VALUES ('4263', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455875050');
INSERT INTO `dc_visit_log` VALUES ('4262', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874911');
INSERT INTO `dc_visit_log` VALUES ('4261', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455874909');
INSERT INTO `dc_visit_log` VALUES ('4260', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874906');
INSERT INTO `dc_visit_log` VALUES ('4259', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455874905');
INSERT INTO `dc_visit_log` VALUES ('4258', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874902');
INSERT INTO `dc_visit_log` VALUES ('4257', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat//index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455874900');
INSERT INTO `dc_visit_log` VALUES ('4256', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455874845');
INSERT INTO `dc_visit_log` VALUES ('4255', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874839');
INSERT INTO `dc_visit_log` VALUES ('4254', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455874836');
INSERT INTO `dc_visit_log` VALUES ('4253', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874781');
INSERT INTO `dc_visit_log` VALUES ('4252', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874781');
INSERT INTO `dc_visit_log` VALUES ('4251', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874779');
INSERT INTO `dc_visit_log` VALUES ('4250', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874740');
INSERT INTO `dc_visit_log` VALUES ('4249', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455874528');
INSERT INTO `dc_visit_log` VALUES ('4248', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874515');
INSERT INTO `dc_visit_log` VALUES ('4247', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455874513');
INSERT INTO `dc_visit_log` VALUES ('4246', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874444');
INSERT INTO `dc_visit_log` VALUES ('4245', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455874443');
INSERT INTO `dc_visit_log` VALUES ('4244', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_news\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists/model/custom_reply_news.html', '1455874250');
INSERT INTO `dc_visit_log` VALUES ('4243', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455874222');
INSERT INTO `dc_visit_log` VALUES ('4242', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874219');
INSERT INTO `dc_visit_log` VALUES ('4241', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455874217');
INSERT INTO `dc_visit_log` VALUES ('4240', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1291\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455874215');
INSERT INTO `dc_visit_log` VALUES ('4239', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455874200');
INSERT INTO `dc_visit_log` VALUES ('4238', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455874199');
INSERT INTO `dc_visit_log` VALUES ('4237', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455874196');
INSERT INTO `dc_visit_log` VALUES ('4236', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1291\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455874194');
INSERT INTO `dc_visit_log` VALUES ('4235', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455874191');
INSERT INTO `dc_visit_log` VALUES ('4234', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455874189');
INSERT INTO `dc_visit_log` VALUES ('4233', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455874179');
INSERT INTO `dc_visit_log` VALUES ('4232', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455874112');
INSERT INTO `dc_visit_log` VALUES ('4231', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455874109');
INSERT INTO `dc_visit_log` VALUES ('4230', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455874099');
INSERT INTO `dc_visit_log` VALUES ('4229', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455874094');
INSERT INTO `dc_visit_log` VALUES ('4228', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455874071');
INSERT INTO `dc_visit_log` VALUES ('4227', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873991');
INSERT INTO `dc_visit_log` VALUES ('4226', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873985');
INSERT INTO `dc_visit_log` VALUES ('4225', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873980');
INSERT INTO `dc_visit_log` VALUES ('4224', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873962');
INSERT INTO `dc_visit_log` VALUES ('4223', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873956');
INSERT INTO `dc_visit_log` VALUES ('4222', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873768');
INSERT INTO `dc_visit_log` VALUES ('4221', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873765');
INSERT INTO `dc_visit_log` VALUES ('4220', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873762');
INSERT INTO `dc_visit_log` VALUES ('4219', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873682');
INSERT INTO `dc_visit_log` VALUES ('4218', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873677');
INSERT INTO `dc_visit_log` VALUES ('4217', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873646');
INSERT INTO `dc_visit_log` VALUES ('4216', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873630');
INSERT INTO `dc_visit_log` VALUES ('4215', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873617');
INSERT INTO `dc_visit_log` VALUES ('4214', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873609');
INSERT INTO `dc_visit_log` VALUES ('4213', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873608');
INSERT INTO `dc_visit_log` VALUES ('4212', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873581');
INSERT INTO `dc_visit_log` VALUES ('4211', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873561');
INSERT INTO `dc_visit_log` VALUES ('4210', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873556');
INSERT INTO `dc_visit_log` VALUES ('4209', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873528');
INSERT INTO `dc_visit_log` VALUES ('4208', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873524');
INSERT INTO `dc_visit_log` VALUES ('4207', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873452');
INSERT INTO `dc_visit_log` VALUES ('4206', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873448');
INSERT INTO `dc_visit_log` VALUES ('4205', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873438');
INSERT INTO `dc_visit_log` VALUES ('4204', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873437');
INSERT INTO `dc_visit_log` VALUES ('4203', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873435');
INSERT INTO `dc_visit_log` VALUES ('4202', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873393');
INSERT INTO `dc_visit_log` VALUES ('4201', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873388');
INSERT INTO `dc_visit_log` VALUES ('4200', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873370');
INSERT INTO `dc_visit_log` VALUES ('4199', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873365');
INSERT INTO `dc_visit_log` VALUES ('4198', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873220');
INSERT INTO `dc_visit_log` VALUES ('4197', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873215');
INSERT INTO `dc_visit_log` VALUES ('4196', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873190');
INSERT INTO `dc_visit_log` VALUES ('4195', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873184');
INSERT INTO `dc_visit_log` VALUES ('4194', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455873177');
INSERT INTO `dc_visit_log` VALUES ('4193', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455873154');
INSERT INTO `dc_visit_log` VALUES ('4192', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1291\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455873149');
INSERT INTO `dc_visit_log` VALUES ('4191', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455873147');
INSERT INTO `dc_visit_log` VALUES ('4190', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1290\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455873144');
INSERT INTO `dc_visit_log` VALUES ('4189', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455873142');
INSERT INTO `dc_visit_log` VALUES ('4188', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455873137');
INSERT INTO `dc_visit_log` VALUES ('4187', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872990');
INSERT INTO `dc_visit_log` VALUES ('4186', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872987');
INSERT INTO `dc_visit_log` VALUES ('4185', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455872983');
INSERT INTO `dc_visit_log` VALUES ('4184', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872955');
INSERT INTO `dc_visit_log` VALUES ('4183', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1291\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455872950');
INSERT INTO `dc_visit_log` VALUES ('4182', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455872948');
INSERT INTO `dc_visit_log` VALUES ('4181', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455872946');
INSERT INTO `dc_visit_log` VALUES ('4180', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '{\"model\":\"1274\"}', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455872942');
INSERT INTO `dc_visit_log` VALUES ('4179', '4', 'Weather', 'Weather', 'add', '2', '::1', 'Google', '{\"model\":\"1274\"}', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/add/model/1274.html', '1455872746');
INSERT INTO `dc_visit_log` VALUES ('4178', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '{\"model\":\"1274\"}', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455872738');
INSERT INTO `dc_visit_log` VALUES ('4177', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '{\"model\":\"1274\"}', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455872697');
INSERT INTO `dc_visit_log` VALUES ('4176', '4', 'Weather', 'Weather', 'edit', '2', '::1', 'Google', '{\"id\":\"7\",\"model\":\"1274\"}', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/edit/id/7/model/1274.html', '1455872696');
INSERT INTO `dc_visit_log` VALUES ('4175', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '{\"model\":\"1274\"}', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455872687');
INSERT INTO `dc_visit_log` VALUES ('4174', '4', 'Weather', 'Weather', 'add', '2', '::1', 'Google', '{\"model\":\"1274\"}', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/add/model/1274.html', '1455872678');
INSERT INTO `dc_visit_log` VALUES ('4173', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455872676');
INSERT INTO `dc_visit_log` VALUES ('4172', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455872608');
INSERT INTO `dc_visit_log` VALUES ('4171', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872554');
INSERT INTO `dc_visit_log` VALUES ('4170', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455872548');
INSERT INTO `dc_visit_log` VALUES ('4169', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872544');
INSERT INTO `dc_visit_log` VALUES ('4168', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872527');
INSERT INTO `dc_visit_log` VALUES ('4167', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455872518');
INSERT INTO `dc_visit_log` VALUES ('4166', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872512');
INSERT INTO `dc_visit_log` VALUES ('4165', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872478');
INSERT INTO `dc_visit_log` VALUES ('4164', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872448');
INSERT INTO `dc_visit_log` VALUES ('4163', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"5\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/edit/id/5/model/custom_reply_text.html', '1455872432');
INSERT INTO `dc_visit_log` VALUES ('4162', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872426');
INSERT INTO `dc_visit_log` VALUES ('4161', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"5\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/edit/id/5/model/custom_reply_text.html', '1455872420');
INSERT INTO `dc_visit_log` VALUES ('4160', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455872410');
INSERT INTO `dc_visit_log` VALUES ('4159', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"5\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/edit/id/5/model/custom_reply_text.html', '1455872271');
INSERT INTO `dc_visit_log` VALUES ('4158', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"5\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/edit/id/5/model/custom_reply_text.html', '1455872063');
INSERT INTO `dc_visit_log` VALUES ('4157', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871989');
INSERT INTO `dc_visit_log` VALUES ('4156', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455871980');
INSERT INTO `dc_visit_log` VALUES ('4155', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871972');
INSERT INTO `dc_visit_log` VALUES ('4154', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '::1', 'Google', '{\"id\":\"5\",\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/edit/id/5/model/custom_reply_text.html', '1455871970');
INSERT INTO `dc_visit_log` VALUES ('4153', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871958');
INSERT INTO `dc_visit_log` VALUES ('4152', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871954');
INSERT INTO `dc_visit_log` VALUES ('4151', '4', 'CustomReply', 'CustomReplyText', 'edit', '2', '127.0.0.1', 'Google', '{\"id\":\"5\",\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/edit/id/5/model/custom_reply_text.html', '1455871952');
INSERT INTO `dc_visit_log` VALUES ('4150', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871939');
INSERT INTO `dc_visit_log` VALUES ('4149', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455871932');
INSERT INTO `dc_visit_log` VALUES ('4148', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871898');
INSERT INTO `dc_visit_log` VALUES ('4147', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871888');
INSERT INTO `dc_visit_log` VALUES ('4146', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455871877');
INSERT INTO `dc_visit_log` VALUES ('4145', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871876');
INSERT INTO `dc_visit_log` VALUES ('4144', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871821');
INSERT INTO `dc_visit_log` VALUES ('4143', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871809');
INSERT INTO `dc_visit_log` VALUES ('4142', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455871803');
INSERT INTO `dc_visit_log` VALUES ('4141', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871799');
INSERT INTO `dc_visit_log` VALUES ('4140', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"1291\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455871794');
INSERT INTO `dc_visit_log` VALUES ('4139', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455871694');
INSERT INTO `dc_visit_log` VALUES ('4138', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455871663');
INSERT INTO `dc_visit_log` VALUES ('4137', '4', 'CustomReply', 'CustomReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455871659');
INSERT INTO `dc_visit_log` VALUES ('4136', '4', 'CustomReply', 'CustomReply', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"1290\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1290.html', '1455871650');
INSERT INTO `dc_visit_log` VALUES ('4135', '4', 'CustomReply', 'CustomReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455871648');
INSERT INTO `dc_visit_log` VALUES ('4134', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455871647');
INSERT INTO `dc_visit_log` VALUES ('4133', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/custom_reply_text.html', '1455871624');
INSERT INTO `dc_visit_log` VALUES ('4132', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"custom_reply_text\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists/model/custom_reply_text.html', '1455870960');
INSERT INTO `dc_visit_log` VALUES ('4131', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"1291\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1291.html', '1455870929');
INSERT INTO `dc_visit_log` VALUES ('4130', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455870927');
INSERT INTO `dc_visit_log` VALUES ('4129', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455870926');
INSERT INTO `dc_visit_log` VALUES ('4128', '4', 'CustomReply', 'CustomReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455870925');
INSERT INTO `dc_visit_log` VALUES ('4127', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455870922');
INSERT INTO `dc_visit_log` VALUES ('4126', '4', 'CustomReply', 'CustomReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455870920');
INSERT INTO `dc_visit_log` VALUES ('4125', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455870918');
INSERT INTO `dc_visit_log` VALUES ('4124', '4', 'CustomReply', 'CustomReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455870913');
INSERT INTO `dc_visit_log` VALUES ('4123', '4', 'Weather', 'Weather', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"1274\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455870910');
INSERT INTO `dc_visit_log` VALUES ('4122', '4', 'Weather', 'Weather', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"1274\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455870903');
INSERT INTO `dc_visit_log` VALUES ('4121', '4', 'Weather', 'Weather', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"1274\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455870874');
INSERT INTO `dc_visit_log` VALUES ('4120', '4', 'Weather', 'Weather', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"1274\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455870769');
INSERT INTO `dc_visit_log` VALUES ('4119', '4', 'Weather', 'Weather', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"1274\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/add/model/1274.html', '1455870760');
INSERT INTO `dc_visit_log` VALUES ('4118', '4', 'Weather', 'Weather', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"1274\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455870421');
INSERT INTO `dc_visit_log` VALUES ('4117', '4', 'Weather', 'Weather', 'lists', '2', '127.0.0.1', 'Google', '{\"model\":\"1274\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455870409');
INSERT INTO `dc_visit_log` VALUES ('4116', '4', 'Weather', 'Weather', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"1274\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/add/model/1274.html', '1455870401');
INSERT INTO `dc_visit_log` VALUES ('4115', '4', 'Weather', 'Weather', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455870317');
INSERT INTO `dc_visit_log` VALUES ('4114', '4', 'Weather', 'Weather', 'edit', '2', '127.0.0.1', 'Google', '{\"id\":\"4\",\"model\":\"1274\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/edit/id/4/model/1274.html', '1455870114');
INSERT INTO `dc_visit_log` VALUES ('4113', '4', 'Weather', 'Weather', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455870108');
INSERT INTO `dc_visit_log` VALUES ('4112', '4', 'AutoReply', 'AutoReply', 'message', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455869877');
INSERT INTO `dc_visit_log` VALUES ('4111', '4', 'AutoReply', 'AutoReply', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"1239\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455869828');
INSERT INTO `dc_visit_log` VALUES ('4110', '4', 'AutoReply', 'AutoReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455869826');
INSERT INTO `dc_visit_log` VALUES ('4109', '4', 'AutoReply', 'AutoReply', 'message', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455869824');
INSERT INTO `dc_visit_log` VALUES ('4108', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455869822');
INSERT INTO `dc_visit_log` VALUES ('4107', '4', 'AutoReply', 'AutoReply', 'add', '2', '127.0.0.1', 'Google', '{\"model\":\"1239\"}', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455869818');
INSERT INTO `dc_visit_log` VALUES ('4106', '4', 'AutoReply', 'AutoReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455869682');
INSERT INTO `dc_visit_log` VALUES ('4105', '4', 'AutoReply', 'AutoReply', 'message', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455869680');
INSERT INTO `dc_visit_log` VALUES ('4104', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455869678');
INSERT INTO `dc_visit_log` VALUES ('4103', '4', 'AutoReply', 'AutoReply', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455869676');
INSERT INTO `dc_visit_log` VALUES ('4102', '4', 'UserCenter', 'UserCenter', 'lists', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/addon/UserCenter/UserCenter/lists.html', '1455869671');
INSERT INTO `dc_visit_log` VALUES ('4101', '4', 'Home', 'Index', 'main', '2', '127.0.0.1', 'Google', '[]', 'http://127.0.0.1/douchat/index.php?s=/Home/Index/main.html', '1455869667');
INSERT INTO `dc_visit_log` VALUES ('4100', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455869651');
INSERT INTO `dc_visit_log` VALUES ('4099', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '{\"model\":\"1274\"}', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists/model/1274.html', '1455869168');
INSERT INTO `dc_visit_log` VALUES ('4098', '4', 'Weather', 'Weather', 'add', '2', '::1', 'Google', '{\"model\":\"1274\"}', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/add/model/1274.html', '1455869158');
INSERT INTO `dc_visit_log` VALUES ('4097', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455869152');
INSERT INTO `dc_visit_log` VALUES ('4096', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/home/index/main.html', '1455869009');
INSERT INTO `dc_visit_log` VALUES ('4095', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455868996');
INSERT INTO `dc_visit_log` VALUES ('4094', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455868978');
INSERT INTO `dc_visit_log` VALUES ('4093', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455868967');
INSERT INTO `dc_visit_log` VALUES ('4092', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455868949');
INSERT INTO `dc_visit_log` VALUES ('4091', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455868936');
INSERT INTO `dc_visit_log` VALUES ('4090', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455868920');
INSERT INTO `dc_visit_log` VALUES ('4089', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455868910');
INSERT INTO `dc_visit_log` VALUES ('4088', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455868872');
INSERT INTO `dc_visit_log` VALUES ('4087', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455868701');
INSERT INTO `dc_visit_log` VALUES ('4086', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455868698');
INSERT INTO `dc_visit_log` VALUES ('4085', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455868692');
INSERT INTO `dc_visit_log` VALUES ('4084', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455868684');
INSERT INTO `dc_visit_log` VALUES ('4083', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455868670');
INSERT INTO `dc_visit_log` VALUES ('4082', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455868626');
INSERT INTO `dc_visit_log` VALUES ('4081', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455868598');
INSERT INTO `dc_visit_log` VALUES ('4080', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455868464');
INSERT INTO `dc_visit_log` VALUES ('4079', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455868454');
INSERT INTO `dc_visit_log` VALUES ('4078', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455868444');
INSERT INTO `dc_visit_log` VALUES ('4077', '4', 'Home', 'CreditData', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/CreditData/lists.html', '1455868439');
INSERT INTO `dc_visit_log` VALUES ('4076', '4', 'UserCenter', 'UserCenter', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/UserCenter/UserCenter/config.html', '1455867262');
INSERT INTO `dc_visit_log` VALUES ('4075', '4', 'Home', 'CreditData', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/CreditData/lists.html', '1455867256');
INSERT INTO `dc_visit_log` VALUES ('4074', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455867251');
INSERT INTO `dc_visit_log` VALUES ('4073', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455867230');
INSERT INTO `dc_visit_log` VALUES ('4072', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455866775');
INSERT INTO `dc_visit_log` VALUES ('4071', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455866433');
INSERT INTO `dc_visit_log` VALUES ('4070', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455866399');
INSERT INTO `dc_visit_log` VALUES ('4069', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455866378');
INSERT INTO `dc_visit_log` VALUES ('4068', '4', 'Home', 'CreditData', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/CreditData/lists.html', '1455865954');
INSERT INTO `dc_visit_log` VALUES ('4067', '4', 'Home', 'CreditData', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/CreditData/lists.html', '1455865950');
INSERT INTO `dc_visit_log` VALUES ('4066', '4', 'Home', 'CreditData', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/CreditData/lists.html', '1455865925');
INSERT INTO `dc_visit_log` VALUES ('4065', '4', 'Home', 'CreditData', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/CreditData/lists.html', '1455865435');
INSERT INTO `dc_visit_log` VALUES ('4064', '4', 'Home', 'AuthGroup', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/AuthGroup/lists.html', '1455865434');
INSERT INTO `dc_visit_log` VALUES ('4063', '4', 'Home', 'CreditData', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/CreditData/lists.html', '1455865433');
INSERT INTO `dc_visit_log` VALUES ('4062', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455865426');
INSERT INTO `dc_visit_log` VALUES ('4061', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455865423');
INSERT INTO `dc_visit_log` VALUES ('4060', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865419');
INSERT INTO `dc_visit_log` VALUES ('4059', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455865418');
INSERT INTO `dc_visit_log` VALUES ('4058', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455865416');
INSERT INTO `dc_visit_log` VALUES ('4057', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455865415');
INSERT INTO `dc_visit_log` VALUES ('4056', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865414');
INSERT INTO `dc_visit_log` VALUES ('4055', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455865411');
INSERT INTO `dc_visit_log` VALUES ('4054', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455865407');
INSERT INTO `dc_visit_log` VALUES ('4053', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865406');
INSERT INTO `dc_visit_log` VALUES ('4052', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455865405');
INSERT INTO `dc_visit_log` VALUES ('4051', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455865368');
INSERT INTO `dc_visit_log` VALUES ('4050', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455865356');
INSERT INTO `dc_visit_log` VALUES ('4049', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865342');
INSERT INTO `dc_visit_log` VALUES ('4048', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865336');
INSERT INTO `dc_visit_log` VALUES ('4047', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455865329');
INSERT INTO `dc_visit_log` VALUES ('4046', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865323');
INSERT INTO `dc_visit_log` VALUES ('4045', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865215');
INSERT INTO `dc_visit_log` VALUES ('4044', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455865211');
INSERT INTO `dc_visit_log` VALUES ('4043', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865199');
INSERT INTO `dc_visit_log` VALUES ('4042', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865172');
INSERT INTO `dc_visit_log` VALUES ('4041', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865132');
INSERT INTO `dc_visit_log` VALUES ('4040', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455865125');
INSERT INTO `dc_visit_log` VALUES ('4039', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865096');
INSERT INTO `dc_visit_log` VALUES ('4038', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455865086');
INSERT INTO `dc_visit_log` VALUES ('4037', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864688');
INSERT INTO `dc_visit_log` VALUES ('4036', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455864671');
INSERT INTO `dc_visit_log` VALUES ('4035', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864667');
INSERT INTO `dc_visit_log` VALUES ('4034', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864542');
INSERT INTO `dc_visit_log` VALUES ('4033', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864502');
INSERT INTO `dc_visit_log` VALUES ('4032', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455864497');
INSERT INTO `dc_visit_log` VALUES ('4031', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864455');
INSERT INTO `dc_visit_log` VALUES ('4030', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864445');
INSERT INTO `dc_visit_log` VALUES ('4029', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455864435');
INSERT INTO `dc_visit_log` VALUES ('4028', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864342');
INSERT INTO `dc_visit_log` VALUES ('4027', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864333');
INSERT INTO `dc_visit_log` VALUES ('4026', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455864298');
INSERT INTO `dc_visit_log` VALUES ('4025', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455864290');
INSERT INTO `dc_visit_log` VALUES ('4024', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864266');
INSERT INTO `dc_visit_log` VALUES ('4023', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455864226');
INSERT INTO `dc_visit_log` VALUES ('4022', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455864056');
INSERT INTO `dc_visit_log` VALUES ('4021', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455864044');
INSERT INTO `dc_visit_log` VALUES ('4020', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455864023');
INSERT INTO `dc_visit_log` VALUES ('4019', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455864014');
INSERT INTO `dc_visit_log` VALUES ('4018', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455864003');
INSERT INTO `dc_visit_log` VALUES ('4017', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455863991');
INSERT INTO `dc_visit_log` VALUES ('4016', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455863960');
INSERT INTO `dc_visit_log` VALUES ('4015', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455863872');
INSERT INTO `dc_visit_log` VALUES ('4014', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455863613');
INSERT INTO `dc_visit_log` VALUES ('4013', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455863543');
INSERT INTO `dc_visit_log` VALUES ('4012', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455863529');
INSERT INTO `dc_visit_log` VALUES ('4011', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455863461');
INSERT INTO `dc_visit_log` VALUES ('4010', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"id\":\"7\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/id/7.html', '1455863439');
INSERT INTO `dc_visit_log` VALUES ('4009', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455863414');
INSERT INTO `dc_visit_log` VALUES ('4008', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"id\":\"6\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/id/6.html', '1455863404');
INSERT INTO `dc_visit_log` VALUES ('4007', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455863386');
INSERT INTO `dc_visit_log` VALUES ('4006', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"id\":\"6\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/id/6.html', '1455863188');
INSERT INTO `dc_visit_log` VALUES ('4005', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455863164');
INSERT INTO `dc_visit_log` VALUES ('4004', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"id\":\"6\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/id/6.html', '1455862411');
INSERT INTO `dc_visit_log` VALUES ('4003', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455862381');
INSERT INTO `dc_visit_log` VALUES ('4002', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"id\":\"7\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/id/7.html', '1455862214');
INSERT INTO `dc_visit_log` VALUES ('4001', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455862191');
INSERT INTO `dc_visit_log` VALUES ('4000', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"id\":\"7\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/id/7.html', '1455862181');
INSERT INTO `dc_visit_log` VALUES ('3999', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455861166');
INSERT INTO `dc_visit_log` VALUES ('3998', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455860341');
INSERT INTO `dc_visit_log` VALUES ('3997', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"id\":\"7\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/id/7.html', '1455860331');
INSERT INTO `dc_visit_log` VALUES ('3996', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455858587');
INSERT INTO `dc_visit_log` VALUES ('3995', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455858571');
INSERT INTO `dc_visit_log` VALUES ('3994', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455858540');
INSERT INTO `dc_visit_log` VALUES ('3993', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455858521');
INSERT INTO `dc_visit_log` VALUES ('3992', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455858369');
INSERT INTO `dc_visit_log` VALUES ('3991', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455858334');
INSERT INTO `dc_visit_log` VALUES ('3990', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455858316');
INSERT INTO `dc_visit_log` VALUES ('3989', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455858313');
INSERT INTO `dc_visit_log` VALUES ('3988', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455858278');
INSERT INTO `dc_visit_log` VALUES ('3987', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"id\":\"6\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/id/6.html', '1455858265');
INSERT INTO `dc_visit_log` VALUES ('3986', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455857779');
INSERT INTO `dc_visit_log` VALUES ('3985', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455857776');
INSERT INTO `dc_visit_log` VALUES ('3984', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455857767');
INSERT INTO `dc_visit_log` VALUES ('3983', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455857749');
INSERT INTO `dc_visit_log` VALUES ('3982', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455857595');
INSERT INTO `dc_visit_log` VALUES ('3981', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455857576');
INSERT INTO `dc_visit_log` VALUES ('3980', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455857570');
INSERT INTO `dc_visit_log` VALUES ('3979', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455857546');
INSERT INTO `dc_visit_log` VALUES ('3978', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455857515');
INSERT INTO `dc_visit_log` VALUES ('3977', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455857503');
INSERT INTO `dc_visit_log` VALUES ('3976', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455857496');
INSERT INTO `dc_visit_log` VALUES ('3975', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455857493');
INSERT INTO `dc_visit_log` VALUES ('3974', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455857024');
INSERT INTO `dc_visit_log` VALUES ('3973', '4', 'Home', 'Public', 'mp_interface', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/mp_interface/id/4.html', '1455857007');
INSERT INTO `dc_visit_log` VALUES ('3972', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455857006');
INSERT INTO `dc_visit_log` VALUES ('3971', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main/publicid/4.html', '1455857005');
INSERT INTO `dc_visit_log` VALUES ('3970', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455857003');
INSERT INTO `dc_visit_log` VALUES ('3969', '4', 'Home', 'PublicLink', 'lists', '2', '::1', 'Google', '{\"mp_id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/PublicLink/lists/mp_id/4.html', '1455857001');
INSERT INTO `dc_visit_log` VALUES ('3968', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455856999');
INSERT INTO `dc_visit_log` VALUES ('3967', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455856981');
INSERT INTO `dc_visit_log` VALUES ('3966', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455856959');
INSERT INTO `dc_visit_log` VALUES ('3965', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455856955');
INSERT INTO `dc_visit_log` VALUES ('3964', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455856847');
INSERT INTO `dc_visit_log` VALUES ('3963', '4', 'Home', 'PublicLink', 'lists', '2', '::1', 'Google', '{\"mp_id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/PublicLink/lists/mp_id/4.html', '1455856846');
INSERT INTO `dc_visit_log` VALUES ('3962', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455856843');
INSERT INTO `dc_visit_log` VALUES ('3961', '4', 'Home', 'Public', 'step_0', '2', '::1', 'Google', '{\"id\":\"4\"}', 'http://localhost/douchat/index.php?s=/Home/Public/step_0/id/4.html', '1455856842');
INSERT INTO `dc_visit_log` VALUES ('3960', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455856836');
INSERT INTO `dc_visit_log` VALUES ('3959', '4', 'Home', 'Public', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/add.html', '1455856831');
INSERT INTO `dc_visit_log` VALUES ('3958', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455856828');
INSERT INTO `dc_visit_log` VALUES ('3957', '4', 'YouaskService', 'YouaskService', 'kfzxstate', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/YouaskService/YouaskService/kfzxstate.html', '1455856440');
INSERT INTO `dc_visit_log` VALUES ('3956', '4', 'YouaskService', 'Group', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/YouaskService/Group/lists.html', '1455856439');
INSERT INTO `dc_visit_log` VALUES ('3955', '4', 'YouaskService', 'YouaskService', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/YouaskService/YouaskService/lists.html', '1455856434');
INSERT INTO `dc_visit_log` VALUES ('3954', '4', 'Tmplmsg', 'Tmplmsg', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Tmplmsg/Tmplmsg/lists.html', '1455856430');
INSERT INTO `dc_visit_log` VALUES ('3953', '4', 'SceneQrcode', 'SceneQrcode', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/SceneQrcode/SceneQrcode/lists.html', '1455856427');
INSERT INTO `dc_visit_log` VALUES ('3952', '4', 'SceneQrcode', 'Statistics', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/SceneQrcode/Statistics/lists.html', '1455856425');
INSERT INTO `dc_visit_log` VALUES ('3951', '4', 'SceneQrcode', 'SceneQrcode', 'add', '2', '::1', 'Google', '{\"model\":\"1246\"}', 'http://localhost/douchat/index.php?s=/addon/SceneQrcode/SceneQrcode/add/model/1246.html', '1455856416');
INSERT INTO `dc_visit_log` VALUES ('3950', '4', 'SceneQrcode', 'SceneQrcode', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/SceneQrcode/SceneQrcode/lists.html', '1455856414');
INSERT INTO `dc_visit_log` VALUES ('3949', '4', 'Payment', 'Payment', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Payment/Payment/config.html', '1455856410');
INSERT INTO `dc_visit_log` VALUES ('3948', '4', 'Payment', 'Payment', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Payment/Payment/lists.html', '1455856405');
INSERT INTO `dc_visit_log` VALUES ('3947', '4', 'WeiSite', 'WeiSite', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/WeiSite/config.html', '1455856401');
INSERT INTO `dc_visit_log` VALUES ('3946', '4', 'Panorama', 'Panorama', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Panorama/Panorama/lists.html', '1455856357');
INSERT INTO `dc_visit_log` VALUES ('3945', '4', 'Example', 'Example', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Example/Example/config.html', '1455856352');
INSERT INTO `dc_visit_log` VALUES ('3944', '4', 'Donations', 'Donations', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Donations/Donations/config.html', '1455856350');
INSERT INTO `dc_visit_log` VALUES ('3943', '4', 'Donations', 'Money', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Donations/Money/lists.html', '1455856348');
INSERT INTO `dc_visit_log` VALUES ('3942', '4', 'Donations', 'Donations', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Donations/Donations/config.html', '1455856343');
INSERT INTO `dc_visit_log` VALUES ('3941', '4', 'Extensions', 'Extensions', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Extensions/Extensions/lists.html', '1455856339');
INSERT INTO `dc_visit_log` VALUES ('3940', '4', 'Forms', 'Forms', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Forms/Forms/lists.html', '1455856336');
INSERT INTO `dc_visit_log` VALUES ('3939', '4', 'Dg', 'Dg', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Dg/Dg/config.html', '1455856332');
INSERT INTO `dc_visit_log` VALUES ('3938', '4', 'Suggestions', 'Suggestions', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Suggestions/Suggestions/config.html', '1455856318');
INSERT INTO `dc_visit_log` VALUES ('3937', '4', 'Leaflets', 'Leaflets', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Leaflets/Leaflets/config.html', '1455856315');
INSERT INTO `dc_visit_log` VALUES ('3936', '4', 'AddressManage', 'AddressManage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AddressManage/AddressManage/lists.html', '1455856307');
INSERT INTO `dc_visit_log` VALUES ('3935', '4', 'Idioms', 'Idioms', 'nulldeal', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Idioms/Idioms/nulldeal.html', '1455856246');
INSERT INTO `dc_visit_log` VALUES ('3934', '4', 'Tuling', 'Tuling', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Tuling/Tuling/config.html', '1455856242');
INSERT INTO `dc_visit_log` VALUES ('3933', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455856238');
INSERT INTO `dc_visit_log` VALUES ('3932', '4', 'Xydzp', 'Xydzp', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Xydzp/Xydzp/lists.html', '1455856235');
INSERT INTO `dc_visit_log` VALUES ('3931', '4', 'Scratch', 'Scratch', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Scratch/Scratch/lists.html', '1455856230');
INSERT INTO `dc_visit_log` VALUES ('3930', '4', 'Shop', 'Shop', 'summary', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Shop/Shop/summary.html', '1455856225');
INSERT INTO `dc_visit_log` VALUES ('3929', '4', 'Xydzp', 'Xydzp', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Xydzp/Xydzp/lists.html', '1455856211');
INSERT INTO `dc_visit_log` VALUES ('3928', '4', 'Scratch', 'Scratch', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Scratch/Scratch/lists.html', '1455856207');
INSERT INTO `dc_visit_log` VALUES ('3927', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455856204');
INSERT INTO `dc_visit_log` VALUES ('3926', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455855968');
INSERT INTO `dc_visit_log` VALUES ('3925', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455850807');
INSERT INTO `dc_visit_log` VALUES ('3924', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455850800');
INSERT INTO `dc_visit_log` VALUES ('3923', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455850783');
INSERT INTO `dc_visit_log` VALUES ('3922', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455850753');
INSERT INTO `dc_visit_log` VALUES ('3921', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455850750');
INSERT INTO `dc_visit_log` VALUES ('3920', '4', 'Weather', 'Weather', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Weather/Weather/lists.html', '1455850747');
INSERT INTO `dc_visit_log` VALUES ('3919', '4', 'Tuling', 'Tuling', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Tuling/Tuling/config.html', '1455850744');
INSERT INTO `dc_visit_log` VALUES ('3918', '4', 'Idioms', 'Idioms', 'nulldeal', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Idioms/Idioms/nulldeal.html', '1455850740');
INSERT INTO `dc_visit_log` VALUES ('3917', '4', 'AddressManage', 'AddressManage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AddressManage/AddressManage/lists.html', '1455850735');
INSERT INTO `dc_visit_log` VALUES ('3916', '4', 'AddressManage', 'AddressManage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AddressManage/AddressManage/lists.html', '1455850733');
INSERT INTO `dc_visit_log` VALUES ('3915', '4', 'AddressManage', 'AddressManage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AddressManage/AddressManage/lists.html', '1455850725');
INSERT INTO `dc_visit_log` VALUES ('3914', '4', 'Example', 'Example', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Example/Example/config.html', '1455850714');
INSERT INTO `dc_visit_log` VALUES ('3913', '4', 'Panorama', 'Panorama', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Panorama/Panorama/lists.html', '1455850710');
INSERT INTO `dc_visit_log` VALUES ('3912', '4', 'WeiSite', 'WeiSite', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/WeiSite/config.html', '1455850676');
INSERT INTO `dc_visit_log` VALUES ('3911', '4', 'Tmplmsg', 'Tmplmsg', 'test', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Tmplmsg/Tmplmsg/test.html', '1455850642');
INSERT INTO `dc_visit_log` VALUES ('3910', '4', 'Tmplmsg', 'Tmplmsg', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Tmplmsg/Tmplmsg/lists.html', '1455850635');
INSERT INTO `dc_visit_log` VALUES ('3909', '4', 'Tmplmsg', 'Tmplmsg', 'test', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Tmplmsg/Tmplmsg/test.html', '1455850629');
INSERT INTO `dc_visit_log` VALUES ('3908', '4', 'Tmplmsg', 'Tmplmsg', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/Tmplmsg/Tmplmsg/lists.html', '1455850627');
INSERT INTO `dc_visit_log` VALUES ('3907', '4', 'YouaskService', 'YouaskService', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/YouaskService/YouaskService/lists.html', '1455850622');
INSERT INTO `dc_visit_log` VALUES ('3906', '4', 'YouaskService', 'YouaskService', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/YouaskService/YouaskService/config.html', '1455850621');
INSERT INTO `dc_visit_log` VALUES ('3905', '4', 'YouaskService', 'KeywordKF', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/YouaskService/KeywordKF/lists.html', '1455850618');
INSERT INTO `dc_visit_log` VALUES ('3904', '4', 'YouaskService', 'YouaskService', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/YouaskService/YouaskService/lists.html', '1455850616');
INSERT INTO `dc_visit_log` VALUES ('3903', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455850610');
INSERT INTO `dc_visit_log` VALUES ('3902', '4', 'YouaskService', 'YouaskService', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/YouaskService/YouaskService/lists.html', '1455850605');
INSERT INTO `dc_visit_log` VALUES ('3901', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455850602');
INSERT INTO `dc_visit_log` VALUES ('3900', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/1.html', '1455850599');
INSERT INTO `dc_visit_log` VALUES ('3899', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850598');
INSERT INTO `dc_visit_log` VALUES ('3898', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455850596');
INSERT INTO `dc_visit_log` VALUES ('3897', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850595');
INSERT INTO `dc_visit_log` VALUES ('3896', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/1.html', '1455850593');
INSERT INTO `dc_visit_log` VALUES ('3895', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850587');
INSERT INTO `dc_visit_log` VALUES ('3894', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850568');
INSERT INTO `dc_visit_log` VALUES ('3893', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850494');
INSERT INTO `dc_visit_log` VALUES ('3892', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455850492');
INSERT INTO `dc_visit_log` VALUES ('3891', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850488');
INSERT INTO `dc_visit_log` VALUES ('3890', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850486');
INSERT INTO `dc_visit_log` VALUES ('3889', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/1.html', '1455850484');
INSERT INTO `dc_visit_log` VALUES ('3888', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850482');
INSERT INTO `dc_visit_log` VALUES ('3887', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/1.html', '1455850480');
INSERT INTO `dc_visit_log` VALUES ('3886', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850422');
INSERT INTO `dc_visit_log` VALUES ('3885', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/1.html', '1455850413');
INSERT INTO `dc_visit_log` VALUES ('3884', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850359');
INSERT INTO `dc_visit_log` VALUES ('3883', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850356');
INSERT INTO `dc_visit_log` VALUES ('3882', '4', 'CustomMenu', 'CustomMenu', 'add', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/add/menu_id/1.html', '1455850353');
INSERT INTO `dc_visit_log` VALUES ('3881', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/1.html', '1455850351');
INSERT INTO `dc_visit_log` VALUES ('3880', '4', 'CustomMenu', 'CustomMenu', 'add', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/add/menu_id/1.html', '1455850316');
INSERT INTO `dc_visit_log` VALUES ('3879', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/1.html', '1455850312');
INSERT INTO `dc_visit_log` VALUES ('3878', '4', 'CustomMenu', 'CustomMenu', 'add', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/add/menu_id/1.html', '1455850261');
INSERT INTO `dc_visit_log` VALUES ('3877', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/1.html', '1455850257');
INSERT INTO `dc_visit_log` VALUES ('3876', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/1.html', '1455850231');
INSERT INTO `dc_visit_log` VALUES ('3875', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850221');
INSERT INTO `dc_visit_log` VALUES ('3874', '4', 'CustomMenu', 'CustomMenu', 'lists', '2', '::1', 'Google', '{\"menu_id\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenu/lists/menu_id/1.html', '1455850213');
INSERT INTO `dc_visit_log` VALUES ('3873', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850194');
INSERT INTO `dc_visit_log` VALUES ('3872', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850191');
INSERT INTO `dc_visit_log` VALUES ('3871', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455850190');
INSERT INTO `dc_visit_log` VALUES ('3870', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850187');
INSERT INTO `dc_visit_log` VALUES ('3869', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455850181');
INSERT INTO `dc_visit_log` VALUES ('3868', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850152');
INSERT INTO `dc_visit_log` VALUES ('3867', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455850069');
INSERT INTO `dc_visit_log` VALUES ('3866', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849986');
INSERT INTO `dc_visit_log` VALUES ('3865', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849978');
INSERT INTO `dc_visit_log` VALUES ('3864', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849888');
INSERT INTO `dc_visit_log` VALUES ('3863', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849859');
INSERT INTO `dc_visit_log` VALUES ('3862', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849847');
INSERT INTO `dc_visit_log` VALUES ('3861', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849826');
INSERT INTO `dc_visit_log` VALUES ('3860', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849825');
INSERT INTO `dc_visit_log` VALUES ('3859', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849808');
INSERT INTO `dc_visit_log` VALUES ('3858', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849807');
INSERT INTO `dc_visit_log` VALUES ('3857', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849806');
INSERT INTO `dc_visit_log` VALUES ('3856', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849805');
INSERT INTO `dc_visit_log` VALUES ('3855', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/1.html', '1455849803');
INSERT INTO `dc_visit_log` VALUES ('3854', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849795');
INSERT INTO `dc_visit_log` VALUES ('3853', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/1.html', '1455849794');
INSERT INTO `dc_visit_log` VALUES ('3852', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849793');
INSERT INTO `dc_visit_log` VALUES ('3851', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849791');
INSERT INTO `dc_visit_log` VALUES ('3849', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849741');
INSERT INTO `dc_visit_log` VALUES ('3850', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849742');
INSERT INTO `dc_visit_log` VALUES ('3848', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849739');
INSERT INTO `dc_visit_log` VALUES ('3847', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849737');
INSERT INTO `dc_visit_log` VALUES ('3846', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849580');
INSERT INTO `dc_visit_log` VALUES ('3845', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849515');
INSERT INTO `dc_visit_log` VALUES ('3844', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849502');
INSERT INTO `dc_visit_log` VALUES ('3843', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849499');
INSERT INTO `dc_visit_log` VALUES ('3841', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849408');
INSERT INTO `dc_visit_log` VALUES ('3842', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849460');
INSERT INTO `dc_visit_log` VALUES ('3840', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849405');
INSERT INTO `dc_visit_log` VALUES ('3839', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849390');
INSERT INTO `dc_visit_log` VALUES ('3838', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849361');
INSERT INTO `dc_visit_log` VALUES ('3837', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849349');
INSERT INTO `dc_visit_log` VALUES ('3836', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849343');
INSERT INTO `dc_visit_log` VALUES ('3835', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849338');
INSERT INTO `dc_visit_log` VALUES ('3834', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849334');
INSERT INTO `dc_visit_log` VALUES ('3833', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849323');
INSERT INTO `dc_visit_log` VALUES ('3832', '4', 'CustomMenu', 'CustomMenuType', 'menu_now_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_now_lists.html', '1455849304');
INSERT INTO `dc_visit_log` VALUES ('3831', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849302');
INSERT INTO `dc_visit_log` VALUES ('3830', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"1\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/1.html', '1455849282');
INSERT INTO `dc_visit_log` VALUES ('3829', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849265');
INSERT INTO `dc_visit_log` VALUES ('3828', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455849263');
INSERT INTO `dc_visit_log` VALUES ('3827', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849260');
INSERT INTO `dc_visit_log` VALUES ('3826', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455849258');
INSERT INTO `dc_visit_log` VALUES ('3825', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849255');
INSERT INTO `dc_visit_log` VALUES ('3824', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455849253');
INSERT INTO `dc_visit_log` VALUES ('3823', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849250');
INSERT INTO `dc_visit_log` VALUES ('3822', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455849245');
INSERT INTO `dc_visit_log` VALUES ('3821', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455849240');
INSERT INTO `dc_visit_log` VALUES ('3820', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455849238');
INSERT INTO `dc_visit_log` VALUES ('3819', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1272\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1272.html', '1455849113');
INSERT INTO `dc_visit_log` VALUES ('3818', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455849110');
INSERT INTO `dc_visit_log` VALUES ('3817', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1270\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1270.html', '1455849108');
INSERT INTO `dc_visit_log` VALUES ('3816', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455849106');
INSERT INTO `dc_visit_log` VALUES ('3815', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455849104');
INSERT INTO `dc_visit_log` VALUES ('3814', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1271\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1271.html', '1455849096');
INSERT INTO `dc_visit_log` VALUES ('3813', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455849094');
INSERT INTO `dc_visit_log` VALUES ('3812', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455849093');
INSERT INTO `dc_visit_log` VALUES ('3811', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455849091');
INSERT INTO `dc_visit_log` VALUES ('3810', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455849089');
INSERT INTO `dc_visit_log` VALUES ('3809', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455849087');
INSERT INTO `dc_visit_log` VALUES ('3808', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455849086');
INSERT INTO `dc_visit_log` VALUES ('3807', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455849084');
INSERT INTO `dc_visit_log` VALUES ('3806', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455849083');
INSERT INTO `dc_visit_log` VALUES ('3805', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455849081');
INSERT INTO `dc_visit_log` VALUES ('3804', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455849080');
INSERT INTO `dc_visit_log` VALUES ('3803', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455849078');
INSERT INTO `dc_visit_log` VALUES ('3802', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455849076');
INSERT INTO `dc_visit_log` VALUES ('3801', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455848626');
INSERT INTO `dc_visit_log` VALUES ('3800', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455848622');
INSERT INTO `dc_visit_log` VALUES ('3799', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455848127');
INSERT INTO `dc_visit_log` VALUES ('3798', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455848123');
INSERT INTO `dc_visit_log` VALUES ('3797', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1272\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1272.html', '1455848120');
INSERT INTO `dc_visit_log` VALUES ('3796', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455848118');
INSERT INTO `dc_visit_log` VALUES ('3795', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455848116');
INSERT INTO `dc_visit_log` VALUES ('3794', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455848110');
INSERT INTO `dc_visit_log` VALUES ('3793', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455848106');
INSERT INTO `dc_visit_log` VALUES ('3792', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455848104');
INSERT INTO `dc_visit_log` VALUES ('3791', '4', 'Home', 'Message', 'message_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/message_lists.html', '1455848101');
INSERT INTO `dc_visit_log` VALUES ('3790', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455848096');
INSERT INTO `dc_visit_log` VALUES ('3789', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455848090');
INSERT INTO `dc_visit_log` VALUES ('3788', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455848088');
INSERT INTO `dc_visit_log` VALUES ('3787', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455848087');
INSERT INTO `dc_visit_log` VALUES ('3786', '4', 'Home', 'WeixinMessage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455848085');
INSERT INTO `dc_visit_log` VALUES ('3785', '4', 'Home', 'WeixinMessage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455848084');
INSERT INTO `dc_visit_log` VALUES ('3784', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455848081');
INSERT INTO `dc_visit_log` VALUES ('3783', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847886');
INSERT INTO `dc_visit_log` VALUES ('3782', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455847885');
INSERT INTO `dc_visit_log` VALUES ('3781', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455847883');
INSERT INTO `dc_visit_log` VALUES ('3780', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455847882');
INSERT INTO `dc_visit_log` VALUES ('3779', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847880');
INSERT INTO `dc_visit_log` VALUES ('3778', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847866');
INSERT INTO `dc_visit_log` VALUES ('3777', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455847865');
INSERT INTO `dc_visit_log` VALUES ('3776', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455847861');
INSERT INTO `dc_visit_log` VALUES ('3775', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455847852');
INSERT INTO `dc_visit_log` VALUES ('3774', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455847850');
INSERT INTO `dc_visit_log` VALUES ('3773', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847845');
INSERT INTO `dc_visit_log` VALUES ('3772', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847812');
INSERT INTO `dc_visit_log` VALUES ('3771', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847803');
INSERT INTO `dc_visit_log` VALUES ('3770', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847789');
INSERT INTO `dc_visit_log` VALUES ('3769', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847756');
INSERT INTO `dc_visit_log` VALUES ('3768', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847750');
INSERT INTO `dc_visit_log` VALUES ('3767', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847741');
INSERT INTO `dc_visit_log` VALUES ('3766', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847625');
INSERT INTO `dc_visit_log` VALUES ('3765', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847569');
INSERT INTO `dc_visit_log` VALUES ('3764', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455847437');
INSERT INTO `dc_visit_log` VALUES ('3763', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455847434');
INSERT INTO `dc_visit_log` VALUES ('3762', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455847429');
INSERT INTO `dc_visit_log` VALUES ('3761', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455847425');
INSERT INTO `dc_visit_log` VALUES ('3760', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792807');
INSERT INTO `dc_visit_log` VALUES ('3759', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792755');
INSERT INTO `dc_visit_log` VALUES ('3758', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792752');
INSERT INTO `dc_visit_log` VALUES ('3757', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792746');
INSERT INTO `dc_visit_log` VALUES ('3756', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792737');
INSERT INTO `dc_visit_log` VALUES ('3755', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792719');
INSERT INTO `dc_visit_log` VALUES ('3754', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792698');
INSERT INTO `dc_visit_log` VALUES ('3753', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792692');
INSERT INTO `dc_visit_log` VALUES ('3752', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792682');
INSERT INTO `dc_visit_log` VALUES ('3751', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792677');
INSERT INTO `dc_visit_log` VALUES ('3750', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792634');
INSERT INTO `dc_visit_log` VALUES ('3749', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792601');
INSERT INTO `dc_visit_log` VALUES ('3748', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455792598');
INSERT INTO `dc_visit_log` VALUES ('3747', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792553');
INSERT INTO `dc_visit_log` VALUES ('3746', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792544');
INSERT INTO `dc_visit_log` VALUES ('3745', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792479');
INSERT INTO `dc_visit_log` VALUES ('3744', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792468');
INSERT INTO `dc_visit_log` VALUES ('3743', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792457');
INSERT INTO `dc_visit_log` VALUES ('3742', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792395');
INSERT INTO `dc_visit_log` VALUES ('3741', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455792380');
INSERT INTO `dc_visit_log` VALUES ('3740', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792335');
INSERT INTO `dc_visit_log` VALUES ('3739', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792279');
INSERT INTO `dc_visit_log` VALUES ('3738', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455792197');
INSERT INTO `dc_visit_log` VALUES ('3737', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455791640');
INSERT INTO `dc_visit_log` VALUES ('3736', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791634');
INSERT INTO `dc_visit_log` VALUES ('3735', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791627');
INSERT INTO `dc_visit_log` VALUES ('3734', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791616');
INSERT INTO `dc_visit_log` VALUES ('3733', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791604');
INSERT INTO `dc_visit_log` VALUES ('3732', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455791544');
INSERT INTO `dc_visit_log` VALUES ('3731', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791540');
INSERT INTO `dc_visit_log` VALUES ('3730', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791528');
INSERT INTO `dc_visit_log` VALUES ('3729', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791472');
INSERT INTO `dc_visit_log` VALUES ('3728', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791445');
INSERT INTO `dc_visit_log` VALUES ('3727', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791351');
INSERT INTO `dc_visit_log` VALUES ('3726', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455791349');
INSERT INTO `dc_visit_log` VALUES ('3725', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791326');
INSERT INTO `dc_visit_log` VALUES ('3724', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791301');
INSERT INTO `dc_visit_log` VALUES ('3723', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791283');
INSERT INTO `dc_visit_log` VALUES ('3722', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455791235');
INSERT INTO `dc_visit_log` VALUES ('3721', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790828');
INSERT INTO `dc_visit_log` VALUES ('3720', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790805');
INSERT INTO `dc_visit_log` VALUES ('3719', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790739');
INSERT INTO `dc_visit_log` VALUES ('3718', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790598');
INSERT INTO `dc_visit_log` VALUES ('3717', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790567');
INSERT INTO `dc_visit_log` VALUES ('3716', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790503');
INSERT INTO `dc_visit_log` VALUES ('3715', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790489');
INSERT INTO `dc_visit_log` VALUES ('3714', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790448');
INSERT INTO `dc_visit_log` VALUES ('3713', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790399');
INSERT INTO `dc_visit_log` VALUES ('3712', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790156');
INSERT INTO `dc_visit_log` VALUES ('3711', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790111');
INSERT INTO `dc_visit_log` VALUES ('3710', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790105');
INSERT INTO `dc_visit_log` VALUES ('3709', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790101');
INSERT INTO `dc_visit_log` VALUES ('3708', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790086');
INSERT INTO `dc_visit_log` VALUES ('3707', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790082');
INSERT INTO `dc_visit_log` VALUES ('3706', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790080');
INSERT INTO `dc_visit_log` VALUES ('3705', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790047');
INSERT INTO `dc_visit_log` VALUES ('3704', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790020');
INSERT INTO `dc_visit_log` VALUES ('3703', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790019');
INSERT INTO `dc_visit_log` VALUES ('3702', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790017');
INSERT INTO `dc_visit_log` VALUES ('3701', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455790016');
INSERT INTO `dc_visit_log` VALUES ('3700', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789944');
INSERT INTO `dc_visit_log` VALUES ('3699', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789930');
INSERT INTO `dc_visit_log` VALUES ('3698', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789892');
INSERT INTO `dc_visit_log` VALUES ('3697', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789881');
INSERT INTO `dc_visit_log` VALUES ('3696', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789874');
INSERT INTO `dc_visit_log` VALUES ('3695', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789867');
INSERT INTO `dc_visit_log` VALUES ('3694', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789809');
INSERT INTO `dc_visit_log` VALUES ('3693', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789748');
INSERT INTO `dc_visit_log` VALUES ('3692', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789734');
INSERT INTO `dc_visit_log` VALUES ('3691', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789585');
INSERT INTO `dc_visit_log` VALUES ('3690', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455789584');
INSERT INTO `dc_visit_log` VALUES ('3689', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789474');
INSERT INTO `dc_visit_log` VALUES ('3688', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455789473');
INSERT INTO `dc_visit_log` VALUES ('3687', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789384');
INSERT INTO `dc_visit_log` VALUES ('3686', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789352');
INSERT INTO `dc_visit_log` VALUES ('3685', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789350');
INSERT INTO `dc_visit_log` VALUES ('3684', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789291');
INSERT INTO `dc_visit_log` VALUES ('3683', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789252');
INSERT INTO `dc_visit_log` VALUES ('3682', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789249');
INSERT INTO `dc_visit_log` VALUES ('3681', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789206');
INSERT INTO `dc_visit_log` VALUES ('3680', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789193');
INSERT INTO `dc_visit_log` VALUES ('3679', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789192');
INSERT INTO `dc_visit_log` VALUES ('3678', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789167');
INSERT INTO `dc_visit_log` VALUES ('3677', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789136');
INSERT INTO `dc_visit_log` VALUES ('3676', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789133');
INSERT INTO `dc_visit_log` VALUES ('3675', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789088');
INSERT INTO `dc_visit_log` VALUES ('3674', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789073');
INSERT INTO `dc_visit_log` VALUES ('3673', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789069');
INSERT INTO `dc_visit_log` VALUES ('3672', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789021');
INSERT INTO `dc_visit_log` VALUES ('3671', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789012');
INSERT INTO `dc_visit_log` VALUES ('3670', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455789001');
INSERT INTO `dc_visit_log` VALUES ('3669', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788999');
INSERT INTO `dc_visit_log` VALUES ('3668', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788977');
INSERT INTO `dc_visit_log` VALUES ('3667', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788943');
INSERT INTO `dc_visit_log` VALUES ('3666', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788932');
INSERT INTO `dc_visit_log` VALUES ('3665', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788858');
INSERT INTO `dc_visit_log` VALUES ('3664', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788787');
INSERT INTO `dc_visit_log` VALUES ('3663', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788690');
INSERT INTO `dc_visit_log` VALUES ('3662', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788581');
INSERT INTO `dc_visit_log` VALUES ('3661', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788558');
INSERT INTO `dc_visit_log` VALUES ('3660', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788549');
INSERT INTO `dc_visit_log` VALUES ('3659', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788471');
INSERT INTO `dc_visit_log` VALUES ('3658', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788423');
INSERT INTO `dc_visit_log` VALUES ('3657', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455788414');
INSERT INTO `dc_visit_log` VALUES ('3656', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788341');
INSERT INTO `dc_visit_log` VALUES ('3655', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455788305');
INSERT INTO `dc_visit_log` VALUES ('3654', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455788303');
INSERT INTO `dc_visit_log` VALUES ('3653', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787815');
INSERT INTO `dc_visit_log` VALUES ('3652', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787802');
INSERT INTO `dc_visit_log` VALUES ('3651', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787793');
INSERT INTO `dc_visit_log` VALUES ('3650', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787742');
INSERT INTO `dc_visit_log` VALUES ('3649', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787714');
INSERT INTO `dc_visit_log` VALUES ('3648', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787673');
INSERT INTO `dc_visit_log` VALUES ('3647', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787626');
INSERT INTO `dc_visit_log` VALUES ('3646', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787509');
INSERT INTO `dc_visit_log` VALUES ('3645', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455787479');
INSERT INTO `dc_visit_log` VALUES ('3644', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787214');
INSERT INTO `dc_visit_log` VALUES ('3643', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455787190');
INSERT INTO `dc_visit_log` VALUES ('3642', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455774871');
INSERT INTO `dc_visit_log` VALUES ('3641', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455774870');
INSERT INTO `dc_visit_log` VALUES ('3640', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455774868');
INSERT INTO `dc_visit_log` VALUES ('3639', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455774696');
INSERT INTO `dc_visit_log` VALUES ('3638', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455774675');
INSERT INTO `dc_visit_log` VALUES ('3637', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455774674');
INSERT INTO `dc_visit_log` VALUES ('3636', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455774671');
INSERT INTO `dc_visit_log` VALUES ('3635', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455774669');
INSERT INTO `dc_visit_log` VALUES ('3634', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455774667');
INSERT INTO `dc_visit_log` VALUES ('3633', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455774627');
INSERT INTO `dc_visit_log` VALUES ('3632', '4', 'Home', 'Message', 'message_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/message_lists.html', '1455774626');
INSERT INTO `dc_visit_log` VALUES ('3631', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455774624');
INSERT INTO `dc_visit_log` VALUES ('3630', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455774582');
INSERT INTO `dc_visit_log` VALUES ('3629', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455774555');
INSERT INTO `dc_visit_log` VALUES ('3628', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455774466');
INSERT INTO `dc_visit_log` VALUES ('3627', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/home/index/main.html', '1455774461');
INSERT INTO `dc_visit_log` VALUES ('3626', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455774414');
INSERT INTO `dc_visit_log` VALUES ('3625', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455774412');
INSERT INTO `dc_visit_log` VALUES ('3624', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1271\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1271.html', '1455774333');
INSERT INTO `dc_visit_log` VALUES ('3623', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455774332');
INSERT INTO `dc_visit_log` VALUES ('3622', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1272\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1272.html', '1455774330');
INSERT INTO `dc_visit_log` VALUES ('3621', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455774329');
INSERT INTO `dc_visit_log` VALUES ('3620', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455774326');
INSERT INTO `dc_visit_log` VALUES ('3619', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455774325');
INSERT INTO `dc_visit_log` VALUES ('3618', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1270\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1270.html', '1455774312');
INSERT INTO `dc_visit_log` VALUES ('3617', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1270\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1270.html', '1455774029');
INSERT INTO `dc_visit_log` VALUES ('3616', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455774028');
INSERT INTO `dc_visit_log` VALUES ('3615', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1271\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1271.html', '1455774000');
INSERT INTO `dc_visit_log` VALUES ('3614', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455773998');
INSERT INTO `dc_visit_log` VALUES ('3613', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1272\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1272.html', '1455773990');
INSERT INTO `dc_visit_log` VALUES ('3612', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455773989');
INSERT INTO `dc_visit_log` VALUES ('3611', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455773986');
INSERT INTO `dc_visit_log` VALUES ('3610', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455773985');
INSERT INTO `dc_visit_log` VALUES ('3609', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455773972');
INSERT INTO `dc_visit_log` VALUES ('3608', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455773970');
INSERT INTO `dc_visit_log` VALUES ('3607', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1272\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1272.html', '1455773967');
INSERT INTO `dc_visit_log` VALUES ('3606', '4', 'CustomReply', 'CustomReplyText', 'add', '2', '::1', 'Google', '{\"model\":\"1272\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/add/model/1272.html', '1455773927');
INSERT INTO `dc_visit_log` VALUES ('3605', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455773925');
INSERT INTO `dc_visit_log` VALUES ('3604', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1270\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1270.html', '1455773915');
INSERT INTO `dc_visit_log` VALUES ('3603', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455773915');
INSERT INTO `dc_visit_log` VALUES ('3602', '4', 'CustomReply', 'CustomReplyText', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyText/lists.html', '1455773914');
INSERT INTO `dc_visit_log` VALUES ('3601', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455773912');
INSERT INTO `dc_visit_log` VALUES ('3600', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1271\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1271.html', '1455773908');
INSERT INTO `dc_visit_log` VALUES ('3599', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455773907');
INSERT INTO `dc_visit_log` VALUES ('3598', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"custom_reply_mult\",\"cate_id\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/custom_reply_mult.html&&cate_id=0', '1455773901');
INSERT INTO `dc_visit_log` VALUES ('3597', '4', 'CustomReply', 'CustomReplyMult', 'add', '2', '::1', 'Google', '{\"model\":\"1270\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/add/model/1270.html', '1455773888');
INSERT INTO `dc_visit_log` VALUES ('3596', '4', 'CustomReply', 'CustomReplyMult', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReplyMult/lists.html', '1455773886');
INSERT INTO `dc_visit_log` VALUES ('3595', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455773885');
INSERT INTO `dc_visit_log` VALUES ('3594', '4', 'CustomReply', 'CustomReply', 'add', '2', '::1', 'Google', '{\"model\":\"1271\"}', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/add/model/1271.html', '1455773878');
INSERT INTO `dc_visit_log` VALUES ('3593', '4', 'CustomReply', 'CustomReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/lists.html', '1455773876');
INSERT INTO `dc_visit_log` VALUES ('3592', '4', 'CustomMenu', 'CustomMenuType', 'menu_lists', '2', '::1', 'Google', '{\"type\":\"0\"}', 'http://localhost/douchat/index.php?s=/addon/CustomMenu/CustomMenuType/menu_lists/type/0.html', '1455773872');
INSERT INTO `dc_visit_log` VALUES ('3591', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455773869');
INSERT INTO `dc_visit_log` VALUES ('3590', '4', 'AutoReply', 'AutoReply', 'message', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/message.html', '1455773858');
INSERT INTO `dc_visit_log` VALUES ('3589', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455773856');
INSERT INTO `dc_visit_log` VALUES ('3588', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455773854');
INSERT INTO `dc_visit_log` VALUES ('3587', '4', 'AutoReply', 'AutoReply', 'add', '2', '::1', 'Google', '{\"model\":\"1239\"}', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/add/model/1239.html', '1455773848');
INSERT INTO `dc_visit_log` VALUES ('3586', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455773846');
INSERT INTO `dc_visit_log` VALUES ('3585', '4', 'AutoReply', 'AutoReply', 'subscribe', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/subscribe.html', '1455773839');
INSERT INTO `dc_visit_log` VALUES ('3584', '4', 'AutoReply', 'AutoReply', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/AutoReply/AutoReply/lists.html', '1455773837');
INSERT INTO `dc_visit_log` VALUES ('3583', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455773833');
INSERT INTO `dc_visit_log` VALUES ('3582', '4', 'Home', 'Material', 'video_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/video_lists.html', '1455773829');
INSERT INTO `dc_visit_log` VALUES ('3581', '4', 'Home', 'Material', 'voice_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/voice_lists.html', '1455773828');
INSERT INTO `dc_visit_log` VALUES ('3580', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773826');
INSERT INTO `dc_visit_log` VALUES ('3579', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773825');
INSERT INTO `dc_visit_log` VALUES ('3578', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455773824');
INSERT INTO `dc_visit_log` VALUES ('3577', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773822');
INSERT INTO `dc_visit_log` VALUES ('3576', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773820');
INSERT INTO `dc_visit_log` VALUES ('3574', '4', 'Home', 'Material', 'video_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/video_add.html', '1455773809');
INSERT INTO `dc_visit_log` VALUES ('3575', '4', 'Home', 'Material', 'voice_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/voice_lists.html', '1455773819');
INSERT INTO `dc_visit_log` VALUES ('3573', '4', 'Home', 'Material', 'video_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/video_lists.html', '1455773807');
INSERT INTO `dc_visit_log` VALUES ('3572', '4', 'Home', 'Material', 'voice_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/voice_add.html', '1455773802');
INSERT INTO `dc_visit_log` VALUES ('3571', '4', 'Home', 'Material', 'voice_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/voice_lists.html', '1455773800');
INSERT INTO `dc_visit_log` VALUES ('3570', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773797');
INSERT INTO `dc_visit_log` VALUES ('3569', '4', 'Home', 'Material', 'add_material', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/add_material.html', '1455773794');
INSERT INTO `dc_visit_log` VALUES ('3568', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773792');
INSERT INTO `dc_visit_log` VALUES ('3567', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773788');
INSERT INTO `dc_visit_log` VALUES ('3566', '4', 'Home', 'Material', 'text_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_add.html', '1455773786');
INSERT INTO `dc_visit_log` VALUES ('3565', '4', 'Home', 'Material', 'text_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_add.html', '1455773754');
INSERT INTO `dc_visit_log` VALUES ('3564', '4', 'Home', 'Material', 'text_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_add.html', '1455773750');
INSERT INTO `dc_visit_log` VALUES ('3563', '4', 'Home', 'Material', 'text_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_add.html', '1455773743');
INSERT INTO `dc_visit_log` VALUES ('3562', '4', 'Home', 'Material', 'text_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_add.html', '1455773696');
INSERT INTO `dc_visit_log` VALUES ('3561', '4', 'Home', 'Material', 'text_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_add.html', '1455773694');
INSERT INTO `dc_visit_log` VALUES ('3560', '4', 'Home', 'Material', 'text_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_add.html', '1455773639');
INSERT INTO `dc_visit_log` VALUES ('3559', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455773637');
INSERT INTO `dc_visit_log` VALUES ('3558', '4', 'Home', 'Material', 'add_material', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/add_material.html', '1455773612');
INSERT INTO `dc_visit_log` VALUES ('3557', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773611');
INSERT INTO `dc_visit_log` VALUES ('3556', '4', 'Home', 'Material', 'voice_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/voice_lists.html', '1455773610');
INSERT INTO `dc_visit_log` VALUES ('3555', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773608');
INSERT INTO `dc_visit_log` VALUES ('3554', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773606');
INSERT INTO `dc_visit_log` VALUES ('3553', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455773605');
INSERT INTO `dc_visit_log` VALUES ('3552', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455773601');
INSERT INTO `dc_visit_log` VALUES ('3551', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455773600');
INSERT INTO `dc_visit_log` VALUES ('3550', '4', 'Home', 'Material', 'text_add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_add.html', '1455773596');
INSERT INTO `dc_visit_log` VALUES ('3549', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455773595');
INSERT INTO `dc_visit_log` VALUES ('3548', '4', 'Home', 'WeixinMessage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455773594');
INSERT INTO `dc_visit_log` VALUES ('3547', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455773593');
INSERT INTO `dc_visit_log` VALUES ('3546', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455773592');
INSERT INTO `dc_visit_log` VALUES ('3545', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455773590');
INSERT INTO `dc_visit_log` VALUES ('3544', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773579');
INSERT INTO `dc_visit_log` VALUES ('3543', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773574');
INSERT INTO `dc_visit_log` VALUES ('3542', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773496');
INSERT INTO `dc_visit_log` VALUES ('3541', '4', 'Home', 'Material', 'voice_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/voice_lists.html', '1455773493');
INSERT INTO `dc_visit_log` VALUES ('3540', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773491');
INSERT INTO `dc_visit_log` VALUES ('3539', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773489');
INSERT INTO `dc_visit_log` VALUES ('3538', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455773487');
INSERT INTO `dc_visit_log` VALUES ('3537', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455773482');
INSERT INTO `dc_visit_log` VALUES ('3536', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455773480');
INSERT INTO `dc_visit_log` VALUES ('3535', '4', 'Home', 'Message', 'custom_sendall_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall_lists.html', '1455773478');
INSERT INTO `dc_visit_log` VALUES ('3534', '4', 'Home', 'Message', 'sendall_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/sendall_lists.html', '1455773477');
INSERT INTO `dc_visit_log` VALUES ('3533', '4', 'Home', 'Message', 'message_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/message_lists.html', '1455773473');
INSERT INTO `dc_visit_log` VALUES ('3532', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455773416');
INSERT INTO `dc_visit_log` VALUES ('3531', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455773414');
INSERT INTO `dc_visit_log` VALUES ('3530', '4', 'Home', 'Message', 'custom_sendall', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/custom_sendall.html', '1455773409');
INSERT INTO `dc_visit_log` VALUES ('3529', '4', 'Home', 'Message', 'add', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Message/add.html', '1455773399');
INSERT INTO `dc_visit_log` VALUES ('3528', '4', 'Home', 'Material', 'video_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/video_lists.html', '1455773397');
INSERT INTO `dc_visit_log` VALUES ('3527', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773394');
INSERT INTO `dc_visit_log` VALUES ('3526', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773392');
INSERT INTO `dc_visit_log` VALUES ('3525', '4', 'Home', 'Material', 'voice_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/voice_lists.html', '1455773390');
INSERT INTO `dc_visit_log` VALUES ('3524', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773387');
INSERT INTO `dc_visit_log` VALUES ('3523', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773386');
INSERT INTO `dc_visit_log` VALUES ('3522', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773385');
INSERT INTO `dc_visit_log` VALUES ('3521', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455773384');
INSERT INTO `dc_visit_log` VALUES ('3520', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773378');
INSERT INTO `dc_visit_log` VALUES ('3519', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773371');
INSERT INTO `dc_visit_log` VALUES ('3518', '4', 'Home', 'Material', 'voice_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/voice_lists.html', '1455773370');
INSERT INTO `dc_visit_log` VALUES ('3517', '4', 'Home', 'Material', 'video_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/video_lists.html', '1455773368');
INSERT INTO `dc_visit_log` VALUES ('3516', '4', 'Home', 'Material', 'voice_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/voice_lists.html', '1455773366');
INSERT INTO `dc_visit_log` VALUES ('3515', '4', 'Home', 'Material', 'material_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/material_lists.html', '1455773362');
INSERT INTO `dc_visit_log` VALUES ('3513', '4', 'Home', 'Material', 'text_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/text_lists.html', '1455773357');
INSERT INTO `dc_visit_log` VALUES ('3514', '4', 'Home', 'Material', 'picture_lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Material/picture_lists.html', '1455773359');
INSERT INTO `dc_visit_log` VALUES ('3511', '4', 'Home', 'WeixinMessage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455773164');
INSERT INTO `dc_visit_log` VALUES ('3512', '4', 'Home', 'WeixinMessage', 'collect', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/collect.html', '1455773170');
INSERT INTO `dc_visit_log` VALUES ('3509', '4', 'Home', 'WeixinMessage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455773158');
INSERT INTO `dc_visit_log` VALUES ('3510', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455773159');
INSERT INTO `dc_visit_log` VALUES ('3508', '4', 'Home', 'WeixinMessage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455773156');
INSERT INTO `dc_visit_log` VALUES ('3506', '4', 'Home', 'WeixinMessage', 'deal', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/deal.html', '1455773154');
INSERT INTO `dc_visit_log` VALUES ('3507', '4', 'Home', 'WeixinMessage', 'collect', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/collect.html', '1455773156');
INSERT INTO `dc_visit_log` VALUES ('3505', '4', 'Home', 'WeixinMessage', 'collect', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/collect.html', '1455773153');
INSERT INTO `dc_visit_log` VALUES ('3503', '4', 'Home', 'UserCenter', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/UserCenter/lists.html', '1455773149');
INSERT INTO `dc_visit_log` VALUES ('3504', '4', 'Home', 'WeixinMessage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455773151');
INSERT INTO `dc_visit_log` VALUES ('3501', '4', 'Home', 'Public', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Public/lists.html', '1455773140');
INSERT INTO `dc_visit_log` VALUES ('3502', '4', 'Home', 'WeixinMessage', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/WeixinMessage/lists.html', '1455773147');
INSERT INTO `dc_visit_log` VALUES ('3500', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455773032');
INSERT INTO `dc_visit_log` VALUES ('3499', '4', 'WeiSite', 'Template', 'footer', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/Template/footer.html', '1455698317');
INSERT INTO `dc_visit_log` VALUES ('3498', '4', 'WeiSite', 'Template', 'detail', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/Template/detail.html', '1455698315');
INSERT INTO `dc_visit_log` VALUES ('3497', '4', 'WeiSite', 'Template', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/Template/lists.html', '1455698314');
INSERT INTO `dc_visit_log` VALUES ('3495', '4', 'WeiSite', 'Template', 'index', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/Template/index.html', '1455698296');
INSERT INTO `dc_visit_log` VALUES ('3496', '4', 'WeiSite', 'Template', 'subcate', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/Template/subcate.html', '1455698312');
INSERT INTO `dc_visit_log` VALUES ('3494', '4', 'WeiSite', 'Cms', 'lists', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/Cms/lists.html', '1455698295');
INSERT INTO `dc_visit_log` VALUES ('3493', '4', 'WeiSite', 'WeiSite', 'index', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/WeiSite/index.html', '1455698281');
INSERT INTO `dc_visit_log` VALUES ('3492', '4', 'WeiSite', 'WeiSite', 'config', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/addon/WeiSite/WeiSite/config.html', '1455698276');
INSERT INTO `dc_visit_log` VALUES ('3491', '4', 'Home', 'Index', 'main', '2', '::1', 'Google', '[]', 'http://localhost/douchat/index.php?s=/Home/Index/main.html', '1455698235');

-- ----------------------------
-- Table structure for `dc_weather`
-- ----------------------------
DROP TABLE IF EXISTS `dc_weather`;
CREATE TABLE `dc_weather` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `keyword_type` char(50) NOT NULL default '0' COMMENT '关键词类型',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_weather
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_weisite_category`
-- ----------------------------
DROP TABLE IF EXISTS `dc_weisite_category`;
CREATE TABLE `dc_weisite_category` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(100) NOT NULL COMMENT '分类标题',
  `icon` int(10) unsigned default NULL COMMENT '分类图片',
  `url` varchar(255) default NULL COMMENT '外链',
  `is_show` tinyint(2) default '1' COMMENT '显示',
  `token` varchar(100) default NULL COMMENT 'Token',
  `sort` int(10) default '0' COMMENT '排序号',
  `pid` int(10) default '0' COMMENT '一级目录',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_weisite_category
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_weisite_cms`
-- ----------------------------
DROP TABLE IF EXISTS `dc_weisite_cms`;
CREATE TABLE `dc_weisite_cms` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) default NULL COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `cate_id` int(10) unsigned default '0' COMMENT '所属类别',
  `cover` int(10) unsigned default NULL COMMENT '封面图片',
  `content` text COMMENT '内容',
  `cTime` int(10) default NULL COMMENT '发布时间',
  `sort` int(10) unsigned default '0' COMMENT '排序号',
  `view_count` int(10) unsigned default '0' COMMENT '浏览数',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_weisite_cms
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_weisite_footer`
-- ----------------------------
DROP TABLE IF EXISTS `dc_weisite_footer`;
CREATE TABLE `dc_weisite_footer` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `url` varchar(255) default NULL COMMENT '关联URL',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `pid` tinyint(2) default '0' COMMENT '一级菜单',
  `sort` tinyint(4) default '0' COMMENT '排序号',
  `token` varchar(255) default NULL COMMENT 'Token',
  `icon` int(10) unsigned default NULL COMMENT '图标',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_weisite_footer
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_weisite_slideshow`
-- ----------------------------
DROP TABLE IF EXISTS `dc_weisite_slideshow`;
CREATE TABLE `dc_weisite_slideshow` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `title` varchar(255) default NULL COMMENT '标题',
  `img` int(10) unsigned NOT NULL COMMENT '图片',
  `url` varchar(255) default NULL COMMENT '链接地址',
  `is_show` tinyint(2) default '1' COMMENT '是否显示',
  `sort` int(10) unsigned default '0' COMMENT '排序',
  `token` varchar(100) default NULL COMMENT 'Token',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_weisite_slideshow
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_weixin_log`
-- ----------------------------
DROP TABLE IF EXISTS `dc_weixin_log`;
CREATE TABLE `dc_weixin_log` (
  `id` int(11) NOT NULL auto_increment,
  `cTime` int(11) default NULL,
  `cTime_format` varchar(30) default NULL,
  `data` text,
  `data_post` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_weixin_log
-- ----------------------------
INSERT INTO `dc_weixin_log` VALUES ('1', '1453949366', '2016-01-28 10:49:26', 'gh_72c21308d5d5::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('2', '1453949366', '2016-01-28 10:49:26', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('3', '1453949366', '2016-01-28 10:49:26', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453949366</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('4', '1453949367', '2016-01-28 10:49:27', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[无法处理您的请求！]]></Content><ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453949366</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('5', '1453949399', '2016-01-28 10:49:59', 'gh_72c21308d5d5::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('6', '1453949399', '2016-01-28 10:49:59', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('7', '1453949628', '2016-01-28 10:53:48', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('8', '1453949628', '2016-01-28 10:53:48', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('9', '1453949628', '2016-01-28 10:53:48', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[2016年会]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453949628</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('10', '1453949651', '2016-01-28 10:54:11', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('11', '1453949651', '2016-01-28 10:54:11', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('12', '1453949700', '2016-01-28 10:55:00', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('13', '1453949700', '2016-01-28 10:55:00', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('14', '1453949924', '2016-01-28 10:58:44', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('15', '1453949924', '2016-01-28 10:58:44', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('16', '1453953448', '2016-01-28 11:57:28', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('17', '1453953448', '2016-01-28 11:57:28', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('18', '1453953671', '2016-01-28 12:01:11', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('19', '1453953671', '2016-01-28 12:01:11', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('20', '1453953718', '2016-01-28 12:01:58', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('21', '1453953718', '2016-01-28 12:01:58', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('22', '1453954542', '2016-01-28 12:15:42', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('23', '1453954542', '2016-01-28 12:15:42', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('24', '1453954557', '2016-01-28 12:15:57', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('25', '1453954557', '2016-01-28 12:15:57', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('26', '1453954857', '2016-01-28 12:20:57', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('27', '1453954857', '2016-01-28 12:20:57', '0', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('28', '1453955000', '2016-01-28 12:23:20', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('29', '1453955000', '2016-01-28 12:23:20', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('30', '1453955152', '2016-01-28 12:25:52', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('31', '1453955152', '2016-01-28 12:25:52', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('32', '1453955357', '2016-01-28 12:29:17', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('33', '1453955357', '2016-01-28 12:29:17', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('34', '1453955361', '2016-01-28 12:29:21', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[2016年会]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453955357</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('35', '1453955380', '2016-01-28 12:29:40', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('36', '1453955380', '2016-01-28 12:29:40', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('37', '1453955380', '2016-01-28 12:29:40', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[无法处理您的请求！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453955380</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('38', '1453955391', '2016-01-28 12:29:51', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('39', '1453955391', '2016-01-28 12:29:51', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('40', '1453955391', '2016-01-28 12:29:51', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453955391</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('41', '1453955391', '2016-01-28 12:29:51', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[无法处理您的请求！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453955391</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('42', '1453955642', '2016-01-28 12:34:02', 'a:5:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453955386\";s:7:\"MsgType\";s:5:\"event\";s:5:\"Event\";s:9:\"subscribe\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453955386</CreateTime>\r\n<MsgType><![CDATA[event]]></MsgType>\r\n<Event><![CDATA[subscribe]]></Event>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('43', '1453955642', '2016-01-28 12:34:02', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('44', '1453955642', '2016-01-28 12:34:02', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('45', '1453955642', '2016-01-28 12:34:02', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453955642</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('46', '1453955642', '2016-01-28 12:34:02', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[无法处理您的请求！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453955642</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('47', '1453956164', '2016-01-28 12:42:44', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('48', '1453956164', '2016-01-28 12:42:44', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('49', '1453956164', '2016-01-28 12:42:44', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('50', '1453956180', '2016-01-28 12:43:00', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('51', '1453956180', '2016-01-28 12:43:00', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('52', '1453956180', '2016-01-28 12:43:00', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('53', '1453956308', '2016-01-28 12:45:08', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('54', '1453956308', '2016-01-28 12:45:08', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('55', '1453956308', '2016-01-28 12:45:08', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('56', '1453956455', '2016-01-28 12:47:35', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('57', '1453956455', '2016-01-28 12:47:35', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('58', '1453956455', '2016-01-28 12:47:35', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('59', '1453956486', '2016-01-28 12:48:06', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('60', '1453956486', '2016-01-28 12:48:06', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('61', '1453956486', '2016-01-28 12:48:06', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('62', '1453956526', '2016-01-28 12:48:46', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('63', '1453956526', '2016-01-28 12:48:46', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('64', '1453956526', '2016-01-28 12:48:46', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('65', '1453956532', '2016-01-28 12:48:52', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('66', '1453956532', '2016-01-28 12:48:52', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('67', '1453956532', '2016-01-28 12:48:52', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('68', '1453956590', '2016-01-28 12:49:50', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('69', '1453956590', '2016-01-28 12:49:50', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('70', '1453956590', '2016-01-28 12:49:50', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('71', '1453956652', '2016-01-28 12:50:52', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('72', '1453956652', '2016-01-28 12:50:52', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('73', '1453956652', '2016-01-28 12:50:52', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('74', '1453956711', '2016-01-28 12:51:51', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('75', '1453956711', '2016-01-28 12:51:51', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('76', '1453956711', '2016-01-28 12:51:51', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('77', '1453956861', '2016-01-28 12:54:21', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('78', '1453956861', '2016-01-28 12:54:21', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('79', '1453956861', '2016-01-28 12:54:21', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('80', '1453956893', '2016-01-28 12:54:53', 'a:6:{s:10:\"ToUserName\";s:15:\"gh_72c21308d5d5\";s:12:\"FromUserName\";s:28:\"oVFP7s-1D7vEZT0wmvmLbXvDt1_8\";s:10:\"CreateTime\";s:10:\"1453956161\";s:7:\"MsgType\";s:4:\"text\";s:7:\"Content\";s:3:\"xxx\";s:5:\"MsgId\";s:16:\"1234567890123456\";}', '<xml>\r\n<ToUserName><![CDATA[gh_72c21308d5d5]]></ToUserName>\r\n<FromUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></FromUserName>\r\n<CreateTime>1453956161</CreateTime>\r\n<MsgType><![CDATA[text]]></MsgType>\r\n<Content><![CDATA[xxx]]></Content>\r\n<MsgId>1234567890123456</MsgId>\r\n</xml>');
INSERT INTO `dc_weixin_log` VALUES ('81', '1453956893', '2016-01-28 12:54:53', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('82', '1453956893', '2016-01-28 12:54:53', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('83', '1453956922', '2016-01-28 12:55:22', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('84', '1453956922', '2016-01-28 12:55:22', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('85', '1453957194', '2016-01-28 12:59:54', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('86', '1453957194', '2016-01-28 12:59:54', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('87', '1453957221', '2016-01-28 13:00:21', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('88', '1453957221', '2016-01-28 13:00:21', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('89', '1453957663', '2016-01-28 13:07:43', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('90', '1453957663', '2016-01-28 13:07:43', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('91', '1453958297', '2016-01-28 13:18:17', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('92', '1453958297', '2016-01-28 13:18:17', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('93', '1453958297', '2016-01-28 13:18:17', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453958297</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('94', '1453958308', '2016-01-28 13:18:28', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('95', '1453958309', '2016-01-28 13:18:29', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('96', '1453958309', '2016-01-28 13:18:29', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453958308</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('97', '1453958388', '2016-01-28 13:19:48', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('98', '1453958388', '2016-01-28 13:19:48', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('99', '1453958400', '2016-01-28 13:20:00', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('100', '1453958400', '2016-01-28 13:20:00', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('101', '1453958404', '2016-01-28 13:20:04', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('102', '1453958404', '2016-01-28 13:20:04', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('103', '1453958404', '2016-01-28 13:20:04', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('104', '1453958404', '2016-01-28 13:20:04', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('105', '1453958405', '2016-01-28 13:20:05', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('106', '1453958405', '2016-01-28 13:20:05', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('107', '1453958480', '2016-01-28 13:21:20', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('108', '1453958480', '2016-01-28 13:21:20', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('109', '1453958481', '2016-01-28 13:21:21', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453958480</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('110', '1453958494', '2016-01-28 13:21:34', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('111', '1453958494', '2016-01-28 13:21:34', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('112', '1453958494', '2016-01-28 13:21:34', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453958494</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('113', '1453958597', '2016-01-28 13:23:17', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('114', '1453958597', '2016-01-28 13:23:17', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('115', '1453958597', '2016-01-28 13:23:17', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453958597</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('116', '1453958957', '2016-01-28 13:29:17', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('117', '1453958957', '2016-01-28 13:29:17', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('118', '1453958957', '2016-01-28 13:29:17', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453958957</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('119', '1453958971', '2016-01-28 13:29:31', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('120', '1453958971', '2016-01-28 13:29:31', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('121', '1453958971', '2016-01-28 13:29:31', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453958971</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('122', '1453958984', '2016-01-28 13:29:44', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('123', '1453958984', '2016-01-28 13:29:44', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('124', '1453958984', '2016-01-28 13:29:44', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453958984</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('125', '1453959059', '2016-01-28 13:30:59', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('126', '1453959059', '2016-01-28 13:30:59', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('127', '1453959089', '2016-01-28 13:31:29', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('128', '1453959089', '2016-01-28 13:31:29', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('129', '1453959096', '2016-01-28 13:31:36', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('130', '1453959096', '2016-01-28 13:31:36', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('131', '1453959096', '2016-01-28 13:31:36', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453959096</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('132', '1453959098', '2016-01-28 13:31:38', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('133', '1453959098', '2016-01-28 13:31:38', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('134', '1453959098', '2016-01-28 13:31:38', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453959098</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('135', '1453959100', '2016-01-28 13:31:40', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('136', '1453959100', '2016-01-28 13:31:40', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('137', '1453959100', '2016-01-28 13:31:40', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453959100</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('138', '1453959109', '2016-01-28 13:31:49', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('139', '1453959109', '2016-01-28 13:31:49', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('140', '1453959109', '2016-01-28 13:31:49', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453959109</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('141', '1453959158', '2016-01-28 13:32:38', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_72c21308d5d5', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('142', '1453959158', '2016-01-28 13:32:38', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('143', '1453959158', '2016-01-28 13:32:38', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453959158</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('144', '1453959363', '2016-01-28 13:36:03', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('145', '1453959363', '2016-01-28 13:36:03', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453959363</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('146', '1453959793', '2016-01-28 13:43:13', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('147', '1453959936', '2016-01-28 13:45:36', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('148', '1453959986', '2016-01-28 13:46:26', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('149', '1453959992', '2016-01-28 13:46:32', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('150', '1453960089', '2016-01-28 13:48:09', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('151', '1453960117', '2016-01-28 13:48:37', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('152', '1453960276', '2016-01-28 13:51:16', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('153', '1453960276', '2016-01-28 13:51:16', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453960276</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('154', '1453960289', '2016-01-28 13:51:29', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('155', '1453960460', '2016-01-28 13:54:20', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('156', '1453960540', '2016-01-28 13:55:40', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('157', '1453960575', '2016-01-28 13:56:15', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('158', '1453960608', '2016-01-28 13:56:48', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('159', '1453960662', '2016-01-28 13:57:42', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('160', '1453960692', '2016-01-28 13:58:12', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('161', '1453960910', '2016-01-28 14:01:50', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('162', '1453960910', '2016-01-28 14:01:50', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[2016年会]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453960910</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('163', '1453960914', '2016-01-28 14:01:54', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('164', '1453960914', '2016-01-28 14:01:54', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1453960914</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('165', '1454373752', '2016-02-02 08:42:32', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('166', '1454373787', '2016-02-02 08:43:07', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('167', '1454373789', '2016-02-02 08:43:09', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('168', '1454373789', '2016-02-02 08:43:09', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('169', '1454373789', '2016-02-02 08:43:09', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_72c21308d5d5]]></FromUserName><CreateTime>1454373788</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('170', '1454373791', '2016-02-02 08:43:11', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('171', '1454373836', '2016-02-02 08:43:56', '3', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('172', '1454381576', '2016-02-02 10:52:56', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('173', '1454381576', '2016-02-02 10:52:56', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('174', '1454381582', '2016-02-02 10:53:02', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('175', '1454381582', '2016-02-02 10:53:02', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('176', '1454381585', '2016-02-02 10:53:05', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('177', '1454381585', '2016-02-02 10:53:05', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('178', '1454381595', '2016-02-02 10:53:15', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('179', '1454381595', '2016-02-02 10:53:15', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('180', '1454381604', '2016-02-02 10:53:24', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('181', '1454381604', '2016-02-02 10:53:24', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('182', '1454381612', '2016-02-02 10:53:32', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('183', '1454381612', '2016-02-02 10:53:32', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('184', '1454381634', '2016-02-02 10:53:54', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('185', '1454381634', '2016-02-02 10:53:54', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('186', '1454381830', '2016-02-02 10:57:10', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('187', '1454381830', '2016-02-02 10:57:10', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('188', '1454381902', '2016-02-02 10:58:22', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('189', '1454381902', '2016-02-02 10:58:22', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('190', '1454381907', '2016-02-02 10:58:27', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('191', '1454381907', '2016-02-02 10:58:27', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('192', '1454381990', '2016-02-02 10:59:50', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('193', '1454381990', '2016-02-02 10:59:50', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('194', '1454382234', '2016-02-02 11:03:54', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('195', '1454382234', '2016-02-02 11:03:54', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('196', '1454480229', '2016-02-03 14:17:09', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('197', '1454480229', '2016-02-03 14:17:09', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('198', '1454480230', '2016-02-03 14:17:10', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('199', '1454480230', '2016-02-03 14:17:10', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('200', '1454480231', '2016-02-03 14:17:11', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('201', '1454480231', '2016-02-03 14:17:11', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('202', '1454480232', '2016-02-03 14:17:12', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('203', '1454480232', '2016-02-03 14:17:12', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('204', '1454480234', '2016-02-03 14:17:14', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('205', '1454480234', '2016-02-03 14:17:14', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('206', '1454480235', '2016-02-03 14:17:15', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('207', '1454480235', '2016-02-03 14:17:15', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('208', '1454480236', '2016-02-03 14:17:16', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('209', '1454480236', '2016-02-03 14:17:16', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('210', '1454480237', '2016-02-03 14:17:17', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('211', '1454480237', '2016-02-03 14:17:17', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('212', '1454480238', '2016-02-03 14:17:18', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('213', '1454480238', '2016-02-03 14:17:18', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('214', '1454480239', '2016-02-03 14:17:19', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('215', '1454480239', '2016-02-03 14:17:19', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('216', '1454480240', '2016-02-03 14:17:20', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('217', '1454480240', '2016-02-03 14:17:20', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('218', '1454480587', '2016-02-03 14:23:07', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('219', '1454480587', '2016-02-03 14:23:07', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('220', '1454480612', '2016-02-03 14:23:32', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('221', '1454480612', '2016-02-03 14:23:32', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('222', '1454480648', '2016-02-03 14:24:08', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('223', '1454480648', '2016-02-03 14:24:08', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('224', '1454561543', '2016-02-04 12:52:23', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('225', '1454561543', '2016-02-04 12:52:23', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('226', '1454561543', '2016-02-04 12:52:23', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('227', '1454561543', '2016-02-04 12:52:23', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('228', '1454577737', '2016-02-04 17:22:17', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('229', '1454577737', '2016-02-04 17:22:17', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('230', '1454577742', '2016-02-04 17:22:22', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('231', '1454577742', '2016-02-04 17:22:22', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('232', '1454578142', '2016-02-04 17:29:02', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('233', '1454578142', '2016-02-04 17:29:02', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('234', '1454578174', '2016-02-04 17:29:34', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('235', '1454578174', '2016-02-04 17:29:34', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('236', '1454578270', '2016-02-04 17:31:10', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('237', '1454578270', '2016-02-04 17:31:10', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('238', '1454578532', '2016-02-04 17:35:32', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('239', '1454578532', '2016-02-04 17:35:32', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('240', '1454579062', '2016-02-04 17:44:22', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('241', '1454579062', '2016-02-04 17:44:22', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('242', '1454579062', '2016-02-04 17:44:22', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('243', '1454579062', '2016-02-04 17:44:22', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('244', '1454579062', '2016-02-04 17:44:22', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('245', '1454579062', '2016-02-04 17:44:22', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('246', '1454579062', '2016-02-04 17:44:22', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('247', '1454579062', '2016-02-04 17:44:22', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('248', '1454579093', '2016-02-04 17:44:53', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('249', '1454579093', '2016-02-04 17:44:53', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('250', '1454579093', '2016-02-04 17:44:53', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('251', '1454579093', '2016-02-04 17:44:53', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('252', '1454579146', '2016-02-04 17:45:46', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('253', '1454579146', '2016-02-04 17:45:46', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('254', '1454579171', '2016-02-04 17:46:11', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('255', '1454579171', '2016-02-04 17:46:11', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('256', '1454579171', '2016-02-04 17:46:11', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('257', '1454579171', '2016-02-04 17:46:11', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('258', '1455788412', '2016-02-18 17:40:12', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('259', '1455788412', '2016-02-18 17:40:12', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('260', '1455857029', '2016-02-19 12:43:49', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('261', '1455857029', '2016-02-19 12:43:49', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('262', '1455857034', '2016-02-19 12:43:54', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('263', '1455857034', '2016-02-19 12:43:54', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('264', '1455857182', '2016-02-19 12:46:22', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('265', '1455857182', '2016-02-19 12:46:22', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('266', '1455857261', '2016-02-19 12:47:41', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('267', '1455857261', '2016-02-19 12:47:41', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('268', '1455857267', '2016-02-19 12:47:47', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('269', '1455857267', '2016-02-19 12:47:47', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('270', '1455857272', '2016-02-19 12:47:52', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注微信！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455857261</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('271', '1455857285', '2016-02-19 12:48:05', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('272', '1455857286', '2016-02-19 12:48:06', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('273', '1455857286', '2016-02-19 12:48:06', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('274', '1455857286', '2016-02-19 12:48:06', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('275', '1455857287', '2016-02-19 12:48:07', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注微信！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455857285</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('276', '1455857516', '2016-02-19 12:51:56', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('277', '1455857516', '2016-02-19 12:51:56', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('278', '1455857517', '2016-02-19 12:51:57', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('279', '1455857517', '2016-02-19 12:51:57', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('280', '1455857523', '2016-02-19 12:52:03', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[tzxP9Xy4ISpzZcYTI2Aul6h7wAWd1Qasrt3NG5mVtoawtYBlqZVWBug2qwMxb98E]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455857516</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('281', '1455857524', '2016-02-19 12:52:04', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('282', '1455857524', '2016-02-19 12:52:04', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('283', '1455857526', '2016-02-19 12:52:06', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('284', '1455857526', '2016-02-19 12:52:06', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('285', '1455857531', '2016-02-19 12:52:11', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[wKUK_HX0z1-Bbyjz-lw1Ew2TPMutS_DX83Pet9YyqmEHfuYRAi5KoguET-1FqffH]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455857524</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('286', '1455857549', '2016-02-19 12:52:29', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('287', '1455857549', '2016-02-19 12:52:29', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('288', '1455857551', '2016-02-19 12:52:31', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('289', '1455857551', '2016-02-19 12:52:31', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('290', '1455857556', '2016-02-19 12:52:36', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[Fo-yvgVq8b_DdTbpChukShJvyHvoHf4FjWGnRB9Ou6Na5p4NbDgr1DkijIStuQE3]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455857549</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('291', '1455857598', '2016-02-19 12:53:18', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('292', '1455857598', '2016-02-19 12:53:18', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('293', '1455857607', '2016-02-19 12:53:27', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('294', '1455857607', '2016-02-19 12:53:27', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('295', '1455857631', '2016-02-19 12:53:51', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('296', '1455857631', '2016-02-19 12:53:51', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('297', '1455857768', '2016-02-19 12:56:08', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('298', '1455857768', '2016-02-19 12:56:08', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('299', '1455857788', '2016-02-19 12:56:28', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('300', '1455857788', '2016-02-19 12:56:28', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('301', '1455857883', '2016-02-19 12:58:03', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('302', '1455857883', '2016-02-19 12:58:03', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('303', '1455857945', '2016-02-19 12:59:05', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('304', '1455857945', '2016-02-19 12:59:05', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('305', '1455857947', '2016-02-19 12:59:07', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[关键字回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455857945</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('306', '1455858243', '2016-02-19 13:04:03', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('307', '1455858243', '2016-02-19 13:04:03', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('308', '1455858245', '2016-02-19 13:04:05', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[关键字回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455858243</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('309', '1455858283', '2016-02-19 13:04:43', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('310', '1455858283', '2016-02-19 13:04:43', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('311', '1455858295', '2016-02-19 13:04:55', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('312', '1455858295', '2016-02-19 13:04:55', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('313', '1455858317', '2016-02-19 13:05:17', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('314', '1455858317', '2016-02-19 13:05:17', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('315', '1455858339', '2016-02-19 13:05:39', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('316', '1455858339', '2016-02-19 13:05:39', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('317', '1455858342', '2016-02-19 13:05:42', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[关键字回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455858339</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('318', '1455858375', '2016-02-19 13:06:15', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('319', '1455858375', '2016-02-19 13:06:15', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('320', '1455858382', '2016-02-19 13:06:22', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[wKUK_HX0z1-Bbyjz-lw1EzsGPewlf-m3OGUQHQfCU3SkWy3J83SBsva-jC339SnX]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455858375</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('321', '1455858542', '2016-02-19 13:09:02', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('322', '1455858542', '2016-02-19 13:09:02', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('323', '1455858544', '2016-02-19 13:09:04', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[new]]></Title><Description><![CDATA[new]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-05/56b43c23cacac.jpg]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/Home/Material/news_detail/publicid/4/id/17.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455858542</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('324', '1455858560', '2016-02-19 13:09:20', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('325', '1455858560', '2016-02-19 13:09:20', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('326', '1455858572', '2016-02-19 13:09:32', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[wKUK_HX0z1-Bbyjz-lw1E-Ihkkx_2uIbxHDRO5ddBKfgwLsa4nNjPQrVwV0wKRe7]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455858560</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('327', '1455858587', '2016-02-19 13:09:47', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('328', '1455858587', '2016-02-19 13:09:47', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('329', '1455858588', '2016-02-19 13:09:48', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455858587</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('330', '1455858652', '2016-02-19 13:10:52', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('331', '1455858652', '2016-02-19 13:10:52', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('332', '1455858654', '2016-02-19 13:10:54', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455858652</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('333', '1455858663', '2016-02-19 13:11:03', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('334', '1455858663', '2016-02-19 13:11:03', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('335', '1455858664', '2016-02-19 13:11:04', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[new]]></Title><Description><![CDATA[new]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-05/56b43c23cacac.jpg]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/Home/Material/news_detail/publicid/4/id/17.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455858663</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('336', '1455858670', '2016-02-19 13:11:10', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('337', '1455858670', '2016-02-19 13:11:10', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('338', '1455858687', '2016-02-19 13:11:27', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[wKUK_HX0z1-Bbyjz-lw1E6OLXXCIK-YDP5rhcKtXiO4I1cqnAXjKnR4ZbL3RwEAL]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455858670</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('339', '1455860062', '2016-02-19 13:34:22', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('340', '1455860062', '2016-02-19 13:34:22', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('341', '1455860081', '2016-02-19 13:34:41', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[tzxP9Xy4ISpzZcYTI2Aul-y0RVCC1RvkH8t1ab4d85DvS_F9x-DdwODLi6K5douK]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455860062</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('342', '1455860165', '2016-02-19 13:36:05', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('343', '1455860165', '2016-02-19 13:36:05', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('344', '1455860167', '2016-02-19 13:36:07', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455860165</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('345', '1455860199', '2016-02-19 13:36:39', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('346', '1455860199', '2016-02-19 13:36:39', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('347', '1455860200', '2016-02-19 13:36:40', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455860199</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('348', '1455860296', '2016-02-19 13:38:16', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('349', '1455860296', '2016-02-19 13:38:16', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('350', '1455860303', '2016-02-19 13:38:23', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[tzxP9Xy4ISpzZcYTI2Aul6oblpxm9rL5qErxSKePrNrDbgBAk5th9jOYomABnhOQ]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455860296</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('351', '1455860342', '2016-02-19 13:39:02', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('352', '1455860342', '2016-02-19 13:39:02', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('353', '1455860344', '2016-02-19 13:39:04', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[BYg3P2ut0zFUuJ_HanLc9DkFWEGzbeHjT6z1GQNTxCk]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455860342</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('354', '1455860796', '2016-02-19 13:46:36', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('355', '1455860796', '2016-02-19 13:46:36', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('356', '1455861048', '2016-02-19 13:50:48', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('357', '1455861048', '2016-02-19 13:50:48', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('358', '1455861079', '2016-02-19 13:51:19', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('359', '1455861079', '2016-02-19 13:51:19', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('360', '1455861131', '2016-02-19 13:52:11', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('361', '1455861131', '2016-02-19 13:52:11', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('362', '1455861145', '2016-02-19 13:52:25', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('363', '1455861145', '2016-02-19 13:52:25', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('364', '1455861196', '2016-02-19 13:53:16', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('365', '1455861196', '2016-02-19 13:53:16', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('366', '1455861223', '2016-02-19 13:53:43', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('367', '1455861223', '2016-02-19 13:53:43', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('368', '1455861251', '2016-02-19 13:54:11', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('369', '1455861251', '2016-02-19 13:54:11', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('370', '1455861344', '2016-02-19 13:55:44', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('371', '1455861344', '2016-02-19 13:55:44', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('372', '1455861782', '2016-02-19 14:03:02', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('373', '1455861782', '2016-02-19 14:03:02', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('374', '1455861810', '2016-02-19 14:03:30', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('375', '1455861810', '2016-02-19 14:03:30', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('376', '1455861811', '2016-02-19 14:03:31', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[BYg3P2ut0zFUuJ_HanLc9DkFWEGzbeHjT6z1GQNTxCk]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455861810</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('377', '1455861826', '2016-02-19 14:03:46', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('378', '1455861826', '2016-02-19 14:03:46', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('379', '1455861828', '2016-02-19 14:03:48', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[new]]></Title><Description><![CDATA[new]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-05/56b43c23cacac.jpg]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/Home/Material/news_detail/publicid/4/id/17.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455861826</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('380', '1455861847', '2016-02-19 14:04:07', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('381', '1455861847', '2016-02-19 14:04:07', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('382', '1455861849', '2016-02-19 14:04:09', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455861846</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('383', '1455862059', '2016-02-19 14:07:39', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('384', '1455862059', '2016-02-19 14:07:39', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('385', '1455863468', '2016-02-19 14:31:08', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('386', '1455863468', '2016-02-19 14:31:08', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('387', '1455863493', '2016-02-19 14:31:33', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('388', '1455863493', '2016-02-19 14:31:33', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('389', '1455863494', '2016-02-19 14:31:34', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[关键字回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455863493</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('390', '1455863497', '2016-02-19 14:31:37', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[关键字回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455863468</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('391', '1455863505', '2016-02-19 14:31:45', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('392', '1455863505', '2016-02-19 14:31:45', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('393', '1455863506', '2016-02-19 14:31:46', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[new]]></Title><Description><![CDATA[new]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-05/56b43c23cacac.jpg]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/Home/Material/news_detail/publicid/4/id/17.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455863505</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('394', '1455863516', '2016-02-19 14:31:56', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('395', '1455863516', '2016-02-19 14:31:56', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('396', '1455863517', '2016-02-19 14:31:57', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[BYg3P2ut0zFUuJ_HanLc9DkFWEGzbeHjT6z1GQNTxCk]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455863515</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('397', '1455863521', '2016-02-19 14:32:01', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('398', '1455863521', '2016-02-19 14:32:01', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('399', '1455863522', '2016-02-19 14:32:02', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455863521</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('400', '1455863633', '2016-02-19 14:33:53', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('401', '1455863633', '2016-02-19 14:33:53', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('402', '1455863634', '2016-02-19 14:33:54', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('403', '1455863634', '2016-02-19 14:33:54', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('404', '1455863635', '2016-02-19 14:33:55', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[dfdfd]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455863633</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('405', '1455863648', '2016-02-19 14:34:08', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('406', '1455863648', '2016-02-19 14:34:08', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('407', '1455863649', '2016-02-19 14:34:09', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('408', '1455863649', '2016-02-19 14:34:09', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('409', '1455863651', '2016-02-19 14:34:11', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[dfdfd]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455863648</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('410', '1455863907', '2016-02-19 14:38:27', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('411', '1455863907', '2016-02-19 14:38:27', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('412', '1455863909', '2016-02-19 14:38:29', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('413', '1455863909', '2016-02-19 14:38:29', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('414', '1455863912', '2016-02-19 14:38:32', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[dfdfd]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455863907</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('415', '1455864079', '2016-02-19 14:41:19', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('416', '1455864079', '2016-02-19 14:41:19', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('417', '1455864090', '2016-02-19 14:41:30', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('418', '1455864090', '2016-02-19 14:41:30', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('419', '1455864113', '2016-02-19 14:41:53', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('420', '1455864113', '2016-02-19 14:41:53', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('421', '1455864482', '2016-02-19 14:48:02', '55', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('422', '1455864482', '2016-02-19 14:48:02', 'SSL_write() returned SYSCALL, errno = 10053', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('423', '1455864482', '2016-02-19 14:48:02', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455864079</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('424', '1455865930', '2016-02-19 15:12:10', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('425', '1455865930', '2016-02-19 15:12:10', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('426', '1455865958', '2016-02-19 15:12:38', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('427', '1455865958', '2016-02-19 15:12:38', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('428', '1455866127', '2016-02-19 15:15:27', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('429', '1455866127', '2016-02-19 15:15:27', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('430', '1455866127', '2016-02-19 15:15:27', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('431', '1455866127', '2016-02-19 15:15:27', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('432', '1455866127', '2016-02-19 15:15:27', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('433', '1455866127', '2016-02-19 15:15:27', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('434', '1455866127', '2016-02-19 15:15:27', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455866127</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('435', '1455866159', '2016-02-19 15:15:59', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('436', '1455866159', '2016-02-19 15:15:59', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('437', '1455866159', '2016-02-19 15:15:59', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('438', '1455866159', '2016-02-19 15:15:59', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('439', '1455866159', '2016-02-19 15:15:59', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('440', '1455866159', '2016-02-19 15:15:59', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('441', '1455866159', '2016-02-19 15:15:59', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455866159</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('442', '1455866165', '2016-02-19 15:16:05', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('443', '1455866165', '2016-02-19 15:16:05', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('444', '1455866165', '2016-02-19 15:16:05', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('445', '1455866165', '2016-02-19 15:16:05', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('446', '1455866165', '2016-02-19 15:16:05', '6', 'post_data flat');
INSERT INTO `dc_weixin_log` VALUES ('447', '1455866165', '2016-02-19 15:16:05', 'Could not resolve host: api.weixin.qq.com', 'post_data msg');
INSERT INTO `dc_weixin_log` VALUES ('448', '1455866165', '2016-02-19 15:16:05', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455866165</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('449', '1455866190', '2016-02-19 15:16:30', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('450', '1455866190', '2016-02-19 15:16:30', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('451', '1455866257', '2016-02-19 15:17:37', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('452', '1455866257', '2016-02-19 15:17:37', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('453', '1455866424', '2016-02-19 15:20:24', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('454', '1455866424', '2016-02-19 15:20:24', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('455', '1455866432', '2016-02-19 15:20:32', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('456', '1455866432', '2016-02-19 15:20:32', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('457', '1455866435', '2016-02-19 15:20:35', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[文本关注回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455866424</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('458', '1455866438', '2016-02-19 15:20:38', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('459', '1455866438', '2016-02-19 15:20:38', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('460', '1455866439', '2016-02-19 15:20:39', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('461', '1455866439', '2016-02-19 15:20:39', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('462', '1455866440', '2016-02-19 15:20:40', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[文本关注回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455866438</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('463', '1455866606', '2016-02-19 15:23:26', '6', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('464', '1455866623', '2016-02-19 15:23:43', '6', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('465', '1455866658', '2016-02-19 15:24:18', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('466', '1455866658', '2016-02-19 15:24:18', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('467', '1455866720', '2016-02-19 15:25:20', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('468', '1455866720', '2016-02-19 15:25:20', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('469', '1455867242', '2016-02-19 15:34:02', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('470', '1455867242', '2016-02-19 15:34:02', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('471', '1455867245', '2016-02-19 15:34:05', '63', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('472', '1455867245', '2016-02-19 15:34:05', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[文本关注回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455867242</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('473', '1455867384', '2016-02-19 15:36:24', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('474', '1455867384', '2016-02-19 15:36:24', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('475', '1455867385', '2016-02-19 15:36:25', '64', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('476', '1455867385', '2016-02-19 15:36:25', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[文本关注回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455867384</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('477', '1455867894', '2016-02-19 15:44:54', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('478', '1455867894', '2016-02-19 15:44:54', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('479', '1455867896', '2016-02-19 15:44:56', '65', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('480', '1455867896', '2016-02-19 15:44:56', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[文本关注回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455867894</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('481', '1455867907', '2016-02-19 15:45:07', '65', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('482', '1455867915', '2016-02-19 15:45:15', '65', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('483', '1455868276', '2016-02-19 15:51:16', '65', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('484', '1455868307', '2016-02-19 15:51:47', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('485', '1455868307', '2016-02-19 15:51:47', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('486', '1455868309', '2016-02-19 15:51:49', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[文本关注回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868307</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('487', '1455868358', '2016-02-19 15:52:38', '66', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('488', '1455868361', '2016-02-19 15:52:41', '66', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('489', '1455868406', '2016-02-19 15:53:26', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('490', '1455868406', '2016-02-19 15:53:26', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('491', '1455868408', '2016-02-19 15:53:28', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[文本关注回复！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868406</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('492', '1455868416', '2016-02-19 15:53:36', '67', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('493', '1455868419', '2016-02-19 15:53:39', '67', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('494', '1455868471', '2016-02-19 15:54:31', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('495', '1455868471', '2016-02-19 15:54:31', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('496', '1455868479', '2016-02-19 15:54:39', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[BYg3P2ut0zFUuJ_HanLc9DkFWEGzbeHjT6z1GQNTxCk]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868471</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('497', '1455868518', '2016-02-19 15:55:18', '68', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('498', '1455868526', '2016-02-19 15:55:26', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('499', '1455868526', '2016-02-19 15:55:26', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('500', '1455868528', '2016-02-19 15:55:28', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[BYg3P2ut0zFUuJ_HanLc9DkFWEGzbeHjT6z1GQNTxCk]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868526</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('501', '1455868604', '2016-02-19 15:56:44', '69', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('502', '1455868611', '2016-02-19 15:56:51', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('503', '1455868611', '2016-02-19 15:56:51', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('504', '1455868612', '2016-02-19 15:56:52', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[new]]></Title><Description><![CDATA[new]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-05/56b43c23cacac.jpg]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/Home/Material/news_detail/publicid/4/id/17.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868611</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('505', '1455868627', '2016-02-19 15:57:07', '70', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('506', '1455868641', '2016-02-19 15:57:21', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('507', '1455868641', '2016-02-19 15:57:21', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('508', '1455868642', '2016-02-19 15:57:22', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868640</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('509', '1455868939', '2016-02-19 16:02:19', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('510', '1455868939', '2016-02-19 16:02:19', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[未识别文本回复]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868939</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('511', '1455868953', '2016-02-19 16:02:33', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('512', '1455868954', '2016-02-19 16:02:34', '<?xml version=\"1.0\"?>\n<xml><Image><MediaId><![CDATA[BYg3P2ut0zFUuJ_HanLc9DkFWEGzbeHjT6z1GQNTxCk]]></MediaId></Image><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868953</CreateTime><MsgType><![CDATA[image]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('513', '1455868965', '2016-02-19 16:02:45', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('514', '1455868965', '2016-02-19 16:02:45', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[Android]]></Title><Description><![CDATA[Android]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-03/56b208829fc0b.png]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/Home/Material/news_detail/publicid/4/id/16.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868965</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('515', '1455868974', '2016-02-19 16:02:54', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('516', '1455868974', '2016-02-19 16:02:54', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[Android]]></Title><Description><![CDATA[Android]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-03/56b208829fc0b.png]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/Home/Material/news_detail/publicid/4/id/16.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868974</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('517', '1455868986', '2016-02-19 16:03:06', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('518', '1455868987', '2016-02-19 16:03:07', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455868986</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('519', '1455869007', '2016-02-19 16:03:27', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('520', '1455869007', '2016-02-19 16:03:27', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869007</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('521', '1455869189', '2016-02-19 16:06:29', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('522', '1455869190', '2016-02-19 16:06:30', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>0</ArticleCount><Articles><![CDATA[]]></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869189</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('523', '1455869282', '2016-02-19 16:08:02', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('524', '1455869283', '2016-02-19 16:08:03', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>5</ArticleCount><Articles><item><Title><![CDATA[苏州天气预报]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[]]></PicUrl><Url><![CDATA[]]></Url></item><item><Title><![CDATA[周五 02月19日 (实时：9℃)\n阴转多云 东风微风 12 ~ 4℃]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/yin.png]]></PicUrl><Url><![CDATA[]]></Url></item><item><Title><![CDATA[周六\n多云 西北风3-4级 11 ~ 1℃]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/duoyun.png]]></PicUrl><Url><![CDATA[]]></Url></item><item><Title><![CDATA[周日\n多云转小雨 北风微风 10 ~ 4℃]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/duoyun.png]]></PicUrl><Url><![CDATA[]]></Url></item><item><Title><![CDATA[周一\n中雨转小雨 东风微风 8 ~ 6℃]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/zhongyu.png]]></PicUrl><Url><![CDATA[]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869282</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('525', '1455869406', '2016-02-19 16:10:06', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('526', '1455869406', '2016-02-19 16:10:06', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[请输入要查询城市的名称，如：北京天气]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869406</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('527', '1455869415', '2016-02-19 16:10:15', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('528', '1455869415', '2016-02-19 16:10:15', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[请输入要查询城市的名称，如：北京天气]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869415</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('529', '1455869418', '2016-02-19 16:10:18', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[没找到耶！...〒_〒]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869415</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('530', '1455869418', '2016-02-19 16:10:18', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[没找到耶！...〒_〒]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869406</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('531', '1455869438', '2016-02-19 16:10:38', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('532', '1455869438', '2016-02-19 16:10:38', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[请输入要查询城市的名称，如输入：北京天气]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869438</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('533', '1455869438', '2016-02-19 16:10:38', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[没找到耶！...〒_〒]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869438</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('534', '1455869444', '2016-02-19 16:10:44', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('535', '1455869444', '2016-02-19 16:10:44', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[没找到耶！...〒_〒]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869443</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('536', '1455869485', '2016-02-19 16:11:25', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('537', '1455869486', '2016-02-19 16:11:26', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>5</ArticleCount><Articles><item><Title><![CDATA[北京天气预报]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[]]></PicUrl><Url><![CDATA[]]></Url></item><item><Title><![CDATA[周五 02月19日 (实时：5℃)\n多云转晴 北风3-4级 8 ~ -4℃]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/duoyun.png]]></PicUrl><Url><![CDATA[]]></Url></item><item><Title><![CDATA[周六\n晴 微风 4 ~ -5℃]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/qing.png]]></PicUrl><Url><![CDATA[]]></Url></item><item><Title><![CDATA[周日\n晴转多云 微风 6 ~ -3℃]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/qing.png]]></PicUrl><Url><![CDATA[]]></Url></item><item><Title><![CDATA[周一\n多云转晴 北风3-4级 7 ~ -3℃]]></Title><Description><![CDATA[]]></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/duoyun.png]]></PicUrl><Url><![CDATA[]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455869485</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('538', '1455870243', '2016-02-19 16:24:03', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('539', '1455870243', '2016-02-19 16:24:03', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455870243</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('540', '1455870754', '2016-02-19 16:32:34', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('541', '1455870754', '2016-02-19 16:32:34', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455870754</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('542', '1455870772', '2016-02-19 16:32:52', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('543', '1455870772', '2016-02-19 16:32:52', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[无法获取北京天气情况！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455870772</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('544', '1455871046', '2016-02-19 16:37:26', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('545', '1455871047', '2016-02-19 16:37:27', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[高富帅]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455871046</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('546', '1455871053', '2016-02-19 16:37:33', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('547', '1455871053', '2016-02-19 16:37:33', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[高富帅]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455871053</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('548', '1455871059', '2016-02-19 16:37:39', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('549', '1455871059', '2016-02-19 16:37:39', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[高富帅]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455871059</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('550', '1455874288', '2016-02-19 17:31:28', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('551', '1455874288', '2016-02-19 17:31:28', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[自定义图文回复]]></Title><Description><![CDATA[自定义图文回复]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-19/56c6e0c4a477c.png]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/detail/token/gh_6019aad69b3f/openid/oVFP7s-1D7vEZT0wmvmLbXvDt1_8/id/1.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455874288</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('552', '1455875076', '2016-02-19 17:44:36', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('553', '1455875076', '2016-02-19 17:44:36', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[休息休息美丽]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455875075</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('554', '1455875093', '2016-02-19 17:44:53', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('555', '1455875093', '2016-02-19 17:44:53', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[休息休息美丽]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455875093</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('556', '1455875100', '2016-02-19 17:45:00', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('557', '1455875100', '2016-02-19 17:45:00', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[休息休息美丽]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455875100</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('558', '1455875732', '2016-02-19 17:55:32', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('559', '1455875732', '2016-02-19 17:55:32', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[自定义图文回复]]></Title><Description><![CDATA[自定义图文回复]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-19/56c6e0c4a477c.png]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/detail/token/gh_6019aad69b3f/openid/oVFP7s-1D7vEZT0wmvmLbXvDt1_8/id/1.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455875732</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('560', '1455875958', '2016-02-19 17:59:18', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('561', '1455875958', '2016-02-19 17:59:18', '<?xml version=\"1.0\"?>\n<xml><ArticleCount>2</ArticleCount><Articles><item><Title><![CDATA[自定义图文回复]]></Title><Description><![CDATA[自定义图文回复]]></Description><PicUrl><![CDATA[http://localhost/douchat/Uploads/Picture/2016-02-19/56c6e0c4a477c.png]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/detail/token/gh_6019aad69b3f/openid/oVFP7s-1D7vEZT0wmvmLbXvDt1_8/id/1.html]]></Url></item><item><Title><![CDATA[ccc]]></Title><Description><![CDATA[ccc]]></Description><PicUrl><![CDATA[]]></PicUrl><Url><![CDATA[http://localhost/douchat/index.php?s=/addon/CustomReply/CustomReply/detail/token/gh_6019aad69b3f/openid/oVFP7s-1D7vEZT0wmvmLbXvDt1_8/id/2.html]]></Url></item></Articles><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455875958</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('562', '1455877749', '2016-02-19 18:29:09', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('563', '1455877749', '2016-02-19 18:29:09', '<?xml version=\"1.0\"?>\n<xml><Voice><MediaId><![CDATA[jORD6Mif5gDIBSXtWDaHpvB6xiqm0_256tZbxoe2KN4]]></MediaId></Voice><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455877749</CreateTime><MsgType><![CDATA[voice]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('564', '1455877857', '2016-02-19 18:30:57', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('565', '1455877857', '2016-02-19 18:30:57', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455877857</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `dc_weixin_log` VALUES ('566', '1455897132', '2016-02-19 23:52:12', '71', 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('567', '1455897142', '2016-02-19 23:52:22', null, 'init_follow_check_uid');
INSERT INTO `dc_weixin_log` VALUES ('568', '1455897142', '2016-02-19 23:52:22', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8::_gh_6019aad69b3f', 'init_follow_in');
INSERT INTO `dc_weixin_log` VALUES ('569', '1455897142', '2016-02-19 23:52:22', '<?xml version=\"1.0\"?>\n<xml><Content><![CDATA[欢迎关注！]]></Content><ToUserName><![CDATA[oVFP7s-1D7vEZT0wmvmLbXvDt1_8]]></ToUserName><FromUserName><![CDATA[gh_6019aad69b3f]]></FromUserName><CreateTime>1455897142</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');

-- ----------------------------
-- Table structure for `dc_weixin_message`
-- ----------------------------
DROP TABLE IF EXISTS `dc_weixin_message`;
CREATE TABLE `dc_weixin_message` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `ToUserName` varchar(100) default NULL COMMENT 'Token',
  `FromUserName` varchar(100) default NULL COMMENT 'OpenID',
  `CreateTime` int(10) default NULL COMMENT '创建时间',
  `MsgType` varchar(30) default NULL COMMENT '消息类型',
  `MsgId` varchar(100) default NULL COMMENT '消息ID',
  `Content` text COMMENT '文本消息内容',
  `PicUrl` varchar(255) default NULL COMMENT '图片链接',
  `MediaId` varchar(100) default NULL COMMENT '多媒体文件ID',
  `Format` varchar(30) default NULL COMMENT '语音格式',
  `ThumbMediaId` varchar(30) default NULL COMMENT '缩略图的媒体id',
  `Title` varchar(100) default NULL COMMENT '消息标题',
  `Description` text COMMENT '消息描述',
  `Url` varchar(255) default NULL COMMENT 'Url',
  `collect` tinyint(1) default '0' COMMENT '收藏状态',
  `deal` tinyint(1) default '0' COMMENT '处理状态',
  `is_read` tinyint(1) default '0' COMMENT '是否已读',
  `type` tinyint(1) default '0' COMMENT '消息分类',
  `is_material` int(10) default '0' COMMENT '设置为文本素材',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_weixin_message
-- ----------------------------
INSERT INTO `dc_weixin_message` VALUES ('72', 'gh_6019aad69b3f', 'oHEGDw9PZ7ZgE3drhWpvOKJ9_4Ho', '1455788412', null, '2', '{\"news\":{\"articles\":[{\"title\":\"Android\",\"description\":\"Android\",\"url\":\"http:\\/\\/localhost\\/douchat\\/index.php?s=\\/Home\\/Material\\/news_detail\\/id\\/16.html\",\"picurl\":\"http:\\/\\/localhost\\/douchat\\/Uploads\\/Picture\\/2016-02-03\\/56b208829fc0b.png\"}]},\"touser\":\"oHEGDw9PZ7ZgE3drhWpvOKJ9_4Ho\",\"msgtype\":\"news\"}', null, null, null, null, null, null, null, '0', '0', '1', '1', '0');
INSERT INTO `dc_weixin_message` VALUES ('73', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455857596', 'text', '1234567890123456', '关键字回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('74', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455857596', 'text', '1234567890123456', '关键字回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('75', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455857596', 'text', '1234567890123456', '关键字回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('76', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455857596', 'text', '1234567890123456', '关键字回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('77', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455857596', 'text', '1234567890123456', '关键字回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('78', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455857596', 'text', '1234567890123456', '关键字回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('79', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455857596', 'text', '1234567890123456', '关键字回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('80', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455857596', 'text', '1234567890123456', '关键字回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('81', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858282', 'text', '1234567890123456', '关键字回复 - 文本', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('82', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858293', 'text', '1234567890123456', '关键字回复 - 文本', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('83', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858293', 'text', '1234567890123456', '关键字回复 - 文本', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('84', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858338', 'text', '1234567890123456', '关键字回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('85', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858372', 'text', '1234567890123456', '图片关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('86', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858541', 'text', '1234567890123456', '图文关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('87', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858559', 'text', '1234567890123456', '图片关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('88', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858586', 'text', '1234567890123456', '语音关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('89', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858586', 'text', '1234567890123456', '语音关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('90', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858661', 'text', '1234567890123456', '图文关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('91', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858669', 'text', '1234567890123456', '图片关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('92', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455858669', 'text', '1234567890123456', '图片关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('93', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455860163', 'text', '1234567890123456', '语音关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('94', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455860163', 'text', '1234567890123456', '语音关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('95', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455860295', 'text', '1234567890123456', '图片关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('96', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455860295', 'text', '1234567890123456', '图片关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('97', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455860793', 'text', '1234567890123456', '文本关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('98', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455861194', 'text', '1234567890123456', '文本关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('99', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455861807', 'text', '1234567890123456', '图片关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('100', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455861824', 'text', '1234567890123456', '图文关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('101', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455861845', 'text', '1234567890123456', '语音关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('102', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455862058', 'text', '1234567890123456', '文本关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('103', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455862058', 'text', '1234567890123456', '文本关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('104', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455862058', 'text', '1234567890123456', '文本关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('105', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455863504', 'text', '1234567890123456', '图文关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('106', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455863514', 'text', '1234567890123456', '图片关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('107', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455863520', 'text', '1234567890123456', '语音关键字', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('108', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455864077', 'text', '1234567890123456', '但是当时是', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('109', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455868935', 'text', '1234567890123456', '但是当时是', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('110', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455868935', 'text', '1234567890123456', '但是当时是', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('111', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455868935', 'text', '1234567890123456', '但是当时是', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('112', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455868935', 'text', '1234567890123456', '但是当时是', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('113', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455868935', 'text', '1234567890123456', '但是当时是', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('114', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455869006', 'text', '1234567890123456', '天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('115', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455869006', 'text', '1234567890123456', '天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('116', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455869279', 'text', '1234567890123456', '苏州天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('117', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455869405', 'text', '1234567890123456', '天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('118', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455869405', 'text', '1234567890123456', '天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('119', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455869405', 'text', '1234567890123456', '天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('120', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455869443', 'text', '1234567890123456', '北京天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('121', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455869443', 'text', '1234567890123456', '北京天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('122', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455870242', 'text', '1234567890123456', '天气北京', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('123', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455870753', 'text', '1234567890123456', '北京天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('124', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455870753', 'text', '1234567890123456', '北京天气', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('125', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455871045', 'text', '1234567890123456', '高', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('126', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455871052', 'text', '1234567890123456', '富', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('127', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455871058', 'text', '1234567890123456', '帅', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('128', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455874287', 'text', '1234567890123456', '自定义图文回复', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('129', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455875073', 'text', '1234567890123456', '美丽', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('130', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455875092', 'text', '1234567890123456', '嘻嘻嘻美丽', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('131', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455875099', 'text', '1234567890123456', '得到美丽', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('132', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455875730', 'text', '1234567890123456', '自定义图文回复1', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('133', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455875958', 'text', '1234567890123456', 'ccc', null, null, null, null, null, null, null, '0', '0', '0', '0', '0');
INSERT INTO `dc_weixin_message` VALUES ('134', 'gh_6019aad69b3f', 'oVFP7s-1D7vEZT0wmvmLbXvDt1_8', '1455877748', 'location', '1234567890123456', null, null, null, null, null, null, null, null, '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `dc_xdlog`
-- ----------------------------
DROP TABLE IF EXISTS `dc_xdlog`;
CREATE TABLE `dc_xdlog` (
  `id` bigint(20) NOT NULL auto_increment,
  `userid_int` int(11) NOT NULL,
  `biztitle` text,
  `biztype` int(11) NOT NULL default '0',
  `opttime` bigint(20) default NULL,
  `xd` bigint(20) default NULL,
  `sceneid` bigint(20) default '0',
  `remark` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_xdlog
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_xydzp`
-- ----------------------------
DROP TABLE IF EXISTS `dc_xydzp`;
CREATE TABLE `dc_xydzp` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `end_date` int(10) default NULL COMMENT '结束日期',
  `cTime` int(10) default NULL COMMENT '活动创建时间',
  `states` char(10) default '0' COMMENT '活动状态',
  `picurl` int(10) unsigned default NULL COMMENT '封面图片',
  `title` varchar(255) default NULL COMMENT '活动标题',
  `guiz` text COMMENT '活动规则',
  `choujnum` int(10) unsigned default '0' COMMENT '每日抽奖次数',
  `des` text COMMENT '活动介绍',
  `des_jj` text COMMENT '活动介绍',
  `token` varchar(255) default NULL COMMENT 'Token',
  `keyword` varchar(255) default NULL COMMENT '关键词',
  `start_date` int(10) default NULL COMMENT '开始时间',
  `experience` int(10) default '0' COMMENT '消耗经验值',
  `background` int(10) unsigned default NULL COMMENT '背景图',
  `template` varchar(255) default 'default' COMMENT '素材模板',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_xydzp
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_xydzp_jplist`
-- ----------------------------
DROP TABLE IF EXISTS `dc_xydzp_jplist`;
CREATE TABLE `dc_xydzp_jplist` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `gailv` int(10) unsigned default '0' COMMENT '中奖概率',
  `gailv_str` varchar(255) default NULL COMMENT '参数',
  `xydzp_id` int(10) unsigned default '0' COMMENT '幸运大转盘关联的活动id',
  `jlnum` int(10) unsigned default '1' COMMENT '奖励数量',
  `type` char(50) default '0' COMMENT '奖品中奖方式',
  `gailv_maxnum` int(10) unsigned default '0' COMMENT '单日发放上限',
  `xydzp_option_id` int(10) unsigned default NULL COMMENT '幸运大转盘关联的全局奖品id',
  PRIMARY KEY  (`id`),
  KEY `xydzp_id` (`xydzp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_xydzp_jplist
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_xydzp_log`
-- ----------------------------
DROP TABLE IF EXISTS `dc_xydzp_log`;
CREATE TABLE `dc_xydzp_log` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` varchar(255) default NULL COMMENT '用户openid',
  `message` text COMMENT '留言',
  `address` text COMMENT '收件地址',
  `iphone` varchar(255) default NULL COMMENT '电话',
  `zip` int(10) unsigned default NULL COMMENT '邮编',
  `state` tinyint(2) default '0' COMMENT '领奖状态',
  `xydzp_option_id` int(10) unsigned default '0' COMMENT '奖品id',
  `xydzp_id` int(10) unsigned default '0' COMMENT '活动id',
  `zjdate` int(10) unsigned default NULL COMMENT '中奖时间',
  PRIMARY KEY  (`id`),
  KEY `xydzp_id` (`uid`,`xydzp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_xydzp_log
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_xydzp_option`
-- ----------------------------
DROP TABLE IF EXISTS `dc_xydzp_option`;
CREATE TABLE `dc_xydzp_option` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `jptype` char(10) default '0' COMMENT '奖品类型',
  `duijma` text COMMENT '兑奖码',
  `title` varchar(255) default NULL COMMENT '奖品名称',
  `pic` int(10) unsigned default NULL COMMENT '奖品图片',
  `miaoshu` text COMMENT '奖品描述',
  `num` int(10) unsigned default '0' COMMENT '库存数量',
  `isdf` tinyint(2) default '0' COMMENT '是否为谢谢惠顾类',
  `token` varchar(255) default NULL COMMENT 'Token',
  `coupon_id` int(10) default NULL COMMENT '优惠券编号',
  `experience` int(10) default '0' COMMENT '奖励经验值',
  `card_url` varchar(255) default NULL COMMENT '领取卡券的地址',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_xydzp_option
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_xydzp_userlog`
-- ----------------------------
DROP TABLE IF EXISTS `dc_xydzp_userlog`;
CREATE TABLE `dc_xydzp_userlog` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `uid` varchar(255) default NULL COMMENT '用户id',
  `xydzp_id` int(10) unsigned default NULL COMMENT '幸运大转盘关联的活动id',
  `num` int(10) unsigned default '0' COMMENT '已经抽奖的次数',
  `cjdate` int(10) default NULL COMMENT '抽奖日期',
  PRIMARY KEY  (`id`),
  KEY `xydzp_id` (`uid`,`xydzp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_xydzp_userlog
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_youaskservice_group`
-- ----------------------------
DROP TABLE IF EXISTS `dc_youaskservice_group`;
CREATE TABLE `dc_youaskservice_group` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `token` varchar(255) default NULL COMMENT 'token',
  `groupname` varchar(255) default NULL COMMENT '分组名称',
  `groupdata` text COMMENT '分组数据源',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_youaskservice_group
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_youaskservice_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `dc_youaskservice_keyword`;
CREATE TABLE `dc_youaskservice_keyword` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `msgkeyword` varchar(555) default NULL COMMENT '消息关键字',
  `msgkeyword_type` char(50) default '3' COMMENT '关键字类型',
  `msgkfaccount` varchar(255) default NULL COMMENT '接待的客服人员',
  `cTime` int(10) default NULL COMMENT '创建时间',
  `token` varchar(255) default NULL COMMENT 'token',
  `msgstate` tinyint(2) default '1' COMMENT '关键字状态',
  `zjnum` int(10) default NULL COMMENT '转接次数',
  `zdtype` char(10) default '0' COMMENT '指定类型',
  `kfgroupid` int(10) default '0' COMMENT '客服分组id',
  `kf_explain` varchar(255) default NULL COMMENT '客服说明',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_youaskservice_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `dc_youaskservice_user`
-- ----------------------------
DROP TABLE IF EXISTS `dc_youaskservice_user`;
CREATE TABLE `dc_youaskservice_user` (
  `id` int(10) unsigned NOT NULL auto_increment COMMENT '主键',
  `name` varchar(60) default NULL COMMENT '客服昵称',
  `token` varchar(60) default NULL COMMENT 'token',
  `userName` varchar(60) default NULL COMMENT '客服帐号',
  `userPwd` varchar(32) default NULL COMMENT '客服密码',
  `endJoinDate` int(11) default NULL COMMENT '客服加入时间',
  `status` tinyint(1) default '0' COMMENT '客服在线状态',
  `state` tinyint(2) default '0' COMMENT '客服状态',
  `isdelete` tinyint(2) default '0' COMMENT '是否删除',
  `kfid` varchar(255) default NULL COMMENT '客服编号',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dc_youaskservice_user
-- ----------------------------
