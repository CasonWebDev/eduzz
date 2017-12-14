-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.10-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela eduzz.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id_func` int(11) NOT NULL AUTO_INCREMENT,
  `firstname_func` varchar(100) NOT NULL,
  `lastname_func` varchar(100) NOT NULL,
  `address_func` varchar(100) NOT NULL,
  `number_func` varchar(10) NOT NULL,
  `complement_func` varchar(100) DEFAULT NULL,
  `district_func` varchar(100) NOT NULL,
  `city_func` varchar(100) NOT NULL,
  `state_func` varchar(100) NOT NULL,
  `zipcode_func` varchar(100) NOT NULL,
  `phone_func` varchar(100) DEFAULT NULL,
  `cellphone_func` varchar(100) DEFAULT NULL,
  `mail_func` varchar(100) NOT NULL,
  `deleted_func` varchar(100) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id_func`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela eduzz.employees: ~4 rows (aproximadamente)
DELETE FROM `employees`;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id_func`, `firstname_func`, `lastname_func`, `address_func`, `number_func`, `complement_func`, `district_func`, `city_func`, `state_func`, `zipcode_func`, `phone_func`, `cellphone_func`, `mail_func`, `deleted_func`, `updated_at`, `created_at`) VALUES
	(2, 'Fulano', 'Silva', 'Rua Alterada 2', '12323', '', 'Centro', 'São Paulo', 'SP', '13840000', '', '19982224552', 'fulano@gmail.com', '0', '2017-12-13 21:45:23', '0000-00-00 00:00:00');
INSERT INTO `employees` (`id_func`, `firstname_func`, `lastname_func`, `address_func`, `number_func`, `complement_func`, `district_func`, `city_func`, `state_func`, `zipcode_func`, `phone_func`, `cellphone_func`, `mail_func`, `deleted_func`, `updated_at`, `created_at`) VALUES
	(3, 'Master', 'Test', 'Rua Nope', '009', '', 'Bairro', 'Cosmópolis', 'SP', '09323000', '19002929292', '', 'teste@test.com', '1', '2017-12-14 02:09:54', '2017-12-13 21:12:03');
INSERT INTO `employees` (`id_func`, `firstname_func`, `lastname_func`, `address_func`, `number_func`, `complement_func`, `district_func`, `city_func`, `state_func`, `zipcode_func`, `phone_func`, `cellphone_func`, `mail_func`, `deleted_func`, `updated_at`, `created_at`) VALUES
	(4, 'Novo', 'Teste', 'Av. Alameda', '122', '', 'Bairro', 'Cosmópolis', 'SP', '5511113', '19002929292', '121858515115', 'mail@ma.com', '0', '2017-12-13 21:46:38', '2017-12-13 21:46:38');
INSERT INTO `employees` (`id_func`, `firstname_func`, `lastname_func`, `address_func`, `number_func`, `complement_func`, `district_func`, `city_func`, `state_func`, `zipcode_func`, `phone_func`, `cellphone_func`, `mail_func`, `deleted_func`, `updated_at`, `created_at`) VALUES
	(5, 'testem', 'master', 'No have', '2333', 'No have, 123', 'ctre', 'Sao Paulo', 'São Paulo', '12349', '1872183478', '1872183478', 'joseph@test.com.br', '0', '2017-12-14 01:49:49', '2017-12-14 01:49:49');
INSERT INTO `employees` (`id_func`, `firstname_func`, `lastname_func`, `address_func`, `number_func`, `complement_func`, `district_func`, `city_func`, `state_func`, `zipcode_func`, `phone_func`, `cellphone_func`, `mail_func`, `deleted_func`, `updated_at`, `created_at`) VALUES
	(6, 'Novo', 'Teste', 'Rua Frei Caneca, 558, Consolação', '', 'Rua Frei Caneca, 558, Consolação', '', 'São Paulo', 'São Paulo', '01307-000', '11', '1137910180', 'showroom-sp@rincawesky.com.br', '0', '2017-12-14 02:02:01', '2017-12-14 01:50:50');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
