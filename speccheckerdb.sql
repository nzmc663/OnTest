  `id` varchar(64) NOT NULL COMMENT '主键',
  `title` varchar(64) DEFAULT NULL COMMENT '事件标题',
  `starttime` datetime DEFAULT NULL COMMENT '事件开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '事件结束时间',
  `allday` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT '是否为全天时间',
  `color` varchar(64) CHARACTER SET latin1 DEFAULT NULL COMMENT '时间的背景色',
  `userid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历';

-- ----------------------------
-- Records of calendar
-- ----------------------------

-- ----------------------------
-- Table structure for group_user
-- ----------------------------
DROP TABLE IF EXISTS `group_user`;
CREATE TABLE `group_user` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户',
  `group_id` varchar(64) DEFAULT NULL COMMENT '群组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='群组成员';

-- ----------------------------
-- Records of group_user
-- ----------------------------

-- ----------------------------
-- Table structure for iim_chat_history
-- ----------------------------
DROP TABLE IF EXISTS `iim_chat_history`;
CREATE TABLE `iim_chat_history` (
  `id` varchar(64) NOT NULL,
  `sender` varchar(64) DEFAULT NULL,
  `receiver` varchar(64) DEFAULT NULL,
  `msg` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of iim_chat_history
-- ----------------------------

-- ----------------------------
-- Table structure for iim_mail
-- ----------------------------
DROP TABLE IF EXISTS `iim_mail`;
CREATE TABLE `iim_mail` (
  `id` varchar(64) NOT NULL,
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `overview` varchar(128) DEFAULT NULL COMMENT '内容概要',
  `content` longblob COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件';

-- ----------------------------
-- Records of iim_mail
-- ----------------------------

-- ----------------------------
-- Table structure for iim_mail_box
-- ----------------------------
DROP TABLE IF EXISTS `iim_mail_box`;
CREATE TABLE `iim_mail_box` (
  `id` varchar(64) NOT NULL,
  `readstatus` varchar(45) DEFAULT NULL COMMENT '状态 0 未读 1 已读',
  `senderId` varchar(64) DEFAULT NULL COMMENT '发件人',
  `receiverId` varchar(6400) DEFAULT NULL COMMENT '收件人',
  `sendtime` datetime DEFAULT NULL COMMENT '发送时间',
  `mailid` varchar(64) DEFAULT NULL COMMENT '邮件外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收件箱';

-- ----------------------------
-- Records of iim_mail_box
-- ----------------------------

-- ----------------------------
-- Table structure for iim_mail_compose
-- ----------------------------
DROP TABLE IF EXISTS `iim_mail_compose`;
CREATE TABLE `iim_mail_compose` (
  `id` varchar(64) NOT NULL,
  `status` varchar(45) DEFAULT NULL COMMENT '状态 0 草稿 1 已发送',
  `readstatus` varchar(45) DEFAULT NULL COMMENT '状态 0 未读 1 已读',
  `senderId` varchar(64) DEFAULT NULL COMMENT '发送者',
  `receiverId` varchar(6400) DEFAULT NULL COMMENT '接收者',
  `sendtime` datetime DEFAULT NULL COMMENT '发送时间',
  `mailId` varchar(64) DEFAULT NULL COMMENT '邮件id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发件箱 草稿箱';

-- ----------------------------
-- Records of iim_mail_compose
-- ----------------------------

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `oa_leave`;
CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假流程表';

-- ----------------------------
-- Records of oa_leave
-- ----------------------------

-- ----------------------------
-- Table structure for oa_notify
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify`;
CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) DEFAULT NULL COMMENT '附件',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告';

-- ----------------------------
-- Records of oa_notify
-- ----------------------------

-- ----------------------------
-- Table structure for oa_notify_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_notify_record`;
CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` datetime DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告发送记录';

-- ----------------------------
-- Records of oa_notify_record
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('schedulerFactoryBean', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('schedulerFactoryBean', 'DESKTOP-R93GQC61505980596861', '1506049253742', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for saci_analysis_set
-- ----------------------------
DROP TABLE IF EXISTS `saci_analysis_set`;
CREATE TABLE `saci_analysis_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instancesid` int(11) DEFAULT NULL COMMENT '工具实例ID',
  `configType` varchar(1) DEFAULT NULL COMMENT '配置类型（0：分析配置 1：编译配置）',
  `compiler` varchar(255) DEFAULT NULL COMMENT '编译器',
  `checkerset` varchar(255) DEFAULT NULL COMMENT '规则集',
  `rerun_user_id` varchar(64) DEFAULT NULL COMMENT '重新执行用户ID',
  `status` varchar(1) DEFAULT NULL COMMENT '执行状态（0.未执行；1.已执行）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='分析配置';

-- ----------------------------
-- Records of saci_analysis_set
-- ----------------------------

-- ----------------------------
-- Table structure for saci_category
-- ----------------------------
DROP TABLE IF EXISTS `saci_category`;
CREATE TABLE `saci_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分析结果Id',
  `realId` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '类型名',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `projectAnalysisId` varchar(255) DEFAULT NULL COMMENT '分析Id',
  `compiler_name` varchar(100) DEFAULT NULL COMMENT '编译器名称',
  `ruleset_name` varchar(100) DEFAULT NULL COMMENT '规则集名称',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '父级编号',
  `parent_ids` varchar(255) DEFAULT NULL COMMENT '所有父级编号',
  `sort` varchar(64) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3085 DEFAULT CHARSET=utf8 COMMENT='项目类型';

-- ----------------------------
-- Records of saci_category
-- ----------------------------
INSERT INTO `saci_category` VALUES ('3082', '1.1', '1.1', null, null, null, '2017-12-06 14:47:46', '96', null, null, '0', null, 'test1', '0,XX-1,test1,', null);
INSERT INTO `saci_category` VALUES ('3083', 'test1', 'test1', null, null, null, '2017-12-06 14:47:46', '96', null, null, '', null, 'XX-1', '0,XX-1,', null);
INSERT INTO `saci_category` VALUES ('3084', 'XX-1', 'XX-1', null, null, null, '2017-12-06 14:47:46', '96', null, null, '', null, '0', '0,', null);

-- ----------------------------
-- Table structure for saci_checker
-- ----------------------------
DROP TABLE IF EXISTS `saci_checker`;
CREATE TABLE `saci_checker` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则集Id',
  `name` varchar(100) DEFAULT NULL COMMENT '规则名称',
  `description` varchar(255) DEFAULT NULL COMMENT '规则描述',
  `priority` varchar(1) DEFAULT NULL COMMENT '优先级',
  `checked` varchar(1) DEFAULT NULL COMMENT '表示选择的规则（0.未选择；1.选择）',
  `delflag` varchar(1) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `category` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL COMMENT '错误信息',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `checkersetId` int(11) NOT NULL COMMENT 'checkerset ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1140 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of saci_checker
-- ----------------------------
INSERT INTO `saci_checker` VALUES ('574', 'DeclNoDefine', '1.2 不能有对未定义行为或未指定行为的依赖性', '1', null, null, null, '环境', '{0}声明了但未定义', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('575', 'EmbeddedASMRule', '2.1 汇编语言应该被封装并隔离', '1', null, null, null, '语言扩展', '汇编中使用了局部变量{0}', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('576', 'NotUseSingleComment', '2.2 源代码应该使用 /*…*/ 类型的注释', '1', null, null, null, '语言扩展', ' 尽量不使用单行注释{0}', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('577', 'NoRecursiveComments', '2.3 字符序列 /* 不应出现在注释中', '1', null, null, null, '语言扩展', '禁止使用嵌套的注释', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('578', 'DoNotUseCommentWithoutAnalysis', '2.4 代码段不应被“注释掉”', '3', null, null, null, '语言扩展', '使用了不加以分析的注释', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('579', 'CarefulUsePragma', '3.4 所有#pragma 指令的使用应该文档化并给出良好解释', '1', null, null, null, '文档', '在第{0}行单独使用了#pragma,应谨慎使用', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('580', 'NotUseNoNameBitFieldInStruct', '3.5 实现定义（implementation-defined）的行为和位域集合应当文档化。\n		', '1', null, null, null, '文档', '应避免在结构体中使用无名位域', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('581', 'DoNotUseTrigraphSequences', '4.2 不能使用三字母词', '1', null, null, null, '字符集', '禁止三字母词{0}的使用', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('582', 'LocalGlobalNamingRule', '5.2 具有内部作用域的标识符不应使用与具有外部作用域的标识符相同的名称，这会隐藏了外部标识符\n		', '1', null, null, null, '标识符', '局部变量{0}与全局变量{1}同名', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('583', 'VarAndTypedefNameSame', '5.3 typedef的名字应当是唯一的标识符', '3', null, null, null, '标识符', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('584', 'FormalAndTypedefRule', '5.7 不能重用标识符名字', '3', null, null, null, '标识符', '参数{0}与类型或标识符{1}同名', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('585', 'OctalNumberRule', '7.1 不应使用八进制常量（零除外）和八进制转义字符', '1', null, null, null, '常量', '使用了八进制数{0}', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('586', 'UseFuncWithoutDeclRule', '8.2 不论何时声明或定义了一个对象或函数，它的类型都应显式声明', '1', null, null, null, '声明与定义', '函数{0}必须有声明', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('587', 'FuncParaTypeRule', '8.3 函数的每个参数类型在声明和定义中必须是等同的，函数的返回类型也该是等同的', '1', null, null, null, '声明与定义', '函数{0}{1}，不一致 ', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('588', 'NoBoundArray', '8.12 当一个数组声明为具有外部链接，它的大小应该显式声明或者通过初始化进行隐式定义', '1', null, null, null, '声明与定义', '数组{0}没有边界限定', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('589', 'UninitializedValuesRule1', '9.1 所有自动变量在使用前都应被赋值', '1', null, null, null, '初始化', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('590', 'ArrayInitComplete', '9.2 应该使用大括号以指示和匹配数组和结构的非零初始化构造', '1', null, null, null, '初始化', '数组的初始化必须完整', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('591', 'EnumMemberInitComplete', '9.3 在枚举列表中，“=”不能显式用于除首元素之外的元素上，除非所有的元素都是显式初始化的\n		', '1', null, null, null, '初始化', ' 枚举元素初始化必须完整', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('592', 'IntAssignNeedCastRule', '10.1 整型表达式的值不应隐式转换为不同的基本类型', '1', null, null, null, '数值类型转换', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('593', 'DoubleAssignToFloatCareful', '10.2 浮点类型表达式的值不应隐式转换为不同的类型', '1', null, null, null, '数值类型转换', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('594', 'NoImplictConvForSmallInt', '10.5 如果位运算符 ~ ,<<,>> 应用在基本类型为unsigned char\n			或unsigned short 的操作数，结果应该立即强制转换为操作数的基本类型', '1', null, null, null, '数值类型转换', '表达式{0}的参与位运算后发生了隐式类型转换，应进行强制类型转换', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('595', 'NONPtrAndPterTypeCast', '11.3 不应在指针类型和整型之间进行强制转换', '3', null, null, null, '指针类型转换', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('596', 'NoCastBetweenDiffPType', '11.4 不应在某类型对象指针和其他不同类型对象指针之间进行强制转换', '3', null, null, null, '指针类型转换', '指针类型{0}的{1}被强制转换为另一指针类型{2}', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('597', 'NotSizeofAssignType', '12.3 不能在具有副作用的表达式中使用sizeof 运算符', '1', null, null, null, '表达式', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('598', 'CastToBastTypeWhenBitComputeWithUnsignedCharOrInt', '12.7 不能在具有副作用的表达式中使用sizeof 运算符', '1', null, null, null, '表达式', '运算符 {0}应用在基本类型为unsigned {1}的操作数{2},结果应该强制转换为unsigned {1}', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('599', 'CarefulToUseComma', '12.10 不要使用逗号运算符', '1', null, null, null, '表达式', '尽量避免使用逗号操作符', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('600', 'NoMixedUseIncAndDec', '12.13 在一个表达式中，自增（++）和自减（- -）运算符不应同其他运算符混合在一起\n		', '3', null, null, null, '表达式', '自增（++）和自减（--）运算符不应同其他运算符混合在一起', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('601', 'EqualMistakenAssign', '13.1 赋值运算符不能使用在产生布尔值的表达式上', '3', null, null, null, '控制语句表达式', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('602', 'NoDifferentFloatEqualityComparing', '13.3 浮点表达式不能做相等或不等的检测', '3', null, null, null, '控制语句表达式', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('603', 'LoopVarType', '13.4 for 语句的控制表达式不能包含任何浮点类型的对象', '1', null, null, null, '控制语句表达式', '循环变量{0}类型是{1}，不合适', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('604', 'NotChangeOtherLoopVarExceptCounter', '13.6 除了循环计数以外的循环控制变量不应在循环条件表达式 或循环变量增值表达式中修改\n		', '1', null, null, null, '控制语句表达式', '非循环计数的循环控制变量{0}不能在循环条件表达式 或循环变量增值表达式中修改', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('605', 'NoUnreachedStatement', '14.1 禁止不可达语句', '1', null, null, null, '控制流', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('606', 'DoNotUseGOTO', '14.4 禁止使用goto语句', '1', null, null, null, '控制流', '禁止使用goto语句', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('607', 'NotUseContinue', '14.5 尽量避免使用continue', '1', null, null, null, '控制流', '尽量避免使用continue', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('608', 'NotUseEmptySwitch', '14.8 禁止使用空switch语句', '1', null, null, null, '控制流', 'switch语句不能为空', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('609', 'NoStatementInElseRule', '14.9 if（表达式） 结构应该跟随有复合语句,else关键字应该跟随有复合语句或者另外的 if语句\n		', '1', null, null, null, '控制流', 'else分支无执行语句', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('610', 'NoElse', '14.10 所有的 if else if 结构应该由 else子句结束', '1', null, null, null, '控制流', 'if elseif分支语句末尾无else分支', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('611', 'NoBreakInCase', '15.2 无条件的 break语句应该终止每个非空的switch子句', '1', null, null, null, 'Switch语句', 'case语句不是由break终止', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('612', 'SwitchNoDefaultAddition', '15.3 switch语句的最后子句应该是 default子句', '1', null, null, null, 'Switch语句', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('613', 'NoFuncParaVarargsRule', '16.1 函数定义不得带有可变数量的参数', '1', null, null, null, '函数', '函数{0}的参数表中禁止使用省略号', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('614', 'HeadFileSurroundWithDefine', '16.2 函数不能调用自身，不管是直接还是间接的', '1', null, null, null, '函数', '头文件{0}未使用预处理指令保护{1}', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('615', 'FuncDeclAndDefParaIdSame', '16.3 在函数的原型声明中应该为所有参数给出标识符', '1', null, null, null, '函数', '函数{0}的定义和声明中参数标识符不一致', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('616', 'FuncDeclAndDefParaIdSame', '16.4 函数的声明和定义中使用的标识符应该一致', '1', null, null, null, '函数', '函数{0}的定义和声明中参数标识符不一致', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('617', 'NoEmptyFuncParaRule', '16.5 不带参数的函数应当声明为具有 void类型的参数', '1', null, null, null, '函数', '函数{0}的参数表为空', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('618', 'FuncParaTypeRule', '16.6 传递给一个函数的参数应该与声明的参数匹配', '1', null, null, null, '函数', '函数{0}{1}，不一致 ', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('619', 'VoidFuncNoRet', '16.8 带有void返回类型的函数其所有退出路径都应具有显式的带表达式的return语句\n		', '1', null, null, null, '函数使用规则', 'void类型的函数中return语句带返回值', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('620', 'FuncPointerUseRule', '16.9 函数标识符的使用只能或者加前缀&，或者使用括起来的参数列表，列表可以为空\n		', '1', null, null, null, '函数使用规则', null, null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('621', 'PointerInAlgebraOpera', '17.1 指针的数学运算只能用在指向数组或数组元素的指针上', '1', null, null, null, '指针和数组', '指针{0}进行了代数运算', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('622', 'MoreThan2LPointer', '17.5 对象声明所包含的间接指针不得多于 2 级', '3', null, null, null, '指针和数组', '指针{0}超过两级', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('623', 'CarefulToUseUnion', '18.4 不要使用联合', '3', null, null, null, '结构与联合规则', '谨慎使用联合的声明', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('624', 'NotUseAbsolutePathInInclude', '19.1 文件中的#include 语句之前只能是其他预处理指令或注释', '3', null, null, null, '预处理规则', '头文件{0}为绝对路径，应予以禁止', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('625', 'MacroInParen', '19.10 在定义函数宏时，每个参数实例都应该以小括号括起来，除非它们做为#或##的操作数\n		', '1', null, null, null, '预处理规则', '宏体{0}未用括号括起来', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('626', 'HeadFileSurroundWithDefine', '19.15 应该采取防范措施以避免一个头文件的内容被包含两次', '1', null, null, null, '预处理规则', '头文件{0}未使用预处理指令保护{1}', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('627', 'IfEndIf', '19.17 禁止在同一文件中有#if没有#endif', '1', null, null, null, '标准库', '禁止在同一文件中有#if没有#endif', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('628', 'RedefineDiffType', '20.1 标准库中保留的标识符、宏和函数不能被定义、重定义或取消定义', '1', null, null, null, '标准库', '{0}已经在{1}定义过,类型不相同', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('629', 'NoDynamicMemAlloc', '20.4 不能使用动态堆的内存分配', '1', null, null, null, '标准库', '不能使用标准库提供的内存分配/释放函数{0}', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('630', 'NotUseLongjmp', '20.7 尽量避免使用setjmp和longjmp', '1', null, null, null, '标准库', '使用了{0}', null, '2017-10-24 14:14:38', null, null, '7');
INSERT INTO `saci_checker` VALUES ('631', 'NotDefineWithKeywordInMacro', '5.1.1.1 禁止通过宏定义改变关键字和基本类型含义', '1', null, null, null, '声明定义', '禁止使用宏重新定义保留字（关键字）{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('632', 'DoNotRedefineResWord', '5.1.1.2 禁止将其他标识宏定义为关键字和基本类型', '1', null, null, null, '声明定义', '重新定义保留字{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('633', 'TypedefRedefinition', '5.1.1.3 用typedef自定义的类型禁止被重新定义', '1', null, null, null, '声明定义', '重新定义typedef自定义的类型名{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('634', 'DoNotDefineKeywords', '5.1.1.4 禁止重新定义使用C或C++关键字', '1', null, null, null, '声明定义', '重新定义C/C++关键字{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('635', 'MultiDefineRule', '5.1.1.5 禁止#define被重复定义', '1', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('636', 'DefineAndUndefTogether', '5.1.1.6 函数中的#define和#undef必须配对使用', '1', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('637', 'MacroAndParaInParen', '5.1.1.7 以函数形式定义的宏，参数和结果必须用括号括起来', '1', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('638', 'CompositeDefineHasName', '5.1.1.8 结构、联合、枚举的定义中必须定义标识名', '1', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('639', 'NotEmptyScopeInStructDef', '5.1.1.9 结构体定义中禁止含有无名结构体', '1', null, null, null, '声明定义', '结构体在第{0}行的定义中含有空域', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('640', 'NoLessThan2BitsForSigned', '5.1.1.10 位定义的有符号整型变量位长必须大于1', '1', null, null, null, '声明定义', '有符号类型{0}的位长度为{1}，小于两位', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('641', 'BitDefForInteger', '5.1.1.11 位定义的整数型变量必须明确定义时有符号还是无符号的', '1', null, null, null, '声明定义', '位的定义是{0},不是有符号或无符号的整数', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('642', 'BitFieldDefineRule', '5.1.1.12 位定义的变量必须是同长度的类型且定义位禁止跨越类型的长度', '1', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('643', 'UnCompletedParaDeclRule', '5.1.1.13 函数声明中必须对参数类型进行声明，并带有变量名', '1', null, null, null, '声明定义', '形式参数的声明不完整', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('644', 'FuncDeclAndDefineSame', '5.1.1.14 函数声明必须与函数原型一致', '1', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('645', 'FormalArgReqTypeDecl', '5.1.1.15 函数中的参数必须使用类型声明', '1', null, null, null, '声明定义', '参数{0}没有类型声明', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('646', 'ExternVarDeclAndDefTypeSame', '5.1.1.16 外部声明的变量，类型必须与定义一致', '1', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('647', 'DoNotUseExtDeclInFunc', '5.1.1.17 禁止在函数体内使用外部声明', '1', null, null, null, '声明定义', ' 禁止在函数体内使用外部声明', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('648', 'NoBoundArray', '5.1.1.18 数组定义禁止没有显式的边界限定', '1', null, null, null, '声明定义', '数组{0}没有边界限定', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('649', 'NoExternVarInit', '5.1.1.19 禁止使用extern声明对变量初始化', '1', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('650', 'CharTypeDefine', '5.1.1.20 用于数值计算的字符型变量必须明确定义时有符号的还是无符号的', '1', null, null, null, '声明定义', '字符类型{0}没有标明有符号还是无符号', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('651', 'NotUseAbsolutePathInInclude', '5.1.1.21 禁止在#include语句中使用绝对路径', '1', null, null, null, '声明定义', '头文件{0}为绝对路径，应予以禁止', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('652', 'HeadFileSurroundWithDefine', '5.1.1.22 禁止头文件重复包含', '1', null, null, null, '声明定义', '头文件{0}未使用预处理指令保护{1}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('653', 'NoEmptyFuncParaRule', '5.1.1.23 函数参数表为空时，必须使用void明确说明', '1', null, null, null, '声明定义', '函数{0}的参数表为空', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('654', 'TypedefBasicType', '5.1.2.1 建议使用typedef对基本类型变量重新定义', '3', null, null, null, '声明定义', '基本变量类型{0}未使用typedef在统一的变量声明头文件中重新定义', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('655', 'MacroBracketNeedMatch', '5.1.2.2 谨慎宏中括号不匹配造成使用上的误解', '3', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('656', 'CarefulUseSharpInMacro', '5.1.2.3 宏定义中谨慎使用##或者#', '3', null, null, null, '声明定义', '{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('657', 'InnerVarDefineAtStart', '5.1.2.4 建议函数内部变量在函数体开始处统一定义', '3', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('658', 'StructDefineEmbedLess3', '5.1.2.5 建议结构体嵌套定义不超过3层', '3', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('659', '', '5.1.2.6 建议用宏或const定义常数', '3', null, null, null, '声明定义', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('660', 'LoopBodyCurly', '5.2.1.1 循环体必须用大括号括起来', '1', null, null, null, '版面书写', '循环体必须用大括号括起来', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('661', 'ThenElseCurly', '5.2.1.2 if、else if、else必须用大括号括起来', '1', null, null, null, '版面书写', 'then_else中的语句应用大括号括起来', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('662', 'NoExecutableCodeBeforeInclude', '5.2.1.3 禁止在头文件前有可执行代码', '1', null, null, null, '版面书写', '{0}前有可执行代码', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('663', 'TwoOperandsWithParenExceptPlusMinusStarDivMod', '5.2.1.4 引起二义性理解的逻辑表达式，必须使用括号显式说明优先级顺序', '1', null, null, null, '版面书写', '双目运算符{0}必须使用括号来显式标明优先级', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('664', 'BraceLogicExpr', '5.2.1.5 逻辑判别表达式中的运算项必须要使用括号', '1', null, null, null, '版面书写', '逻辑表达式的连接没有使用括号', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('665', 'NoRecursiveComments', '5.2.1.6 禁止嵌套注释', '1', null, null, null, '版面书写', '禁止使用嵌套的注释', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('666', 'FileLengthLess2000', '5.2.2.1 一个文件中的语句总行不超过2000行', '3', null, null, null, '版面书写', '文件总长度为{0}行，大于2000行', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('667', 'MaxFuncLengthRule', '5.2.2.2 一个函数中的语句总行不超过200行', '3', null, null, null, '版面书写', '函数{0}的程序总行为{1}超过200', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('668', 'NotUseSingleComment', '5.2.2.3 C语言程序建议使用标准C的注释，谨慎使用\'//\'注释', '3', null, null, null, '版面书写', ' 尽量不使用单行注释{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('669', 'MoreThan2LPointer', '5.3.1.1 禁止指针的指针超过两级', '1', null, null, null, '指针使用', '指针{0}超过两级', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('670', 'FuncPointerUseRule', '5.3.1.2 函数指针的使用必须加以&明确说明', '1', null, null, null, '指针使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('671', 'ParameterPtrNotAssign', '5.3.1.3 禁止对参数指针进行赋值', '1', null, null, null, '指针使用', '111从第{0}行到第{1}行代码为死代码，不能执行', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('672', 'ReturnAddrOfLocalsRule', '5.3.1.4 禁止将局部变量地址做为函数返回值返回', '1', null, null, null, '指针使用', '将指向局部变量{0}的指针返回给过程指针', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('673', 'FreeAndUsePointerRule', '5.3.1.5 禁止使用或释放未分配空间或已被释放的指针', '1', null, null, null, '指针使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('674', 'PtrVarFreedAssignNull', '5.3.1.6 指针变量被释放后必须置为NULL', '1', null, null, null, '指针使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('675', 'PtrVarDefNoSpaceAssignNull', '5.3.1.7 动态分配的指针变量定义时如未被分配空间必须初始化为NULL', '1', null, null, null, '指针使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('676', 'PtrVarFirstUseCheckNull', '5.3.1.8 动态分配的指针变量第一次使用前必须进行是否为NULL的判别', '1', null, null, null, '指针使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('677', 'NullPointerNotUse0', '5.3.1.9 空指针必须使用NULL，禁止使用整型数0', '1', null, null, null, '指针使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('678', 'CloseFilePtrExit', '5.3.1.10 禁止文件指针在退出时没有关闭文件', '1', null, null, null, '指针使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('679', 'NoDeclFuncPointer', '5.3.2.1 谨慎使用函数指针', '3', null, null, null, '指针使用', '将函数声明为指针类型{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('680', 'CarefulUseVoidPointer', '5.3.2.2 谨慎使用无类型指针', '3', null, null, null, '指针使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('681', 'PointerInAlgebraOpera', '5.3.2.3 谨慎对指针进行算术运算', '3', null, null, null, '指针使用', '指针{0}进行了代数运算', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('682', 'NoElse', '5.4.1.1 在if-else if语句中必须使用else分支', '1', null, null, null, '分支控制', 'if elseif分支语句末尾无else分支', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('683', 'NullConditionBranchRule', '5.4.1.2 条件判定分支如果为空，必须以单独一行的分号加注释进行明确说明', '1', null, null, null, '分支控制', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('684', 'NotUseEmptySwitch', '5.4.1.3 禁止使用空switch语句', '1', null, null, null, '分支控制', 'switch语句不能为空', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('685', 'NoLogicExprInSwitch', '5.4.1.4 禁止对bool量使用switch语句', '1', null, null, null, '分支控制', 'switch语句中禁止是逻辑表达式', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('686', 'NotUseSwitchWithOnlyDefault', '5.4.1.5 禁止switch语句中只包含default语句', '1', null, null, null, '分支控制', '禁止在switch语句中只包含default', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('687', 'SwitchNoDefaultAddition', '5.4.1.6 除枚举类型列举完全外，switch必须要有default', '1', null, null, null, '分支控制', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('688', 'SwitchTerminateRule', '5.4.1.7 switch中的case和default必须以break或return终止，共用case必须加以明确注释', '1', null, null, null, '分支控制', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('689', 'SwitchWithSameHierarchy', '5.4.1.8 switch语句的所有分支必须具有相同的层次范围', '1', null, null, null, '分支控制', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('690', 'NestBranchsLessThan7', '5.4.2.1 避免层数过多的分支嵌套，建议最多不超过7层', '3', null, null, null, '分支控制', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('691', 'GotoStatementUseRule', '5.5.1.1 禁止从复合语句外goto到复合语句内，或由下向上goto', '1', null, null, null, '跳转控制', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('692', 'NotUseLongjmp', '5.5.1.2 禁止使用setjmp/longjmp', '1', null, null, null, '跳转控制', '使用了{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('693', 'DoNotUseGOTO', '5.5.2.1 谨慎使用goto语句', '3', null, null, null, '跳转控制', '禁止使用goto语句', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('694', 'NoAssignFloatToIntegerVar', '5.6.1.1 禁止将浮点常数赋给整型变量', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('695', 'IntegerOverflowAssign', '5.6.1.2 禁止将越界整数赋给整型变量', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('696', 'NoAssignmentInNonAssigmentExpr', '5.6.1.3 禁止在逻辑表达式中使用赋值语句', '1', null, null, null, '运算处理', '禁止在非赋值表达式中出现赋值操作符', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('697', 'NotUseBitOperatorToBoolean', '5.6.1.4 禁止对逻辑表达式进行位运算', '1', null, null, null, '运算处理', '禁止用位操作符{0}操作布尔值{1}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('698', 'AvoidUseIncAndDec', '5.6.1.5 禁止在运算表达式中或函数调用参数中使用++或--操作符', '1', null, null, null, '运算处理', '避免使用\'++\'或\'--\'操作符', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('699', 'ShiftToOverflow', '5.6.1.6 对变量进行移位运算禁止超出变量长度', '1', null, null, null, '运算处理', '变量{0}是{1}类型，只有{2}位', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('700', 'ShiftNeg', '5.6.1.7 禁止移位操作中的移位数为负数', '1', null, null, null, '运算处理', '移位操作符{0}中右操作数为负数', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('701', 'ArrayOutofIndex', '5.6.1.8 数组禁止越界使用', '1', null, null, null, '运算处理', '索引{0}超出数组大小{1}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('702', 'ArrayIndexInteger', '5.6.1.9 数组下标必须是大于等于零的整型数', '1', null, null, null, '运算处理', '数组下标必须是整数', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('703', 'NoLogicalNOT2Const', '5.6.1.10 禁止对常数值做逻辑非的运算', '1', null, null, null, '运算处理', '禁止对常数值{0}做逻辑非运算', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('704', 'IllegalUseEnum', '5.6.1.11 禁止非枚举类型变量使用枚举类型的值', '1', null, null, null, '运算处理', '枚举值{0}越限使用：只能用于与其它枚举类型进行比较', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('705', '', '5.6.1.12 除法运算中禁止被零除', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('706', 'NotSizeofAssignType', '5.6.1.13 禁止在sizeof中使用赋值', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('707', 'MemcpyReadOutofBound', '5.6.1.14 缓存区读取操作禁止越界', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('708', 'MemcpyWriteOutofBound', '5.6.1.15 缓存区写入操作禁止越界', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('709', 'NoUseFreedSpace', '5.6.1.16 禁止使用已被释放了的内存空间', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('710', 'FreedPtrPoint2Init', '5.6.1.17 被free的指针必须指向最初的malloc、calloc分配的地址', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('711', 'NotUseGetsButFGets', '5.6.1.18 禁止使用gets函数，应使用fgets函数替代', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('712', 'StringFuncUseOutofBound', '5.6.1.19 使用字符串赋值、拷贝、追加等函数时，禁止目标字符串存储空间越界', '1', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('713', 'NoBitOperForSigned', '5.6.2.1 谨慎对有符号整型量进行位运算', '3', null, null, null, '运算处理', '对有符号类型{0}进行位运算', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('714', 'CarefulIntDivIntVar', '5.6.2.2 谨慎做整型量除以整型变量的除法', '3', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('715', 'MallocPtrNeedFree', '5.6.2.3 动态申请的内存空间用完后及时释放', '3', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('716', 'NotUseStrcpyButStrncpy', '5.6.2.4 避免使用strcpy函数，应使用strncpy函数替代', '3', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('717', 'NotUseStrcatButStrncat', '5.6.2.5 避免使用strcat函数，应使用strncat函数替代', '3', null, null, null, '运算处理', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('718', 'CarefulToUseComma', '5.6.2.6 谨慎使用逗号操作符', '3', null, null, null, '运算处理', '尽量避免使用逗号操作符', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('719', 'NotDefineLibraryFunc', '5.7.1.1 禁止覆盖标准函数库的函数', '1', null, null, null, '函数调用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('720', 'RealParaTypeRule', '5.7.1.2 禁止函数的实参和形参类型不一致', '1', null, null, null, '函数调用', '第{0}个实参{1}和形参{2}类型不匹配', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('721', 'FormalAndRealEqualCount', '5.7.1.3 实参与形参的个数必须一致', '1', null, null, null, '函数调用', '函数{0}实参{1}个，形参{2}个，不一致', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('722', 'AvoidParaVarInOldStyle', '5.7.1.4 禁止使用旧形式的函数参数表定义形式', '1', null, null, null, '函数调用', '避免使用老的参数表的定义形式', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('723', 'FuncParaTypeRule', '5.7.1.5 函数声明和函数定义中的参数类型必须一致', '1', null, null, null, '函数调用', '函数{0}{1}，不一致 ', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('724', 'FuncDeclAndDefTypeSame', '5.7.1.6 函数声明和函数定义中的返回类型必须一致', '1', null, null, null, '函数调用', '函数{0}的定义返回类型是{1}，声明返回类型是{2}，不一致', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('725', 'NonVoidFuncRet', '5.7.1.7 有返回值的函数必须通过返回语句返回', '1', null, null, null, '函数调用', '非void类型函数{0}必须有返回语句', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('726', 'VoidFuncNoRet', '5.7.1.8 禁止无返回值函数的返回语句带有返回值', '1', null, null, null, '函数调用', 'void类型的函数中return语句带返回值', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('727', 'ReturnValueForNonVoidFunc', '5.7.1.9 有返回值函数的返回语句必须带有返回值', '1', null, null, null, '函数调用', '有返回值的函数中return必须带有返回值', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('728', 'FunctionRetTypeRule', '5.7.1.10 函数返回值的类型必须与定义一致', '1', null, null, null, '函数调用', '在返回类型为{0}的函数中返回类型{1}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('729', 'FuncRetNotUseNeedVoid', '5.7.1.11 具有返回值的函数，其返回值如果不被使用，调用时应有(void)说明', '1', null, null, null, '函数调用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('730', 'FuncNoRetNotUseVoid', '5.7.1.12 无返回值的函数，调用时禁止再用(void)重复声明', '1', null, null, null, '函数调用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('731', 'StaticFunctionRule', '5.7.1.13 静态函数必须被使用', '1', null, null, null, '函数调用', 'static类型的函数{0}在文件中没有被调用', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('732', 'MultiFuncCallInSingleExpr', '5.7.1.14 禁止同一表达式中调用多个顺序相关函数', '1', null, null, null, '函数调用', '在同一个表达式中调用了多个相关函数', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('733', 'NoFuncParaVarargsRule', '5.7.1.15 禁止在函数参数表中使用省略号', '1', null, null, null, '函数调用', '函数{0}的参数表中禁止使用省略号', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('734', 'FuncCallNoLoop', '5.7.1.16 禁止使用直接或间接自调用函数', '1', null, null, null, '函数调用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('735', 'FuncParaNoMoreThan10', '5.7.2.1 函数中避免使用过多的参数，建议不要超过10个', '3', null, null, null, '函数调用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('736', 'UnusedArgs', '5.7.2.2 函数中避免存在未被使用的调用参数', '3', null, null, null, '函数调用', '函数参数{0}在函数调用中未被使用', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('737', 'BeCharyOfFunc_abort_exit', '5.7.2.3 谨慎使用abort、exit函数', '3', null, null, null, '函数调用', '谨慎使用abort,exit等函数', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('738', '', '5.7.2.4 对系统函数的调用，建议调用后对其返回状态的有效性进行判别', '3', null, null, null, '函数调用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('739', '', '5.7.2.5 函数中数组变量作为参数指针传递时，建议同时传递数组长度', '3', null, null, null, '函数调用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('740', 'NoUnreachedStatement', '5.8.1.1 禁止不可达语句', '1', null, null, null, '语句使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('741', 'NoUnreachedBranch', '5.8.1.2 禁止不可达分支', '1', null, null, null, '语句使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('742', 'NoEffectStatement', '5.8.1.3 禁止使用无效语句', '1', null, null, null, '语句使用', '语句没有起作用', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('743', 'UseOctalNumberMustWithComment', '5.8.1.4 使用八进制数必须明确注释', '1', null, null, null, '语句使用', '使用八进制数必须加以注释', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('744', 'NumberTypeSuffixUpperCase', '5.8.1.5 数字类型后缀必须使用大写字母', '1', null, null, null, '语句使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('745', 'EmptyStatementRule', '5.8.2.1 避免使用空语句', '3', null, null, null, '语句使用', '尽量避免使用空语句', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('746', 'UnusedVariables', '5.8.2.2 避免无用的多余变量', '3', null, null, null, '语句使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('747', 'UnusedFunctions', '5.8.2.3 避免无用的多余函数', '3', null, null, null, '语句使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('748', 'NumberTypeSuffixShouldUse', '5.8.2.4 推荐使用数字类型后缀', '3', null, null, null, '语句使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('749', 'NoGlobalLoopVar', '5.9.1.1 for循环控制变量必须使用局部变量', '1', null, null, null, '循环控制', '循环变量{0}是全局变量', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('750', 'LoopVarType', '5.9.1.2 for循环控制变量必须使用整数型变量', '1', null, null, null, '循环控制', '循环变量{0}类型是{1}，不合适', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('751', 'NotChangeCounterExceptByIncException', '5.9.1.3 禁止在for循环体内部修改循环控制变量', '1', null, null, null, '循环控制', '循环计数{0}不能在循环变量增值语句以外被修改', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('752', 'InfiniteLoopUseRule', '5.9.1.4 无限循环必须使用while(1)语句，禁止使用for(;;)等其他形式的语句', '1', null, null, null, '循环控制', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('753', 'InfiniteLoop', '5.9.2.1 谨慎使用无限循环语句', '3', null, null, null, '循环控制', '使用无限循环应严格审查', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('754', 'NoMultiBreakInLoop', '5.9.2.2 谨慎在循环中使用多个break语句', '3', null, null, null, '循环控制', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('755', 'NoMultiContinueInLoop', '5.9.2.3 谨慎在循环中使用多个continue语句', '3', null, null, null, '循环控制', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('756', 'FloatVarAssignToIntNeedCast', '5.10.1.1 浮点数变量赋给整型变量必须强制转换', '1', null, null, null, '类型转换', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('757', 'IntAssignNeedCastRule', '5.10.1.2 长整数变量赋给短整数变量必须强制转换', '1', null, null, null, '类型转换', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('758', 'DoubleAssignToFloatNeedCast', '5.10.1.3 double型变量赋给float型变量必须强制转换', '1', null, null, null, '类型转换', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('759', 'PtrTypeAssignSame', '5.10.1.4 指针变量的赋值类型必须与指针变量类型一致', '1', null, null, null, '类型转换', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('760', 'NONPtrAndPterTypeCast', '5.10.1.5 将指针量赋予非指针变量或非指针量赋予指针变量，必须使用强制转换', '1', null, null, null, '类型转换', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('761', 'AvoidUnnecessaryCast', '5.10.1.6 禁止使用无实质作用的类型转换', '1', null, null, null, '类型转换', '{0}为{1}类型，强制类型转换没有必要', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('762', '', '5.10.2.1 浮点型数转换成整型数应考虑是否需要四舍五入', '3', null, null, null, '类型转换', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('763', 'DoubleAssignToFloatCareful', '5.10.2.2 谨慎将double型数转换成float型数', '3', null, null, null, '类型转换', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('764', 'IntAssignRuleCareful', '5.10.2.3 谨慎将长整型数转换成短整型数', '3', null, null, null, '类型转换', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('765', 'NONPtrAndPterTypeCastCareful', '5.10.2.4 谨慎将指针量赋予非指针变量或非指针量赋予指针变量', '3', null, null, null, '类型转换', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('766', 'UninitializedValuesRule1', '5.11.1.1 变量禁止未赋值就使用', '1', null, null, null, '初始化', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('767', 'VarDeclNotWithDefaultInit', '5.11.1.2 变量初始化禁止隐含依赖于系统的缺省值', '1', null, null, null, '初始化', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('768', 'StructNestingRule', '5.11.1.3 结构体初始化的嵌套结构必须与定义一致', '1', null, null, null, '初始化', '结构体变量初始化存在嵌套不一致', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('769', 'EnumMemberInitComplete', '5.11.1.4 枚举元素定义中的初始化必须完整', '1', null, null, null, '初始化', ' 枚举元素初始化必须完整', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('770', 'VarDeclWithInit', '5.11.2.1 建议变量在声明的同时进行初始化', '3', null, null, null, '初始化', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('771', '', '5.11.2.2 建议所有全局变量在统一设计的初始化模块中进行初始化', '3', null, null, null, '初始化', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('772', 'CompareBooleanVar', '5.12.1.1 禁止对逻辑量进行大于或小于的逻辑比较', '1', null, null, null, '比较判断', '禁止两个布尔型变量进行比较', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('773', 'NoComparePointers', '5.12.1.2 禁止对指针进行大于或小于的逻辑比较', '1', null, null, null, '比较判断', '{0}进行了逻辑比较', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('774', 'NoEqualCompareRealNumber', '5.12.1.3 禁止对浮点数进行是否相等的比较', '1', null, null, null, '比较判断', '实数类型的量{0}不能做是否相等的比较', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('775', 'NoCompUnsignedToZero', '5.12.1.4 禁止对无符号数进行大于等于零或小于零的比较', '1', null, null, null, '比较判断', '对无符号数{0}进行大于等于零或小于零的比较', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('776', 'NoCompareWithSignAndUnsign', '5.12.1.5 禁止无符号数与有符号数之间的直接比较', '1', null, null, null, '比较判断', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('777', 'EqualsWithConstLeftRule', '5.12.2.1 与常数进行是否相等的判别，建议常数在左，变量在右', '3', null, null, null, '比较判断', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('778', 'LocalGlobalNamingRule', '5.13.1.1 禁止局部变量与全局变量同名', '1', null, null, null, '变量使用', '局部变量{0}与全局变量{1}同名', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('779', 'FormalParaAndGlobalRule', '5.13.1.2 禁止函数形参与全局变量同名', '1', null, null, null, '变量使用', '形参{0}和全局变量{1}同名', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('780', 'FunctionNameNoFieldRule', '5.13.1.3 禁止变量名与函数名同名', '1', null, null, null, '变量使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('781', 'VarAndCompositeNameSame', '5.13.1.4 禁止变量名与标识名同名', '1', null, null, null, '变量使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('782', 'EnumMemberNameRule', '5.13.1.5 禁止变量名与枚举元素同名', '1', null, null, null, '变量使用', '枚举类型中的元素{0}与已有的变量名{1}重名', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('783', 'VarAndTypedefNameSame', '5.13.1.6 禁止变量名与typedef自定义的类型名同名', '1', null, null, null, '变量使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('784', 'InnerBlockVarAndLocalVar', '5.13.1.7 禁止在内部块中重定义已有的变量名', '1', null, null, null, '变量使用', '{0}与已有的局部变量{1}重名', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('785', 'VarNameDiffWithCase', '5.13.1.8 禁止仅依赖大小写区分的变量', '1', null, null, null, '变量使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('786', 'VarNameDiffWithland1', '5.13.1.9 禁止仅依赖小写字母\'l\'与数字\'1\'区分的变量', '1', null, null, null, '变量使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('787', 'VarNameDiffWithOand0', '5.13.1.10 禁止仅依赖大写字母\'O\'与数字\'0\'区分的变量', '1', null, null, null, '变量使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('788', 'NotUseSingle_l_O_VariableRule', '5.13.1.11 禁止单独使用小写字母\'l\'或大写字母\'O\'作为变量名', '1', null, null, null, '变量使用', '禁止单独使用小写l或大写O做为变量名', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('789', 'ConstDefinedVolatile', '5.13.1.12 程序外部可改写的变量，必须使用volatile类型说明', '1', null, null, null, '变量使用', '接口地址指针使用 volatile 定义', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('790', 'DoNotUseVolatileVariableInComplicatedExpression', '5.13.1.13 禁止在表达式中出现多个同一volatile类型变量的运算', '1', null, null, null, '变量使用', '禁止在复杂表达式中使用volatile类型的变量{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('791', 'NotUseNullReplace0', '5.13.1.14 禁止将NULL做为整数型0使用', '1', null, null, null, '变量使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('792', 'DoNotAssignNegToUnsigned', '5.13.1.15 禁止给无符号类型变量赋负值', '1', null, null, null, '变量使用', '给{0}类型的变量{1}赋了负值', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('793', 'CharArrayNeedTerminateChar', '5.13.1.16 用于表示字符串的数组必须以\'\\0\'结尾', '1', null, null, null, '变量使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('794', 'VarNameWithTypePrefix', '5.13.2.1 推荐使用带类型前缀的变量命名', '3', null, null, null, '变量使用', null, null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('795', 'RegisterVarRule', '5.13.2.2 谨慎使用寄存器变量', '3', null, null, null, '变量使用', '使用了寄存器变量{0}', null, '2017-10-24 14:14:38', null, null, '8');
INSERT INTO `saci_checker` VALUES ('796', 'CarefulUseUnsignedTypeSub', '谨慎对两个无符号整型进行减法运算', '3', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('797', 'AssignMistakenEqual', '=误写为==', '1', null, null, null, '扩展检查单', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('798', 'EqualMistakenAssign', '==误写为=', '1', null, null, null, '扩展检查单', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('799', 'LogicAndBitComputationMistaken', '逻辑运算和按位运算混淆', '1', null, null, null, '扩展检查单', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('800', 'BitEqualPriority', '应该先进行位操作，在进行布尔操作', '1', null, null, null, '扩展检查单', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('801', 'NoContinuousComparation', '禁止连续的比较运算', '1', null, null, null, '扩展检查单', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('802', 'StaticDefWithoutType', '静态变量缺少类型定义', '1', null, null, null, '扩展检查单', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('803', 'ContinuesInit', '连续定义初始化错误,逗号误写为分号', '1', null, null, null, '扩展检查单', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('804', 'TypedefRedefinition', '5.1.1.4 禁止对typedef自定义的类型进行重新定义', '1', null, null, null, '编程规范分析', '重新定义typedef自定义的类型名{0}', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('805', 'VoidDupDefVarWithDiffTypeInFuncRule', '5.1.1.5 禁止在同一函数内使用不同的类型重新定义局部变量', '1', null, null, null, '数据流分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('806', 'DeclNoDefineForFunc', '5.1.1.8 禁止声明了函数但未对函数进行定义', '1', null, null, null, '编程规范分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('807', 'UseFuncWithoutDeclRule', '5.1.1.11 函数应具有声明，且声明在函数的定义和调用范围内可见', '1', null, null, null, '编程规范分析', '函数{0}必须有声明', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('808', 'NoBoundArray', '5.1.1.16 禁止数组没有边界限定', '1', null, null, null, '编程规范分析', '数组{0}没有边界限定', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('809', 'UnusedDecl', '5.1.1.17 禁止声明了函数、变量，但是在程序中未被使用', '1', null, null, null, '数据流分析', '应避免已声明了函数、变量或常量等，但未使用: {0}未使用', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('810', 'UnusedTypedefRule', '5.1.1.18 禁止声明了类型、常量但未被使用', '1', null, null, null, '数据流分析', '类型定义{0}从未被使用', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('811', 'NotDefineWithKeywordInMacro', '5.1.1.19 禁止使用宏重新定义保留字（关键字）', '1', null, null, null, '编程规范分析', '禁止使用宏重新定义保留字（关键字）{0}', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('812', 'IfEndIf', '5.1.1.22 禁止在同一个文件中有#if而没有#endif', '1', null, null, null, '编程规范分析', '禁止在同一文件中有#if没有#endif', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('813', 'ExternVarDeclAndDefTypeSame', '5.1.1.24 使用extern声明的变量的类型应与其定义的类型一致', '1', null, null, null, '接口分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('814', 'FuncBodyCurly', '5.1.2.1 函数体必须用大括号括起来', '1', null, null, null, '编程规范分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('815', 'BraceLogicExpr', '5.1.2.3 逻辑表达式的连接应使用括号', '1', null, null, null, '编程规范分析', '逻辑表达式的连接没有使用括号', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('816', 'SwitchNoDefault', '5.1.3.4 在switch语句中应有default语句', '1', null, null, null, '控制流分析', '在switch语句中必须有default语句', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('817', 'ReturnAddrOfLocalsRule', '5.1.4.1 禁止返回指向局部变量的指针', '1', null, null, null, '编程规范分析', '将指向局部变量{0}的指针返回给过程指针', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('818', 'NoAssignmentInNonAssigmentExpr', '5.1.6.1 条件判断语句中的控制表达式禁止为赋值表达式', '1', null, null, null, '表达式分析', '禁止在非赋值表达式中出现赋值操作符', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('819', 'ArrayOutofIndex', '5.1.6.2 数组使用应保证不会出现越界', '1', null, null, null, '表达式分析', '索引{0}超出数组大小{1}', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('820', 'ValueOutofBound', '5.1.6.3 变量在运算过程中不应出现非预期的数据溢出', '1', null, null, null, '表达式分析', '{0}超出了{1}类型的{2}所定义的范围', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('821', 'NoShiftForSigned', '5.1.6.4 禁止对有符号类型变量进行移位运算', '1', null, null, null, '表达式分析', '对有符号类型{0}进行了移位运算', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('822', 'ShiftToOverflow', '5.1.6.5 对变量进行移位运算应保证不会产生溢出', '1', null, null, null, '表达式分析', '变量{0}是{1}类型，只有{2}位', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('823', 'DoNotAssignNegToUnsigned', '5.1.6.6 禁止给无符号变量赋负值', '1', null, null, null, '表达式分析', '给{0}类型的变量{1}赋了负值', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('824', 'NoLessThan2BitsForSigned', '5.1.6.7 有符号类型的位长度必须大于等于两位', '1', null, null, null, '表达式分析', '有符号类型{0}的位长度为{1}，小于两位', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('825', 'BitDefForInteger', '5.1.6.8 位的定义应是有符号整数或无符号整数', '1', null, null, null, '表达式分析', '位的定义是{0},不是有符号或无符号的整数', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('826', 'ArrayIndexInteger', '5.1.6.9 数组下标应是整型', '1', null, null, null, '表达式分析', '数组下标必须是整数', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('827', 'NoLogicalNOT2Const', '5.1.6.10 禁止对常数值做逻辑非的运算', '1', null, null, null, '表达式分析', '禁止对常数值{0}做逻辑非运算', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('828', 'NoBitOperForSigned', '5.1.6.11 禁止对有符号类型使用位运算', '1', null, null, null, '表达式分析', '对有符号类型{0}进行位运算', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('829', 'IllegalUseEnum', '5.1.6.12 枚举类型变量操作应类型一致', '1', null, null, null, '接口分析', '枚举值{0}越限使用：只能用于与其它枚举类型进行比较', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('830', 'NoAssignmentInLogicExpr', '5.1.6.13 禁止在关系表达式和逻辑表达式中用赋值操作符', '1', null, null, null, '表达式分析', '赋值操作符{0}与逻辑操作符{1}连用', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('831', 'NotUseBitOperatorToBoolean', '5.1.6.14 禁止位操作符与关系表达式或逻辑表达式相连接', '1', null, null, null, '表达式分析', '禁止用位操作符{0}操作布尔值{1}', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('832', 'CarefulToUseComma', '5.1.6.15 除for循环的循环变量赋初值及循环变量增值语句外，禁止使用逗号操作符', '1', null, null, null, '表达式分析', '尽量避免使用逗号操作符', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('833', 'HexNumInBitExpr', '5.1.6.16 位操作(除移位操作外)语句中的立即数应显式使用16进制数', '1', null, null, null, '表达式分析', '位操作的语句应该显式使用16进制数', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('834', 'IntegerCastToRealNumberBeforeRealCompute', '5.1.6.18 进行实数运算操作前，应先将整数转换为实数', '1', null, null, null, '表达式分析', '整数{0}在进行实数运算操作前，必须先转换为实数类型', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('835', 'CastToBastTypeWhenBitComputeWithUnsignedCharOrInt', '5.1.6.19 位运算符\"~\"和\"<<\"应用于unsigned char或unsigned\n			short操作数时,运算结果应强制转换为操作数的类型\n		', '1', null, null, null, '表达式分析', '运算符 {0}应用在基本类型为unsigned {1}的操作数{2},结果应该强制转换为unsigned {1}', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('836', 'ShiftNeg', '5.1.6.20 禁止移位操作的右操作数为负数', '1', null, null, null, '表达式分析', '移位操作符{0}中右操作数为负数', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('837', 'TwoOperandsWithParenExceptPlusMinusStarDivMod', '5.1.6.21 除仅包含\"+\"、\"-\"、\"*\"、\"/\"、\"%\"运算符的表达式外，使用双目运算符时，应使用括号来显式标明优先级', '1', null, null, null, '表达式分析', '双目运算符{0}必须使用括号来显式标明优先级', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('838', 'FormalAndRealEqualCount2014', '5.1.7.1 实参与形参个数应一致', '1', null, null, null, '接口分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('839', 'NoVoidFuncInExpr', '5.1.7.4 禁止void类型的函数用在表达式中', '1', null, null, null, '表达式分析', 'void类型的函数{0}用在表达式中', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('840', 'RealParaTypeRule', '5.1.7.5 函数的实参和形参类型应一致', '1', null, null, null, '接口分析', '第{0}个实参{1}和形参{2}类型不匹配', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('841', 'FuncParaTypeRule', '5.1.7.6 函数定义的参数类型和函数声明中的参数类型应一致', '1', null, null, null, '接口分析', '函数{0}{1}，不一致 ', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('842', 'NoEffectStatement', '5.1.8.1 禁止使用不起作用的语句', '1', null, null, null, '控制流分析', '语句没有起作用', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('843', 'NonVoidFuncRet', '5.1.9.1 非void类型的函数应有返回语句', '1', null, null, null, '控制流分析', '非void类型函数{0}必须有返回语句', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('844', 'VoidFuncNoRet', '5.1.9.2 禁止void类型的函数中return语句带返回值', '1', null, null, null, '控制流分析', 'void类型的函数中return语句带返回值', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('845', 'ReturnValueForNonVoidFunc', '5.1.9.3 有返回值的函数return语句应带有返回值', '1', null, null, null, '控制流分析', '有返回值的函数中return必须带有返回值', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('846', 'FunctionRetTypeRule', '5.1.9.4 函数返回类型应与函数定义的返回类型一致', '1', null, null, null, '接口分析', '在返回类型为{0}的函数中返回类型{1}', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('847', 'FuncDeclAndDefTypeSame', '5.1.9.5 函数声明和函数定义的返回类型应一致', '1', null, null, null, '接口分析', '函数{0}的定义返回类型是{1}，声明返回类型是{2}，不一致', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('848', 'LoopVarType', '5.1.11.1 应使用整型变量做为for循环的循环变量', '1', null, null, null, '编程规范分析', '循环变量{0}类型是{1}，不合适', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('849', 'NoGlobalLoopVar', '5.1.11.2 循环变量应局部声明', '1', null, null, null, '编程规范分析', '循环变量{0}是全局变量', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('850', 'NotChangeCounterExceptByIncException2', '5.1.11.5 for循环变量不能在循环变量增值语句以外被修改', '1', null, null, null, '控制流分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('851', 'NotChangeOtherLoopVarExceptCounter', '5.1.11.6 除for循环循环变量外不应在循环条件表达式或循环变量增值表达式中修改循环变量\n		', '1', null, null, null, '控制流分析', '非循环计数的循环控制变量{0}不能在循环条件表达式 或循环变量增值表达式中修改', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('852', 'UninitializedValuesRule1', '5.1.13.1 变量使用前应被赋值', '1', null, null, null, '数据流分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('853', 'EnumMemberInitComplete', '5.1.13.2 枚举元素的初始化应完整', '1', null, null, null, '数据流分析', ' 枚举元素初始化必须完整', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('854', 'StructInitRule', '5.1.13.3 结构体成员变量初始化的类型应与定义一致', '1', null, null, null, '接口分析', '结构体变量{0}初始化类型与定义不一致；{1}', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('855', 'ArrayInitComplete', '5.1.13.5 数组的初始化应完整', '1', null, null, null, '数据流分析', '数组的初始化必须完整', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('856', 'EnumeratorInt', '5.1.13.6 枚举类型的元素应初始化为整型', '1', null, null, null, '编程规范分析', '枚举类型的变量成员{0}初始化值为{1}，不是整型', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('857', 'NoLogicExprInSwitch', '5.1.14.1 switch语句中的表达式禁止是逻辑表达式', '1', null, null, null, '编程规范分析', 'switch语句中禁止是逻辑表达式', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('858', 'NoEqualCompareRealNumber', '5.1.14.2 禁止对实数类型的量做是否相等的比较', '1', null, null, null, '表达式分析', '实数类型的量{0}不能做是否相等的比较', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('859', 'LocalGlobalNamingRule', '5.1.15.2 禁止局部变量与全局变量同名', '1', null, null, null, '编程规范分析', '局部变量{0}与全局变量{1}同名', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('860', 'FormalParaAndGlobalRule', '5.1.15.3 禁止函数形参与全局变量同名', '1', null, null, null, '编程规范分析', '形参{0}和全局变量{1}同名', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('861', 'EmptyCaseRule', '5.2.3.1 避免switch语句的case中无语句，如为软件特殊设计需加注释进行说明\n		', '1', null, null, null, '控制流分析', 'case分支内没有语句', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('862', 'NoBreakInCase', '5.2.3.2 避免switch的case语句不是由break终止，如为软件特殊设计需加注释进行说明\n		', '1', null, null, null, '控制流分析', 'case语句不是由break终止', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('863', 'EnumSwitchCoverCaseRule', '5.2.3.3 避免当switch语句的表达式是枚举类型时缺少case分支', '1', null, null, null, '控制流分析', '缺少case {0}分支', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('864', 'NotAssignVarDiffTypeValue', '5.2.6.1 尽量避免给变量赋的值与变量的类型不一致', '1', null, null, null, '接口分析', '变量类型是{0}，赋值类型是{1}', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('865', 'NoCompUnsignedToZero', '5.2.6.2 避免对无符号数进行大于等于零或小于零的比较', '1', null, null, null, '表达式分析', '对无符号数{0}进行大于等于零或小于零的比较', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('866', 'OctalNumberRule', '5.2.8.3 谨慎使用八进制数', '1', null, null, null, '编程规范分析', '使用了八进制数{0}', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('867', 'EmptyStatementRule', '5.2.8.5 尽量避免使用空语句', '1', null, null, null, '控制流分析', '尽量避免使用空语句', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('868', 'InfiniteLoop', '5.2.9 谨慎使用无限循环', '1', null, null, null, '控制流分析', '使用无限循环应严格审查', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('869', 'LogicAndBitComputationMistaken', '5.3.1 禁止逻辑运算和按位运算的混淆', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('870', 'NoContinuousComparation', '5.3.2 禁止连续的比较运算', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('871', 'AssignMistakenEqual', '5.3.3 禁止赋值符号=误写为逻辑判断符号==', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('872', 'EqualMistakenAssign', '5.3.4 禁止逻辑判断符号==误写为赋值符号=', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('873', 'ReferrenceTypeWhenVariableWrittenInFunction', '5.3.5 函数中写操作实参和形参必须是指针或者引用类型', '3', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('874', 'NoDifferentIntegerEqualityCompare', '5.3.6 不同类型的整形变量做相等的比较', '3', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('875', 'HeadFileIncludedCallingLibFunctions', '5.3.7 调用库函数时，必须添加所依赖的头文件', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('876', 'NoNegativeAssigningToUnsignedVariable', '5.3.8 禁止对无符号变量赋负值', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('877', 'NoDifferentFloatEqualityComparing', '5.3.9 禁止使用浮点数相等的比较\n		', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('878', 'NoElse', '5.3.10 if语句没有else语句\n		', '1', null, null, null, '表达式分析', 'if elseif分支语句末尾无else分支', null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('879', 'LogicComputationOutOfOrder', '5.3.11 逻辑与或非优先级处理不当\n		', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '9');
INSERT INTO `saci_checker` VALUES ('880', 'FunctionNameNoFieldRule', '5.1.1.1 禁止函数名被用作变量名或常量名', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('881', 'RedeclareFunc', '5.1.1.2 禁止多次声明同一函数', '1', null, null, null, '强制类', '函数{0}和{1}重声明', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('882', 'MultiLabelRule', '5.1.1.3 禁止使用多重标号', '1', null, null, null, '强制类', '存在{0}个标号,{1}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('883', 'TypedefRedefinition', '5.1.1.4 禁止对typedef自定义的类型进行重新定义', '1', null, null, null, '强制类', '重新定义typedef自定义的类型名{0}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('884', 'VoidDupDefVarWithDiffTypeInFuncRule', '5.1.1.5 禁止在同一函数内使用不同的类型重新定义局部变量', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('885', 'UnCompletedParaDeclRule', '5.1.1.6 函数的参数定义必须同时包含标识符和类型', '1', null, null, null, '强制类', '形式参数的声明不完整', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('886', 'FormalSpecifyInFuncDecl', '5.1.1.7 在函数的声明中应对参数及类型进行说明', '1', null, null, null, '强制类', '函数{0}声明中没有参数说明', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('887', 'DeclNoDefineForFunc', '5.1.1.8 禁止声明了函数但未对函数进行定义', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('888', 'NoFuncParaVarargsRule', '5.1.1.9 禁止在函数参数表中带有可变数量参数', '1', null, null, null, '强制类', '函数{0}的参数表中禁止使用省略号', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('889', 'NoEmptyFuncParaRule', '5.1.1.10 函数不带参数时应用(void)形式进行说明', '1', null, null, null, '强制类', '函数{0}的参数表为空', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('890', 'UseFuncWithoutDeclRule', '5.1.1.11 函数应具有声明，且声明在函数的定义和调用范围内可见', '1', null, null, null, '强制类', '函数{0}必须有声明', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('891', 'DoNotUseExtDeclInFunc', '5.1.1.12 禁止在函数体内使用外部变量声明', '1', null, null, null, '强制类', ' 禁止在函数体内使用外部声明', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('892', 'ConstSizeArrayFormalParameter', '5.1.1.13 禁止声明为数组的形式参数有固定的大小', '1', null, null, null, '强制类', '做为形参的数组{0}有固定大小', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('893', 'StructDefinition', '5.1.1.14 禁止结构体声明不完整', '1', null, null, null, '强制类', '结构体{0}声明不完整', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('894', 'NotUseNoNameBitFieldInStruct', '5.1.1.15 禁止在结构体中使用无名位域', '1', null, null, null, '强制类', '应避免在结构体中使用无名位域', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('895', 'NoBoundArray', '5.1.1.16 禁止数组没有边界限定', '1', null, null, null, '强制类', '数组{0}没有边界限定', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('896', 'UnusedDecl', '5.1.1.17 禁止声明了函数、变量，但是在程序中未被使用', '1', null, null, null, '强制类', '应避免已声明了函数、变量或常量等，但未使用: {0}未使用', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('897', 'UnusedTypedefRule', '5.1.1.18 禁止声明了类型、常量但未被使用', '1', null, null, null, '强制类', '类型定义{0}从未被使用', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('898', 'NotDefineWithKeywordInMacro', '5.1.1.19 禁止使用宏重新定义保留字（关键字）', '1', null, null, null, '强制类', '禁止使用宏重新定义保留字（关键字）{0}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('899', 'MacroInParen', '5.1.1.20 应用括号将含参数宏的宏体括起来', '1', null, null, null, '强制类', '宏体{0}未用括号括起来', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('900', 'MacroParaUsedOnce', '5.1.1.21 禁止参数宏的参数使用多于1次', '1', null, null, null, '强制类', '宏参数{0}使用多于1次', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('901', 'IfEndIf', '5.1.1.22 禁止在同一个文件中有#if而没有#endif', '1', null, null, null, '强制类', '禁止在同一文件中有#if没有#endif', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('902', 'HeadFileSurroundWithDefine', '5.1.1.23 每个头文件都应使用预处理指令保护措施避免自身被重复包含', '1', null, null, null, '强制类', '头文件{0}未使用预处理指令保护{1}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('903', 'ExternVarDeclAndDefTypeSame', '5.1.1.24 使用extern声明的变量的类型应与其定义的类型一致', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('904', 'FuncBodyCurly', '5.1.2.1 函数体必须用大括号括起来', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('905', 'LoopBodyCurly', '5.1.2.2 循环体应用大括号括起来', '1', null, null, null, '强制类', '循环体必须用大括号括起来', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('906', 'BraceLogicExpr', '5.1.2.3 逻辑表达式的连接应使用括号', '1', null, null, null, '强制类', '逻辑表达式的连接没有使用括号', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('907', 'MacroParaInParen', '5.1.2.4 宏参数应用括号括起来', '1', null, null, null, '强制类', '宏参数{0}未用括号括起来', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('908', 'EmbeddedASMRule', '5.1.2.5 嵌入汇编程序的函数应是纯汇编程序', '1', null, null, null, '强制类', '汇编中使用了局部变量{0}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('909', 'NoExecutableCodeBeforeInclude', '5.1.2.6 禁止在include语句之前存在可执行代码', '1', null, null, null, '强制类', '{0}前有可执行代码', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('910', 'NotUseSingle_l_O_VariableRule', '5.1.2.7 禁止单独使用小写字母l和大写字母O作为变量名', '1', null, null, null, '强制类', '禁止单独使用小写l或大写O做为变量名', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('911', 'NoStatementInIfThenRule', '5.1.3.1 禁止条件判别的真分支无执行语句', '1', null, null, null, '强制类', 'if-then分支无执行语句', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('912', 'NoStatementInElseRule', '5.1.3.2 禁止单if语句的else分支无执行语句', '1', null, null, null, '强制类', 'else分支无执行语句', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('913', 'NoElse', '5.1.3.3 if elseif分支语句中应有else分支，在最后的else语句中，应执行适当的动作，或给出恰当的注释以说明为何没有执行动作（注释关键字为\"特殊设计\"）', '1', null, null, null, '强制类', 'if elseif分支语句末尾无else分支', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('914', 'SwitchNoDefault', '5.1.3.4 在switch语句中应有default语句', '1', null, null, null, '强制类', '在switch语句中必须有default语句', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('915', 'ReturnAddrOfLocalsRule', '5.1.4.1 禁止返回指向局部变量的指针', '1', null, null, null, '强制类', '将指向局部变量{0}的指针返回给过程指针', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('916', 'MoreThan2LPointer', '5.1.4.2 禁止指针的指针超过两级', '1', null, null, null, '强制类', '指针{0}超过两级', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('917', 'NotSizeofPointerType', '5.1.4.3 禁止对指针类型变量进行sizeof操作', '1', null, null, null, '强制类', '禁止使用指针类型的sizeof操作', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('918', 'DoNotUseGOTO', '5.1.5 禁止使用goto语句', '1', null, null, null, '强制类', '禁止使用goto语句', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('919', 'NoAssignmentInNonAssigmentExpr', '5.1.6.1 条件判断语句中的控制表达式禁止为赋值表达式', '1', null, null, null, '强制类', '禁止在非赋值表达式中出现赋值操作符', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('920', 'ArrayOutofIndex', '5.1.6.2 数组使用应保证不会出现越界', '1', null, null, null, '强制类', '索引{0}超出数组大小{1}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('921', 'ValueOutofBound', '5.1.6.3 变量在运算过程中不应出现非预期的数据溢出', '1', null, null, null, '强制类', '{0}超出了{1}类型的{2}所定义的范围', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('922', 'NoShiftForSigned', '5.1.6.4 禁止对有符号类型变量进行移位运算', '1', null, null, null, '强制类', '对有符号类型{0}进行了移位运算', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('923', 'ShiftToOverflow', '5.1.6.5 对变量进行移位运算应保证不会产生溢出', '1', null, null, null, '强制类', '变量{0}是{1}类型，只有{2}位', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('924', 'DoNotAssignNegToUnsigned', '5.1.6.6 禁止给无符号变量赋负值', '1', null, null, null, '强制类', '给{0}类型的变量{1}赋了负值', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('925', 'NoLessThan2BitsForSigned', '5.1.6.7 有符号类型的位长度必须大于等于两位', '1', null, null, null, '强制类', '有符号类型{0}的位长度为{1}，小于两位', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('926', 'BitDefForInteger', '5.1.6.8 位的定义应是有符号整数或无符号整数', '1', null, null, null, '强制类', '位的定义是{0},不是有符号或无符号的整数', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('927', 'ArrayIndexInteger', '5.1.6.9 数组下标应是整型', '1', null, null, null, '强制类', '数组下标必须是整数', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('928', 'NoLogicalNOT2Const', '5.1.6.10 禁止对常数值做逻辑非的运算', '1', null, null, null, '强制类', '禁止对常数值{0}做逻辑非运算', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('929', 'NoBitOperForSigned', '5.1.6.11 禁止对有符号类型使用位运算', '1', null, null, null, '强制类', '对有符号类型{0}进行位运算', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('930', 'IllegalUseEnum', '5.1.6.12 枚举类型变量操作应类型一致', '1', null, null, null, '强制类', '枚举值{0}越限使用：只能用于与其它枚举类型进行比较', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('931', 'NoAssignmentInLogicExpr', '5.1.6.13 禁止在关系表达式和逻辑表达式中用赋值操作符', '1', null, null, null, '强制类', '赋值操作符{0}与逻辑操作符{1}连用', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('932', 'NotUseBitOperatorToBoolean', '5.1.6.14 禁止位操作符与关系表达式或逻辑表达式相连接', '1', null, null, null, '强制类', '禁止用位操作符{0}操作布尔值{1}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('933', 'CarefulToUseComma', '5.1.6.15 除for循环的循环变量赋初值及循环变量增值语句外，禁止使用逗号操作符', '1', null, null, null, '强制类', '尽量避免使用逗号操作符', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('934', 'HexNumInBitExpr', '5.1.6.16 位操作(除移位操作外)语句中的立即数应显式使用16进制数', '1', null, null, null, '强制类', '位操作的语句应该显式使用16进制数', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('935', 'NoMixedUseIncAndDec', '5.1.6.17 同一个表达式中，禁止自增\"++\"和自减\"--\"运算符同其他运算符混合运算', '1', null, null, null, '强制类', '自增（++）和自减（--）运算符不应同其他运算符混合在一起', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('936', 'IntegerCastToRealNumberBeforeRealCompute', '5.1.6.18 进行实数运算操作前，应先将整数转换为实数', '1', null, null, null, '强制类', '整数{0}在进行实数运算操作前，必须先转换为实数类型', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('937', 'CastToBastTypeWhenBitComputeWithUnsignedCharOrInt', '5.1.6.19 位运算符\"~\"和\"<<\"应用于unsigned char或unsigned short操作数时,运算结果应强制转换为操作数的类型', '1', null, null, null, '强制类', '运算符 {0}应用在基本类型为unsigned {1}的操作数{2},结果应该强制转换为unsigned {1}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('938', 'ShiftNeg', '5.1.6.20 禁止移位操作的右操作数为负数', '1', null, null, null, '强制类', '移位操作符{0}中右操作数为负数', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('939', 'TwoOperandsWithParenExceptPlusMinusStarDivMod', '5.1.6.21 除仅包含\"+\"、\"-\"、\"*\"、\"/\"、\"%\"运算符的表达式外，使用双目运算符时，应使用括号来显式标明优先级', '1', null, null, null, '强制类', '双目运算符{0}必须使用括号来显式标明优先级', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('940', 'FormalAndRealEqualCount2014', '5.1.7.1 实参与形参个数应一致', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('941', 'StaticFunctionRule', '5.1.7.2 static类型的函数在所在文件中应被调用', '1', null, null, null, '强制类', 'static类型的函数{0}在文件中没有被调用', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('942', 'MultiFuncCallInSingleExpr', '5.1.7.3 禁止在同一个表达式中调用多个相关函数', '1', null, null, null, '强制类', '在同一个表达式中调用了多个相关函数', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('943', 'NoVoidFuncInExpr', '5.1.7.4 禁止void类型的函数用在表达式中', '1', null, null, null, '强制类', 'void类型的函数{0}用在表达式中', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('944', 'RealParaTypeRule', '5.1.7.5 函数的实参和形参类型应一致', '1', null, null, null, '强制类', '第{0}个实参{1}和形参{2}类型不匹配', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('945', 'FuncParaTypeRule', '5.1.7.6 函数定义的参数类型和函数声明中的参数类型应一致', '1', null, null, null, '强制类', '函数{0}{1}，不一致 ', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('946', 'UnusedArgs', '5.1.7.7 禁止函数参数在函数体内未被使用', '1', null, null, null, '强制类', '函数参数{0}在函数调用中未被使用', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('947', 'NoEffectStatement', '5.1.8.1 禁止使用不起作用的语句', '1', null, null, null, '强制类', '语句没有起作用', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('948', 'NotSizeofExpressionType', '5.1.8.2 禁止对表达式使用sizeof操作符', '1', null, null, null, '强制类', '禁止对表达式{0}使用sizeof操作符', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('949', 'NonVoidFuncRet', '5.1.9.1 非void类型的函数应有返回语句', '1', null, null, null, '强制类', '非void类型函数{0}必须有返回语句', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('950', 'VoidFuncNoRet', '5.1.9.2 禁止void类型的函数中return语句带返回值', '1', null, null, null, '强制类', 'void类型的函数中return语句带返回值', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('951', 'ReturnValueForNonVoidFunc', '5.1.9.3 有返回值的函数return语句应带有返回值', '1', null, null, null, '强制类', '有返回值的函数中return必须带有返回值', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('952', 'FunctionRetTypeRule', '5.1.9.4 函数返回类型应与函数定义的返回类型一致', '1', null, null, null, '强制类', '在返回类型为{0}的函数中返回类型{1}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('953', 'FuncDeclAndDefTypeSame', '5.1.9.5 函数声明和函数定义的返回类型应一致', '1', null, null, null, '强制类', '函数{0}的定义返回类型是{1}，声明返回类型是{2}，不一致', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('954', 'NoRecursiveComments', '5.1.10.1 禁止使用嵌套的注释(多行注释之间的嵌套)', '1', null, null, null, '强制类', '禁止使用嵌套的注释', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('955', 'CommentRate20', '5.1.10.2 注释率不能低于20%', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('956', 'LoopVarType', '5.1.11.1 应使用整型变量做为for循环的循环变量', '1', null, null, null, '强制类', '循环变量{0}类型是{1}，不合适', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('957', 'NoGlobalLoopVar', '5.1.11.2 循环变量应局部声明', '1', null, null, null, '强制类', '循环变量{0}是全局变量', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('958', 'NotUseContinue', '5.1.11.3 禁止使用continue语句', '1', null, null, null, '强制类', '尽量避免使用continue', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('959', 'CounterWithoutIncDecConExpOnlyWithGTGTELTLTE', '5.1.11.4 若for循环变量不是每次被加1或被减1，则在循环条件表达式中，循环变量只能被用做\"<=\"、\"<\"、\">\"或\">=\"的操作数 ', '1', null, null, null, '强制类', '循环计数{0}没有用 -- 或 ++ 修改时，在循环条件表达式中，只能用＜＝、＜、＞或＞＝操作循环计数', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('960', 'NotChangeCounterExceptByIncException2', '5.1.11.5 for循环变量不能在循环变量增值语句以外被修改', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('961', 'NotChangeOtherLoopVarExceptCounter', '5.1.11.6 除for循环循环变量外不应在循环条件表达式或循环变量增值表达式中修改循环变量', '1', null, null, null, '强制类', '非循环计数的循环控制变量{0}不能在循环条件表达式 或循环变量增值表达式中修改', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('962', 'NoCastPointerType', '5.1.12.1 禁止将其他类型变量强制转换为指针变量', '1', null, null, null, '强制类', '非指针类型{0}值{1}被强制类型转换为指针类型{2}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('963', 'SignedCastUnsignedRule', '5.1.12.2 禁止signed和unsigned之间隐式转换', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('964', 'UninitializedValuesRule1', '5.1.13.1 变量使用前应被赋值', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('965', 'EnumMemberInitComplete', '5.1.13.2 枚举元素的初始化应完整', '1', null, null, null, '强制类', ' 枚举元素初始化必须完整', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('966', 'StructInitRule', '5.1.13.3 结构体成员变量初始化的类型应与定义一致', '1', null, null, null, '强制类', '结构体变量{0}初始化类型与定义不一致；{1}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('967', 'StructNestingRule', '5.1.13.4 嵌套结构体初始化时应使用大括号说明嵌套结构', '1', null, null, null, '强制类', '结构体变量初始化存在嵌套不一致', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('968', 'ArrayInitComplete', '5.1.13.5 数组的初始化应完整', '1', null, null, null, '强制类', '数组的初始化必须完整', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('969', 'EnumeratorInt', '5.1.13.6 枚举类型的元素应初始化为整型', '1', null, null, null, '强制类', '枚举类型的变量成员{0}初始化值为{1}，不是整型', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('970', 'NoLogicExprInSwitch', '5.1.14.1 switch语句中的表达式禁止是逻辑表达式', '1', null, null, null, '强制类', 'switch语句中禁止是逻辑表达式', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('971', 'NoEqualCompareRealNumber', '5.1.14.2 禁止对实数类型的量做是否相等的比较', '1', null, null, null, '强制类', '实数类型的量{0}不能做是否相等的比较', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('972', 'EnumMemberNameRule', '5.1.15.1 禁止枚举类型的元素与变量重名', '1', null, null, null, '强制类', '枚举类型中的元素{0}与已有的变量名{1}重名', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('973', 'LocalGlobalNamingRule', '5.1.15.2 禁止局部变量与全局变量同名', '1', null, null, null, '强制类', '局部变量{0}与全局变量{1}同名', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('974', 'FormalParaAndGlobalRule', '5.1.15.3 禁止函数形参与全局变量同名', '1', null, null, null, '强制类', '形参{0}和全局变量{1}同名', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('975', 'VarAndTypedefNameSame', '5.1.15.4 禁止函数形参与通过typedef定义的类型标识符同名', '1', null, null, null, '强制类', null, null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('976', 'TypedefBasicType', '5.2.1.1 推荐在同一变量声明头文件中使用typedef定义软件使用的变量类型', '3', null, null, null, '推荐类', '基本变量类型{0}未使用typedef在统一的变量声明头文件中重新定义', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('977', 'FuncParaNoMoreThan20', '5.2.1.2 函数中避免使用过多的参数，不宜超过20个', '3', null, null, null, '推荐类', '函数{0}中有{1}个参数，超过20个', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('978', 'NotUseBitFieldInStruct', '5.2.1.3 在结构体定义中谨慎使用位域', '3', null, null, null, '推荐类', '在结构体的定义中，成员{0}使用了位域', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('979', 'CarefulToUseUnion', '5.2.1.4 谨慎使用联合体(union)', '3', null, null, null, '推荐类', '谨慎使用联合的声明', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('980', 'CharTypeDefine', '5.2.1.5 字符类型应标明是否有符号', '3', null, null, null, '推荐类', '字符类型{0}没有标明有符号还是无符号', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('981', 'AddressDefineInHeadFile', '5.2.1.6 尽量在统一的头文件中使用宏对程序中用到的硬件地址进行定义', '3', null, null, null, '推荐类', '硬件地址{0}未在头文件中使用用宏进行定义', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('982', 'ConstDefinedVolatile', '5.2.1.7 对于无法缓存的数据建议使用volatile关键字', '3', null, null, null, '推荐类', '接口地址指针使用 volatile 定义', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('983', 'MaxFuncLengthRule', '5.2.2.1 一个函数中的程序总行不宜超过200行', '3', null, null, null, '推荐类', '函数{0}的程序总行为{1}超过200', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('984', 'ThenElseCurly', '5.2.2.2 if语句中的执行语句推荐使用大括号括起来', '3', null, null, null, '推荐类', 'then_else中的语句应用大括号括起来', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('985', 'NotUseSingleComment', '5.2.2.3 尽量不使用单行注释', '3', null, null, null, '推荐类', ' 尽量不使用单行注释{0}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('986', 'EmptyCaseRule', '5.2.3.1 避免switch语句的case中无语句，如为软件特殊设计需加注释进行说明', '3', null, null, null, '推荐类', 'case分支内没有语句', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('987', 'NoBreakInCase', '5.2.3.2 避免switch的case语句不是由break终止，如为软件特殊设计需加注释进行说明', '3', null, null, null, '推荐类', 'case语句不是由break终止', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('988', 'EnumSwitchCoverCaseRule', '5.2.3.3 避免当switch语句的表达式是枚举类型时缺少case分支', '3', null, null, null, '推荐类', '缺少case {0}分支', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('989', 'ComplexityRule', '5.2.3.4 尽量避免模块的圈复杂度超过10，同时基本复杂度超过4的情况', '3', null, null, null, '推荐类', '函数的圈复杂度为{0},超过10', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('990', 'NoDeclFuncPointer', '5.2.4.1 谨慎使用函数指针', '3', null, null, null, '推荐类', '将函数声明为指针类型{0}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('991', 'NoComparePointers', '5.2.4.2 谨慎使用指针的逻辑比较', '3', null, null, null, '推荐类', '{0}进行了逻辑比较', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('992', 'PointerInAlgebraOpera', '5.2.4.3 谨慎对指针进行代数运算', '3', null, null, null, '推荐类', '指针{0}进行了代数运算', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('993', 'NotUseLongjmp', '5.2.5 尽量避免使用setjmp/longjmp', '3', null, null, null, '推荐类', '使用了{0}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('994', 'NotAssignVarDiffTypeValue', '5.2.6.1 尽量避免给变量赋的值与变量的类型不一致', '3', null, null, null, '推荐类', '变量类型是{0}，赋值类型是{1}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('995', 'NoCompUnsignedToZero', '5.2.6.2 避免对无符号数进行大于等于零或小于零的比较', '3', null, null, null, '推荐类', '对无符号数{0}进行大于等于零或小于零的比较', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('996', 'CarefulUseDiffTypeVar4MixOpera', '5.2.6.3 谨慎使用不同类型变量的混合运算', '3', null, null, null, '推荐类', '{0}类型的{1}与{2}类型的{3}进行了混合运算', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('997', 'NotUseFuncInNocallway', '5.2.7 尽量不要以非调用方式使用函数', '3', null, null, null, '推荐类', '以非调用方式使用函数{0}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('998', 'NoPlusAssignAndMinusAssignRule', '5.2.8.1 尽量避免使用\"+=\"或\"-=\"操作符', '3', null, null, null, '推荐类', '尽量避免用+=或-=操作符', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('999', 'NotUseThreeExpr', '5.2.8.2 尽量避免使用三重的表达式', '3', null, null, null, '推荐类', '尽量避免使用三重的表达式', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('1000', 'OctalNumberRule', '5.2.8.3 谨慎使用八进制数', '3', null, null, null, '推荐类', '使用了八进制数{0}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('1001', 'RegisterVarRule', '5.2.8.4 谨慎使用寄存器变量', '3', null, null, null, '推荐类', '使用了寄存器变量{0}', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('1002', 'EmptyStatementRule', '5.2.8.5 尽量避免使用空语句', '3', null, null, null, '推荐类', '尽量避免使用空语句', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('1003', 'InfiniteLoop', '5.2.9 谨慎使用无限循环', '3', null, null, null, '推荐类', '使用无限循环应严格审查', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('1004', 'NotUseIntExpInLogicExpr', '5.2.10 尽量避免条件判断语句中的控制表达式不是关系表达式或逻辑表达式', '3', null, null, null, '推荐类', '{0}语句的判断条件{1}不是逻辑表达式', null, '2017-10-24 14:14:38', null, null, '10');
INSERT INTO `saci_checker` VALUES ('1005', 'FunctionNameNoFieldRule', '5.1.1.1 禁止函数名被用作变量名或常量名', '3', null, null, null, '编程规范分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1006', 'RedeclareFunc', '5.1.1.2 禁止多次声明同一函数', '3', null, null, null, '编程规范分析', '函数{0}和{1}重声明', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1007', 'MultiLabelRule', '5.1.1.3 禁止使用多重标号', '3', null, null, null, '编程规范分析', '存在{0}个标号,{1}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1008', 'TypedefRedefinition', '5.1.1.4 禁止对typedef自定义的类型进行重新定义', '1', null, null, null, '编程规范分析', '重新定义typedef自定义的类型名{0}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1009', 'VoidDupDefVarWithDiffTypeInFuncRule', '5.1.1.5 禁止在同一函数内使用不同的类型重新定义局部变量', '1', null, null, null, '数据流分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1010', 'UnCompletedParaDeclRule', '5.1.1.6 函数的参数定义必须同时包含标识符和类型', '3', null, null, null, '编程规范分析', '形式参数的声明不完整', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1011', 'FormalSpecifyInFuncDecl', '5.1.1.7 在函数的声明中应对参数及类型进行说明', '3', null, null, null, '编程规范分析', '函数{0}声明中没有参数说明', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1012', 'DeclNoDefineForFunc', '5.1.1.8 禁止声明了函数但未对函数进行定义', '1', null, null, null, '编程规范分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1013', 'NoFuncParaVarargsRule', '5.1.1.9 禁止在函数参数表中带有可变数量参数', '3', null, null, null, '编程规范分析', '函数{0}的参数表中禁止使用省略号', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1014', 'NoEmptyFuncParaRule', '5.1.1.10 函数不带参数时应用(void)形式进行说明', '3', null, null, null, '编程规范分析', '函数{0}的参数表为空', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1015', 'UseFuncWithoutDeclRule', '5.1.1.11 函数应具有声明，且声明在函数的定义和调用范围内可见', '1', null, null, null, '编程规范分析', '函数{0}必须有声明', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1016', 'DoNotUseExtDeclInFunc', '5.1.1.12 禁止在函数体内使用外部变量声明', '3', null, null, null, '编程规范分析', ' 禁止在函数体内使用外部声明', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1017', 'ConstSizeArrayFormalParameter', '5.1.1.13 禁止声明为数组的形式参数有固定的大小', '3', null, null, null, '编程规范分析', '做为形参的数组{0}有固定大小', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1018', 'StructDefinition', '5.1.1.14 禁止结构体声明不完整', '3', null, null, null, '编程规范分析', '结构体{0}声明不完整', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1019', 'NotUseNoNameBitFieldInStruct', '5.1.1.15 禁止在结构体中使用无名位域', '3', null, null, null, '编程规范分析', '应避免在结构体中使用无名位域', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1020', 'NoBoundArray', '5.1.1.16 禁止数组没有边界限定', '1', null, null, null, '编程规范分析', '数组{0}没有边界限定', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1021', 'UnusedDecl', '5.1.1.17 禁止声明了函数、变量，但是在程序中未被使用', '1', null, null, null, '数据流分析', '应避免已声明了函数、变量或常量等，但未使用: {0}未使用', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1022', 'UnusedTypedefRule', '5.1.1.18 禁止声明了类型、常量但未被使用', '1', null, null, null, '数据流分析', '类型定义{0}从未被使用', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1023', 'NotDefineWithKeywordInMacro', '5.1.1.19 禁止使用宏重新定义保留字（关键字）', '1', null, null, null, '编程规范分析', '禁止使用宏重新定义保留字（关键字）{0}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1024', 'MacroInParen', '5.1.1.20 应用括号将含参数宏的宏体括起来', '3', null, null, null, '编程规范分析', '宏体{0}未用括号括起来', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1025', 'MacroParaUsedOnce', '5.1.1.21 禁止参数宏的参数使用多于1次', '3', null, null, null, '编程规范分析', '宏参数{0}使用多于1次', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1026', 'IfEndIf', '5.1.1.22 禁止在同一个文件中有#if而没有#endif', '1', null, null, null, '编程规范分析', '禁止在同一文件中有#if没有#endif', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1027', 'HeadFileSurroundWithDefine', '5.1.1.23 每个头文件都应使用预处理指令保护措施避免自身被重复包含', '3', null, null, null, '编程规范分析', '头文件{0}未使用预处理指令保护{1}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1028', 'ExternVarDeclAndDefTypeSame', '5.1.1.24 使用extern声明的变量的类型应与其定义的类型一致', '1', null, null, null, '接口分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1029', 'FuncBodyCurly', '5.1.2.1 函数体必须用大括号括起来', '3', null, null, null, '编程规范分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1030', 'LoopBodyCurly', '5.1.2.2 循环体应用大括号括起来', '3', null, null, null, '编程规范分析', '循环体必须用大括号括起来', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1031', 'BraceLogicExpr', '5.1.2.3 逻辑表达式的连接应使用括号', '1', null, null, null, '编程规范分析', '逻辑表达式的连接没有使用括号', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1032', 'MacroParaInParen', '5.1.2.4 宏参数应用括号括起来', '3', null, null, null, '编程规范分析', '宏参数{0}未用括号括起来', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1033', 'EmbeddedASMRule', '5.1.2.5 嵌入汇编程序的函数应是纯汇编程序', '3', null, null, null, '编程规范分析', '汇编中使用了局部变量{0}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1034', 'NoExecutableCodeBeforeInclude', '5.1.2.6 禁止在include语句之前存在可执行代码', '3', null, null, null, '编程规范分析', '{0}前有可执行代码', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1035', 'NotUseSingle_l_O_VariableRule', '5.1.2.7 禁止单独使用小写字母l和大写字母O作为变量名', '3', null, null, null, '编程规范分析', '禁止单独使用小写l或大写O做为变量名', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1036', 'NoStatementInIfThenRule', '5.1.3.1 禁止条件判别的真分支无执行语句', '3', null, null, null, '控制流分析', 'if-then分支无执行语句', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1037', 'NoStatementInElseRule', '5.1.3.2 禁止单if语句的else分支无执行语句', '3', null, null, null, '控制流分析', 'else分支无执行语句', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1038', 'NoElse', '5.1.3.3 if elseif分支语句中应有else分支，在最后的else语句中，应执行适当的动作，或给出恰当的注释以说明为何没有执行动作（注释关键字为\"特殊设计\"）', '3', null, null, null, '控制流分析', 'if elseif分支语句末尾无else分支', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1039', 'SwitchNoDefault', '5.1.3.4 在switch语句中应有default语句', '1', null, null, null, '控制流分析', '在switch语句中必须有default语句', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1040', 'ReturnAddrOfLocalsRule', '5.1.4.1 禁止返回指向局部变量的指针', '1', null, null, null, '编程规范分析', '将指向局部变量{0}的指针返回给过程指针', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1041', 'MoreThan2LPointer', '5.1.4.2 禁止指针的指针超过两级', '3', null, null, null, '编程规范分析', '指针{0}超过两级', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1042', 'NotSizeofPointerType', '5.1.4.3 禁止对指针类型变量进行sizeof操作', '3', null, null, null, '编程规范分析', '禁止使用指针类型的sizeof操作', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1043', 'DoNotUseGOTO', '5.1.5 禁止使用goto语句', '3', null, null, null, '控制流分析', '禁止使用goto语句', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1044', 'NoAssignmentInNonAssigmentExpr', '5.1.6.1 条件判断语句中的控制表达式禁止为赋值表达式', '1', null, null, null, '表达式分析', '禁止在非赋值表达式中出现赋值操作符', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1045', 'ArrayOutofIndex', '5.1.6.2 数组使用应保证不会出现越界', '1', null, null, null, '表达式分析', '索引{0}超出数组大小{1}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1046', 'ValueOutofBound', '5.1.6.3 变量在运算过程中不应出现非预期的数据溢出', '1', null, null, null, '表达式分析', '{0}超出了{1}类型的{2}所定义的范围', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1047', 'NoShiftForSigned', '5.1.6.4 禁止对有符号类型变量进行移位运算', '1', null, null, null, '表达式分析', '对有符号类型{0}进行了移位运算', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1048', 'ShiftToOverflow', '5.1.6.5 对变量进行移位运算应保证不会产生溢出', '1', null, null, null, '表达式分析', '变量{0}是{1}类型，只有{2}位', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1049', 'DoNotAssignNegToUnsigned', '5.1.6.6 禁止给无符号变量赋负值', '1', null, null, null, '表达式分析', '给{0}类型的变量{1}赋了负值', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1050', 'NoLessThan2BitsForSigned', '5.1.6.7 有符号类型的位长度必须大于等于两位', '1', null, null, null, '表达式分析', '有符号类型{0}的位长度为{1}，小于两位', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1051', 'BitDefForInteger', '5.1.6.8 位的定义应是有符号整数或无符号整数', '1', null, null, null, '表达式分析', '位的定义是{0},不是有符号或无符号的整数', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1052', 'ArrayIndexInteger', '5.1.6.9 数组下标应是整型', '1', null, null, null, '表达式分析', '数组下标必须是整数', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1053', 'NoLogicalNOT2Const', '5.1.6.10 禁止对常数值做逻辑非的运算', '1', null, null, null, '表达式分析', '禁止对常数值{0}做逻辑非运算', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1054', 'NoBitOperForSigned', '5.1.6.11 禁止对有符号类型使用位运算', '1', null, null, null, '表达式分析', '对有符号类型{0}进行位运算', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1055', 'IllegalUseEnum', '5.1.6.12 枚举类型变量操作应类型一致', '1', null, null, null, '接口分析', '枚举值{0}越限使用：只能用于与其它枚举类型进行比较', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1056', 'NoAssignmentInLogicExpr', '5.1.6.13 禁止在关系表达式和逻辑表达式中用赋值操作符', '1', null, null, null, '表达式分析', '赋值操作符{0}与逻辑操作符{1}连用', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1057', 'NotUseBitOperatorToBoolean', '5.1.6.14 禁止位操作符与关系表达式或逻辑表达式相连接', '1', null, null, null, '表达式分析', '禁止用位操作符{0}操作布尔值{1}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1058', 'CarefulToUseComma', '5.1.6.15 除for循环的循环变量赋初值及循环变量增值语句外，禁止使用逗号操作符', '1', null, null, null, '表达式分析', '尽量避免使用逗号操作符', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1059', 'HexNumInBitExpr', '5.1.6.16 位操作(除移位操作外)语句中的立即数应显式使用16进制数', '1', null, null, null, '表达式分析', '位操作的语句应该显式使用16进制数', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1060', 'NoMixedUseIncAndDec', '5.1.6.17 同一个表达式中，禁止自增\"++\"和自减\"--\"运算符同其他运算符混合运算', '3', null, null, null, '编程规范分析', '自增（++）和自减（--）运算符不应同其他运算符混合在一起', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1061', 'IntegerCastToRealNumberBeforeRealCompute', '5.1.6.18 进行实数运算操作前，应先将整数转换为实数', '1', null, null, null, '表达式分析', '整数{0}在进行实数运算操作前，必须先转换为实数类型', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1062', 'CastToBastTypeWhenBitComputeWithUnsignedCharOrInt', '5.1.6.19 位运算符\"~\"和\"<<\"应用于unsigned char或unsigned short操作数时,运算结果应强制转换为操作数的类型', '1', null, null, null, '表达式分析', '运算符 {0}应用在基本类型为unsigned {1}的操作数{2},结果应该强制转换为unsigned {1}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1063', 'ShiftNeg', '5.1.6.20 禁止移位操作的右操作数为负数', '1', null, null, null, '表达式分析', '移位操作符{0}中右操作数为负数', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1064', 'TwoOperandsWithParenExceptPlusMinusStarDivMod', '5.1.6.21 除仅包含\"+\"、\"-\"、\"*\"、\"/\"、\"%\"运算符的表达式外，使用双目运算符时，应使用括号来显式标明优先级', '1', null, null, null, '表达式分析', '双目运算符{0}必须使用括号来显式标明优先级', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1065', 'FormalAndRealEqualCount2014', '5.1.7.1 实参与形参个数应一致', '1', null, null, null, '接口分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1066', 'StaticFunctionRule', '5.1.7.2 static类型的函数在所在文件中应被调用', '1', null, null, null, '编程规范分析', 'static类型的函数{0}在文件中没有被调用', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1067', 'MultiFuncCallInSingleExpr', '5.1.7.3 禁止在同一个表达式中调用多个相关函数', '1', null, null, null, '编程规范分析', '在同一个表达式中调用了多个相关函数', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1068', 'NoVoidFuncInExpr', '5.1.7.4 禁止void类型的函数用在表达式中', '1', null, null, null, '表达式分析', 'void类型的函数{0}用在表达式中', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1069', 'RealParaTypeRule', '5.1.7.5 函数的实参和形参类型应一致', '1', null, null, null, '接口分析', '第{0}个实参{1}和形参{2}类型不匹配', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1070', 'FuncParaTypeRule', '5.1.7.6 函数定义的参数类型和函数声明中的参数类型应一致', '1', null, null, null, '接口分析', '函数{0}{1}，不一致 ', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1071', 'UnusedArgs', '5.1.7.7 禁止函数参数在函数体内未被使用', '3', null, null, null, '编程规范分析', '函数参数{0}在函数调用中未被使用', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1072', 'NoEffectStatement', '5.1.8.1 禁止使用不起作用的语句', '1', null, null, null, '控制流分析', '语句没有起作用', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1073', 'NotSizeofExpressionType', '5.1.8.2 禁止对表达式使用sizeof操作符', '3', null, null, null, '编程规范分析', '禁止对表达式{0}使用sizeof操作符', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1074', 'NonVoidFuncRet', '5.1.9.1 非void类型的函数应有返回语句', '1', null, null, null, '控制流分析', '非void类型函数{0}必须有返回语句', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1075', 'VoidFuncNoRet', '5.1.9.2 禁止void类型的函数中return语句带返回值', '1', null, null, null, '控制流分析', 'void类型的函数中return语句带返回值', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1076', 'ReturnValueForNonVoidFunc', '5.1.9.3 有返回值的函数return语句应带有返回值', '1', null, null, null, '控制流分析', '有返回值的函数中return必须带有返回值', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1077', 'FunctionRetTypeRule', '5.1.9.4 函数返回类型应与函数定义的返回类型一致', '1', null, null, null, '接口分析', '在返回类型为{0}的函数中返回类型{1}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1078', 'FuncDeclAndDefTypeSame', '5.1.9.5 函数声明和函数定义的返回类型应一致', '3', null, null, null, '接口分析', '函数{0}的定义返回类型是{1}，声明返回类型是{2}，不一致', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1079', 'NoRecursiveComments', '5.1.10.1 禁止使用嵌套的注释(多行注释之间的嵌套)', '3', null, null, null, '编程规范分析', '禁止使用嵌套的注释', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1080', 'LoopVarType', '5.1.11.1 应使用整型变量做为for循环的循环变量', '1', null, null, null, '编程规范分析', '循环变量{0}类型是{1}，不合适', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1081', 'NoGlobalLoopVar', '5.1.11.2 循环变量应局部声明', '1', null, null, null, '编程规范分析', '循环变量{0}是全局变量', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1082', 'NotUseContinue', '5.1.11.3 禁止使用continue语句', '3', null, null, null, '编程规范分析', '尽量避免使用continue', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1083', 'CounterWithoutIncDecConExpOnlyWithGTGTELTLTE', '5.1.11.4 若for循环变量不是每次被加1或被减1，则在循环条件表达式中，循环变量只能被用做\"<=\"、\"<\"、\">\"或\">=\"的操作数', '3', null, null, null, '表达式分析', '循环计数{0}没有用 -- 或 ++ 修改时，在循环条件表达式中，只能用＜＝、＜、＞或＞＝操作循环计数', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1084', 'NotChangeCounterExceptByIncException2', '5.1.11.5 for循环变量不能在循环变量增值语句以外被修改', '1', null, null, null, '控制流分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1085', 'NotChangeOtherLoopVarExceptCounter', '5.1.11.6 除for循环循环变量外不应在循环条件表达式或循环变量增值表达式中修改循环变量', '1', null, null, null, '控制流分析', '非循环计数的循环控制变量{0}不能在循环条件表达式 或循环变量增值表达式中修改', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1086', 'NoCastPointerType', '5.1.12.1 禁止将其他类型变量强制转换为指针变量', '3', null, null, null, '编程规范分析', '非指针类型{0}值{1}被强制类型转换为指针类型{2}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1087', 'SignedCastUnsignedRule', '5.1.12.2 禁止signed和unsigned之间隐式转换', '3', null, null, null, '编程规范分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1088', 'UninitializedValuesRule1', '5.1.13.1 变量使用前应被赋值', '1', null, null, null, '数据流分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1089', 'EnumMemberInitComplete', '5.1.13.2 枚举元素的初始化应完整', '1', null, null, null, '数据流分析', ' 枚举元素初始化必须完整', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1090', 'StructInitRule', '5.1.13.3 结构体成员变量初始化的类型应与定义一致', '1', null, null, null, '接口分析', '结构体变量{0}初始化类型与定义不一致；{1}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1091', 'StructNestingRule', '5.1.13.4 嵌套结构体初始化时应使用大括号说明嵌套结构', '3', null, null, null, '编程规范分析', '结构体变量初始化存在嵌套不一致', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1092', 'ArrayInitComplete', '5.1.13.5 数组的初始化应完整', '1', null, null, null, '数据流分析', '数组的初始化必须完整', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1093', 'EnumeratorInt', '5.1.13.6 枚举类型的元素应初始化为整型', '1', null, null, null, '编程规范分析', '枚举类型的变量成员{0}初始化值为{1}，不是整型', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1094', 'NoLogicExprInSwitch', '5.1.14.1 switch语句中的表达式禁止是逻辑表达式', '1', null, null, null, '编程规范分析', 'switch语句中禁止是逻辑表达式', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1095', 'NoEqualCompareRealNumber', '5.1.14.2 禁止对实数类型的量做是否相等的比较', '1', null, null, null, '表达式分析', '实数类型的量{0}不能做是否相等的比较', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1096', 'EnumMemberNameRule', '5.1.15.1 禁止枚举类型的元素与变量重名', '3', null, null, null, '编程规范分析', '枚举类型中的元素{0}与已有的变量名{1}重名', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1097', 'LocalGlobalNamingRule', '5.1.15.2 禁止局部变量与全局变量同名', '1', null, null, null, '编程规范分析', '局部变量{0}与全局变量{1}同名', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1098', 'FormalParaAndGlobalRule', '5.1.15.3 禁止函数形参与全局变量同名', '1', null, null, null, '编程规范分析', '形参{0}和全局变量{1}同名', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1099', 'VarAndTypedefNameSame', '5.1.15.4 禁止函数形参与通过typedef定义的类型标识符同名', '1', null, null, null, '编程规范分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1100', 'TypedefBasicType', '5.2.1.1 推荐在同一变量声明头文件中使用typedef定义软件使用的变量类型', '5', null, null, null, '编程规范分析', '基本变量类型{0}未使用typedef在统一的变量声明头文件中重新定义', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1101', 'NotUseBitFieldInStruct', '5.2.1.3 在结构体定义中谨慎使用位域', '5', null, null, null, '编程规范分析', '在结构体的定义中，成员{0}使用了位域', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1102', 'CarefulToUseUnion', '5.2.1.4 谨慎使用联合体(union)', '5', null, null, null, '编程规范分析', '谨慎使用联合的声明', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1103', 'CharTypeDefine', '5.2.1.5 字符类型应标明是否有符号', '5', null, null, null, '编程规范分析', '字符类型{0}没有标明有符号还是无符号', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1104', 'AddressDefineInHeadFile', '5.2.1.6 尽量在统一的头文件中使用宏对程序中用到的硬件地址进行定义', '5', null, null, null, '编程规范分析', '硬件地址{0}未在头文件中使用用宏进行定义', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1105', 'ConstDefinedVolatile', '5.2.1.7 对于无法缓存的数据建议使用volatile关键字', '5', null, null, null, '编程规范分析', '接口地址指针使用 volatile 定义', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1106', 'ThenElseCurly', '5.2.2.2 if语句中的执行语句推荐使用大括号括起来', '5', null, null, null, '编程规范分析', 'then_else中的语句应用大括号括起来', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1107', 'NotUseSingleComment', '5.2.2.3 尽量不使用单行注释', '5', null, null, null, '编程规范分析', ' 尽量不使用单行注释{0}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1108', 'EmptyCaseRule', '5.2.3.1 避免switch语句的case中无语句，如为软件特殊设计需加注释进行说明', '5', null, null, null, '控制流分析', 'case分支内没有语句', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1109', 'NoBreakInCase', '5.2.3.2 避免switch的case语句不是由break终止，如为软件特殊设计需加注释进行说明', '5', null, null, null, '控制流分析', 'case语句不是由break终止', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1110', 'EnumSwitchCoverCaseRule', '5.2.3.3 避免当switch语句的表达式是枚举类型时缺少case分支', '5', null, null, null, '控制流分析', '缺少case {0}分支', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1111', 'NoDeclFuncPointer', '5.2.4.1 谨慎使用函数指针', '5', null, null, null, '编程规范分析', '将函数声明为指针类型{0}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1112', 'NoComparePointers', '5.2.4.2 谨慎使用指针的逻辑比较', '5', null, null, null, '编程规范分析', '{0}进行了逻辑比较', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1113', 'PointerInAlgebraOpera', '5.2.4.3 谨慎对指针进行代数运算', '5', null, null, null, '编程规范分析', '指针{0}进行了代数运算', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1114', 'NotUseLongjmp', '5.2.5 尽量避免使用setjmp/longjmp', '5', null, null, null, '控制流分析', '使用了{0}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1115', 'NotAssignVarDiffTypeValue', '5.2.6.1 尽量避免给变量赋的值与变量的类型不一致', '5', null, null, null, '接口分析', '变量类型是{0}，赋值类型是{1}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1116', 'NoCompUnsignedToZero', '5.2.6.2 避免对无符号数进行大于等于零或小于零的比较', '5', null, null, null, '表达式分析', '对无符号数{0}进行大于等于零或小于零的比较', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1117', 'CarefulUseDiffTypeVar4MixOpera', '5.2.6.3 谨慎使用不同类型变量的混合运算', '5', null, null, null, '表达式分析', '{0}类型的{1}与{2}类型的{3}进行了混合运算', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1118', 'NotUseFuncInNocallway', '5.2.7 尽量不要以非调用方式使用函数', '5', null, null, null, '编程规范分析', '以非调用方式使用函数{0}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1119', 'NoPlusAssignAndMinusAssignRule', '5.2.8.1 尽量避免使用\"+=\"或\"-=\"操作符', '5', null, null, null, '编程规范分析', '尽量避免用+=或-=操作符', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1120', 'NotUseThreeExpr', '5.2.8.2 尽量避免使用三重的表达式', '5', null, null, null, '编程规范分析', '尽量避免使用三重的表达式', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1121', 'OctalNumberRule', '5.2.8.3 谨慎使用八进制数', '5', null, null, null, '编程规范分析', '使用了八进制数{0}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1122', 'RegisterVarRule', '5.2.8.4 谨慎使用寄存器变量', '5', null, null, null, '编程规范分析', '使用了寄存器变量{0}', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1123', 'EmptyStatementRule', '5.2.8.5 尽量避免使用空语句', '5', null, null, null, '控制流分析', '尽量避免使用空语句', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1124', 'InfiniteLoop', '5.2.9 谨慎使用无限循环', '5', null, null, null, '控制流分析', '使用无限循环应严格审查', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1125', 'NotUseIntExpInLogicExpr', '5.2.10 尽量避免条件判断语句中的控制表达式不是关系表达式或逻辑表达式', '5', null, null, null, '表达式分析', '{0}语句的判断条件{1}不是逻辑表达式', null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1126', 'LogicAndBitComputationMistaken', '5.3.1 禁止逻辑运算和按位运算的混淆', '3', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1127', 'NoContinuousComparation', '5.3.2 禁止连续的比较运算', '3', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1128', 'AssignMistakenEqual', '5.3.3 禁止赋值符号=误写为逻辑判断符号==', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1129', 'EqualMistakenAssign', '5.3.4 禁止逻辑判断符号==误写为赋值符号=', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1130', 'ReferrenceTypeWhenVariableWrittenInFunction', '5.3.5 函数中写操作实参和形参必须是指针或者引用类型', '3', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1131', 'NoDifferentIntegerEqualityCompare', '5.3.6 不同类型的整形变量做相等的比较', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1132', 'HeadFileIncludedCallingLibFunctions', '5.3.7 调用库函数时，必须添加相应的头文件依赖（暂支持abs函数）', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1133', 'NoDifferentFloatEqualityComparing', '5.3.9 禁止使用浮点数相等的比较', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1134', 'BitEqualPriority', '5.3.10 应该先进行位操作，在进行布尔操作', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1135', 'StaticDefWithoutType', '5.3.11 静态变量缺少类型定义', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1136', 'NoElseSimpleStatement', '5.3.12 if语句没有else语句', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1137', 'CarefulUseUnsignedTypeSub', '5.3.13 谨慎对两个无符号整型进行减法运算', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1138', 'ContinuesInit', '5.3.14 连续定义初始化错误,逗号误写为分号', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');
INSERT INTO `saci_checker` VALUES ('1139', 'LogicComputationOutOfOrder', '5.3.15 逻辑与或非优先级处理不当', '1', null, null, null, '表达式分析', null, null, '2017-10-24 14:14:38', null, null, '11');

-- ----------------------------
-- Table structure for saci_checkerset
-- ----------------------------
DROP TABLE IF EXISTS `saci_checkerset`;
CREATE TABLE `saci_checkerset` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则集Id',
  `name` varchar(100) DEFAULT NULL COMMENT '规则集名称',
  `description` varchar(255) DEFAULT NULL COMMENT '规则集描述',
  `type` varchar(1) DEFAULT NULL COMMENT '规则集类型',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `delflag` int(1) DEFAULT '0' COMMENT '删除flg',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `checkersetFilePath` varchar(255) DEFAULT NULL COMMENT 'checkerset文件路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='规则集表';

-- ----------------------------
-- Records of saci_checkerset
-- ----------------------------
INSERT INTO `saci_checkerset` VALUES ('7', 'MISRA2004编程规范', 'Misra C 2004编码规范', '0', null, '0', null, '2017-10-24 14:14:38', null, null, 'E:\\ForSpecChecker20170922\\SpecCheckerCMD\\rulesets\\user\\MISRA2004编程规范.xml');
INSERT INTO `saci_checkerset` VALUES ('8', '国军标C语言编程安全子集8114-2013', '国家军用标准C语言编程安全子集8114-2013', '0', null, '0', null, '2017-10-24 14:14:38', null, null, 'E:\\ForSpecChecker20170922\\SpecCheckerCMD\\rulesets\\user\\国军标C语言编程安全子集8114-2013.xml');
INSERT INTO `saci_checkerset` VALUES ('9', '所有内置规则', '型号软件典型故障模式.....', '0', null, '0', null, '2017-10-24 14:14:38', null, null, 'E:\\ForSpecChecker20170922\\SpecCheckerCMD\\rulesets\\user\\所有内置规则.xml');
INSERT INTO `saci_checkerset` VALUES ('10', '航天器C语言软件编程约定2014版', '航天器C语言软件编程约定2014版', '0', null, '0', null, '2017-10-24 14:14:38', null, null, 'E:\\ForSpecChecker20170922\\SpecCheckerCMD\\rulesets\\user\\航天器C语言软件编程约定2014版.xml');
INSERT INTO `saci_checkerset` VALUES ('11', '软件检测站C语言静态分析规范', '软件检测站C语言静态分析规范.....', '0', null, '0', null, '2017-10-24 14:14:38', null, null, 'E:\\ForSpecChecker20170922\\SpecCheckerCMD\\rulesets\\user\\软件检测站C语言静态分析规范.xml');

-- ----------------------------
-- Table structure for saci_checker_tool
-- ----------------------------
DROP TABLE IF EXISTS `saci_checker_tool`;
CREATE TABLE `saci_checker_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `checkerid` int(11) DEFAULT NULL COMMENT '规则ID',
  `toolid` int(11) DEFAULT NULL COMMENT '工具Id',
  `checker_description` varchar(255) DEFAULT NULL COMMENT '工具描述',
  `delflag` varchar(1) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规则工具关系表';

-- ----------------------------
-- Records of saci_checker_tool
-- ----------------------------

-- ----------------------------
-- Table structure for saci_checkup
-- ----------------------------
DROP TABLE IF EXISTS `saci_checkup`;
CREATE TABLE `saci_checkup` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '审查Id',
  `name` varchar(255) DEFAULT NULL COMMENT '审查Id',
  `state` varchar(2) DEFAULT NULL COMMENT '违反情况（-1:未确认；0:违反;1:不违反;2:bug）',
  `severity` int(11) DEFAULT NULL COMMENT '严重程度（1-5分）',
  `analysisresultid` int(11) NOT NULL COMMENT '项目分析Id',
  `delflag` varchar(1) DEFAULT '0' COMMENT '删除标记（0.正常；1.删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '审查备注',
  `createuser` varchar(50) NOT NULL COMMENT '创建者',
  `createdate` datetime NOT NULL COMMENT '创建时间',
  `updateuser` varchar(50) NOT NULL COMMENT '更新者',
  `updatedate` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='审查表';

-- ----------------------------
-- Records of saci_checkup
-- ----------------------------

-- ----------------------------
-- Table structure for saci_default_tool_chain
-- ----------------------------
DROP TABLE IF EXISTS `saci_default_tool_chain`;
CREATE TABLE `saci_default_tool_chain` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '缺省工具链Id， 数据库自动生成',
  `tool_id` int(11) DEFAULT NULL COMMENT '工具id',
  `tool_order` int(11) DEFAULT NULL COMMENT '工具链中工具的执行优先级',
  `delflag` varchar(1) DEFAULT NULL COMMENT '删除标记（0.正常；1.删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='默认工具链';

-- ----------------------------
-- Records of saci_default_tool_chain
-- ----------------------------

-- ----------------------------
-- Table structure for saci_location
-- ----------------------------
DROP TABLE IF EXISTS `saci_location`;
CREATE TABLE `saci_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `violation_id` int(11) DEFAULT NULL COMMENT '规则违反id',
  `begin_line` int(11) DEFAULT NULL COMMENT '开始行号',
  `end_line` int(11) DEFAULT NULL COMMENT '结束行号',
  `begin_column` int(11) DEFAULT NULL COMMENT '开始列号',
  `end_column` int(11) DEFAULT NULL COMMENT '结束列号',
  `source_path` varchar(255) DEFAULT NULL COMMENT '文件地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14725 DEFAULT CHARSET=utf8 COMMENT='错误或者违反所在位置';

-- ----------------------------
-- Records of saci_location
-- ----------------------------

-- ----------------------------
-- Table structure for saci_measure
-- ----------------------------
DROP TABLE IF EXISTS `saci_measure`;
CREATE TABLE `saci_measure` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `name` varchar(255) DEFAULT NULL COMMENT '工程名，文件路径，函数名',
  `sub_class` varchar(20) DEFAULT NULL COMMENT '组件类别',
  `parent_id` int(11) DEFAULT NULL COMMENT '父组件',
  `analysis_id` int(11) DEFAULT NULL COMMENT '该次度量的分析id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=747 DEFAULT CHARSET=utf8 COMMENT='度量组件，包括工程，文件和方法';

-- ----------------------------
-- Records of saci_measure
-- ----------------------------

-- ----------------------------
-- Table structure for saci_metric
-- ----------------------------
DROP TABLE IF EXISTS `saci_metric`;
CREATE TABLE `saci_metric` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `name` varchar(64) DEFAULT NULL COMMENT '度量名称',
  `message_key` varchar(64) DEFAULT NULL COMMENT '度量消息主键',
  `message_value` varchar(64) DEFAULT NULL COMMENT '度量消息',
  `avg` double DEFAULT NULL COMMENT 'avg',
  `max` double DEFAULT NULL COMMENT 'max',
  `max_source` varchar(64) DEFAULT NULL COMMENT 'maxsource',
  `min` double DEFAULT NULL COMMENT 'min',
  `min_source` varchar(64) DEFAULT NULL COMMENT 'minsource',
  `precesion` int(11) DEFAULT NULL COMMENT 'precision',
  `measure_id` int(11) DEFAULT NULL COMMENT 'measure_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25648 DEFAULT CHARSET=utf8 COMMENT='各种度量组件所对应的度量';

-- ----------------------------
-- Records of saci_metric
-- ----------------------------

-- ----------------------------
-- Table structure for saci_project
-- ----------------------------
DROP TABLE IF EXISTS `saci_project`;
CREATE TABLE `saci_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目Id',
  `type` varchar(100) DEFAULT NULL COMMENT '型号',
  `configuration` varchar(100) DEFAULT NULL COMMENT '配置项',
  `version` varchar(100) DEFAULT NULL COMMENT '版本',
  `projecttype` varchar(2) DEFAULT NULL COMMENT '项目类型（0:手动， 1:自动）',
  `typesign` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '项目描述',
  `projectstatus` varchar(64) DEFAULT NULL COMMENT '执行状态（0.未执行；2.成功；3.执行失败；4. 已删除）',
  `compiler` varchar(100) DEFAULT NULL COMMENT '编译器',
  `svnurl` varchar(255) DEFAULT NULL COMMENT 'svn地址',
  `zipname` varchar(255) DEFAULT NULL COMMENT '上传文件名称',
  `svnname` varchar(100) DEFAULT NULL COMMENT 'svn用户名',
  `delflag` varchar(1) DEFAULT NULL COMMENT '删除标记（0.正常；1.删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='项目表';

-- ----------------------------
-- Records of saci_project
-- ----------------------------

-- ----------------------------
-- Table structure for saci_project_tool_instances
-- ----------------------------
DROP TABLE IF EXISTS `saci_project_tool_instances`;
CREATE TABLE `saci_project_tool_instances` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '阶段Id',
  `projectid` int(11) DEFAULT NULL COMMENT '项目Id',
  `tooltypename` varchar(100) DEFAULT NULL COMMENT '类型名称',
  `toolname` varchar(100) NOT NULL COMMENT '工具名',
  `toolchainid` int(11) DEFAULT NULL COMMENT '工具链Id',
  `delflag` varchar(1) DEFAULT NULL COMMENT '删除标记（0.正常；1.删除）',
  `status` varchar(1) DEFAULT '0' COMMENT '工具执行状态（0.未执行；1.执行中；2.已完成；3.执行失败 4：已删除）',
  `processtype` varchar(1) DEFAULT '0' COMMENT '工具运行类型（0:自动;1:工具链;2:手动）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `tooltypestatus` varchar(1) DEFAULT NULL COMMENT '执行状态（0.未执行；2.成功；3.执行失败；4. 已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='项目工具类型表';

-- ----------------------------
-- Records of saci_project_tool_instances
-- ----------------------------

-- ----------------------------
-- Table structure for saci_project_user
-- ----------------------------
DROP TABLE IF EXISTS `saci_project_user`;
CREATE TABLE `saci_project_user` (
  `project_analysis_id` int(11) NOT NULL COMMENT '项目编号',
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`project_analysis_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目-用户';

-- ----------------------------
-- Records of saci_project_user
-- ----------------------------

-- ----------------------------
-- Table structure for saci_staticcheck_tool
-- ----------------------------
DROP TABLE IF EXISTS `saci_staticcheck_tool`;
CREATE TABLE `saci_staticcheck_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分析结果Id',
  `toolname` varchar(100) DEFAULT NULL COMMENT '分析结果Id',
  `instancesid` int(11) DEFAULT NULL COMMENT '工具实例Id',
  `starttime` datetime DEFAULT NULL COMMENT '分析开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '分析结束时间',
  `loc` int(11) DEFAULT NULL COMMENT '代码行数',
  `viocount` int(11) DEFAULT NULL COMMENT '违反数',
  `filecount` int(11) DEFAULT NULL COMMENT '文件数',
  `errorcount` int(11) DEFAULT NULL COMMENT '错误数',
  `compilername` varchar(255) DEFAULT NULL COMMENT '编译器名称',
  `rulesetName` varchar(100) DEFAULT NULL COMMENT '规则集名称',
  `delflag` varchar(1) DEFAULT NULL COMMENT '删除标记（0.正常；1.删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='检查工具表';

-- ----------------------------
-- Records of saci_staticcheck_tool
-- ----------------------------

-- ----------------------------
-- Table structure for saci_tool
-- ----------------------------
DROP TABLE IF EXISTS `saci_tool`;
CREATE TABLE `saci_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工具Id， 数据库自动生成',
  `tool_name` varchar(100) DEFAULT NULL COMMENT '内部使用工具名称，不作为显示试用',
  `tool_alias` varchar(100) DEFAULT NULL COMMENT '工具显示名称',
  `tooltypename` varchar(100) DEFAULT NULL COMMENT '工具类型名称',
  `status` varchar(1) DEFAULT NULL COMMENT '工具可用状态（0:可用， 1：不可用）',
  `delflag` varchar(1) DEFAULT NULL COMMENT '删除标记（0.正常；1.删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `description` varchar(255) DEFAULT NULL COMMENT '工具描述',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  `createuser` varchar(64) DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='工具表';

-- ----------------------------
-- Records of saci_tool
-- ----------------------------
INSERT INTO `saci_tool` VALUES ('21', 'SunwiseAUnit', 'sunwiseAunit', 'unittest', '0', '0', null, 'sunwiseAunit', '2017-12-08 11:09:34', null, '2017-12-08 11:09:34', null);
INSERT INTO `saci_tool` VALUES ('22', 'SpecChecker', 'SpecChecker', 'staticcheck', '0', '0', null, 'SpecChecker', '2017-12-08 11:09:48', null, '2017-12-08 11:09:48', null);

-- ----------------------------
-- Table structure for saci_tool_chain
-- ----------------------------
DROP TABLE IF EXISTS `saci_tool_chain`;
CREATE TABLE `saci_tool_chain` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工具链Id， 数据库自动生成',
  `tool_id` int(11) DEFAULT NULL COMMENT '工具id',
  `project_id` int(11) DEFAULT NULL COMMENT '项目id',
  `tool_order` int(11) DEFAULT NULL COMMENT '工具链中工具的执行优先级',
  `delflag` varchar(1) DEFAULT NULL COMMENT '删除标记（0.正常；1.删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='工具链';

-- ----------------------------
-- Records of saci_tool_chain
-- ----------------------------

-- ----------------------------
-- Table structure for saci_tool_type
-- ----------------------------
DROP TABLE IF EXISTS `saci_tool_type`;
CREATE TABLE `saci_tool_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tool_type_name` varchar(100) DEFAULT NULL COMMENT '内部使用工具类型名称，不作为显示试用',
  `tool_type_alias` varchar(100) DEFAULT NULL COMMENT '工具显示名称',
  `delflag` varchar(1) DEFAULT '0' COMMENT '删除标记（0.正常；1.删除）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `description` varchar(255) DEFAULT NULL COMMENT '工具类型描述',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='工具类型表';

-- ----------------------------
-- Records of saci_tool_type
-- ----------------------------
INSERT INTO `saci_tool_type` VALUES ('1', 'staticcheck', 'static_c1', '0', '静态分析', '静态分析1', '1', '2017-11-29 09:20:09', '1', '2017-12-08 10:09:28');
INSERT INTO `saci_tool_type` VALUES ('2', 'unittest', 'unit_test', '0', '单元测试', '单元测试', '1', '2017-11-29 09:20:09', '1', '2017-11-29 09:20:15');

-- ----------------------------
-- Table structure for saci_unittest_tool
-- ----------------------------
DROP TABLE IF EXISTS `saci_unittest_tool`;
CREATE TABLE `saci_unittest_tool` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分析结果Id',
  `toolname` varchar(100) DEFAULT NULL COMMENT '工具名称',
  `instancesid` int(11) DEFAULT NULL COMMENT '工具实例Id',
  `starttime` datetime DEFAULT NULL COMMENT '分析开始时间',
  `endtime` datetime DEFAULT NULL COMMENT '分析结束时间',
  `state` varchar(1) DEFAULT NULL COMMENT '执行状态（0.未执行；1.执行中；2.已完成；3.执行失败）',
  `compilername` varchar(100) DEFAULT NULL COMMENT '编译器名称',
  `delflag` varchar(1) DEFAULT NULL COMMENT '编译器名称',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `createuser` varchar(50) DEFAULT NULL COMMENT '创建者',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(50) DEFAULT NULL COMMENT '更新者',
  `updatedate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='单元测试工具';

-- ----------------------------
-- Records of saci_unittest_tool
-- ----------------------------

-- ----------------------------
-- Table structure for saci_violation_results
-- ----------------------------
DROP TABLE IF EXISTS `saci_violation_results`;
CREATE TABLE `saci_violation_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `project_analysis_id` int(11) DEFAULT NULL COMMENT '项目id',
  `type` varchar(64) DEFAULT NULL COMMENT '结果类型(0.错误;1.违反)',
  `tool_name` varchar(255) DEFAULT NULL COMMENT '规则所属工具',
  `message` varchar(512) DEFAULT NULL COMMENT '分析结果信息',
  `rule_name` varchar(100) DEFAULT NULL COMMENT '规则名称',
  `rule_description` varchar(255) DEFAULT NULL COMMENT '规则描述',
  `rule_priority` varchar(1) DEFAULT NULL COMMENT '优先级',
  `rule_priority_name` varchar(64) DEFAULT NULL COMMENT '优先级名称',
  `rule_category` varchar(64) DEFAULT NULL COMMENT '规则类别',
  `vio_flag` varchar(20) DEFAULT NULL COMMENT '规则违反标志',
  `vio_desc` varchar(512) DEFAULT NULL COMMENT '规则违反描述',
  `trace` varchar(512) DEFAULT NULL COMMENT '错误描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14741 DEFAULT CHARSET=utf8 COMMENT='规则违反信息';

-- ----------------------------
-- Records of saci_violation_results
-- ----------------------------

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '编号',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) DEFAULT NULL COMMENT '所有父级编号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表; InnoDB free: 34816 kB';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('a9beb8c645ff448d89e71f96dc97bc09', '0', '0,', '中国', '30', '001', '1', '1', '2017-03-26 22:13:14', '1', '2017-06-19 17:07:49', '', '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `smtp` varchar(64) DEFAULT NULL COMMENT '邮箱服务器地址',
  `port` varchar(64) DEFAULT NULL COMMENT '邮箱服务器端口',
  `mailname` varchar(64) DEFAULT NULL COMMENT '系统邮箱地址',
  `mailpassword` varchar(64) DEFAULT NULL COMMENT '系统邮箱密码',
  `smsname` varchar(64) DEFAULT NULL COMMENT '短信用户名',
  `smspassword` varchar(64) DEFAULT NULL COMMENT '短信密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='系统配置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'smtp.ym.163.com', '465', 'yingnan.he@weltown.cn', 'heyn9843', '', '');

-- ----------------------------
-- Table structure for sys_datarule
-- ----------------------------
DROP TABLE IF EXISTS `sys_datarule`;
CREATE TABLE `sys_datarule` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `menu_id` varchar(64) DEFAULT NULL COMMENT '所属菜单',
  `name` varchar(64) DEFAULT NULL COMMENT '数据规则名称',
  `t_field` varchar(64) DEFAULT NULL COMMENT '规则字段',
  `t_express` varchar(64) DEFAULT NULL COMMENT '规则条件',
  `t_value` varchar(64) DEFAULT NULL COMMENT '规则值',
  `sql_segment` varchar(1256) DEFAULT NULL COMMENT '自定义sql',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  `className` varchar(145) DEFAULT NULL COMMENT '实体类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据规则; InnoDB free: 34816 kB';

-- ----------------------------
-- Records of sys_datarule
-- ----------------------------
INSERT INTO `sys_datarule` VALUES ('09876c1700864719a89aab9e69c3a761', '17', '所在公司数据', '', '', '', '(a.id = #{currentUser.company.id} OR (a.parent_id = #{currentUser.company.id} AND a.type = \'2\') OR a.id IS NULL)', '', '0', 'Office');
INSERT INTO `sys_datarule` VALUES ('0b40b8413b204ec98e975a9fd40257ad', '20', '所在部门及以下数据', '', '', '', '(o.id = #{currentUser.office.id} OR o.parent_ids LIKE concat(#{currentUser.office.parentIds},#{currentUser.office.id},\',%\') OR a.id = #{currentUser.id})', '', '0', 'User');
INSERT INTO `sys_datarule` VALUES ('102801d210cc48968ecbbf782a2e7dc1', '7', '仅本人数据', '', '', '', '(u.id = #{currentUser.id})', '', '0', 'Role');
INSERT INTO `sys_datarule` VALUES ('1759dc61849247f79d802dad44fc8bc5', '17', '所在部门及以下数据', '', '', '', '(a.id = #{currentUser.office.id} OR a.parent_ids LIKE concat(#{currentUser.office.parentIds},#{currentUser.office.id},\',%\') OR a.id IS NULL)', '', '0', 'Office');
INSERT INTO `sys_datarule` VALUES ('2e2eb541d6df45c6b0ca36bbc4471d59', '17', '所在公司及以下数据', '', '', '', '(a.id = #{currentUser.company.id} OR a.parent_ids LIKE concat(#{currentUser.company.parentIds},#{currentUser.company.id},\',%\') OR a.id IS NULL)', '', '0', 'Office');
INSERT INTO `sys_datarule` VALUES ('41090bc4161040128bdcaa113a3e34ec', '4f51b2fa967a4a7b86d4abc9e0fd5f7d', 'ee', '', '', '', '', '', '0', '');
INSERT INTO `sys_datarule` VALUES ('5f730a61f80a49c4a823d766570e7bda', '7fe0397a90214f49adc9bbbe48e5ab69', '222', '', '', '', '', '', '0', '');
INSERT INTO `sys_datarule` VALUES ('6af85a03b75643f4ae49ecaff0e0923b', '652ebb5d37d04516b27e222309651edd', 'dddd', '', '', '', '', '', '0', '');
INSERT INTO `sys_datarule` VALUES ('7154d705b59a4efe805bd2568e6abda2', '7', '所在公司数据', '', '', '', '(o.id = #{currentUser.company.id} OR (o.parent_id = #{currentUser.company.id} AND o.type = \'2\') OR u.id = #{currentUser.id})', '', '0', 'Role');
INSERT INTO `sys_datarule` VALUES ('7f4ea2f8f3c44169b0a6ce9078794ec6', '16f34cffe21a431e844895715bf7f1f8', 'yyy', '', '', '', '', '', '0', '');
INSERT INTO `sys_datarule` VALUES ('8505d7d249ab43a8953aa72dca01812a', '20', '所在部门数据', '', '', '', '(o.id = #{currentUser.office.id} OR a.id = #{currentUser.id})', '', '0', 'User');
INSERT INTO `sys_datarule` VALUES ('8871f109676c4680b9dedf2719f415a0', '20', '所在公司数据', '', '', '', '(o.id = #{currentUser.company.id} OR (o.parent_id = #{currentUser.company.id} AND o.type = \'2\') OR a.id = #{currentUser.id})', '', '0', 'User');
INSERT INTO `sys_datarule` VALUES ('8c0da837f3ff4da395f36dc204779115', '20', '仅本人数据', '', '', '', '(a.id = #{currentUser.id})', '', '0', 'User');
INSERT INTO `sys_datarule` VALUES ('92b085a627884d839567596fd378b63a', '20', '所在公司及以下数据', '', '', '', '(o.id = #{currentUser.company.id} OR o.parent_ids LIKE concat(#{currentUser.company.parentIds},#{currentUser.company.id},\',%\') OR a.id = #{currentUser.id})', '', '0', 'User');
INSERT INTO `sys_datarule` VALUES ('94e929fbe54c4584a26d50c80616b922', '9a43a835522f47f681b21ff22cfa5a60', 'eeee', '', '', '', '', '', '0', '');
INSERT INTO `sys_datarule` VALUES ('977263957557476ea76c41493a213444', '7', '所在部门数据', '', '', '', '(o.id = #{currentUser.office.id} OR u.id = #{currentUser.id})', '', '0', 'Role');
INSERT INTO `sys_datarule` VALUES ('99ad10382d8d4287b89412794ee7355f', '7', '所在部门及以下数据', '', '', '', '(o.id = #{currentUser.office.id} OR o.parent_ids LIKE concat(#{currentUser.office.parentIds},#{currentUser.office.id},\',%\') OR u.id = #{currentUser.id})', '', '0', 'Role');
INSERT INTO `sys_datarule` VALUES ('9b61bb267f3948b5944b8136ed2b5fda', '77e091aeb1a14032b2ecdd4a8334cf13', 'bbb', '', '', '', '', '', '0', '');
INSERT INTO `sys_datarule` VALUES ('a0b18ce9c2234816a3b2cc75a8ecad22', '17', '仅本人数据', '', '', '', '(a.id IS NULL)', '', '0', 'Office');
INSERT INTO `sys_datarule` VALUES ('cd133c59687444eaaea6db7742901984', '17', '所在部门数据', '', '', '', '(a.id = #{currentUser.office.id} OR a.id IS NULL)', '', '0', 'Office');
INSERT INTO `sys_datarule` VALUES ('dbc2c7a6d8e4409893cd517d23ce214f', '7', '所在公司及以下数据', '', '', '', '(o.id = #{currentUser.company.id} OR o.parent_ids LIKE concat(#{currentUser.company.parentIds},#{currentUser.company.id},\',%\') OR u.id = #{currentUser.id})', '', '0', 'Role');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('0a22f3278a624882a822e0820f27efcb', '1', '主表', 'table_type', '表类型', '20', '0', '1', '2016-01-05 21:47:14', '1', '2016-01-05 21:53:34', '', '0');
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('100', 'java.util.Date', 'Date', 'gen_java_type', 'Java类型\0\0', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('101', 'com.thinkgem.jeesite.modules.sys.entity.User', 'User', 'gen_java_type', 'Java类型\0\0', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('102', 'com.thinkgem.jeesite.modules.sys.entity.Office', 'Office', 'gen_java_type', 'Java类型\0\0', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('103', 'com.thinkgem.jeesite.modules.sys.entity.Area', 'Area', 'gen_java_type', 'Java类型\0\0', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型\0\0', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告\0\0\0\0', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('1c0ac576c33d41fcb4c16602bf4fad5d', 'post', 'post', 'interface_type', '接口类型', '20', '0', '1', '2015-11-30 15:52:25', '1', '2015-11-30 15:52:39', '', '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('221a918bd1e149239a17ab0fdeaf5ecd', 'get', 'get', 'interface_type', '接口类型', '10', '0', '1', '2015-11-30 15:51:56', '1', '2015-11-30 15:51:56', '', '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('43c9472f411c4d3eafb3bf5319ffe499', '2', '异常报告', 'report_type', '异常的报告', '20', '0', '1', '2015-12-08 17:49:57', '1', '2015-12-08 17:49:57', '', '0');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('5b899603552c48519e7ba8eb9da0b41f', '0', '单表', 'table_type', '表类型', '10', '0', '1', '2016-01-05 21:46:39', '1', '2016-01-05 21:53:50', '', '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('680ddd8c91fe43588a7bb7aafe816633', '1', '正常报告', 'report_type', '正常的报告', '10', '0', '1', '2015-12-08 17:49:28', '1', '2015-12-08 17:49:28', '正常的报告', '0');
INSERT INTO `sys_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('71', '1', '常用流程', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2016-06-19 22:15:01', '', '0');
INSERT INTO `sys_dict` VALUES ('71804c6b820048b09c9f6f2c11121113', 'ace', 'ACE风格', 'theme', '主题方案', '15', '0', '1', '2016-04-20 21:57:21', '1', '2016-04-20 21:57:21', '', '0');
INSERT INTO `sys_dict` VALUES ('72', '2', '办公流程', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2016-06-19 22:15:09', '', '0');
INSERT INTO `sys_dict` VALUES ('73', 'crud', '增删改查', 'gen_category', '代码生成分类', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('74', 'crud_many', '增删改查（包含从表）', 'gen_category', '代码生成分类', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('75', 'tree', '树结构', 'gen_category', '代码生成分类', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('80', 'between', 'Between', 'gen_query_type', '查询方式', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'like', 'Like', 'gen_query_type', '查询方式', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'left_like', 'Left Like', 'gen_query_type', '查询方式', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'right_like', 'Right Like', 'gen_query_type', '查询方式', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('84', 'input', '文本框', 'gen_show_type', '字段生成方案', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('85', 'textarea', '文本域', 'gen_show_type', '字段生成方案', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('86', 'select', '下拉框', 'gen_show_type', '字段生成方案', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('87', 'checkbox', '复选框', 'gen_show_type', '字段生成方案', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('88', 'radiobox', '单选框', 'gen_show_type', '字段生成方案', '50', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('89', 'dateselect', '日期选择', 'gen_show_type', '字段生成方案', '60', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('90', 'userselect', '人员选择\0', 'gen_show_type', '字段生成方案', '70', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('91', 'officeselect', '部门选择', 'gen_show_type', '字段生成方案', '80', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('92', 'areaselect', '区域选择', 'gen_show_type', '字段生成方案', '90', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('95', 'dao', '仅持久层', 'gen_category', '代码生成分类\0\0\0\0\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型\0\0', '30', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型\0\0', '40', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('bde6043665ef4571b85d0edab667cd15', '3', '树结构表', 'table_type', '表类型', '40', '0', '1', '2016-01-06 19:48:50', '1', '2016-01-06 19:48:50', '', '0');
INSERT INTO `sys_dict` VALUES ('cc94b0c5df554a46894991210a5fc486', '2', '附表', 'table_type', '表类型', '30', '0', '1', '2016-01-05 21:47:38', '1', '2016-01-05 21:53:44', '', '0');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `type` varchar(64) DEFAULT NULL COMMENT '类型',
  `description` varchar(64) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('01', 'act_category', '流程分类', '1', '2013-06-03 08:00:00', '1', '2017-01-16 16:12:04', '0');
INSERT INTO `sys_dict_type` VALUES ('02', 'act_type', '流程类型', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('03', 'color', '颜色值', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('04', 'del_flag', '删除标记', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('05', 'gen_category', '代码生成分类', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_type` VALUES ('06', 'gen_java_type', 'Java类型', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_type` VALUES ('07', 'gen_query_type', '查询方式', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_type` VALUES ('08', 'gen_show_type', '字段生成方案', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_type` VALUES ('09', 'interface_type', '接口类型', '1', '2015-11-30 15:52:25', '1', '2015-11-30 15:52:39', '0');
INSERT INTO `sys_dict_type` VALUES ('10', 'oa_leave_type', '请假类型', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('11', 'oa_notify_read', '通知通告状态', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('12', 'sex', '性别', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('13', 'show_hide', '显示/隐藏', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('14', 'sys_area_type', '区域类型', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('15', 'sys_data_scope', '数据范围', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('16', 'sys_log_type', '日志类型', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('17', 'sys_office_common', '快捷通用部门', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('18', 'sys_office_grade', '机构等级', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('19', 'sys_office_type', '机构类型', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('1984aea678274fc4a00413c15c142446', 'schedule_task_info', '定时任务通知', '1', '2017-02-04 17:25:52', '1', '2017-02-07 22:35:39', '0');
INSERT INTO `sys_dict_type` VALUES ('20', 'sys_user_type', '用户类型', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('21', 'table_type', '表类型', '1', '2016-01-05 21:47:14', '1', '2016-01-05 21:53:34', '0');
INSERT INTO `sys_dict_type` VALUES ('22', 'theme', '主题方案', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('23', 'yes_no', '是/否', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_type` VALUES ('23e3cabe5cd448c78223eb61c05e839a', 'schedule_task_group', '定时任务分组', '1', '2017-02-02 23:26:36', '1', '2017-02-02 23:26:36', '0');
INSERT INTO `sys_dict_type` VALUES ('24', 'oa_notify_type', '通知通告类型', '1', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('25', 'oa_notify_status', '通知通告状态', '1', null, null, null, '0');
INSERT INTO `sys_dict_type` VALUES ('60b53562e81144e29d3f67f3edb965f5', 'menu_type', '菜单类型', '1', '2017-04-07 23:23:19', '1', '2017-04-07 23:23:19', '0');
INSERT INTO `sys_dict_type` VALUES ('9392eee3b3f043d39324608c5355b5a6', 'form_style', '表单风格', '1', '2017-05-28 18:19:35', '1', '2017-05-28 18:19:49', '0');
INSERT INTO `sys_dict_type` VALUES ('e83129a6290c46e7926c402969dde632', 'tedian', '特点', '1', '2017-01-24 16:50:46', '1', '2017-01-24 16:50:46', '0');
INSERT INTO `sys_dict_type` VALUES ('ebdd474a9cab463db594c7bc325c7ff4', 't_express', '数据规则', '1', '2017-03-24 23:37:02', '1', '2017-03-24 23:37:02', '0');
INSERT INTO `sys_dict_type` VALUES ('f8ba7433c8954aa1be2b88acba7994ae', 'gen_id_type', '主键类型', '1', '2017-05-28 14:13:59', '1', '2017-05-28 14:13:59', '0');

-- ----------------------------
-- Table structure for sys_dict_value
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_value`;
CREATE TABLE `sys_dict_value` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `dict_type_id` varchar(64) DEFAULT NULL COMMENT '标签名',
  `label` varchar(64) DEFAULT NULL COMMENT '键值',
  `value` varchar(64) DEFAULT NULL COMMENT '排序',
  `sort` varchar(64) DEFAULT NULL COMMENT '外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典值';

-- ----------------------------
-- Records of sys_dict_value
-- ----------------------------
INSERT INTO `sys_dict_value` VALUES ('0a22f3278a624882a822e0820f27efcb', '21', '主表', '1', '20', '1', '2016-01-05 21:47:14', '1', '2016-01-05 21:53:34', '0');
INSERT INTO `sys_dict_value` VALUES ('1', '04', '正常', '0', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('10', '03', '黄色', 'yellow', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('100', '06', 'Date', 'java.util.Date', '50', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('101', '06', 'User', 'com.jeeplus.modules.sys.entity.User', '60', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('102', '06', 'Office', 'com.jeeplus.modules.sys.entity.Office', '70', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('103', '06', 'Area', 'com.jeeplus.modules.sys.entity.Area', '80', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('104', '06', 'Custom', 'Custom', '90', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('105', '24', '会议通告\0\0\0\0', '1', '10', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('106', '24', '奖惩通告\0\0\0\0', '2', '20', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('107', '24', '活动通告\0\0\0\0', '3', '30', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('108', '25', '草稿', '0', '10', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('109', '25', '发布', '1', '20', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('10999522b031406b8b2c30e0f35f8978', '60b53562e81144e29d3f67f3edb965f5', '按钮', '2', '60', '1', '2017-04-07 23:23:50', '1', '2017-04-07 23:23:50', '0');
INSERT INTO `sys_dict_value` VALUES ('11', '03', '橙色', 'orange', '50', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('110', '11', '未读', '0', '10', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('111', '11', '已读', '1', '20', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('12', '22', '默认主题', 'default', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('13', '22', '天蓝主题', 'cerulean', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('14', '22', '橙色主题', 'readable', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('17', '14', '国家', '1', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('18', '14', '省份、直辖市', '2', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('19', '14', '地市', '3', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('1b265b5f6f274429a8298d8e5e40d286', '21', '左树(主表)', '4', '50', '1', '2017-05-28 11:57:19', '1', '2017-05-28 11:57:19', '0');
INSERT INTO `sys_dict_value` VALUES ('1c0ac576c33d41fcb4c16602bf4fad5d', '09', 'post', 'post', '20', '1', '2015-11-30 15:52:25', '1', '2015-11-30 15:52:39', '0');
INSERT INTO `sys_dict_value` VALUES ('2', '04', '删除', '1', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('20', '14', '区县', '4', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('21', '19', '公司', '1', '60', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('22', '19', '部门', '2', '70', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('221a918bd1e149239a17ab0fdeaf5ecd', '09', 'get', 'get', '10', '1', '2015-11-30 15:51:56', '1', '2015-11-30 15:51:56', '0');
INSERT INTO `sys_dict_value` VALUES ('23', '19', '小组', '3', '80', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('24', '19', '其它', '4', '90', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('25', '17', '综合部', '1', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('26', '17', '开发部', '2', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('27', '17', '人力部', '3', '50', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('28', '18', '一级', '1', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('29', '18', '二级', '2', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('3', '13', '显示', '1', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('30', '18', '三级', '3', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('31', '18', '四级', '4', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('32', '15', '所有数据', '1', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('33', '15', '所在公司及以下数据', '2', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('34', '15', '所在公司数据', '3', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('35', '15', '所在部门及以下数据', '4', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('35ee2efb9daa45179328fe49542d8e64', 'ebdd474a9cab463db594c7bc325c7ff4', '大于等于', '&gt;=', '2', '1', '2017-04-01 23:24:37', '1', '2017-04-01 23:24:37', '0');
INSERT INTO `sys_dict_value` VALUES ('36', '15', '所在部门数据', '5', '50', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('367fc7ccd7e5419d9f8a24020f56a99d', 'f8ba7433c8954aa1be2b88acba7994ae', '自增长', '2', '20', '1', '2017-05-28 14:14:22', '1', '2017-05-28 14:14:22', '0');
INSERT INTO `sys_dict_value` VALUES ('37', '15', '仅本人数据', '8', '90', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('38', '15', '按明细设置', '9', '100', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('39', '20', '系统管理', '1', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('39c83ee547644d7ca16e2ba1b1cf0ab7', 'ebdd474a9cab463db594c7bc325c7ff4', '等于', '=', '6', '1', '2017-04-01 23:26:16', '1', '2017-04-01 23:26:16', '0');
INSERT INTO `sys_dict_value` VALUES ('3f61584b8294498e9e95b9f523ed4184', 'e83129a6290c46e7926c402969dde632', '富', '2', '2', '1', '2017-01-24 16:51:08', '1', '2017-01-24 16:51:08', '0');
INSERT INTO `sys_dict_value` VALUES ('4', '13', '隐藏', '0', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('40', '20', '部门经理', '2', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('41', '20', '普通用户', '3', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('4a30f57483d943d48aca8322af6fb3ad', 'e83129a6290c46e7926c402969dde632', '帅', '3', '3', '1', '2017-01-24 16:51:16', '1', '2017-01-24 16:51:16', '0');
INSERT INTO `sys_dict_value` VALUES ('5', '23', '是', '1', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('5746b5cb0d0f424caf99681361d7cc8c', 'f8ba7433c8954aa1be2b88acba7994ae', 'UUID', '1', '10', '1', '2017-05-28 14:14:10', '1', '2017-05-28 14:14:10', '0');
INSERT INTO `sys_dict_value` VALUES ('5b4f93870ce14e449becc07280f31be9', '21', '右表(附表)', '5', '60', '1', '2017-05-28 11:57:48', '1', '2017-05-28 11:57:48', '0');
INSERT INTO `sys_dict_value` VALUES ('5b899603552c48519e7ba8eb9da0b41f', '21', '单表', '0', '10', '1', '2016-01-05 21:46:39', '1', '2016-01-05 21:53:50', '0');
INSERT INTO `sys_dict_value` VALUES ('6', '23', '否', '0', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('62', '10', '公休', '1', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('63', '10', '病假', '2', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('64', '10', '事假', '3', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('65', '10', '调休', '4', '40', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('66', '10', '婚假', '5', '60', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('67', '16', '接入日志', '1', '30', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('68', '16', '异常日志', '2', '40', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('69', '02', '请假流程', 'leave', '10', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('7', '03', '红色', 'red', '10', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('70', '02', '审批测试流程', 'test_audit', '20', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('71', '01', '常用流程', '1', '10', '1', '2013-06-03 08:00:00', '1', '2017-01-07 18:12:27', '0');
INSERT INTO `sys_dict_value` VALUES ('71804c6b820048b09c9f6f2c11121113', '22', 'ACE风格', 'ace', '15', '1', '2016-04-20 21:57:21', '1', '2016-04-20 21:57:21', '0');
INSERT INTO `sys_dict_value` VALUES ('72', '01', '办公流程', '2', '20', '1', '2013-06-03 08:00:00', '1', '2017-01-07 18:12:22', '0');
INSERT INTO `sys_dict_value` VALUES ('73', '05', '增删改查', 'crud', '10', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('74', '05', '增删改查（包含从表）', 'crud_many', '20', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('75', '05', '树结构', 'tree', '30', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('76', '07', '=', '=', '10', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('77', '07', '!=', '!=', '20', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('78', '07', '&gt;', '&gt;', '30', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('79', '07', '&lt;', '&lt;', '40', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('794b27f1d5b14a84a89f658ec1e2b957', 'e83129a6290c46e7926c402969dde632', '高', '1', '1', '1', '2017-01-24 16:50:59', '1', '2017-01-24 16:50:59', '0');
INSERT INTO `sys_dict_value` VALUES ('8', '03', '绿色', 'green', '20', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('80', '07', 'Between', 'between', '50', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('81', '07', 'Like', 'like', '60', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('82', '07', 'Left Like', 'left_like', '70', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('821039da80dd4868adfb63d3f8d8b9ae', '9392eee3b3f043d39324608c5355b5a6', '表单风格', '1', '30', '1', '2017-05-28 18:23:07', '1', '2017-05-28 18:23:33', '0');
INSERT INTO `sys_dict_value` VALUES ('83', '07', 'Right Like', 'right_like', '80', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('84', '08', '文本框', 'input', '10', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('847ebe927e4a4da3820dde1143ad2b85', '9392eee3b3f043d39324608c5355b5a6', 'dialog风格', '2', '20', '1', '2017-05-28 18:23:26', '1', '2017-05-28 18:23:26', '0');
INSERT INTO `sys_dict_value` VALUES ('85', '08', '文本域', 'textarea', '20', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('86', '08', '下拉框', 'select', '30', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('87', '08', '复选框', 'checkbox', '40', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('88', '08', '单选框', 'radiobox', '50', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('89', '08', '日期选择', 'dateselect', '60', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('8a0dca98a94d46a486a796f4288a9863', 'ebdd474a9cab463db594c7bc325c7ff4', '模糊匹配', 'like', '8', '1', '2017-04-01 23:26:53', '1', '2017-04-01 23:26:53', '0');
INSERT INTO `sys_dict_value` VALUES ('9', '03', '蓝色', 'blue', '30', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('90', '08', '人员选择\0', 'userselect', '70', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('91', '08', '部门选择', 'officeselect', '80', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('92', '08', '区域选择', 'areaselect', '90', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('93', '06', 'String', 'String', '10', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('94', '06', 'Long', 'Long', '20', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('95', '05', '仅持久层', 'dao', '40', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('96', '12', '男', '1', '10', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('97', '12', '女', '2', '20', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '0');
INSERT INTO `sys_dict_value` VALUES ('98', '06', 'Integer', 'Integer', '30', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('99', '06', 'Double', 'Double', '40', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', '1');
INSERT INTO `sys_dict_value` VALUES ('9de5be7eea4f492fb726a958cca1d4b0', 'ebdd474a9cab463db594c7bc325c7ff4', '小于', '&lt;', '3', '1', '2017-04-01 23:25:16', '1', '2017-04-01 23:25:16', '0');
INSERT INTO `sys_dict_value` VALUES ('a4de7bc6a5b94d54bac6c577b76e27a2', 'ebdd474a9cab463db594c7bc325c7ff4', '小于等于', '&lt;=', '4', '1', '2017-04-01 23:25:31', '1', '2017-04-01 23:25:31', '0');
INSERT INTO `sys_dict_value` VALUES ('b17aa24594b042319aa6af6564b5d278', '60b53562e81144e29d3f67f3edb965f5', '菜单', '1', '30', '1', '2017-04-07 23:23:40', '1', '2017-04-07 23:23:40', '0');
INSERT INTO `sys_dict_value` VALUES ('b2995896020e48fcac899f54e494e529', '1984aea678274fc4a00413c15c142446', '所有用户', '2', '20', '1', '2017-02-04 17:28:29', '1', '2017-02-04 17:28:29', '0');
INSERT INTO `sys_dict_value` VALUES ('b2b84bd17d8b4dafb0dd83c14c3c962d', 'ebdd474a9cab463db594c7bc325c7ff4', '大于', '&gt;', '1', '1', '2017-03-24 23:37:21', '1', '2017-03-24 23:37:21', '0');
INSERT INTO `sys_dict_value` VALUES ('bde6043665ef4571b85d0edab667cd15', '21', '树结构表', '3', '40', '1', '2016-01-06 19:48:50', '1', '2016-01-06 19:48:50', '0');
INSERT INTO `sys_dict_value` VALUES ('c51e8af316b24363bbcfbb8de1e61dc4', '23e3cabe5cd448c78223eb61c05e839a', '测试任务', '1', '1', '1', '2017-02-02 23:27:06', '1', '2017-02-02 23:27:06', '0');
INSERT INTO `sys_dict_value` VALUES ('cc94b0c5df554a46894991210a5fc486', '21', '附表', '2', '30', '1', '2016-01-05 21:47:38', '1', '2016-01-05 21:53:44', '0');
INSERT INTO `sys_dict_value` VALUES ('eac171acc70b40e59b436817752aae9b', '1984aea678274fc4a00413c15c142446', '超级管理员', '1', '10', '1', '2017-02-19 19:08:47', '1', '2017-02-19 19:10:19', '0');
INSERT INTO `sys_dict_value` VALUES ('f7556a086d264cd29e0ceb417535fe61', 'ebdd474a9cab463db594c7bc325c7ff4', '不等于', '&lt;&gt;', '5', '1', '2017-04-01 23:25:58', '1', '2017-04-01 23:25:58', '0');
INSERT INTO `sys_dict_value` VALUES ('f7c2d3753c77489e99c5e9a59e7ebd3d', 'ebdd474a9cab463db594c7bc325c7ff4', '包含', 'contain', '7', '1', '2017-04-01 23:26:28', '1', '2017-04-01 23:26:28', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('006db5edc4e34ac1b0b3f37368575652', '1', '系统登录', '1', '2017-11-14 16:01:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('01010bc36b5047a388746e9f30aa19e5', '1', '系统登录', '1', '2017-10-16 10:25:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('01d5ff56141f4b058836185880e64b4b', '1', '系统登录', '1', '2017-10-11 13:52:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0284d473e2e54383b2bd02f46781682b', '1', '系统登录', '1', '2017-12-08 09:21:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('02c3a3ffe94b4e34b5408fd4deca6a71', '1', '系统登录', '1', '2017-11-24 12:53:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a;JSESSIONID=fec315c72e454979943b130b4eddfbc3', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0340bfad98a6472481272eb7c1a86d88', '1', '系统登录', '1', '2017-11-02 12:19:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0360526c121b4c0a8792e47069bd4320', '1', '系统登录', '1', '2017-11-02 14:39:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('03d7d9266cf940f58348eaa6268e5403', '1', '系统登录', '1', '2017-11-08 11:04:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0413969ea1794f5e9881d29937260696', '1', '系统登录', '1', '2017-11-15 10:04:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('042fcd5b1a2e4590b9c39313f1148ecd', '1', '系统登录', '1', '2017-11-29 13:57:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0475894db0ed4271b0743f47da629020', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:49:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('04e1a9fbdd1d416ca654638c939a5b5a', '1', '系统登录', '1', '2017-11-07 16:44:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0501b1a638a4476a8383299967fb1d50', '1', '系统登录', '1', '2017-11-06 10:16:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('05d2a40cb47a492c9df4f2369c75d379', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:27:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'undefined', '');
INSERT INTO `sys_log` VALUES ('05e3abc01e2f4950bc74eb7d3138cbc6', '1', '系统登录', '1', '2017-11-02 12:08:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('060c6de0de8e4696be1691ad159fd3c2', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('0659cafeb4734ef696515dfd01a88335', '1', '系统登录', '1', '2017-12-06 16:08:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('067748e95ada410b8a8115031383c44f', '1', '系统登录', '1', '2017-11-02 14:53:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('06bca1e2ab3148ab9f79bc3b21df9b7a', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:11:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('06c6f5ca29fe4e39825dbdad9cb4b3d6', '1', '系统登录', '1', '2017-10-24 14:03:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('071e36fdd29a483495961fafb85f06e2', '1', '系统登录', '1', '2017-11-28 18:19:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('074b7937bfbe421491fa2912ccf03808', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:42:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('07887bc104154cf0877a44d422667245', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:03:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('078b73edb190412ca6cf6f09c91e2149', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:40:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'35', '');
INSERT INTO `sys_log` VALUES ('07e4d2e6eedb4348aa11d724f1c5e113', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:07:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('0847c58308314cdbb05f4e3b12bae3c5', '1', '系统登录', '1', '2017-11-03 11:12:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('08c17511ef0c499883dcd86adf2c885c', '1', '系统登录', '1', '2017-11-29 13:00:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('090acb373c73462caac70c4e3e0adb76', '1', '系统登录', '1', '2017-11-27 13:29:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('09d7797fc57d43a795bc6246e8c3a796', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:13:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('09da2c47256442dba58abe7ab6e9c50e', '1', '系统登录', '1', '2017-11-01 17:48:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0a88ce7c0b094d3c9f03fb5f080474b4', '1', '系统登录', '1', '2017-12-05 09:51:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0a9401372fac430b911a7e157c709ec6', '1', '系统登录', '50b27251fb9c48cd8b93d7bee2e3d19a', '2017-11-13 15:59:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0b08c5f7b2c34ebdbb6fcc2f5c388d3d', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:19:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('0b25519346e64481b401cea5ad6001dc', '1', '系统登录', '1', '2017-11-13 13:34:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0b2db6646ab5445ca19b591d19ae6371', '1', '项目-项目列表-结果审查', '1', '2017-10-12 10:14:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('0b7736a9ff364a3a86462cc4a16c3e2d', '1', '系统登录', '1', '2017-11-03 15:46:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0bb50361c83d45f2bd9385126a4c41ea', '1', '系统登录', '1', '2017-11-21 13:59:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0bdf64c5721a4a58bc6b39112ebfaf4b', '1', '系统登录', '1', '2017-12-07 16:47:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0c23f8825ffe4b34a0fb8b94764a8276', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:10:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('0c25de73d59d493e892849b3fcafd1ff', '1', '系统登录', '1', '2017-11-27 14:56:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0c58a400575e4f31895d96a695e4b722', '1', '系统登录', '1', '2017-11-17 10:42:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0ce8d3cc596f44b98e46665d5b1fe348', '1', '系统登录', '1', '2017-11-07 17:05:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0d58f27f527f4f19888cdbbc9e9152de', '1', '项目-项目列表-报告下载', '1', '2017-10-15 10:15:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=20&fileType=1', '');
INSERT INTO `sys_log` VALUES ('0e15af2f7b954ecabc47a9fcb8620aa5', '1', '系统登录', '1', '2017-10-24 13:03:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0e2cd72706c04cd19baba05d1b28d27b', '1', '系统登录', 'a0891d76540e4f27ad9424283c592dec', '2017-11-08 15:29:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0e5142dfeff54739b17371bee7c34dc9', '1', '系统登录', '1', '2017-10-19 13:58:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/checkup/checkUp/form', 'GET', 'id=14&analysisResultId=10224', '');
INSERT INTO `sys_log` VALUES ('0e613a2c82e84480b05f3ead632d381f', '1', '系统登录', '1', '2017-12-05 14:55:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0e7425b228fe428a8bab8f782e0c9f55', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-13 16:25:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('0ef10d43097b4ea1bb69bbe0c9a8a2c3', '1', '项目-项目列表-报告下载', '1', '2017-10-11 11:56:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=5&fileType=1', '');
INSERT INTO `sys_log` VALUES ('0f2f9139839f43598e97f70f9b56146b', '1', '系统登录', '73b19d7c6288423683ec00b44579a5bb', '2017-10-16 10:49:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0f52ed9b790b4740928e3210917c10af', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:27:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('0f76289ab2d14b76aa22436ccd4b7b68', '1', '系统登录', '1', '2017-11-06 13:52:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0fb10fad7d254cd8a4821eaedcbddd98', '1', '系统登录', '1', '2017-11-08 15:29:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0fd2786f6dbd4117b4f6a37cb2ae9507', '1', '系统登录', '1', '2017-11-17 11:27:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0ffe4dd9e8a1450b932180c045978a5b', '1', '系统登录', '1', '2017-11-09 09:45:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('101768dcd4ec47089d3cd3c03e15c313', '1', '系统登录', '1', '2017-11-02 16:16:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('106273e0238841b2877e140756db59e5', '1', '系统登录', '1', '2017-11-02 15:58:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('10a1db24b4494d518cfa787e9bf5b8c5', '1', '项目-项目列表-结果审查', '1', '2017-10-16 10:42:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=25', '');
INSERT INTO `sys_log` VALUES ('116748ada60c42579abea83b97eeff7c', '1', '系统登录', '1', '2017-12-08 11:39:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('118d6882bac54f67b1c44c202e5cea6d', '1', '系统登录', '1', '2017-11-29 13:24:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('11a82aea2c7f426cb236402a2a346317', '1', '系统登录', '1', '2017-11-27 16:24:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('121c8bd3a95f4e12944e60e4f761b4b9', '1', '系统登录', '1', '2017-11-03 16:10:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('121cded140e149999be9dfdcb947df5b', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:42:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('1278977023c54773b1bf9ade857fabe2', '1', '系统登录', '1', '2017-11-28 09:15:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1289d39a44a0420d875f335c1aa4f510', '1', '系统登录', '1', '2017-12-06 14:42:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('12ab8ebdf1944db993aed605d1e1ad40', '1', '系统登录', '1', '2017-12-06 10:44:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('12c73b3615574e8982922c5eab6f8349', '1', '系统登录', '1', '2017-11-09 14:27:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('12d7db64c95e4092877622e13e5d176a', '1', '系统登录', '1', '2017-12-05 10:42:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1331ebaaf3e44fcc91278dcc8eeb9715', '1', '系统登录', '1', '2017-11-17 11:13:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('13373130933e4247964a4eea81471168', '1', '系统登录', '1', '2017-10-16 10:23:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('134e41b1f3974d0ab13e0684bde52815', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:20:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('1378c84e75b64eeebbe8c2d0639b0c6a', '1', '系统登录', '1', '2017-11-29 12:57:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('139a88e711e14d6587d73274edc4bf7b', '1', '项目-项目列表-结果审查', '1', '2017-10-17 10:35:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('1426b30b75de42b18759f19afeeb28b1', '1', '项目-项目列表-报告下载', '1', '2017-11-07 11:32:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=28&fileType=1', '');
INSERT INTO `sys_log` VALUES ('14369071c0f24f5f8a209e348b063e9f', '1', '系统登录', '1', '2017-11-09 14:01:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1494076e3de14ef781d5a978348761a7', '1', '系统登录', '1', '2017-11-08 16:17:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('15142697efc74eadb63701183b748631', '1', '系统登录', '1', '2017-11-02 12:04:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('15b2e58a0b654ff9864ea572d7ca9381', '1', '项目-项目列表-结果审查', '1', '2017-10-16 20:13:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('16a2189f48854173b5bcf279f7f95175', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 14:44:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('16bd1ef53c2042fd97009b808a0b1c56', '1', '系统登录', '1', '2017-12-05 13:52:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('16c6314dc0aa46e79bef8b4de9091138', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 14:43:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('16f8b40fbbb546c08c5d3433b74dc29d', '1', '项目-项目列表-结果审查', '1', '2017-10-16 10:50:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=25', '');
INSERT INTO `sys_log` VALUES ('17e3bfc9e5614175a83529cac09268e6', '1', '系统登录', '1', '2017-12-04 10:05:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('17e8cef4362447629e82990ebd40188d', '1', '系统登录', '1', '2017-11-17 16:06:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('188d33897bbf452499175cefa3e431f2', '1', '系统登录', '73b19d7c6288423683ec00b44579a5bb', '2017-10-16 10:48:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('18a9e1752b82451c8f6d83b7fc959912', '1', '系统登录', '1', '2017-10-12 13:25:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('18bbb210d74f4ea8abff3d7fa88221f9', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:09:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('1a9d5ecf112b4dd0a0265e8a40e198af', '1', '系统登录', '1', '2017-12-04 10:27:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1aa01afd1bf94a5aa354bf01f22924b1', '1', '系统登录', '1', '2017-11-09 11:03:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1b0acde4970f4ed584a3f0d6a5d1df76', '1', '系统登录', '1', '2017-11-20 10:38:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1b3e69fec9ab4d9780dd9464db685972', '1', '系统登录', '1', '2017-11-13 15:31:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1b56ce1726ce4bc1bf4caee08369ff4b', '1', '系统登录', '1', '2017-11-02 11:43:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1bb016822d5a44d288b81a425b25a325', '1', '系统登录', '1', '2017-11-06 13:07:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1bc4db83d38d4079a6ff2e6aba619c39', '1', '系统登录', '1', '2017-11-07 17:40:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1caae113d09844a1a572e7d82407028d', '1', '系统登录', '1', '2017-10-15 10:01:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1ceaeca00a774659922a9d2ba3041bbd', '1', '系统登录', '1', '2017-11-22 14:03:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1d4fd2f83b27469ab7b113204e4bf5f3', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 17:03:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('1e399cc6406945238171b336e0e7ca16', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-22 13:28:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('1e3d56a938884724a0ccf0ecb0cb245b', '1', '系统登录', '1', '2017-12-04 11:41:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1f1258fbc98c4a47ab36b486f8d1929e', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:06:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('1f2b5a57355b400081047e233290667b', '1', '系统登录', '1', '2017-11-06 09:48:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1f5a790de2b94864a5c0f76c9e0e35f8', '1', '系统登录', '1', '2017-11-15 15:10:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko/20100101 Firefox/56.0', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1f719b36787f41adb2f38f57087f0c06', '1', '系统登录', '1', '2017-11-20 15:11:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1fb0f52c7c06405cb503630b08d51cdb', '1', '系统登录', '1', '2017-11-29 09:23:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1fd67994ed9d44b0b1332a57c7d97bf6', '1', '系统登录', 'a0891d76540e4f27ad9424283c592dec', '2017-11-10 14:38:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1ff25bf718454199a99269b2032280ba', '1', '系统登录', '1', '2017-11-23 10:30:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/analysisset/analysisSet/editAnalysisform', 'GET', 'projectID=85&toolName=SpecChecker&toolTypeName=static_check&checkupCount=1', '');
INSERT INTO `sys_log` VALUES ('1ff362530dbd456e9d13ca9101b92b18', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:59:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32', '');
INSERT INTO `sys_log` VALUES ('2068673611bc42c99d49389853ef37a7', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:40:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'35', '');
INSERT INTO `sys_log` VALUES ('20828098f5f443eb9aafb73cd19650c7', '1', '系统登录', '1', '2017-11-17 13:53:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2092ed1e8c98417bbba9e0a7ddc088ff', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:07:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('21764163076d400f9115ed8794414780', '1', '系统登录', '1', '2017-11-13 16:01:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('219bed8c587544a7ae979689b5ec2b6d', '1', '系统登录', '1', '2017-12-04 11:34:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('21aef57b93924618a47103f06202e529', '1', '系统登录', '1', '2017-11-20 09:53:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2240f464488f4f2493ead4a25c2cccd8', '1', '项目-项目列表-项目主页-文件下载', '1', '2017-11-23 12:53:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project/downloadReport', 'GET', 'toolId=32&fileType=1', '');
INSERT INTO `sys_log` VALUES ('22bd0bbd89374f35add51d2485520960', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-13 16:26:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('234dbc2e432b4807bcc18cece5ba1504', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:45:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('23abe9be814c450d923d15d6a9ab3323', '1', '系统登录', '1', '2017-11-02 13:26:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('23fc1b399f0f45b2a72d871d656a3534', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('247d7d9f5bca426bbe5910ef0c8a3f96', '1', '项目-项目列表-报告下载', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 15:57:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=25&fileType=1', '');
INSERT INTO `sys_log` VALUES ('248abcee24104b56baa60f55afe3ae96', '1', '系统登录', '1', '2017-11-20 13:26:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('24e915e30bb64139825cb3d3f2e1fc47', '1', '系统登录', '1', '2017-12-07 09:07:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('24f590871b3e4a448ac5bb08539c3a3a', '1', '系统登录', '1', '2017-12-05 09:50:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2503ad04dd9f4a3b93060bcc76408859', '1', '系统登录', '1', '2017-11-09 10:59:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('259d56601dd140b3a32f7b62b43ce99c', '1', '项目-项目列表-报告下载', '1', '2017-10-11 10:06:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('26295a41d52047329a9133c1853ffa89', '1', '系统登录', '1', '2017-11-24 15:15:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2660a0a08f4148abb6b636a0c18946d1', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:47:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('267dda7cc2ac453d9ac13c02e9100c35', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-10 13:41:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=8', '');
INSERT INTO `sys_log` VALUES ('26993c4ab16c49989c7b3e3d2d7be2f7', '1', '系统登录', '1', '2017-11-02 12:22:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('271feceda9c743b983cedb45c12290dd', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:42:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('27bf600ec5eb44eb8a4b29cec72960cf', '1', '系统登录', '1', '2017-11-27 16:35:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('27f44e97b45c4ab0938f6ab2037e3ea1', '1', '系统登录', '1', '2017-11-21 15:44:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('286d2820d0bd40789f72805c3c138526', '1', '系统登录', '1', '2017-11-06 13:30:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2907305d1b8a4f4db11580bd3a2bc25e', '1', '项目-项目列表-结果审查', '1', '2017-11-01 16:42:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('295b8aff6d584d319f4b3408fd630145', '1', '系统登录', '1', '2017-11-10 14:08:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('296452aeab1b4e97ab57b3165df21526', '1', '系统登录', '1', '2017-11-02 15:12:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('29c422a4aeff4c6580d145e4db079c28', '1', '项目-项目列表-结果审查', '1', '2017-10-25 16:51:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('2a556211cbfc475ca16f284719af7c86', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:19:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('2ac243e33aa14ae390f72c84fdb0fa88', '1', '项目-项目列表-报告下载', '1', '2017-10-15 09:42:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=22&fileType=1', '');
INSERT INTO `sys_log` VALUES ('2ac6be3f50254290b4878baa99bee615', '1', '系统登录', 'a0891d76540e4f27ad9424283c592dec', '2017-11-10 14:58:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2b0bdce4225b417bac268666ec2e0574', '1', '系统登录', '1', '2017-11-03 11:27:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2bb5a9a4221744fb9674ede1ad1fed84', '1', '系统登录', '1', '2017-11-27 09:29:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2c069c31fffa461e9c98dc731510d758', '1', '系统登录', '1', '2017-11-02 14:56:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2c18a34b11034fc8ba98438fa4beffb4', '1', '系统登录', '1', '2017-11-14 17:15:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2c5a19e725ff4ab78d26b99202e9bd37', '1', '系统登录', '1', '2017-11-02 16:00:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2d7aa5fa93064d228f1f93d61e43763f', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:35:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('2d9b90ce50c045abaf98d266bbe6f873', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-24 12:56:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=36&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('2df4eab1455e4cf380b01e82009a3d76', '1', '系统登录', '1', '2017-11-03 15:53:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2dfe73c07f804e9d876a89db3149210f', '1', '系统登录', '1', '2017-12-06 13:11:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2e2d5f79766e46f3bcf2bdfe05cc2700', '1', '系统登录', '1', '2017-11-24 15:39:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2e6d77ce0f054d2398df8edd75be97a7', '1', '系统登录', '73b19d7c6288423683ec00b44579a5bb', '2017-11-08 15:29:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2ea2b52020214bf4848dc3adbdea7da4', '1', '系统登录', '1', '2017-11-15 13:11:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2f1a6d2a0312443588972f87feb4449c', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:39:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'35', '');
INSERT INTO `sys_log` VALUES ('2f42b3b8739846468734955e00e11b8b', '1', '系统登录', '1', '2017-11-17 11:33:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2f4a0bc7c4fa41a1a5aa73b4f59add67', '1', '项目-项目列表-报告下载', '1', '2017-10-11 11:39:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('2f8283b2669d4d1f906d1bc31f9ec2c5', '1', '系统登录', '1', '2017-10-27 10:54:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2fc64a7305d64ca8b7c5648cf1564341', '1', '系统登录', '1', '2017-11-07 11:31:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('2fc95f9c0cc44fadb4d9a738d65a1d07', '1', '系统登录', '1', '2017-11-20 15:56:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3010fad52a2a42daba95fd0a2039c9ef', '1', '系统登录', '1', '2017-11-14 16:45:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('307aa959ef0041479ae6398566a0e0c9', '1', '系统登录', '1', '2017-12-06 16:32:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('30846fd0a09e4e05bbf2833000c098cf', '1', '系统登录', '1', '2017-11-02 10:40:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('30c5c5e7614348e899d189aa61a3eb15', '1', '系统登录', '1', '2017-11-28 09:44:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('30e3a97f77064926a327c5d712522da3', '1', '系统登录', '1', '2017-11-29 13:32:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('30f129f9e9534f4b9a5f3be61dad8999', '1', '系统登录', '1', '2017-11-20 10:32:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('30f35b449d254f00aed7ddd3daeb1f52', '1', '项目-项目列表-结果审查', '1', '2017-10-16 20:34:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('311cbaf433c84fb393c64645fe6a8f8f', '1', '项目-项目列表-报告下载', '1', '2017-11-07 11:32:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=28&fileType=1', '');
INSERT INTO `sys_log` VALUES ('3134d652800d4176ab954adf57b61e99', '1', '系统登录', '1', '2017-11-13 16:04:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('31a0de5b6e7042989e0c284e04dc4bee', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:22:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('31d54aacfbc94a26a695f7960dbbf09e', '1', '系统登录', '1', '2017-10-12 11:29:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('31d80a0dd8c744f6b3a60fba9b004fae', '1', '项目-项目列表-结果审查', '1', '2017-10-27 12:11:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('31d8914857634825b43dc982372d0994', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 14:37:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('31ed0952aacf487187cfbbbb85d6a6b6', '1', '系统登录', '1', '2017-11-08 10:58:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('325de0181545457ca35c0b8dc665c503', '1', '系统登录', '1', '2017-10-12 08:54:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('32965bb3be3a4ad480073dfe05968483', '1', '系统登录', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 15:49:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('335dfe3ea6c1413899940e9648193daa', '1', '系统登录', '1', '2017-11-29 13:07:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('338f70e301414f6881e8c35a2647a425', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-21 15:18:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('33ae3279d5904688a9c989abf8883c7c', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('33c27cf88c024351ab2637ea59c7a743', '1', '项目-项目列表-报告下载', '1', '2017-11-08 11:37:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=7&fileType=1', '');
INSERT INTO `sys_log` VALUES ('348bb95577b445a6901e14217c452ff3', '1', '系统登录', '1', '2017-11-16 16:43:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3551dcfc92d34d77b1412c3490bf11ae', '1', '项目-项目列表-结果审查', '1', '2017-10-24 14:14:06', '192.168.8.104', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('355eb998436149fb8e3127b16112eff6', '1', '系统登录', '1', '2017-12-04 15:15:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('35dbade2f0834c44a99740a54628e884', '1', '系统登录', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 15:50:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('35dec2d0641241b9822af330174ba924', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:10:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('35f24b0bf22a4827a0e7fac59bd994b7', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('361586952f164666bb07e04880e3131b', '1', '系统登录', '1', '2017-10-19 10:30:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/checkup/checkUp/form', 'GET', 'id=14&analysisResultId=10224', '');
INSERT INTO `sys_log` VALUES ('362047475f0c46279790ab5080bdfa5e', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:55:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('365092d3f69a48f7a0e163be0f39b3ab', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 13:43:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('365390f4c9504e1bb49e0713f01965eb', '1', '系统登录', '1', '2017-12-04 10:02:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('36727b77f66a4574b7d4e9342a62b269', '1', '项目-项目列表-报告下载', '1', '2017-11-07 11:31:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=28&fileType=1', '');
INSERT INTO `sys_log` VALUES ('36cfe98507f146fbb7288220ce3e4b0d', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-10 14:30:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=8', '');
INSERT INTO `sys_log` VALUES ('370cf3e499b14ed1b35684aefe65f945', '1', '系统登录', '1', '2017-11-17 13:59:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('378a2cff9a224a9abd66aa2cd4ff994f', '1', '系统登录', '1', '2017-11-14 13:40:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('378c11664c4044b7900860467e09ecef', '1', '系统登录', '1', '2017-12-04 16:07:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('382bd3ff78c2418f85b2897f48f9e4ff', '1', '系统登录', '1', '2017-11-22 16:06:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('384000e73ce949a4884ac1c08959ac23', '1', '系统登录', '1', '2017-11-29 09:47:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3841551072fb45868c3644bf94d0c1fe', '1', '系统登录', '1', '2017-11-10 13:38:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3882f7d72ea742b7ac607a2105abb7d1', '1', '系统登录', '1', '2017-12-06 09:07:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('38fd8a61bf294b1cb5f00d1e18b1476a', '1', '系统登录', '1', '2017-12-04 10:24:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('391f077a28ed41fe93affedafac42fff', '1', '系统登录', '1', '2017-12-07 17:39:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('394472a627964234a54cc6c85ff076e2', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:10:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('394a2b655ee9446da0e71b8736239eda', '1', '系统登录', '1', '2017-11-09 10:32:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3967e5d5af50412bb1d39291c03795c6', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-10 13:39:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=8', '');
INSERT INTO `sys_log` VALUES ('3999efd861814aa9aa6b25a2b785716b', '1', '系统登录', '1', '2017-10-15 09:28:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3a029b7b0a6440488b114ac351fe7fd6', '1', '项目-项目列表-结果审查', '1', '2017-11-07 18:13:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('3b0251cbf85640c1810e874bf282c13e', '1', '系统登录', '1', '2017-12-05 15:45:35', '192.168.8.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko/20100101 Firefox/56.0', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3b2ebe8e5ba744c78c9d8cb9c6647e9a', '1', '项目-项目列表-结果审查', '1', '2017-10-16 20:35:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('3b53448f601d4804a6fc9b61d2ad9f36', '1', '系统登录', '1', '2017-11-03 10:57:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3b5d03f4dcc64b7a8def166b53877276', '1', '系统登录', '1', '2017-11-17 13:17:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3b5de0566f534ff3a3a1150e41941605', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('3b7c0be06ab94eec8f6674e2ae5b21a9', '1', '系统登录', '1', '2017-12-04 16:40:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3bc68913411e417c811ad0e01963a5a3', '1', '系统登录', '1', '2017-12-07 10:12:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3bff753e972049168239f5a38e8045f9', '1', '系统登录', '1', '2017-10-12 09:54:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('3c612b4ee6824db0843d25a9113023b4', '1', '项目-项目列表-结果审查', '1', '2017-11-07 18:03:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('3c69ffa06e5d495faebde4d82b863f29', '1', '系统登录', '1', '2017-11-08 10:12:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3c7967c64bce4338abacdc6b6960a7ba', '1', '系统登录', '73b19d7c6288423683ec00b44579a5bb', '2017-10-16 10:27:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3d409655dfac4949b1a4fc0799205d78', '1', '系统登录', '1', '2017-11-07 17:18:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3d4343745c1e42c88f91b73232a139f4', '1', '系统登录', '1', '2017-11-06 13:49:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3df3c98849c94a7c91828166b9c0898d', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:09:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('3e3b6c2b7b8d4ef385f4d895fd8b632d', '1', '系统登录', '1', '2017-11-02 15:34:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3f91b90736804217ab20b76845fe9bb7', '1', '系统登录', '1', '2017-10-16 08:51:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('3f9ecae8901c42f8ac58ec331f070a07', '1', '系统登录', '1', '2017-11-06 16:09:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('400717a8a7764490bf7e7299103745f1', '1', '系统登录', '1', '2017-11-15 15:13:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko/20100101 Firefox/56.0', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('40246124cb914383af654aef11ed0821', '1', '项目-项目列表-结果审查', '1', '2017-10-12 10:17:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('40311c748bf644caaf8071bdfacc89f8', '1', '项目-项目列表-结果审查', '1', '2017-11-01 17:28:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('405ddfe42bb9485493488583bff6ae86', '1', '系统登录', '1', '2017-10-11 12:57:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('40668ab9f2184ec58c12831a95fc1c35', '1', '系统登录', '1', '2017-11-17 10:11:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('40c689cb828e4771bbe7ef2dd417d431', '1', '系统登录', '1', '2017-11-13 15:03:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project/projectDetail', 'GET', 'toolId=35&state=2', '');
INSERT INTO `sys_log` VALUES ('4103163561e44f45926ac8d4577fc8d0', '1', '系统登录', '1', '2017-11-15 11:50:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('413578d18bcc4a38b5006ba2a3e3c48d', '1', '系统登录', '1', '2017-12-04 15:31:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('415dd0cb875b4e08948be4fa3f78a83c', '1', '系统登录', '1', '2017-11-09 17:14:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('419b0db7c9464972bb02c2f30759fb51', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:47:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('41ef84e92f5d4bf58779e0b402b950ae', '1', '系统登录', '1', '2017-11-08 14:39:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('421db3a421db46578c03d9c2327b173c', '1', '系统登录', '1', '2017-11-17 13:13:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4233d2143845498c8f4983bd0437a3f8', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:30:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('4261a4ba87fa4ca8b390a82bcbb67d17', '1', '系统登录', '1', '2017-12-04 11:26:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4265e01f15c842768c507a9dcd28a54d', '1', '系统登录', '73b19d7c6288423683ec00b44579a5bb', '2017-11-10 14:34:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4270b56393804be8a144d41e914a8635', '1', '系统登录', '1', '2017-11-02 17:05:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('442608ceae4748efa1b1c47a5e8721aa', '1', '系统登录', '1', '2017-11-08 14:19:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('44a9cd0f1e1444cfb134279f4fd2c5ff', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:41:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('44abe15a12074423a5b764aa75f1d319', '1', '系统登录', '1', '2017-11-10 12:05:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('45594152a7af469db51c8fdbe80fae95', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-12-05 13:57:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('45827af70a314f56a25ecc2a91eb9366', '1', '系统登录', '1', '2017-12-07 10:38:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4625c1dd9972434ca91c5a1e17ba66b5', '1', '系统登录', '1', '2017-12-05 16:07:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('463d5bcd419a48d9a81aff16a0a0ead5', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-13 16:05:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('46af51f832c843819e3a12dbe44896d5', '1', '系统登录', '1', '2017-11-17 10:17:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('46e492cc8810489ba07b99abfc19884a', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:53:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('475e4898748143d496ea1bd1e35c8439', '1', '系统登录', '1', '2017-11-17 10:56:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('47db464e9fa64003be8689c24bf9dbcb', '1', '项目-项目列表-项目主页-项目详细-结果审查', '73b19d7c6288423683ec00b44579a5bb', '2017-11-13 16:00:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('480e142dcb704d5d851f734ff54f669f', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:26:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'undefined', '');
INSERT INTO `sys_log` VALUES ('48665dd5ae9e423283701dadd640d875', '1', '系统登录', '1', '2017-11-02 10:35:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('48e2915f3c8a49f98dd2654ed4f5865d', '1', '系统登录', '1', '2017-10-11 10:36:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('497f639a55ea43fcb86afe678187778a', '1', '系统登录', '1', '2017-11-02 13:14:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('49850fd7d12f44d880ed29af2c5f3d5a', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-24 12:56:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=36&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('4a0809e8c8834b2bad3a43fec086a776', '1', '项目-项目列表-报告下载', '1', '2017-11-07 11:32:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=28&fileType=1', '');
INSERT INTO `sys_log` VALUES ('4a2d4c5b7a93479387369020dd0db82b', '1', '系统登录', '1', '2017-11-07 17:32:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4aa99828381d492ea29059222d3c39fc', '1', '系统登录', '1', '2017-11-03 09:18:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4ad66bc9f45742f49cc9b81c1d62288c', '1', '系统登录', '1', '2017-11-17 14:23:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4b0e35fc11d24be4b8311a98f64b0202', '1', '系统登录', '1', '2017-11-17 14:22:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4b86a80334ee457e9b63dcbf4addf5d6', '1', '系统登录', '1', '2017-12-05 11:04:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4c4f3ea869014216bebff8d8c9c5a884', '1', '系统登录', '1', '2017-12-05 10:50:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4c539fb66f1e4232a166e68a52cf5f43', '1', '项目-项目列表-结果审查', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 15:09:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('4c5617fca6424d3fb1c4da3d9093021e', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-10 14:29:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=8', '');
INSERT INTO `sys_log` VALUES ('4c80bf56e9324045af711e30cb4d3eb5', '1', '系统登录', '1', '2017-12-05 11:08:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4c90589e6bc74b23b273727cf467d0dc', '1', '系统登录', '1', '2017-12-07 18:14:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4d23a4c6a796495bad6f5845455a5990', '1', '系统登录', '1', '2017-12-06 16:43:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4d2d8a92650a44508f250f0b696a409f', '1', '系统登录', '1', '2017-10-11 10:39:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4d39679f39a8499fa7bb8985cd2039d9', '1', '系统登录', '1', '2017-10-16 10:42:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4d6bbdf332cc43c9b724a78772e7be30', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:11:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('4d7d09ea0a8f425a908e3c9782fbf1fc', '1', '项目-项目列表-结果审查', '1', '2017-11-07 18:06:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('4de23f4d0cae45898ce84927681518b1', '1', '系统登录', '1', '2017-11-13 15:03:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/data', 'GET', 'projectAnalysisId=35&pageNo=1&pageSize=5&orderBy=&type=1&state=&rulePriority=&ruleName=&_=1510556417180', '');
INSERT INTO `sys_log` VALUES ('4e330896f44f4177a83813e3082cd297', '1', '项目-项目列表-项目主页-文件下载', '1', '2017-11-16 17:03:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project/downloadReport', 'GET', 'toolId=35&fileType=1', '');
INSERT INTO `sys_log` VALUES ('4ebde8761f2a4c6dbb4763be4141d99e', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-13 16:26:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('4f23a73c22904b8dbfd4deb74cce79c3', '1', '系统登录', '1', '2017-11-14 14:57:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('4f59f847ca8e4964a006b5567df2c8ba', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:45:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('51daa529f0354a6386df36752ce04828', '1', '项目-项目列表-结果审查', '1', '2017-10-11 07:53:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=2', '');
INSERT INTO `sys_log` VALUES ('51e457572fdc455ebc0c33bc82bbdd4e', '1', '系统登录', '1', '2017-11-07 17:09:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('524ee55d954b47cda40bd6e79677cbcc', '1', '系统登录', '1', '2017-10-16 15:50:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('52d4285ee32949bc95d4b980e2bf7b0e', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 11:54:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('52e0a3bdc1ad4537b9e66f2605ca0637', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:13:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('532ce695923a4f7988c058618bbe0390', '1', '系统登录', '1', '2017-11-15 11:48:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('539f691240084ba39f6b09a6189740a5', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:18:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('54c29c84edb94d6cbac0943564b3dc89', '1', '系统登录', '1', '2017-11-27 13:37:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('54e0bf337eb843f1a819ca1fdc2c7f72', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 11:54:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('550ba9e58138418bae92d041e4963e12', '1', '项目-项目列表-结果审查', '1', '2017-10-12 09:54:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('558b2a26fad5494b9b3c24d4bf20eb66', '1', '系统登录', '1', '2017-12-04 11:28:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/tooltype/toolType/checkToolTypeName', 'GET', 'toolTypeName=static_check', '');
INSERT INTO `sys_log` VALUES ('5598ee59a2784f8eabc03a03497eabfb', '1', '系统登录', 'a0891d76540e4f27ad9424283c592dec', '2017-11-10 14:43:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('564bee0a9b374194a98641f94b53be1f', '2', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:01:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', 'org.apache.jasper.JasperException: An exception occurred processing JSP page /webpage/web/violationresults/violationresultsList.jsp at line 29\r\n\r\n26: 		<div class=\"accordion-inner\" hidden=\"true\">\r\n27: 			<form:form id=\"searchForm\" modelAttribute=\"analysisResult\" class=\"form form-horizontal well clearfix\">\r\n28: 				<form:hidden path=\"projectAnalysisId\"/>\r\n29: 				<form:hidden path=\"toolStatus\"/>\r\n30: 			</form:form>\r\n31: 			<input type=\"hidden\" id=\"test\" value=\"111\">\r\n32: 		</div>\r\n\r\n\r\nStacktrace:\r\n	at org.apache.jasper.servlet.JspServletWrapper.handleJspException(JspServletWrapper.java:579)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:476)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:396)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:340)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:292)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:716)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:466)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:391)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:318)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:168)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:303)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1257)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1037)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:980)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:622)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:292)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:262)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:212)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:94)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:504)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:141)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:79)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:620)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:88)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:502)\r\n	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1132)\r\n	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:684)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1533)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.run(NioEndpoint.java:1489)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.springframework.beans.NotReadablePropertyException: Invalid property \'toolStatus\' of bean class [cn.spac.checker.web.violation.entity.ViolationResults]: Bean property \'toolStatus\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?\r\n	at org.springframework.beans.AbstractNestablePropertyAccessor.getPropertyValue(AbstractNestablePropertyAccessor.java:619)\r\n	at org.springframework.beans.AbstractNestablePropertyAccessor.getPropertyValue(AbstractNestablePropertyAccessor.java:610)\r\n	at org.springframework.validation.AbstractPropertyBindingResult.getActualFieldValue(AbstractPropertyBindingResult.java:99)\r\n	at org.springframework.validation.AbstractBindingResult.getFieldValue(AbstractBindingResult.java:229)\r\n	at org.springframework.web.servlet.support.BindStatus.<init>(BindStatus.java:120)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getBindStatus(AbstractDataBoundFormElementTag.java:168)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getPropertyPath(AbstractDataBoundFormElementTag.java:188)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getName(AbstractDataBoundFormElementTag.java:154)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.autogenerateId(AbstractDataBoundFormElementTag.java:141)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.resolveId(AbstractDataBoundFormElementTag.java:132)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.writeDefaultAttributes(AbstractDataBoundFormElementTag.java:116)\r\n	at org.springframework.web.servlet.tags.form.AbstractHtmlElementTag.writeDefaultAttributes(AbstractHtmlElementTag.java:422)\r\n	at org.springframework.web.servlet.tags.form.HiddenInputTag.writeTagContent(HiddenInputTag.java:79)\r\n	at org.springframework.web.servlet.tags.form.AbstractFormTag.doStartTagInternal(AbstractFormTag.java:84)\r\n	at org.springframework.web.servlet.tags.RequestContextAwareTag.doStartTag(RequestContextAwareTag.java:80)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspx_meth_form_005fhidden_005f1(violationresultsList_jsp.java:1121)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspx_meth_form_005fform_005f0(violationresultsList_jsp.java:1047)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspService(violationresultsList_jsp.java:671)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:438)\r\n	... 68 more\r\n');
INSERT INTO `sys_log` VALUES ('56bcf3d4108f4aab9c27b6ac437cfeaf', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 17:03:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('575dd2f5c99442558f24f2798aa0b792', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 15:04:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('57912374529e47f4a3d89b8b836ea970', '1', '系统登录', '1', '2017-11-03 13:49:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('57ac694855c34b6d881059b96157b86e', '1', '系统登录', '1', '2017-11-20 11:51:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('57d6150b471e4b8ea75ce41d0888111b', '1', '系统登录', '1', '2017-11-16 17:01:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('57fb08230e6c4829b38ca4cda33e32f6', '1', '系统登录', '1', '2017-11-27 11:11:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('58286d5ed36b4db1a1bdfe45a52b439c', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:26:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('58f4521303c3449b9281af00a3384c32', '1', '项目-项目列表-结果审查', '1', '2017-10-12 09:37:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('591b6e9958964db1b6d0d8b2aa5bed81', '1', '系统登录', '1', '2017-11-13 14:55:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('594f2fef204a430b9013df79a2bc9f39', '1', '系统登录', '1', '2017-11-10 14:30:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('596aa5ef2b0e43e497e95696aa5ac515', '1', '系统登录', '1', '2017-11-02 15:09:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('596c2a2c7a3e4c2c98d592a0133379d6', '1', '系统登录', '1', '2017-12-07 10:37:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('59f779d9e8a042fe94ee664c6cbe510e', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:39:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('5a442369166f4ceab1323b370910f95f', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:55:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('5a5823d7209b4b4d95286d4667f28a49', '1', '系统登录', '1', '2017-11-09 11:27:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5a9e392346a5494aa3797357285d7a8d', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('5ad5d33f68c04d01a6cf964c19cc67ae', '1', '系统登录', '1', '2017-12-05 13:36:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5b05caf14bbe44549346bde9eca7ed77', '1', '系统登录', '1', '2017-11-29 10:43:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5b17b7b3270a4ca6931020936ae47c96', '1', '项目-项目列表-结果审查', '1', '2017-10-11 10:50:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=2', '');
INSERT INTO `sys_log` VALUES ('5b8c5babfca54ac79a206e37978174ee', '1', '系统登录', '1', '2017-11-17 16:01:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5be16d2b1144488ca105e8883d08073b', '1', '系统登录', '1', '2017-11-24 14:29:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5beac45dee1e4060b27fc99447dcb4f4', '1', '系统登录', '1', '2017-11-20 14:30:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5c05371f02e7469bb9ca38c92cda0403', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:41:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('5c1a5a77fcc440689296f7aae2d9ed25', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-24 13:05:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('5c8523c1833a4831b65e5afdf5e557fa', '1', '系统登录', '1', '2017-11-06 13:18:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5cd24d95dcaa437488f769620564a6ad', '1', '系统登录', '1', '2017-11-13 15:03:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5cf38913685f47cfa583da9d02520abb', '1', '系统登录', '1', '2017-11-29 11:15:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5cfe207e41f4446faab401c925b8815b', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('5d0fa7837fe94acea374676a53826a2a', '1', '系统登录', '1', '2017-11-01 16:24:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5d697a8b6a0248f4845ccf970227f04b', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 11:35:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('5db6e7037c244bb596a8bab1c77a7d5d', '1', '系统登录', '73b19d7c6288423683ec00b44579a5bb', '2017-11-10 14:35:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5dc5528e145843c1b3e655bfd4476143', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:09:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('5dd53f9b9fc5484fa6aa4d01c1e3939c', '1', '系统登录', '1', '2017-10-19 14:57:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5e77c7da130a479395d3ad84006d44ba', '1', '项目-项目列表-结果审查', '1', '2017-10-19 10:11:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('5eb512422c5244c38287ff46960bd57e', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 17:02:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('5ebe45a5f86b44d1aa1dc748032e2957', '1', '系统登录', '1', '2017-11-03 16:27:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5ee0bb60e1f146ff8e38cf3b21d9c569', '1', '项目-项目列表-结果审查', '1', '2017-11-01 17:31:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('5ee775a540994b8f8ad52a08dcb9af5c', '1', '系统登录', '1', '2017-11-08 15:46:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5f4329aab3fd43869441931289e225a5', '1', '系统登录', '1', '2017-10-24 09:13:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('5fc3d3ee5f2c484bae57cd928616051c', '1', '系统登录', '1', '2017-11-06 14:21:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('602f6effcd0c43f992bc493ed6fc98d6', '1', '项目-项目列表-结果审查', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 14:59:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('60a3e3c922b14c9cb54b705883d745ce', '1', '系统登录', '1', '2017-11-03 09:32:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('60e187f31c4c4de0ab33494d6cba7296', '1', '系统登录', '1', '2017-10-16 15:32:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6124d763aa4e4a28a264481d6d634c97', '1', '系统登录', '1', '2017-11-15 14:16:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('61970285c5cc47aaadef5eb35ac8b63d', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:19:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('620087e2ef1f4fa597eb3232f8f861ae', '1', '系统登录', '1', '2017-11-01 17:28:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('623a4cb0deb34a3e887f614e812d4b92', '1', '系统登录', '1', '2017-11-13 15:03:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/data', 'GET', 'projectAnalysisId=35&pageNo=1&pageSize=5&orderBy=&type=&state=&rulePriority=&ruleName=&_=1510556417179', '');
INSERT INTO `sys_log` VALUES ('624f47dc9bc345b7adf030cd2340eef6', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:35:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('62533a3598674f76a88439e831699469', '1', '系统登录', '1', '2017-11-06 10:30:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('626970ff8ff645d7a0349e59fcbb6b6a', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 14:45:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('6296688287b349179479c93f920b9e5d', '1', '系统登录', '1', '2017-11-17 11:59:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('62effae081554c61aedf8f29ece2f838', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:20:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('6335d6e6efb7468981c1b97d293e065a', '1', '项目-项目列表-报告下载', '1', '2017-10-11 09:52:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('637e77a440e6409f8fb93482a4ccf744', '1', '系统登录', '1', '2017-11-20 11:53:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('63e95af54dd446c5a28221a252ccc9a4', '1', '项目-项目列表-结果审查', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 10:51:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=25', '');
INSERT INTO `sys_log` VALUES ('640e3c3b1ade46cb94317f35f71152ce', '1', '项目-项目列表-报告下载', '1', '2017-10-12 09:02:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=8&fileType=1', '');
INSERT INTO `sys_log` VALUES ('648117aa7d024992989500eebbd14179', '1', '系统登录', '1', '2017-11-08 11:02:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('651c2430035a4019aae0efa594e10d16', '1', '系统登录', '1', '2017-11-29 14:20:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('654b8b6ca22f4f04837a6a8fa190a391', '1', '系统登录', '1', '2017-11-14 10:14:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('65a14429c138495990e80b1ad3b5fb67', '1', '系统登录', '1', '2017-11-08 15:10:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('65a2e121bb7344eca1a1d5df5a1083f3', '1', '系统登录', '1', '2017-12-04 16:10:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('65ac45c46d594a0480c36c6c96b15d95', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:31:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('6614ff3a6fc444eb8c008ebb32c859fb', '1', '系统登录', '1', '2017-11-08 16:55:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('667ddafbd99c4d019ca90b74a618054a', '1', '系统登录', '1', '2017-11-21 11:12:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('66bb4d5b9cef4d1b9b347338238f15ff', '1', '系统登录', '1', '2017-11-03 14:50:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('66c2c5365e344f9294a17d1a5408b014', '1', '项目-项目列表-报告下载', '1', '2017-11-07 11:32:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=28&fileType=1', '');
INSERT INTO `sys_log` VALUES ('66d28b08918b4e2281febb7372fc1530', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:27:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('66dbfe821dc440b49d294fd3a7cb2d33', '1', '项目-项目列表-结果审查', '1', '2017-10-27 12:19:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('66e65b0fc4814ea496fc31c9df30372d', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:45:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('677b75fe09c8410f97877ce5dc6113b9', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:55:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('680337d28e494f1eb71233a8f709571b', '1', '系统登录', '1', '2017-11-29 12:40:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('687c3a5f3ab94d449c895c2a0a9384f6', '1', '系统登录', '1', '2017-11-17 11:07:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('689d44711cd34b64820fb27981ba057f', '1', '系统登录', '1', '2017-12-08 09:49:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('68d814ad9fc544e295887c5531267386', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:06:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('6946de9cd5c64d73a29fa775a828dfd2', '1', '系统登录', '1', '2017-11-06 13:35:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6a721a482cd04ae3a02eb5fc5e1b8583', '1', '系统登录', '1', '2017-11-07 17:28:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6aa7da1f68e74dbc879499662d298ac1', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:46:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('6aaf7bfd3b61409092f2e2639a3c3c2f', '1', '系统登录', '1', '2017-12-07 17:55:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6abc2428d7154f3787382a0d469574cd', '1', '项目-项目列表-报告下载', '1', '2017-10-12 09:02:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=4&fileType=1', '');
INSERT INTO `sys_log` VALUES ('6ba60d40b395433a9e9301887af292cb', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:31:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=', '');
INSERT INTO `sys_log` VALUES ('6c04048d1a344214bd15cef6f09310d8', '1', '系统登录', '1', '2017-10-11 07:26:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6ce9c20c73b1487d8c986b9dbeba4e62', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 11:54:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('6d373fd8ca184c03ad2d2aa3b4a6c9ca', '1', '系统登录', '1', '2017-11-09 11:16:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6e05b400bacb4a41a275e032f47eeab5', '1', '系统登录', '1', '2017-11-27 16:39:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6e59d4e4614e46adafb0a794fc282a5a', '1', '系统登录', '1', '2017-11-10 09:57:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6e99d38db0084354a39e9049c5de3be2', '1', '项目-项目列表-结果审查', '1', '2017-10-19 09:25:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('6e9b3163ba554f2bbf372d837c702683', '1', '系统登录', '1', '2017-11-09 11:10:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6ec73d9d12b74e22ad963173d92e1209', '1', '系统登录', '1', '2017-11-17 15:52:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6ed8dabb5ee047a08b4686afb5f6c289', '1', '项目-项目列表-项目主页-项目详细-结果审查', '73b19d7c6288423683ec00b44579a5bb', '2017-11-13 16:00:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('6fc8abdd36ac4b39847235bd19d491d0', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:27:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'undefined', '');
INSERT INTO `sys_log` VALUES ('6fe27941495648399b2e5165149818a0', '1', '系统登录', '1', '2017-10-11 10:33:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6fe85649a6d741f5ad3ba1da45c4df1e', '1', '系统登录', '50b27251fb9c48cd8b93d7bee2e3d19a', '2017-11-10 14:37:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('6ff6892bbafe477eaef0bb07bf07a212', '1', '系统登录', '1', '2017-10-11 08:33:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('700ac4f60fa248d2a8a845a508027768', '1', '系统登录', '1', '2017-11-27 13:13:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7014049c0325490bbf24eb9092bea290', '1', '系统登录', '1', '2017-11-03 15:51:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('70268b7ccb91405eacd0f06d32881d9a', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:13:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('70354057c64f4e379c761ac0737e65eb', '1', '系统登录', '1', '2017-12-06 16:04:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7066c0ce528a492f873d518708cfdb58', '1', '系统登录', '1', '2017-12-05 13:30:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('708a14c5811442b596279aa97cec4173', '1', '项目-项目列表-结果审查', '1', '2017-10-19 09:31:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('7094502308ba4c7cb4db82efdbac79f8', '1', '系统登录', '1', '2017-11-07 15:43:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('70d4738004fa49a79b1da4a9f636bb83', '1', '系统登录', '1', '2017-11-17 10:46:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('712ae0b6c6574726b2f17543634f00f2', '1', '系统登录', '1', '2017-11-08 16:20:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7158ccbe02524996be07cf428da6ce98', '1', '系统登录', '1', '2017-11-09 16:01:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('71d1ad73dc07461b89ede5a5dd74eb15', '1', '系统登录', '1', '2017-12-04 10:49:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7227759d36114c2c8fa114b473b79bce', '1', '系统登录', '1', '2017-10-19 13:10:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('72360e8261eb4dcb844ef934dc78c243', '1', '系统登录', '1', '2017-11-09 17:17:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('729e35f463fa4975b4da8416265215b9', '1', '系统登录', '1', '2017-12-06 10:02:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('72a3d2c8dfb24326bad8f1e5fd185fc6', '1', '系统登录', '1', '2017-11-09 09:43:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7383213aa6bf46149de0dc4aab65deb9', '1', '系统登录', '1', '2017-11-03 15:10:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('73df7a89497f41359be1fcca0e603b27', '1', '系统登录', '1', '2017-11-06 09:28:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('74017a672c9d449398b17e02364e2cfa', '1', '系统登录', '1', '2017-10-19 09:24:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('74834c72a2914817abd017fa083de2cc', '1', '项目-项目列表-结果审查', '1', '2017-10-19 13:11:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('74b07dba1c234243b5d9116af19ba24d', '1', '系统登录', '1', '2017-11-02 12:10:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7501fccf31a0409aaa88f7e1abac6eab', '1', '系统登录', '1', '2017-11-21 14:50:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('754575db6ab04909af7362bd5cb0ab6b', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:31:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=', '');
INSERT INTO `sys_log` VALUES ('7674db36c8bc421aab6849a0e32b846a', '1', '系统登录', '1', '2017-11-08 16:30:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('774ba2dc29564239aac100cec9fb9a51', '1', '系统登录', '1', '2017-11-03 13:08:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('775220ad3e8f435180a4ceb8f64b1b38', '1', '系统登录', '1', '2017-11-22 15:28:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('77e2200c2640405484152693e6d09dd9', '1', '项目-项目列表-报告下载', '1', '2017-11-08 11:49:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=7&fileType=1', '');
INSERT INTO `sys_log` VALUES ('7804f817e6d848cbb6a953edf94eda1c', '1', '系统登录', '1', '2017-10-11 12:30:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('784ee82fdec046d0a4894b4e9f090dd6', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('785001f6aadc4cbaaa2b20f19b97f85e', '1', '系统登录', '1', '2017-11-21 10:36:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7865e27b57194eb5a6a850c627ce8f2f', '1', '系统登录', '1', '2017-11-03 15:30:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('78711bc6c6564d5f81732ae9878db145', '1', '项目-项目列表-结果审查', '1', '2017-10-25 16:55:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('787684c9d656467ebd9bcf5d77688315', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-24 13:06:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=37&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('7879804acf164bdab67bb9224847f899', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:09:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('790735dd35404e19953cb21ed2e59ec5', '1', '系统登录', '1', '2017-12-06 14:58:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7937230571d34a4cb1b65fb1c215b4cf', '1', '系统登录', '1', '2017-11-07 16:59:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('79590b82677840329001b1c5e83b56e8', '1', '项目-项目列表-结果审查', '1', '2017-10-18 10:24:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('796dd443b7be4b63a881d4651933c72b', '1', '系统登录', '1', '2017-12-07 17:44:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('796f177913ba46fe87d388518ac174d9', '1', '项目-项目列表-报告下载', '1', '2017-10-12 11:29:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('7a2a451f41bc4a118baa18dd42509d1d', '1', '系统登录', '1', '2017-11-21 09:30:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7a5f4ec28af642e6ab886544862dacc0', '1', '系统登录', '1', '2017-11-29 11:32:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7ae388bdad15497090ba8392ae7a6f15', '1', '系统登录', '1', '2017-11-28 18:24:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7b43441f9df74c4d8ae78912d840d00a', '2', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:02:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', 'org.apache.jasper.JasperException: An exception occurred processing JSP page /webpage/web/violationresults/violationresultsList.jsp at line 29\r\n\r\n26: 		<div class=\"accordion-inner\" hidden=\"true\">\r\n27: 			<form:form id=\"searchForm\" modelAttribute=\"analysisResult\" class=\"form form-horizontal well clearfix\">\r\n28: 				<form:hidden path=\"projectAnalysisId\"/>\r\n29: 				<form:hidden path=\"toolStatus\"/>\r\n30: 			</form:form>\r\n31: 			<input type=\"hidden\" id=\"test\" value=\"111\">\r\n32: 		</div>\r\n\r\n\r\nStacktrace:\r\n	at org.apache.jasper.servlet.JspServletWrapper.handleJspException(JspServletWrapper.java:579)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:476)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:396)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:340)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:292)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:716)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:466)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:391)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:318)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:168)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:303)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1257)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1037)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:980)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:622)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:292)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:262)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:212)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:94)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:504)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:141)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:79)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:620)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:88)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:502)\r\n	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1132)\r\n	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:684)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1533)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.run(NioEndpoint.java:1489)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.springframework.beans.NotReadablePropertyException: Invalid property \'toolStatus\' of bean class [cn.spac.checker.web.violation.entity.ViolationResults]: Bean property \'toolStatus\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?\r\n	at org.springframework.beans.AbstractNestablePropertyAccessor.getPropertyValue(AbstractNestablePropertyAccessor.java:619)\r\n	at org.springframework.beans.AbstractNestablePropertyAccessor.getPropertyValue(AbstractNestablePropertyAccessor.java:610)\r\n	at org.springframework.validation.AbstractPropertyBindingResult.getActualFieldValue(AbstractPropertyBindingResult.java:99)\r\n	at org.springframework.validation.AbstractBindingResult.getFieldValue(AbstractBindingResult.java:229)\r\n	at org.springframework.web.servlet.support.BindStatus.<init>(BindStatus.java:120)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getBindStatus(AbstractDataBoundFormElementTag.java:168)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getPropertyPath(AbstractDataBoundFormElementTag.java:188)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getName(AbstractDataBoundFormElementTag.java:154)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.autogenerateId(AbstractDataBoundFormElementTag.java:141)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.resolveId(AbstractDataBoundFormElementTag.java:132)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.writeDefaultAttributes(AbstractDataBoundFormElementTag.java:116)\r\n	at org.springframework.web.servlet.tags.form.AbstractHtmlElementTag.writeDefaultAttributes(AbstractHtmlElementTag.java:422)\r\n	at org.springframework.web.servlet.tags.form.HiddenInputTag.writeTagContent(HiddenInputTag.java:79)\r\n	at org.springframework.web.servlet.tags.form.AbstractFormTag.doStartTagInternal(AbstractFormTag.java:84)\r\n	at org.springframework.web.servlet.tags.RequestContextAwareTag.doStartTag(RequestContextAwareTag.java:80)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspx_meth_form_005fhidden_005f1(violationresultsList_jsp.java:1121)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspx_meth_form_005fform_005f0(violationresultsList_jsp.java:1047)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspService(violationresultsList_jsp.java:671)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:438)\r\n	... 68 more\r\n');
INSERT INTO `sys_log` VALUES ('7b814fb7fac84755a8a35ee47ea65027', '1', '系统登录', '1', '2017-11-17 14:11:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7b962b4884884d27a6845087b6c1d123', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:41:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'35', '');
INSERT INTO `sys_log` VALUES ('7c0304744bfe4bcea3266c30dd5cab36', '1', '项目-项目列表-结果审查', '1', '2017-10-12 09:57:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('7c301c2c05994310a3c1dc928a150272', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 13:26:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('7c4a196895d24a469a60cda25ffb6c37', '1', '项目-项目列表-结果审查', '1', '2017-10-12 14:00:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('7c6988f922a14069b2fd92e0e38af8a0', '1', '系统登录', '1', '2017-12-06 16:38:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7c998b7fe3f54830b5e5e39b11a1eac3', '1', '系统登录', '1', '2017-11-17 10:00:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7ca1acfd55cb40a99fa5435e17c5e679', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:45:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('7cbe9f2b3b154366abc779bb20b2e4e2', '1', '系统登录', '1', '2017-11-06 13:56:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7cc690d8612f46978aece4eb1627ae03', '1', '系统登录', '1', '2017-11-14 16:44:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7cd4775d75dd472da57181f779be4a6c', '1', '系统登录', '1', '2017-11-08 09:13:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7cf4afa5be4b4f399fc0384c43935f12', '1', '系统登录', '1', '2017-12-05 10:48:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7d28cd1880ff4985880e75165667200c', '1', '项目-项目列表-报告下载', '1', '2017-10-12 13:44:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('7dbdadf33ade415294640013a551ce6e', '1', '系统登录', '1', '2017-11-06 15:08:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7dd908f48fcd49c596c9e9510a19bcef', '1', '系统登录', '1', '2017-12-05 13:36:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7df22ddf270c42aa905580ac9cbc4940', '1', '系统登录', '1', '2017-11-07 16:32:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7ed9bcaac484482eae95d84e200f1572', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:13:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('7f8db9410bc64ad48f8217305a0e8367', '1', '系统登录', '1', '2017-12-05 13:54:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7f9085aad82746b4adadcb74115c3c0b', '1', '系统登录', '1', '2017-11-09 14:38:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7fa6f01d608345e387bc1404303ce8c0', '1', '系统登录', '1', '2017-11-08 15:52:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7faa3d7ab9674f7e83c542c7a515d023', '1', '系统登录', '1', '2017-11-03 10:37:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7fae394acc654737a6a816c6fef15f76', '1', '系统登录', '1', '2017-12-06 11:12:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('7fb2460c4a274db6aa89dc9231612167', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:53:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('7fc0c206313844b2acd8fca55529cdd6', '1', '系统登录', '1', '2017-11-02 12:00:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8020c5d8bdad44448f815122c1979792', '1', '项目-项目列表-项目主页-项目详细-结果审查', '50b27251fb9c48cd8b93d7bee2e3d19a', '2017-11-13 16:01:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('8057058a71514cdd8445b225d9b1bca3', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:45:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('8109fdbdfcd54be6a6af2e0ddf35820a', '1', '系统登录', '1', '2017-12-06 13:04:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('811c9749ba0a4e749315935a0491677f', '1', '系统登录', '1', '2017-11-17 10:40:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8139bda1c250437abaef27f05f0efb21', '1', '系统登录', '1', '2017-10-16 16:02:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('81481d3e36ee46ca895448a0fed1f7ae', '1', '系统登录', '1', '2017-11-09 11:45:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('817ae3dc8ad545b2a7e37bf039dcbaf6', '1', '系统登录', '1', '2017-11-29 11:45:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('81d08b50a5fc4b6eaabc3bea70fdea7d', '1', '系统登录', '1', '2017-11-16 12:54:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('81e05fff93b9438ebacf6b69761e7d4a', '1', '系统登录', '1', '2017-11-07 17:41:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8230512f8f134d79b9f69f6cb69f0b5f', '1', '系统登录', '1', '2017-12-05 15:40:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko/20100101 Firefox/56.0', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('82636558473f49e984c8fd69016f7d66', '1', '系统登录', '1', '2017-11-22 15:27:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('826bda5067ca490a9b211656c5cd3ba0', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 13:46:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('82ace3ff8d2f445b84e5255ea4aba5b3', '1', '项目-项目列表-结果审查', '1', '2017-10-16 20:36:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('8342630292aa4b3682c9b2ef9fa4e611', '1', '系统登录', '1', '2017-12-07 13:45:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8398b62f632e470abe6e478d5b4dad6a', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:09:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('840e3c4486a246b98d8b4f4078f70a83', '1', '系统登录', '1', '2017-11-13 16:30:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8425ac9d366b4a9e91bbb18971d63c05', '1', '系统登录', '1', '2017-11-06 13:43:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('84a42577acd641019c5182d2f88f5986', '1', '项目-项目列表-结果审查', '1', '2017-10-15 09:40:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('84ed4b4e2ec145ecb2f51194e03d8c14', '1', '系统登录', '1', '2017-11-08 14:22:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8548174de2fd4590ad1c10ed4138c079', '1', '系统登录', '1', '2017-10-25 16:50:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('854b2b406b194174a17eba5f50e41f08', '1', '系统登录', '1', '2017-11-15 13:14:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('856fb02451654a9fa67e6ed2668dd671', '1', '系统登录', '1', '2017-10-24 15:13:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/analysisset/analysisSet/form', 'GET', 'projectAnalysisId=21&checkupCount=1', '');
INSERT INTO `sys_log` VALUES ('857d2436a79f4a608eba5b4dfd50884f', '1', '系统登录', '1', '2017-11-09 09:33:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8656bc569a784773a0b59ff0ccf21fe6', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:26:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'undefined', '');
INSERT INTO `sys_log` VALUES ('8670bb8964bb40eeb38a4e3aab003dd7', '1', '系统登录', '1', '2017-11-28 09:48:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('86b0f51fa1a34afe8c8ccbf06d00fa8a', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:10:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('86d5c3f389254250badc9bee214682c6', '1', '系统登录', '1', '2017-11-08 10:03:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('873e38f71df742cdad75acc30d6c260f', '1', '系统登录', 'a0891d76540e4f27ad9424283c592dec', '2017-11-03 13:15:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('877d62e8df404f38aceeb5654673498c', '1', '系统登录', '1', '2017-11-28 09:37:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8813f29d5c964845abb1251e3d864ade', '1', '系统登录', '2e076bc7fc4847a4a6a4e5c144c67de6', '2017-11-10 14:56:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('889cb017d2d54e30a7e80381bf2d0fe3', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:16:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('895bb6e7652142f0a41e7ba9d30eb1a1', '1', '系统登录', '1', '2017-10-24 14:05:54', '192.168.8.104', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('896b4823b2b043318bc227688ef78430', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 11:54:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('89f6e1dbb9a74af9afda72b707e39d0a', '1', '系统登录', '1', '2017-11-06 14:24:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8a2d016b58d148b5be811c8cbefe64b5', '1', '项目-项目列表-结果审查', '1', '2017-10-11 09:49:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('8a710e91d51f4a9693ba10d36783fe6d', '1', '系统登录', '1', '2017-11-22 15:30:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8aad402b566d48d1b29530ea663bc3f8', '1', '系统登录', '1', '2017-11-23 09:18:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8ab396a549d8453b811218190edd60b9', '1', '系统登录', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 10:51:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8af2fce84e804d33b58550cc7d8a9a90', '1', '系统登录', '1', '2017-11-07 15:54:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8b505686192f4a928e2fbd2119a18c1e', '1', '项目-项目列表-项目主页-文件下载', '1', '2017-11-23 12:54:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project/downloadReport', 'GET', 'toolId=35&fileType=1', '');
INSERT INTO `sys_log` VALUES ('8b5fd69df5e5475c97ea09799caca957', '1', '系统登录', '1', '2017-11-17 11:49:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8b7dd0f6312847758e81cbc2a78865bd', '1', '系统登录', '1', '2017-11-10 14:56:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8cbceffb9ba5437397d8d062b473f5da', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:09:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('8cded5f52eb0461da758e7a455f1262e', '1', '系统登录', '1', '2017-11-09 14:46:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8d970283f87a4a209db9ba956c047a12', '1', '系统登录', '1', '2017-11-29 12:17:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8ddcf2d166b747b2bcc5f936564ad813', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:09:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('8df49474960d47c99356df5055e69fba', '1', '系统登录', '1', '2017-11-28 09:23:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8e4569ba9ea1466b902e3ad0774c522f', '1', '系统登录', '1', '2017-10-11 11:39:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8ee7b61d6f4744c3a26d76832f25e9fd', '1', '系统登录', '1', '2017-12-07 11:04:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('8f578af0fdc74e9485b221871640480e', '1', '系统登录', '1', '2017-11-17 14:07:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9011c8dde0a24ca588d0b1b8fbb07ecb', '1', '项目-项目列表-结果审查', '1', '2017-10-12 09:34:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('90ca11dedf7b481382dd4bf17605dd10', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 11:45:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('90ca764449d64eb0b98a408c367167fe', '1', '系统登录', '1', '2017-11-20 14:40:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('90f0a51a846149ff832691d7358f4baa', '1', '系统登录', '1', '2017-11-03 13:11:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('917fff788a044ca1afe0535e4732e4a1', '1', '项目-项目列表-结果审查', '1', '2017-10-12 13:42:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('9296b84d9da74d72a2b27225e28046e4', '1', '项目-项目列表-结果审查', '1', '2017-11-01 16:38:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('92e435885b134439bf8ce899610bc090', '1', '系统登录', '1', '2017-11-09 11:19:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9301fdf374ab49d1a02af40f9caa744c', '1', '系统登录', '1', '2017-11-27 16:37:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('93492c7972374e398c9350a2eadbcc3b', '1', '系统登录', '1', '2017-10-15 10:14:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('93ffb8cd45604e70bbb151a85ba35c8c', '1', '项目-项目列表-项目主页-文件下载', '1', '2017-11-13 11:13:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project/downloadReport', 'GET', 'toolId=21&fileType=1', '');
INSERT INTO `sys_log` VALUES ('9495964105b0455c800709909696fba9', '1', '项目-项目列表-结果审查', '1', '2017-10-12 13:34:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('94eb07a7f8d946abbd272b70200c2ff1', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:28:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('954adccbd9244ad5af11d564ec092d0f', '1', '项目-项目列表-报告下载', '1', '2017-10-12 09:02:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=7&fileType=1', '');
INSERT INTO `sys_log` VALUES ('95a1bc0198204efab2525a839bb021dc', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 17:01:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('95b09a5acc8549b19f26b95633ef9220', '1', '系统登录', '1', '2017-11-13 14:58:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('965139d5a0a7440a98ae0fdc5f5cdcb3', '1', '系统登录', '1', '2017-11-22 15:34:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('967a8e68cb61446d873c61fb72f78f28', '1', '系统登录', '1', '2017-12-05 09:48:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9746b986061247df9adc0e00960fc6c2', '1', '系统登录', '1', '2017-10-16 20:24:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('977a520333c444189f92a277e2e7814c', '1', '系统登录', '1', '2017-10-11 09:33:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('97e0a92e22084f14ae35fe3093a37a6a', '1', '系统登录', '1', '2017-12-07 15:46:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('98091f2bc76547b4aef4c458cb088288', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:36:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('985f64e74f884d59a11f59fffbd2738c', '1', '系统登录', '1', '2017-11-07 17:01:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('998782d88ccf4ba697db0ea7f214ed36', '1', '系统登录', '1', '2017-11-29 14:05:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9a3390ee10ac4e4eaffff3cb3f05aaf7', '1', '系统登录', '1', '2017-11-24 15:13:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9a426e4922df4cdc8df2b377e3e6d9bc', '1', '系统登录', '1', '2017-11-17 09:51:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9b0519f361744e78981a6d3af23c0cf8', '1', '项目-项目列表-结果审查', '73b19d7c6288423683ec00b44579a5bb', '2017-10-16 10:48:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=25', '');
INSERT INTO `sys_log` VALUES ('9b1ff191a1da448da34c6c4d8fbda885', '1', '系统登录', '1', '2017-11-09 11:25:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9b7bfdf089af4d1f97f4c2d414edc4fd', '1', '系统登录', '1', '2017-11-17 14:02:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9b9de9f747fa4d9aad21511c20c750ff', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:19:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('9bd16b31ca8f4ae8a7b94f75fcbb8bce', '1', '项目-项目列表-结果审查', '1', '2017-11-08 15:10:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('9be5adb649f1480a9d288029b58e124b', '1', '项目-项目列表-结果审查', '1', '2017-11-01 16:24:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('9bedb7de3ae34fc5b26579db73156c6a', '1', '项目-项目列表-结果审查', '1', '2017-11-01 16:38:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('9c4fcfd1d52948eda219f37c2f76bab5', '1', '系统登录', '1', '2017-11-09 10:42:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9c5caaf4c82f4b18b9fba09453f81467', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:41:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'35', '');
INSERT INTO `sys_log` VALUES ('9c8084800ef743b19a74dce9692ce188', '1', '系统登录', '1', '2017-11-14 13:58:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9d13775b0b8b43e3b742a9d86c8c0b39', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:11:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('9da1b9e28891426cb8daa137a1807b90', '1', '系统登录', '1', '2017-12-04 15:05:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9e08a41c449c4f0a91c440e2b850804f', '1', '项目-项目列表-结果审查', '1', '2017-10-12 09:42:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('9e1053ebba99408780743fef0389300d', '1', '系统登录', '1', '2017-10-11 13:20:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9e10bfcd3f1340d5a9772163d7db0c8f', '1', '系统登录', '1', '2017-11-17 10:30:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9e424604c7cf4780b4e09bc5fbacbce9', '1', '系统登录', '1', '2017-11-03 11:17:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9e4a049f83914ee392723249ca4994cd', '1', '系统登录', '1', '2017-10-24 10:15:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9edb6320671f41b09add3acbdbdfeef0', '1', '系统登录', '1', '2017-12-05 09:38:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9f0cd0b2fb084769beeb2a636247fc7e', '1', '系统登录', '1', '2017-11-09 17:16:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('9f39b80a1ede4c798071bfc2a4b5e0d6', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:16:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('9fc56c32ab0f46cda87c1f1005db225f', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('9fd84226a4f04ca2b9e8d3d1c12eb820', '1', '系统登录', '1', '2017-11-27 15:11:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a127346cb5514b20a1f65f8975c57bd9', '1', '系统登录', '1', '2017-11-03 13:14:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a246a715b7ac435499e4193a3cdafc31', '1', '系统登录', '1', '2017-11-17 16:54:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a2623621b02e40908fcd90d02119cf95', '1', '项目-项目列表-结果审查', '1', '2017-10-11 09:22:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=2', '');
INSERT INTO `sys_log` VALUES ('a2997de540f749d283864b92c9cec384', '1', '系统登录', '1', '2017-12-04 10:04:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a2aa453d61504e6b84919593eaa74d48', '1', '系统登录', '1', '2017-11-21 14:14:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a2f36487a6a442e69adab17e26ddcda9', '1', '系统登录', '1', '2017-11-15 15:10:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko/20100101 Firefox/56.0', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a3d87e8391b7401380a2c8d2494ffbcb', '1', '系统登录', '1', '2017-11-06 14:02:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a4f5d31f9e53467c860271da967ca2e8', '1', '系统登录', '1', '2017-12-07 16:24:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a50a4df3abc2481a8f97ce0698b85d72', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:21:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('a50d820e3e0646de815fb26b416ad519', '1', '系统登录', '1', '2017-11-14 16:02:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a51b1f1f28b94dd9b7ecd6d022351389', '1', '系统登录', '1', '2017-11-28 18:23:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a5316c949b0b45a98e4981e6bfc6b9f9', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:41:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('a56016f43a23483a8f3aa58ee9b4c45c', '2', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:01:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', 'org.apache.jasper.JasperException: An exception occurred processing JSP page /webpage/web/violationresults/violationresultsList.jsp at line 29\r\n\r\n26: 		<div class=\"accordion-inner\" hidden=\"true\">\r\n27: 			<form:form id=\"searchForm\" modelAttribute=\"analysisResult\" class=\"form form-horizontal well clearfix\">\r\n28: 				<form:hidden path=\"projectAnalysisId\"/>\r\n29: 				<form:hidden path=\"toolStatus\"/>\r\n30: 			</form:form>\r\n31: 			<input type=\"hidden\" id=\"test\" value=\"111\">\r\n32: 		</div>\r\n\r\n\r\nStacktrace:\r\n	at org.apache.jasper.servlet.JspServletWrapper.handleJspException(JspServletWrapper.java:579)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:476)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:396)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:340)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:292)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:716)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:466)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:391)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:318)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:168)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:303)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1257)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1037)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:980)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:622)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:292)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:262)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:212)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:94)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:504)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:141)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:79)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:620)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:88)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:502)\r\n	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1132)\r\n	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:684)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1533)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.run(NioEndpoint.java:1489)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.springframework.beans.NotReadablePropertyException: Invalid property \'toolStatus\' of bean class [cn.spac.checker.web.violation.entity.ViolationResults]: Bean property \'toolStatus\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?\r\n	at org.springframework.beans.AbstractNestablePropertyAccessor.getPropertyValue(AbstractNestablePropertyAccessor.java:619)\r\n	at org.springframework.beans.AbstractNestablePropertyAccessor.getPropertyValue(AbstractNestablePropertyAccessor.java:610)\r\n	at org.springframework.validation.AbstractPropertyBindingResult.getActualFieldValue(AbstractPropertyBindingResult.java:99)\r\n	at org.springframework.validation.AbstractBindingResult.getFieldValue(AbstractBindingResult.java:229)\r\n	at org.springframework.web.servlet.support.BindStatus.<init>(BindStatus.java:120)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getBindStatus(AbstractDataBoundFormElementTag.java:168)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getPropertyPath(AbstractDataBoundFormElementTag.java:188)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getName(AbstractDataBoundFormElementTag.java:154)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.autogenerateId(AbstractDataBoundFormElementTag.java:141)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.resolveId(AbstractDataBoundFormElementTag.java:132)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.writeDefaultAttributes(AbstractDataBoundFormElementTag.java:116)\r\n	at org.springframework.web.servlet.tags.form.AbstractHtmlElementTag.writeDefaultAttributes(AbstractHtmlElementTag.java:422)\r\n	at org.springframework.web.servlet.tags.form.HiddenInputTag.writeTagContent(HiddenInputTag.java:79)\r\n	at org.springframework.web.servlet.tags.form.AbstractFormTag.doStartTagInternal(AbstractFormTag.java:84)\r\n	at org.springframework.web.servlet.tags.RequestContextAwareTag.doStartTag(RequestContextAwareTag.java:80)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspx_meth_form_005fhidden_005f1(violationresultsList_jsp.java:1121)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspx_meth_form_005fform_005f0(violationresultsList_jsp.java:1047)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspService(violationresultsList_jsp.java:671)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:438)\r\n	... 68 more\r\n');
INSERT INTO `sys_log` VALUES ('a5a3678443624e81b62b93953045fc65', '1', '系统登录', '1', '2017-11-14 17:16:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a6663dfc3a974db1a91bb34940f7db6e', '1', '系统登录', '1', '2017-12-04 16:02:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a68ae3e8800e40458f39ef20df35227d', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:55:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('a760080775fa48d6ad97a15be4243f64', '1', '系统登录', '1', '2017-10-11 11:56:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a77232c35618477e9b73a4d74aabcb5f', '1', '系统登录', '2e076bc7fc4847a4a6a4e5c144c67de6', '2017-10-16 10:38:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a77b4d48797149d3841f2a1cfa8391a1', '1', '系统登录', '1', '2017-11-28 18:13:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a793dbe389794b12aa777147930f061f', '1', '系统登录', '1', '2017-11-13 15:44:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a81b0ad51db840f49a3fea3cfd7adde1', '1', '项目-项目列表-报告下载', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 15:58:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=25&fileType=1', '');
INSERT INTO `sys_log` VALUES ('a8a2900f9303437d98e82003094912b2', '1', '系统登录', '1', '2017-11-17 10:32:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a8ecf51e14bc4872b42705fd2f6a8ff9', '1', '系统登录', '1', '2017-11-02 10:22:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a94fcef5c29f493da23f8eb0c661008a', '1', '系统登录', '1', '2017-11-03 11:03:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a960553caee040a0852e296e5523fa09', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:20:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('a97706ed97c648cdbe50afd4262d5b6e', '1', '系统登录', '1', '2017-11-24 13:47:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a9d0018678b44a98b93b0509b61a4d58', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:25:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('a9d3f2833c32497f9ee2ecd3c1a434b5', '1', '系统登录', '1', '2017-11-17 12:05:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('aa406ef62caf42f48822b23d62729a82', '1', '系统登录', '1', '2017-11-07 18:06:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('aa796d5d6dff47dc80a6e7c502f79275', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:00:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('aa8a74be81664e82a8ce80243e1b1b21', '1', '系统登录', '1', '2017-12-07 13:02:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('aa9a4d9ba10e4c4e90dd9c53e9e76720', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:19:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('aadcb06714da44089db22d8419efbb67', '1', '系统登录', '1', '2017-11-17 14:05:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ab1a436bf0c143f1879c1221f07d6843', '1', '系统登录', '1', '2017-11-17 11:36:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ab33e60baa604dcd809ff4b15347ffad', '1', '系统登录', '1', '2017-11-07 16:49:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ab4faf80484347e0ac791f91d26ba48b', '1', '系统登录', '1', '2017-11-14 14:39:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ab590bf92af64dbba80c78c68c85c0f9', '1', '项目-项目列表-报告下载', '1', '2017-10-11 11:36:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('ab9a08852c2f481d88f937957ad0b15b', '1', '系统登录', '1', '2017-11-27 11:31:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('abf5b2070960495b8f2556ac02037ec9', '1', '系统登录', '1', '2017-11-14 17:23:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('abf706297816429dbe91190212eaaffb', '1', '系统登录', '1', '2017-11-22 13:26:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ac00e20c663048fa8b05e909607228bf', '1', '系统登录', '1', '2017-10-18 10:24:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ac27c96011704017bcada5e9b3f08df9', '1', '系统登录', '1', '2017-11-06 14:30:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ac51abb06b454f07bad3068880394456', '1', '系统登录', '1', '2017-11-14 09:57:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('acee5a3746ab427983624691c5f3c79f', '1', '系统登录', '1', '2017-11-03 11:53:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ad3ac0e4ed294d6382e2054d6c3c2422', '1', '系统登录', '1', '2017-11-03 10:41:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ad746db39b9f418497b4e5335cd82538', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:08:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('add20923321340288683793640bcf39e', '1', '系统登录', '1', '2017-12-05 14:23:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko/20100101 Firefox/56.0', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ae1dc7d9b7284de4b596e7cfbbfdc8f5', '1', '系统登录', '1', '2017-11-20 15:15:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ae6fa35d7527439ea0564c86ce4a28cc', '1', '系统登录', '1', '2017-11-13 15:46:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('af2140af7fb941928c2fca9b25c2c602', '1', '系统登录', '1', '2017-10-15 09:53:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('af9f09df6b094fadb5aa78639feb337b', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 13:43:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('afff3559e2e84d50842be6f486afc0ed', '1', '系统登录', '1', '2017-11-29 09:42:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b04982f692c0428a8f0f5ac2a67ec03e', '1', '系统登录', '1', '2017-10-12 13:10:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b062ad26dafc47d99ece00a0f3ffe733', '2', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:02:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', 'org.apache.jasper.JasperException: An exception occurred processing JSP page /webpage/web/violationresults/violationresultsList.jsp at line 29\r\n\r\n26: 		<div class=\"accordion-inner\" hidden=\"true\">\r\n27: 			<form:form id=\"searchForm\" modelAttribute=\"analysisResult\" class=\"form form-horizontal well clearfix\">\r\n28: 				<form:hidden path=\"projectAnalysisId\"/>\r\n29: 				<form:hidden path=\"toolStatus\"/>\r\n30: 			</form:form>\r\n31: 			<input type=\"hidden\" id=\"test\" value=\"111\">\r\n32: 		</div>\r\n\r\n\r\nStacktrace:\r\n	at org.apache.jasper.servlet.JspServletWrapper.handleJspException(JspServletWrapper.java:579)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:476)\r\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:396)\r\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:340)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:292)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.catalina.core.ApplicationDispatcher.invoke(ApplicationDispatcher.java:716)\r\n	at org.apache.catalina.core.ApplicationDispatcher.processRequest(ApplicationDispatcher.java:466)\r\n	at org.apache.catalina.core.ApplicationDispatcher.doForward(ApplicationDispatcher.java:391)\r\n	at org.apache.catalina.core.ApplicationDispatcher.forward(ApplicationDispatcher.java:318)\r\n	at org.springframework.web.servlet.view.InternalResourceView.renderMergedOutputModel(InternalResourceView.java:168)\r\n	at org.springframework.web.servlet.view.AbstractView.render(AbstractView.java:303)\r\n	at org.springframework.web.servlet.DispatcherServlet.render(DispatcherServlet.java:1257)\r\n	at org.springframework.web.servlet.DispatcherServlet.processDispatchResult(DispatcherServlet.java:1037)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:980)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:897)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:970)\r\n	at org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:861)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:622)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:846)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:292)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.obtainContent(SiteMeshFilter.java:129)\r\n	at com.opensymphony.sitemesh.webapp.SiteMeshFilter.doFilter(SiteMeshFilter.java:77)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter$1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:346)\r\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:262)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:197)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:240)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:207)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:212)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:94)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:504)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:141)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:79)\r\n	at org.apache.catalina.valves.AbstractAccessLogValve.invoke(AbstractAccessLogValve.java:620)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:88)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:502)\r\n	at org.apache.coyote.http11.AbstractHttp11Processor.process(AbstractHttp11Processor.java:1132)\r\n	at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:684)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1533)\r\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.run(NioEndpoint.java:1489)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.springframework.beans.NotReadablePropertyException: Invalid property \'toolStatus\' of bean class [cn.spac.checker.web.violation.entity.ViolationResults]: Bean property \'toolStatus\' is not readable or has an invalid getter method: Does the return type of the getter match the parameter type of the setter?\r\n	at org.springframework.beans.AbstractNestablePropertyAccessor.getPropertyValue(AbstractNestablePropertyAccessor.java:619)\r\n	at org.springframework.beans.AbstractNestablePropertyAccessor.getPropertyValue(AbstractNestablePropertyAccessor.java:610)\r\n	at org.springframework.validation.AbstractPropertyBindingResult.getActualFieldValue(AbstractPropertyBindingResult.java:99)\r\n	at org.springframework.validation.AbstractBindingResult.getFieldValue(AbstractBindingResult.java:229)\r\n	at org.springframework.web.servlet.support.BindStatus.<init>(BindStatus.java:120)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getBindStatus(AbstractDataBoundFormElementTag.java:168)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getPropertyPath(AbstractDataBoundFormElementTag.java:188)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.getName(AbstractDataBoundFormElementTag.java:154)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.autogenerateId(AbstractDataBoundFormElementTag.java:141)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.resolveId(AbstractDataBoundFormElementTag.java:132)\r\n	at org.springframework.web.servlet.tags.form.AbstractDataBoundFormElementTag.writeDefaultAttributes(AbstractDataBoundFormElementTag.java:116)\r\n	at org.springframework.web.servlet.tags.form.AbstractHtmlElementTag.writeDefaultAttributes(AbstractHtmlElementTag.java:422)\r\n	at org.springframework.web.servlet.tags.form.HiddenInputTag.writeTagContent(HiddenInputTag.java:79)\r\n	at org.springframework.web.servlet.tags.form.AbstractFormTag.doStartTagInternal(AbstractFormTag.java:84)\r\n	at org.springframework.web.servlet.tags.RequestContextAwareTag.doStartTag(RequestContextAwareTag.java:80)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspx_meth_form_005fhidden_005f1(violationresultsList_jsp.java:1121)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspx_meth_form_005fform_005f0(violationresultsList_jsp.java:1047)\r\n	at org.apache.jsp.webpage.web.violationresults.violationresultsList_jsp._jspService(violationresultsList_jsp.java:671)\r\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:70)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\r\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:438)\r\n	... 68 more\r\n');
INSERT INTO `sys_log` VALUES ('b08d39a2d6b1488eb00ed406e5db0898', '1', '系统登录', '1', '2017-11-17 14:20:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b097e0c7b10043b5b1b68b85f94b3ff4', '1', '系统登录', '1', '2017-12-07 14:46:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/tooltype/toolType/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b0c22ae81da140648af41dbd52f6f94a', '1', '系统登录', '1', '2017-12-05 10:06:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b11871146fcf4f46a7da691019f4ec9c', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-20 13:46:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('b16df17bc0d749bd95e4188f2f0b20f3', '1', '项目-项目列表-结果审查', '1', '2017-10-11 13:52:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('b1834a247bb24512aaaea1081bb9c920', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 14:44:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('b18c57a6b947468fb6896bb5b2b88d49', '1', '系统登录', '1', '2017-12-07 09:55:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b2283e48783a4a0abc8843dea0267659', '1', '项目-项目列表-项目主页-结果审查', '73b19d7c6288423683ec00b44579a5bb', '2017-11-10 14:36:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=8', '');
INSERT INTO `sys_log` VALUES ('b238de6e19e04e31b10d80981eff6c3b', '1', '系统登录', '1', '2017-11-03 09:50:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b2550989854941cf8843e01a817364f4', '1', '项目-项目列表-结果审查', '1', '2017-10-27 12:16:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('b29d8bd52dfe47d5af60be438e5a0c3b', '1', '系统登录', '1', '2017-12-07 10:07:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b2fb7ff0623f411d9d34dd86dc0af4b0', '1', '系统登录', '1', '2017-11-13 11:27:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b317fc567d71473daade25bffa88ad3b', '1', '系统登录', '1', '2017-11-15 11:49:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b32281302b684290be438e62d9e401fe', '1', '系统登录', '1', '2017-10-13 10:07:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b38e595eee0e433380f34ee99b035ee0', '1', '系统登录', '1', '2017-11-17 11:31:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b4016cba552843ab894790a54e4accf6', '1', '系统登录', '1', '2017-12-05 15:56:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b45bc3581b754f4a82e6c867750076c3', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:23:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('b45ca8b28c0046b5a7e259b37503fd68', '1', '系统登录', '1', '2017-10-11 07:31:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b48fd20177f04539928f323008274108', '1', '系统登录', '1', '2017-11-02 10:24:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b4a638ca3a2344e58e485fef2b217353', '1', '系统登录', '1', '2017-11-13 16:28:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b4d9c22bbb24428a8c8a415294e7941a', '1', '系统登录', '1', '2017-11-28 09:33:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b5b4f767109f491389307414988c1ed6', '1', '系统登录', '1', '2017-12-04 16:04:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b6114e3e5d444092b28d2df5a6ea1c49', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('b61acfbcbb0744fcb28deb498ffb99fb', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:41:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'35', '');
INSERT INTO `sys_log` VALUES ('b6881d42a61143e5b97bc6c09aafb67e', '1', '系统登录', '1', '2017-11-29 14:38:12', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b7153743370f4d619ffc1b6979e6d640', '1', '系统登录', '1', '2017-11-09 13:16:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b721fdaa15f145f18ebbbc5daab68aeb', '1', '系统登录', '1', '2017-12-06 11:44:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b734239952674072b291add3f7b33ba2', '1', '项目-项目列表-结果审查', '1', '2017-11-01 14:59:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('b74998660fe541619bba92aead8e2d58', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:41:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'35', '');
INSERT INTO `sys_log` VALUES ('b78d0c1da4c247c68276ea9bbd800910', '1', '系统登录', '1', '2017-10-27 09:02:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b7993a942f9b431a9f3d385667f1014d', '1', '项目-项目列表-结果审查', '1', '2017-11-06 09:59:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('b7f8a00eaad0481b86b5a67fa2209dd7', '1', '系统登录', '1', '2017-11-14 14:17:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b80e547a9e4f41f49c5b8f2f5fd45288', '1', '系统登录', 'a0891d76540e4f27ad9424283c592dec', '2017-11-13 15:59:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b866d0619eed4b85a427222feb902a2e', '1', '系统登录', '1', '2017-11-01 17:47:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('b8b7eb7336494e3d93d213a56b98c705', '1', '项目-项目列表-结果审查', '1', '2017-10-11 09:33:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('b9c023c5234e421bb674bb6bfcb234e6', '1', '系统登录', '1', '2017-12-08 10:14:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ba54f55f8368472382486db36110b81c', '1', '系统登录', '1', '2017-11-17 13:02:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('babf496474ee4e6497c164ae9db20994', '1', '项目-项目列表-结果审查', '1', '2017-10-19 10:14:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('bae560a41f80434e807ffe6242cf6ea6', '1', '系统登录', '50b27251fb9c48cd8b93d7bee2e3d19a', '2017-11-10 14:36:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('baf5069d4ec3426895d2d3ea7483a556', '1', '项目-项目列表-结果审查', '1', '2017-10-12 10:18:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=2', '');
INSERT INTO `sys_log` VALUES ('baf5a4f63136408da40d5c646966948a', '1', '系统登录', '1', '2017-11-29 11:21:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bb11a4f401e64647994f554c6fe04c71', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-13 16:16:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('bb53a8eeeae64be7a512b46f95e1715e', '1', '系统登录', '1', '2017-11-15 16:33:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bb8038daa73646a6b51b4e8a7d8b878a', '1', '系统登录', '1', '2017-11-09 14:25:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bb94bdeff6664cf287ac3a98e6aca0b4', '1', '系统登录', '1', '2017-11-07 15:32:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bbf68fce33764ba6bfa14036264986b7', '1', '系统登录', '1', '2017-12-05 15:43:14', '192.168.8.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bc0162809f5e40df965cfac535582bdf', '1', '项目-项目列表-报告下载', '1', '2017-11-07 11:32:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=28&fileType=1', '');
INSERT INTO `sys_log` VALUES ('bc8e0a29e345477fafd459f51b1c47a9', '1', '项目-项目列表-结果审查', '1', '2017-11-07 11:31:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=28', '');
INSERT INTO `sys_log` VALUES ('bd3a3ff79ec34172b55e1ac154fd2040', '1', '项目-项目列表-报告下载', '1', '2017-11-07 11:32:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=28&fileType=1', '');
INSERT INTO `sys_log` VALUES ('bd44d03f4dbd4a8d8ee7987a4078a403', '1', '系统登录', '1', '2017-10-11 13:56:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bd59a9f8662542779d831e115f913bfe', '1', '系统登录', '1', '2017-10-13 11:23:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bdffe7ed9fb44d19bf897e4b735cbe5c', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:46:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('beca48b848b0400e93122576de7161aa', '1', '项目-项目列表-结果审查', '1', '2017-11-06 10:16:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('becc21c5778d4132a2d53d52f49699a1', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:10:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('beed4bf96452490ebf25fccd26d001da', '1', '系统登录', '1', '2017-11-29 09:39:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bf2dc0d351084618ab3c2ca0606cb78d', '1', '系统登录', '1', '2017-12-04 11:25:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bf9c35ed6b5b44d799983fb4a63de42f', '1', '系统登录', '1', '2017-12-07 18:10:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bfc6abc76a854353b6728f9bada0523f', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:04:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('bfcb637e7272482e8f84f9b5cef45e63', '1', '系统登录', '1', '2017-10-27 12:11:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('bfcf6098a33b4268acf7ffa3f9b23d62', '1', '系统登录', '1', '2017-11-02 16:23:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c0665616957645459af705c3666b5784', '1', '项目-项目列表-结果审查', '1', '2017-11-07 18:03:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('c06ad037e54a4e95abbf353368ad1b7b', '1', '系统登录', '1', '2017-11-03 15:47:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c0ba3b732b7a4b8688d2012e30bc8ebf', '1', '系统登录', '1', '2017-11-20 14:11:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c0d3b4ffd5bd4ff99765c3eb3e7828b9', '1', '项目-项目列表-报告下载', '1', '2017-10-12 10:37:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=9&fileType=1', '');
INSERT INTO `sys_log` VALUES ('c1778cc9de644d87ba8964f5647da352', '1', '系统登录', '1', '2017-10-16 10:50:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c182600aff58415db54bb705d0e8b7c6', '1', '系统登录', '1', '2017-11-13 12:57:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c18455842093491fad9174d7fbb2d5a1', '1', '项目-项目列表-结果审查', '1', '2017-10-11 09:01:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=2', '');
INSERT INTO `sys_log` VALUES ('c1de4acb35164beaa8fde3472462fea6', '1', '系统登录', '1', '2017-11-02 15:01:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c1e9e92841c54ad6891c5a56b0c3fd78', '1', '系统登录', '1', '2017-10-12 13:11:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c274033540d2498d8ee29311830dd8fa', '1', '系统登录', '2e076bc7fc4847a4a6a4e5c144c67de6', '2017-11-13 15:46:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c2bf29add4214e4bbf020bbcf057dbbe', '1', '系统登录', '1', '2017-11-06 09:43:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c367b51383914e66bae38790e6d1f891', '1', '项目-项目列表-报告下载', '1', '2017-11-07 15:57:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=39&fileType=1', '');
INSERT INTO `sys_log` VALUES ('c39b669c8e7d4d3cbb4a7d901a3c2d44', '1', '系统登录', '1', '2017-11-13 11:00:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c3b02d7077254582ac1488f0565ec0b7', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:23:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('c403d0795e1244e09fdba568b486b7a9', '1', '系统登录', '1', '2017-11-15 11:53:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c4a6d853ca4645bf91f0113ba7822dd0', '1', '项目-项目列表-结果审查', '1', '2017-10-19 13:10:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('c4de12b20c344fd784d773ecd7ce39b5', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:49:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('c4eba1106cc846c2af9c40d32eab8d43', '1', '系统登录', '1', '2017-12-08 09:48:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c56e34d4d0d5443680908e4f141fc171', '1', '系统登录', '1', '2017-11-20 15:38:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c62a9241a8364b2097a185bd4e8f9459', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:28:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('c62b688c1df64bb482357e8c6e8e0115', '1', '系统登录', '1', '2017-11-28 10:06:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c62c95cd72624dd2800ae3b23f395bce', '1', '系统登录', '1', '2017-11-08 11:37:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c62dfa29c6984a7eb5ce5b5324c5e011', '1', '系统登录', '1', '2017-11-24 14:29:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 Edge/16.16299', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c693b79069824c9499eee1a57f767c3e', '1', '系统登录', '1', '2017-11-15 13:09:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c6c32f18e6b34539980e65472e9c3369', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:09:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('c6ce353f97044d3690a4393fa8912678', '1', '系统登录', '1', '2017-11-17 11:53:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c6e6e7f64f9e4e47996a85df16b5583a', '1', '系统登录', '1', '2017-11-20 11:07:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c72c207043d4489b9b73e4d76e669980', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-13 16:16:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('c7539bd03de64d258c1cc8c67a5a8867', '1', '项目-项目列表-结果审查', '1', '2017-10-12 10:02:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('c76e800cb75843fd9d6902bc4f5b08b7', '1', '系统登录', '1', '2017-11-13 15:03:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project/projectDetail', 'GET', 'toolId=35&state=2', '');
INSERT INTO `sys_log` VALUES ('c7cfb43c561c4a8cb6216db2ac1b48ba', '1', '项目-项目列表-报告下载', '1', '2017-10-11 12:30:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('c80caa82777448c9a14e6222f4b9dc95', '1', '系统登录', '1', '2017-12-05 13:45:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c80e949a404e49558c7b63f859c54382', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:20:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('c8429159693d4ac4a883fd1c56b49b14', '1', '系统登录', '1', '2017-11-13 09:30:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c88cd162e36b44d8997d7a7784efa65f', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:19:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('c88f87d5429f47259c459b1b59b2461c', '1', '系统登录', '1', '2017-11-13 13:32:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c8a48121b9f74111bbf2393c858170d3', '1', '系统登录', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 10:24:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c8ca73d837d841f6b69b1da3e0aea02b', '1', '系统登录', '1', '2017-11-27 13:33:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c8cc5e7909e7470c9734444eb11445f7', '1', '系统登录', '1', '2017-11-17 14:33:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c8fde0672208461ab771d408312484c6', '1', '项目-项目列表-报告下载', '1', '2017-10-12 09:02:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=9&fileType=1', '');
INSERT INTO `sys_log` VALUES ('c92a7da442d64f7e8765b39d9589e17c', '1', '项目-项目列表-结果审查', '1', '2017-10-24 14:07:23', '192.168.8.104', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('c938a3d6b96940729e36d2727a85d61e', '1', '系统登录', '1', '2017-11-29 11:42:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c9bcdddc78254258a5d7f37a1a01bacf', '1', '系统登录', '1', '2017-11-20 14:27:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('c9c96d356b2e4544a08dc0be5c9cc4c0', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:38:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('ca1643575efe41328377159c3a93d2a7', '1', '系统登录', '1', '2017-11-09 17:28:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ca58cd4d84774e0eb790b1600faae8f4', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:35:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('cac1e9fb41e54161b46acb687097817f', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:41:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('cb7d991596774d1984f85e9ddee7a242', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:59:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32', '');
INSERT INTO `sys_log` VALUES ('cb8294d9ea93456284da3d3b38dbbfe1', '1', '系统登录', '1', '2017-11-08 09:33:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('cb83b73779ff4fd0b823b72cabb0116a', '1', '系统登录', '2e076bc7fc4847a4a6a4e5c144c67de6', '2017-11-13 16:02:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('cbfb523531994b1398120d6381bc2f7e', '1', '系统登录', '50b27251fb9c48cd8b93d7bee2e3d19a', '2017-11-13 16:01:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('cca06741257a480ea906c7888dcecd6c', '1', '项目-项目列表-结果审查', '1', '2017-10-11 14:02:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('ccffd4f3e4a44fdea5ff13edf064a3e4', '1', '系统登录', '1', '2017-11-21 14:13:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('cd1c353323a74c59bb9eaec98eb2f387', '1', '系统登录', '1', '2017-11-02 14:15:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('cd58b2285d8348a8860712c49f77a0c0', '1', '项目-项目列表-报告下载', '1', '2017-10-12 10:36:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('cdd5e90befe8487d8b55c50764bee364', '1', '系统登录', '1', '2017-11-08 14:17:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('cde3786f800c4f0b844dbff0312a9117', '1', '系统登录', '1', '2017-11-17 09:22:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ce41984877a842f68a79870e235e85b3', '1', '系统登录', '1', '2017-12-06 13:36:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ceeb9b9ac1b744c78af061ce0b50dda1', '1', '系统登录', '1', '2017-10-16 21:20:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('cf4d64b5e12f4c72b4efbb478b9fc1e4', '1', '项目-项目列表-结果审查', '1', '2017-11-01 16:25:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=25', '');
INSERT INTO `sys_log` VALUES ('d0de003b284840e392da981844d254c6', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:43:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('d15d18724e184925af37806fa145b9e6', '1', '系统登录', '1', '2017-12-05 15:57:22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d1b37ff85fa9437ea6e8faf28f72deca', '1', '系统登录', '1', '2017-11-27 11:22:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d1c61c5ad20147a6985857169edbe136', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:11:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('d24193173baf450e89771ab502758d32', '1', '系统登录', '1', '2017-11-22 10:43:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d26f29c5746a4106a23415471031076b', '1', '系统登录', '1', '2017-11-03 13:16:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d2de9890b30d488caff4745d5dc7e99a', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:55:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('d3559b887fac4fd9bbf895f74538f472', '1', '系统登录', '1', '2017-11-23 12:40:21', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d364a5427238498dbc5d333371f8d49d', '1', '项目-项目列表-报告下载', '1', '2017-10-11 11:56:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=5&fileType=1', '');
INSERT INTO `sys_log` VALUES ('d3dd7d3e604d449d88edd3a17ad04812', '1', '项目-项目列表-结果审查', '1', '2017-11-08 09:14:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('d43064eed8f04c1ebbfc33ac0f371174', '1', '系统登录', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 14:15:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d4bb732e06d843a3a45d699fe60d6dd3', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:52:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('d4f05c5e6f3b416e9363c82b3598e48d', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:42:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('d561dc279e01498d86d3f06e05e8c5ac', '1', '系统登录', '1', '2017-11-22 13:28:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d61798e915684e158990b6c7b3776d49', '1', '系统登录', '1', '2017-11-03 09:39:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d6472dd3a1654be08c2bd0d213f6dce4', '1', '系统登录', '1', '2017-11-09 10:45:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d64da0bd6a0845cc8e43283377cad482', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:39:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'undefined', '');
INSERT INTO `sys_log` VALUES ('d65901de668b444296d586ceff028a46', '1', '项目-项目列表-结果审查', '1', '2017-11-01 16:30:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('d689d8e3c2514ab9871c96cdba5882e5', '1', '系统登录', '1', '2017-11-09 09:26:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d6c53f51e9844f85b0f7349eacee6357', '1', '系统登录', '1', '2017-11-17 14:24:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d6d37cb4e2524f3985369e0f6e0ffcac', '1', '系统登录', '1', '2017-11-13 14:07:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d71621539a334ba69d11098a7d08b506', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:19:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('d75f0ffb415d44b6aea8820c0a46f080', '1', '系统登录', '1', '2017-11-01 17:49:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d766a16a51be491c880cd874f10314aa', '1', '系统登录', '1', '2017-10-17 09:10:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d84e2e83b778455ba0af7f2d97b06d63', '1', '项目-项目列表-结果审查', '1', '2017-11-08 09:36:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('d8f29eb8ba904cf0869682a3d94b9436', '1', '系统登录', '1', '2017-12-04 10:33:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d8f6d48b16b54edabaae88fec1bd333e', '1', '系统登录', '1', '2017-11-20 09:47:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d94ecb50af4b474fab8ceb9dc5dafe45', '1', '系统登录', '1', '2017-11-09 14:22:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('d98c5beae955404ead359abbd8226cc0', '1', '项目-项目列表-结果审查', '1', '2017-10-15 09:41:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=22', '');
INSERT INTO `sys_log` VALUES ('d9e0f7944627463a8d4b31366e88f5a1', '1', '系统登录', '1', '2017-12-07 11:15:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('daa549da95da41fd9dd21b2b4c369f57', '1', '系统登录', '1', '2017-11-28 09:19:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('db457169e11c4d479b436495b3e68f8f', '1', '系统登录', 'f8d1ae3734c14c65bf4e1c5ffff6774b', '2017-10-16 15:17:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/checkup/checkUp/form', 'GET', 'id=&analysisResultId=10224', '');
INSERT INTO `sys_log` VALUES ('db9168d2dcea4aabacc78d76c3ac2c97', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('db97ae3781b945a0b88320448ca44b8b', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 11:24:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('dbedb2d62bb3410e9905d1e9d8409dcf', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:41:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('dc2e077eb2bb4458a57381ae218c3582', '1', '项目-项目列表-报告下载', '1', '2017-10-12 13:39:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=1&fileType=1', '');
INSERT INTO `sys_log` VALUES ('dc6716583f8544ed945dd301395d119c', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:42:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('dcd46911e02d48d79c1866c98a5e0041', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:41:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('dcd5a30121f64f22943bf83d4e8e4a87', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:21:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('dd5104fe012c4a6695162e28e01b2d40', '1', '系统登录', '1', '2017-11-17 17:02:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('dd777a7f05664a3c985f4efdb8d7e9f9', '1', '系统登录', '1', '2017-11-09 09:46:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('de313433f8c64193b4ba628fd061eaa3', '1', '系统登录', '1', '2017-11-20 09:29:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('def576d12d6042f0813b4e90bb6ffdd7', '1', '系统登录', '1', '2017-12-04 16:01:15', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('df28fbb81abe402383a0d098f7390580', '1', '系统登录', '1', '2017-10-11 09:24:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('df507e2e85ed465cb2153499245cf71f', '1', '系统登录', '1', '2017-10-16 20:10:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('df563c93e8674170a1d12bf95c2cdbef', '1', '系统登录', '1', '2017-12-08 10:00:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('df67b433369241388ada25e63a36bb95', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:44:06', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('df6f0b6b594f4232a5aa3358f3135482', '1', '系统登录', '1', '2017-11-22 13:11:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('df7d4c4fe5814809931454633204b990', '1', '系统登录', '1', '2017-11-17 11:02:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('df9dd18c2f8640288488c13492406e4c', '1', '系统登录', '1', '2017-11-01 16:28:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('dfd24cdc78294038a84440a69847e536', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:03:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('dfebdf695e0b4035b46eefa6fd57de9a', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:40:18', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'35', '');
INSERT INTO `sys_log` VALUES ('dff986890c034090a45541bb6f3f89b0', '1', '系统登录', '1', '2017-10-16 10:29:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('dffa60c59a574509919d51352a8235e9', '1', '系统登录', '1', '2017-11-08 10:15:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('dfff9d7385314c758fa5dde479863b34', '1', '系统登录', '1', '2017-11-22 09:22:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e01d509ef6de4cc6b989ed68f07730e1', '1', '系统登录', '1', '2017-12-05 13:13:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e0542675905747c3ac6eec5464084473', '1', '系统登录', '1', '2017-11-07 16:13:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e07bc8b88e8b497a913aef41670a20d0', '1', '项目-项目列表-结果审查', '1', '2017-10-16 21:21:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('e190afd06f7d4e01a33de2ba3d5bc26c', '1', '项目-项目列表-报告下载', '1', '2017-10-11 09:34:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('e1d67495a89d4f81bedbcb6fbfd29159', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:38:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('e1e2463cd67c4b3aa77310d269f4aec5', '1', '系统登录', '1', '2017-11-08 15:19:55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e2023b46c80a4556938f89c944af382a', '1', '项目-项目列表-结果审查', '1', '2017-10-16 10:34:36', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=25', '');
INSERT INTO `sys_log` VALUES ('e2e5290ef0cf4204aa8a3562ef11391e', '1', '系统登录', '1', '2017-12-04 10:25:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e2fcdf9bcfb9413ab40b5fb31de8e202', '1', '系统登录', 'a0891d76540e4f27ad9424283c592dec', '2017-11-13 15:59:45', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e35a342c474d4fb2ae93ffd4c2226d21', '1', '项目-项目列表-报告下载', '1', '2017-10-11 09:35:16', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=5&fileType=1', '');
INSERT INTO `sys_log` VALUES ('e37130e8795b470d80620bf5e630ada2', '1', '系统登录', '1', '2017-11-29 13:10:48', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e3793a8cfe4643b28284b955bbd059d0', '1', '系统登录', '1', '2017-11-03 09:37:41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e396a6cfe9db461985061aa11fde79cf', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:42:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('e3bc30780dc840e392633f703e3a41ff', '1', '系统登录', '1', '2017-10-17 10:29:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e45757c8c7924fec8155041902694f42', '1', '系统登录', '1', '2017-11-16 12:51:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e4c2b54fb6464983b8f03908727290e1', '1', '系统登录', '1', '2017-11-17 15:46:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e4e47051ceba42fcb3220a5534db7729', '1', '系统登录', '1', '2017-11-17 13:10:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e53000c0790c46c4866ed8634a146eac', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:10:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('e547c521008a4d2bb43e8fcb68f3c422', '1', '系统登录', '1', '2017-11-07 18:02:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e68a1ba7568d4aa88210837f468e380b', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:36:04', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('e6c871149e1a426796b6cc9c5fbda7dd', '1', '项目-项目列表-结果审查', '1', '2017-11-07 17:53:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=7', '');
INSERT INTO `sys_log` VALUES ('e6d0d08944b74456b3b49b572220bf1f', '1', '系统登录', '1', '2017-12-04 16:58:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e760687466f44b24a9872bc647e9ac30', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:08:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('e8347a4ae46e40f8813b18771ec777fb', '1', '系统登录', '1', '2017-11-07 17:10:51', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e83c84bac9de48a9a6e0d0168c553e05', '1', '系统登录', '1', '2017-11-09 14:54:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e8c4bb9eee6a4d5ca8eaf88683379d8b', '1', '项目-项目列表-结果审查', '1', '2017-11-01 16:28:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('e8cb87be40f647dfa24feea49941e125', '1', '系统登录', '1', '2017-10-11 13:46:50', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('e9284cca81c54f06974823ac8b397e55', '1', '系统登录', '1', '2017-10-15 10:05:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ea00be0272204925bc33112f358b1fa1', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:19:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('ea053da65fa841f5badda273bf6a3cde', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:41:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('ea2d8a31b1f2421fabd10b42da2ab1b4', '1', '系统登录', '1', '2017-11-29 11:35:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('eaa5a0987bbe4f46aefd67288b1fda7d', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:04:44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('eb355f9f8e6d42f391228749fa82e2c7', '1', '系统登录', '1', '2017-11-20 16:57:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ec0f666d8f594a39a7d771caa58a08b7', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:39:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('ec2609e7ae394cfe883aae7888ae79dd', '1', '系统登录', '1', '2017-11-09 11:07:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ec2d3cd0f472444aa4c5082ebe82a7f8', '1', '系统登录', '1', '2017-11-15 09:50:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ec39d47607c5452da69811af23b135de', '1', '系统登录', '1', '2017-12-06 13:35:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ec7222f15138498180eea378bcad4735', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('ee00a45e9beb4871913c2516398b915c', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:10:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('ee681accd1fd4585874d98462e189e65', '1', '系统登录', '1', '2017-11-17 11:04:23', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ee75a72019f347c5a1b4f341675039f0', '1', '系统登录', '1', '2017-11-06 13:15:47', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('eefae0df073b4d2ea3477d8b1f60804e', '1', '系统登录', '1', '2017-11-15 11:51:34', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('efe0cada0ba5478eb832dde57500e87c', '1', '系统登录', '1', '2017-11-27 09:42:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('eff77d08b3404619b494ce4bef106eb7', '1', '系统登录', '1', '2017-12-05 10:37:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f09c7163ddb843909d953ea24f3025bc', '1', '系统登录', '1', '2017-10-11 12:50:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f13b621de5a04380ad8f3cf97f3b36a8', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:51:24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('f18d42034275458a9b5d2e4776dda525', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 16:59:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=34', '');
INSERT INTO `sys_log` VALUES ('f1bf9a5f8bb34a2e85fce21355a91b8b', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-17 16:19:40', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35&toolStatus=1', '');
INSERT INTO `sys_log` VALUES ('f1ed1492a0a34f2aa4e36a1eb277da8d', '1', '项目-项目列表-报告下载', '1', '2017-11-08 11:49:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/projectAnalysis/downloadReport', 'GET', 'id=7&fileType=1', '');
INSERT INTO `sys_log` VALUES ('f2481c5cdd7b4e2393fc704541c5971d', '1', '系统登录', '1', '2017-11-27 15:38:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f294948a124f4feb995d45ea096d6c73', '1', '系统登录', '1', '2017-11-28 09:38:49', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f2a370e334304fa2a2c9843d0a88078a', '1', '系统登录', '1', '2017-11-17 10:14:13', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f439ce79e51c44af8668ce42eaf8ddbf', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 11:53:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('f45128fd8828432792c87579b30e9602', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:20:09', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('f47196ab67b1442895153e79f2446704', '1', '项目-项目列表-结果审查', '1', '2017-10-12 10:02:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=8', '');
INSERT INTO `sys_log` VALUES ('f4759b82857e4df0a1d4391c9e6f970a', '1', '系统登录', '1', '2017-11-07 13:00:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f4b05bc2eae04cae966d56dcda5bdae0', '1', '系统登录', '1', '2017-11-17 11:45:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f4b978ba5d81410f91139a97db41dd7c', '1', '系统登录', '1', '2017-11-13 15:35:31', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f4c99913c376432d8ad09a6244c5e64b', '1', '系统登录', '1', '2017-11-07 10:48:46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f4de7aa2ef654fcfb78288c3e4ec3093', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-16 17:02:10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('f4fbe5ab44044f598e90c88b232fab74', '1', '系统登录', '1', '2017-11-14 17:11:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f547a6d9f4864afeb88e7355010af164', '1', '系统登录', '1', '2017-10-11 12:57:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f55517407b9944cbb8843f45a4eb7d91', '1', '系统登录', '2e076bc7fc4847a4a6a4e5c144c67de6', '2017-11-10 14:00:25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f5cbcb47f9244a6487c5b99b8cb7a724', '1', '项目-项目列表-结果审查', '1', '2017-10-16 21:20:43', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('f5d9519e6e774a21a392dd2917c68ca7', '1', '系统登录', '1', '2017-11-14 13:54:20', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f666bba39a47457f9ad6c7203617ca2e', '1', '项目-项目列表-项目主页-项目详细-结果审查', '1', '2017-11-13 16:22:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('f675f66cc84b409ba5f6266ae0441492', '1', '系统登录', '1', '2017-11-08 10:25:26', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f69bc52baec041c584e70ee3413b3377', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:26:38', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=\'undefined', '');
INSERT INTO `sys_log` VALUES ('f713e5524af04746aa0dd03db9c9649b', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-29 15:21:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'instancesId=31&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('f75d4544ebab49eebd5f953d035d6a11', '1', '系统登录', '1', '2017-11-27 11:00:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f77476a33e634316a7334ca91686ca93', '1', '系统登录', '1', '2017-11-13 16:34:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f78a77d0b9f24f6393fb6088f795d54b', '1', '项目-项目列表-项目主页-文件下载', '1', '2017-11-17 16:23:54', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/project/project/downloadReport', 'GET', 'toolId=35&fileType=1', '');
INSERT INTO `sys_log` VALUES ('f792ddcc4c5643f58601080647753e03', '1', '系统登录', '1', '2017-12-04 13:24:42', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f7b1d3794f824ed595c63e5475e89666', '1', '系统登录', '1', '2017-11-17 10:37:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f7d8266f53034d66bf33c8dcc481d807', '1', '系统登录', '1', '2017-12-06 11:48:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f80fdd51d52a408493481bc529c85871', '1', '系统登录', '1', '2017-12-05 11:02:33', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f917e154e1a1403cb376a1195674ce53', '1', '系统登录', '1', '2017-11-03 09:23:05', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f918b82d74c84673b0cac81f22880745', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 14:59:35', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('f923f23a8ac34c3eb870bc88feae68d9', '1', '项目-项目列表-结果审查', '1', '2017-10-25 16:50:32', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('f93b8a3f19ad4b7d83855b47b9ce54d4', '1', '系统登录', '1', '2017-11-10 14:34:59', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f977a5e1566040bcbc2c68d36ea0f48a', '1', '系统登录', '1', '2017-11-20 10:08:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('f98ef1646be94a669d34a939c6670471', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:11:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('f99958bf243a469787908f8b6e313a7a', '1', '系统登录', '1', '2017-10-11 11:06:03', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fa59deebc1574ec0abe76de2dc594af2', '1', '系统登录', '1', '2017-11-24 10:36:53', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fa59e00ff186413783f932856f14078d', '1', '项目-项目列表-结果审查', '1', '2017-10-16 20:13:00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=6', '');
INSERT INTO `sys_log` VALUES ('fa609314d7964e1d85b903dba14ffe4c', '1', '项目-项目列表-项目主页-工具主页-结果审查', '1', '2017-11-22 09:22:37', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=32&toolStatus=0', '');
INSERT INTO `sys_log` VALUES ('faa8c3df7dd249e3bc3f5bcf61ac267d', '1', '系统登录', '73b19d7c6288423683ec00b44579a5bb', '2017-11-13 16:00:17', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fad0d8b910fa4010b354d18d19d9075a', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:29:01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('fb9435618e8b459dbf05d3efcc14f082', '1', '系统登录', '1', '2017-12-05 13:52:19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fb967b2bdde84913936a23501c364c3d', '1', '项目-项目列表-项目主页-结果审查', '1', '2017-11-13 15:21:08', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'toolId=35', '');
INSERT INTO `sys_log` VALUES ('fbc361a1142d46079bdcc0c7a120c142', '1', '系统登录', '1', '2017-11-29 09:33:39', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fbdcbb63983f40789c3e1b3ac158232f', '1', '项目-项目列表-结果审查', '1', '2017-11-06 10:03:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a/violationresults/violationResults/list', 'GET', 'projectAnalysisId=21', '');
INSERT INTO `sys_log` VALUES ('fbeb99d5f2e1415f8f39eac2b3244ae8', '1', '系统登录', '1', '2017-11-06 09:42:07', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fc25b572cda847da88b79153f644764c', '1', '系统登录', '1', '2017-11-03 16:17:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fd47cfd64d9b4c0e805ddd0f366a8f63', '1', '系统登录', '1', '2017-11-09 11:14:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fe18a9eebf7c4a2c871eda69c3bfb677', '1', '系统登录', '1', '2017-11-17 09:56:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('fe84b3c2d3fc4963b8df1c959c85d4e7', '1', '系统登录', '1', '2017-11-07 10:10:30', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ff2153174afd4806bb00416f033ff0a7', '1', '系统登录', '1', '2017-10-11 13:32:52', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0', '/checker/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('ff648b0c84ba4433b50b6d9733e6d3da', '1', '项目-项目列表-报告下载', '1', '2017-10-11 10:07:11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '/checker/a/project/projectAnalysis/downloadReport', 'GET', 'id=6&fileType=1', '');
INSERT INTO `sys_log` VALUES ('ffad2490f18f431895fc74edb1bebbaf', '1', '系统登录', '1', '2017-11-07 17:43:58', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.75 Safari/537.36', '/jeeplus/a', 'GET', 'login=', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `menu_type` char(1) DEFAULT NULL COMMENT '0:功能菜单  1：菜单  2：按钮  3：数据权限',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('02c03f3a6bb34f9fab7aeb7477d672e6', '7fe0397a90214f49adc9bbbe48e5ab69', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,', '漏斗图', '15580', '', '', '', '1', '', '1', '2017-06-04 12:57:12', '1', '2017-06-04 12:57:12', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('0787b03f8a7d46d2b398ddcc23545d31', '7ec930fe50fb41d0a9c7aeaa01804d16', '0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,', '增加', '120', '', '', '', '0', 'tools:testInterface:add', '1', '2016-01-07 13:42:33', '1', '2016-01-12 23:52:06', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('09b08f1063504ab2ae04a9674903284c', '7fe0397a90214f49adc9bbbe48e5ab69', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,', '柱状图', '15550', '', '', '', '1', '', '1', '2017-06-04 12:54:53', '1', '2017-06-04 12:54:53', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('0aa3712414d049a6a24e8bcddeae509a', '27', '0,1,27,', '我的日程', '100', '/iim/myCalendar', '', '', '1', '', '1', '2016-04-21 21:52:06', '1', '2016-04-21 21:52:06', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('0b6d7c4e9b87415f8b88c35143391b95', 'bb7ad31aa6da427aa49c287ee11f49f3', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,f435885c846d422ca497f87b4842c736,bb7ad31aa6da427aa49c287ee11f49f3,', '工具类型名校验', '90', '', '', '', '1', 'tooltype:toolType:checkToolTypeName', '1', '2017-12-04 11:26:19', '1', '2017-12-04 11:26:19', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, 'fa fa-home', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '1');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,3,', '字典管理', '60', '/sys/dict/', '', '', '1', 'sys:dict:list', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:55', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('10a0b87c918a48d18d5080177973918a', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '删除', '60', null, null, null, '0', 'monitor:scheduleJob:del', '1', '2017-02-02 22:25:10', '1', '2017-02-02 22:25:10', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('10e8bd64ad094c708e414da3cbd48882', 'fd358554425f4ae2b5b1547a7f0c2bf5', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,', '默认工具链设置', '90', '/defaulttoolchain/defaultToolChain/form', '', 'fa fa-cog', '1', 'defaulttoolchain:defaultToolChain:view,defaulttoolchain:defaultToolChain:add', '1', '2017-11-15 11:49:21', '1', '2017-11-15 13:11:01', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('10effdc6a8724b91967ae2ff90dab397', '268c55d12ee34c5c8b717aa24cc3af73', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,268c55d12ee34c5c8b717aa24cc3af73,', '例一', '30', '/echarts/other/sample', '', '', '1', '', '1', '2017-06-04 13:05:00', '1', '2017-06-04 13:05:00', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('11', '10', '0,1,3,10,', '查看', '30', null, null, null, '0', 'sys:dict:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('12', '10', '0,1,3,10,', '修改', '40', null, null, null, '0', 'sys:dict:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('14', '3', '0,1,3,', '区域管理', '50', '/sys/area/', '', '', '1', 'sys:area:list', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:48', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('15', '14', '0,1,3,14,', '查看', '30', null, null, null, '0', 'sys:area:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('16', '14', '0,1,3,14,', '修改', '40', null, null, null, '0', 'sys:area:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('17', '3', '0,1,3,', '机构管理', '40', '/sys/office/list', '', '', '1', 'sys:office:list', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:30', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('18', '17', '0,1,3,17,', '查看', '30', null, null, null, '0', 'sys:office:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('19', '17', '0,1,3,17,', '修改', '40', null, null, null, '0', 'sys:office:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('1c00b2a3c3f84bc491ce72eaa92c4b20', 'fe358352e9bc4ce99a7a4a3169e6145e', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,268c55d12ee34c5c8b717aa24cc3af73,fe358352e9bc4ce99a7a4a3169e6145e,', '删除', '60', null, null, null, '0', 'echarts:other:testPieClass:del', '1', '2017-06-04 16:18:33', '1', '2017-06-04 16:18:33', null, '0', '1');
INSERT INTO `sys_menu` VALUES ('1de8481acaca4c67830394eafe23577d', 'bc538436d26a48b8af51bdad5e6be6d9', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,bf53b685a04a4db3adf77bc0b127abaf,bc538436d26a48b8af51bdad5e6be6d9,', '结果审查插入', '60', '', '', '', '1', 'checkup:checkUp:save', '1', '2017-11-13 15:50:24', '1', '2017-11-13 15:50:24', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('20', '3', '0,1,3,', '用户管理', '30', '/sys/user/index', '', '', '1', 'sys:user:index', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:18', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('21', '20', '0,1,3,20,', '查看', '30', null, null, null, '0', 'sys:user:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('22', '20', '0,1,3,20,', '修改', '40', null, null, null, '0', 'sys:user:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('268c55d12ee34c5c8b717aa24cc3af73', '7fe0397a90214f49adc9bbbe48e5ab69', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,', '其它', '15760', '', '', '', '1', '', '1', '2017-06-04 13:04:40', '1', '2017-06-04 13:04:40', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '200', '', '', 'fa fa-columns', '0', '', '1', '2013-05-27 08:00:00', '1', '2017-08-24 09:53:37', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('28abe4b0cb3b4c8480f84c07a5dfaf06', '90', '0,1,27,90,', '增加', '60', '', '', '', '0', 'oa:oaNotify:add', '1', '2015-12-29 21:15:22', '1', '2015-12-29 21:15:22', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('29', '27', '0,1,27,', '个人信息', '90', '/sys/user/info', '', 'icon-adjust', '1', '', '1', '2013-05-27 08:00:00', '1', '2016-03-27 22:43:46', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('29c2c2445d5b448cb0857fd77c2f13be', '02c03f3a6bb34f9fab7aeb7477d672e6', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,02c03f3a6bb34f9fab7aeb7477d672e6,', '例一', '30', '/echarts/funnel/sample1', '', '', '1', '', '1', '2017-06-04 12:57:24', '1', '2017-06-04 12:57:24', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('2a0f940fbe304a05a6b4040ddf6df279', '20', '0,1,3,20,', '增加', '70', '', '', '', '0', 'sys:user:add', '1', '2015-12-19 21:47:00', '1', '2015-12-19 21:47:00', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('2c01eb462cb64b63a4d508391c2e610e', '9a6bd94036984f82890c2d10ac8a5880', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,9a6bd94036984f82890c2d10ac8a5880,', '例四', '120', '/echarts/line/sample4', '', '', '1', '', '1', '2017-06-04 13:00:22', '1', '2017-06-04 13:00:22', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('2e5678c6d03c431ab124a33d78ffab97', 'e4c9a7b01abb435889b59a4515257c94', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,', '增加工具', '240', '', '', '', '1', 'tool:tools:selectList', '1', '2017-12-06 13:36:34', '1', '2017-12-06 13:36:34', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('2ea63a7508904c37ae34e8ce7e99f95c', '7fe0397a90214f49adc9bbbe48e5ab69', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,', '矩形图', '15730', '/echarts/treemap/sample', '', '', '1', '', '1', '2017-06-04 13:04:30', '1', '2017-06-04 13:04:30', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '0,1,', '系统设置', '230', '', '', 'fa fa-gear', '1', '', '1', '2013-05-27 08:00:00', '1', '2017-04-04 22:20:53', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('30b58767a99544209f7021655ca9352a', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '暂停', '120', '', '', '', '0', 'monitor:scheduleJob:stop', '1', '2017-02-02 22:25:10', '1', '2017-02-05 10:27:31', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('332dd194803145ed92d2b8b0c0e9999f', 'fe358352e9bc4ce99a7a4a3169e6145e', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,268c55d12ee34c5c8b717aa24cc3af73,fe358352e9bc4ce99a7a4a3169e6145e,', '查看', '120', null, null, null, '0', 'echarts:other:testPieClass:view', '1', '2017-06-04 16:18:33', '1', '2017-06-04 16:18:33', null, '0', '1');
INSERT INTO `sys_menu` VALUES ('35d0c54979404a07be2e5db02a6d9265', '1', '0,1,', '仪表盘', '10', '/home', '', 'fa fa-line-chart', '1', '', '1', '2017-08-23 14:35:38', '1', '2017-08-23 14:48:58', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('3a2af8a4f30c43d0b4e17ac76a3bb4c2', 'bb7ad31aa6da427aa49c287ee11f49f3', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,f435885c846d422ca497f87b4842c736,bb7ad31aa6da427aa49c287ee11f49f3,', '删除工具类型', '60', '', '', '', '1', 'tooltype:toolType:del', '1', '2017-12-04 10:42:51', '1', '2017-12-04 10:42:51', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('3c1c639c76f14f6f9903b0143371ea09', '7', '0,1,3,7,', '添加', '70', '', '', '', '0', 'sys:role:add', '1', '2015-12-23 21:35:08', '1', '2015-12-23 21:36:18', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('3dfaf2fe653f49f9b07b1653844a1ec4', 'fd358554425f4ae2b5b1547a7f0c2bf5', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,', '工具列表', '30', '/tool/tools/list', '', 'fa fa-th-list', '1', 'tool:tools:list', '1', '2017-11-14 13:53:18', '1', '2017-11-14 14:17:46', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('3ec2c5bcb0614f4492e9a81a8e7d958f', '3dfaf2fe653f49f9b07b1653844a1ec4', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,3dfaf2fe653f49f9b07b1653844a1ec4,', '新建工具', '60', '', '', '', '1', 'tool:tools:view', '1', '2017-11-14 16:45:28', '1', '2017-11-14 16:45:28', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('3fa7d66022f94a9484b238225f528d04', '09b08f1063504ab2ae04a9674903284c', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,09b08f1063504ab2ae04a9674903284c,', '例 四', '120', '/echarts/bar/sample4', '', '', '1', '', '1', '2017-06-04 12:56:21', '1', '2017-06-04 12:56:21', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,3,', '菜单管理', '30', '/sys/menu/', '', '', '1', 'sys:menu:list', '1', '2013-05-27 08:00:00', '1', '2017-03-26 18:09:50', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('431c7a2425e9483098894aafb7db288c', '9a6bd94036984f82890c2d10ac8a5880', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,9a6bd94036984f82890c2d10ac8a5880,', '例一', '30', '/echarts/line/sample1', '', '', '1', '', '1', '2017-06-04 12:59:45', '1', '2017-06-04 12:59:45', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('487f0e3fd10d482a843fb706b7ce2ce0', '09b08f1063504ab2ae04a9674903284c', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,09b08f1063504ab2ae04a9674903284c,', '例一', '30', '/echarts/bar/sample1', '', '', '1', '', '1', '2017-06-04 12:55:29', '1', '2017-06-04 12:55:29', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('49caf2d7066749d794cbf338a28833de', 'bb7ad31aa6da427aa49c287ee11f49f3', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,f435885c846d422ca497f87b4842c736,bb7ad31aa6da427aa49c287ee11f49f3,', '保存工具类型', '30', '', '', '', '1', 'tooltype:toolType:add,tooltype:toolType:edit', '1', '2017-12-04 10:27:43', '1', '2017-12-04 10:33:49', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('4c33d61113f545758f7b08a4482c1836', 'bc538436d26a48b8af51bdad5e6be6d9', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,bf53b685a04a4db3adf77bc0b127abaf,bc538436d26a48b8af51bdad5e6be6d9,', '结果审查查看', '30', '', '', '', '1', 'checkup:checkUp:view', '1', '2017-11-13 15:50:02', '1', '2017-11-13 15:50:02', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('4d463414bc974236941a6a14dc53c73a', '56e274e0ec1c41298e19ab46cf4e001f', '0,1,56e274e0ec1c41298e19ab46cf4e001f,', '接口测试', '15030', '', '', '', '1', '', '1', '2015-11-10 18:49:21', '1', '2017-04-11 16:46:55', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('4ef1a732e18c4209bbb1193a0d264975', '1', '0,1,', '规则集', '60', '', '', 'fa fa-th-list', '1', '', '1', '2017-08-09 19:56:35', '1', '2017-08-09 19:56:35', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('4f51b2fa967a4a7b86d4abc9e0fd5f7d', '4', '0,1,3,4,', '数据规则', '190', '', '', '', '0', 'sys:role:datarule', '1', '2017-04-08 21:59:25', '1', '2017-04-09 17:36:41', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('4f9a896d68a24b1b81801ca6233a30e7', 'bc538436d26a48b8af51bdad5e6be6d9', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,bf53b685a04a4db3adf77bc0b127abaf,bc538436d26a48b8af51bdad5e6be6d9,', '审查用户列表', '90', '', '', '', '1', 'checkup:checkUp:dataByanalysisresultid', '1', '2017-11-16 17:01:38', '1', '2017-11-16 17:01:38', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('5', '4', '0,1,3,4,', '增加', '30', '', '', '', '0', 'sys:menu:add', '1', '2013-05-27 08:00:00', '1', '2015-12-20 19:00:22', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('5239527958e94d418997b584b85d8b80', '14', '0,1,3,14,', '删除', '100', '', '', '', '0', 'sys:area:del', '1', '2015-12-24 21:37:13', '1', '2015-12-24 21:37:13', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('56', '27', '0,1,27,', '文件管理', '31', '/../static/plugin/ckfinder/ckfinder.html', '', 'icon-zoom-out', '1', '', '1', '2013-05-27 08:00:00', '1', '2017-01-20 19:54:24', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('56e274e0ec1c41298e19ab46cf4e001f', '1', '0,1,', '常用工具', '290', '', '', 'fa fa-wrench', '0', '', '1', '2016-03-03 16:30:04', '1', '2017-08-22 13:41:41', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('57', '56', '0,1,27,40,56,', '查看', '40', null, null, null, '0', 'cms:ckfinder:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('57f1f00d6cb14819bef388acd10e6f5a', '68', '0,1,67,68,', '删除', '60', '', '', '', '0', 'sys:log:del', '1', '2015-12-25 20:25:55', '1', '2015-12-25 20:25:55', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('57f68b11091142b386bb4f28f1c01f57', '7fe0397a90214f49adc9bbbe48e5ab69', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,', '日程图', '15520', '/echarts/heatmap/sample', '', '', '1', '', '1', '2017-06-04 12:59:02', '1', '2017-06-04 16:03:32', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('58', '56', '0,1,27,40,56,', '上传', '30', null, null, null, '0', 'cms:ckfinder:upload', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', null, null, null, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('5b8caa6e46cf4bfcb0cb466653f341e2', '3dfaf2fe653f49f9b07b1653844a1ec4', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,3dfaf2fe653f49f9b07b1653844a1ec4,', '禁用工具', '30', '', '', '', '1', 'tool:tools:update', '1', '2017-11-14 16:02:26', '1', '2017-11-14 16:02:26', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('6', '4', '0,1,3,4,', '修改', '40', null, null, null, '0', 'sys:menu:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('62ec1194dc224c989c286aa8e8999206', '9a6bd94036984f82890c2d10ac8a5880', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,9a6bd94036984f82890c2d10ac8a5880,', '例二', '60', '/echarts/line/sample2', '', '', '1', '', '1', '2017-06-04 12:59:56', '1', '2017-06-04 12:59:56', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('643db812770e41b4b12b33090fca4ca8', 'f2ffcb83dd404b9aa0a435e705afbd5c', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,f2ffcb83dd404b9aa0a435e705afbd5c,', '保存', '30', '', '', '', '1', 'project:project:add', '1', '2017-11-01 17:47:29', '1', '2017-11-02 10:40:15', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('6509eed6eb634030a46723a18814035c', '7', '0,1,3,7,', '分配用户', '100', '', '', '', '0', 'sys:role:assign', '1', '2015-12-23 21:35:37', '1', '2015-12-23 21:53:23', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('67', '1', '0,1,', '系统监控', '260', '', '', 'fa fa-video-camera', '1', '', '1', '2013-06-03 08:00:00', '1', '2017-09-12 10:49:27', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,67,', '日志查询', '30', '/sys/log', '', '', '1', 'sys:log:list', '1', '2013-06-03 08:00:00', '1', '2017-04-11 16:46:10', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('68f9151151174868ab436e11e03bf548', '4', '0,1,3,4,', '删除', '70', '', '', '', '0', 'sys:menu:del', '1', '2015-12-20 19:01:16', '1', '2015-12-20 19:03:05', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('6a42111d5fc0449498bbcf3c78d81262', '09b08f1063504ab2ae04a9674903284c', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,09b08f1063504ab2ae04a9674903284c,', '例三', '90', '/echarts/bar/sample3', '', '', '1', '', '1', '2017-06-04 12:56:03', '1', '2017-06-04 12:56:03', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('6d3a6777693f47c98e9b3051cacbcfdb', '10', '0,1,3,10,', '增加', '70', '', '', '', '0', 'sys:dict:add', '1', '2015-12-24 22:23:39', '1', '2015-12-24 22:24:22', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('6e241160631d4dd4a36653cc83cd0a51', '9a6bd94036984f82890c2d10ac8a5880', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,9a6bd94036984f82890c2d10ac8a5880,', '例五', '150', '/echarts/line/sample5', '', '', '1', '', '1', '2017-06-04 13:00:36', '1', '2017-06-04 13:00:36', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,3,', '角色管理', '50', '/sys/role/', '', '', '1', 'sys:role:list', '1', '2013-05-27 08:00:00', '1', '2017-04-11 16:45:39', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('70a198c6ea674956adca8212b3f6291d', '7fe0397a90214f49adc9bbbe48e5ab69', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,', '饼图', '15670', '', '', '', '1', '', '1', '2017-06-04 13:01:42', '1', '2017-06-04 13:01:42', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('70de7eac2f3e4632b1b7aa3cd536b35a', '4d463414bc974236941a6a14dc53c73a', '0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,', '接口测试', '200', '/tools/testInterface/test', '', '', '1', 'tools:testInterface:test', '1', '2015-11-30 15:21:14', '1', '2016-01-13 00:05:29', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('74dfc6bb363b42cf98a1f6505268c5ff', 'bf53b685a04a4db3adf77bc0b127abaf', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,bf53b685a04a4db3adf77bc0b127abaf,', '分析配置', '90', '', '', '', '1', 'analysisset:analysisSet:view', '1', '2017-11-13 15:48:52', '1', '2017-11-13 15:49:28', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('7601161b0f204feea5cb285083ad8c29', '56e274e0ec1c41298e19ab46cf4e001f', '0,1,56e274e0ec1c41298e19ab46cf4e001f,', '短信工具', '60', '/tools/sms', '', '', '1', '', '1', '2016-03-04 00:19:43', '1', '2017-04-11 16:46:44', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('79f0ffa47dbe43ffa8824d97612d344f', '4', '0,1,3,4,', '保存排序', '100', '', '', '', '0', 'sys:menu:updateSort', '1', '2015-12-20 19:02:08', '1', '2015-12-20 19:02:08', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('79fca849d3da4a82a4ade3f6b9f45126', '20', '0,1,3,20,', '删除', '100', '', '', '', '0', 'sys:user:del', '1', '2015-12-19 21:47:44', '1', '2015-12-19 21:48:52', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('7d4b83f739aa4caf81c4f4cf298fd8a6', '70a198c6ea674956adca8212b3f6291d', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,70a198c6ea674956adca8212b3f6291d,', '例一', '30', '/echarts/pie/sample1', '', '', '1', '', '1', '2017-06-04 13:01:51', '1', '2017-06-04 13:01:51', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('7d63df6a91ef4f258616cb58a556caaf', 'fe358352e9bc4ce99a7a4a3169e6145e', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,268c55d12ee34c5c8b717aa24cc3af73,fe358352e9bc4ce99a7a4a3169e6145e,', '增加', '30', null, null, null, '0', 'echarts:other:testPieClass:add', '1', '2017-06-04 16:18:33', '1', '2017-06-04 16:18:33', null, '0', '1');
INSERT INTO `sys_menu` VALUES ('7dba4c44a7554c50a75ac514ab4e1428', '1', '0,1,', '项目', '30', '', '', 'fa fa-bug', '1', '', '1', '2017-08-22 13:45:09', '1', '2017-09-12 17:30:47', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('7ec930fe50fb41d0a9c7aeaa01804d16', '4d463414bc974236941a6a14dc53c73a', '0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,', '接口列表', '30', '/tools/testInterface', '', '', '1', 'tools:testInterface:list', '1', '2015-11-30 15:15:06', '1', '2016-01-12 23:50:52', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('7fe0397a90214f49adc9bbbe48e5ab69', '1', '0,1,', '统计报表', '170', '', '', 'fa fa-area-chart', '0', '', '1', '2016-05-26 08:55:24', '1', '2017-08-22 13:46:11', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8', '7', '0,1,3,7,', '查看', '30', null, null, null, '0', 'sys:role:view', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('81615af2e1eb4196bdf0f6c139201d20', 'e4c9a7b01abb435889b59a4515257c94', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,', '更新项目', '30', '', '', '', '1', 'project:project:edit', '1', '2017-11-03 15:52:48', '1', '2017-11-03 15:52:48', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('82d0fcdc7f6140538fada7dc4567d485', 'bf53b685a04a4db3adf77bc0b127abaf', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,bf53b685a04a4db3adf77bc0b127abaf,', '结果度量', '60', '', '', '', '1', 'measure:measure:list', '1', '2017-11-13 15:48:32', '1', '2017-11-13 15:48:32', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('84', '67', '0,1,67,', '连接池监视', '40', '/../druid', null, null, '1', null, '1', '2013-10-18 08:00:00', '1', '2013-10-18 08:00:00', null, '0', '1');
INSERT INTO `sys_menu` VALUES ('864dd45b673545cda5722a81f2d8c64d', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '编辑', '90', null, null, null, '0', 'monitor:scheduleJob:edit', '1', '2017-02-02 22:25:10', '1', '2017-02-02 22:25:10', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('89', '27', '0,1,27,', '我的通告', '10000', '/oa/oaNotify/self', '', '', '1', '', '1', '2013-11-08 08:00:00', '1', '2017-06-11 12:25:40', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8926112d6acd4a18b5e5dcf99a1f7ff3', '7ec930fe50fb41d0a9c7aeaa01804d16', '0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,', '删除', '150', '', '', '', '0', 'tools:testInterface:del', '1', '2016-01-07 13:43:13', '1', '2016-01-12 23:52:21', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('8930e4aad1ba4a1c958d303968d8c442', '17', '0,1,3,17,', '删除', '100', '', '', '', '0', 'sys:office:del', '1', '2015-12-20 21:19:16', '1', '2015-12-20 21:19:16', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('8b03f02d351240fe9324ed92d2e44262', '3ec2c5bcb0614f4492e9a81a8e7d958f', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,3dfaf2fe653f49f9b07b1653844a1ec4,3ec2c5bcb0614f4492e9a81a8e7d958f,', '工具名称检查', '60', '', '', '', '1', 'tools:tools:checkToolName', '1', '2017-12-04 16:02:25', '1', '2017-12-04 16:02:25', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('8bc9cf2a4f86441f805275a4d3804595', 'dcf09746313d42e2aa6ad187c0b3db4b', '0,1,4ef1a732e18c4209bbb1193a0d264975,dcf09746313d42e2aa6ad187c0b3db4b,', '下载导出', '270', '/checkerset/checkerSet', '', '', '1', 'checkerset:checkerSet:download', '1', '2017-09-12 10:03:48', '1', '2017-09-12 10:03:48', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8dddb47ca808433fb59113fa9341a8d3', 'a8e8837f9e974dd797ac199f101047ee', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,a8e8837f9e974dd797ac199f101047ee,', '例一', '30', '/echarts/scatter/sample1', '', '', '1', '', '1', '2017-06-04 13:03:25', '1', '2017-06-04 13:03:25', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8e01a74a9ca94a26a5263769c354afb9', '67', '0,1,67,', '系统配置', '100', '/sys/systemConfig', '', '', '1', 'sys:systemConfig:index', '1', '2016-02-07 16:25:22', '1', '2016-02-07 16:25:22', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8e570af8a0be4f64bcab5a27b2895a2c', '3ec2c5bcb0614f4492e9a81a8e7d958f', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,3dfaf2fe653f49f9b07b1653844a1ec4,3ec2c5bcb0614f4492e9a81a8e7d958f,', '保存工具', '30', '', '', '', '1', 'tool:tools:add,tool:tools:edit', '1', '2017-11-14 17:11:20', '1', '2017-11-14 17:16:03', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8efc9686dc364f6fae71892305613b66', '9a6bd94036984f82890c2d10ac8a5880', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,9a6bd94036984f82890c2d10ac8a5880,', '例三', '90', '/echarts/line/sample3', '', '', '1', '', '1', '2017-06-04 13:00:08', '1', '2017-06-04 13:00:08', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('8ff1c0c8732b4a33980e0e7bc9f08282', '70a198c6ea674956adca8212b3f6291d', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,70a198c6ea674956adca8212b3f6291d,', '例二', '60', '/echarts/pie/sample2', '', '', '1', '', '1', '2017-06-04 13:02:01', '1', '2017-06-04 13:02:01', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('9', '7', '0,1,3,7,', '修改', '40', null, null, null, '0', 'sys:role:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('90', '27', '0,1,27,', '通告管理', '120', '/oa/oaNotify', '', '', '1', 'oa:oaNotify:list', '1', '2013-11-08 08:00:00', '1', '2017-06-11 12:25:55', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('90b0b138bad0492d84fe09b91e410a09', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '增加', '30', null, null, null, '0', 'monitor:scheduleJob:add', '1', '2017-02-02 22:25:10', '1', '2017-02-02 22:25:10', null, '0', '2');
INSERT INTO `sys_menu` VALUES ('91aa429a6cdc4a9b954d84ff1456934b', '68', '0,1,67,68,', '查看', '30', '', '', '', '0', 'sys:log:view', '1', '2015-12-25 20:25:25', '1', '2015-12-25 20:25:25', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('91df0f548b9e4a149a627deaeeae1f16', 'fe358352e9bc4ce99a7a4a3169e6145e', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,268c55d12ee34c5c8b717aa24cc3af73,fe358352e9bc4ce99a7a4a3169e6145e,', '导入', '150', null, null, null, '0', 'echarts:other:testPieClass:import', '1', '2017-06-04 16:18:33', '1', '2017-06-04 16:18:33', null, '0', '1');
INSERT INTO `sys_menu` VALUES ('92a3ed30c82f4b3f814e4647bb9efa0b', 'fe358352e9bc4ce99a7a4a3169e6145e', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,268c55d12ee34c5c8b717aa24cc3af73,fe358352e9bc4ce99a7a4a3169e6145e,', '编辑', '90', null, null, null, '0', 'echarts:other:testPieClass:edit', '1', '2017-06-04 16:18:33', '1', '2017-06-04 16:18:33', null, '0', '1');
INSERT INTO `sys_menu` VALUES ('95a6a82dc5fc4d07b46e5df57a0606a3', '27', '0,1,27,', '信箱', '30', '/iim/mailBox/list?orderBy=sendtime desc', '', '', '1', '', '1', '2015-11-14 11:14:30', '1', '2015-11-24 18:01:46', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('9a6bd94036984f82890c2d10ac8a5880', '7fe0397a90214f49adc9bbbe48e5ab69', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,', '折线图', '15610', '', '', '', '1', '', '1', '2017-06-04 12:59:24', '1', '2017-06-04 12:59:24', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('9bc1aa1053144a608b73f6fbd841d1c6', '10', '0,1,3,10,', '删除', '100', '', '', '', '0', 'sys:dict:del', '1', '2015-12-24 22:24:04', '1', '2015-12-24 22:24:31', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('9e01c22444ce4ffca35911daae45d58a', '67', '0,1,67,', '定时任务', '130', '/monitor/scheduleJob', '', '', '0', 'monitor:scheduleJob:list', '1', '2017-02-02 22:25:10', '1', '2017-09-21 17:48:10', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('a3127f0822fb4b13b319930c3b1ec9fe', 'a8e8837f9e974dd797ac199f101047ee', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,a8e8837f9e974dd797ac199f101047ee,', '例三', '90', '/echarts/scatter/sample3', '', '', '1', '', '1', '2017-06-04 13:03:44', '1', '2017-06-04 13:03:44', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('a49d6b19fff2440388712b0fe6cfdaff', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '立即执行一次', '180', '', '', '', '0', 'monitor:scheduleJob:startNow', '1', '2017-02-02 22:25:10', '1', '2017-02-05 10:28:15', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('a4c3dcee6cbc4fc6a0bf617d8619edf3', '17', '0,1,3,17,', '增加', '70', '', '', '', '0', 'sys:office:add', '1', '2015-12-20 21:18:52', '1', '2015-12-20 21:18:52', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('a4cfc713c3c04c32a274fb59c71e34ed', '7ec930fe50fb41d0a9c7aeaa01804d16', '0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,', '编辑', '90', '', '', '', '0', 'tools:testInterface:edit', '1', '2015-11-30 16:08:40', '1', '2016-01-12 23:51:51', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('a7fb88e9bf704d149b483e97dabdccf9', 'cc16ecdc43674261a1240a0e40e980d9', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,', '删除项目', '60', '', '', '', '1', 'project:project:deleteProject', '1', '2017-11-02 10:40:01', '1', '2017-11-02 10:40:01', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('a8e8837f9e974dd797ac199f101047ee', '7fe0397a90214f49adc9bbbe48e5ab69', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,', '点状图', '15700', '', '', '', '1', '', '1', '2017-06-04 13:03:12', '1', '2017-06-04 13:03:12', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('abd182773d6147ee824a5b3179b0e7fb', 'bf53b685a04a4db3adf77bc0b127abaf', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,bf53b685a04a4db3adf77bc0b127abaf,', '编译配置', '150', '', '', '', '1', 'analysisset:analysisSet:editAnalysisView', '1', '2017-11-22 13:24:51', '1', '2017-11-22 15:28:13', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('ae8d0bb4f4154d348e8b95e4496e838a', '9e01c22444ce4ffca35911daae45d58a', '0,1,67,9e01c22444ce4ffca35911daae45d58a,', '恢复', '150', '', '', '', '0', 'monitor:scheduleJob:resume', '1', '2017-02-02 22:25:10', '1', '2017-02-05 10:27:50', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('af0a174b4f424bc09a8cc0db83a64105', '27', '0,1,27,', '通讯录', '50', '/iim/contact/index', '', '', '1', '', '1', '2015-11-11 16:49:02', '1', '2015-11-11 16:49:02', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('b2961da7bfec4a32a607f26ef8fc54f4', 'dcf09746313d42e2aa6ad187c0b3db4b', '0,1,4ef1a732e18c4209bbb1193a0d264975,dcf09746313d42e2aa6ad187c0b3db4b,', '规则列表', '210', '/checkerset/checker', '', '', '1', 'checkerset:checker:list', '1', '2017-08-22 10:30:51', '1', '2017-08-22 10:30:51', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('b9a776f5d7194406bb466388e3af9d08', '20', '0,1,3,20,', '导出', '160', '', '', '', '0', 'sys:user:export', '1', '2015-12-19 21:48:34', '1', '2015-12-19 21:48:34', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('bb7ad31aa6da427aa49c287ee11f49f3', 'f435885c846d422ca497f87b4842c736', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,f435885c846d422ca497f87b4842c736,', '新建工具类型', '30', '', '', '', '1', 'tooltype:toolType:view', '1', '2017-12-04 10:26:55', '1', '2017-12-04 10:26:55', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('bc538436d26a48b8af51bdad5e6be6d9', 'bf53b685a04a4db3adf77bc0b127abaf', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,bf53b685a04a4db3adf77bc0b127abaf,', '结果审查', '120', '', '', '', '1', 'violationresults:violationResults:list', '1', '2017-11-13 15:49:24', '1', '2017-11-13 15:49:24', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('bf53b685a04a4db3adf77bc0b127abaf', 'e4c9a7b01abb435889b59a4515257c94', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,', '工具主页', '300', '', '', '', '1', 'tool:tools:index', '1', '2017-11-13 13:34:22', '1', '2017-12-07 10:38:25', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('c3530ae07fbb44c6998f0a52785cdb73', 'dcf09746313d42e2aa6ad187c0b3db4b', '0,1,4ef1a732e18c4209bbb1193a0d264975,dcf09746313d42e2aa6ad187c0b3db4b,', '扫描', '240', '/checkerset/checkerSet', '', '', '1', 'checkerset:checkerSet:scan', '1', '2017-09-12 09:35:58', '1', '2017-09-12 09:35:58', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('c3e5f622739b4588966e84854301e495', 'e4c9a7b01abb435889b59a4515257c94', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,', '删除工具', '270', '', '', '', '1', 'projecttoolinstances:projectToolInstances:deleteToolInstances', '1', '2017-12-07 11:04:25', '1', '2017-12-07 11:04:25', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('c6e0080e06014abd9240f870aadf3200', '14', '0,1,3,14,', '增加', '70', '', '', '', '0', 'sys:area:add', '1', '2015-12-24 21:35:39', '1', '2015-12-24 21:35:39', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('c7fa36c7142f481397c2cc12e2bc828a', '90', '0,1,27,90,', '修改', '90', '', '', '', '0', 'oa:oaNotify:edit', '1', '2015-12-29 21:15:50', '1', '2015-12-29 21:15:50', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('cc16ecdc43674261a1240a0e40e980d9', '7dba4c44a7554c50a75ac514ab4e1428', '0,1,7dba4c44a7554c50a75ac514ab4e1428,', '项目列表', '270', '/project/project', '', 'fa fa-th-list', '1', 'project:project:list', '1', '2017-11-01 17:46:19', '1', '2017-11-08 15:25:42', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('cfed96f1c1a04a9cb97abffc858acb67', 'a8e8837f9e974dd797ac199f101047ee', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,a8e8837f9e974dd797ac199f101047ee,', '例二', '60', '/echarts/scatter/sample2', '', '', '1', '', '1', '2017-06-04 13:03:35', '1', '2017-06-04 13:03:35', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('dcf09746313d42e2aa6ad187c0b3db4b', '4ef1a732e18c4209bbb1193a0d264975', '0,1,4ef1a732e18c4209bbb1193a0d264975,', '规则集列表', '30', '/checkerset/checkerSet', '', 'fa fa-th', '1', 'checkerset:checkerSet:list', '1', '2017-08-09 21:22:41', '1', '2017-09-12 10:03:25', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('de7c50d276454f80881c41a096ecf55c', '7', '0,1,3,7,', '删除', '160', '', '', '', '0', 'sys:role:del', '1', '2015-12-23 21:59:46', '1', '2015-12-23 21:59:46', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('e25c7b2e1f0e4327896feb2736107355', '09b08f1063504ab2ae04a9674903284c', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,09b08f1063504ab2ae04a9674903284c,', '例二', '60', '/echarts/bar/sample2', '', '', '1', '', '1', '2017-06-04 12:55:50', '1', '2017-06-04 12:55:50', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('e2efcf80fc3747329fe02d489dbfda95', '90', '0,1,27,90,', '删除', '120', '', '', '', '0', 'oa:oaNotify:del', '1', '2015-12-29 21:16:14', '1', '2015-12-29 21:16:14', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('e46555e269b84e2697857bdbb73f6676', '56e274e0ec1c41298e19ab46cf4e001f', '0,1,56e274e0ec1c41298e19ab46cf4e001f,', 'swagger', '90', '/swagger-ui.html', '', '', '1', '', '1', '2016-03-05 10:00:01', '1', '2017-06-12 01:37:26', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('e4c9a7b01abb435889b59a4515257c94', 'cc16ecdc43674261a1240a0e40e980d9', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,', '项目主页', '90', '', '', '', '1', 'project:project:projectIndex', '1', '2017-11-03 15:47:18', '1', '2017-12-05 13:54:03', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('e4e64e24aa134deaa9d69c3b9495c997', '56e274e0ec1c41298e19ab46cf4e001f', '0,1,56e274e0ec1c41298e19ab46cf4e001f,', '二维码测试', '15060', '/tools/TwoDimensionCodeController', '', '', '1', '', '1', '2015-12-10 13:03:43', '1', '2017-04-11 16:47:00', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('e54a930b674847dcaae7126f0a192d6a', '7dba4c44a7554c50a75ac514ab4e1428', '0,1,7dba4c44a7554c50a75ac514ab4e1428,', '项目分配', '240', '/project/projectUser', '', 'fa fa-external-link', '1', 'project:projectUser:list', '1', '2017-09-12 17:32:15', '1', '2017-11-08 15:26:02', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('e804950937664469bd8c6052e6094841', 'bf53b685a04a4db3adf77bc0b127abaf', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,bf53b685a04a4db3adf77bc0b127abaf,', '查看日志', '180', '', '', '', '1', 'project:project:showLog', '1', '2017-12-06 11:12:07', '1', '2017-12-06 11:12:07', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('eb68409dd46e4444bbb57a745a6429d8', 'e54a930b674847dcaae7126f0a192d6a', '0,1,7dba4c44a7554c50a75ac514ab4e1428,e54a930b674847dcaae7126f0a192d6a,', '添加用户', '30', '', '', '', '1', 'sys:user:index', '1', '2017-09-13 14:23:33', '1', '2017-09-13 14:23:33', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('ec7cf7a144a440cab217aabd4ffb7788', '4', '0,1,3,4,', '查看', '130', '', '', '', '0', 'sys:menu:view', '1', '2015-12-20 19:02:54', '1', '2015-12-20 19:02:54', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('edabaa21592247abb48d9d6b975a7aa3', 'fe358352e9bc4ce99a7a4a3169e6145e', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,268c55d12ee34c5c8b717aa24cc3af73,fe358352e9bc4ce99a7a4a3169e6145e,', '导出', '180', null, null, null, '0', 'echarts:other:testPieClass:export', '1', '2017-06-04 16:18:33', '1', '2017-06-04 16:18:33', null, '0', '1');
INSERT INTO `sys_menu` VALUES ('f07b7ea555f84116b5390d2a73740817', '56e274e0ec1c41298e19ab46cf4e001f', '0,1,56e274e0ec1c41298e19ab46cf4e001f,', '外部邮件', '30', '/tools/email', '', '', '1', '', '1', '2016-03-03 20:39:12', '1', '2017-04-11 16:46:38', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('f18fac5c4e6145528f3c1d87dbcb37d5', '67', '0,1,67,', '系统监控管理', '70', '/monitor/info', '', '', '1', '', '1', '2016-02-02 22:49:07', '1', '2016-02-02 23:15:07', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('f2ffcb83dd404b9aa0a435e705afbd5c', 'cc16ecdc43674261a1240a0e40e980d9', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,', '新建项目', '30', '', '', '', '1', 'project:project:view', '1', '2017-11-01 17:46:55', '1', '2017-11-02 10:40:08', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('f34887a78fa245c1977603ca7dc98e11', '20', '0,1,3,20,', '导入', '130', '', '', '', '0', 'sys:user:import', '1', '2015-12-19 21:48:13', '1', '2015-12-19 21:48:44', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('f435885c846d422ca497f87b4842c736', 'fd358554425f4ae2b5b1547a7f0c2bf5', '0,1,fd358554425f4ae2b5b1547a7f0c2bf5,', '工具类型列表', '60', '/tooltype/toolType/list', '', 'fa fa-list-ul', '1', 'tooltype:toolType:list', '1', '2017-12-04 10:04:39', '1', '2017-12-04 10:05:47', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('f49eb044c0784e4d846ef792b82dc590', '7fe0397a90214f49adc9bbbe48e5ab69', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,', '仪表图', '15490', '/echarts/gauge/sample', '', '', '1', '', '1', '2017-06-04 12:58:36', '1', '2017-06-04 12:58:36', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('f5b2028cfad9470085c7c846de33193a', '90', '0,1,27,90,', '查看', '30', '', '', '', '0', 'oa:oaNotify:view', '1', '2015-12-29 21:14:46', '1', '2015-12-29 21:14:46', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('f93f9a3a2226461dace3b8992cf055ba', '7', '0,1,3,7,', '权限设置', '130', '', '', '', '0', 'sys:role:auth', '1', '2015-12-23 21:36:06', '1', '2015-12-23 21:36:06', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('f9fe62186f0a4d7eada6c6827de79b26', '7ec930fe50fb41d0a9c7aeaa01804d16', '0,1,56e274e0ec1c41298e19ab46cf4e001f,4d463414bc974236941a6a14dc53c73a,7ec930fe50fb41d0a9c7aeaa01804d16,', '查看', '30', '', '', '', '0', 'tools:testInterface:view', '1', '2015-11-30 16:08:14', '1', '2016-04-10 21:21:33', '', '0', '2');
INSERT INTO `sys_menu` VALUES ('fa803c5a6ef14128a197a467afc0c529', '02c03f3a6bb34f9fab7aeb7477d672e6', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,02c03f3a6bb34f9fab7aeb7477d672e6,', '例二', '60', '/echarts/funnel/sample2', '', '', '1', '', '1', '2017-06-04 12:57:45', '1', '2017-06-04 12:57:45', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('fd358554425f4ae2b5b1547a7f0c2bf5', '1', '0,1,', '工具管理', '70', '', '', 'fa fa-suitcase', '1', '', '1', '2017-11-14 13:52:23', '1', '2017-11-14 14:17:39', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('fe358352e9bc4ce99a7a4a3169e6145e', '268c55d12ee34c5c8b717aa24cc3af73', '0,1,7fe0397a90214f49adc9bbbe48e5ab69,268c55d12ee34c5c8b717aa24cc3af73,', '综合报表', '15490', '/echarts/other/testPieClass', '', '', '1', 'echarts:other:testPieClass:list', '1', '2017-06-04 16:18:33', '1', '2017-06-04 17:19:40', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('fe40d683808345f2b70ffbd54b51a1bd', '4ef1a732e18c4209bbb1193a0d264975', '0,1,4ef1a732e18c4209bbb1193a0d264975,', '规则集创建', '60', '/checkerset/checkerSet/form', '', 'fa fa-align-right', '1', 'checkerset:checkerSet:add', '1', '2017-08-22 10:29:44', '1', '2017-09-22 10:06:22', '', '0', '1');
INSERT INTO `sys_menu` VALUES ('feb2b9c11977468c80a317778090d0fc', 'bf53b685a04a4db3adf77bc0b127abaf', '0,1,7dba4c44a7554c50a75ac514ab4e1428,cc16ecdc43674261a1240a0e40e980d9,e4c9a7b01abb435889b59a4515257c94,bf53b685a04a4db3adf77bc0b127abaf,', '结果图标', '30', '', '', '', '1', 'violationresults:violationResults:index', '1', '2017-11-13 15:48:09', '1', '2017-11-13 15:48:09', '', '0', '2');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '总公司', '10', '4d8ec70b0e0c4c97af07b97c9a906c40', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2015-11-11 17:40:49', '', '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '财务部', '30', 'aa23de04b47c4af086f23d68b64383bf', '100003', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2017-04-04 21:04:25', 'ccc', '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '5', '100004', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2017-02-06 12:38:31', 'xxxx1111', '0');
INSERT INTO `sys_office` VALUES ('6a642e140e40496a8d467c646b8e935e', '1', '0,1,', '市场部', '30', '17e8e72326574a0ea94b15d6eeddbb6d', '1000', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2015-12-03 18:10:13', '1', '2016-01-11 23:10:10', '', '0');
INSERT INTO `sys_office` VALUES ('e0ef8af9cae6416f8bb359714a1b4244', '1', '0,1,', '行政部', '30', '5', '', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2015-11-11 17:41:41', '1', '2017-01-17 21:35:43', 'xxx', '0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('0a09077217e54b279291e36431acc434', '', '项目分配人', 'ProjectAssigner', 'assignment', '1', '1', '1', '2017-09-12 09:18:58', '1', '2017-11-13 16:02:02', '', '0');
INSERT INTO `sys_role` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '', '系统管理员', 'system', 'assignment', '0', '1', '1', '2015-11-11 15:59:43', '1', '2017-09-12 09:19:22', '', '0');
INSERT INTO `sys_role` VALUES ('acd4eb49e7194b609369e929f340b30e', '', '项目参与人', 'ProjectAuditor', 'security-role', '1', '1', '1', '2017-09-12 09:18:42', '1', '2017-11-13 15:58:54', '', '0');
INSERT INTO `sys_role` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', '', '一般用户', 'ProjectUser', 'assignment', '1', '1', '1', '2017-11-02 15:58:56', '1', '2017-11-13 15:57:55', '', '0');
INSERT INTO `sys_role` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '', '管理员', 'ProjectAdmin', 'assignment', '1', '1', '1', '2017-09-12 09:19:50', '1', '2017-11-13 15:58:17', '', '0');

-- ----------------------------
-- Table structure for sys_role_datarule
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_datarule`;
CREATE TABLE `sys_role_datarule` (
  `role_id` varchar(64) NOT NULL DEFAULT '' COMMENT '角色id',
  `datarule_id` varchar(64) NOT NULL COMMENT '数据规则id',
  PRIMARY KEY (`role_id`,`datarule_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色数据权限表';

-- ----------------------------
-- Records of sys_role_datarule
-- ----------------------------
INSERT INTO `sys_role_datarule` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '09876c1700864719a89aab9e69c3a761');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', '1');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', '35d0c54979404a07be2e5db02a6d9265');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', '4c33d61113f545758f7b08a4482c1836');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', '4ef1a732e18c4209bbb1193a0d264975');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', '643db812770e41b4b12b33090fca4ca8');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', '7dba4c44a7554c50a75ac514ab4e1428');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', '81615af2e1eb4196bdf0f6c139201d20');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', '82d0fcdc7f6140538fada7dc4567d485');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', '8bc9cf2a4f86441f805275a4d3804595');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'a7fb88e9bf704d149b483e97dabdccf9');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'b2961da7bfec4a32a607f26ef8fc54f4');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'bc538436d26a48b8af51bdad5e6be6d9');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'bf53b685a04a4db3adf77bc0b127abaf');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'cc16ecdc43674261a1240a0e40e980d9');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'dcf09746313d42e2aa6ad187c0b3db4b');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'e4c9a7b01abb435889b59a4515257c94');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'e54a930b674847dcaae7126f0a192d6a');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'eb68409dd46e4444bbb57a745a6429d8');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'f2ffcb83dd404b9aa0a435e705afbd5c');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'fe40d683808345f2b70ffbd54b51a1bd');
INSERT INTO `sys_role_menu` VALUES ('0a09077217e54b279291e36431acc434', 'feb2b9c11977468c80a317778090d0fc');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '1');
INSERT INTO `sys_role_menu` VALUES ('1c54e003c1fc4dcd9b087ef8d48abac3', '7fe0397a90214f49adc9bbbe48e5ab69');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '1');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '1de8481acaca4c67830394eafe23577d');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '35d0c54979404a07be2e5db02a6d9265');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '4c33d61113f545758f7b08a4482c1836');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '4ef1a732e18c4209bbb1193a0d264975');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '74dfc6bb363b42cf98a1f6505268c5ff');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '7dba4c44a7554c50a75ac514ab4e1428');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '81615af2e1eb4196bdf0f6c139201d20');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '82d0fcdc7f6140538fada7dc4567d485');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', '8bc9cf2a4f86441f805275a4d3804595');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', 'b2961da7bfec4a32a607f26ef8fc54f4');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', 'bc538436d26a48b8af51bdad5e6be6d9');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', 'bf53b685a04a4db3adf77bc0b127abaf');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', 'cc16ecdc43674261a1240a0e40e980d9');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', 'dcf09746313d42e2aa6ad187c0b3db4b');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', 'e4c9a7b01abb435889b59a4515257c94');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', 'fe40d683808345f2b70ffbd54b51a1bd');
INSERT INTO `sys_role_menu` VALUES ('acd4eb49e7194b609369e929f340b30e', 'feb2b9c11977468c80a317778090d0fc');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', '1');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', '35d0c54979404a07be2e5db02a6d9265');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', '4c33d61113f545758f7b08a4482c1836');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', '4ef1a732e18c4209bbb1193a0d264975');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', '7dba4c44a7554c50a75ac514ab4e1428');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', '82d0fcdc7f6140538fada7dc4567d485');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', '8bc9cf2a4f86441f805275a4d3804595');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', 'b2961da7bfec4a32a607f26ef8fc54f4');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', 'bc538436d26a48b8af51bdad5e6be6d9');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', 'bf53b685a04a4db3adf77bc0b127abaf');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', 'cc16ecdc43674261a1240a0e40e980d9');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', 'e4c9a7b01abb435889b59a4515257c94');
INSERT INTO `sys_role_menu` VALUES ('cb7ccf27dd06441499b7d98c14e202fb', 'feb2b9c11977468c80a317778090d0fc');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '1');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '20');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '21');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '22');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '2a0f940fbe304a05a6b4040ddf6df279');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '3');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '35d0c54979404a07be2e5db02a6d9265');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '4ef1a732e18c4209bbb1193a0d264975');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '57f1f00d6cb14819bef388acd10e6f5a');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '67');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '68');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '79fca849d3da4a82a4ade3f6b9f45126');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '7dba4c44a7554c50a75ac514ab4e1428');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '8bc9cf2a4f86441f805275a4d3804595');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', '91aa429a6cdc4a9b954d84ff1456934b');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', 'a7fb88e9bf704d149b483e97dabdccf9');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', 'b2961da7bfec4a32a607f26ef8fc54f4');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', 'b9a776f5d7194406bb466388e3af9d08');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', 'c3530ae07fbb44c6998f0a52785cdb73');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', 'cc16ecdc43674261a1240a0e40e980d9');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', 'dcf09746313d42e2aa6ad187c0b3db4b');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', 'e4c9a7b01abb435889b59a4515257c94');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', 'f34887a78fa245c1977603ca7dc98e11');
INSERT INTO `sys_role_menu` VALUES ('f7628bda7f7d4bbe874e32ca0e9fd8d5', 'fe40d683808345f2b70ffbd54b51a1bd');

-- ----------------------------
-- Table structure for sys_schedule
-- ----------------------------
DROP TABLE IF EXISTS `sys_schedule`;
CREATE TABLE `sys_schedule` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `name` varchar(64) DEFAULT NULL COMMENT '任务名',
  `t_group` varchar(64) DEFAULT NULL COMMENT '任务组',
  `expression` varchar(64) DEFAULT NULL COMMENT '定时规则',
  `status` varchar(64) DEFAULT NULL COMMENT '启用状态',
  `is_info` varchar(64) DEFAULT NULL COMMENT '通知用户',
  `classname` varchar(256) DEFAULT NULL COMMENT '任务类',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of sys_schedule
-- ----------------------------
INSERT INTO `sys_schedule` VALUES ('adf3eef0150b4cbbb50deca60046e54c', '测试任务', '1', '0/5 * * * * ?', '0', '1', 'com.jeeplus.modules.monitor.task.TestTask1', '888', '1', '2017-02-04 18:20:17', '1', '2017-06-01 16:05:24', '0');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) DEFAULT NULL COMMENT '归属公司',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `login_name` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) DEFAULT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `qrcode` varchar(1000) DEFAULT NULL COMMENT '二维码',
  `sign` varchar(450) DEFAULT NULL COMMENT '个性签名',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', 'e0ef8af9cae6416f8bb359714a1b4244', 'admin', '3c9aabcf6ae15c61bc27aa06bea8aafb9a986a19f919070f17ed91af', '1', 'admin', '', '123', '123', '/checker/userfiles/1/images/捕获.JPG', '127.0.0.1', '2017-12-08 11:39:36', '1', '1', '2013-05-27 08:00:00', '1', '2017-09-21 14:32:30', 'wwwwwwwwwwwwwwwww', '0', '/checker/userfiles/1/qrcode/1.png', '你好啊111rrr');
INSERT INTO `sys_user` VALUES ('2e076bc7fc4847a4a6a4e5c144c67de6', '1', 'e0ef8af9cae6416f8bb359714a1b4244', 'ProjectAdmin', '872114aecf306b6dc5f86b31597130d4e8af52eaffe71222d0e3ca25', '5', 'pantestProjectAdmin', '', '', '', '/jeeplus/static/common/images/flat-avatar.png', '127.0.0.1', '2017-11-13 16:02:14', '1', '1', '2017-09-12 10:22:35', '1', '2017-09-21 14:30:12', '', '0', '/jeeplus/userfiles//qrcode/.png', null);
INSERT INTO `sys_user` VALUES ('50b27251fb9c48cd8b93d7bee2e3d19a', '1', 'e0ef8af9cae6416f8bb359714a1b4244', 'ProjectAssigner', '3cc4a0141b5f2efdb211421426809190219f0bfc0b503601f9916c3e', '4', 'pantestProjectAssigner', 'zhenhua.pan@weltown.cn', '', 'test2', '/jeeplus/static/common/images/flat-avatar.png', '127.0.0.1', '2017-11-13 16:01:09', '1', '1', '2017-09-12 10:22:17', '1', '2017-09-21 14:30:07', '', '0', '/checker/userfiles/50b27251fb9c48cd8b93d7bee2e3d19a/qrcode/50b27251fb9c48cd8b93d7bee2e3d19a.png', null);
INSERT INTO `sys_user` VALUES ('73b19d7c6288423683ec00b44579a5bb', '1', 'e0ef8af9cae6416f8bb359714a1b4244', 'ProjectUser', 'f2f3f199476e88912372aa8c75e835aeb6bc2de4570dde0c4e982302', '2', 'pantestProjectUser', '', '', '', '/jeeplus/static/common/images/flat-avatar.png', '127.0.0.1', '2017-11-13 16:00:17', '1', '1', '2017-09-12 10:21:37', '1', '2017-11-10 14:35:32', '', '0', '/checker/userfiles/73b19d7c6288423683ec00b44579a5bb/qrcode/73b19d7c6288423683ec00b44579a5bb.png', null);
INSERT INTO `sys_user` VALUES ('a0891d76540e4f27ad9424283c592dec', '1', 'e0ef8af9cae6416f8bb359714a1b4244', 'ProjectAuditor', 'fed26c1b469333692bf186b8a1309da442e94c51fdf9e1a1e01b4955', '3', 'pantestProjectAuditor', '', '', '', '/jeeplus/static/common/images/flat-avatar.png', '127.0.0.1', '2017-11-13 15:59:45', '1', '1', '2017-09-12 10:21:56', '1', '2017-09-22 10:45:22', '', '0', '/checker/userfiles/a0891d76540e4f27ad9424283c592dec/qrcode/a0891d76540e4f27ad9424283c592dec.png', null);
INSERT INTO `sys_user` VALUES ('f8d1ae3734c14c65bf4e1c5ffff6774b', '1', 'e0ef8af9cae6416f8bb359714a1b4244', 'user1', '5ad306abe85329b79305c5a2bdc43242a3b839933c74af4df129a829', '', 'user1', '', '', '', '/checker/static/common/images/flat-avatar.png', '127.0.0.1', '2017-10-16 15:50:20', '1', '1', '2017-10-16 10:24:35', '1', '2017-10-16 15:50:13', '', '0', '/checker/userfiles/f8d1ae3734c14c65bf4e1c5ffff6774b/qrcode/f8d1ae3734c14c65bf4e1c5ffff6774b.png', null);

-- ----------------------------
-- Table structure for sys_user_friend
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_friend`;
CREATE TABLE `sys_user_friend` (
  `id` varchar(64) NOT NULL,
  `userId` varchar(64) NOT NULL,
  `friendId` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of sys_user_friend
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1c54e003c1fc4dcd9b087ef8d48abac3');
INSERT INTO `sys_user_role` VALUES ('2e076bc7fc4847a4a6a4e5c144c67de6', 'f7628bda7f7d4bbe874e32ca0e9fd8d5');
INSERT INTO `sys_user_role` VALUES ('50b27251fb9c48cd8b93d7bee2e3d19a', '0a09077217e54b279291e36431acc434');
INSERT INTO `sys_user_role` VALUES ('73b19d7c6288423683ec00b44579a5bb', 'cb7ccf27dd06441499b7d98c14e202fb');
INSERT INTO `sys_user_role` VALUES ('a0891d76540e4f27ad9424283c592dec', 'acd4eb49e7194b609369e929f340b30e');
INSERT INTO `sys_user_role` VALUES ('f8d1ae3734c14c65bf4e1c5ffff6774b', 'acd4eb49e7194b609369e929f340b30e');

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `groupname` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '群组名',
  `avatar` varchar(256) DEFAULT NULL COMMENT '群头像',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注信息',
  `del_flag` varchar(64) DEFAULT NULL COMMENT '逻辑删除标记（0：显示；1：隐藏）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='群组';

-- ----------------------------
-- Records of t_group
-- ----------------------------
