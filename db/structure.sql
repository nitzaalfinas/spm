-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: aipd_spm_development
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bidangs`
--

DROP TABLE IF EXISTS `bidangs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bidangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_bidang` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `indikators`
--

DROP TABLE IF EXISTS `indikators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indikators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidang_id` int(11) DEFAULT NULL,
  `jenis_pelayanan_id` int(11) DEFAULT NULL,
  `nama_indikator` varchar(255) DEFAULT NULL,
  `nilai_default` int(11) DEFAULT NULL,
  `batas_waktu_default` int(4) DEFAULT NULL,
  `penanggungjawab` varchar(1000) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jenis_pelayanans`
--

DROP TABLE IF EXISTS `jenis_pelayanans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_pelayanans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidang_id` int(11) DEFAULT NULL,
  `jenis_pelayanan_nama` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kabkots`
--

DROP TABLE IF EXISTS `kabkots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kabkots` (
  `id` int(11) NOT NULL,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabkot_nama` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ni_kbs`
--

DROP TABLE IF EXISTS `ni_kbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ni_kbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabkot_id` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `k1_1` int(11) DEFAULT NULL COMMENT 'Jumlah PUS yg istrinya berusia, 20 th',
  `k1_2` int(11) DEFAULT NULL COMMENT 'Jumlah PUS yg istrinya berusia, 15 - 49 th',
  `k1_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k2_1` int(11) DEFAULT NULL COMMENT 'Jumlah peserta KB aktif',
  `k2_2` int(11) DEFAULT NULL COMMENT 'Jumlah PUS',
  `k2_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k3_1` int(11) DEFAULT NULL COMMENT 'Jumlah PUS tak ber KB',
  `k3_2` int(11) DEFAULT NULL COMMENT 'Jumlah PUS 15 - 49 tahun',
  `k3_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k4_1` int(11) DEFAULT NULL COMMENT 'Jumlah Anggota BKB  ber KB',
  `k4_2` int(11) DEFAULT NULL COMMENT 'Jumlah PUS anggota BKB',
  `k4_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k5_1` int(11) DEFAULT NULL COMMENT 'Jumlah anggota UPPKS ber KB',
  `k5_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh anggota UPPKS yang PUS',
  `k5_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k6_1` int(11) DEFAULT NULL COMMENT 'Jumlah desa/kelurahan',
  `k6_2` int(11) DEFAULT NULL COMMENT 'PLKB/PKB',
  `k6_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k7_1` int(11) DEFAULT NULL COMMENT 'Jumlah Desa /Kelurahan',
  `k7_2` int(11) DEFAULT NULL COMMENT 'Jumlah PPKBD Keterangan',
  `k7_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k8_1` int(11) DEFAULT NULL COMMENT 'Kebutuhan alat dan obat',
  `k8_2` int(11) DEFAULT NULL COMMENT 'Penyediaan oleh Pemerintah Pusat (BKKBN)',
  `k8_3` int(11) DEFAULT NULL COMMENT 'Pelayanan Swasta',
  `k8_4` int(11) DEFAULT NULL COMMENT 'Indeks Hasil Perhitungan (Beban Pemda)',
  `k8_5` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k9_1` int(11) DEFAULT NULL COMMENT 'Rekap data mikro keluarga desa/kelurahan',
  `k9_2` int(11) DEFAULT NULL COMMENT 'Jumlah desa/kelurahan',
  `k9_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ni_kesehatans`
--

DROP TABLE IF EXISTS `ni_kesehatans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ni_kesehatans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabkot_id` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `kk_pria` int(11) DEFAULT NULL COMMENT 'Penduduk Pria',
  `kk_wanita` int(11) DEFAULT NULL COMMENT 'Penduduk Wanita',
  `k1_1` int(11) DEFAULT NULL COMMENT 'Jml Ibu Hamil yang memperoleh pelayanan antenatal k4 (orang)',
  `k1_2` int(11) DEFAULT NULL COMMENT 'Jml sasaran ibu hamil di satu wilayah kerja dalam kurun waktu yang sama (orang)',
  `k1_2k` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k1_3` int(11) DEFAULT NULL COMMENT 'CBR',
  `k1_4` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k2_1` int(11) DEFAULT NULL COMMENT 'Jml Ibu dg komplikasi kebidangan yang mendapat penanganan definitif disatu wilayah kerja pada kurun waktu tertentu (orang)',
  `k2_2` int(11) DEFAULT NULL COMMENT 'Jml ibu dg komplikasi kebidangan di satu wilayah kerja pd kurun waktu yang sama (orang)',
  `k2_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k3_1` int(11) DEFAULT NULL COMMENT 'Jumlah ibu bersalin yang ditolong oleh tenaga kesehatan di satu wilayah kerja pada kurun waktu tertentu (orang)',
  `k3_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh sasaran ibu bersalin di satu wilayah kerja dalam kurun waktu yang sama (orang)',
  `k3_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k4_1` int(11) DEFAULT NULL COMMENT 'Jumlah ibu nifas yang telah memperoleh 3 kali pelayanan nifas sesuai standar di satu wilayah kerja pada kurun waktu tertentu',
  `k4_2` int(11) DEFAULT NULL COMMENT 'Seluruh ibu nifas di satu wilayah kerja dalam kurun waktu yang sama (orang)',
  `k4_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k5_1` int(11) DEFAULT NULL COMMENT 'Jumlah neonatus dengan komplikasi yang tertangani (kasus/jiwa)',
  `k5_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh neonatus dengan komplikasi yang ada (kasus/jiwa)',
  `k5_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k5_4` int(11) DEFAULT NULL COMMENT 'Bayi baru lahir (jiwa)',
  `k5_5` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k6_1` int(11) DEFAULT NULL COMMENT 'Jumlah bayi memperoleh pelayanan kesehatan sesuai standar disatu wilayah kerja pada kurun waktu tertentu (jiwa)',
  `k6_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh bayi lahir hidup disatu wilayah kerja dalam waktu yang sama (jiwa)',
  `k6_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k7_1` int(11) DEFAULT NULL COMMENT 'Julah desa/kelurahan UCI (desa/kelurahan)',
  `k7_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh desa/kelurahan (desa/kelurahan)',
  `k7_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k8_1` int(11) DEFAULT NULL COMMENT 'Jumlah anak balita yang memperoleh pelayanan pemantauan pertumbuhan minimal 8 kali (anak)',
  `k8_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh anak balita (anak)',
  `k8_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k9_1` int(11) DEFAULT NULL COMMENT 'Jumlah anak usia 6 - 24 bulan keluarga miskin yang mendapat makanan pendamping - ASI',
  `k9_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh anak usia 6 - 24 bulan keluarga miskin (anak)',
  `k9_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k10_1` int(11) DEFAULT NULL COMMENT 'Jumlah balita gizi buruk mendapat perawatan di sarana pelayanan kesehatan',
  `k10_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh balita gizi buruk yang ditemukan (anak)',
  `k10_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k11_1` int(11) DEFAULT NULL COMMENT 'jumlah murud sd dan setingkat yang diperiksa kesehatannya oleh tenaga kesehatan atau tenaga terlatih (anak)',
  `k11_2` int(11) DEFAULT NULL COMMENT 'jumlah murid SD dan setingkat (anak)',
  `k11_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k12_1` int(11) DEFAULT NULL COMMENT 'Jumlah PUS yang menggunakan kontrasepsi (pasangan)',
  `k12_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh PUS (pasangan)',
  `k12_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k13_1` int(11) DEFAULT NULL COMMENT 'Jumlah kasus AFP non polio yang dilaporkan (kasus/orang)',
  `k13_2` int(11) DEFAULT NULL COMMENT 'Jumlah penduduk < 15 tahun (orang)',
  `k13_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k14_1` int(11) DEFAULT NULL COMMENT 'Jumlah penderita pneumonia balita yang ditangani (anak)',
  `k14_2` int(11) DEFAULT NULL COMMENT 'Jumlah perkiraan penderita pneumonia balita (anak)',
  `k14_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k15_1` int(11) DEFAULT NULL COMMENT 'Jumlah pasien baru TB BTA positif yang ditemukan dan diobati (orang)',
  `k15_2` int(11) DEFAULT NULL COMMENT 'Jumlah perkiraan pasien baru TB BTA positif (orang)',
  `k15_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k16_1` int(11) DEFAULT NULL COMMENT 'Jumlah penderita DBD yang ditangani sesuai SOP (orang)',
  `k16_2` int(11) DEFAULT NULL COMMENT 'Jumlah penderita DBD yang ditemukan (orang)',
  `k16_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k17_1` int(11) DEFAULT NULL COMMENT 'Jumlah penderita diare yang datang dan dilayani di sarana kesehatan dan kader (orang)',
  `k17_2` int(11) DEFAULT NULL COMMENT 'Jumlah perkiraan penderita diare (orang)',
  `k17_3` varchar(1000) DEFAULT NULL,
  `k18_1` int(11) DEFAULT NULL COMMENT 'Jumlah kunjungan pasien masyarakat miskin di sarkes strata 1 (orang)',
  `k18_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh masyarakat miskin di kabupaten/kota (orang)',
  `k18_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k19_1` int(11) DEFAULT NULL COMMENT 'Jumlah pasien masyarakat miskin di sarkes strata 2 dan strata 3 (orang)',
  `k19_2` int(11) DEFAULT NULL COMMENT 'Jumlah seluruh masyarakat miskin di kabupaten/kota (orang)',
  `k19_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k20_1` int(11) DEFAULT NULL COMMENT 'Pelayanan gawat darurat level 1 (buah)',
  `k20_2` int(11) DEFAULT NULL COMMENT 'Jumlah rumah sakit kabupaten/kota (buah)',
  `k20_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k21_1` int(11) DEFAULT NULL COMMENT 'Jumlah KLB di desa/kelurahan yang ditangani < 24 jam (kasus)',
  `k21_2` int(11) DEFAULT NULL COMMENT 'Jumlah KLB di desa/kelurahan yang terjadi (kasus)',
  `k21_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k22_1` int(11) DEFAULT NULL COMMENT 'Jumlah desa siaga yang aktif (desa)',
  `k22_2` int(11) DEFAULT NULL COMMENT 'Jumlah desa siaga yang dibentuk (desa)',
  `k22_3` varchar(1000) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ni_lhs`
--

DROP TABLE IF EXISTS `ni_lhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ni_lhs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabkot_id` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `k1_1` int(11) DEFAULT NULL COMMENT 'Jml usaha dan/atau kegiatan yang telah mentaati persyaratan administratif dan teknis pencegahan pencemaraan air',
  `k1_2` int(11) DEFAULT NULL COMMENT 'Jml usaha dan/atau kegiatan yang diawasi',
  `k1_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k2_1` int(11) DEFAULT NULL COMMENT 'Jml usaha dan/atau kegiatan sumber tidak bergerak yg telah memenuhi persyaratan administratif dan teknis pengendalian pencemaran udara',
  `k2_2` int(11) DEFAULT NULL COMMENT 'Jml usaha dan/atau kegiatan sumber tidak bergerak yg potensial mencemari udara yg telah diinventarisasi',
  `k2_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k3_1` int(11) DEFAULT NULL COMMENT 'Luasan lahan yang telah ditetapkan dan diinformasikan status kerusakan lahan dan/atau tanah biomassa pada tahun berjalan',
  `k3_2` int(11) DEFAULT NULL COMMENT 'Luasan lahan yang diperuntukkan sebagai lahan dan/atau tanah untuk produksi biomassa',
  `k3_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k4_1` int(11) DEFAULT NULL COMMENT 'Jumlah pengaduan masyarakat akibat adanya dugaan pencemaran dan/atau perusakan lingkungan hidup yang ditindaklanjuti',
  `k4_2` int(11) DEFAULT NULL COMMENT 'Jumlah pengaduan yang diterima instansi lingkungan hidup kabupaten/kota dalam 1 tahun',
  `k4_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ni_pdns`
--

DROP TABLE IF EXISTS `ni_pdns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ni_pdns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabkot_id` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `k1_1` int(11) DEFAULT NULL COMMENT 'Jml KK yg diterbitkan',
  `k1_2` int(11) DEFAULT NULL COMMENT 'Jml kepala keluarga',
  `k1_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k2_1` int(11) DEFAULT NULL COMMENT 'Jml KTP elektronik yang diterbitkan',
  `k2_2` int(11) DEFAULT NULL COMMENT 'Jml penduduk wajib KTP elektronik',
  `k2_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k3_1` int(11) DEFAULT NULL COMMENT 'Jml kutipan akta kelahiran yg diterbitkan',
  `k3_2` int(11) DEFAULT NULL COMMENT 'Jml kelahiran yg terjadi',
  `k3_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k4_1` int(11) DEFAULT NULL COMMENT 'Jml kutipan akta kematian yg diterbitkan',
  `k4_2` int(11) DEFAULT NULL COMMENT 'Jml kematian yg terjadi',
  `k4_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k5_1` int(11) DEFAULT NULL COMMENT 'Jml pelanggaran perda dan/atau peraturan kepala daerah yg diselesaikan',
  `k5_2` int(11) DEFAULT NULL COMMENT 'Jml pelanggaran perda dan/atau peraturan kepala daerah yg dilaporkan dan/atau dipantau',
  `k5_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k6_1` int(11) DEFAULT NULL COMMENT 'Banyaknya kelompok patroli dikalikan 3 kali patroli dalam sehari',
  `k6_2` int(11) DEFAULT NULL COMMENT 'Banyaknya kelompok kecamatan (jumlah kecamatan)',
  `k6_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k7_1` int(11) DEFAULT NULL COMMENT 'Jumlah satuan Linmas',
  `k7_2` int(11) DEFAULT NULL COMMENT 'Jumlah RT',
  `k7_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k8_1` int(11) DEFAULT NULL COMMENT 'Jumlah luas WMK (Wilayah Manajemen Kebakaran)',
  `k8_2` int(11) DEFAULT NULL COMMENT 'Jumlah luas potensi kebakaran',
  `k8_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k9_1` int(11) DEFAULT NULL COMMENT 'Jumlah kasus WMK yg tertangani dalam tingkat waktu tanggap',
  `k9_2` int(11) DEFAULT NULL COMMENT 'Jumlah kasus kebakaran dalam jangkauan WMK',
  `k9_3` int(11) DEFAULT NULL COMMENT 'Jumlah total terjadi kebakaran',
  `k9_4` int(11) DEFAULT NULL COMMENT 'Jumlah kebakaran dalam WMK',
  `k9_5` int(11) DEFAULT NULL COMMENT 'Jumlah kebakaran diluar jangkauan WMK',
  `k9_6` int(11) DEFAULT NULL COMMENT 'Jumlah kebakaran dalam waktu tanggap',
  `k9_7` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k10_1` int(11) DEFAULT NULL COMMENT 'Jml satgas Damkar memiliki sertifikasi sesuai standar kualifikasi',
  `k10_2` int(11) DEFAULT NULL COMMENT 'Jml satgas Damkar',
  `k10_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k11_1` int(11) DEFAULT NULL COMMENT 'Jml WMK memiliki mobil dan/atau mesin Damkar yg laik pakai',
  `k11_2` int(11) DEFAULT NULL COMMENT 'Jml WMK atau lingkungan dan/atau kawasan berpotensi kebakaran',
  `k11_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ni_peras`
--

DROP TABLE IF EXISTS `ni_peras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ni_peras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinsi_id` int(2) DEFAULT NULL,
  `kabkot_id` int(4) DEFAULT NULL,
  `tahun` int(4) DEFAULT NULL,
  `k1_1` int(11) DEFAULT NULL COMMENT 'Jumlah rumah layak huni',
  `k1_2` int(11) DEFAULT NULL COMMENT 'Jumlah rumah',
  `k1_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k2_1` int(11) DEFAULT NULL COMMENT 'Jumlah RT MBR yg menempati rumah layak huni yg terjangkau',
  `k2_2` int(11) DEFAULT NULL COMMENT 'Jumlah RT MBR',
  `k2_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k3_1` int(11) DEFAULT NULL COMMENT 'Jumlah lingkungan yg didukung PSU',
  `k3_2` int(11) DEFAULT NULL COMMENT 'Jumlah lingkungan perumahan',
  `k3_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ni_sos`
--

DROP TABLE IF EXISTS `ni_sos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ni_sos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabkot_id` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `k1_1` int(11) DEFAULT NULL COMMENT 'Jml PMKS dalam 1 tahun yg seharusnya memperoleh bantuan sosial (orang)',
  `k1_2` int(11) DEFAULT NULL COMMENT 'Jml PMKS yg memperoleh bantuan sosial dalam 1 tahun (orang)',
  `k1_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k2_1` int(11) DEFAULT NULL COMMENT 'Jml PMKS dalam 1 tahun yg seharusnya menjadi peserta program pemberdayaan masyarakat melalui KUBE atau kelompok sosial ekonomi sejenis (orang)',
  `k2_2` int(11) DEFAULT NULL COMMENT 'Jml PMKS dalam 1 tahun yg menjadi peserta program pemberdayaan masyarakat melalui KUBE atau kelompok sosial ekonomi sejenis (orang)',
  `k2_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k3_1` int(11) DEFAULT NULL COMMENT 'Jml panti sosial skala kab/kota dlm 1 tahun yg seharusnya menyediakan sarana prasarana pelayanan kesejahteraan sosial (unit)',
  `k3_2` int(11) DEFAULT NULL COMMENT 'Jml panti sosial skala kab/kota dlm 1 tahun yg menyediakan sarana prasarana pelayanan kesejahteraan sosial (unit)',
  `k3_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k4_1` int(11) DEFAULT NULL COMMENT 'Jml WKSBM dlm 1 thn yang seharusnya menyediakan sarana prasarana pelayanan kesejahteraan sosial (unit)',
  `k4_2` int(11) DEFAULT NULL COMMENT 'Jml WKSBM dlm 1 thn yang menyediakan sarana prasarana pelayanan kesejahteraan sosial (unit)',
  `k4_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k5_1` int(11) DEFAULT NULL COMMENT 'Jml korban bencana dalam 1 tahun yang seharusnya menerima bantuan sosial selama masa tanggap darurat (KK)',
  `k5_2` int(11) DEFAULT NULL COMMENT 'Jml korban bencana dalam 1 tahun yang menerima bantuan sosial selama masa tanggap darurat (KK)',
  `k5_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k6_1` int(11) DEFAULT NULL COMMENT 'Jml korban bencana yg seharusnya dievakuasi dengan menggunakan sarana prasarana tanggap darurat lengkap dalam 1 tahun (orang)',
  `k6_2` int(11) DEFAULT NULL COMMENT 'Jml korban bencana yg dievakuasi dengan menggunakan sarana prasarana tanggap darurat lengkap dalam 1 tahun (orang)',
  `k6_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `k7_1` int(11) DEFAULT NULL COMMENT 'Jml penyandang cacat fisik dan mental serta lanjut usia tidak potensial yg seharusnya menerima jaminan sosial dalam 1 tahun (orang)',
  `k7_2` int(11) DEFAULT NULL COMMENT 'Jml penyandang cacat fisik dan mental serta lanjut usia tidak potensial yg menerima jaminan sosial dalam 1 tahun (orang)',
  `k7_3` varchar(1000) DEFAULT NULL COMMENT 'Keterangan',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nilai_indikators`
--

DROP TABLE IF EXISTS `nilai_indikators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nilai_indikators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indikator_id` int(11) DEFAULT NULL,
  `provinsi_id` int(11) DEFAULT NULL,
  `kabkot_id` int(11) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL,
  `batas_waktu` int(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provinsis`
--

DROP TABLE IF EXISTS `provinsis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provinsis` (
  `id` int(11) NOT NULL,
  `provinsi_nama` varchar(255) DEFAULT NULL,
  `jw` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_bidangs`
--

DROP TABLE IF EXISTS `sub_bidangs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_bidangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bidang_id` int(11) DEFAULT NULL,
  `nama_sub_bidang` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `level` varchar(30) DEFAULT NULL COMMENT 'adm_pusat, adm_prov, adm_kabkot',
  `provinsi_id` int(2) DEFAULT NULL,
  `kabkot_id` int(4) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `v_indikators`
--

DROP TABLE IF EXISTS `v_indikators`;
/*!50001 DROP VIEW IF EXISTS `v_indikators`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_indikators` (
  `id` tinyint NOT NULL,
  `bidang_id` tinyint NOT NULL,
  `nama_bidang` tinyint NOT NULL,
  `jenis_pelayanan_id` tinyint NOT NULL,
  `jenis_pelayanan_nama` tinyint NOT NULL,
  `nama_indikator` tinyint NOT NULL,
  `nilai_default` tinyint NOT NULL,
  `batas_waktu_default` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_jenis_pelayanans`
--

DROP TABLE IF EXISTS `v_jenis_pelayanans`;
/*!50001 DROP VIEW IF EXISTS `v_jenis_pelayanans`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_jenis_pelayanans` (
  `id` tinyint NOT NULL,
  `bidang_id` tinyint NOT NULL,
  `nama_bidang` tinyint NOT NULL,
  `jenis_pelayanan_nama` tinyint NOT NULL,
  `created_at` tinyint NOT NULL,
  `updated_at` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_kabkots`
--

DROP TABLE IF EXISTS `v_kabkots`;
/*!50001 DROP VIEW IF EXISTS `v_kabkots`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_kabkots` (
  `jw` tinyint NOT NULL,
  `provinsi_id` tinyint NOT NULL,
  `provinsi_nama` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `kabkot_nama` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_nilai_indikators`
--

DROP TABLE IF EXISTS `v_nilai_indikators`;
/*!50001 DROP VIEW IF EXISTS `v_nilai_indikators`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_nilai_indikators` (
  `id` tinyint NOT NULL,
  `bidang_id` tinyint NOT NULL,
  `nama_bidang` tinyint NOT NULL,
  `jenis_pelayanan_id` tinyint NOT NULL,
  `jenis_pelayanan_nama` tinyint NOT NULL,
  `indikator_id` tinyint NOT NULL,
  `nama_indikator` tinyint NOT NULL,
  `provinsi_id` tinyint NOT NULL,
  `provinsi_nama` tinyint NOT NULL,
  `kabkot_id` tinyint NOT NULL,
  `kabkot_nama` tinyint NOT NULL,
  `nilai` tinyint NOT NULL,
  `batas_waktu` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_users`
--

DROP TABLE IF EXISTS `v_users`;
/*!50001 DROP VIEW IF EXISTS `v_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_users` (
  `id` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `level` tinyint NOT NULL,
  `provinsi_id` tinyint NOT NULL,
  `provinsi_nama` tinyint NOT NULL,
  `kabkot_id` tinyint NOT NULL,
  `kabkot_nama` tinyint NOT NULL,
  `full_name` tinyint NOT NULL,
  `encrypted_password` tinyint NOT NULL,
  `reset_password_token` tinyint NOT NULL,
  `reset_password_sent_at` tinyint NOT NULL,
  `remember_created_at` tinyint NOT NULL,
  `sign_in_count` tinyint NOT NULL,
  `current_sign_in_at` tinyint NOT NULL,
  `last_sign_in_at` tinyint NOT NULL,
  `current_sign_in_ip` tinyint NOT NULL,
  `last_sign_in_ip` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `varxes`
--

DROP TABLE IF EXISTS `varxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `varxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indikator_id` int(11) DEFAULT NULL,
  `var_nama` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `v_indikators`
--

/*!50001 DROP TABLE IF EXISTS `v_indikators`*/;
/*!50001 DROP VIEW IF EXISTS `v_indikators`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_aipd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_indikators` AS select `indikators`.`id` AS `id`,`indikators`.`bidang_id` AS `bidang_id`,`bidangs`.`nama_bidang` AS `nama_bidang`,`indikators`.`jenis_pelayanan_id` AS `jenis_pelayanan_id`,`jenis_pelayanans`.`jenis_pelayanan_nama` AS `jenis_pelayanan_nama`,`indikators`.`nama_indikator` AS `nama_indikator`,`indikators`.`nilai_default` AS `nilai_default`,`indikators`.`batas_waktu_default` AS `batas_waktu_default` from ((`indikators` left join `bidangs` on((`indikators`.`bidang_id` = `bidangs`.`id`))) left join `jenis_pelayanans` on((`indikators`.`jenis_pelayanan_id` = `jenis_pelayanans`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_jenis_pelayanans`
--

/*!50001 DROP TABLE IF EXISTS `v_jenis_pelayanans`*/;
/*!50001 DROP VIEW IF EXISTS `v_jenis_pelayanans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_aipd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_jenis_pelayanans` AS select `jenis_pelayanans`.`id` AS `id`,`jenis_pelayanans`.`bidang_id` AS `bidang_id`,`bidangs`.`nama_bidang` AS `nama_bidang`,`jenis_pelayanans`.`jenis_pelayanan_nama` AS `jenis_pelayanan_nama`,`jenis_pelayanans`.`created_at` AS `created_at`,`jenis_pelayanans`.`updated_at` AS `updated_at` from (`jenis_pelayanans` left join `bidangs` on((`jenis_pelayanans`.`bidang_id` = `bidangs`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_kabkots`
--

/*!50001 DROP TABLE IF EXISTS `v_kabkots`*/;
/*!50001 DROP VIEW IF EXISTS `v_kabkots`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_aipd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_kabkots` AS select `provinsis`.`jw` AS `jw`,`kabkots`.`provinsi_id` AS `provinsi_id`,`provinsis`.`provinsi_nama` AS `provinsi_nama`,`kabkots`.`id` AS `id`,`kabkots`.`kabkot_nama` AS `kabkot_nama` from (`kabkots` left join `provinsis` on((`kabkots`.`provinsi_id` = `provinsis`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_nilai_indikators`
--

/*!50001 DROP TABLE IF EXISTS `v_nilai_indikators`*/;
/*!50001 DROP VIEW IF EXISTS `v_nilai_indikators`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_aipd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_nilai_indikators` AS select `a`.`id` AS `id`,`v_indikators`.`bidang_id` AS `bidang_id`,`v_indikators`.`nama_bidang` AS `nama_bidang`,`v_indikators`.`jenis_pelayanan_id` AS `jenis_pelayanan_id`,`v_indikators`.`jenis_pelayanan_nama` AS `jenis_pelayanan_nama`,`a`.`indikator_id` AS `indikator_id`,`v_indikators`.`nama_indikator` AS `nama_indikator`,`a`.`provinsi_id` AS `provinsi_id`,`provinsis`.`provinsi_nama` AS `provinsi_nama`,`a`.`kabkot_id` AS `kabkot_id`,`kabkots`.`kabkot_nama` AS `kabkot_nama`,`a`.`nilai` AS `nilai`,`a`.`batas_waktu` AS `batas_waktu` from (((`nilai_indikators` `a` left join `v_indikators` on((`a`.`indikator_id` = `v_indikators`.`id`))) left join `provinsis` on((`a`.`provinsi_id` = `provinsis`.`id`))) left join `kabkots` on((`a`.`kabkot_id` = `kabkots`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_users`
--

/*!50001 DROP TABLE IF EXISTS `v_users`*/;
/*!50001 DROP VIEW IF EXISTS `v_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root_aipd`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_users` AS select `users`.`id` AS `id`,`users`.`email` AS `email`,`users`.`level` AS `level`,`users`.`provinsi_id` AS `provinsi_id`,`provinsis`.`provinsi_nama` AS `provinsi_nama`,`users`.`kabkot_id` AS `kabkot_id`,`kabkots`.`kabkot_nama` AS `kabkot_nama`,`users`.`full_name` AS `full_name`,`users`.`encrypted_password` AS `encrypted_password`,`users`.`reset_password_token` AS `reset_password_token`,`users`.`reset_password_sent_at` AS `reset_password_sent_at`,`users`.`remember_created_at` AS `remember_created_at`,`users`.`sign_in_count` AS `sign_in_count`,`users`.`current_sign_in_at` AS `current_sign_in_at`,`users`.`last_sign_in_at` AS `last_sign_in_at`,`users`.`current_sign_in_ip` AS `current_sign_in_ip`,`users`.`last_sign_in_ip` AS `last_sign_in_ip` from ((`users` left join `provinsis` on((`users`.`provinsi_id` = `provinsis`.`id`))) left join `kabkots` on((`users`.`kabkot_id` = `kabkots`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-14 15:31:51
INSERT INTO schema_migrations (version) VALUES ('20141112140135');

INSERT INTO schema_migrations (version) VALUES ('20141117163217');

INSERT INTO schema_migrations (version) VALUES ('20141201040334');

INSERT INTO schema_migrations (version) VALUES ('20141201040418');

INSERT INTO schema_migrations (version) VALUES ('20141201040842');

INSERT INTO schema_migrations (version) VALUES ('20141201041213');

INSERT INTO schema_migrations (version) VALUES ('20141201041818');

INSERT INTO schema_migrations (version) VALUES ('20141201041853');

INSERT INTO schema_migrations (version) VALUES ('20141202110122');

INSERT INTO schema_migrations (version) VALUES ('20141202112805');

INSERT INTO schema_migrations (version) VALUES ('20150110005138');

INSERT INTO schema_migrations (version) VALUES ('20150110005139');

INSERT INTO schema_migrations (version) VALUES ('20150110005140');

INSERT INTO schema_migrations (version) VALUES ('20150110005141');

INSERT INTO schema_migrations (version) VALUES ('20150111090221');

INSERT INTO schema_migrations (version) VALUES ('20150111090222');

INSERT INTO schema_migrations (version) VALUES ('20150111090223');

INSERT INTO schema_migrations (version) VALUES ('20150112015031');

INSERT INTO schema_migrations (version) VALUES ('20150112061952');

INSERT INTO schema_migrations (version) VALUES ('20150114083128');

