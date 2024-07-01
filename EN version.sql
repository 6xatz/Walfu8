/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : walfu7

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 24/06/2024 10:01:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id_company` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_company`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('P01', 'Isekai', 'Alter-world');
INSERT INTO `company` VALUES ('P02', 'Persatuan Hajatan Pemuda (PHP)', 'Rumahmu');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id_department` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_company` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `manager_nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_department`) USING BTREE,
  INDEX `id_company`(`id_company` ASC) USING BTREE,
  INDEX `manager_nik`(`manager_nik` ASC) USING BTREE,
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `department_ibfk_2` FOREIGN KEY (`manager_nik`) REFERENCES `employee` (`nik`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('D01', 'Produksi', 'P02', 'N01');
INSERT INTO `department` VALUES ('D02', 'Marketing', 'P01', 'N03');
INSERT INTO `department` VALUES ('D03', 'RnD', 'P02', '');
INSERT INTO `department` VALUES ('D04', 'Logistik', 'P02', '');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_department` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `svisor_nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `salary` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`nik`) USING BTREE,
  INDEX `id_department`(`id_department` ASC) USING BTREE,
  INDEX `svisor_nik`(`svisor_nik` ASC) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`svisor_nik`) REFERENCES `employee` (`nik`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('N01', 'Aira', 'D01', '', 5000.00);
INSERT INTO `employee` VALUES ('N02', 'Shina', 'D01', '', 5500.00);
INSERT INTO `employee` VALUES ('N03', 'Rin', 'D03', '', 6000.00);
INSERT INTO `employee` VALUES ('N04', 'Ryuta', 'D01', 'N01', 4500.00);
INSERT INTO `employee` VALUES ('N05', 'Fii', 'D01', 'N01', 7000.00);
INSERT INTO `employee` VALUES ('N06', 'Riko', 'D02', '', 4200.00);
INSERT INTO `employee` VALUES ('N07', 'Ixia', 'D02', 'N03', 5500.00);
INSERT INTO `employee` VALUES ('N08', 'Rem', 'D04', 'N06', 5500.00);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id_project` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_project`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('PJ01', 'A', '2024-01-10 00:00:00', '2024-03-12 00:00:00', 1);
INSERT INTO `project` VALUES ('PJ02', 'B', '2024-02-15 00:00:00', '2024-04-22 00:00:00', 1);
INSERT INTO `project` VALUES ('PJ03', 'C', '2024-03-21 00:00:00', '2024-05-18 00:00:00', 1);

-- ----------------------------
-- Table structure for project_detail
-- ----------------------------
DROP TABLE IF EXISTS `project_detail`;
CREATE TABLE `project_detail`  (
  `id_project` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_project`, `nik`) USING BTREE,
  INDEX `nik`(`nik` ASC) USING BTREE,
  CONSTRAINT `project_detail_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `project_detail_ibfk_2` FOREIGN KEY (`nik`) REFERENCES `employee` (`nik`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_detail
-- ----------------------------
INSERT INTO `project_detail` VALUES ('PJ01', 'N03', 'dikerjakan oleh Vvibu propesional.');
INSERT INTO `project_detail` VALUES ('PJ02', 'N05', 'beliau ini fullstack-developer jadi suka ngaret gt.');
INSERT INTO `project_detail` VALUES ('PJ02', 'N07', 'sama ini kek fullstack barusan bedanya rajin dikit.');
INSERT INTO `project_detail` VALUES ('PJ03', 'N08', 'Solo-project ni bos, hotfix tiap 3 jam :D');

SET FOREIGN_KEY_CHECKS = 1;
