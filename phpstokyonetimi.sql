/*
Navicat MySQL Data Transfer

Source Server         : php ile stok yonetimi
Source Server Version : 100108
Source Host           : localhost:3306
Source Database       : phpstokyonetimi

Target Server Type    : MYSQL
Target Server Version : 100108
File Encoding         : 65001

Date: 2015-12-27 20:45:54
*/

SET FOREIGN_KEY_CHECKS=0;
KullaniciAdi
-- ----------------------------
-- Table structure for cari
-- ----------------------------
DROP TABLE IF EXISTS `cari`;
CREATE TABLE `cari` (
  `CariID` int(11) NOT NULL AUTO_INCREMENT,
  `TipID` int(11) DEFAULT '1',
  `CariKodu` varchar(100) DEFAULT NULL,
  `CariAdi` varchar(500) DEFAULT NULL,
  `Eposta` varchar(100) DEFAULT NULL,
  `Telefon` varchar(25) DEFAULT NULL,
  `VergiDairesi` varchar(100) DEFAULT NULL,
  `VergiNumarası` varchar(10) DEFAULT NULL,
  `Notlar` text,
  PRIMARY KEY (`CariID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cari
-- ----------------------------
INSERT INTO `cari` VALUES ('11', '1', 'zeytinci1', 'Sebze', '2@hotmail.com', '530500000', 'harput', '0000000', 'yok');
INSERT INTO `cari` VALUES ('13', '1', 'zeytin', 'Zeytin', '3@hotmail.com', '50500000', 'hazar', '0000004', 'yok');
INSERT INTO `cari` VALUES ('14', '2', 'Meyve', 'Meyveler', '4@hotmail.com', '05000014', 'harput', '0000002', 'yok');

-- ----------------------------
-- Table structure for cari_adres
-- ----------------------------
DROP TABLE IF EXISTS `cari_adres`;
CREATE TABLE `cari_adres` (
  `AdresID` int(11) NOT NULL AUTO_INCREMENT,
  `AdresTipID` int(11) DEFAULT NULL,
  `CariID` int(11) DEFAULT NULL,
  `Ulke` varchar(50) DEFAULT NULL,
  `Sehir` varchar(50) DEFAULT NULL,
  `Ilce` varchar(50) DEFAULT NULL,
  `Adres` text,
  `Telefon` varchar(50) DEFAULT NULL,
  `Fax` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdresID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cari_adres
-- ----------------------------
INSERT INTO `cari_adres` VALUES ('1', '8', '11', 'Türkiye', 'Elazığ', 'Merkez', 'adres', null, null);
INSERT INTO `cari_adres` VALUES ('2', '2', '13', 'Türkiye', 'Elazığ', 'Palu', 'adres1', '0424240000', '0424000001');
INSERT INTO `cari_adres` VALUES ('3', '3', '14', 'Türkiye', 'İstanbul', 'Kadıköy', 'Kadıköy', '0212000001', '');
INSERT INTO `cari_adres` VALUES ('4', '2', '11', 'türkiye', 'elazığ', 'palu', 'palu', '042400000', '');

-- ----------------------------
-- Table structure for cari_adres_tip
-- ----------------------------
DROP TABLE IF EXISTS `cari_adres_tip`;
CREATE TABLE `cari_adres_tip` (
  `AdresTipID` int(11) NOT NULL AUTO_INCREMENT,
  `AdresTip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdresTipID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cari_adres_tip
-- ----------------------------
INSERT INTO `cari_adres_tip` VALUES ('1', 'İş Adresi');
INSERT INTO `cari_adres_tip` VALUES ('2', 'Ev Adresi');
INSERT INTO `cari_adres_tip` VALUES ('3', 'Fax Numarası');
INSERT INTO `cari_adres_tip` VALUES ('4', 'İş Yeri Telefon  No');

-- ----------------------------
-- Table structure for cari_tip
-- ----------------------------
DROP TABLE IF EXISTS `cari_tip`;
CREATE TABLE `cari_tip` (
  `TipID` int(11) NOT NULL AUTO_INCREMENT,
  `Tip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TipID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cari_tip
-- ----------------------------
INSERT INTO `cari_tip` VALUES ('1', 'Zeytin Üretici');
INSERT INTO `cari_tip` VALUES ('9', 'Diğer');
INSERT INTO `cari_tip` VALUES ('10', 'Teknoloji Üretici');
INSERT INTO `cari_tip` VALUES ('11', 'Müşteri');
INSERT INTO `cari_tip` VALUES ('12', 'Sebze ve Meyve Alıcıları');
INSERT INTO `cari_tip` VALUES ('13', 'Market');

-- ----------------------------
-- Table structure for kalibre
-- ----------------------------
DROP TABLE IF EXISTS `kalibre`;
CREATE TABLE `kalibre` (
  `SatinAlmaUrunID` int(11) NOT NULL,
  `SatinAlmaTipID` int(11) NOT NULL,
  `Miktar` int(11) DEFAULT NULL,
  PRIMARY KEY (`SatinAlmaUrunID`,`SatinAlmaTipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kalibre
-- ----------------------------
INSERT INTO `kalibre` VALUES ('1', '10', '400');
INSERT INTO `kalibre` VALUES ('1', '11', '200');
INSERT INTO `kalibre` VALUES ('1', '12', '100');
INSERT INTO `kalibre` VALUES ('1', '13', '50');
INSERT INTO `kalibre` VALUES ('1', '14', '80');
INSERT INTO `kalibre` VALUES ('1', '15', '90');
INSERT INTO `kalibre` VALUES ('1', '16', '400');
INSERT INTO `kalibre` VALUES ('1', '17', '3');
INSERT INTO `kalibre` VALUES ('1', '18', '30');
INSERT INTO `kalibre` VALUES ('2', '9', '4');
INSERT INTO `kalibre` VALUES ('2', '10', '3');
INSERT INTO `kalibre` VALUES ('2', '11', '2');
INSERT INTO `kalibre` VALUES ('2', '12', '1');
INSERT INTO `kalibre` VALUES ('2', '13', '10');
INSERT INTO `kalibre` VALUES ('2', '14', '20');
INSERT INTO `kalibre` VALUES ('2', '15', '30');
INSERT INTO `kalibre` VALUES ('2', '16', '40');
INSERT INTO `kalibre` VALUES ('2', '17', '15');
INSERT INTO `kalibre` VALUES ('2', '18', '20');
INSERT INTO `kalibre` VALUES ('3', '9', '5');
INSERT INTO `kalibre` VALUES ('3', '10', '6');
INSERT INTO `kalibre` VALUES ('3', '11', '7');
INSERT INTO `kalibre` VALUES ('3', '12', '8');
INSERT INTO `kalibre` VALUES ('3', '13', '9');
INSERT INTO `kalibre` VALUES ('3', '14', '10');
INSERT INTO `kalibre` VALUES ('3', '15', '4');
INSERT INTO `kalibre` VALUES ('3', '16', '3');
INSERT INTO `kalibre` VALUES ('3', '17', '2');
INSERT INTO `kalibre` VALUES ('3', '18', '1');
INSERT INTO `kalibre` VALUES ('4', '10', '22');
INSERT INTO `kalibre` VALUES ('4', '11', '10');
INSERT INTO `kalibre` VALUES ('4', '12', '10');
INSERT INTO `kalibre` VALUES ('4', '13', '350');
INSERT INTO `kalibre` VALUES ('4', '14', '19');
INSERT INTO `kalibre` VALUES ('4', '15', '21');
INSERT INTO `kalibre` VALUES ('4', '16', '17');
INSERT INTO `kalibre` VALUES ('4', '17', '10');
INSERT INTO `kalibre` VALUES ('4', '18', '19');

-- ----------------------------
-- Table structure for kalibre_tip
-- ----------------------------
DROP TABLE IF EXISTS `kalibre_tip`;
CREATE TABLE `kalibre_tip` (
  `KalibreTipID` int(11) NOT NULL AUTO_INCREMENT,
  `Kalibre` varchar(255) DEFAULT NULL,
  `KalibreTur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`KalibreTipID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kalibre_tip
-- ----------------------------
INSERT INTO `kalibre_tip` VALUES ('1', 'Duble', 'Cari');
INSERT INTO `kalibre_tip` VALUES ('2', '1.Derece', 'Cari');
INSERT INTO `kalibre_tip` VALUES ('3', '2.derece', 'Cari');
INSERT INTO `kalibre_tip` VALUES ('4', '3.Derece', 'Cari');
INSERT INTO `kalibre_tip` VALUES ('5', '5.Derece', 'Cari');
INSERT INTO `kalibre_tip` VALUES ('6', '6.Derece', 'Cari');
INSERT INTO `kalibre_tip` VALUES ('7', '7.Derece', 'Cari');
INSERT INTO `kalibre_tip` VALUES ('8', '8.Derece', 'Cari');
INSERT INTO `kalibre_tip` VALUES ('9', 'Duble', 'Sistem');
INSERT INTO `kalibre_tip` VALUES ('10', '90-100', 'Sistem');
INSERT INTO `kalibre_tip` VALUES ('11', '110-120', 'Sistem');
INSERT INTO `kalibre_tip` VALUES ('12', '103-150', 'Sistem');
INSERT INTO `kalibre_tip` VALUES ('13', '160-180', 'Sistem');
INSERT INTO `kalibre_tip` VALUES ('14', '190-200', 'Sistem');
INSERT INTO `kalibre_tip` VALUES ('15', '221-250', 'Sistem');
INSERT INTO `kalibre_tip` VALUES ('16', '260-280', 'Sistem');
INSERT INTO `kalibre_tip` VALUES ('17', '280-285', 'Sistem');
INSERT INTO `kalibre_tip` VALUES ('18', '280-285', 'Sistem');

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `KategoriID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` int(50) DEFAULT NULL,
  `Kategori` varchar(50) NOT NULL,
  `KategoriResim` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`KategoriID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES ('1', null, 'Bakliyatlar', 'bakliyat.jpg');
INSERT INTO `kategori` VALUES ('2', '1', 'Tahıl Ürünleri', '02-tahilUrunleri.jpg');
INSERT INTO `kategori` VALUES ('3', '1', 'Kurufasulye', '02.jpg');
INSERT INTO `kategori` VALUES ('5', '1', 'Tahıl', 'bakliyat.jpg');
INSERT INTO `kategori` VALUES ('6', '6', 'Sebzeler', 'sebze.jpg');
INSERT INTO `kategori` VALUES ('7', '7', 'Meyveler', 'meyveler.jpg');
INSERT INTO `kategori` VALUES ('8', '8', 'Teknoloji', 'teknoloji.jpg');
INSERT INTO `kategori` VALUES ('9', '0', 'test', '');

-- ----------------------------
-- Table structure for modul
-- ----------------------------
DROP TABLE IF EXISTS `modul`;
CREATE TABLE `modul` (
  `ModulID` int(11) NOT NULL AUTO_INCREMENT,
  `ModulAdi` varchar(100) DEFAULT NULL,
  `ModulDizin` varchar(100) DEFAULT NULL,
  `ModulResim` varchar(150) DEFAULT NULL,
  `ModulSeviye` tinyint(4) DEFAULT NULL,
  `ModulSira` tinyint(4) DEFAULT NULL,
  `ModulAktif` tinyint(4) DEFAULT NULL,
  `ModulEklemeTarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ModulID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modul
-- ----------------------------
INSERT INTO `modul` VALUES ('1', 'Yönetim Giriş', null, null, '6', '2', '1', '2015-12-21 07:38:07');
INSERT INTO `modul` VALUES ('6', 'Üyelik Modülü', 'uye', 'uye-liste.png', '4', '4', '1', '2015-12-10 03:11:02');
INSERT INTO `modul` VALUES ('7', 'Üye Seviye', 'uye-seviye', 'uye-seviye.png', '4', '4', '1', '2015-12-14 23:35:16');
INSERT INTO `modul` VALUES ('8', 'Ürün Kategori', 'urun-kategori', 'urun-kategori.png', '4', '7', '1', '2015-12-14 23:36:53');
INSERT INTO `modul` VALUES ('9', 'Ürün Modülü', 'urun', 'urun.png', '4', '3', '1', '2015-12-14 23:37:17');
INSERT INTO `modul` VALUES ('10', 'Üye Giriş', 'uye-giris', 'uye-giris.png', '4', '5', '1', '2015-12-14 23:37:57');
INSERT INTO `modul` VALUES ('11', 'Modül Yönetim', '_modul', 'uye-seviye.png', '4', '6', '1', '2015-12-14 23:38:54');
INSERT INTO `modul` VALUES ('12', 'Cari Tip', 'cari-tip', 'cari-tip.png', '4', '2', '1', '2015-12-20 03:22:16');
INSERT INTO `modul` VALUES ('13', 'Cari ', 'cari', 'cari.png', '4', '2', '1', '2015-12-21 02:21:07');
INSERT INTO `modul` VALUES ('14', 'Cari Adres Tipler', 'cari-adres-tip', 'cari-adresi-tip.png', '4', '2', '1', '2015-12-21 03:47:19');
INSERT INTO `modul` VALUES ('15', 'Cari Adresleri', 'cari-adres', 'stok-cari-adres.png', '4', '2', '1', '2015-12-21 04:54:04');
INSERT INTO `modul` VALUES ('17', 'Modül Üye İlişkisi', '_modul_uye', null, '4', '2', '1', '2015-12-21 07:00:54');
INSERT INTO `modul` VALUES ('18', 'Kalibre Tip', 'kalibre-tip', 'kalibre.png', '4', '2', '1', '2015-12-23 03:58:37');
INSERT INTO `modul` VALUES ('19', 'Satın Alma', 'satin-alma', 'satinalma.png', '4', '16', '1', '2015-12-24 01:04:16');
INSERT INTO `modul` VALUES ('20', 'Satın Alma Kalibre Urun', 'satin-alma-kalibre-urun', 'payment-icon.png', '4', '2', '1', '2015-12-24 01:16:11');

-- ----------------------------
-- Table structure for modul_uye
-- ----------------------------
DROP TABLE IF EXISTS `modul_uye`;
CREATE TABLE `modul_uye` (
  `ModulID` int(11) NOT NULL,
  `UyeID` int(11) NOT NULL,
  `Ekle` tinyint(4) DEFAULT '1',
  `Duzenle` tinyint(4) DEFAULT '1',
  `Sil` tinyint(4) DEFAULT '1',
  `Listele` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`ModulID`,`UyeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modul_uye
-- ----------------------------
INSERT INTO `modul_uye` VALUES ('1', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('1', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('1', '8', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('1', '9', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('1', '14', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('1', '16', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('1', '17', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('6', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('6', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('7', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('7', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('7', '8', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('8', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('8', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('8', '8', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('9', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('9', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('9', '8', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('10', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('10', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('10', '8', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('10', '10', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('11', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('11', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('11', '10', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('11', '16', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('12', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('12', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('12', '8', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('12', '10', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('13', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('13', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('13', '8', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('13', '16', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('13', '17', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('14', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('14', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('15', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('15', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('15', '10', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('17', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('17', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('18', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('18', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('18', '17', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('19', '1', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('19', '7', '1', '1', '1', '1');
INSERT INTO `modul_uye` VALUES ('20', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for satin_alma
-- ----------------------------
DROP TABLE IF EXISTS `satin_alma`;
CREATE TABLE `satin_alma` (
  `SatinAlmaID` int(11) NOT NULL AUTO_INCREMENT,
  `SatinAlma` varchar(255) DEFAULT NULL,
  `SatinAlmaAciklama` text,
  `SatinAlmaTipID` int(11) DEFAULT NULL,
  `CariID` int(11) DEFAULT NULL,
  `Tarih` date DEFAULT NULL,
  PRIMARY KEY (`SatinAlmaID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of satin_alma
-- ----------------------------
INSERT INTO `satin_alma` VALUES ('1', '500gr duble zeytin', 'test', '1', '13', '2015-12-17');

-- ----------------------------
-- Table structure for satin_alma_kalibre_urun
-- ----------------------------
DROP TABLE IF EXISTS `satin_alma_kalibre_urun`;
CREATE TABLE `satin_alma_kalibre_urun` (
  `SatinAlmaUrunID` int(11) NOT NULL AUTO_INCREMENT,
  `KalibreTipID` int(11) DEFAULT NULL,
  `SatinAlmaID` int(11) DEFAULT NULL,
  `Miktar` int(11) DEFAULT NULL,
  `Fiyat` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`SatinAlmaUrunID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of satin_alma_kalibre_urun
-- ----------------------------
INSERT INTO `satin_alma_kalibre_urun` VALUES ('1', '1', '2', '5000', '1.00');
INSERT INTO `satin_alma_kalibre_urun` VALUES ('2', '2', '2', '4000', '1.50');
INSERT INTO `satin_alma_kalibre_urun` VALUES ('3', '3', '2', '300', '1.30');

-- ----------------------------
-- Table structure for satin_alma_tip
-- ----------------------------
DROP TABLE IF EXISTS `satin_alma_tip`;
CREATE TABLE `satin_alma_tip` (
  `SatinAlmaTipID` int(11) NOT NULL AUTO_INCREMENT,
  `SatinAlmaTip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SatinAlmaTipID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of satin_alma_tip
-- ----------------------------
INSERT INTO `satin_alma_tip` VALUES ('1', 'Zeytin');
INSERT INTO `satin_alma_tip` VALUES ('2', 'Diğer');
INSERT INTO `satin_alma_tip` VALUES ('3', 'Sebze');
INSERT INTO `satin_alma_tip` VALUES ('4', 'Meyve');
INSERT INTO `satin_alma_tip` VALUES ('5', 'Teknoloji');

-- ----------------------------
-- Table structure for urun
-- ----------------------------
DROP TABLE IF EXISTS `urun`;
CREATE TABLE `urun` (
  `UrunID` int(11) NOT NULL,
  `KategoriID` int(11) DEFAULT NULL,
  `StokKodu` varchar(100) DEFAULT NULL,
  `UrunAdi` varchar(150) DEFAULT NULL,
  `TurID` tinyint(4) DEFAULT NULL,
  `GosterimTurID` tinyint(4) DEFAULT NULL,
  `UrunResim` varchar(150) DEFAULT NULL,
  `Goruntulenme` int(11) DEFAULT NULL,
  `UyeID` int(11) DEFAULT NULL,
  `UyeIP` varchar(15) DEFAULT NULL,
  `EklemeTarih` datetime DEFAULT NULL,
  `GuncellemeTarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UrunID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of urun
-- ----------------------------
INSERT INTO `urun` VALUES ('0', '8', '201119', 'Bilgisayar', '1', '1', 'en-iyi-ekran-kartlı-laptop1.jpg', null, '1', '::1', '2015-12-23 00:54:55', '2015-12-23 01:54:55');
INSERT INTO `urun` VALUES ('1', '6', '201015', 'Biber', '1', '1', 'biber.jpg', '1', '1', '::1', '2015-12-23 00:44:45', '2015-12-23 01:46:26');
INSERT INTO `urun` VALUES ('2', '6', '201012', 'Domates', '1', '1', 'domates.jpg', '1', '1', '::1', '2015-12-23 00:41:14', '2015-12-23 01:46:18');
INSERT INTO `urun` VALUES ('3', '3', '201010', 'Fasulye', '1', '1', 'bakliyat.jpg', '1', '1', '::1', '2015-12-22 22:04:16', '2015-12-23 01:46:16');
INSERT INTO `urun` VALUES ('4', '1', '30030', 'Tahıl Ürünleri', '1', '1', '02-tahilUrunleri.jpg', '1', '1', '::1', '2015-12-18 01:14:33', '2015-12-23 01:46:15');
INSERT INTO `urun` VALUES ('5', '7', '201018', 'Elma', '1', '1', 'elma.jpg', '1', '1', '::1', '2015-12-23 00:47:06', '2015-12-23 01:48:42');
INSERT INTO `urun` VALUES ('6', '7', '200019', 'Üzüm', '1', '1', 'üzüm.jpg', '1', '1', '::1', '2015-12-23 01:49:10', '2015-12-23 01:49:16');
INSERT INTO `urun` VALUES ('7', '7', '201020', 'Kivi', '1', '1', 'kivi.jpg', null, '1', '::1', '2015-12-23 00:50:20', '2015-12-23 01:52:39');
INSERT INTO `urun` VALUES ('8', '8', '201022', 'Telefon', '1', '1', 'telefon.jpg', null, '1', '::1', '2015-12-23 00:53:16', '2015-12-23 01:54:27');

-- ----------------------------
-- Table structure for uye
-- ----------------------------
DROP TABLE IF EXISTS `uye`;
CREATE TABLE `uye` (
  `UyeID` int(11) NOT NULL AUTO_INCREMENT,
  `SeviyeID` tinyint(4) DEFAULT '5',
  `KullaniciAdi` varchar(14) DEFAULT NULL,
  `Eposta` varchar(150) DEFAULT NULL,
  `Parola` varchar(64) DEFAULT NULL,
  `Aktif` tinyint(4) DEFAULT '0',
  `KayitIP` varchar(15) DEFAULT NULL,
  `KayitTarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UyeID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uye
-- ----------------------------
INSERT INTO `uye` VALUES ('1', '1', 'GulsahAri', 'glaari52@gmail.com', '45fe534a0c760d37d3626efdc6c761f4', '1', '::1', '2015-12-27 20:38:06');
INSERT INTO `uye` VALUES ('7', '3', 'Editor', 'editor@hotmail.com', '45fe534a0c760d37d3626efdc6c761f4', '1', '::1', '2015-12-20 01:47:26');
INSERT INTO `uye` VALUES ('8', '2', 'baktat', 'baktat@hotmail.com', '45fe534a0c760d37d3626efdc6c761f4', '1', '::1', '2015-12-21 07:11:14');
INSERT INTO `uye` VALUES ('9', '2', 'yönetim', 'yönetim@hotmail.com', '45fe534a0c760d37d3626efdc6c761f4', '1', '::1', '2015-12-21 07:12:21');
INSERT INTO `uye` VALUES ('10', '4', 'satici', 'satici@hotmail.com', '45fe534a0c760d37d3626efdc6c761f4', '1', '::1', '2015-12-21 07:12:41');
INSERT INTO `uye` VALUES ('13', '4', 'saticikisi', 'satici2@hotmail.com', '45fe534a0c760d37d3626efdc6c761f4', '1', '::1', '2015-12-21 07:13:07');

-- ----------------------------
-- Table structure for uye_giris
-- ----------------------------
DROP TABLE IF EXISTS `uye_giris`;
CREATE TABLE `uye_giris` (
  `GirisID` int(11) NOT NULL AUTO_INCREMENT,
  `UyeID` int(11) DEFAULT NULL,
  `GirisIP` varchar(15) DEFAULT NULL,
  `GirisTarih` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`GirisID`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uye_giris
-- ----------------------------
INSERT INTO `uye_giris` VALUES ('1', '1', '::1', '2015-12-10 02:56:12');
INSERT INTO `uye_giris` VALUES ('2', '1', '::1', '2015-12-10 03:05:35');
INSERT INTO `uye_giris` VALUES ('3', '1', '::1', '2015-12-10 03:29:55');
INSERT INTO `uye_giris` VALUES ('4', '2', '::1', '2015-12-10 03:30:03');
INSERT INTO `uye_giris` VALUES ('5', '1', '::1', '2015-12-10 03:55:55');
INSERT INTO `uye_giris` VALUES ('6', '1', '::1', '2015-12-14 23:20:27');
INSERT INTO `uye_giris` VALUES ('7', '1', '::1', '2015-12-14 23:43:30');
INSERT INTO `uye_giris` VALUES ('8', '1', '::1', '2015-12-15 00:06:07');
INSERT INTO `uye_giris` VALUES ('9', '1', '::1', '2015-12-15 01:54:02');
INSERT INTO `uye_giris` VALUES ('10', '1', '::1', '2015-12-15 02:04:49');
INSERT INTO `uye_giris` VALUES ('11', '2', '::1', '2015-12-15 02:06:58');
INSERT INTO `uye_giris` VALUES ('12', '1', '::1', '2015-12-15 03:17:19');
INSERT INTO `uye_giris` VALUES ('13', '1', '::1', '2015-12-15 03:29:50');
INSERT INTO `uye_giris` VALUES ('14', '1', '::1', '2015-12-15 03:56:01');
INSERT INTO `uye_giris` VALUES ('15', '2', '::1', '2015-12-15 03:56:15');
INSERT INTO `uye_giris` VALUES ('16', '7', '::1', '2015-12-15 03:56:38');
INSERT INTO `uye_giris` VALUES ('17', '1', '::1', '2015-12-15 04:26:42');
INSERT INTO `uye_giris` VALUES ('18', '1', '::1', '2015-12-15 04:27:26');
INSERT INTO `uye_giris` VALUES ('19', '1', '::1', '2015-12-15 04:39:55');
INSERT INTO `uye_giris` VALUES ('20', '1', '::1', '2015-12-17 00:52:18');
INSERT INTO `uye_giris` VALUES ('21', '2', '::1', '2015-12-17 00:54:17');
INSERT INTO `uye_giris` VALUES ('22', '1', '::1', '2015-12-17 01:18:09');
INSERT INTO `uye_giris` VALUES ('23', '2', '::1', '2015-12-17 01:18:35');
INSERT INTO `uye_giris` VALUES ('24', '1', '::1', '2015-12-17 01:53:37');
INSERT INTO `uye_giris` VALUES ('25', '1', '::1', '2015-12-17 02:14:02');
INSERT INTO `uye_giris` VALUES ('26', '1', '::1', '2015-12-17 04:15:34');
INSERT INTO `uye_giris` VALUES ('27', '1', '::1', '2015-12-17 17:22:20');
INSERT INTO `uye_giris` VALUES ('28', '1', '::1', '2015-12-18 03:24:42');
INSERT INTO `uye_giris` VALUES ('29', '1', '::1', '2015-12-19 02:40:36');
INSERT INTO `uye_giris` VALUES ('30', '1', '::1', '2015-12-19 02:51:21');
INSERT INTO `uye_giris` VALUES ('31', '1', '::1', '2015-12-19 23:31:41');
INSERT INTO `uye_giris` VALUES ('32', '1', '::1', '2015-12-19 23:32:13');
INSERT INTO `uye_giris` VALUES ('33', '2', '::1', '2015-12-19 23:32:52');
INSERT INTO `uye_giris` VALUES ('34', '1', '::1', '2015-12-19 23:35:05');
INSERT INTO `uye_giris` VALUES ('35', '1', '::1', '2015-12-20 01:38:59');
INSERT INTO `uye_giris` VALUES ('36', '1', '::1', '2015-12-20 02:21:17');
INSERT INTO `uye_giris` VALUES ('37', '1', '::1', '2015-12-20 02:21:26');
INSERT INTO `uye_giris` VALUES ('38', '1', '::1', '2015-12-20 02:22:24');
INSERT INTO `uye_giris` VALUES ('39', '1', '::1', '2015-12-20 02:25:56');
INSERT INTO `uye_giris` VALUES ('40', '1', '::1', '2015-12-20 02:33:21');
INSERT INTO `uye_giris` VALUES ('41', '1', '::1', '2015-12-20 02:42:55');
INSERT INTO `uye_giris` VALUES ('42', '1', '::1', '2015-12-20 02:44:54');
INSERT INTO `uye_giris` VALUES ('43', '1', '::1', '2015-12-20 04:06:53');
INSERT INTO `uye_giris` VALUES ('44', '1', '::1', '2015-12-20 04:16:47');
INSERT INTO `uye_giris` VALUES ('45', '1', '::1', '2015-12-20 04:25:25');
INSERT INTO `uye_giris` VALUES ('46', '1', '::1', '2015-12-21 01:02:10');
INSERT INTO `uye_giris` VALUES ('47', '1', '::1', '2015-12-21 01:04:44');
INSERT INTO `uye_giris` VALUES ('48', '1', '::1', '2015-12-21 01:11:25');
INSERT INTO `uye_giris` VALUES ('49', '2', '::1', '2015-12-21 01:11:40');
INSERT INTO `uye_giris` VALUES ('50', '1', '::1', '2015-12-21 01:16:46');
INSERT INTO `uye_giris` VALUES ('51', '1', '::1', '2015-12-21 01:17:07');
INSERT INTO `uye_giris` VALUES ('52', '1', '::1', '2015-12-21 01:58:37');
INSERT INTO `uye_giris` VALUES ('53', '1', '::1', '2015-12-21 02:23:16');
INSERT INTO `uye_giris` VALUES ('54', '1', '::1', '2015-12-21 04:44:04');
INSERT INTO `uye_giris` VALUES ('55', '2', '::1', '2015-12-21 04:57:25');
INSERT INTO `uye_giris` VALUES ('56', '1', '::1', '2015-12-21 04:57:33');
INSERT INTO `uye_giris` VALUES ('57', '1', '::1', '2015-12-21 05:04:17');
INSERT INTO `uye_giris` VALUES ('58', '1', '::1', '2015-12-21 05:07:37');
INSERT INTO `uye_giris` VALUES ('59', '1', '::1', '2015-12-21 05:35:40');
INSERT INTO `uye_giris` VALUES ('60', '1', '::1', '2015-12-21 06:00:27');
INSERT INTO `uye_giris` VALUES ('61', '1', '::1', '2015-12-21 06:37:04');
INSERT INTO `uye_giris` VALUES ('62', '1', '::1', '2015-12-21 06:37:25');
INSERT INTO `uye_giris` VALUES ('63', '1', '::1', '2015-12-21 07:09:14');
INSERT INTO `uye_giris` VALUES ('64', '1', '::1', '2015-12-21 08:04:17');
INSERT INTO `uye_giris` VALUES ('65', '1', '::1', '2015-12-21 08:04:45');
INSERT INTO `uye_giris` VALUES ('66', '1', '::1', '2015-12-21 08:06:00');
INSERT INTO `uye_giris` VALUES ('67', '1', '::1', '2015-12-21 08:14:10');
INSERT INTO `uye_giris` VALUES ('68', '1', '::1', '2015-12-21 08:18:34');
INSERT INTO `uye_giris` VALUES ('69', '1', '::1', '2015-12-21 08:31:43');
INSERT INTO `uye_giris` VALUES ('70', '1', '::1', '2015-12-21 09:39:47');
INSERT INTO `uye_giris` VALUES ('71', '1', '::1', '2015-12-22 16:47:18');
INSERT INTO `uye_giris` VALUES ('72', '1', '::1', '2015-12-22 17:30:16');
INSERT INTO `uye_giris` VALUES ('73', '1', '::1', '2015-12-22 19:40:15');
INSERT INTO `uye_giris` VALUES ('74', '1', '::1', '2015-12-22 19:41:30');
INSERT INTO `uye_giris` VALUES ('75', '1', '::1', '2015-12-22 19:43:47');
INSERT INTO `uye_giris` VALUES ('76', '1', '::1', '2015-12-22 22:47:20');
INSERT INTO `uye_giris` VALUES ('77', '1', '::1', '2015-12-23 01:16:45');
INSERT INTO `uye_giris` VALUES ('78', '1', '::1', '2015-12-23 01:17:20');
INSERT INTO `uye_giris` VALUES ('79', '1', '::1', '2015-12-23 02:12:10');
INSERT INTO `uye_giris` VALUES ('80', '1', '::1', '2015-12-23 02:15:00');
INSERT INTO `uye_giris` VALUES ('81', '1', '::1', '2015-12-23 02:43:15');
INSERT INTO `uye_giris` VALUES ('82', '1', '::1', '2015-12-23 03:25:03');
INSERT INTO `uye_giris` VALUES ('83', '1', '::1', '2015-12-23 03:26:19');
INSERT INTO `uye_giris` VALUES ('84', '1', '::1', '2015-12-23 03:26:46');
INSERT INTO `uye_giris` VALUES ('85', '1', '::1', '2015-12-23 10:47:47');
INSERT INTO `uye_giris` VALUES ('86', '1', '::1', '2015-12-24 00:29:43');
INSERT INTO `uye_giris` VALUES ('87', '1', '::1', '2015-12-24 01:21:09');
INSERT INTO `uye_giris` VALUES ('88', '1', '::1', '2015-12-24 13:34:53');
INSERT INTO `uye_giris` VALUES ('89', '1', '::1', '2015-12-24 15:54:49');
INSERT INTO `uye_giris` VALUES ('90', '1', '::1', '2015-12-25 11:09:41');
INSERT INTO `uye_giris` VALUES ('91', '1', '::1', '2015-12-25 22:33:05');
INSERT INTO `uye_giris` VALUES ('92', '1', '::1', '2015-12-27 19:18:42');
INSERT INTO `uye_giris` VALUES ('93', '1', '::1', '2015-12-27 19:19:04');
INSERT INTO `uye_giris` VALUES ('94', '1', '::1', '2015-12-27 20:40:24');

-- ----------------------------
-- Table structure for uye_seviye
-- ----------------------------
DROP TABLE IF EXISTS `uye_seviye`;
CREATE TABLE `uye_seviye` (
  `SeviyeID` int(11) NOT NULL AUTO_INCREMENT,
  `Seviye` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`SeviyeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uye_seviye
-- ----------------------------
INSERT INTO `uye_seviye` VALUES ('1', 'Master');
INSERT INTO `uye_seviye` VALUES ('2', 'Yönetici');
INSERT INTO `uye_seviye` VALUES ('3', 'Editör');
INSERT INTO `uye_seviye` VALUES ('4', 'Satış');
INSERT INTO `uye_seviye` VALUES ('5', 'Standart');
INSERT INTO `uye_seviye` VALUES ('6', 'Market');
