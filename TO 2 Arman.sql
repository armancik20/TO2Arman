-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 10.4.13-MariaDB - mariadb.org binary distribution
-- OS Server:                    Win64
-- HeidiSQL Versi:               9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Membuang struktur basisdata untuk latihan
CREATE DATABASE IF NOT EXISTS `latihan` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `latihan`;

-- membuang struktur untuk table latihan.alembic_version
CREATE TABLE IF NOT EXISTS `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel latihan.alembic_version: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` (`version_num`) VALUES
	('1d4827551808');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;

-- membuang struktur untuk table latihan.dosens
CREATE TABLE IF NOT EXISTS `dosens` (
  `id_dosen` int(11) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel latihan.dosens: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `dosens` DISABLE KEYS */;
INSERT INTO `dosens` (`id_dosen`, `nama_dosen`) VALUES
	(100001, 'Joko Pramana');
/*!40000 ALTER TABLE `dosens` ENABLE KEYS */;

-- membuang struktur untuk table latihan.haris
CREATE TABLE IF NOT EXISTS `haris` (
  `kode_hari` int(11) NOT NULL,
  `nama_hari` varchar(50) DEFAULT NULL,
  `user_create` varchar(50) DEFAULT NULL,
  `user_change` varchar(50) DEFAULT NULL,
  `user_date_create` datetime DEFAULT NULL,
  `user_date_change` datetime DEFAULT NULL,
  PRIMARY KEY (`kode_hari`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel latihan.haris: ~6 rows (lebih kurang)
/*!40000 ALTER TABLE `haris` DISABLE KEYS */;
INSERT INTO `haris` (`kode_hari`, `nama_hari`, `user_create`, `user_change`, `user_date_create`, `user_date_change`) VALUES
	(1, 'Senin', NULL, NULL, NULL, NULL),
	(2, 'Selasa', NULL, NULL, NULL, NULL),
	(3, 'Rabu', NULL, NULL, NULL, NULL),
	(4, 'Kamis', NULL, NULL, NULL, NULL),
	(5, 'Jumat', NULL, NULL, NULL, NULL),
	(6, 'Sabtu', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `haris` ENABLE KEYS */;

-- membuang struktur untuk table latihan.konselings
CREATE TABLE IF NOT EXISTS `konselings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sesi_waktu` int(11) DEFAULT NULL,
  `sesi_hari` int(11) DEFAULT NULL,
  `nim` char(50) DEFAULT NULL,
  `id_dosen` int(11) DEFAULT NULL,
  `email_mhs` char(50) DEFAULT NULL,
  `status` char(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel latihan.konselings: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `konselings` DISABLE KEYS */;
INSERT INTO `konselings` (`id`, `sesi_waktu`, `sesi_hari`, `nim`, `id_dosen`, `email_mhs`, `status`, `created_at`, `updated_at`) VALUES
	(9, 2, 1, '45645644', 100001, 'suparman201994@gmail.com', '1', '2020-09-21 04:51:33', '2020-09-21 04:51:33'),
	(10, 2, 1, '45645643', 100001, 'suparman201994@gmail.com', NULL, '2020-09-21 07:54:44', '2020-09-21 07:54:44');
/*!40000 ALTER TABLE `konselings` ENABLE KEYS */;

-- membuang struktur untuk table latihan.sesi_dosens
CREATE TABLE IF NOT EXISTS `sesi_dosens` (
  `id_dosen` int(11) NOT NULL,
  `sesi_hari` int(11) NOT NULL,
  `sesi_waktu` int(11) NOT NULL,
  `user_create` varchar(150) NOT NULL,
  `user_change` varchar(150) NOT NULL,
  `user_date_create` datetime NOT NULL,
  `user_date_change` datetime NOT NULL,
  PRIMARY KEY (`id_dosen`,`sesi_hari`,`sesi_waktu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel latihan.sesi_dosens: ~5 rows (lebih kurang)
/*!40000 ALTER TABLE `sesi_dosens` DISABLE KEYS */;
INSERT INTO `sesi_dosens` (`id_dosen`, `sesi_hari`, `sesi_waktu`, `user_create`, `user_change`, `user_date_create`, `user_date_change`) VALUES
	(100001, 1, 1, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(100001, 1, 2, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(100001, 1, 3, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(100001, 4, 1, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(100001, 4, 2, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `sesi_dosens` ENABLE KEYS */;

-- membuang struktur untuk table latihan.todos
CREATE TABLE IF NOT EXISTS `todos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `todo` varchar(140) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_todos_created_at` (`created_at`),
  KEY `ix_todos_updated_at` (`updated_at`),
  CONSTRAINT `todos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel latihan.todos: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `todos` DISABLE KEYS */;
/*!40000 ALTER TABLE `todos` ENABLE KEYS */;

-- membuang struktur untuk table latihan.todo_files
CREATE TABLE IF NOT EXISTS `todo_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `todo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `todo_id` (`todo_id`),
  KEY `ix_todo_files_created_at` (`created_at`),
  KEY `ix_todo_files_updated_at` (`updated_at`),
  CONSTRAINT `todo_files_ibfk_1` FOREIGN KEY (`todo_id`) REFERENCES `todos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel latihan.todo_files: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `todo_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `todo_files` ENABLE KEYS */;

-- membuang struktur untuk table latihan.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(230) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Membuang data untuk tabel latihan.users: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
	(1, 'arman', 'suparman20@ecampus.ut.ac.id', 'arman2006', NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
