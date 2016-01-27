/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50173
Source Host           : 121.42.216.131:3306
Source Database       : t_qcpj

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-01-26 09:21:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_class_name
-- ----------------------------
DROP TABLE IF EXISTS `t_class_name`;
CREATE TABLE `t_class_name` (
  `classId` varchar(37) NOT NULL,
  `className` varchar(255) NOT NULL,
  `cId` int(11) NOT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_class_name
-- ----------------------------
INSERT INTO `t_class_name` VALUES ('2A413598', '二班', '2');
INSERT INTO `t_class_name` VALUES ('2A413598-F3DB-40B3-BD46-FEB9395BDE51', '一班', '1');

-- ----------------------------
-- Table structure for t_classes
-- ----------------------------
DROP TABLE IF EXISTS `t_classes`;
CREATE TABLE `t_classes` (
  `schoolId` int(11) NOT NULL,
  `gradeId` int(11) NOT NULL,
  `classId` varchar(36) NOT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_classes
-- ----------------------------
INSERT INTO `t_classes` VALUES ('10', '1', '21');
INSERT INTO `t_classes` VALUES ('10', '2', '2A413598');
INSERT INTO `t_classes` VALUES ('10', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51');
INSERT INTO `t_classes` VALUES ('10', '1', '31');
INSERT INTO `t_classes` VALUES ('10', '1', '51');
INSERT INTO `t_classes` VALUES ('10', '2', 'w');

-- ----------------------------
-- Table structure for t_coin
-- ----------------------------
DROP TABLE IF EXISTS `t_coin`;
CREATE TABLE `t_coin` (
  `currencyId` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`currencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_coin
-- ----------------------------
INSERT INTO `t_coin` VALUES ('0', '1', '分数');
INSERT INTO `t_coin` VALUES ('1', '0', '科学素养');
INSERT INTO `t_coin` VALUES ('2', '0', '人文素养');
INSERT INTO `t_coin` VALUES ('3', '0', '德育素养');
INSERT INTO `t_coin` VALUES ('4', '0', '实践素养');
INSERT INTO `t_coin` VALUES ('5', '0', '艺术素养');

-- ----------------------------
-- Table structure for t_content_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `t_content_evaluation`;
CREATE TABLE `t_content_evaluation` (
  `ContentId` int(11) NOT NULL,
  `ContentEvaluation` text NOT NULL,
  `yn` int(11) NOT NULL,
  `templateId` text,
  PRIMARY KEY (`ContentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_content_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for t_evaluation_template
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluation_template`;
CREATE TABLE `t_evaluation_template` (
  `schoolId` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `templateId` int(11) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(10) NOT NULL,
  `scores` int(11) NOT NULL,
  `weights` int(11) NOT NULL,
  `subject` varchar(10) NOT NULL,
  PRIMARY KEY (`templateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_evaluation_template
-- ----------------------------
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '1', '一周内能按时交家庭（课堂）作业（无漏题、无做错题目）（每周学习小组申报一次，老师审核通过才可加分）', '1', '20', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '2', '一周内家庭（课堂）作业获得A+每次加5分（每周学习小组申报一次，老师审核通过才可加分）', '1', '25', '0', '数学 ');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '3', '一周内课堂小测获得A+每次加5分（每周学习小组申报一次，老师审核通过才可加分）', '1', '25', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '4', '一周内课代表小组长认真完成工作职责（每周学生申报一次，老师审核通过才可加分）', '1', '2', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '5', '单元小测获得优秀等级一次加30分（学生申报，老师审核通过才可加分）', '1', '30', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '6', '一周内课堂积极举手回答问题（每周学生申报一次，老师审核通过才可加分）', '1', '20', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '7', '一周内在家能自觉完成作业（每周家长申报一次，教师审核通过）', '1', '10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '8', '能自觉完成家长布置的课外作业（每月家长申报一次，教师审核通过才可以加分）', '1', '20', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '9', '理解并流利背诵概念、公式（每月家长申报一次，教师审核通过才可以加分）', '1', '10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '10', '学生虚假申报加分项目（发现一次扣申报加分分值的双倍分）', '1', '-10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '11', '不及时交家庭（课堂）作业（当天内补交扣2分，第二天补交扣4分，第三天补交8分，如此类推最多扣10分）', '1', '-10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '12', '家庭（课堂）作业做错题目和漏题（当天内补交扣2分，第二天补交扣4分，第三天补交8分，如此类推最多扣10分）', '1', '-10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '13', '上交的家庭（课堂）错题没有改正（当天内补改扣2分，第二天补改扣4分，第三天补改8分，如此类推最多扣10分）', '1', '-10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '14', '上课忘带书本及学习工具一次扣5分', '1', '-5', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '15', '课堂专注力不够（讲话、玩东西、传纸条等）一次扣5分', '1', '-5', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '16', '练习本、作业本丢失一次扣5分', '1', '-5', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '17', '在书本和练习本上乱涂乱画一次扣5分', '1', '-5', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '18', '破坏课堂纪律（如课前准备没做好、课堂无故走出座位、课堂上起哄等等一次扣10分）', '1', '-10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '19', '抄袭家庭（课堂）作业发现一次扣10分', '1', '-10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '20', '借家庭（课堂）给别人抄袭发现一次扣10分', '1', '-10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '21', '在家做作业磨蹭，效率不高（每周家长申报一次，教师审核通过）', '1', '-10', '0', '数学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '22', '成功地完成实验。', '1', '2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '23', '实验时如实记录数据，态度严谨', '1', '2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '24', '能坚持完成实验，虽失败不放弃', '1', '2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '25', '上课积极发言，善于提出新观点', '1', '1', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '26', '上课能回答关键问题，知识面广', '1', '1', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '27', '实验时善于帮助别人，与人合作', '1', '1', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '28', '课堂分组科技竞赛获胜', '1', '2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '29', '科学知识测试成绩85分以上', '1', '2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '30', '校内科技竞赛活动获一等奖', '1', '4', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '31', '校内科技竞赛活动获二等奖', '1', '3', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '32', '校内科技竞赛活动获三等奖', '1', '2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '33', '校外科技竞赛活动获一等奖', '1', '5', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '34', '校外科技竞赛活动获二等奖', '1', '4', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '35', '校外科技竞赛活动获三等奖', '1', '3', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '37', '省内科技竞赛二、三等奖', '1', '4', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '38', '参加国家级科技竞赛', '1', '8', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '39', '能坚持写科学幻想故事', '1', '6', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '40', '能制作科技小制作和小发明', '1', '2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '41', '能写科学小论文', '1', '3', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '42', '喜欢看科学书籍，写出读书笔记', '1', '2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '43', '能长期种植植物', '1', '5', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '44', '能长期观察事物的变化，并有记录', '1', '5', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '45', '能长期饲养小动物，并有观察记录', '1', '5', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '46', '实验时不认真，造假或损坏仪器', '1', '-2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '47', '上课时不听指挥，走动位置', '1', '-2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '48', '实验时不能与同学合作，干扰实验', '1', '-1', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '49', '科学知识测试成绩低于60分', '1', '-2', '0', '科学');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '50', '课堂认真听讲，积极参与课堂活动', '2', '10', '0', '英语');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '51', '每课词、句、篇过关', '2', '10', '0', '英语');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '52', '每个单元测试优良', '2', '5', '0', '英语');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '53', '按时认真完成作业、及时上交、及时订正', '2', '10', '0', '英语');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '54', '能自觉在当天补交作业', '2', '7', '0', '英语');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '55', '课前自觉进行朗读', '2', '5', '0', '英语');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '56', '课堂上能够认真倾听，积极发言', '2', '10', '0', '语文');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '57', '合作学习中，表现得积极、主动、有合作精神', '2', '10', '0', '语文');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '58', '作业按时完成，书写工整', '2', '10', '0', '语文');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '59', '积极参与语文综合实践活动', '2', '10', '0', '语文');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '60', '做好课前准备，认真诵读', '2', '10', '0', '语文');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '61', '能及时弥补错误', '2', '5', '0', '语文');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '62', '积极加入校运动队每月', '3', '10', '0', '体育');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '63', '参加校外运动队比赛获奖每次', '3', '20', '0', '体育');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '64', '课堂练习积极认真', '3', '3', '0', '体育');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '65', '早上“入室即静、入座即读”，认真早读', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '66', '中午“入室即静、入座即读”，认真午读', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '67', '上课认真听讲', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '68', '上课积极发言', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '69', '课前准备认真充分', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '70', '主动问好', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '71', '仪表仪容整洁', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '72', '热心帮助同学', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '73', '积极主动为班集体服务', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '74', '按时上学不迟到', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '75', '锻炼身体态度认真', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '76', '认真做眼保健操', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '77', '路队快静齐', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '78', '爱护环境，座位周围保洁良好', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '79', '值日认真负责', '4', '10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '80', '上课不够认真，出现插话行为', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '81', '上课不够专心，有开小差行为', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '82', '课前准备拖拉，不认真诵读', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '83', '言行不文明', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '84', '如厕不文明', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '85', '没有佩戴红领巾或队徽', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '86', '课间在楼道追跑、打闹', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '87', '带玩具、零食、饮料进校园', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '88', '过早到校', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '89', '上学迟到', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '90', '放学后没有及时离校', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '91', '指甲过长', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '92', '着装不整洁', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '93', '不认真吃早餐，有挑食表现', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '94', '没有带齐体育器材参加大课间', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '95', '不认真做眼保健操', '4', '-10', '0', '实践');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '96', '能运用知识、积极创编，将所学的音乐知识运用于实践中，能自信大胆地演绎作品（包括创作或表演）。（每周一次）', '5', '10', '0', '音乐');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '97', '音乐知识笔试成绩90分以上（每学期一次）', '5', '10', '0', '音乐');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '98', '积极参与校内的艺术活动。（每次）', '5', '5', '0', '音乐');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '99', '校内音乐或美术比赛活动获三等奖。（每学期最高奖项为准）', '5', '8', '0', '音乐');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '100', '校内音乐或美术比赛活动获二等奖。（每学期最高奖项为准）', '5', '9', '0', '音乐');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '101', '校内音乐或美术比赛活动获一等奖。（每学期最高奖项为准）', '5', '10', '0', '音乐');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '102', '音乐知识笔试成绩60分以下（每学期一次）', '5', '-10', '0', '音乐');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '103', '能运用知识、积极创编，将所学的美术知识运用于实践中，能自信大胆地演绎作品（包括创作或表演）。（每周一次）', '5', '10', '0', '美术');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '104', '美术知识笔试成绩90分以上（每学期一次）', '5', '10', '0', '美术');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '105', '积极参与校内的艺术活动。（每次）', '5', '5', '0', '美术');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '106', '校内美术比赛活动获三等奖。（每学期最高奖项为准）', '5', '8', '0', '美术');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '107', '校内美术比赛活动获二等奖。（每学期最高奖项为准）', '5', '9', '0', '美术');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '108', '校内美术比赛活动获一等奖。（每学期最高奖项为准）', '5', '10', '0', '美术');
INSERT INTO `t_evaluation_template` VALUES ('10', '1', '109', '美术知识笔试成绩60分以下（每学期一次）', '5', '-10', '0', '美术');

-- ----------------------------
-- Table structure for t_family_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `t_family_evaluation`;
CREATE TABLE `t_family_evaluation` (
  `studentId` int(11) NOT NULL,
  `ContentEvaluationId` int(11) NOT NULL,
  `EvaluationScore` int(11) NOT NULL,
  `time` time NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_family_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `userId` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` time NOT NULL,
  `ResourcesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend` (
  `Id` int(11) NOT NULL,
  `AId` int(11) NOT NULL,
  `BId` int(11) NOT NULL,
  `IdentificationId` int(11) NOT NULL,
  `AddTime` time NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_friend
-- ----------------------------

-- ----------------------------
-- Table structure for t_friend_identification
-- ----------------------------
DROP TABLE IF EXISTS `t_friend_identification`;
CREATE TABLE `t_friend_identification` (
  `IdentificationId` int(11) NOT NULL,
  `relationship` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_friend_identification
-- ----------------------------

-- ----------------------------
-- Table structure for t_fruit_information
-- ----------------------------
DROP TABLE IF EXISTS `t_fruit_information`;
CREATE TABLE `t_fruit_information` (
  `FruitType` varchar(255) NOT NULL,
  `fruitId` int(11) NOT NULL,
  `fruitName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_fruit_information
-- ----------------------------

-- ----------------------------
-- Table structure for t_grade_name
-- ----------------------------
DROP TABLE IF EXISTS `t_grade_name`;
CREATE TABLE `t_grade_name` (
  `gradeId` int(11) NOT NULL,
  `gradeName` varchar(255) NOT NULL,
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_grade_name
-- ----------------------------
INSERT INTO `t_grade_name` VALUES ('0', '三年级');
INSERT INTO `t_grade_name` VALUES ('1', '一年级');
INSERT INTO `t_grade_name` VALUES ('2', '二年级');
INSERT INTO `t_grade_name` VALUES ('4', '四年级');
INSERT INTO `t_grade_name` VALUES ('5', '五年级');
INSERT INTO `t_grade_name` VALUES ('6', '六年级');

-- ----------------------------
-- Table structure for t_growth
-- ----------------------------
DROP TABLE IF EXISTS `t_growth`;
CREATE TABLE `t_growth` (
  `fruitId` int(11) DEFAULT NULL,
  `growthStageId` int(11) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_growth
-- ----------------------------

-- ----------------------------
-- Table structure for t_growth_stage
-- ----------------------------
DROP TABLE IF EXISTS `t_growth_stage`;
CREATE TABLE `t_growth_stage` (
  `StageId` int(11) DEFAULT NULL,
  `StageName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_growth_stage
-- ----------------------------

-- ----------------------------
-- Table structure for t_honor
-- ----------------------------
DROP TABLE IF EXISTS `t_honor`;
CREATE TABLE `t_honor` (
  `periods` varchar(52) NOT NULL,
  `HonorTypeId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_honor
-- ----------------------------
INSERT INTO `t_honor` VALUES ('1', '1', '120101');
INSERT INTO `t_honor` VALUES ('4', '1', '120101');
INSERT INTO `t_honor` VALUES ('3', '1', '120101');
INSERT INTO `t_honor` VALUES ('4', '2', '120101');
INSERT INTO `t_honor` VALUES ('2', '1', '120101');
INSERT INTO `t_honor` VALUES ('3', '2', '120101');

-- ----------------------------
-- Table structure for t_honor_content
-- ----------------------------
DROP TABLE IF EXISTS `t_honor_content`;
CREATE TABLE `t_honor_content` (
  `HonoraryTitle` varchar(255) NOT NULL,
  `HonorTypeId` int(11) NOT NULL,
  PRIMARY KEY (`HonorTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_honor_content
-- ----------------------------
INSERT INTO `t_honor_content` VALUES ('每周之星', '1');
INSERT INTO `t_honor_content` VALUES ('榜样之星', '2');
INSERT INTO `t_honor_content` VALUES ('进步之星', '3');

-- ----------------------------
-- Table structure for t_integral
-- ----------------------------
DROP TABLE IF EXISTS `t_integral`;
CREATE TABLE `t_integral` (
  `StudentId` int(11) NOT NULL,
  `currencyId` int(11) NOT NULL,
  `integral` int(11) NOT NULL,
  `week` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_integral
-- ----------------------------
INSERT INTO `t_integral` VALUES ('1', '1', '20', '19');
INSERT INTO `t_integral` VALUES ('100001', '1', '10', '19');
INSERT INTO `t_integral` VALUES ('101002', '2', '5', '19');
INSERT INTO `t_integral` VALUES ('120101', '3', '-5', '19');
INSERT INTO `t_integral` VALUES ('120124', '4', '25', '19');
INSERT INTO `t_integral` VALUES ('120126', '1', '10', '19');
INSERT INTO `t_integral` VALUES ('100001', '2', '10', '19');
INSERT INTO `t_integral` VALUES ('120129', '1', '10', '19');
INSERT INTO `t_integral` VALUES ('1', '1', '20', '19');
INSERT INTO `t_integral` VALUES ('100001', '2', '5', '19');
INSERT INTO `t_integral` VALUES ('100001', '2', '5', '19');
INSERT INTO `t_integral` VALUES ('101002', '2', '5', '19');
INSERT INTO `t_integral` VALUES ('101002', '2', '5', '19');
INSERT INTO `t_integral` VALUES ('100001', '5', '-10', '19');
INSERT INTO `t_integral` VALUES ('101002', '2', '10', '19');
INSERT INTO `t_integral` VALUES ('101002', '2', '10', '19');
INSERT INTO `t_integral` VALUES ('101002', '2', '10', '19');

-- ----------------------------
-- Table structure for t_login
-- ----------------------------
DROP TABLE IF EXISTS `t_login`;
CREATE TABLE `t_login` (
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_login
-- ----------------------------

-- ----------------------------
-- Table structure for t_login_record
-- ----------------------------
DROP TABLE IF EXISTS `t_login_record`;
CREATE TABLE `t_login_record` (
  `userId` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_login_record
-- ----------------------------

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `newId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `schoolId` int(11) NOT NULL,
  `who` int(11) NOT NULL,
  `time` time NOT NULL,
  `resourceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`newId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_news
-- ----------------------------

-- ----------------------------
-- Table structure for t_news_t
-- ----------------------------
DROP TABLE IF EXISTS `t_news_t`;
CREATE TABLE `t_news_t` (
  `Id` int(11) NOT NULL,
  `transmitLegId` int(11) NOT NULL,
  `receiverId` int(11) NOT NULL,
  `MessageContent` varchar(255) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_news_t
-- ----------------------------

-- ----------------------------
-- Table structure for t_oauthinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_oauthinfo`;
CREATE TABLE `t_oauthinfo` (
  `openid` varchar(28) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `sex` int(11) DEFAULT NULL,
  `province` varchar(10) NOT NULL,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `headimgurl` text,
  `privilege` text,
  `unionid` varchar(28) NOT NULL,
  `studentid` int(11) NOT NULL,
  PRIMARY KEY (`openid`,`studentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_oauthinfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log` (
  `userId` int(11) NOT NULL,
  `time` time NOT NULL,
  `operating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_orchard_impression
-- ----------------------------
DROP TABLE IF EXISTS `t_orchard_impression`;
CREATE TABLE `t_orchard_impression` (
  `reviewersId` int(11) NOT NULL,
  `byReviewersId` int(11) NOT NULL,
  `time` time NOT NULL,
  `evaluationContent` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_orchard_impression
-- ----------------------------

-- ----------------------------
-- Table structure for t_props
-- ----------------------------
DROP TABLE IF EXISTS `t_props`;
CREATE TABLE `t_props` (
  `PropsId` int(11) NOT NULL,
  `PropsName` varchar(255) NOT NULL,
  `PropsOB` varchar(255) NOT NULL,
  `PropsEffect` varchar(255) NOT NULL,
  `PropsType` varchar(255) NOT NULL,
  `unitPrice` int(11) NOT NULL,
  PRIMARY KEY (`PropsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_props
-- ----------------------------

-- ----------------------------
-- Table structure for t_props_holding
-- ----------------------------
DROP TABLE IF EXISTS `t_props_holding`;
CREATE TABLE `t_props_holding` (
  `buyers` varchar(255) NOT NULL,
  `PropsId` int(11) NOT NULL,
  `byeTime` time NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_props_holding
-- ----------------------------

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `resourceId` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`resourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_resource
-- ----------------------------

-- ----------------------------
-- Table structure for t_role_relationships
-- ----------------------------
DROP TABLE IF EXISTS `t_role_relationships`;
CREATE TABLE `t_role_relationships` (
  `Id` int(11) DEFAULT NULL,
  `roleid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_role_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for t_roleid
-- ----------------------------
DROP TABLE IF EXISTS `t_roleid`;
CREATE TABLE `t_roleid` (
  `roleid` int(11) DEFAULT NULL,
  `rolename` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_roleid
-- ----------------------------

-- ----------------------------
-- Table structure for t_school
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `schoolId` int(11) NOT NULL,
  `province` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `schoolName` varchar(255) NOT NULL,
  PRIMARY KEY (`schoolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_school
-- ----------------------------
INSERT INTO `t_school` VALUES ('1', '广东', '珠海', '珠海香洲第一小学');
INSERT INTO `t_school` VALUES ('2', '广东', '雷州', '北京师范大学附属小学');
INSERT INTO `t_school` VALUES ('3', '广东', '珠海', '中山大学');
INSERT INTO `t_school` VALUES ('5', '广西', '桂林', '桂林大学');
INSERT INTO `t_school` VALUES ('10', '广东', '珠海', '北京师范大学珠海分校');

-- ----------------------------
-- Table structure for t_security
-- ----------------------------
DROP TABLE IF EXISTS `t_security`;
CREATE TABLE `t_security` (
  `usetId` int(11) NOT NULL,
  `problem` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_security
-- ----------------------------

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `studentId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `familyPhone` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `admissionTime` varchar(255) NOT NULL,
  `gradeId` int(11) DEFAULT NULL,
  `classId` varchar(36) DEFAULT NULL,
  `nation` varchar(255) NOT NULL,
  `placeOfOrigin` varchar(255) NOT NULL,
  `team` varchar(255) NOT NULL,
  `schoolId` int(11) NOT NULL,
  `picurl` varchar(255) NOT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('9', '程努华', '女', '2010-11-19', '珠海香洲区第一小学', '13631249316', 'cls@qq.com9', '程xx', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '珠海', '2', '10', '');
INSERT INTO `t_student` VALUES ('100001', '候老师', '男', '1990-01-02', '广东珠海', '13631249316', 'hls@qq.com', '候xx', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '珠海', '1', '10', '');
INSERT INTO `t_student` VALUES ('101001', '冯欢', '男', '2009-01-01', '珠海', '-', '-', '冯小刚', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '珠海', '1', '10', '');
INSERT INTO `t_student` VALUES ('101002', '王金星', '男', '2009-01-02', '珠海', '-', '-', '王大帝', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '珠海', '1', '10', '');
INSERT INTO `t_student` VALUES ('101003', '聂小倩', '女', '2009-01-03', '珠海', '-', '-', '聂风', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '珠海', '1', '10', '');
INSERT INTO `t_student` VALUES ('120101', '王立', '男', '1994-10-02', '广东珠海', '13825629762', '597327105@qq.com', '王来桥', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '福建', '2', '10', '');
INSERT INTO `t_student` VALUES ('120102', '冯振雄', '男', '1990-01-02', '珠海', '-', '-', '冯大大', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉', 'xx', '2', '10', '');
INSERT INTO `t_student` VALUES ('120104', '舒服杰', '男', '1993-12-11', '京华5', '13631222970', '459879815@qq.com', '罗金琼', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '珠海', '1', '10', '');
INSERT INTO `t_student` VALUES ('120105', '朱煜', '男', '1993-08-25', '广东兴宁', '13823362633', '714997369@qq.com', '朱赐忠', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '广东', '1', '10', '');
INSERT INTO `t_student` VALUES ('120106', '李云', '男', '1994-03-30', '泰国', '13631223653', '549362637@qq.com', '李焕泉', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '梅州', '1', '10', '');
INSERT INTO `t_student` VALUES ('120107', '黄小芮', '女', '1993-09-09', '广东珠海', '13356504561', '1565004760@qq.com', '黄先生', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '湛江', '1', '10', '');
INSERT INTO `t_student` VALUES ('120108', '罗思婷', '女', '1994-03-21', '广东珠海', '18988888888', '244513938@qq.com', '陈少卿', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '佛山', '3', '10', '');
INSERT INTO `t_student` VALUES ('120109', '黎嘉琪', '女', '1994-08-14', '广东珠海', '13085826920', '1227220905@qq.com', '黎--', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '珠海', '4', '10', '');
INSERT INTO `t_student` VALUES ('120110', '黎一山', '男', '1994-06-07', '北京师范大学珠海分校', '13016379683', '574399934@qq.com', '黎xx', '2013-09-10', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '广东', '2', '10', '');
INSERT INTO `t_student` VALUES ('120111', '李嘉洋', '男', '1994-09-11', '顺德', '1329338293', 'reuc@foxmail.com', '李嘉诚', '2013-09-10', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '广东', '1', '10', '');
INSERT INTO `t_student` VALUES ('120112', '郝苗', '女', '1994-10-08', '北师珠', '13930232308', '434763416@qq.com', '郝xx', '2013-09-10', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', '河北', '1', '10', '');
INSERT INTO `t_student` VALUES ('120120', '段牧天', '男', '1994-04-15', '珠海北师大', '13825637190', '', '段--', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120121', '曹智', '男', '1993-06-23', '珠海', '11111111111', ' ', '曹==', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120122', '贾市委', '男', '1994-10-20', '珠海', '-', '-', '贾++', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120123', '王方舟', '男', '1994-04-08', '珠海', '-', '-', '王--', '2012-09-01', '1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120124', '孙慧莹', '女', '1993-03-08', '珠海', '-', '-', '孙--', '2012-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120125', '蔡锦宏', '男', '1994-04-08', '珠海', '-', '-', '蔡--', '2012-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120126', '邓沛阳', '男', '1994-04-08', '珠海', '-', '-', '邓--', '2012-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120127', '甘海彬', '男', '1995-04-22', '珠海', '13267967976', '523796692@qq.com', '甘', '2013-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120128', '樊斌', '男', '1994-01-22', '珠海', '13555555555', '-', '樊', '2013-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120129', '付超', '男', '1993-07-05', '珠海', '-', '-', '付--', '2013-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120130', '黄启蒙', '男', '1994-09-07', '珠海', '13750061039', '-', '黄', '2013-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120131', '李奕锋', '男', '1994-12-16', '珠海', '-', '-', '李--', '2013-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120132', '皱金蓉', '女', '1994-05-13', '珠海', '-', '-', '皱--', '2013-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('120133', '皱鸿渐', '男', '1991-11-19', '珠海', '-', '-', '皱--', '2013-09-01', '2', '2A413598', '汉族', 'xx', '6', '10', '');
INSERT INTO `t_student` VALUES ('10020701', '蔡一桪', '男', '', '珠海', '', '1473076309@qq.com', '蔡哲', '', '2', '7', '', '', '12', '1', '');
INSERT INTO `t_student` VALUES ('10020702', '陈田翔', '男', '', '珠海', '13928017069', '', '陈亮', '', '2', '7', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10020703', '崔子熙', '男', '', '珠海', '', '', '崔继跻', '', '2', '7', '', '', '10', '1', '');
INSERT INTO `t_student` VALUES ('10020704', '方昭力', '男', '', '珠海', '', '', '方维能', '', '2', '7', '', '', '6', '1', '');
INSERT INTO `t_student` VALUES ('10020705', '郭铭', '男', '', '珠海', '', '', '郭相卫', '', '2', '7', '', '', '13', '1', '');
INSERT INTO `t_student` VALUES ('10020706', '胡景毅', '男', '', '珠海', '15875606866', '459688244@qq.com', '胡晓丹', '', '2', '7', '', '', '13', '1', '');
INSERT INTO `t_student` VALUES ('10020707', '黄泓开', '男', '', '珠海', '13539582846', 'gaizi888@suhu.com', '黄益', '', '2', '7', '', '', '11', '1', '');
INSERT INTO `t_student` VALUES ('10020708', '黄梓贤', '男', '', '珠海', '', '', '黄斌', '', '2', '7', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10020709', '黎介如', '男', '', '珠海', '', '', '黎逸康', '', '2', '7', '', '', '13', '1', '');
INSERT INTO `t_student` VALUES ('10020710', '李瑞洋', '男', '', '珠海', '', '', '李亚涛', '', '2', '7', '', '', '6', '1', '');
INSERT INTO `t_student` VALUES ('10020711', '李致成', '男', '', '珠海', '', '', '李泽峰', '', '2', '7', '', '', '12', '1', '');
INSERT INTO `t_student` VALUES ('10020712', '林俊璋', '男', '', '珠海', '', '463721728@qq.com', '林伟生', '', '2', '7', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10020713', '刘旭燊', '男', '', '珠海', '13676098046', '', '刘涛', '', '2', '7', '', '', '11', '1', '');
INSERT INTO `t_student` VALUES ('10020714', '罗文成', '男', '', '珠海', '13302534533', '', '罗容怀', '', '2', '7', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10020715', '彭俊皓', '男', '', '珠海', '', '', '彭坤', '', '2', '7', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10020716', '苏文轩', '男', '', '珠海', '13326699937', '2210609@qq.com', '苏乾山', '', '2', '7', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10020717', '唐梓翔', '男', '', '珠海', '', '', '唐国平', '', '2', '7', '', '', '10', '1', '');
INSERT INTO `t_student` VALUES ('10020718', '王昱皓', '男', '', '珠海', '', '', '王琰', '', '2', '7', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10020719', '吴奕滔', '男', '', '珠海', '', '', '高蔓玲', '', '2', '7', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10020720', '肖睿昌', '男', '', '珠海', '13326616138', '13326616138@qq.com', '肖铖', '', '2', '7', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10020721', '许荣燊', '男', '', '珠海', '13726283233', '', '许擎鑫', '', '2', '7', '', '', '9', '1', '');
INSERT INTO `t_student` VALUES ('10020722', '叶简宁', '男', '', '珠海', '', 'chao_mei@tom.com', '叶发端', '', '2', '7', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10020723', '苑皓棋', '男', '', '珠海', '18675605877', '1289818707@qq.com', '苑振海', '', '2', '7', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10020724', '张颢霖', '男', '', '珠海', '', '', '张剑文', '', '2', '7', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10020725', '章峻滔', '男', '', '珠海', '', '', '章建华', '', '2', '7', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10020726', '郑钰家', '男', '', '珠海', '', '', '郑志峰', '', '2', '7', '', '', '6', '1', '');
INSERT INTO `t_student` VALUES ('10020727', '周晋霆', '男', '', '珠海', '13543886177', '', '周伟雄', '', '2', '7', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10020728', '陈春谷', '女', '', '珠海', '13143137888', '', '陈志华', '', '2', '7', '', '', '12', '1', '');
INSERT INTO `t_student` VALUES ('10020729', '陈炜玥', '女', '', '珠海', '13702317262', '', '陈德冠', '', '2', '7', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10020730', '董依洋', '女', '', '珠海', '13750089008', '68861162@QQ.COM', '董海光', '', '2', '7', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10020731', '耿语声', '女', '', '珠海', '', '', '王艳奇', '', '2', '7', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10020732', '何玥璇', '女', '', '珠海', '13200000000', '380469443@qq.com', '何秀君', '', '2', '7', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10020733', '黄玥菲', '女', '', '珠海', '', '', '黄泽堂', '', '2', '7', '', '', '10', '1', '');
INSERT INTO `t_student` VALUES ('10020734', '李家宜', '女', '', '珠海', '13928050765', '13928050765@139.com', '李腾晖', '', '2', '7', '', '', '9', '1', '');
INSERT INTO `t_student` VALUES ('10020735', '李悦帆', '女', '', '珠海', '', '', '李冬林', '', '2', '7', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10020736', '梁钰祺', '女', '', '珠海', '', '', '梁桂明', '', '2', '7', '', '', '9', '1', '');
INSERT INTO `t_student` VALUES ('10020737', '刘畅', '女', '', '珠海', '', '123@qq.com', '罗雪峰', '', '2', '7', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10020738', '刘籽灵', '女', '', '珠海', '', '', '刘玉杞', '', '2', '7', '', '', '11', '1', '');
INSERT INTO `t_student` VALUES ('10020739', '孟飞扬', '女', '', '珠海', '', '', '何满凤', '', '2', '7', '', '', '12', '1', '');
INSERT INTO `t_student` VALUES ('10020740', '秦乐颖', '女', '', '珠海', '', '', '秦常伟', '', '2', '7', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10020741', '石宸畅', '女', '', '珠海', '', '59876525@qq.om', '石文旺', '', '2', '7', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10020742', '王曼婷', '女', '', '珠海', '', '', '王子恒', '', '2', '7', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10020743', '吴星欢', '女', '', '珠海', '', '', '吴和明', '', '2', '7', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10020744', '徐圣曦', '女', '', '珠海', '18926998304', 'xkalong@163.com', '徐小贤', '', '2', '7', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10020745', '杨舒然', '女', '', '珠海', '13005770000', '648620592@qq.com', '杨锦维', '', '2', '7', '', '', '6', '1', '');
INSERT INTO `t_student` VALUES ('10020746', '曾靖芝', '女', '', '珠海', '', '', '曾维磊', '', '2', '7', '', '', '10', '1', '');
INSERT INTO `t_student` VALUES ('10020747', '张粤亚', '女', '', '珠海', '', '', '张予矛', '', '2', '7', '', '', '9', '1', '');
INSERT INTO `t_student` VALUES ('10020748', '周蔓', '女', '', '珠海', '13672775858', '', '周维利', '', '2', '7', '', '', '11', '1', '');
INSERT INTO `t_student` VALUES ('10020749', '庄佩瑶', '女', '', '珠海', '13631286501', '844310140@qq.com', '庄才银', '', '2', '7', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10020750', '邹贻昭', '女', '', '珠海', '13600363998', '7662553@qq.com', '邹祖军', '', '2', '7', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10020751', '陈秋彤', '女', '', '珠海', '', '', '陈民', '', '2', '7', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10050801', '蔡招满', '男', '', '珠海', '', '', '蔡春华', '', '5', '8', '', '', '6', '1', '');
INSERT INTO `t_student` VALUES ('10050802', '陈璞', '男', '', '珠海', '13825611169', '', '陈北', '', '5', '8', '', '', '6', '1', '');
INSERT INTO `t_student` VALUES ('10050803', '陈子轩', '男', '', '珠海', '', '', '陈锋', '', '5', '8', '', '', '6', '1', '');
INSERT INTO `t_student` VALUES ('10050804', '董华廷', '男', '', '珠海', '', '', '董云霓', '', '5', '8', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10050805', '冯振熙', '男', '', '珠海', '13527211602', '', '冯国平', '', '5', '8', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10050806', '何泓志', '男', '', '珠海', '13676000883', '', '何曜成', '', '5', '8', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10050807', '黄玮彬', '男', '', '珠海', '13326623680', '', '黄赞权', '', '5', '8', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10050808', '姜立宁', '男', '', '珠海', '', '', '姜公信', '', '5', '8', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10050809', '李弘基', '男', '', '珠海', '', '', '李鹏飞', '', '5', '8', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10050810', '梁晋霆', '男', '', '珠海', '13823040768', '', '梁伟森', '', '5', '8', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10050811', '廖晨宇小', '男', '', '珠海', '13802673436', '', '雷颖辉', '', '5', '8', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10050812', '刘浩睿', '男', '', '珠海', '', '', '刘杰', '', '5', '8', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10050813', '卢俊亨', '男', '', '珠海', '', '', '卢仕华', '', '5', '8', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10050814', '罗浩', '男', '', '珠海', '15976960819', '', '罗伟建', '', '5', '8', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10050815', '彭长健', '男', '', '珠海', '', '732022736@qq.com', '彭吉兴', '', '5', '8', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10050816', '邵烨', '男', '', '珠海', '', '', '邵斌', '', '5', '8', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10050817', '谭逸轩', '男', '', '珠海', '', '', '谭国成', '', '5', '8', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10050818', '王弘翰', '男', '', '珠海', '13532282232', 'ylx541129292@qq.com', '王燕军', '', '5', '8', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10050819', '吴优', '男', '', '珠海', '', '', '吴赟', '', '5', '8', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10050820', '肖皓扬', '男', '', '珠海', '13823080027', '', '肖国荣', '', '5', '8', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10050821', '许楷明', '男', '', '珠海', '', '', '许伟雄', '', '5', '8', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10050822', '杨天鸣', '男', '', '珠海', '13392978689', '791905304@qq.com', '马海宏', '', '5', '8', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10050823', '叶韦皓', '男', '', '珠海', '18666910268', '', '叶秀权', '', '5', '8', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10050824', '曾润晖', '男', '', '珠海', '', '', '曾庆兆', '', '5', '8', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10050825', '许万辉', '男', '', '珠海', '13709685195', '', '许志军', '', '5', '8', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10050826', '郑铭淳', '男', '', '珠海', '13326615163', '', '郑东强', '', '5', '8', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10050827', '周晋弘', '男', '', '珠海', '13536504200', '', '周昌豪', '', '5', '8', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10050828', '蔡未来', '女', '', '珠海', '13532215329', '', '蔡春华', '', '5', '8', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10050829', '陈思铭', '女', '', '珠海', '13697785455', '', '陈可', '', '5', '8', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10050830', '邓芷滢', '女', '', '珠海', '', '', '姚远平', '', '5', '8', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10050831', '韩实', '女', '', '珠海', '13411452526', '645900795@qq.com', '韩宗英', '', '5', '8', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10050832', '黄宝仪', '女', '', '珠海', '', '', '黄卓辉', '', '5', '8', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10050833', '黄正欣', '女', '', '珠海', '', '', '黄怀平', '', '5', '8', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10050834', '蓝天蔚', '女', '', '珠海', '', '', '蓝钦华', '', '5', '8', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10050835', '李小川', '女', '', '珠海', '', '', '李长刚', '', '5', '8', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10050836', '林洛冰', '女', '', '珠海', '13824136133', '22721905@QQqq.com', '林焕辉', '', '5', '8', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10050837', '刘明慧', '女', '', '珠海', '', '', '刘羌庆', '', '5', '8', '', '', '6', '1', '');
INSERT INTO `t_student` VALUES ('10050839', '罗乐珩', '女', '', '珠海', '13527299209', '26476515@qq.com', '罗夏光', '', '5', '8', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10050840', '彭楚悦', '女', '', '珠海', '13802671567', '', '彭东亮', '', '5', '8', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10050841', '谭惠心', '女', '', '珠海', '', '', '谭辉健', '', '5', '8', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10050842', '王嘉颖', '女', '', '珠海', '13825687133', '', '马志钊', '', '5', '8', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10050843', '韦宇', '女', '', '珠海', '', '', '韦力', '', '5', '8', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10050844', '吴易纾', '女', '', '珠海', '', '', '吴锐', '', '5', '8', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10050845', '熊嘉怡', '女', '', '珠海', '', '', '谭国辉', '', '5', '8', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10050846', '杨晴', '女', '', '珠海', '', '', '杨震洋', '', '5', '8', '', '', '2', '1', '');
INSERT INTO `t_student` VALUES ('10050847', '余希敏', '女', '', '珠海', '13923396933', '', '余朝晖', '', '5', '8', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10050848', '张家盈', '女', '', '珠海', '', '', '张恩暖', '', '5', '8', '', '', '3', '1', '');
INSERT INTO `t_student` VALUES ('10050849', '赵翌涵', '女', '', '珠海', '', '', '赵景', '', '5', '8', '', '', '5', '1', '');
INSERT INTO `t_student` VALUES ('10050850', '郑榆婷', '女', '', '珠海', '', '', '郑加强', '', '5', '8', '', '', '8', '1', '');
INSERT INTO `t_student` VALUES ('10050851', '周晓楠', '女', '', '珠海', '', '', '周国雄', '', '5', '8', '', '', '7', '1', '');
INSERT INTO `t_student` VALUES ('10050852', '祝苈靖', '女', '', '珠海', '', '', '刘琼芳', '', '5', '8', '', '', '4', '1', '');
INSERT INTO `t_student` VALUES ('10050853', '何雪雯', '女', '', '珠海', '', '', '何家富', '', '5', '8', '', '', '1', '1', '');
INSERT INTO `t_student` VALUES ('10050854', '陈怡伽', '女', '', '珠海', '', '', '陈泽彬', '', '5', '8', '', '', '6', '1', '');
INSERT INTO `t_student` VALUES ('10050855', '廖晨宇大', '男', '', '珠海', '', '', '张冰梅', '', '5', '8', '', '', '6', '1', '');

-- ----------------------------
-- Table structure for t_student_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `t_student_evaluation`;
CREATE TABLE `t_student_evaluation` (
  `studentId` int(11) NOT NULL,
  `EvaluationObject` varchar(255) NOT NULL,
  `ContentEvaluationId` int(11) NOT NULL,
  `EvaluationScore` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_student_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for t_students_attend_class
-- ----------------------------
DROP TABLE IF EXISTS `t_students_attend_class`;
CREATE TABLE `t_students_attend_class` (
  `studentId` int(11) NOT NULL,
  `classId` varchar(37) NOT NULL,
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_students_attend_class
-- ----------------------------
INSERT INTO `t_students_attend_class` VALUES ('1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51');

-- ----------------------------
-- Table structure for t_teach
-- ----------------------------
DROP TABLE IF EXISTS `t_teach`;
CREATE TABLE `t_teach` (
  `techerId` int(11) NOT NULL,
  `classId` varchar(37) NOT NULL,
  `masterId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_teach
-- ----------------------------
INSERT INTO `t_teach` VALUES ('2', '2A413598-F3DB-40B3-BD46-FEB9395BDE5', '0');
INSERT INTO `t_teach` VALUES ('1', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1');
INSERT INTO `t_teach` VALUES ('3', '2A413598-F3DB-40B3-BD46-FEB9395BDE', '0');
INSERT INTO `t_teach` VALUES ('1', '2A413598', '0');

-- ----------------------------
-- Table structure for t_teacher_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher_evaluation`;
CREATE TABLE `t_teacher_evaluation` (
  `teacherId` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `ContentEvaluationId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `EvaluationScore` int(11) NOT NULL,
  `time` time NOT NULL,
  `classId` varchar(37) NOT NULL,
  `groupId` int(11) NOT NULL,
  `EvaluationContent` varchar(255) NOT NULL,
  PRIMARY KEY (`ContentEvaluationId`,`StudentId`,`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_teacher_evaluation
-- ----------------------------
INSERT INTO `t_teacher_evaluation` VALUES ('1', '100001', '52', '2', '5', '11:53:18', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '每个单元测试优良');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '101002', '52', '2', '5', '11:53:18', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '每个单元测试优良');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '100001', '55', '2', '5', '11:53:18', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '课前自觉进行朗读');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '101002', '55', '2', '5', '11:53:18', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '课前自觉进行朗读');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '100001', '56', '2', '10', '11:30:28', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '课堂上能够认真倾听，积极发言');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '101002', '56', '2', '10', '11:30:28', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '课堂上能够认真倾听，积极发言');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '100001', '57', '2', '10', '11:30:28', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '合作学习中，表现得积极、主动、有合作精神');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '101002', '57', '2', '10', '11:30:28', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '合作学习中，表现得积极、主动、有合作精神');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '101002', '58', '2', '10', '11:54:53', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '作业按时完成，书写工整');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '101002', '59', '2', '10', '11:54:53', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '积极参与语文综合实践活动');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '101002', '60', '2', '10', '11:54:53', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '做好课前准备，认真诵读');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '100001', '61', '2', '5', '11:30:16', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '能及时弥补错误');
INSERT INTO `t_teacher_evaluation` VALUES ('1', '100001', '102', '5', '-10', '11:53:49', '2A413598-F3DB-40B3-BD46-FEB9395BDE51', '1', '音乐知识笔试成绩60分以下（每学期一次）');

-- ----------------------------
-- Table structure for t_teachers
-- ----------------------------
DROP TABLE IF EXISTS `t_teachers`;
CREATE TABLE `t_teachers` (
  `schoolId` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `teacherName` varchar(255) NOT NULL,
  `teacherPhone` varchar(20) NOT NULL,
  `offer` varchar(255) NOT NULL,
  `jobTitle` varchar(255) NOT NULL,
  `password` int(11) NOT NULL,
  PRIMARY KEY (`schoolId`,`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_teachers
-- ----------------------------
INSERT INTO `t_teachers` VALUES ('1', '9', '颜婧', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '10', '冯志彬', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '11', '梁冬梅', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '12', '石志异', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '13', '任晓林', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '14', '葛璠', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '15', '邓莉', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '16', '张友斌', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '17', '朱岗波', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '18', '蓝思宇', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '19', '张萍', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '20', '雷颖辉', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '21', '钟建梅', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '22', '廖声标', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '23', '吴旭健', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('1', '24', '罗琳', '', '', '', '123456');
INSERT INTO `t_teachers` VALUES ('2', '5', '孙玮', '13366336633', '图书馆', '高级教师', '123456');
INSERT INTO `t_teachers` VALUES ('2', '6', '许跃颖', '13633663366', '图书馆', '教师', '123456');
INSERT INTO `t_teachers` VALUES ('10', '1', '程努华', '13631289351', '图书馆', '高级教师', '123456');
INSERT INTO `t_teachers` VALUES ('10', '2', '侯老师', '13631249316', '图书馆', '高级教师', '123456');
INSERT INTO `t_teachers` VALUES ('10', '3', '侯老师', '13631289351', '图书馆', '高级教师', '123456');
INSERT INTO `t_teachers` VALUES ('10', '4', '糕富帅', '13366336633', '图书馆', '初级教师', '123456');
INSERT INTO `t_teachers` VALUES ('10', '8', '李奕锋测试', '13631232090', '京四', '学生', '123456');
