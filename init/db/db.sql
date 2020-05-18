-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_auth
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `db_auth`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_auth` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_auth`;

--
-- Table structure for table `oauth_access_token`
--

DROP TABLE IF EXISTS `oauth_access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL COMMENT 'MD5加密的access_token的值',
  `token` blob COMMENT 'OAuth2AccessToken.java对象序列化后的二进制数据',
  `authentication_id` varchar(256) DEFAULT NULL COMMENT 'MD5加密过的username,client_id,scope',
  `user_name` varchar(256) DEFAULT NULL COMMENT '登录的用户名',
  `client_id` varchar(256) DEFAULT NULL COMMENT '客户端ID',
  `authentication` blob COMMENT 'OAuth2Authentication.java对象序列化后的二进制数据',
  `refresh_token` varchar(256) DEFAULT NULL COMMENT 'MD5加密果的refresh_token的值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='访问令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_token`
--

LOCK TABLES `oauth_access_token` WRITE;
/*!40000 ALTER TABLE `oauth_access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_approvals`
--

DROP TABLE IF EXISTS `oauth_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_approvals` (
  `userid` varchar(256) DEFAULT NULL COMMENT '登录的用户名',
  `clientid` varchar(256) DEFAULT NULL COMMENT '客户端ID',
  `scope` varchar(256) DEFAULT NULL COMMENT '申请的权限',
  `status` varchar(10) DEFAULT NULL COMMENT '状态（Approve或Deny）',
  `expiresat` datetime DEFAULT NULL COMMENT '过期时间',
  `lastmodifiedat` datetime DEFAULT NULL COMMENT '最终修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='授权记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_approvals`
--

LOCK TABLES `oauth_approvals` WRITE;
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_details`
--

DROP TABLE IF EXISTS `oauth_client_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL COMMENT '客户端ID',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '资源ID集合,多个资源时用逗号(,)分隔',
  `client_secret` varchar(256) DEFAULT NULL COMMENT '客户端密匙',
  `scope` varchar(256) DEFAULT NULL COMMENT '客户端申请的权限范围',
  `authorized_grant_types` varchar(256) DEFAULT NULL COMMENT '客户端支持的grant_type',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '重定向URI',
  `authorities` varchar(256) DEFAULT NULL COMMENT '客户端所拥有的Spring Security的权限值，多个用逗号(,)分隔',
  `access_token_validity` int DEFAULT NULL COMMENT '访问令牌有效时间值(单位:秒)',
  `refresh_token_validity` int DEFAULT NULL COMMENT '更新令牌有效时间值(单位:秒)',
  `additional_information` varchar(4096) DEFAULT NULL COMMENT '预留字段',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '用户是否自动Approval操作',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户端信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_details`
--

LOCK TABLES `oauth_client_details` WRITE;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` VALUES ('test_client',NULL,'$2a$10$2szDKjvKHJCWE6YQNznogOeQF3USZHmCYj1fG7YbfK.vnTgNKLzri','read','client_credentials,authorization_code,mobile,password,refresh_token','http://baidu.com',NULL,7200,108000,NULL,NULL);
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_client_token`
--

DROP TABLE IF EXISTS `oauth_client_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL COMMENT 'MD5加密的access_token值',
  `token` blob COMMENT 'OAuth2AccessToken.java对象序列化后的二进制数据',
  `authentication_id` varchar(256) DEFAULT NULL COMMENT 'MD5加密过的username,client_id,scope',
  `user_name` varchar(256) DEFAULT NULL COMMENT '登录的用户名',
  `client_id` varchar(256) DEFAULT NULL COMMENT '客户端ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户端授权令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_client_token`
--

LOCK TABLES `oauth_client_token` WRITE;
/*!40000 ALTER TABLE `oauth_client_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_client_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_code`
--

DROP TABLE IF EXISTS `oauth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL COMMENT '授权码(未加密)',
  `authentication` blob COMMENT 'AuthorizationRequestHolder.java对象序列化后的二进制数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='授权码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_code`
--

LOCK TABLES `oauth_code` WRITE;
/*!40000 ALTER TABLE `oauth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_token`
--

DROP TABLE IF EXISTS `oauth_refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL COMMENT 'MD5加密过的refresh_token的值',
  `token` blob COMMENT 'OAuth2RefreshToken.java对象序列化后的二进制数据',
  `authentication` blob COMMENT 'OAuth2Authentication.java对象序列化后的二进制数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='更新令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_token`
--

LOCK TABLES `oauth_refresh_token` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_gateway`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_gateway` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_gateway`;

--
-- Table structure for table `tb_gateway_route`
--

DROP TABLE IF EXISTS `tb_gateway_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_gateway_route` (
  `id` varchar(20) NOT NULL COMMENT 'id',
  `route_id` varchar(100) NOT NULL COMMENT '路由id',
  `uri` varchar(100) NOT NULL COMMENT 'uri路径',
  `predicates` text NOT NULL COMMENT '判定器',
  `filters` text COMMENT '过滤器',
  `orders` int DEFAULT NULL COMMENT '排序',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` varchar(1) DEFAULT 'Y' COMMENT '状态：Y-有效，N-无效',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_gateway_routes_uri` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='网关路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_gateway_route`
--

LOCK TABLES `tb_gateway_route` WRITE;
/*!40000 ALTER TABLE `tb_gateway_route` DISABLE KEYS */;
INSERT INTO `tb_gateway_route` VALUES ('101','authorization-server','lb://authentication:39000','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/authentication/**\"}}]','[{\"name\":\"StripPrefix\",\"args\":{\"parts\":\"1\"}}]',100,'授权认证服务网关注册','Y','2020-05-15 14:04:10','2020-05-15 14:04:10','system','system'),('102','authentication-server','lb://authentication-server:38300','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/authentication-server/**\"}}]','[{\"name\":\"StripPrefix\",\"args\":{\"parts\":\"1\"}}]',100,'签权服务网关注册','Y','2020-05-15 14:04:10','2020-05-15 14:04:10','system','system'),('103','organization','lb://organization:39100','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/organization/**\"}}]','[{\"name\":\"StripPrefix\",\"args\":{\"parts\":\"1\"}}]',100,'系统管理相关接口','Y','2020-05-15 14:04:10','2020-05-15 14:04:10','system','system'),('104','gateway-admin','lb://gateway-admin:38280','[{\"name\":\"Path\",\"args\":{\"pattern\":\"/gateway-admin/**\"}}]','[{\"name\":\"StripPrefix\",\"args\":{\"parts\":\"1\"}}]',100,'网关管理相关接口','Y','2020-05-15 14:04:10','2020-05-15 14:04:10','system','system');
/*!40000 ALTER TABLE `tb_gateway_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `db_org`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `db_org` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_org`;

--
-- Table structure for table `tb_groups`
--

DROP TABLE IF EXISTS `tb_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_groups` (
  `id` bigint NOT NULL COMMENT 'id',
  `parent_id` bigint NOT NULL COMMENT '用户组父id',
  `name` varchar(200) DEFAULT NULL COMMENT '用户组名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `deleted` varchar(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除Y：已删除，N：未删除',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_groups`
--

LOCK TABLES `tb_groups` WRITE;
/*!40000 ALTER TABLE `tb_groups` DISABLE KEYS */;
INSERT INTO `tb_groups` VALUES (101,-1,'总公司','总公司','N','2020-05-13 17:33:01','2020-05-13 17:33:01','system','system'),(102,101,'上海分公司','上海分公司','N','2020-05-13 17:33:01','2020-05-13 17:33:01','system','system'),(103,102,'研发部门','负责产品研发','N','2020-05-13 17:33:01','2020-05-13 17:33:01','system','system'),(104,102,'产品部门','负责产品设计','N','2020-05-13 17:33:01','2020-05-13 17:33:01','system','system'),(105,102,'运营部门','负责公司产品运营','N','2020-05-13 17:33:01','2020-05-13 17:33:01','system','system'),(106,102,'销售部门','负责公司产品销售','N','2020-05-13 17:33:01','2020-05-13 17:33:01','system','system'),(107,101,'北京分公司','北京分公司','N','2020-05-13 17:33:01','2020-05-13 17:33:01','system','system');
/*!40000 ALTER TABLE `tb_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_menu` (
  `id` bigint NOT NULL COMMENT 'id',
  `parent_id` bigint NOT NULL COMMENT '父菜单id',
  `type` varchar(100) DEFAULT NULL COMMENT '菜单类型',
  `href` varchar(200) DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(200) DEFAULT NULL COMMENT '菜单图标',
  `name` varchar(200) DEFAULT NULL COMMENT '菜单名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `order_num` int DEFAULT NULL COMMENT '创建时间',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (101,-1,'MENU','/admin','setting','系统管理','系统设置管理',0,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,101,'MENU','/admin/users','fa-user','用户管理','用户新增，修改，查看，删除',10,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(103,101,'MENU','/admin/menus','category','菜单管理','菜单新增，修改，删除',20,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_position`
--

DROP TABLE IF EXISTS `tb_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_position` (
  `id` bigint NOT NULL COMMENT 'id',
  `name` varchar(200) DEFAULT NULL COMMENT '岗位名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `deleted` varchar(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除Y：已删除，N：未删除',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_position`
--

LOCK TABLES `tb_position` WRITE;
/*!40000 ALTER TABLE `tb_position` DISABLE KEYS */;
INSERT INTO `tb_position` VALUES (101,'首席执行官','公司CEO，负责公司整体运转','N','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,'首席运营官','公司COO，负责公司整体运营','N','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(103,'首席技术官','公司CTO，负责公司整体运营','N','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_resource`
--

DROP TABLE IF EXISTS `tb_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_resource` (
  `id` bigint NOT NULL COMMENT '资源id',
  `code` varchar(100) NOT NULL COMMENT '资源code',
  `type` varchar(100) NOT NULL COMMENT '资源类型',
  `name` varchar(200) NOT NULL COMMENT '资源名称',
  `url` varchar(200) NOT NULL COMMENT '资源url',
  `method` varchar(20) NOT NULL COMMENT '资源方法',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_resource_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_resource`
--

LOCK TABLES `tb_resource` WRITE;
/*!40000 ALTER TABLE `tb_resource` DISABLE KEYS */;
INSERT INTO `tb_resource` VALUES (101,'user_manager:btn_add','user','新增用户','/user','POST','新增用户功能','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,'user_manager:btn_edit','user','编辑用户','/user/{id}','PUT','编辑用户功能','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(103,'user_manager:btn_del','user','删除用户','/user/{id}','DELETE','根据用户id删除用户','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(104,'user_manager:view','user','查看用户','/user/{id}','GET','根据用户id获取用户','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(105,'user_manager:query','user','搜索用户','/user/conditions','POST','根据条件查询用户','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(106,'user_manager:get','user','获取用户','/user','GET','根据唯一标识获取用户','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(201,'role_manager:btn_add','role','新增角色','/role','POST','新增角色功能','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(202,'role_manager:btn_edit','role','编辑角色','/role/{id}','PUT','编辑角色功能','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(203,'role_manager:btn_del','role','删除角色','/role/{id}','DELETE','根据id删除角色','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(204,'role_manager:view','role','查看角色','/role/{id}','GET','根据id获取角色','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(205,'role_manager:user','role','根据用户id查询角色','/role/user/{userId}','GET','根据用户id获取用户所拥有的角色集','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(206,'role_manager:all','role','获取所有角色','/role/all','GET','获取所有角色','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(207,'role_manager:query','role','搜索角色','/role/conditions','POST','根据条件查询角色','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(301,'group_manager:parent','group','根据父id查询组','/group/parent/{id}','GET','根据父id查询用户组','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(302,'group_manager:get','group','查看用户组','/group/{id}','GET','根据id查询用户组','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(303,'group_manager:query','group','搜索用户组','/group/conditions','POST','根据条件查询用户组信息','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(304,'group_manager:del','group','删除用户组','/group/{id}','DELETE','根据用户id删除用户组','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(305,'group_manager:edit','group','编辑用户组','/group/{id}','PUT','修改用户组','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(306,'group_manager:add','group','新增用户组','/group','POST','新增用户组','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(307,'gateway_manager:add','gateway','新增网关路由','/gateway/routes','POST','新增网关路由','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(308,'gateway_manager:edit','gateway','修改网关路由','/gateway/routes/{id}','PUT','修改网关路由','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(309,'gateway_manager:adel','gateway','删除网关路由','/gateway/routes/{id}','DELETE','删除网关路由','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(310,'gateway_manager:view','gateway','查看网关路由','/gateway/routes/{id}','GET','查看网关路由','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(311,'gateway_manager:query','gateway','搜索网关路由','/gateway/routes/conditions','POST','搜索网关路由','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(312,'gateway_manager:overload','gateway','全局加载路由','/gateway/routes/overload','POST','全局加载路由','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(313,'resource_manager:add','resource','新增网关路由','/resource','POST','新增资源路由','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(314,'resource_manager:edit','resource','修改网关路由','/resource/{id}','PUT','修改资源','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(315,'resource_manager:adel','resource','删除网关路由','/resource/{id}','DELETE','删除资源','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(316,'resource_manager:view','resource','查看网关路由','/resource/{id}','GET','查看资源','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(317,'resource_manager:query','resource','搜索网关路由','/resource/conditions','POST','搜索资源','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(318,'resource_manager:all','resource','全局加载路由','/resource/all','GET','查询全部资源','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role` (
  `id` bigint NOT NULL COMMENT '角色id',
  `code` varchar(100) NOT NULL COMMENT '角色code',
  `name` varchar(200) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (101,'ADMIN','超级管理员','公司IT总负责人','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,'FIN','财务','财务','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(103,'IT','IT','IT角色','2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_menu`
--

DROP TABLE IF EXISTS `tb_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role_menu` (
  `id` bigint NOT NULL COMMENT 'id',
  `menu_id` bigint NOT NULL COMMENT '菜单id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_menu`
--

LOCK TABLES `tb_role_menu` WRITE;
/*!40000 ALTER TABLE `tb_role_menu` DISABLE KEYS */;
INSERT INTO `tb_role_menu` VALUES (101,101,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,102,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(103,103,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(104,101,102,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(105,102,102,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(106,101,103,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(107,102,103,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(108,103,103,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_resource`
--

DROP TABLE IF EXISTS `tb_role_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_role_resource` (
  `id` bigint NOT NULL COMMENT '关系id',
  `resource_id` bigint NOT NULL COMMENT '角色id',
  `role_id` bigint NOT NULL COMMENT '资源id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和资源关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_resource`
--

LOCK TABLES `tb_role_resource` WRITE;
/*!40000 ALTER TABLE `tb_role_resource` DISABLE KEYS */;
INSERT INTO `tb_role_resource` VALUES (101,101,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,102,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(103,103,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(104,104,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(105,105,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(106,106,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(201,201,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(202,202,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(203,203,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(204,204,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(205,205,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(206,206,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(207,207,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(208,301,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(209,302,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(210,303,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(211,304,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(212,305,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(213,306,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(401,307,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(402,308,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(403,309,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(404,310,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(405,311,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(406,312,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(501,313,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(502,314,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(503,315,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(504,316,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(505,317,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(506,318,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_role_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `id` bigint NOT NULL COMMENT 'id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '用户密码密文',
  `name` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '用户手机',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `deleted` varchar(1) NOT NULL DEFAULT 'N' COMMENT '是否已删除Y：已删除，N：未删除',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '是否有效用户',
  `account_non_expired` tinyint(1) DEFAULT NULL COMMENT '账号是否未过期',
  `credentials_non_expired` tinyint(1) DEFAULT NULL COMMENT '密码是否未过期',
  `account_non_locked` tinyint(1) DEFAULT NULL COMMENT '是否未锁定',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_users_username` (`username`),
  UNIQUE KEY `ux_users_mobile` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (101,'admin','$2a$10$vYA9wKn/hVGOtwQw2eHiceeIGNBdfLYpDmbzHgBSVmOfHXPH4iYdS','超级管理员','',NULL,'N',1,1,1,1,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,'zhoutaoo','$2a$10$vYA9wKn/hVGOtwQw2eHiceeIGNBdfLYpDmbzHgBSVmOfHXPH4iYdS','周涛','15619841000',NULL,'N',1,1,1,1,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_group`
--

DROP TABLE IF EXISTS `tb_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_group` (
  `id` bigint NOT NULL COMMENT 'id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `group_id` bigint NOT NULL COMMENT '用户组id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和组关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_group`
--

LOCK TABLES `tb_user_group` WRITE;
/*!40000 ALTER TABLE `tb_user_group` DISABLE KEYS */;
INSERT INTO `tb_user_group` VALUES (101,101,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,102,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_position`
--

DROP TABLE IF EXISTS `tb_user_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_position` (
  `id` bigint NOT NULL COMMENT 'id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `position_id` bigint NOT NULL COMMENT '角色id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和岗位关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_position`
--

LOCK TABLES `tb_user_position` WRITE;
/*!40000 ALTER TABLE `tb_user_position` DISABLE KEYS */;
INSERT INTO `tb_user_position` VALUES (101,101,103,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,102,103,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_user_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_role`
--

DROP TABLE IF EXISTS `tb_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_role` (
  `id` bigint NOT NULL COMMENT '关系id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `role_id` bigint NOT NULL COMMENT '角色id',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_by` varchar(100) NOT NULL COMMENT '创建人',
  `updated_by` varchar(100) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_role`
--

LOCK TABLES `tb_user_role` WRITE;
/*!40000 ALTER TABLE `tb_user_role` DISABLE KEYS */;
INSERT INTO `tb_user_role` VALUES (101,101,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(102,102,101,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system'),(103,102,103,'2020-05-13 17:31:23','2020-05-13 17:31:23','system','system');
/*!40000 ALTER TABLE `tb_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-18 16:45:14
