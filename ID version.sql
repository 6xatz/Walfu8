/*
 Navicat Premium Data Transfer

 Source Server         : XAMPP MySQL
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : walfu8

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 01/07/2024 10:25:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `id_departemen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_perusahaan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `manajer_nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_departemen`) USING BTREE,
  INDEX `id_perusahaan`(`id_perusahaan` ASC) USING BTREE,
  INDEX `manajer_nik`(`manajer_nik` ASC) USING BTREE,
  CONSTRAINT `departemen_ibfk_1` FOREIGN KEY (`id_perusahaan`) REFERENCES `perusahaan` (`id_perusahaan`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `departemen_ibfk_2` FOREIGN KEY (`manajer_nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES ('D01', 'Produksi', 'P02', 'N01');
INSERT INTO `departemen` VALUES ('D02', 'Marketing', 'P01', 'N03');
INSERT INTO `departemen` VALUES ('D03', 'RnD', 'P02', '');
INSERT INTO `departemen` VALUES ('D04', 'Logistik', 'P02', '');

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan`  (
  `nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_departemen` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `svisor_nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gaji_pokok` decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`nik`) USING BTREE,
  INDEX `id_departemen`(`id_departemen` ASC) USING BTREE,
  INDEX `svisor_nik`(`svisor_nik` ASC) USING BTREE,
  CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`svisor_nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO `karyawan` VALUES ('N01', 'Ari', 'D01', '', 2000000);
INSERT INTO `karyawan` VALUES ('N02', 'Dina', 'D01', '', 2500000);
INSERT INTO `karyawan` VALUES ('N03', 'Rika', 'D03', '', 2400000);
INSERT INTO `karyawan` VALUES ('N04', 'Ratih', 'D01', 'N01', 3000000);
INSERT INTO `karyawan` VALUES ('N05', 'Riko', 'D01', 'N01', 2800000);
INSERT INTO `karyawan` VALUES ('N06', 'Dani', 'D02', '', 2100000);
INSERT INTO `karyawan` VALUES ('N07', 'Anis', 'D02', 'N06', 5000000);
INSERT INTO `karyawan` VALUES ('N08', 'Dika', 'D02', 'N06', 4000000);
INSERT INTO `karyawan` VALUES ('N09', 'Raka', 'D03', 'N06', 2000000);

-- ----------------------------
-- Table structure for perusahaan
-- ----------------------------
DROP TABLE IF EXISTS `perusahaan`;
CREATE TABLE `perusahaan`  (
  `id_perusahaan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_perusahaan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of perusahaan
-- ----------------------------
INSERT INTO `perusahaan` VALUES ('P01', 'Kantor Pusat', 'Meikarta');
INSERT INTO `perusahaan` VALUES ('P02', 'Cabang Bekasi', 'Haneut City');

-- ----------------------------
-- Table structure for proyek
-- ----------------------------
DROP TABLE IF EXISTS `proyek`;
CREATE TABLE `proyek`  (
  `id_proyek` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mulai_tanggal` datetime NULL DEFAULT NULL,
  `selesai_tanggal` datetime NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_proyek`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proyek
-- ----------------------------
INSERT INTO `proyek` VALUES ('PJ01', 'A', '2024-01-10 00:00:00', '2024-07-17 00:00:00', 1);
INSERT INTO `proyek` VALUES ('PJ02', 'B', '2024-02-15 00:00:00', '2024-07-05 00:00:00', 1);
INSERT INTO `proyek` VALUES ('PJ03', 'C', '2024-03-21 00:00:00', '2024-06-18 00:00:00', 1);

-- ----------------------------
-- Table structure for proyek_detail
-- ----------------------------
DROP TABLE IF EXISTS `proyek_detail`;
CREATE TABLE `proyek_detail`  (
  `id_proyek` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nik` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_proyek`, `nik`) USING BTREE,
  INDEX `nik`(`nik` ASC) USING BTREE,
  CONSTRAINT `proyek_detail_ibfk_1` FOREIGN KEY (`id_proyek`) REFERENCES `proyek` (`id_proyek`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `proyek_detail_ibfk_2` FOREIGN KEY (`nik`) REFERENCES `karyawan` (`nik`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of proyek_detail
-- ----------------------------
INSERT INTO `proyek_detail` VALUES ('PJ01', 'N01', 'Seorang wibu pernah menghabiskan seluruh tabungan hidupnya untuk membeli merchandise anime favoritnya.');
INSERT INTO `proyek_detail` VALUES ('PJ01', 'N02', 'Ada wibu yang belajar bahasa Jepang hanya untuk memahami anime tanpa subtitle.');
INSERT INTO `proyek_detail` VALUES ('PJ01', 'N03', 'Beberapa wibu mendekorasi kamar mereka sepenuhnya dengan poster, figur, dan barang-barang bertema anime.');
INSERT INTO `proyek_detail` VALUES ('PJ01', 'N04', 'Beberapa wibu memutuskan untuk merayakan ulang tahun karakter anime favorit mereka dengan pesta besar.');
INSERT INTO `proyek_detail` VALUES ('PJ01', 'N05', 'Seorang wibu pernah mengajukan petisi untuk menjadikan bahasa Jepang sebagai bahasa resmi di negaranya.');
INSERT INTO `proyek_detail` VALUES ('PJ01', 'N07', 'Ada wibu yang menggunakan karakter anime sebagai profil di semua akun media sosialnya.');
INSERT INTO `proyek_detail` VALUES ('PJ01', 'N08', 'Beberapa wibu menciptakan fanfiction yang sangat panjang dan rumit tentang karakter anime favorit mereka.');
INSERT INTO `proyek_detail` VALUES ('PJ02', 'N01', 'Seorang wibu menghabiskan waktu bertahun-tahun untuk membuat cosplay yang sempurna dari karakter anime favoritnya.');
INSERT INTO `proyek_detail` VALUES ('PJ02', 'N03', 'Ada wibu yang hanya makan makanan Jepang karena terinspirasi oleh anime.');
INSERT INTO `proyek_detail` VALUES ('PJ02', 'N05', 'Beberapa wibu menamai hewan peliharaan mereka dengan nama karakter anime.');
INSERT INTO `proyek_detail` VALUES ('PJ03', 'N03', 'Seorang wibu pernah mencoba memecahkan rekor dunia untuk jumlah anime yang ditonton dalam setahun.');
INSERT INTO `proyek_detail` VALUES ('PJ03', 'N07', 'Ada wibu yang membuat altar khusus di rumah mereka untuk karakter anime favorit.');
INSERT INTO `proyek_detail` VALUES ('PJ03', 'N08', 'Beberapa wibu menganggap karakter anime sebagai \"waifu\" atau \"husbando\" dan menganggap mereka sebagai pasangan virtual.');

SET FOREIGN_KEY_CHECKS = 1;
