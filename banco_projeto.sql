-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para rota_certa
DROP DATABASE IF EXISTS `rota_certa`;
CREATE DATABASE IF NOT EXISTS `rota_certa` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `rota_certa`;

-- Copiando estrutura para tabela rota_certa.cadastro
DROP TABLE IF EXISTS `cadastro`;
CREATE TABLE IF NOT EXISTS `cadastro` (
  `id_cad` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) DEFAULT NULL,
  `email` varchar(115) DEFAULT NULL,
  `senha` longtext DEFAULT NULL,
  `dt_nasc` date DEFAULT NULL,
  PRIMARY KEY (`id_cad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela rota_certa.cadastro: ~2 rows (aproximadamente)
DELETE FROM `cadastro`;
INSERT INTO `cadastro` (`id_cad`, `nome`, `email`, `senha`, `dt_nasc`) VALUES
	(1, 'Ezequiel Moisés dos Santos', 'emaildoezequiel@gmail.com', '12345678', '2008-10-10'),
	(2, 'Pedro João', 'pedrinho@gmail.com', 'c26d3784f619a6fae0cfd635a515fbbb3498a364d5e395cb59187fcd1d14a017', '2000-02-10');

-- Copiando estrutura para tabela rota_certa.fale_conosco
DROP TABLE IF EXISTS `fale_conosco`;
CREATE TABLE IF NOT EXISTS `fale_conosco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `empresa` varchar(150) DEFAULT NULL,
  `assunto` longtext DEFAULT NULL,
  `mensagem` longtext DEFAULT NULL,
  `data_envio` datetime DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Aguardando Leitura',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Copiando dados para a tabela rota_certa.fale_conosco: ~1 rows (aproximadamente)
DELETE FROM `fale_conosco`;
INSERT INTO `fale_conosco` (`id`, `nome`, `email`, `telefone`, `empresa`, `assunto`, `mensagem`, `data_envio`, `status`) VALUES
	(8, 'Ezequiel Moisés', 'emaildoezequiel@gmail.com', 2147483647, 'Moisés Company', 'Teste', 'Testandoooooooooooooooooooooooooooooooooooooooooooooooooooo', '2025-11-25 09:15:50', 'Aguardando Leitura');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
