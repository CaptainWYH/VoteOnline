/*
SQLyog  v12.2.6 (64 bit)
MySQL - 8.0.24 : Database - vote_online
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vote_online` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vote_online`;

/*Table structure for table `applicants` */

DROP TABLE IF EXISTS `applicants`;

CREATE TABLE `applicants` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `match_id` int NOT NULL COMMENT '比赛id',
  `race_schedule` int NOT NULL DEFAULT '1' COMMENT '1-初赛 2-决赛',
  `player_id` int NOT NULL COMMENT '选手id',
  `song_title` varchar(80) NOT NULL COMMENT '曲目名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `applicants` */

insert  into `applicants`(`id`,`match_id`,`race_schedule`,`player_id`,`song_title`) values 
(7,1,1,1,'hello1'),
(8,1,2,1,'hello2'),
(9,3,1,102,'雇佣者'),
(10,3,2,102,'Duck'),
(11,1,1,102,'Cool'),
(12,1,2,102,'AUB'),
(13,1,1,101,'test'),
(14,1,2,101,'test2'),
(15,1,1,110,'哈哈哈哈'),
(16,1,2,110,'德玛西亚啦啦啦'),
(17,1,1,113,'水手'),
(18,1,2,113,'彩虹岛'),
(19,1,1,112,'青花瓷'),
(20,1,2,112,'等你下课'),
(21,1,1,111,'龙卷风'),
(22,1,2,111,'发如雪'),
(23,1,1,109,'本草纲目'),
(24,1,2,109,'反向的钟'),
(25,1,1,108,'红尘客栈'),
(26,1,2,108,'倒影'),
(27,1,1,107,'告白气球'),
(28,1,2,107,'Mojito'),
(29,1,1,106,'晴天'),
(30,1,2,106,'一路向北'),
(31,1,1,105,'简单爱'),
(32,1,2,105,'说好不哭'),
(33,7,1,1,'算什么男人'),
(34,7,2,1,'伟大的作品'),
(35,6,1,110,'龙卷风'),
(36,6,2,110,'简单爱'),
(37,1,1,125,'东风破'),
(38,1,2,125,'七里香'),
(39,1,1,120,'龙拳'),
(40,1,2,120,'双截棍'),
(41,1,1,121,'黄金甲'),
(42,1,2,121,'不能说的秘密'),
(43,1,1,119,'周大侠'),
(44,1,2,119,'千山万水'),
(45,1,1,117,'等你下课'),
(46,1,2,117,'不爱我就拉倒'),
(47,1,1,123,'我是如此相信'),
(48,1,2,123,'说好不哭'),
(49,1,1,118,'黑色幽默'),
(50,1,2,118,'斗牛'),
(51,1,1,124,'娘子'),
(52,1,2,124,'伊斯坦堡'),
(53,1,1,122,'简单爱'),
(54,1,2,122,'上海一九四三');

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`class_name`,`tpl_category`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`gen_type`,`gen_path`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'applicants','曲目','',NULL,'Applicants','crud','com.vote','vote-own','applicants','曲目信息','ruoyi','0','/','{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"投票系统管理\",\"treeCode\":\"\"}','admin','2022-07-05 15:56:47','','2022-07-05 23:07:05',''),
(2,'judges_points','评委打分信息','',NULL,'JudgesPoints','crud','com.vote','vote-own','points','评委打分','ruoyi','0','/','{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"投票系统管理\",\"treeCode\":\"\"}','admin','2022-07-05 15:56:48','','2022-07-05 23:38:16',''),
(3,'match','比赛信息','',NULL,'Match','crud','com.vote','vote-own','match','比赛信息','ruoyi','0','/','{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"投票系统管理\",\"treeCode\":\"\"}','admin','2022-07-05 15:56:49','','2022-07-05 23:22:10',''),
(4,'match_judges','比赛评委中间表','',NULL,'MatchJudges','crud','com.vote','vote-own','match_judges','比赛评委中间表','ruoyi','0','/','{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"投票系统管理\",\"treeCode\":\"\"}','admin','2022-07-05 15:56:50','','2022-07-05 23:01:37',''),
(5,'match_session','比赛场次','',NULL,'MatchSession','crud','com.vote','vote-own','match_session','比赛场次','ruoyi','0','/','{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"投票系统管理\",\"treeCode\":\"\"}','admin','2022-07-05 15:56:50','','2022-07-05 23:32:28',''),
(6,'result_match','比赛结果信息','',NULL,'ResultMatch','crud','com.vote','vote-own','result_match','比赛结果','魏渝辉','0','/','{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"投票系统管理\",\"treeCode\":\"\"}','admin','2022-07-05 15:56:52','','2022-07-05 23:01:24',''),
(7,'semi_finals','复赛表','',NULL,'SemiFinals','crud','com.vote','vote-own','finals','复赛管理','魏渝辉','0','/','{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"投票系统管理\",\"treeCode\":\"\"}','admin','2022-07-05 15:56:53','','2022-07-05 22:51:55',''),
(8,'viewer_vote','观众投票管理','',NULL,'ViewerVote','crud','com.vote.system','vote-own','vote','观众投票管理','魏渝辉','0','/','{\"parentMenuId\":\"2001\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"投票系统管理\",\"treeCode\":\"\"}','admin','2022-07-05 15:56:54','','2022-07-05 21:47:39','');

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'1','id','主键id','int','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-07-05 15:56:47',NULL,'2022-07-05 23:07:05'),
(2,'1','match_id','比赛id','int','Integer','matchId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-07-05 15:56:47',NULL,'2022-07-05 23:07:05'),
(3,'1','race_schedule','1-初赛 2-决赛','int','Integer','raceSchedule','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-07-05 15:56:47',NULL,'2022-07-05 23:07:05'),
(4,'1','player_id','选手id','int','Integer','playerId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2022-07-05 15:56:47',NULL,'2022-07-05 23:07:05'),
(5,'1','song_title','曲目名称','varchar(80)','String','songTitle','0','0','1','1','1','1','1','EQ','input','',5,'admin','2022-07-05 15:56:47',NULL,'2022-07-05 23:07:05'),
(6,'2','id','主键id','int','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-07-05 15:56:48',NULL,'2022-07-05 23:38:16'),
(7,'2','match_id','比赛id','int','Integer','matchId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-07-05 15:56:48',NULL,'2022-07-05 23:38:16'),
(8,'2','race_schedule','赛程','int','Integer','raceSchedule','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-07-05 15:56:48',NULL,'2022-07-05 23:38:16'),
(9,'2','session_id','场次id','int','Integer','sessionId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2022-07-05 15:56:48',NULL,'2022-07-05 23:38:17'),
(10,'2','judges_id','评委id','int','Integer','judgesId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2022-07-05 15:56:48',NULL,'2022-07-05 23:38:17'),
(11,'2','player_id','选手id','int','Integer','playerId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2022-07-05 15:56:49',NULL,'2022-07-05 23:38:17'),
(12,'2','points','评委分数','int','Integer','points','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2022-07-05 15:56:49',NULL,'2022-07-05 23:38:17'),
(13,'3','match_id','比赛id 主键','int','Integer','matchId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-07-05 15:56:49',NULL,'2022-07-05 23:22:10'),
(14,'3','match_name','比赛名称','varchar(80)','String','matchName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2022-07-05 15:56:49',NULL,'2022-07-05 23:22:10'),
(15,'3','match_begin_time','比赛开始时间','datetime','Date','matchBeginTime','0','0','1','1','1','1','1','EQ','datetime','',3,'admin','2022-07-05 15:56:50',NULL,'2022-07-05 23:22:10'),
(16,'3','match_end_time','比赛截止时间','datetime','Date','matchEndTime','0','0','1','1','1','1','1','EQ','datetime','',4,'admin','2022-07-05 15:56:50',NULL,'2022-07-05 23:22:10'),
(17,'4','match_id','比赛id','int','Integer','matchId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2022-07-05 15:56:50',NULL,'2022-07-05 23:01:37'),
(18,'4','judges_id','评委id','int','Integer','judgesId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-07-05 15:56:50',NULL,'2022-07-05 23:01:37'),
(19,'4','race_schedule','1-初赛  2-决赛','int','Integer','raceSchedule','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-07-05 15:56:50',NULL,'2022-07-05 23:01:37'),
(20,'5','id','主键id  场次id','int','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-07-05 15:56:51',NULL,'2022-07-05 23:32:28'),
(21,'5','match_id','比赛id','int','Integer','matchId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-07-05 15:56:51',NULL,'2022-07-05 23:32:28'),
(22,'5','race_schedule','赛程  1-初赛 2-决赛','int','Integer','raceSchedule','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-07-05 15:56:51',NULL,'2022-07-05 23:32:29'),
(23,'5','a_id','a选手id','int','Integer','aId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2022-07-05 15:56:51',NULL,'2022-07-05 23:32:29'),
(24,'5','b_id','b选手id','int','Integer','bId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2022-07-05 15:56:51',NULL,'2022-07-05 23:32:29'),
(25,'5','begin_time','开始时间','datetime','Date','beginTime','0','0',NULL,'1','1','1','1','EQ','datetime','',6,'admin','2022-07-05 15:56:51',NULL,'2022-07-05 23:32:29'),
(26,'5','end_time','结束时间','datetime','Date','endTime','0','0',NULL,'1','1','1','1','EQ','datetime','',7,'admin','2022-07-05 15:56:52',NULL,'2022-07-05 23:32:29'),
(27,'5','status','投票是否开启  1-开启  2-关闭','int','Integer','status','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2022-07-05 15:56:52',NULL,'2022-07-05 23:32:29'),
(28,'6','id','主键id','int','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-07-05 15:56:52',NULL,'2022-07-05 23:01:24'),
(29,'6','match_id','比赛id','int','Integer','matchId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-07-05 15:56:52',NULL,'2022-07-05 23:01:24'),
(30,'6','race_schedule','赛程','int','Integer','raceSchedule','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-07-05 15:56:52',NULL,'2022-07-05 23:01:24'),
(31,'6','player_id','选手id','int','Integer','playerId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2022-07-05 15:56:53',NULL,'2022-07-05 23:01:24'),
(32,'6','judges_score','评委分数','int','Integer','judgesScore','0','0','1','1','1','1','1','EQ','input','',5,'admin','2022-07-05 15:56:53',NULL,'2022-07-05 23:01:24'),
(33,'6','vote_count','观众投票数量','int','Integer','voteCount','0','0','1','1','1','1','1','EQ','input','',6,'admin','2022-07-05 15:56:53',NULL,'2022-07-05 23:01:24'),
(34,'6','percent','票数百分比','decimal(10,0)','BigDecimal','percent','0','0','1','1','1','1','1','EQ','input','',7,'admin','2022-07-05 15:56:53',NULL,'2022-07-05 23:01:25'),
(35,'6','final_score','最终分数','decimal(10,0)','BigDecimal','finalScore','0','0','1','1','1','1','1','EQ','input','',8,'admin','2022-07-05 15:56:53',NULL,'2022-07-05 23:01:25'),
(36,'7','id','主键id','int','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-07-05 15:56:54',NULL,'2022-07-05 22:51:55'),
(37,'7','match_id','比赛id','int','Integer','matchId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-07-05 15:56:54',NULL,'2022-07-05 22:51:55'),
(38,'7','player_id','选手id','int','Integer','playerId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2022-07-05 15:56:54',NULL,'2022-07-05 22:51:55'),
(39,'7','submit_time','发布时间','datetime','Date','submitTime','0','0','1','1','1','1','1','EQ','datetime','',4,'admin','2022-07-05 15:56:54',NULL,'2022-07-05 22:51:55'),
(40,'7','first_score','初赛得分','decimal(10,0)','BigDecimal','firstScore','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-07-05 15:56:54',NULL,'2022-07-05 22:51:56'),
(41,'8','id','主键id','int','Integer','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2022-07-05 15:56:54',NULL,'2022-07-05 21:47:39'),
(42,'8','match_id','比赛id','int','Integer','matchId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2022-07-05 15:56:55',NULL,'2022-07-05 21:47:39'),
(43,'8','race_schedule','赛程  1-初赛  2-决赛','int','Integer','raceSchedule','0','0','1','1','1','1','1','EQ','input','match_schedule',3,'admin','2022-07-05 15:56:55',NULL,'2022-07-05 21:47:39'),
(44,'8','session_id','场次id','int','Integer','sessionId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2022-07-05 15:56:55',NULL,'2022-07-05 21:47:39'),
(45,'8','player_id','选手id','int','Integer','playerId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2022-07-05 15:56:55',NULL,'2022-07-05 21:47:39'),
(46,'8','viewer_id','观众id','int','Integer','viewerId','0','0','1','1','1','1','1','EQ','input','',6,'admin','2022-07-05 15:56:55',NULL,'2022-07-05 21:47:39');

/*Table structure for table `judges_points` */

DROP TABLE IF EXISTS `judges_points`;

CREATE TABLE `judges_points` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `match_id` int NOT NULL COMMENT '比赛id',
  `race_schedule` int NOT NULL COMMENT '赛程',
  `session_id` int NOT NULL COMMENT '场次id',
  `judges_id` int NOT NULL COMMENT '评委id',
  `player_id` int NOT NULL COMMENT '选手id',
  `points` int NOT NULL DEFAULT '0' COMMENT '评委分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `judges_points` */

insert  into `judges_points`(`id`,`match_id`,`race_schedule`,`session_id`,`judges_id`,`player_id`,`points`) values 
(17,1,1,133,1,117,66),
(18,1,1,133,1,112,89),
(19,1,1,134,1,120,99),
(20,1,1,134,1,105,88),
(21,1,1,135,1,109,59),
(22,1,1,136,1,123,89),
(23,1,1,136,1,118,96),
(24,1,1,137,1,121,80),
(25,1,1,137,1,102,78),
(26,1,1,138,1,106,89),
(27,1,1,138,1,119,70),
(28,1,1,139,1,101,70),
(29,1,1,139,1,107,90),
(30,1,1,140,1,1,45),
(31,1,1,140,1,122,56),
(32,1,1,141,1,124,45),
(33,1,1,141,1,111,78),
(34,1,1,142,1,110,56),
(35,1,1,142,1,125,78);

/*Table structure for table `match` */

DROP TABLE IF EXISTS `match`;

CREATE TABLE `match` (
  `match_id` int NOT NULL AUTO_INCREMENT COMMENT '比赛id 主键',
  `match_name` varchar(80) NOT NULL,
  `match_begin_time` datetime NOT NULL COMMENT '比赛开始时间',
  `match_end_time` datetime NOT NULL COMMENT '比赛截止时间',
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `match` */

insert  into `match`(`match_id`,`match_name`,`match_begin_time`,`match_end_time`) values 
(1,'1','2022-07-05 10:00:00','2022-07-14 23:25:00'),
(2,'ACM','2022-07-06 00:00:00','2022-07-07 06:10:00'),
(3,'ICPC','2022-07-06 09:00:58','2022-07-14 10:50:58'),
(4,'歌唱大赛','2022-07-06 00:00:57','2022-07-07 11:00:57'),
(5,'2019年歌唱比赛','2019-01-29 06:05:00','2019-06-04 23:00:00'),
(6,'2022','2022-07-15 11:35:00','2022-07-21 13:45:00'),
(7,'2023','2022-07-11 08:40:00','2022-07-05 05:25:00');

/*Table structure for table `match_judges` */

DROP TABLE IF EXISTS `match_judges`;

CREATE TABLE `match_judges` (
  `match_id` int NOT NULL COMMENT '比赛id',
  `judges_id` int NOT NULL COMMENT '评委id',
  `race_schedule` int NOT NULL COMMENT '1-初赛  2-决赛'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `match_judges` */

insert  into `match_judges`(`match_id`,`judges_id`,`race_schedule`) values 
(1,1,1);

/*Table structure for table `match_session` */

DROP TABLE IF EXISTS `match_session`;

CREATE TABLE `match_session` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id  场次id',
  `match_id` int NOT NULL COMMENT '比赛id',
  `race_schedule` int NOT NULL COMMENT '赛程  1-初赛 2-决赛',
  `a_id` int DEFAULT NULL COMMENT 'a选手id',
  `b_id` int DEFAULT NULL COMMENT 'b选手id',
  `begin_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` int DEFAULT '1' COMMENT '投票是否开启  1-开启  2-关闭',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `match_session` */

insert  into `match_session`(`id`,`match_id`,`race_schedule`,`a_id`,`b_id`,`begin_time`,`end_time`,`status`) values 
(133,1,1,117,112,NULL,NULL,1),
(134,1,1,120,105,NULL,NULL,1),
(135,1,1,108,109,NULL,NULL,1),
(136,1,1,123,118,NULL,NULL,1),
(137,1,1,121,102,NULL,NULL,1),
(138,1,1,106,119,NULL,NULL,1),
(139,1,1,101,107,NULL,NULL,1),
(140,1,1,1,122,NULL,NULL,1),
(141,1,1,124,111,NULL,NULL,1),
(142,1,1,110,125,NULL,NULL,1),
(145,1,2,110,121,NULL,NULL,1),
(146,1,2,112,118,NULL,NULL,1),
(147,1,2,107,117,NULL,NULL,1),
(148,1,2,120,106,NULL,NULL,1);

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';

/*Data for the table `qrtz_locks` */

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';

/*Data for the table `qrtz_scheduler_state` */

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';

/*Data for the table `qrtz_triggers` */

/*Table structure for table `result_match` */

DROP TABLE IF EXISTS `result_match`;

CREATE TABLE `result_match` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `match_id` int NOT NULL COMMENT '比赛id',
  `race_schedule` int NOT NULL COMMENT '赛程',
  `player_id` int NOT NULL COMMENT '选手id',
  `judges_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '评委分数',
  `vote_count` int NOT NULL DEFAULT '0' COMMENT '观众投票数量',
  `percent` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '票数百分比',
  `final_score` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最终分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `result_match` */

insert  into `result_match`(`id`,`match_id`,`race_schedule`,`player_id`,`judges_score`,`vote_count`,`percent`,`final_score`) values 
(94,1,1,117,66.00,2,67.00,133.00),
(95,1,1,112,89.00,1,33.00,122.00),
(96,1,1,120,99.00,2,67.00,166.00),
(97,1,1,105,88.00,1,33.00,121.00),
(98,1,1,108,0.00,2,67.00,67.00),
(99,1,1,109,59.00,1,33.00,92.00),
(100,1,1,123,89.00,1,33.00,122.00),
(101,1,1,118,96.00,2,67.00,163.00),
(102,1,1,121,80.00,3,100.00,180.00),
(103,1,1,102,78.00,0,0.00,78.00),
(104,1,1,106,89.00,2,67.00,156.00),
(105,1,1,119,70.00,1,33.00,103.00),
(106,1,1,101,70.00,1,33.00,103.00),
(107,1,1,107,90.00,2,67.00,157.00),
(108,1,1,1,45.00,2,67.00,112.00),
(109,1,1,122,56.00,1,33.00,89.00),
(110,1,1,124,45.00,2,67.00,112.00),
(111,1,1,111,78.00,1,33.00,111.00),
(112,1,1,110,56.00,2,67.00,123.00),
(113,1,1,125,78.00,1,33.00,111.00);

/*Table structure for table `semi_finals` */

DROP TABLE IF EXISTS `semi_finals`;

CREATE TABLE `semi_finals` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `match_id` int NOT NULL COMMENT '比赛id',
  `player_id` int NOT NULL COMMENT '选手id',
  `submit_time` datetime NOT NULL COMMENT '发布时间',
  `first_score` decimal(10,0) DEFAULT NULL COMMENT '初赛得分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `semi_finals` */

insert  into `semi_finals`(`id`,`match_id`,`player_id`,`submit_time`,`first_score`) values 
(26,1,121,'2022-07-10 19:47:07',180),
(27,1,120,'2022-07-10 19:47:07',166),
(28,1,118,'2022-07-10 19:47:07',163),
(29,1,107,'2022-07-10 19:47:07',157),
(30,1,106,'2022-07-10 19:47:07',156),
(31,1,117,'2022-07-10 19:47:07',133),
(32,1,110,'2022-07-10 19:47:07',123),
(33,1,112,'2022-07-10 19:47:07',122);

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-07-05 12:12:43','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-07-05 12:12:44','',NULL,'初始化密码 123456'),
(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-07-05 12:12:45','',NULL,'深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue'),
(4,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2022-07-05 12:12:46','',NULL,'是否开启注册用户功能（true开启，false关闭）'),
(5,'用户管理-密码字符范围','sys.account.chrtype','0','Y','admin','2022-07-05 12:12:47','',NULL,'默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）'),
(6,'用户管理-初始密码修改策略','sys.account.initPasswordModify','0','Y','admin','2022-07-05 12:12:48','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),
(7,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2022-07-05 12:12:49','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框'),
(8,'主框架页-菜单导航显示风格','sys.index.menuStyle','default','Y','admin','2022-07-05 12:12:50','',NULL,'菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）'),
(9,'主框架页-是否开启页脚','sys.index.footer','true','Y','admin','2022-07-05 12:12:51','',NULL,'是否开启底部页脚显示（true显示，false隐藏）'),
(10,'主框架页-是否开启页签','sys.index.tagsView','true','Y','admin','2022-07-05 12:12:52','',NULL,'是否开启菜单多页签显示（true显示，false隐藏）'),
(100,'','','','N','',NULL,'',NULL,NULL);

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:26','',NULL),
(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:27','',NULL),
(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:28','',NULL),
(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:29','',NULL),
(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:30','',NULL),
(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:31','',NULL),
(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:32','',NULL),
(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:33','',NULL),
(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:34','',NULL),
(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-07-05 12:08:35','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,1,'男','0','sys_user_sex','','','Y','0','admin','2022-07-05 12:12:13','',NULL,'性别男'),
(2,2,'女','1','sys_user_sex','','','N','0','admin','2022-07-05 12:12:14','',NULL,'性别女'),
(3,3,'未知','2','sys_user_sex','','','N','0','admin','2022-07-05 12:12:15','',NULL,'性别未知'),
(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2022-07-05 12:12:16','',NULL,'显示菜单'),
(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2022-07-05 12:12:17','',NULL,'隐藏菜单'),
(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2022-07-05 12:12:18','',NULL,'正常状态'),
(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2022-07-05 12:12:19','',NULL,'停用状态'),
(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2022-07-05 12:12:20','',NULL,'正常状态'),
(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2022-07-05 12:12:21','',NULL,'停用状态'),
(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2022-07-05 12:12:22','',NULL,'默认分组'),
(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2022-07-05 12:12:23','',NULL,'系统分组'),
(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2022-07-05 12:12:24','',NULL,'系统默认是'),
(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2022-07-05 12:12:25','',NULL,'系统默认否'),
(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2022-07-05 12:12:26','',NULL,'通知'),
(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2022-07-05 12:12:27','',NULL,'公告'),
(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2022-07-05 12:12:28','',NULL,'正常状态'),
(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2022-07-05 12:12:29','',NULL,'关闭状态'),
(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2022-07-05 12:12:29','',NULL,'其他操作'),
(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2022-07-05 12:12:30','',NULL,'新增操作'),
(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2022-07-05 12:12:31','',NULL,'修改操作'),
(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2022-07-05 12:12:32','',NULL,'删除操作'),
(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2022-07-05 12:12:33','',NULL,'授权操作'),
(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2022-07-05 12:12:34','',NULL,'导出操作'),
(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2022-07-05 12:12:35','',NULL,'导入操作'),
(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2022-07-05 12:12:36','',NULL,'强退操作'),
(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2022-07-05 12:12:37','',NULL,'生成操作'),
(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2022-07-05 12:12:38','',NULL,'清空操作'),
(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2022-07-05 12:12:39','',NULL,'正常状态'),
(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2022-07-05 12:12:40','',NULL,'停用状态'),
(100,1,'初赛','1','match_schedule',NULL,NULL,'Y','0','admin','2022-07-05 21:39:36','',NULL,NULL),
(101,2,'决赛','2','match_schedule',NULL,NULL,'Y','0','admin','2022-07-05 21:39:49','',NULL,NULL);

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'用户性别','sys_user_sex','0','admin','2022-07-05 12:12:01','',NULL,'用户性别列表'),
(2,'菜单状态','sys_show_hide','0','admin','2022-07-05 12:12:02','',NULL,'菜单状态列表'),
(3,'系统开关','sys_normal_disable','0','admin','2022-07-05 12:12:03','',NULL,'系统开关列表'),
(4,'任务状态','sys_job_status','0','admin','2022-07-05 12:12:04','',NULL,'任务状态列表'),
(5,'任务分组','sys_job_group','0','admin','2022-07-05 12:12:05','',NULL,'任务分组列表'),
(6,'系统是否','sys_yes_no','0','admin','2022-07-05 12:12:06','',NULL,'系统是否列表'),
(7,'通知类型','sys_notice_type','0','admin','2022-07-05 12:12:07','',NULL,'通知类型列表'),
(8,'通知状态','sys_notice_status','0','admin','2022-07-05 12:12:08','',NULL,'通知状态列表'),
(9,'操作类型','sys_oper_type','0','admin','2022-07-05 12:12:09','',NULL,'操作类型列表'),
(10,'系统状态','sys_common_status','0','admin','2022-07-05 12:12:10','',NULL,'登录状态列表'),
(100,'赛程状态','match_schedule','0','admin','2022-07-05 21:38:58','',NULL,'1-初赛 2-决赛');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2022-07-05 12:12:59','',NULL,''),
(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2022-07-05 12:13:00','',NULL,''),
(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2022-07-05 12:13:01','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`login_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values 
(100,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 12:20:24'),
(101,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 14:57:39'),
(102,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-05 15:06:53'),
(103,'wyh','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 15:06:59'),
(104,'wyh','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 15:07:32'),
(105,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 15:55:48'),
(106,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 16:11:12'),
(107,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 16:20:37'),
(108,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 21:37:01'),
(109,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 21:37:59'),
(110,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 21:39:03'),
(111,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 21:56:57'),
(112,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 22:07:12'),
(113,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 22:11:24'),
(114,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 22:39:25'),
(115,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 23:10:53'),
(116,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 23:25:13'),
(117,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-05 23:30:22'),
(118,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 09:38:21'),
(119,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 09:51:33'),
(120,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 10:36:29'),
(121,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 10:43:37'),
(122,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 10:55:38'),
(123,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 10:58:05'),
(124,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 11:02:45'),
(125,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 11:35:06'),
(126,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 11:41:24'),
(127,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','注册成功','2022-07-06 12:11:02'),
(128,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 12:11:18'),
(129,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-06 12:16:27'),
(130,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 12:16:29'),
(131,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-06 12:17:29'),
(132,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 12:17:32'),
(133,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-06 12:18:14'),
(134,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 12:18:16'),
(135,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 12:58:03'),
(136,'admin','192.168.137.246','内网IP','Mobile Safari','Mac OS X (iPhone)','0','登录成功','2022-07-06 13:16:28'),
(137,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 16:44:37'),
(138,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 17:42:02'),
(139,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-06 17:52:45'),
(140,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 17:52:51'),
(141,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-06 18:02:04'),
(142,'tianyu','127.0.0.1','内网IP','Chrome 10','Windows 10','0','注册成功','2022-07-06 21:32:38'),
(143,'tianyu','127.0.0.1','内网IP','Chrome 10','Windows 10','0','注册成功','2022-07-06 21:33:44'),
(144,'tianyu','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 21:35:03'),
(145,'tianyu','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 21:37:09'),
(146,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 21:43:14'),
(147,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-06 21:48:43'),
(148,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:08:44'),
(149,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:15:05'),
(150,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:18:30'),
(151,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:27:12'),
(152,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:29:40'),
(153,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:39:17'),
(154,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-07 09:44:48'),
(155,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:44:49'),
(156,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-07 09:50:53'),
(157,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:50:56'),
(158,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:55:46'),
(159,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 09:59:01'),
(160,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 10:22:12'),
(161,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 11:04:14'),
(162,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 11:06:36'),
(163,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 11:09:35'),
(164,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 11:11:29'),
(165,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 11:13:18'),
(166,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 11:16:52'),
(167,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 11:26:47'),
(168,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 11:29:50'),
(169,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-07 11:31:02'),
(170,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 11:47:51'),
(171,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 12:13:29'),
(172,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 12:39:46'),
(173,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 13:48:28'),
(174,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 13:49:38'),
(175,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 14:14:45'),
(176,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 14:16:19'),
(177,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 15:40:08'),
(178,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 15:47:04'),
(179,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 18:25:09'),
(180,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 18:37:50'),
(181,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 18:40:54'),
(182,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 18:56:11'),
(183,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 19:21:51'),
(184,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 20:03:29'),
(185,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 21:07:28'),
(186,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 21:12:37'),
(187,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 21:29:33'),
(188,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 21:47:18'),
(189,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-07 21:47:20'),
(190,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 21:47:26'),
(191,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 22:02:39'),
(192,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-07 22:06:34'),
(193,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 22:06:41'),
(194,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 22:14:16'),
(195,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 22:23:17'),
(196,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 22:30:31'),
(197,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 22:31:12'),
(198,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-07 22:56:45'),
(199,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 22:59:52'),
(200,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 23:04:05'),
(201,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-07 23:13:11'),
(202,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-08 08:29:51'),
(203,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 08:40:51'),
(204,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-08 09:48:47'),
(205,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 10:19:30'),
(206,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-08 10:20:58'),
(207,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 10:21:01'),
(208,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 10:39:47'),
(209,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 10:41:44'),
(210,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 10:42:30'),
(211,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-08 10:47:32'),
(212,'魏渝辉','127.0.0.1','内网IP','Chrome 10','Windows 10','1','用户不存在/密码错误','2022-07-08 10:47:37'),
(213,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 10:47:39'),
(214,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-08 10:48:00'),
(215,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 10:48:02'),
(216,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-08 11:28:33'),
(217,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:28:59'),
(218,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:31:20'),
(219,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:33:31'),
(220,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:43:48'),
(221,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 11:44:28'),
(222,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:45:13'),
(223,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:46:19'),
(224,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-08 11:48:18'),
(225,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 11:50:36'),
(226,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:52:22'),
(227,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:53:30'),
(228,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:55:18'),
(229,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-08 11:56:15'),
(230,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 13:40:04'),
(231,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 13:40:37'),
(232,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 14:06:17'),
(233,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 14:53:57'),
(234,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 15:37:34'),
(235,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 16:16:54'),
(236,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 16:32:59'),
(237,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 16:46:18'),
(238,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 17:44:24'),
(239,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 17:47:48'),
(240,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 18:06:14'),
(241,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 18:47:37'),
(242,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 18:58:01'),
(243,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 19:02:49'),
(244,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 19:13:55'),
(245,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 19:40:48'),
(246,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 20:02:19'),
(247,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 20:07:56'),
(248,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 20:22:36'),
(249,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-08 20:24:22'),
(250,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 08:40:22'),
(251,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 08:42:28'),
(252,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 08:45:02'),
(253,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 08:57:18'),
(254,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 09:01:38'),
(255,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:03:46'),
(256,'jiang','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2022-07-09 09:03:57'),
(257,'not_bug','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2022-07-09 09:04:16'),
(258,'not_bug','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:04:20'),
(259,'not_bug','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:04:43'),
(260,'jiang','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:04:58'),
(261,'jiang','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:05:25'),
(262,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 09:05:35'),
(263,'skeiu','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:05:47'),
(264,'skeiu','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:06:13'),
(265,'张帅','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:06:26'),
(266,'张帅','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:06:44'),
(267,'return','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:07:08'),
(268,'return','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:07:36'),
(269,'李莉莉','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:08:03'),
(270,'李莉莉','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:08:57'),
(271,'workes','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:09:04'),
(272,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 09:09:08'),
(273,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 09:10:07'),
(274,'workes','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:10:14'),
(275,'frmod','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:10:22'),
(276,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 09:10:58'),
(277,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 09:14:13'),
(278,'frmod','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:16:06'),
(279,'pringt','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:16:18'),
(280,'pringt','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:16:36'),
(281,'tianyu','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2022-07-09 09:16:45'),
(282,'tianyu','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2022-07-09 09:16:56'),
(283,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 09:16:57'),
(284,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:17:01'),
(285,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 09:17:15'),
(286,'tianyu','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误3次','2022-07-09 09:17:21'),
(287,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:17:26'),
(288,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:31:34'),
(289,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 09:41:30'),
(290,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 09:42:41'),
(291,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 09:48:44'),
(292,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 09:49:52'),
(293,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 10:35:36'),
(294,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 10:36:48'),
(295,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 10:55:17'),
(296,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 11:09:00'),
(297,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 11:09:23'),
(298,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 11:15:47'),
(299,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 11:16:53'),
(300,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 11:24:53'),
(301,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 11:26:51'),
(302,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 11:29:46'),
(303,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-07-09 11:30:06'),
(304,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-07-09 11:30:12'),
(305,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 11:35:58'),
(306,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 11:38:37'),
(307,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 11:53:41'),
(308,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 11:57:22'),
(309,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 12:02:34'),
(310,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 12:07:01'),
(311,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 12:08:59'),
(312,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 12:10:12'),
(313,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-09 12:12:13'),
(314,'not_bug','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-09 12:12:20'),
(315,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 21:10:14'),
(316,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 21:15:40'),
(317,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 21:29:09'),
(318,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 21:31:17'),
(319,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 21:33:43'),
(320,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 21:38:18'),
(321,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 22:23:07'),
(322,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 22:35:45'),
(323,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 22:40:20'),
(324,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 22:54:24'),
(325,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 23:02:35'),
(326,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-09 23:03:41'),
(327,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 08:35:21'),
(328,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 08:35:27'),
(329,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 08:35:55'),
(330,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 08:36:44'),
(331,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 08:39:38'),
(332,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 08:41:46'),
(333,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:05:16'),
(334,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 09:12:23'),
(335,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:17:37'),
(336,'tusi','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:17:46'),
(337,'tusi','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:21:09'),
(338,'KPL','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:21:13'),
(339,'KPL','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:21:33'),
(340,'gui','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:21:50'),
(341,'gui','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:22:34'),
(342,'lele','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:22:38'),
(343,'lele','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:22:52'),
(344,'lisa','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:22:58'),
(345,'lisa','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:23:13'),
(346,'lusi','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:23:24'),
(347,'lusi','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:23:36'),
(348,'qiangli','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:23:55'),
(349,'qiangli','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:24:08'),
(350,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 09:24:08'),
(351,'qiesi','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:24:16'),
(352,'qiesi','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:24:36'),
(353,'tusi','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:24:45'),
(354,'tusi','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:25:04'),
(355,'马卡','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:25:11'),
(356,'马卡','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2022-07-10 09:25:25'),
(357,'兰尼','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2022-07-10 09:25:31'),
(358,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2022-07-10 09:25:37'),
(359,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 09:28:43'),
(360,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 09:30:38'),
(361,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 09:49:48'),
(362,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 09:58:38'),
(363,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 10:07:50'),
(364,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 10:28:34'),
(365,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 10:31:37'),
(366,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 10:36:17'),
(367,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 10:41:40'),
(368,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 10:45:02'),
(369,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 11:04:22'),
(370,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 11:08:57'),
(371,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 11:17:47'),
(372,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 12:45:13'),
(373,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 13:01:16'),
(374,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 13:02:45'),
(375,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 13:05:53'),
(376,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 13:26:26'),
(377,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 14:28:51'),
(378,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 15:48:14'),
(379,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 17:37:10'),
(380,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 17:53:22'),
(381,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-10 17:55:19'),
(382,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 17:55:21'),
(383,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 18:43:42'),
(384,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-10 19:10:14'),
(385,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:10:19'),
(386,'lengzhou','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-10 19:17:10'),
(387,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:17:19'),
(388,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-10 19:17:41'),
(389,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:17:44'),
(390,'test','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-10 19:19:57'),
(391,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:19:59'),
(392,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:27:56'),
(393,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:34:15'),
(394,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:45:38'),
(395,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:51:01'),
(396,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:57:57'),
(397,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','退出成功','2022-07-10 19:58:14'),
(398,'admin','127.0.0.1','内网IP','Chrome 10','Windows 10','0','登录成功','2022-07-10 19:59:11');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2063 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`url`,`target`,`menu_type`,`visible`,`is_refresh`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统管理',0,1,'#','','M','0','1','','fa fa-gear','admin','2022-07-05 12:08:54','',NULL,'系统管理目录'),
(2,'系统监控',0,2,'#','','M','0','1','','fa fa-video-camera','admin','2022-07-05 12:08:55','',NULL,'系统监控目录'),
(3,'系统工具',0,3,'#','','M','0','1','','fa fa-bars','admin','2022-07-05 12:08:56','',NULL,'系统工具目录'),
(4,'若依官网',0,4,'http://ruoyi.vip','menuBlank','C','1','1','','fa fa-location-arrow','admin','2022-07-05 12:08:57','admin','2022-07-05 15:58:28','若依官网地址'),
(100,'用户管理',2000,1,'/system/user','menuItem','C','0','1','system:user:view','fa fa-user-o','admin','2022-07-05 12:08:58','admin','2022-07-05 16:08:53','用户管理菜单'),
(101,'角色管理',2000,2,'/system/role','menuItem','C','0','1','system:role:view','fa fa-user-secret','admin','2022-07-05 12:08:59','admin','2022-07-05 16:09:51','角色管理菜单'),
(102,'菜单管理',2000,3,'/system/menu','menuItem','C','0','1','system:menu:view','fa fa-th-list','admin','2022-07-05 12:09:00','admin','2022-07-05 16:10:04','菜单管理菜单'),
(103,'部门管理',1,4,'/system/dept','','C','0','1','system:dept:view','fa fa-outdent','admin','2022-07-05 12:09:01','',NULL,'部门管理菜单'),
(104,'岗位管理',1,5,'/system/post','','C','0','1','system:post:view','fa fa-address-card-o','admin','2022-07-05 12:09:02','',NULL,'岗位管理菜单'),
(105,'字典管理',1,6,'/system/dict','','C','0','1','system:dict:view','fa fa-bookmark-o','admin','2022-07-05 12:09:03','',NULL,'字典管理菜单'),
(106,'参数设置',1,7,'/system/config','','C','0','1','system:config:view','fa fa-sun-o','admin','2022-07-05 12:09:04','',NULL,'参数设置菜单'),
(107,'通知公告',1,8,'/system/notice','','C','0','1','system:notice:view','fa fa-bullhorn','admin','2022-07-05 12:09:05','',NULL,'通知公告菜单'),
(108,'日志管理',1,9,'#','','M','0','1','','fa fa-pencil-square-o','admin','2022-07-05 12:09:06','',NULL,'日志管理菜单'),
(109,'在线用户',2,1,'/monitor/online','','C','0','1','monitor:online:view','fa fa-user-circle','admin','2022-07-05 12:09:07','',NULL,'在线用户菜单'),
(110,'定时任务',2,2,'/monitor/job','','C','0','1','monitor:job:view','fa fa-tasks','admin','2022-07-05 12:09:08','',NULL,'定时任务菜单'),
(111,'数据监控',2,3,'/monitor/data','','C','0','1','monitor:data:view','fa fa-bug','admin','2022-07-05 12:09:09','',NULL,'数据监控菜单'),
(112,'服务监控',2,4,'/monitor/server','','C','0','1','monitor:server:view','fa fa-server','admin','2022-07-05 12:09:10','',NULL,'服务监控菜单'),
(113,'缓存监控',2,5,'/monitor/cache','','C','0','1','monitor:cache:view','fa fa-cube','admin','2022-07-05 12:09:11','',NULL,'缓存监控菜单'),
(114,'表单构建',3,1,'/tool/build','','C','0','1','tool:build:view','fa fa-wpforms','admin','2022-07-05 12:09:12','',NULL,'表单构建菜单'),
(115,'代码生成',3,2,'/tool/gen','','C','0','1','tool:gen:view','fa fa-code','admin','2022-07-05 12:09:13','',NULL,'代码生成菜单'),
(116,'系统接口',3,3,'/tool/swagger','','C','0','1','tool:swagger:view','fa fa-gg','admin','2022-07-05 12:09:14','',NULL,'系统接口菜单'),
(500,'操作日志',108,1,'/monitor/operlog','','C','0','1','monitor:operlog:view','fa fa-address-book','admin','2022-07-05 12:09:15','',NULL,'操作日志菜单'),
(501,'登录日志',108,2,'/monitor/logininfor','','C','0','1','monitor:logininfor:view','fa fa-file-image-o','admin','2022-07-05 12:09:16','',NULL,'登录日志菜单'),
(1000,'用户查询',100,1,'#','','F','0','1','system:user:list','#','admin','2022-07-05 12:09:17','',NULL,''),
(1001,'用户新增',100,2,'#','','F','0','1','system:user:add','#','admin','2022-07-05 12:09:18','',NULL,''),
(1002,'用户修改',100,3,'#','','F','0','1','system:user:edit','#','admin','2022-07-05 12:09:19','',NULL,''),
(1003,'用户删除',100,4,'#','','F','0','1','system:user:remove','#','admin','2022-07-05 12:09:21','',NULL,''),
(1004,'用户导出',100,5,'#','','F','0','1','system:user:export','#','admin','2022-07-05 12:09:22','',NULL,''),
(1005,'用户导入',100,6,'#','','F','0','1','system:user:import','#','admin','2022-07-05 12:09:23','',NULL,''),
(1006,'重置密码',100,7,'#','','F','0','1','system:user:resetPwd','#','admin','2022-07-05 12:09:24','',NULL,''),
(1007,'角色查询',101,1,'#','','F','0','1','system:role:list','#','admin','2022-07-05 12:09:25','',NULL,''),
(1008,'角色新增',101,2,'#','','F','0','1','system:role:add','#','admin','2022-07-05 12:09:26','',NULL,''),
(1009,'角色修改',101,3,'#','','F','0','1','system:role:edit','#','admin','2022-07-05 12:09:27','',NULL,''),
(1010,'角色删除',101,4,'#','','F','0','1','system:role:remove','#','admin','2022-07-05 12:09:28','',NULL,''),
(1011,'角色导出',101,5,'#','','F','0','1','system:role:export','#','admin','2022-07-05 12:09:29','',NULL,''),
(1012,'菜单查询',102,1,'#','','F','0','1','system:menu:list','#','admin','2022-07-05 12:09:30','',NULL,''),
(1013,'菜单新增',102,2,'#','','F','0','1','system:menu:add','#','admin','2022-07-05 12:09:31','',NULL,''),
(1014,'菜单修改',102,3,'#','','F','0','1','system:menu:edit','#','admin','2022-07-05 12:09:32','',NULL,''),
(1015,'菜单删除',102,4,'#','','F','0','1','system:menu:remove','#','admin','2022-07-05 12:09:33','',NULL,''),
(1016,'部门查询',103,1,'#','','F','0','1','system:dept:list','#','admin','2022-07-05 12:09:34','',NULL,''),
(1017,'部门新增',103,2,'#','','F','0','1','system:dept:add','#','admin','2022-07-05 12:09:35','',NULL,''),
(1018,'部门修改',103,3,'#','','F','0','1','system:dept:edit','#','admin','2022-07-05 12:09:36','',NULL,''),
(1019,'部门删除',103,4,'#','','F','0','1','system:dept:remove','#','admin','2022-07-05 12:09:37','',NULL,''),
(1020,'岗位查询',104,1,'#','','F','0','1','system:post:list','#','admin','2022-07-05 12:09:38','',NULL,''),
(1021,'岗位新增',104,2,'#','','F','0','1','system:post:add','#','admin','2022-07-05 12:09:39','',NULL,''),
(1022,'岗位修改',104,3,'#','','F','0','1','system:post:edit','#','admin','2022-07-05 12:09:40','',NULL,''),
(1023,'岗位删除',104,4,'#','','F','0','1','system:post:remove','#','admin','2022-07-05 12:09:41','',NULL,''),
(1024,'岗位导出',104,5,'#','','F','0','1','system:post:export','#','admin','2022-07-05 12:09:42','',NULL,''),
(1025,'字典查询',105,1,'#','','F','0','1','system:dict:list','#','admin','2022-07-05 12:09:43','',NULL,''),
(1026,'字典新增',105,2,'#','','F','0','1','system:dict:add','#','admin','2022-07-05 12:09:44','',NULL,''),
(1027,'字典修改',105,3,'#','','F','0','1','system:dict:edit','#','admin','2022-07-05 12:09:45','',NULL,''),
(1028,'字典删除',105,4,'#','','F','0','1','system:dict:remove','#','admin','2022-07-05 12:09:46','',NULL,''),
(1029,'字典导出',105,5,'#','','F','0','1','system:dict:export','#','admin','2022-07-05 12:09:47','',NULL,''),
(1030,'参数查询',106,1,'#','','F','0','1','system:config:list','#','admin','2022-07-05 12:09:48','',NULL,''),
(1031,'参数新增',106,2,'#','','F','0','1','system:config:add','#','admin','2022-07-05 12:09:49','',NULL,''),
(1032,'参数修改',106,3,'#','','F','0','1','system:config:edit','#','admin','2022-07-05 12:09:50','',NULL,''),
(1033,'参数删除',106,4,'#','','F','0','1','system:config:remove','#','admin','2022-07-05 12:09:51','',NULL,''),
(1034,'参数导出',106,5,'#','','F','0','1','system:config:export','#','admin','2022-07-05 12:09:52','',NULL,''),
(1035,'公告查询',107,1,'#','','F','0','1','system:notice:list','#','admin','2022-07-05 12:09:53','',NULL,''),
(1036,'公告新增',107,2,'#','','F','0','1','system:notice:add','#','admin','2022-07-05 12:09:54','',NULL,''),
(1037,'公告修改',107,3,'#','','F','0','1','system:notice:edit','#','admin','2022-07-05 12:09:55','',NULL,''),
(1038,'公告删除',107,4,'#','','F','0','1','system:notice:remove','#','admin','2022-07-05 12:09:56','',NULL,''),
(1039,'操作查询',500,1,'#','','F','0','1','monitor:operlog:list','#','admin','2022-07-05 12:09:57','',NULL,''),
(1040,'操作删除',500,2,'#','','F','0','1','monitor:operlog:remove','#','admin','2022-07-05 12:09:58','',NULL,''),
(1041,'详细信息',500,3,'#','','F','0','1','monitor:operlog:detail','#','admin','2022-07-05 12:09:59','',NULL,''),
(1042,'日志导出',500,4,'#','','F','0','1','monitor:operlog:export','#','admin','2022-07-05 12:10:00','',NULL,''),
(1043,'登录查询',501,1,'#','','F','0','1','monitor:logininfor:list','#','admin','2022-07-05 12:10:01','',NULL,''),
(1044,'登录删除',501,2,'#','','F','0','1','monitor:logininfor:remove','#','admin','2022-07-05 12:10:02','',NULL,''),
(1045,'日志导出',501,3,'#','','F','0','1','monitor:logininfor:export','#','admin','2022-07-05 12:10:03','',NULL,''),
(1046,'账户解锁',501,4,'#','','F','0','1','monitor:logininfor:unlock','#','admin','2022-07-05 12:10:04','',NULL,''),
(1047,'在线查询',109,1,'#','','F','0','1','monitor:online:list','#','admin','2022-07-05 12:10:05','',NULL,''),
(1048,'批量强退',109,2,'#','','F','0','1','monitor:online:batchForceLogout','#','admin','2022-07-05 12:10:06','',NULL,''),
(1049,'单条强退',109,3,'#','','F','0','1','monitor:online:forceLogout','#','admin','2022-07-05 12:10:07','',NULL,''),
(1050,'任务查询',110,1,'#','','F','0','1','monitor:job:list','#','admin','2022-07-05 12:10:08','',NULL,''),
(1051,'任务新增',110,2,'#','','F','0','1','monitor:job:add','#','admin','2022-07-05 12:10:09','',NULL,''),
(1052,'任务修改',110,3,'#','','F','0','1','monitor:job:edit','#','admin','2022-07-05 12:10:10','',NULL,''),
(1053,'任务删除',110,4,'#','','F','0','1','monitor:job:remove','#','admin','2022-07-05 12:10:11','',NULL,''),
(1054,'状态修改',110,5,'#','','F','0','1','monitor:job:changeStatus','#','admin','2022-07-05 12:10:12','',NULL,''),
(1055,'任务详细',110,6,'#','','F','0','1','monitor:job:detail','#','admin','2022-07-05 12:10:13','',NULL,''),
(1056,'任务导出',110,7,'#','','F','0','1','monitor:job:export','#','admin','2022-07-05 12:10:14','',NULL,''),
(1057,'生成查询',115,1,'#','','F','0','1','tool:gen:list','#','admin','2022-07-05 12:10:15','',NULL,''),
(1058,'生成修改',115,2,'#','','F','0','1','tool:gen:edit','#','admin','2022-07-05 12:10:16','',NULL,''),
(1059,'生成删除',115,3,'#','','F','0','1','tool:gen:remove','#','admin','2022-07-05 12:10:17','',NULL,''),
(1060,'预览代码',115,4,'#','','F','0','1','tool:gen:preview','#','admin','2022-07-05 12:10:18','',NULL,''),
(1061,'生成代码',115,5,'#','','F','0','1','tool:gen:code','#','admin','2022-07-05 12:10:19','',NULL,''),
(2000,'权限管理',0,1,'#','menuItem','M','0','1','','fa fa-bank','admin','2022-07-05 16:08:10','admin','2022-07-06 09:39:00',''),
(2001,'投票系统管理',0,1,'#','menuItem','M','0','1',NULL,'fa fa-shopping-bag','admin','2022-07-05 21:44:21','',NULL,''),
(2008,'观众投票管理',2001,1,'/vote-own/vote','','C','0','1','vote-own:vote:view','#','admin','2022-07-05 22:39:35','',NULL,'观众投票管理菜单'),
(2009,'观众投票管理查询',2008,1,'#','','F','0','1','vote-own:vote:list','#','admin','2022-07-05 22:39:35','',NULL,''),
(2010,'观众投票管理新增',2008,2,'#','','F','0','1','vote-own:vote:add','#','admin','2022-07-05 22:39:35','',NULL,''),
(2011,'观众投票管理修改',2008,3,'#','','F','0','1','vote-own:vote:edit','#','admin','2022-07-05 22:39:35','',NULL,''),
(2012,'观众投票管理删除',2008,4,'#','','F','0','1','vote-own:vote:remove','#','admin','2022-07-05 22:39:35','',NULL,''),
(2013,'观众投票管理导出',2008,5,'#','','F','0','1','vote-own:vote:export','#','admin','2022-07-05 22:39:35','',NULL,''),
(2014,'曲目信息',2001,1,'/vote-own/applicants','','C','0','1','vote-own:applicants:view','#','admin','2022-07-05 23:08:35','',NULL,'曲目信息菜单'),
(2015,'曲目信息查询',2014,1,'#','','F','0','1','vote-own:applicants:list','#','admin','2022-07-05 23:08:35','',NULL,''),
(2016,'曲目信息新增',2014,2,'#','','F','0','1','vote-own:applicants:add','#','admin','2022-07-05 23:08:35','',NULL,''),
(2017,'曲目信息修改',2014,3,'#','','F','0','1','vote-own:applicants:edit','#','admin','2022-07-05 23:08:35','',NULL,''),
(2018,'曲目信息删除',2014,4,'#','','F','0','1','vote-own:applicants:remove','#','admin','2022-07-05 23:08:35','',NULL,''),
(2019,'曲目信息导出',2014,5,'#','','F','0','1','vote-own:applicants:export','#','admin','2022-07-05 23:08:35','',NULL,''),
(2020,'复赛管理',2001,1,'/vote-own/finals','','C','0','1','vote-own:finals:view','#','admin','2022-07-05 23:08:40','',NULL,'复赛管理菜单'),
(2021,'复赛管理查询',2020,1,'#','','F','0','1','vote-own:finals:list','#','admin','2022-07-05 23:08:40','',NULL,''),
(2022,'复赛管理新增',2020,2,'#','','F','0','1','vote-own:finals:add','#','admin','2022-07-05 23:08:40','',NULL,''),
(2023,'复赛管理修改',2020,3,'#','','F','0','1','vote-own:finals:edit','#','admin','2022-07-05 23:08:40','',NULL,''),
(2024,'复赛管理删除',2020,4,'#','','F','0','1','vote-own:finals:remove','#','admin','2022-07-05 23:08:40','',NULL,''),
(2025,'复赛管理导出',2020,5,'#','','F','0','1','vote-own:finals:export','#','admin','2022-07-05 23:08:40','',NULL,''),
(2026,'比赛评委中间表',2001,1,'/vote-own/match_judges','','C','0','1','vote-own:match_judges:view','#','admin','2022-07-05 23:08:46','',NULL,'比赛评委中间表菜单'),
(2027,'比赛评委中间表查询',2026,1,'#','','F','0','1','vote-own:match_judges:list','#','admin','2022-07-05 23:08:46','',NULL,''),
(2028,'比赛评委中间表新增',2026,2,'#','','F','0','1','vote-own:match_judges:add','#','admin','2022-07-05 23:08:46','',NULL,''),
(2029,'比赛评委中间表修改',2026,3,'#','','F','0','1','vote-own:match_judges:edit','#','admin','2022-07-05 23:08:46','',NULL,''),
(2030,'比赛评委中间表删除',2026,4,'#','','F','0','1','vote-own:match_judges:remove','#','admin','2022-07-05 23:08:46','',NULL,''),
(2031,'比赛评委中间表导出',2026,5,'#','','F','0','1','vote-own:match_judges:export','#','admin','2022-07-05 23:08:46','',NULL,''),
(2032,'比赛场次',2001,1,'/vote-own/match_session','','C','0','1','vote-own:match_session:view','#','admin','2022-07-05 23:08:52','',NULL,'比赛场次菜单'),
(2033,'比赛场次查询',2032,1,'#','','F','0','1','vote-own:match_session:list','#','admin','2022-07-05 23:08:52','',NULL,''),
(2034,'比赛场次新增',2032,2,'#','','F','0','1','vote-own:match_session:add','#','admin','2022-07-05 23:08:52','',NULL,''),
(2035,'比赛场次修改',2032,3,'#','','F','0','1','vote-own:match_session:edit','#','admin','2022-07-05 23:08:52','',NULL,''),
(2036,'比赛场次删除',2032,4,'#','','F','0','1','vote-own:match_session:remove','#','admin','2022-07-05 23:08:52','',NULL,''),
(2037,'比赛场次导出',2032,5,'#','','F','0','1','vote-own:match_session:export','#','admin','2022-07-05 23:08:52','',NULL,''),
(2044,'评委打分',2001,1,'/vote-own/points','','C','0','1','vote-own:points:view','#','admin','2022-07-05 23:09:05','',NULL,'评委打分菜单'),
(2045,'评委打分查询',2044,1,'#','','F','0','1','vote-own:points:list','#','admin','2022-07-05 23:09:05','',NULL,''),
(2046,'评委打分新增',2044,2,'#','','F','0','1','vote-own:points:add','#','admin','2022-07-05 23:09:05','',NULL,''),
(2047,'评委打分修改',2044,3,'#','','F','0','1','vote-own:points:edit','#','admin','2022-07-05 23:09:05','',NULL,''),
(2048,'评委打分删除',2044,4,'#','','F','0','1','vote-own:points:remove','#','admin','2022-07-05 23:09:05','',NULL,''),
(2049,'评委打分导出',2044,5,'#','','F','0','1','vote-own:points:export','#','admin','2022-07-05 23:09:05','',NULL,''),
(2050,'比赛结果',2001,1,'/vote-own/result_match','','C','0','1','vote-own:result_match:view','#','admin','2022-07-05 23:09:10','',NULL,'比赛结果菜单'),
(2051,'比赛结果查询',2050,1,'#','','F','0','1','vote-own:result_match:list','#','admin','2022-07-05 23:09:10','',NULL,''),
(2052,'比赛结果新增',2050,2,'#','','F','0','1','vote-own:result_match:add','#','admin','2022-07-05 23:09:10','',NULL,''),
(2053,'比赛结果修改',2050,3,'#','','F','0','1','vote-own:result_match:edit','#','admin','2022-07-05 23:09:10','',NULL,''),
(2054,'比赛结果删除',2050,4,'#','','F','0','1','vote-own:result_match:remove','#','admin','2022-07-05 23:09:10','',NULL,''),
(2055,'比赛结果导出',2050,5,'#','','F','0','1','vote-own:result_match:export','#','admin','2022-07-05 23:09:10','',NULL,''),
(2056,'比赛信息',2001,1,'/vote-own/match','','C','0','1','vote-own:match:view','#','admin','2022-07-05 23:23:51','',NULL,'比赛信息菜单'),
(2057,'比赛信息查询',2056,1,'#','','F','0','1','vote-own:match:list','#','admin','2022-07-05 23:23:51','',NULL,''),
(2058,'比赛信息新增',2056,2,'#','','F','0','1','vote-own:match:add','#','admin','2022-07-05 23:23:52','',NULL,''),
(2059,'比赛信息修改',2056,3,'#','','F','0','1','vote-own:match:edit','#','admin','2022-07-05 23:23:52','',NULL,''),
(2060,'比赛信息删除',2056,4,'#','','F','0','1','vote-own:match:remove','#','admin','2022-07-05 23:23:52','',NULL,''),
(2061,'比赛信息导出',2056,5,'#','','F','0','1','vote-own:match:export','#','admin','2022-07-05 23:23:52','',NULL,''),
(2062,'评委打分',0,1,'/jud/1','menuItem','C','0','1','','fa fa-reorder','admin','2022-07-09 11:53:49','admin','2022-07-09 12:06:18','');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2022-07-05 12:13:06','',NULL,'管理员'),
(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2022-07-05 12:13:07','',NULL,'管理员');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`) values 
(100,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"魏渝辉\"],\"deptName\":[\"\"],\"phonenumber\":[\"17815342996\"],\"email\":[\"\"],\"loginName\":[\"wyh\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 15:06:42'),
(101,'代码生成',6,'com.vote.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":[\"match,applicants,match_judges,judges_points,viewer_vote,match_session,semi_finals,result_match\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 15:56:56'),
(102,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 15:58:19'),
(103,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"1\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 15:58:29'),
(104,'菜单管理',1,'com.vote.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"权限管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 16:08:10'),
(105,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"100\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"用户管理\"],\"url\":[\"/system/user\"],\"target\":[\"menuItem\"],\"perms\":[\"system:user:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-user-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 16:08:53'),
(106,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"101\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"角色管理\"],\"url\":[\"/system/role\"],\"target\":[\"menuItem\"],\"perms\":[\"system:role:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-user-secret\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 16:09:52'),
(107,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"102\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"菜单管理\"],\"url\":[\"/system/menu\"],\"target\":[\"menuItem\"],\"perms\":[\"system:menu:view\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-th-list\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 16:10:04'),
(108,'字典类型',1,'com.vote.web.controller.system.SysDictTypeController.addSave()','POST',1,'admin','研发部门','/system/dict/add','127.0.0.1','内网IP','{\"dictName\":[\"赛程状态\"],\"dictType\":[\"match_schedule\"],\"status\":[\"0\"],\"remark\":[\"1-初赛 2-决赛\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 21:38:59'),
(109,'字典数据',1,'com.vote.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"初赛\"],\"dictValue\":[\"1\"],\"dictType\":[\"match_schedule\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 21:39:36'),
(110,'字典数据',1,'com.vote.web.controller.system.SysDictDataController.addSave()','POST',1,'admin','研发部门','/system/dict/data/add','127.0.0.1','内网IP','{\"dictLabel\":[\"决赛\"],\"dictValue\":[\"2\"],\"dictType\":[\"match_schedule\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 21:39:49'),
(111,'菜单管理',1,'com.vote.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"投票系统管理\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-shopping-bag\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 21:44:21'),
(112,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"8\"],\"tableName\":[\"viewer_vote\"],\"tableComment\":[\"观众投票管理\"],\"className\":[\"ViewerVote\"],\"functionAuthor\":[\"魏渝辉\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"41\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"42\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"43\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程  1-初赛  2-决赛\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"match_schedule\"],\"columns[3].columnId\":[\"44\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"场次id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"sessionId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"45\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"选手id\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"playerId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"4','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 21:45:38'),
(113,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"8\"],\"tableName\":[\"viewer_vote\"],\"tableComment\":[\"观众投票管理\"],\"className\":[\"ViewerVote\"],\"functionAuthor\":[\"魏渝辉\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"41\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"42\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"43\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程  1-初赛  2-决赛\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"match_schedule\"],\"columns[3].columnId\":[\"44\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"场次id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"sessionId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"45\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"选手id\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"playerId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"4','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 21:47:40'),
(114,'代码生成',8,'com.vote.generator.controller.GenController.download()','GET',1,'admin','研发部门','/tool/gen/download/viewer_vote','127.0.0.1','内网IP','\"viewer_vote\"',NULL,0,NULL,'2022-07-05 21:49:02'),
(115,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"7\"],\"tableName\":[\"semi_finals\"],\"tableComment\":[\"复赛表\"],\"className\":[\"SemiFinals\"],\"functionAuthor\":[\"魏渝辉\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"36\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"37\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"38\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"选手id\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"playerId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"39\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"发布时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"submitTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"40\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"初赛得分\"],\"columns[4].javaType\":[\"BigDecimal\"],\"columns[4].javaField\":[\"firstScore\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.vote\"],\"moduleName\":[\"vote-own\"],\"bus','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 22:51:56'),
(116,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"6\"],\"tableName\":[\"result_match\"],\"tableComment\":[\"比赛结果信息\"],\"className\":[\"ResultMatch\"],\"functionAuthor\":[\"魏渝辉\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"28\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"29\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"30\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"31\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"选手id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"playerId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"32\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"评委分数\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"judgesScore\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"33\"],\"columns[5].sort\":','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 22:55:01'),
(117,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"4\"],\"tableName\":[\"match_judges\"],\"tableComment\":[\"比赛评委中间表\"],\"className\":[\"MatchJudges\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"17\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"比赛id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"matchId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isEdit\":[\"1\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].isRequired\":[\"1\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"18\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"评委id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"judgesId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"19\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"1-初赛  2-决赛\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.vote\"],\"moduleName\":[\"com.vote\"],\"businessName\":[\"match_judges\"],\"functionName\":[\"比赛评委中间表\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"投票系统管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 22:56:12'),
(118,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"match_session\"],\"tableComment\":[\"比赛场次\"],\"className\":[\"MatchSession\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"20\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id  场次id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"21\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"22\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程  1-初赛 2-决赛\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"23\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"a选手id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"aId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"24\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"b选手id\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"bId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"25\"],\"columns[5','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:01:09'),
(119,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"6\"],\"tableName\":[\"result_match\"],\"tableComment\":[\"比赛结果信息\"],\"className\":[\"ResultMatch\"],\"functionAuthor\":[\"魏渝辉\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"28\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"29\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"30\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"31\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"选手id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"playerId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"32\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"评委分数\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"judgesScore\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"33\"],\"columns[5].sort\":','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:01:25'),
(120,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"4\"],\"tableName\":[\"match_judges\"],\"tableComment\":[\"比赛评委中间表\"],\"className\":[\"MatchJudges\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"17\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"比赛id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"matchId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].isEdit\":[\"1\"],\"columns[0].isList\":[\"1\"],\"columns[0].isQuery\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].isRequired\":[\"1\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"18\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"评委id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"judgesId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"19\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"1-初赛  2-决赛\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.vote\"],\"moduleName\":[\"vote-own\"],\"businessName\":[\"match_judges\"],\"functionName\":[\"比赛评委中间表\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"投票系统管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:01:37'),
(121,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"match\"],\"tableComment\":[\"比赛信息\"],\"className\":[\"Match\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"13\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"比赛id 主键\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"matchId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"14\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"matchName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"15\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"比赛开始时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"matchBeginTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"16\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"比赛截止时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"matchEndTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.vote\"],\"moduleName\":[\"vote-own\"],\"businessName\":[\"match\"],\"functionName\":[\"比赛管理功能\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"投票系统管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:04:15'),
(122,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"judges_points\"],\"tableComment\":[\"评委打分信息\"],\"className\":[\"JudgesPoints\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"6\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"7\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"8\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"9\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"场次id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"sessionId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"10\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"评委id\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"judgesId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"11\"],\"columns[5].sort\":[\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:06:06'),
(123,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"1\"],\"tableName\":[\"applicants\"],\"tableComment\":[\"曲目\"],\"className\":[\"Applicants\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"1-初赛 2-决赛\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"选手id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"playerId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"曲目名称\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"songTitle\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.vote\"],\"mo','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:07:05'),
(124,'代码生成',8,'com.vote.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":[\"semi_finals,result_match,match_judges,match_session,match,judges_points,applicants\"]}',NULL,0,NULL,'2022-07-05 23:07:19'),
(125,'比赛管理功能',1,'com.vote.controller.MatchController.addSave()','POST',1,'admin','研发部门','/vote-own/match/add','127.0.0.1','内网IP','{\"matchName\":[\"ACM\"],\"matchBeginTime\":[\"2022-07-05\"],\"matchEndTime\":[\"2022-07-19\"]}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'match\n         ( match_name,\n            match_begin_time,\n            match_end\' at line 1\r\n### The error may exist in file [E:\\IdeaProjects\\VoteOnline\\vote-own\\target\\classes\\mapper\\vote-own\\MatchMapper.xml]\r\n### The error may involve com.vote.mapper.MatchMapper.insertMatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into match          ( match_name,             match_begin_time,             match_end_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'match\n         ( match_name,\n            match_begin_time,\n            match_end\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'match\n         ( match_name,\n            match_begin_time,\n            match_end\' at line 1','2022-07-05 23:12:03'),
(126,'观众投票管理',1,'com.vote.controller.ViewerVoteController.addSave()','POST',1,'admin','研发部门','/vote-own/vote/add','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"sessionId\":[\"1\"],\"playerId\":[\"1\"],\"viewerId\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:13:35'),
(127,'曲目信息',1,'com.vote.controller.ApplicantsController.addSave()','POST',1,'admin','研发部门','/vote-own/applicants/add','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"playerId\":[\"1\"],\"songTitle\":[\"123\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:13:41'),
(128,'复赛管理',1,'com.vote.controller.SemiFinalsController.addSave()','POST',1,'admin','研发部门','/vote-own/finals/add','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"playerId\":[\"1\"],\"submitTime\":[\"2022-07-06\"],\"firstScore\":[\"33\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:13:50'),
(129,'比赛评委中间表',1,'com.vote.controller.MatchJudgesController.addSave()','POST',1,'admin','研发部门','/vote-own/match_judges/add','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"judgesId\":[\"1\"],\"raceSchedule\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:14:01'),
(130,'比赛场次',1,'com.vote.controller.MatchSessionController.addSave()','POST',1,'admin','研发部门','/vote-own/match_session/add','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"1\"],\"bId\":[\"1\"],\"beginTime\":[\"2022-07-05\"],\"endTime\":[\"2022-07-12\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:14:13'),
(131,'比赛管理功能',1,'com.vote.controller.MatchController.addSave()','POST',1,'admin','研发部门','/vote-own/match/add','127.0.0.1','内网IP','{\"matchName\":[\"ACM\"],\"matchBeginTime\":[\"2022-06-21\"],\"matchEndTime\":[\"2022-06-21\"]}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'match\n         ( match_name,\n            match_begin_time,\n            match_end\' at line 1\r\n### The error may exist in file [E:\\IdeaProjects\\VoteOnline\\vote-own\\target\\classes\\mapper\\vote-own\\MatchMapper.xml]\r\n### The error may involve com.vote.mapper.MatchMapper.insertMatch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into match          ( match_name,             match_begin_time,             match_end_time )           values ( ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'match\n         ( match_name,\n            match_begin_time,\n            match_end\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'match\n         ( match_name,\n            match_begin_time,\n            match_end\' at line 1','2022-07-05 23:17:00'),
(132,'评委打分',1,'com.vote.controller.JudgesPointsController.addSave()','POST',1,'admin','研发部门','/vote-own/points/add','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"sessionId\":[\"1\"],\"judgesId\":[\"1\"],\"playerId\":[\"1\"],\"points\":[\"1234\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:17:30'),
(133,'比赛结果',1,'com.vote.controller.ResultMatchController.addSave()','POST',1,'admin','研发部门','/vote-own/result_match/add','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"playerId\":[\"1\"],\"judgesScore\":[\"1\"],\"voteCount\":[\"12\"],\"percent\":[\"13\"],\"finalScore\":[\"123\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:18:12'),
(134,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"match\"],\"tableComment\":[\"比赛信息\"],\"className\":[\"Match\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"13\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"比赛id 主键\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"matchId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"14\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"matchName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"15\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"比赛开始时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"matchBeginTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"16\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"比赛截止时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"matchEndTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.vote\"],\"moduleName\":[\"vote-own\"],\"businessName\":[\"match\"],\"functionName\":[\"比赛信息\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"投票系统管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:20:08'),
(135,'代码生成',2,'com.vote.generator.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/match','127.0.0.1','内网IP','\"match\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:21:31'),
(136,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"3\"],\"tableName\":[\"match\"],\"tableComment\":[\"比赛信息\"],\"className\":[\"Match\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"13\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"比赛id 主键\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"matchId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"14\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"matchName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"15\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"比赛开始时间\"],\"columns[2].javaType\":[\"Date\"],\"columns[2].javaField\":[\"matchBeginTime\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"datetime\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"16\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"比赛截止时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"matchEndTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.vote\"],\"moduleName\":[\"vote-own\"],\"businessName\":[\"match\"],\"functionName\":[\"比赛信息\"],\"params[parentMenuId]\":[\"2001\"],\"params[parentMenuName]\":[\"投票系统管理\"],\"genType\":[\"0\"],\"genPath\":[\"/\"],\"subTableName\":[\"\"],\"params[treeCode]\":[\"\"],\"params[treeParentCode]\":[\"\"],\"params[treeName]\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:22:10'),
(137,'代码生成',8,'com.vote.generator.controller.GenController.download()','GET',1,'admin','研发部门','/tool/gen/download/match','127.0.0.1','内网IP','\"match\"',NULL,0,NULL,'2022-07-05 23:22:18'),
(138,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"match_session\"],\"tableComment\":[\"比赛场次\"],\"className\":[\"MatchSession\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"20\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id  场次id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"21\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"22\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程  1-初赛 2-决赛\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"23\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"a选手id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"aId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"24\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"b选手id\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"bId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"25\"],\"columns[5','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:32:12'),
(139,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"5\"],\"tableName\":[\"match_session\"],\"tableComment\":[\"比赛场次\"],\"className\":[\"MatchSession\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"20\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id  场次id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"21\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"22\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程  1-初赛 2-决赛\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"23\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"a选手id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"aId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"24\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"b选手id\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"bId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"25\"],\"columns[5','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:32:29'),
(140,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"judges_points\"],\"tableComment\":[\"评委打分信息\"],\"className\":[\"JudgesPoints\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"6\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"7\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"8\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"9\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"场次id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"sessionId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"10\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"评委id\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"judgesId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"11\"],\"columns[5].sort\":[\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:34:54'),
(141,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"judges_points\"],\"tableComment\":[\"评委打分信息\"],\"className\":[\"JudgesPoints\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"6\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"7\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"8\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"9\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"场次id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"sessionId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"10\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"评委id\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"judgesId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"11\"],\"columns[5].sort\":[\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:35:06'),
(142,'代码生成',2,'com.vote.generator.controller.GenController.editSave()','POST',1,'admin','研发部门','/tool/gen/edit','127.0.0.1','内网IP','{\"tableId\":[\"2\"],\"tableName\":[\"judges_points\"],\"tableComment\":[\"评委打分信息\"],\"className\":[\"JudgesPoints\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"6\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"7\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"比赛id\"],\"columns[1].javaType\":[\"Integer\"],\"columns[1].javaField\":[\"matchId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"8\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"赛程\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"raceSchedule\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].isRequired\":[\"1\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"9\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"场次id\"],\"columns[3].javaType\":[\"Integer\"],\"columns[3].javaField\":[\"sessionId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].isRequired\":[\"1\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"10\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"评委id\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"judgesId\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].isRequired\":[\"1\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"11\"],\"columns[5].sort\":[\"','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:38:17'),
(143,'比赛场次',1,'com.vote.controller.MatchSessionController.addSave()','POST',1,'admin','研发部门','/vote-own/match_session/add','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"raceSchedule\":[\"2\"],\"aId\":[\"2\"],\"bId\":[\"3\"],\"beginTime\":[\"2022-07-05\"],\"endTime\":[\"2022-07-06\"],\"status\":[\"2\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-05 23:42:45'),
(144,'比赛信息',1,'com.vote.controller.MatchController.addSave()','POST',1,'admin','研发部门','/vote-own/match/add','127.0.0.1','内网IP','{\"matchName\":[\"ACM\"],\"matchBeginTime\":[\"2022-07-06 00:10:35\"],\"matchEndTime\":[\"2022-07-07 06:10:35\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 00:11:51'),
(145,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"权限管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 09:38:47'),
(146,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"权限管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-bank\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 09:39:00'),
(147,'角色管理',1,'com.vote.web.controller.system.SysRoleController.addSave()','POST',1,'admin','研发部门','/system/role/add','127.0.0.1','内网IP','{\"roleName\":[\"活动管理员\"],\"roleKey\":[\"activity\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2044,2045,2046,2047,2048,2049,2050,2051,2052,2053,2054,2055,2056,2057,2058,2059,2060,2061\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 09:44:18'),
(148,'角色管理',2,'com.vote.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 09:44:46'),
(149,'角色管理',1,'com.vote.web.controller.system.SysRoleController.addSave()','POST',1,'admin','研发部门','/system/role/add','127.0.0.1','内网IP','{\"roleName\":[\"评委\"],\"roleKey\":[\"judges\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2044,2045,2046,2047,2048,2049,4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 09:46:47'),
(150,'角色管理',2,'com.vote.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 09:46:54'),
(151,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"1\"],\"bId\":[\"1\"],\"beginTime\":[\"2022-07-05\"],\"endTime\":[\"2022-07-12\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 10:03:46'),
(152,'复赛管理',2,'com.vote.controller.SemiFinalsController.editSave()','POST',1,'admin','研发部门','/vote-own/finals/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"matchId\":[\"1\"],\"playerId\":[\"1\"],\"submitTime\":[\"2022-07-07\"],\"firstScore\":[\"33\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 10:28:38'),
(153,'用户管理',2,'com.vote.web.controller.system.SysUserController.changeStatus()','POST',1,'admin','研发部门','/system/user/changeStatus','127.0.0.1','内网IP','{\"userId\":[\"100\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 10:45:51'),
(154,'用户管理',2,'com.vote.web.controller.system.SysUserController.changeStatus()','POST',1,'admin','研发部门','/system/user/changeStatus','127.0.0.1','内网IP','{\"userId\":[\"100\"],\"status\":[\"0\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 10:45:54'),
(155,'复赛管理',2,'com.vote.controller.SemiFinalsController.editSave()','POST',1,'admin','研发部门','/vote-own/finals/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"matchId\":[\"1\"],\"playerId\":[\"1\"],\"submitTime\":[\"2022-07-06\"],\"firstScore\":[\"33\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 11:00:26'),
(156,'复赛管理',2,'com.vote.controller.SemiFinalsController.editSave()','POST',1,'admin','研发部门','/vote-own/finals/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"matchId\":[\"1\"],\"playerId\":[\"1\"],\"submitTime\":[\"2022-07-07 00:00:00\"],\"firstScore\":[\"33\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 11:03:41'),
(157,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"1\"],\"bId\":[\"1\"],\"beginTime\":[\"2022-07-06 01:05:00\"],\"endTime\":[\"2022-07-12\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 11:05:40'),
(158,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"1\"],\"bId\":[\"1\"],\"beginTime\":[\"2022-07-06 01:05:00\"],\"endTime\":[\"2022-07-12 10:45:00\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 11:07:16'),
(159,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"2\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"2\"],\"aId\":[\"2\"],\"bId\":[\"3\"],\"beginTime\":[\"2022-07-05 05:45:00\"],\"endTime\":[\"2022-07-06 05:45:00\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 11:07:27'),
(160,'复赛管理',2,'com.vote.controller.SemiFinalsController.editSave()','POST',1,'admin','研发部门','/vote-own/finals/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"matchId\":[\"1\"],\"playerId\":[\"1\"],\"submitTime\":[\"2022-07-13 09:20:00\"],\"firstScore\":[\"33\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 11:07:38'),
(161,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"test\"],\"deptName\":[\"\"],\"phonenumber\":[\"17815342995\"],\"email\":[\"\"],\"loginName\":[\"test\"],\"sex\":[\"0\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 11:41:06'),
(162,'用户管理',2,'com.vote.web.controller.system.SysUserController.editSave()','POST',1,'admin','研发部门','/system/user/edit','127.0.0.1','内网IP','{\"userId\":[\"102\"],\"deptId\":[\"\"],\"userName\":[\"lengzhou\"],\"dept.deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"lengzhou\"],\"sex\":[\"0\"],\"role\":[\"100\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"100\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 12:17:27'),
(163,'个人信息',2,'com.vote.web.controller.system.SysProfileController.update()','POST',1,'lengzhou',NULL,'/system/user/profile/update','127.0.0.1','内网IP','{\"id\":[\"\"],\"userName\":[\"冷洲\"],\"phonenumber\":[\"17815342998\"],\"email\":[\"1264787655@qq.com\"],\"sex\":[\"0\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-06 17:56:21'),
(164,'比赛信息',1,'com.vote.controller.MatchController.addSave()','POST',1,'admin','研发部门','/vote-own/match/add','127.0.0.1','内网IP','{\"matchName\":[\"ICPC\"],\"matchBeginTime\":[\"2022-07-06 09:00:58\"],\"matchEndTime\":[\"2022-07-14 10:50:58\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 11:17:15'),
(165,'比赛信息',1,'com.vote.controller.MatchController.addSave()','POST',1,'admin','研发部门','/vote-own/match/add','127.0.0.1','内网IP','{\"matchName\":[\"歌唱大赛\"],\"matchBeginTime\":[\"2022-07-06 00:00:57\"],\"matchEndTime\":[\"2022-07-07 11:00:57\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 11:18:32'),
(166,'比赛信息',2,'com.vote.controller.MatchController.editSave()','POST',1,'admin','研发部门','/vote-own/match/edit','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"matchName\":[\"1\"],\"matchBeginTime\":[\"2022-07-05 10:00:27\"],\"matchEndTime\":[\"2022-07-06 23:26:29\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 11:23:01'),
(167,'比赛信息',2,'com.vote.controller.MatchController.editSave()','POST',1,'admin','研发部门','/vote-own/match/edit','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"matchName\":[\"1\"],\"matchBeginTime\":[\"2022-07-05 10:00\"],\"matchEndTime\":[\"2022-07-06 23:26:29\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 11:24:52'),
(168,'比赛信息',2,'com.vote.controller.MatchController.editSave()','POST',1,'admin','研发部门','/vote-own/match/edit','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"matchName\":[\"1\"],\"matchBeginTime\":[\"2022-07-05 10:00:00\"],\"matchEndTime\":[\"2022-07-06 23:25\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 11:25:00'),
(169,'比赛信息',2,'com.vote.controller.MatchController.editSave()','POST',1,'admin','研发部门','/vote-own/match/edit','127.0.0.1','内网IP','{\"matchId\":[\"2\"],\"matchName\":[\"ACM\"],\"matchBeginTime\":[\"2022-07-06 00:10\"],\"matchEndTime\":[\"2022-07-07 06:10:35\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 11:26:15'),
(170,'比赛信息',2,'com.vote.controller.MatchController.editSave()','POST',1,'admin','研发部门','/vote-own/match/edit','127.0.0.1','内网IP','{\"matchId\":[\"2\"],\"matchName\":[\"ACM\"],\"matchBeginTime\":[\"2022-07-06 00:00\"],\"matchEndTime\":[\"2022-07-07 06:10:35\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 11:26:23'),
(171,'比赛信息',2,'com.vote.controller.MatchController.editSave()','POST',1,'admin','研发部门','/vote-own/match/edit','127.0.0.1','内网IP','{\"matchId\":[\"2\"],\"matchName\":[\"ACM\"],\"matchBeginTime\":[\"2022-07-06 00:00:00\"],\"matchEndTime\":[\"2022-07-07 06:10\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 11:26:38'),
(172,'曲目信息',3,'com.vote.controller.ApplicantsController.remove()','POST',1,'admin','研发部门','/vote-own/applicants/remove','127.0.0.1','内网IP','{\"ids\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 20:05:22'),
(173,'曲目信息',3,'com.vote.controller.ApplicantsController.remove()','POST',1,'admin','研发部门','/vote-own/applicants/remove','127.0.0.1','内网IP','{\"ids\":[\"2\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 20:05:24'),
(174,'曲目信息',3,'com.vote.controller.ApplicantsController.remove()','POST',1,'admin','研发部门','/vote-own/applicants/remove','127.0.0.1','内网IP','{\"ids\":[\"5,6\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 22:08:15'),
(175,'曲目信息',3,'com.vote.controller.ApplicantsController.remove()','POST',1,'admin','研发部门','/vote-own/applicants/remove','127.0.0.1','内网IP','{\"ids\":[\"3,4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 22:10:26'),
(176,'比赛信息',1,'com.vote.controller.MatchController.addSave()','POST',1,'admin','研发部门','/vote-own/match/add','127.0.0.1','内网IP','{\"matchName\":[\"2019年歌唱比赛\"],\"matchBeginTime\":[\"2019-01-29 06:05\"],\"matchEndTime\":[\"2019-06-04 23:00\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 23:10:29'),
(177,'比赛信息',1,'com.vote.controller.MatchController.addSave()','POST',1,'admin','研发部门','/vote-own/match/add','127.0.0.1','内网IP','{\"matchName\":[\"2022\"],\"matchBeginTime\":[\"2022-07-15 11:35\"],\"matchEndTime\":[\"2022-07-21 13:45\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 23:11:16'),
(178,'比赛信息',1,'com.vote.controller.MatchController.addSave()','POST',1,'admin','研发部门','/vote-own/match/add','127.0.0.1','内网IP','{\"matchName\":[\"2023\"],\"matchBeginTime\":[\"2022-07-11 08:40\"],\"matchEndTime\":[\"2022-07-05 05:25\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-07 23:11:28'),
(179,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"1\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"1\"],\"bId\":[\"1\"],\"beginTime\":[\"2022-07-06 01:05:00\"],\"endTime\":[\"2022-07-12 10:45:00\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 09:51:15'),
(180,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'lengzhou',NULL,'/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 10:38:57'),
(181,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'lengzhou',NULL,'/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"2\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 10:39:00'),
(182,'比赛场次',1,'com.vote.controller.MatchSessionController.addSave()','POST',1,'lengzhou',NULL,'/vote-own/match_session/add','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"1\"],\"bId\":[\"2\"],\"beginTime\":[\"2022-07-05 05:25\"],\"endTime\":[\"2022-06-29 05:25\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 10:43:28'),
(183,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"3\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"1\"],\"bId\":[\"102\"],\"beginTime\":[\"2022-07-05 05:25:00\"],\"endTime\":[\"2022-06-29 05:25:00\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 10:48:59'),
(184,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"3\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"101\"],\"bId\":[\"102\"],\"beginTime\":[\"2022-07-05 05:25:00\"],\"endTime\":[\"2022-06-29 05:25:00\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 10:49:15'),
(185,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"3\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 17:49:45'),
(186,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 17:49:47'),
(187,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"5,6\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 17:51:11'),
(188,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"7,8\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 17:52:47'),
(189,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"9,10\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 17:55:25'),
(190,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"11,12\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 17:56:08'),
(191,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"13,14\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 17:58:07'),
(192,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"15,16\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 18:01:44'),
(193,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"17,18\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 18:06:40'),
(194,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"19,20\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 18:49:05'),
(195,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"21,22\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 18:50:55'),
(196,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"23,24\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 18:51:29'),
(197,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"25,26\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 19:32:55'),
(198,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"27,28\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-08 19:33:27'),
(199,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"小明\"],\"deptName\":[\"\"],\"phonenumber\":[\"15112534986\"],\"email\":[\"1692464552@qq.com\"],\"loginName\":[\"pringt\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:50:57'),
(200,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"李某\"],\"deptName\":[\"\"],\"phonenumber\":[\"14876354345\"],\"email\":[\"\"],\"loginName\":[\"frmod\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:51:51'),
(201,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"oring\"],\"deptName\":[\"\"],\"phonenumber\":[\"15643164614\"],\"email\":[\"dd@163.com0\"],\"loginName\":[\"workes\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:52:33'),
(202,'用户管理',2,'com.vote.web.controller.system.SysUserController.editSave()','POST',1,'admin','研发部门','/system/user/edit','127.0.0.1','内网IP','{\"userId\":[\"104\"],\"deptId\":[\"\"],\"userName\":[\"田雨\"],\"dept.deptName\":[\"\"],\"phonenumber\":[\"14956287624\"],\"email\":[\"\"],\"loginName\":[\"tianyu\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:52:52'),
(203,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"关关雎鸠\"],\"deptName\":[\"\"],\"phonenumber\":[\"17254622865\"],\"email\":[\"\"],\"loginName\":[\"李莉莉\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:54:30'),
(204,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"御九冉\"],\"deptName\":[\"\"],\"phonenumber\":[\"15628896446\"],\"email\":[\"\"],\"loginName\":[\"return\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:55:32'),
(205,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"傻瓜\"],\"deptName\":[\"\"],\"phonenumber\":[\"15462234565\"],\"email\":[\"\"],\"loginName\":[\"not_bug\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:56:36'),
(206,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"夏季微凉\"],\"deptName\":[\"\"],\"phonenumber\":[\"13642665489\"],\"email\":[\"\"],\"loginName\":[\"张帅\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:57:04'),
(207,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"小雨淅淅\"],\"deptName\":[\"\"],\"phonenumber\":[\"16455337945\"],\"email\":[\"\"],\"loginName\":[\"skeiu\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:58:30'),
(208,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"胡强\"],\"deptName\":[\"\"],\"phonenumber\":[\"13436974568\"],\"email\":[\"\"],\"loginName\":[\"jiang\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:58:53'),
(209,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"29,30\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 08:59:29'),
(210,'重置密码',2,'com.vote.web.controller.system.SysUserController.resetPwdSave()','POST',1,'admin','研发部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"userId\":[\"104\"],\"loginName\":[\"tianyu\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 09:17:13'),
(211,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"31,32\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 09:18:04'),
(212,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"33\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"107\"],\"bId\":[\"112\"],\"beginTime\":[\"2022-07-09 09:20\"],\"endTime\":[\"2022-07-09 09:30\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 09:22:01'),
(213,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"34\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"109\"],\"bId\":[\"105\"],\"beginTime\":[\"2022-07-09 09:35\"],\"endTime\":[\"2022-07-09 09:45\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 09:22:21'),
(214,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"35\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"106\"],\"bId\":[\"108\"],\"beginTime\":[\"2022-07-09 09:45\"],\"endTime\":[\"2022-07-09 09:55\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 09:22:34'),
(215,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"36\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"102\"],\"bId\":[\"110\"],\"beginTime\":[\"2022-07-09 09:55\"],\"endTime\":[\"2022-07-10 10:05\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 09:22:59'),
(216,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"37\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"111\"],\"bId\":[\"113\"],\"beginTime\":[\"2022-07-09 10:05\"],\"endTime\":[\"2022-07-09 10:15\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 09:23:27'),
(217,'比赛场次',2,'com.vote.controller.MatchSessionController.editSave()','POST',1,'admin','研发部门','/vote-own/match_session/edit','127.0.0.1','内网IP','{\"id\":[\"38\"],\"matchId\":[\"1\"],\"raceSchedule\":[\"1\"],\"aId\":[\"1\"],\"bId\":[\"101\"],\"beginTime\":[\"2022-07-09 10:15\"],\"endTime\":[\"2022-07-09 10:25\"],\"status\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 09:23:42'),
(218,'观众投票管理',3,'com.vote.controller.ViewerVoteController.remove()','POST',1,'admin','研发部门','/vote-own/vote/remove','127.0.0.1','内网IP','{\"ids\":[\"2\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:27:59'),
(219,'观众投票管理',3,'com.vote.controller.ViewerVoteController.remove()','POST',1,'admin','研发部门','/vote-own/vote/remove','127.0.0.1','内网IP','{\"ids\":[\"1,3,4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:39:38'),
(220,'比赛信息',2,'com.vote.controller.MatchController.editSave()','POST',1,'admin','研发部门','/vote-own/match/edit','127.0.0.1','内网IP','{\"matchId\":[\"1\"],\"matchName\":[\"1\"],\"matchBeginTime\":[\"2022-07-05 10:00\"],\"matchEndTime\":[\"2022-07-14 23:25\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:43:39'),
(221,'菜单管理',1,'com.vote.web.controller.system.SysMenuController.addSave()','POST',1,'admin','研发部门','/system/menu/add','127.0.0.1','内网IP','{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"评委打分\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:53:49'),
(222,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2062\"],\"parentId\":[\"0\"],\"menuType\":[\"F\"],\"menuName\":[\"评委打分\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:54:46'),
(223,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"admin\"],\"deptName\":[\"\"],\"phonenumber\":[\"\"],\"email\":[\"\"],\"loginName\":[\"201123\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:54:52'),
(224,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2062\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"评委打分\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:55:10'),
(225,'用户管理',3,'com.vote.web.controller.system.SysUserController.remove()','POST',1,'admin','研发部门','/system/user/remove','127.0.0.1','内网IP','{\"ids\":[\"114\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:55:47'),
(226,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2062\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"评委打分\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-reorder\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:55:53'),
(227,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"魏霸霸\"],\"deptName\":[\"\"],\"phonenumber\":[\"17383003534\"],\"email\":[\"2218734383@qq.com\"],\"loginName\":[\"191122\"],\"sex\":[\"0\"],\"role\":[\"101\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"101\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:56:21'),
(228,'角色管理',2,'com.vote.web.controller.system.SysRoleController.editSave()','POST',1,'admin','研发部门','/system/role/edit','127.0.0.1','内网IP','{\"roleId\":[\"101\"],\"roleName\":[\"评委\"],\"roleKey\":[\"judges\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"\"],\"menuIds\":[\"2001,2044,2045,2046,2047,2048,2049,2062,4\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:57:05'),
(229,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2062\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"评委打分\"],\"url\":[\"/jud\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-reorder\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 11:58:06'),
(230,'菜单管理',2,'com.vote.web.controller.system.SysMenuController.editSave()','POST',1,'admin','研发部门','/system/menu/edit','127.0.0.1','内网IP','{\"menuId\":[\"2062\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"评委打分\"],\"url\":[\"/jud/1\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-reorder\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 12:06:18'),
(231,'评委打分',3,'com.vote.controller.JudgesPointsController.remove()','POST',1,'admin','研发部门','/vote-own/points/remove','127.0.0.1','内网IP','{\"ids\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 22:20:01'),
(232,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"39,40,41,42,43,44\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 22:48:47'),
(233,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"45,46,47,48,49,50\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-09 22:49:08'),
(234,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"兰尼\"],\"deptName\":[\"\"],\"phonenumber\":[\"13546795426\"],\"email\":[\"\"],\"loginName\":[\"lanni\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:08:04'),
(235,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"丽萨\"],\"deptName\":[\"\"],\"phonenumber\":[\"18358465498\"],\"email\":[\"\"],\"loginName\":[\"lisa\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:08:51'),
(236,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"强尼\"],\"deptName\":[\"\"],\"phonenumber\":[\"18246955747\"],\"email\":[\"\"],\"loginName\":[\"qiangli\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:09:30'),
(237,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"乐乐\"],\"deptName\":[\"\"],\"phonenumber\":[\"18574545976\"],\"email\":[\"\"],\"loginName\":[\"lele\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:09:59'),
(238,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"k头怪\"],\"deptName\":[\"\"],\"phonenumber\":[\"15297477555\"],\"email\":[\"\"],\"loginName\":[\"KPL\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:10:46'),
(239,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"绩效\"],\"deptName\":[\"\"],\"phonenumber\":[\"15216479445\"],\"email\":[\"\"],\"loginName\":[\"gui\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:11:11'),
(240,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"吴迪\"],\"deptName\":[\"\"],\"phonenumber\":[\"15324798465\"],\"email\":[\"\"],\"loginName\":[\"马卡\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:12:16'),
(241,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"露丝\"],\"deptName\":[\"\"],\"phonenumber\":[\"15478462143\"],\"email\":[\"\"],\"loginName\":[\"lusi\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:16:14'),
(242,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"切丝\"],\"deptName\":[\"\"],\"phonenumber\":[\"18868456326\"],\"email\":[\"\"],\"loginName\":[\"qiesi\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:16:43'),
(243,'用户管理',1,'com.vote.web.controller.system.SysUserController.addSave()','POST',1,'admin','研发部门','/system/user/add','127.0.0.1','内网IP','{\"deptId\":[\"\"],\"userName\":[\"土司\"],\"deptName\":[\"\"],\"phonenumber\":[\"15478985663\"],\"email\":[\"\"],\"loginName\":[\"tusi\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 09:17:22'),
(244,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 10:40:50'),
(245,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"2,3,4,5,6,7,8,9,10,11\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 10:43:10'),
(246,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"12,13\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 10:43:16'),
(247,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"14,15,16,17,18,19,20,21,22,23\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 10:45:07'),
(248,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"24,25\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 10:45:10'),
(249,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"26,27,28,29,30,31,32,33,34,35\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 11:04:33'),
(250,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"36,37,38,39,40,41,42,43,44,45\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 11:09:04'),
(251,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"46,47,48,49,50,51,52,53,54,55\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 11:09:07'),
(252,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"56,57,58,59,60,61\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 11:09:11'),
(253,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"62,63,64,65,66,67,68,69,70,71\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 11:18:12'),
(254,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"72,73\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 11:18:15'),
(255,'复赛管理',3,'com.vote.controller.SemiFinalsController.remove()','POST',1,'admin','研发部门','/vote-own/finals/remove','127.0.0.1','内网IP','{\"ids\":[\"1\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 12:02:06'),
(256,'复赛管理',3,'com.vote.controller.SemiFinalsController.remove()','POST',1,'admin','研发部门','/vote-own/finals/remove','127.0.0.1','内网IP','{\"ids\":[\"2,3,4,5,6,7,8,9,10,11\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:06:01'),
(257,'复赛管理',3,'com.vote.controller.SemiFinalsController.remove()','POST',1,'admin','研发部门','/vote-own/finals/remove','127.0.0.1','内网IP','{\"ids\":[\"12,13,14,15,16,17\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:06:05'),
(258,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"51,52,53,54,55,56,57,58,59,60\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:09:24'),
(259,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"61\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:09:27'),
(260,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"33,34,35,36,37,38,62,63,64,65\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:22:58'),
(261,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"66\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:23:01'),
(262,'复赛管理',3,'com.vote.controller.SemiFinalsController.remove()','POST',1,'admin','研发部门','/vote-own/finals/remove','127.0.0.1','内网IP','{\"ids\":[\"18,19,20,21,22,23,24,25\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:26:54'),
(263,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"67,68,69,70,71,72,73,74,75,76\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:27:03'),
(264,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"77\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:27:07'),
(265,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"89,90,91,92,93,94,95,96,97,98\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:30:48'),
(266,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"99\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 13:30:55'),
(267,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"87\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 14:36:59'),
(268,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"78,79,80,81,82,83,84,85,86,88\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 14:40:58'),
(269,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"100,101,102,103,104,105,106,107,108,109\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 14:41:58'),
(270,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"110\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 15:00:09'),
(271,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"111,112,113,114,115,116,117,118,119,120\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 15:07:46'),
(272,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"121\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 15:07:49'),
(273,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"122\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 15:09:25'),
(274,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"132\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 15:48:23'),
(275,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"123,124,125,126,127,128,129,130,131\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 16:14:59'),
(276,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"143\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 16:19:28'),
(277,'评委打分',3,'com.vote.controller.JudgesPointsController.remove()','POST',1,'admin','研发部门','/vote-own/points/remove','127.0.0.1','内网IP','{\"ids\":[\"12\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 17:41:29'),
(278,'评委打分',3,'com.vote.controller.JudgesPointsController.remove()','POST',1,'admin','研发部门','/vote-own/points/remove','127.0.0.1','内网IP','{\"ids\":[\"2,3,4,5,6,7,9,10,11,13\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 18:45:50'),
(279,'评委打分',3,'com.vote.controller.JudgesPointsController.remove()','POST',1,'admin','研发部门','/vote-own/points/remove','127.0.0.1','内网IP','{\"ids\":[\"14,15,16\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 18:45:52'),
(280,'观众投票管理',3,'com.vote.controller.ViewerVoteController.remove()','POST',1,'admin','研发部门','/vote-own/vote/remove','127.0.0.1','内网IP','{\"ids\":[\"5,6,7,8,9,10,11,12,13,14\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 18:47:35'),
(281,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"74,75,76,77,78,79,80,81,82,83\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 18:47:59'),
(282,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"84,85\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 18:48:02'),
(283,'观众投票管理',3,'com.vote.controller.ViewerVoteController.remove()','POST',1,'admin','研发部门','/vote-own/vote/remove','127.0.0.1','内网IP','{\"ids\":[\"15,16,17\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 18:48:40'),
(284,'比赛场次',3,'com.vote.controller.MatchSessionController.remove()','POST',1,'admin','研发部门','/vote-own/match_session/remove','127.0.0.1','内网IP','{\"ids\":[\"144\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 19:09:51'),
(285,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"86,87,88,89\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 19:31:53'),
(286,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"90,91,92,93\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 19:45:48'),
(287,'比赛结果',3,'com.vote.controller.ResultMatchController.remove()','POST',1,'admin','研发部门','/vote-own/result_match/remove','127.0.0.1','内网IP','{\"ids\":[\"114,115,116,117,118,119,120,121\"]}','{\"msg\":\"操作成功\",\"code\":0}',0,NULL,'2022-07-10 19:53:51');

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'ceo','董事长',1,'0','admin','2022-07-05 12:08:42','',NULL,''),
(2,'se','项目经理',2,'0','admin','2022-07-05 12:08:43','',NULL,''),
(3,'hr','人力资源',3,'0','admin','2022-07-05 12:08:44','',NULL,''),
(4,'user','普通员工',4,'0','admin','2022-07-05 12:08:45','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'超级管理员','admin',1,'1','0','0','admin','2022-07-05 12:08:49','',NULL,'超级管理员'),
(2,'普通角色','common',4,'2','0','0','admin','2022-07-05 12:08:50','admin','2022-07-06 09:46:53','普通角色'),
(100,'活动管理员','activity',2,'1','0','0','admin','2022-07-06 09:44:17','',NULL,NULL),
(101,'评委','judges',3,'1','0','0','admin','2022-07-06 09:46:46','admin','2022-07-09 11:57:05','');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values 
(2,100),
(2,101),
(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(2,4),
(100,2001),
(100,2008),
(100,2009),
(100,2010),
(100,2011),
(100,2012),
(100,2013),
(100,2014),
(100,2015),
(100,2016),
(100,2017),
(100,2018),
(100,2019),
(100,2020),
(100,2021),
(100,2022),
(100,2023),
(100,2024),
(100,2025),
(100,2026),
(100,2027),
(100,2028),
(100,2029),
(100,2030),
(100,2031),
(100,2032),
(100,2033),
(100,2034),
(100,2035),
(100,2036),
(100,2037),
(100,2044),
(100,2045),
(100,2046),
(100,2047),
(100,2048),
(100,2049),
(100,2050),
(100,2051),
(100,2052),
(100,2053),
(100,2054),
(100,2055),
(100,2056),
(100,2057),
(100,2058),
(100,2059),
(100,2060),
(100,2061),
(101,4),
(101,2001),
(101,2044),
(101,2045),
(101,2046),
(101,2047),
(101,2048),
(101,2049),
(101,2062);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`login_name`,`user_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`salt`,`status`,`del_flag`,`login_ip`,`login_date`,`pwd_update_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,103,'admin','若依','00','ry@163.com','15888888888','1','','29c67a30398638269fe600f73a054934','111111','0','0','127.0.0.1','2022-07-10 19:59:10','2022-07-05 12:08:38','admin','2022-07-05 12:08:38','','2022-07-10 19:59:10','管理员'),
(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','8e6d98b90472783cc73c17047ddccf36','222222','0','0','127.0.0.1','2022-07-05 12:08:39','2022-07-05 12:08:39','admin','2022-07-05 12:08:39','',NULL,'测试员'),
(100,NULL,'wyh','魏渝辉','00','','17815342996','0','','d607d0e49f6a5ba9ce18e711116671a6','a4ceb0','0','0','127.0.0.1','2022-07-05 15:07:31',NULL,'admin','2022-07-05 15:06:42','','2022-07-06 10:45:54',NULL),
(101,NULL,'test','test','00','','17815342995','0','','ef4655f27f63f5b067f2db635fc59b47','4cc45e','0','0','127.0.0.1','2022-07-10 19:17:44',NULL,'admin','2022-07-06 11:41:06','','2022-07-10 19:17:44',NULL),
(102,NULL,'lengzhou','冷洲','01','1264787655@qq.com','17815342998','0','','1f763f20c2e8073ac3087ebc72d5f3cb','7f9108','0','0','127.0.0.1','2022-07-10 19:10:19','2022-07-06 12:11:00','','2022-07-06 12:11:02','admin','2022-07-10 19:10:19',''),
(104,NULL,'tianyu','田雨','01','','14956287624','0','','633ad71aee003052489f44ddb0601fcb','ccaedb','0','0','127.0.0.1','2022-07-06 21:37:07','2022-07-06 21:33:42','','2022-07-06 21:33:44','admin','2022-07-09 09:17:13',''),
(105,NULL,'pringt','小明','00','1692464552@qq.com','15112534986','0','','848448be63f45cf3b220099379318fd1','5e8953','0','0','127.0.0.1','2022-07-09 09:16:18',NULL,'admin','2022-07-09 08:50:56','','2022-07-09 09:16:18',NULL),
(106,NULL,'frmod','李某','00','','14876354345','0','','1953a24ef1036dde8f67e177eafa3dfc','c26b8b','0','0','127.0.0.1','2022-07-09 09:10:23',NULL,'admin','2022-07-09 08:51:51','','2022-07-09 09:10:22',NULL),
(107,NULL,'workes','oring','00','dd@163.com0','15643164614','0','','5c7a8057886eb011d60b385638c7e5fd','4b7af4','0','0','127.0.0.1','2022-07-09 09:09:05',NULL,'admin','2022-07-09 08:52:33','','2022-07-09 09:09:04',NULL),
(108,NULL,'李莉莉','关关雎鸠','00','','17254622865','1','','1fe20ddca4f8fd49941a1ee2907f3a08','897a45','0','0','127.0.0.1','2022-07-09 09:08:03',NULL,'admin','2022-07-09 08:54:30','','2022-07-09 09:08:03',NULL),
(109,NULL,'return','御九冉','00','','15628896446','0','','8f4bb7417555ba8982486c3b0585c8cb','d7a2c8','0','0','127.0.0.1','2022-07-09 09:07:08',NULL,'admin','2022-07-09 08:55:32','','2022-07-09 09:07:08',NULL),
(110,NULL,'not_bug','傻瓜','00','','15462234565','0','','000786d3bccdb67d3e8ee8f6d6bfcab2','bcfd84','0','0','127.0.0.1','2022-07-09 12:12:20',NULL,'admin','2022-07-09 08:56:36','','2022-07-09 12:12:20',NULL),
(111,NULL,'张帅','夏季微凉','00','','13642665489','0','','b9cc16cc977170c9cf37b27905794672','847005','0','0','127.0.0.1','2022-07-09 09:06:27',NULL,'admin','2022-07-09 08:57:04','','2022-07-09 09:06:26',NULL),
(112,NULL,'skeiu','小雨淅淅','00','','16455337945','1','','59cafdf1ec73f66729ece858d0f7d6b8','9a3a32','0','0','127.0.0.1','2022-07-09 09:05:47',NULL,'admin','2022-07-09 08:58:30','','2022-07-09 09:05:47',NULL),
(113,NULL,'jiang','胡强','00','','13436974568','0','','f3b5e85041ec8f72a613308c608a8223','b87a45','0','0','127.0.0.1','2022-07-09 09:04:59',NULL,'admin','2022-07-09 08:58:53','','2022-07-09 09:04:58',NULL),
(114,NULL,'201123','admin','00','','','0','','850012b8c362e27f41bbc24abf56e1e0','ce3e6e','0','2','',NULL,NULL,'admin','2022-07-09 11:54:51','',NULL,NULL),
(115,NULL,'191122','魏霸霸','00','2218734383@qq.com','17383003534','0','','22e7d7a97ef9b8dca0f300699d9b6a91','743e1e','0','0','',NULL,NULL,'admin','2022-07-09 11:56:21','',NULL,NULL),
(116,NULL,'lanni','兰尼','00','','13546795426','1','','31845c84d886d57b41641cbabc849227','efa84b','0','0','',NULL,NULL,'admin','2022-07-10 09:08:03','',NULL,NULL),
(117,NULL,'lisa','丽萨','00','','18358465498','1','','0e3262523c730f2cee40827c9284fb69','991e03','0','0','127.0.0.1','2022-07-10 09:22:59',NULL,'admin','2022-07-10 09:08:50','','2022-07-10 09:22:58',NULL),
(118,NULL,'qiangli','强尼','00','','18246955747','0','','53df21c6c4e24edc6de3cbab5c649377','054d2c','0','0','127.0.0.1','2022-07-10 09:23:55',NULL,'admin','2022-07-10 09:09:30','','2022-07-10 09:23:55',NULL),
(119,NULL,'lele','乐乐','00','','18574545976','1','','b135859d265eeb568520ab9eb47c1bd2','e4f2a8','0','0','127.0.0.1','2022-07-10 09:22:39',NULL,'admin','2022-07-10 09:09:58','','2022-07-10 09:22:38',NULL),
(120,NULL,'KPL','k头怪','00','','15297477555','0','','47e9a3f72aaddf917bb088c32d3c3155','63558c','0','0','127.0.0.1','2022-07-10 09:21:14',NULL,'admin','2022-07-10 09:10:45','','2022-07-10 09:21:13',NULL),
(121,NULL,'gui','绩效','00','','15216479445','1','','b815ef738d2233ba4ea1d2e420e39744','1aa88e','0','0','127.0.0.1','2022-07-10 09:21:51',NULL,'admin','2022-07-10 09:11:11','','2022-07-10 09:21:50',NULL),
(122,NULL,'马卡','吴迪','00','','15324798465','0','','9c2aeb9adc21f40294143dee15bf7fb5','83e069','0','0','127.0.0.1','2022-07-10 09:25:11',NULL,'admin','2022-07-10 09:12:16','','2022-07-10 09:25:10',NULL),
(123,NULL,'lusi','露丝','00','','15478462143','1','','4e853d46acfbadd40a0d435c8dfc23e6','498827','0','0','127.0.0.1','2022-07-10 09:23:23',NULL,'admin','2022-07-10 09:16:13','','2022-07-10 09:23:23',NULL),
(124,NULL,'qiesi','切丝','00','','18868456326','1','','4dd0bce2eec21f7eb9c268bf6c4bf4e7','541f98','0','0','127.0.0.1','2022-07-10 09:24:17',NULL,'admin','2022-07-10 09:16:42','','2022-07-10 09:24:16',NULL),
(125,NULL,'tusi','土司','00','','15478985663','1','','7fcd7a773e8f3ca69c7c07037690e1e5','482e95','0','0','127.0.0.1','2022-07-10 09:24:45',NULL,'admin','2022-07-10 09:17:21','','2022-07-10 09:24:45',NULL);

/*Table structure for table `sys_user_online` */

DROP TABLE IF EXISTS `sys_user_online`;

CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='在线用户记录';

/*Data for the table `sys_user_online` */

insert  into `sys_user_online`(`sessionId`,`login_name`,`dept_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`start_timestamp`,`last_access_time`,`expire_time`) values 
('9c426302-a5a3-45c6-a69a-cd0fbd425106','admin','研发部门','127.0.0.1','内网IP','Chrome 10','Windows 10','on_line','2022-07-10 19:59:10','2022-07-10 19:59:10',1800000);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values 
(1,1),
(2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
(1,1),
(2,2),
(100,2),
(102,100),
(104,2),
(105,2),
(106,2),
(107,2),
(108,2),
(109,2),
(110,2),
(111,2),
(112,2),
(113,2),
(115,101),
(116,2),
(117,2),
(118,2),
(119,2),
(120,2),
(121,2),
(122,2),
(123,2),
(124,2),
(125,2);

/*Table structure for table `viewer_vote` */

DROP TABLE IF EXISTS `viewer_vote`;

CREATE TABLE `viewer_vote` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `match_id` int NOT NULL COMMENT '比赛id',
  `race_schedule` int NOT NULL COMMENT '赛程  1-初赛  2-决赛',
  `session_id` int NOT NULL COMMENT '场次id',
  `player_id` int NOT NULL COMMENT '选手id',
  `viewer_id` int NOT NULL COMMENT '观众id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `viewer_vote` */

insert  into `viewer_vote`(`id`,`match_id`,`race_schedule`,`session_id`,`player_id`,`viewer_id`) values 
(18,1,1,133,117,1),
(19,1,1,134,120,1),
(20,1,1,135,108,1),
(21,1,1,136,118,1),
(22,1,1,137,121,1),
(23,1,1,138,106,1),
(24,1,1,139,107,1),
(25,1,1,140,1,1),
(26,1,1,141,124,1),
(27,1,1,142,110,1),
(28,1,1,133,117,102),
(29,1,1,134,120,102),
(30,1,1,135,108,102),
(31,1,1,136,123,102),
(32,1,1,137,121,102),
(33,1,1,138,106,102),
(34,1,1,139,101,102),
(35,1,1,140,1,102),
(36,1,1,141,124,102),
(37,1,1,142,110,102),
(38,1,1,133,112,101),
(39,1,1,134,105,101),
(40,1,1,135,109,101),
(41,1,1,136,118,101),
(42,1,1,137,121,101),
(43,1,1,138,119,101),
(44,1,1,139,107,101),
(45,1,1,140,122,101),
(46,1,1,141,111,101),
(47,1,1,142,125,101);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
