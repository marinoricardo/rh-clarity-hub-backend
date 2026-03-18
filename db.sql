-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 08, 2025 at 06:05 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guezi`
--

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `created_at`, `name`, `updated_at`) VALUES
(1, NULL, 'CA', NULL),
(2, NULL, 'Área de Suporte', NULL),
(3, NULL, 'Área de Negócio', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `created_at`, `name`, `updated_at`) VALUES
(1, NULL, 'Certo', NULL),
(2, NULL, 'Incerto', NULL),
(3, NULL, 'Indeterminado', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colaborador_dados_empresarias`
--

DROP TABLE IF EXISTS `colaborador_dados_empresarias`;
CREATE TABLE IF NOT EXISTS `colaborador_dados_empresarias` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `data_admissao` varchar(255) DEFAULT NULL,
  `data_fim` varchar(255) DEFAULT NULL,
  `data_situacao` varchar(255) DEFAULT NULL,
  `inss` varchar(255) DEFAULT NULL,
  `salario` int NOT NULL,
  `categoria_id` bigint DEFAULT NULL,
  `colaborador_id` bigint DEFAULT NULL,
  `nivel_id` bigint DEFAULT NULL,
  `pelouro_id` bigint DEFAULT NULL,
  `sector_id` bigint DEFAULT NULL,
  `situacao_id` bigint DEFAULT NULL,
  `unidade_organica_id` bigint DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reecontratar` int NOT NULL,
  `area_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  `regiao_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKdna2nqd6hqvdpg2hjwa8klxhj` (`employee_id`),
  KEY `FKlmi2drcu962a6cdb13yqlatmi` (`categoria_id`),
  KEY `FK6cjbplagey7jj4dcylamrvknu` (`colaborador_id`),
  KEY `FKmtkhfke7x2ibandwqukh23d3q` (`nivel_id`),
  KEY `FKqkulhxkmehacsv5vxdqtp4rj9` (`pelouro_id`),
  KEY `FKrv3x6dw5yme29u8p6dvh0kon0` (`sector_id`),
  KEY `FKn6g4mmfle0mxmxnmfs47sh79r` (`situacao_id`),
  KEY `FK4ue1g2wrws1c4c3grplhyyam6` (`unidade_organica_id`),
  KEY `FKfmeilqyffdmdwthj7ii8epco5` (`area_id`),
  KEY `FKat8biox4aj3wxtmpqtv2ce6ax` (`regiao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `colaborador_dados_empresarias`
--

INSERT INTO `colaborador_dados_empresarias` (`id`, `data_admissao`, `data_fim`, `data_situacao`, `inss`, `salario`, `categoria_id`, `colaborador_id`, `nivel_id`, `pelouro_id`, `sector_id`, `situacao_id`, `unidade_organica_id`, `status`, `reecontratar`, `area_id`, `employee_id`, `regiao_id`) VALUES
(55, '2025-02-25', '2027-02-25', '', '3456789', 20000, 1, NULL, 4, 2, 74, 2, 3, 'Activo', 2, 3, 38, 1),
(56, '2025-01-24', '2025-07-24', '', '3456789', 30000, 2, NULL, 5, 2, 74, 2, 3, 'Activo', 0, 3, 39, 1),
(57, '2025-01-01', '2025-04-30', '', '921562547', 76500, 1, NULL, 7, 3, 8, 2, 12, 'Activo', 0, 3, 41, 5),
(58, '2025-01-20', '2025-05-20', '', '23456789', 12000, 1, NULL, 6, 2, 84, 2, 3, '', 0, 3, 42, 1),
(59, '2025-02-27', '2025-06-12', '', '3456789', 120, 2, NULL, 1, 1, 16, 2, 14, 'Inactivo', 0, 2, 43, 1),
(60, '2025-02-03', '2025-02-28', '', '3456789', 10000, 1, NULL, 4, 2, 3, 2, 3, 'Activo', 0, 3, 44, 1),
(61, '2025-11-04', '2027-11-04', '', '12345678', 10000, 1, NULL, 5, 2, 3, 2, 3, 'Activo', 2, 3, 45, 1),
(62, '2025-02-10', '2025-08-09', '', '123456789', 10000, 1, NULL, 3, 5, 102, 2, 23, 'Activo', 0, 2, 47, 5),
(68, '2021-11-02', '2030-11-12', '', '1234567', 120, 1, NULL, 3, 2, 76, 2, 3, 'Activo', 0, 3, 52, 3);

-- --------------------------------------------------------

--
-- Table structure for table `colaborador_dados_pessoais`
--

DROP TABLE IF EXISTS `colaborador_dados_pessoais`;
CREATE TABLE IF NOT EXISTS `colaborador_dados_pessoais` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `anexo_documento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cell` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `cod_postal` varchar(255) DEFAULT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `contacto_sec` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `data_nascimento` varchar(255) DEFAULT NULL,
  `distrito` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_sec` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `estado_civil` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `nacionalidade` varchar(255) DEFAULT NULL,
  `nome_completo` varchar(255) DEFAULT NULL,
  `nr_documento` varchar(255) DEFAULT NULL,
  `nuit` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `tipo_documento` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `funcao` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `observacoes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `colaborador_dados_pessoais`
--

INSERT INTO `colaborador_dados_pessoais` (`id`, `anexo_documento`, `bairro`, `cell`, `cidade`, `cod_postal`, `contacto`, `contacto_sec`, `created_at`, `data_nascimento`, `distrito`, `email`, `email_sec`, `endereco`, `estado_civil`, `genero`, `nacionalidade`, `nome_completo`, `nr_documento`, `nuit`, `provincia`, `tipo_documento`, `updated_at`, `active`, `deleted`, `funcao`, `user_id`, `estado`, `observacoes`) VALUES
(38, NULL, '', '', 'maputo', '001', '', '1234567890', NULL, '2002-02-24', '', 'Mauro.muchanga@edm.co.mz', '', 'maputo cidade', 'Solteiro (a)', 'Masculino', '', 'Mauro Muchanga', '1234567', '343434344', 'Maputo', 'Bilhete de Identidade', NULL, b'1', b'1', 'Tarifeiro', 1, 'APPROVED', NULL),
(39, NULL, '', '', 'maputo', '001', '845557222', '845557222', NULL, '2025-01-17', '', 'aminagracaa@gmail.com', 'aminagracaa@gmail.com', 'maputo cidade', 'Solteiro (a)', 'Feminino', '', 'Amina uamusse', '12345678', '13323255', '13323255', 'Bilhete de Identidade', NULL, b'1', b'0', 'IT', 2, 'APPROVED', NULL),
(40, NULL, 'Zimpeto', '862345678', 'Maputo', '', '823567890', '847898653', NULL, '1999-07-26', 'Ka Mubukwana', 'mariamo.simango@edm.co.mz', 'md.simangoo@gmail.com', 'Cidade de Maputo', 'Solteiro (a)', 'Feminino', '', 'Mariamo Damiao Simango', '1105518990A', '234567890', 'Maputo', 'Bilhete de Identidade', NULL, b'1', b'0', 'Web Developer', 2, 'APPROVED', NULL),
(41, NULL, 'Bairro de Guava', '845636560', 'Maputo', '1400', '878919063', '845636560', NULL, '2000-11-22', 'Maputo', 'alice.tembe@edm.co.mz', 'alicedanielatembe22@gmail.com', 'Bairro de Guava', 'Solteiro (a)', 'Feminino', '', 'Alice Daniela Tembe', '110101980921J', '154009426', 'Maputo', 'Bilhete de Identidade', NULL, b'1', b'0', 'Estagiaria', 3, 'APPROVED', NULL),
(42, NULL, '', '', '', '', '', '', NULL, '1999-06-25', '', 'joao.uachave@edm.co.mz', 'joao.uachave@edm.co.mz', '', 'Solteiro (a)', 'Feminino', '', 'Joao Uachave', '1234567', '13323255', '', 'Passaporte', NULL, b'1', b'0', 'Tarifeiro', 2, 'APPROVED', NULL),
(43, NULL, '', '', '', '', '', '', NULL, '2025-02-21', '', '', '', '', 'Viuvo (a)', 'Masculino', '', 'Testando agora', '133232550009', '13323255', '', 'Carta de Conducao', NULL, b'1', b'0', '', 1, 'APPROVED', NULL),
(44, NULL, '', '', '', '', '', '', NULL, '2025-02-26', '', '', '', '', 'Solteiro (a)', 'Feminino', '', 'Agostinho howana', '12345678', '2345678', '', 'Bilhete de Identidade', NULL, b'1', b'0', 'electrecista', 2, 'APPROVED', NULL),
(45, NULL, '', '', 'maputo', '001', '8434343434', '', NULL, '1985-06-27', 'Matola sede', 'MunirIbraimo@edm.co.mz', '', 'maputo Matola', 'Casado (a)', 'Masculino', '', 'Munir Ibraimo', '100100236426', '12345678', 'Maputo', 'Bilhete de Identidade', NULL, b'1', b'0', 'Tarifeiro', 1, 'APPROVED', NULL),
(46, NULL, 'Bairro da Sommerchield', '', 'Maputo', '1100', '844724090', '', NULL, '2001-04-11', 'Maputo', 'chamusse29@gmail.com', '', 'rua Dar Es Salaam, Q 33, Casa 120', 'Solteiro (a)', 'Masculino', '', 'Samuel Bute', '110101479009M', '163887347', 'Maputo', 'Bilhete de Identidade', NULL, b'1', b'0', 'Digitalizador de Dados de RH', 52, 'APPROVED', NULL),
(47, NULL, 'Bairro da Sommerchield', '', 'Maputo', '1100', '844724090', '', NULL, '2001-04-11', 'Maputo', 'chamusse29@gmail.com', '', 'rua Dar Es Salaam, Q 33, Casa 120', 'Solteiro (a)', 'Masculino', '', 'Samuel Bute', '110101479009M', '163887347', 'Maputo', 'Bilhete de Identidade', NULL, b'1', b'1', 'Digitalizador de Dados de RH', 52, 'APPROVED', NULL),
(51, NULL, '', '', '', '', '', '', NULL, '2025-11-07', '', '', '', '', 'Casado (a)', 'Feminino', '', 'Amina Uamusse', '2344554', '4567', '', 'Passaporte', NULL, b'1', b'0', '', 1, 'APPROVED', NULL),
(52, NULL, '', '', '', '', '', '', NULL, '1995-06-06', '', '', '', '', 'Solteiro (a)', 'Masculino', '', 'Testando Sys', '23456789', '12345678', '', 'Bilhete de Identidade', NULL, b'1', b'1', '', 1, 'APPROVED', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colaborador_documentos`
--

DROP TABLE IF EXISTS `colaborador_documentos`;
CREATE TABLE IF NOT EXISTS `colaborador_documentos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `certificado_habilitacoes` varchar(255) DEFAULT NULL,
  `curriculum` varchar(255) DEFAULT NULL,
  `documento_identificacao` varchar(255) DEFAULT NULL,
  `nuit` varchar(255) DEFAULT NULL,
  `outras_certificacoes` varchar(255) DEFAULT NULL,
  `colaborador_id` bigint DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6qahdyitif9axl3lc505joi2q` (`employee_id`),
  KEY `FK5ypw35m7r9m4wl2qdnckgpg1c` (`colaborador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `colaborador_documentos`
--

INSERT INTO `colaborador_documentos` (`id`, `certificado_habilitacoes`, `curriculum`, `documento_identificacao`, `nuit`, `outras_certificacoes`, `colaborador_id`, `employee_id`) VALUES
(25, 'http://docs.edm.co.mz/uploads/67bd4f7a5983a.pdf', 'http://docs.edm.co.mz/uploads/67bd4f846cc0a.pdf', 'http://docs.edm.co.mz/uploads/67bd4f6dc2100.pdf', 'http://docs.edm.co.mz/uploads/67bd4f6516e0c.pdf', NULL, NULL, 38),
(26, 'http://docs.edm.co.mz/uploads/67bd52153aa7f.pdf', 'http://docs.edm.co.mz/uploads/67bd521f4562e.pdf', 'http://docs.edm.co.mz/uploads/67bd520d4c6d3.pdf', 'http://docs.edm.co.mz/uploads/67bd520666375.pdf', 'http://docs.edm.co.mz/uploads/67bd522b57e7f.pdf', NULL, 39),
(27, 'http://docs.edm.co.mz/uploads/67bde61d934f6.xlsx', 'http://docs.edm.co.mz/uploads/67bde6317540b.pdf', 'http://docs.edm.co.mz/uploads/67bde60f01309.pdf', 'http://docs.edm.co.mz/uploads/67bde6001f0b6.xlsx', NULL, NULL, 40),
(28, NULL, 'http://docs.edm.co.mz/uploads/67bde7a043a02.pdf', NULL, 'http://docs.edm.co.mz/uploads/67bde76db34a8.jpeg', NULL, NULL, 41),
(29, 'http://docs.edm.co.mz/uploads/67be9d193b2a8.pdf', 'http://docs.edm.co.mz/uploads/67be9d1de7c49.pdf', 'http://docs.edm.co.mz/uploads/67be9d15574d4.pdf', 'http://docs.edm.co.mz/uploads/67be9c6c0ab4f.pdf', 'http://docs.edm.co.mz/uploads/67be9d232c0bc.pdf', NULL, 43),
(30, 'http://docs.edm.co.mz/uploads/67bea0e83815a.pdf', 'http://docs.edm.co.mz/uploads/67bea0ed6d0d2.pdf', 'http://docs.edm.co.mz/uploads/67bea0e240770.pdf', 'http://docs.edm.co.mz/uploads/67bea0d9b7e88.pdf', 'http://docs.edm.co.mz/uploads/67bea0f366762.pdf', NULL, 42),
(31, 'http://docs.edm.co.mz/uploads/67bea1dfde185.pdf', 'http://docs.edm.co.mz/uploads/67bea1e8ced9d.pdf', 'http://docs.edm.co.mz/uploads/67bea1d766020.pdf', 'http://docs.edm.co.mz/uploads/67bea1cf2e8b6.pdf', NULL, NULL, 44),
(32, 'http://docs.edm.co.mz/uploads/67c0a0a324fd8.pdf', 'http://docs.edm.co.mz/uploads/67c0a0ae0bf9b.pdf', 'http://docs.edm.co.mz/uploads/67c0a0941938e.pdf', 'http://docs.edm.co.mz/uploads/67c0a0872a9d0.pdf', NULL, NULL, 45),
(33, NULL, NULL, NULL, NULL, NULL, NULL, 47),
(35, 'http://docs.edm.co.mz/uploads/690ed6a6c3b62.png', 'http://docs.edm.co.mz/uploads/690ed6abd175d.png', 'http://docs.edm.co.mz/uploads/690ed6a061d01.png', 'http://docs.edm.co.mz/uploads/690ed69966ae3.png', 'http://docs.edm.co.mz/uploads/690ed6c233519.png', NULL, 52);

-- --------------------------------------------------------

--
-- Table structure for table `colaborador_removidos`
--

DROP TABLE IF EXISTS `colaborador_removidos`;
CREATE TABLE IF NOT EXISTS `colaborador_removidos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `anexo` varchar(255) DEFAULT NULL,
  `employee` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `who` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKaeodpl448boa6bk8bdxxjgxtk` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `colaborador_removidos`
--

INSERT INTO `colaborador_removidos` (`id`, `anexo`, `employee`, `reason`, `who`, `created_at`, `employee_id`) VALUES
(21, 'http://docs.edm.co.mz/uploads/690ed4ab9d3f7.png', NULL, 'Recisão', 'System', '2025-11-08T05:27:09.029Z', 38),
(22, 'http://docs.edm.co.mz/uploads/690ed710e4d9e.png', NULL, 'Reforma', 'System', '2025-11-08T05:37:22.528Z', 52);

-- --------------------------------------------------------

--
-- Table structure for table `desempenho`
--

DROP TABLE IF EXISTS `desempenho`;
CREATE TABLE IF NOT EXISTS `desempenho` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `anexo` varchar(255) DEFAULT NULL,
  `avaliacao` varchar(255) DEFAULT NULL,
  `data_avaliacao` datetime(6) NOT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1clgpp8s0hieo2vgxx8q1toel` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `desempenho`
--

INSERT INTO `desempenho` (`id`, `anexo`, `avaliacao`, `data_avaliacao`, `employee_id`) VALUES
(1, 'http://docs.edm.co.mz/uploads/67bd4fcd1d432.xlsx', 'Muito Bom', '2025-02-24 12:12:52.515000', 38),
(2, 'http://docs.edm.co.mz/uploads/67c0a138e71f5.xlsx', 'Bom', '2025-02-27 00:37:07.310000', 45),
(3, 'http://docs.edm.co.mz/uploads/67c0a1e631934.xlsx', 'Bom', '2025-02-27 00:39:59.444000', 45);

-- --------------------------------------------------------

--
-- Table structure for table `employment_history`
--

DROP TABLE IF EXISTS `employment_history`;
CREATE TABLE IF NOT EXISTS `employment_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employment_type` varchar(50) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) NOT NULL,
  `employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlq4l3g2ciem4896q3t9not4xu` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employment_history`
--

INSERT INTO `employment_history` (`id`, `employment_type`, `end_date`, `reason`, `start_date`, `employee_id`) VALUES
(1, 'Certo', '2027-02-24', 'Recontratação', '2025-02-24', 38),
(2, 'Certo', '2027-02-25', 'Recontratação', '2025-02-25', 38),
(3, 'Certo', '2027-02-27', 'Recontratação', '2025-02-27', 45),
(4, 'Certo', '2027-11-04', 'Recontratação', '2025-11-04', 45);

-- --------------------------------------------------------

--
-- Table structure for table `fundos_alocados`
--

DROP TABLE IF EXISTS `fundos_alocados`;
CREATE TABLE IF NOT EXISTS `fundos_alocados` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `salarios_pagos` int NOT NULL,
  `saldo` int NOT NULL,
  `valor` int NOT NULL,
  `unidade_organica_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK1tqrjd7ma1jg7oq3qof7h6l8b` (`unidade_organica_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `fundos_alocados`
--

INSERT INTO `fundos_alocados` (`id`, `salarios_pagos`, `saldo`, `valor`, `unidade_organica_id`) VALUES
(1, 82120, 917880, 1000000, 3),
(2, 76500, 923500, 1000000, 12),
(3, 120, 999880, 1000000, 14),
(4, 0, 100000000, 100000000, 1),
(5, 10000, 990000, 1000000, 23),
(6, 0, 10000000, 10000000, 7),
(7, 0, 1000000, 1000000, 26);

-- --------------------------------------------------------

--
-- Table structure for table `gestao_asseduidade`
--

DROP TABLE IF EXISTS `gestao_asseduidade`;
CREATE TABLE IF NOT EXISTS `gestao_asseduidade` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `absetismo` varchar(255) DEFAULT NULL,
  `data_fim` varchar(255) DEFAULT NULL,
  `data_inicio` varchar(255) DEFAULT NULL,
  `observacoes` varchar(255) DEFAULT NULL,
  `colaborador_id` bigint DEFAULT NULL, 
  `anexo` varchar(255) DEFAULT NULL,
  `employee_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcik6iawd4lsf1q4r97seq8jlx` (`colaborador_id`),
  KEY `FKkgtqsloji6978eogk1fko9jnu` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gestao_asseduidade`
--

INSERT INTO `gestao_asseduidade` (`id`, `absetismo`, `data_fim`, `data_inicio`, `observacoes`, `colaborador_id`, `anexo`, `employee_id`) VALUES
(10, 'Dispensa', '2025-02-26', '2025-02-13', 'ghjklç', NULL, 'http://docs.edm.co.mz/uploads/67c0a1816ae13.pdf', 45),
(11, 'Presente', '2025-02-27', '2025-02-27', '', NULL, NULL, 47);

-- --------------------------------------------------------

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
CREATE TABLE IF NOT EXISTS `nivel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nivel`
--

INSERT INTO `nivel` (`id`, `created_at`, `name`, `updated_at`) VALUES
(1, NULL, 'Indiferênte', NULL),
(2, NULL, 'Primário (5 Classe)', NULL),
(3, NULL, 'Secundário (12 classe)', NULL),
(4, NULL, 'Técnico Básico', NULL),
(5, NULL, 'Técnico Médio', NULL),
(6, NULL, 'Bacharel', NULL),
(7, NULL, 'Licenciado', NULL),
(8, NULL, 'Mestre', NULL),
(9, NULL, 'Doutor', NULL),
(10, NULL, 'Pós-Doutotoramento', NULL),
(11, NULL, 'Especializado', NULL),
(12, NULL, 'MBA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `notification_time` varchar(255) DEFAULT NULL,
  `who` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `message`, `user_id`, `notification_time`, `who`) VALUES
(4, 'Amina Aninha adicionou um colaborador(dados pessoais) Mauro Muchanga', 1, '2025-02-24', 'Amina Aninha'),
(5, 'Amina Aninha adicionou um colaborador(dados empresariais) com ID 38', 1, '2025-02-24', 'Amina Aninha'),
(6, 'Amina Aninha reecontratou um colaborador Mauro Muchanga', 1, '2025-02-24', 'Amina Aninha'),
(7, 'Alice Tembe adicionou um colaborador(dados pessoais) Amina uamusse', 2, '2025-02-24', 'Alice Tembe'),
(8, 'Alice Tembe adicionou um colaborador(dados empresariais) com ID 39', 2, '2025-02-24', 'Alice Tembe'),
(9, 'Alice Tembe adicionou um colaborador(dados pessoais) Mariamo Damiao Simango', 2, '2025-02-25', 'Alice Tembe'),
(10, 'Mariamo Simango adicionou um colaborador(dados pessoais) Alice Daniela Tembe', 3, '2025-02-25', 'Mariamo Simango'),
(11, 'Amina Aninha aprovou um colaborador Mariamo Damiao Simango', 1, '2025-02-25', 'Amina Aninha'),
(12, 'Mariamo Simango adicionou um colaborador(dados empresariais) com ID 41', 3, '2025-02-25', 'Mariamo Simango'),
(13, 'Alice Tembe reecontratou um colaborador Mauro Muchanga', 2, '2025-02-25', 'Alice Tembe'),
(14, 'Amina Aninha aprovou um colaborador Alice Daniela Tembe', 1, '2025-02-25', 'Amina Aninha'),
(15, 'Amina Aninha aprovou um colaborador Amina uamusse', 1, '2025-02-25', 'Amina Aninha'),
(16, 'Alice Tembe adicionou um colaborador(dados pessoais) Joao Uachave', 2, '2025-02-25', 'Alice Tembe'),
(17, 'Alice Tembe adicionou um colaborador(dados empresariais) com ID 42', 2, '2025-02-25', 'Alice Tembe'),
(18, 'Amina Aninha adicionou um colaborador(dados pessoais) Testando agora', 1, '2025-02-25', 'Amina Aninha'),
(19, 'Amina Aninha adicionou um colaborador(dados empresariais) com ID 43', 1, '2025-02-25', 'Amina Aninha'),
(20, 'Alice Tembe adicionou um colaborador(dados pessoais) Agostinho howana', 2, '2025-02-25', 'Alice Tembe'),
(21, 'Alice Tembe adicionou um colaborador(dados empresariais) com ID 44', 2, '2025-02-25', 'Alice Tembe'),
(22, 'Amina Aninha adicionou um colaborador(dados pessoais) Munir Ibraimo', 1, '2025-02-27', 'Amina Aninha'),
(23, 'Amina Aninha adicionou um colaborador(dados empresariais) com ID 45', 1, '2025-02-27', 'Amina Aninha'),
(24, 'Amina Aninha aprovou um colaborador Agostinho howana', 1, '2025-02-27', 'Amina Aninha'),
(25, 'Amina Aninha aprovou um colaborador Joao Uachave', 1, '2025-02-27', 'Amina Aninha'),
(26, 'Amina Aninha reecontratou um colaborador Munir Ibraimo', 1, '2025-02-27', 'Amina Aninha'),
(27, 'Need Nhabomba adicionou um colaborador(dados pessoais) Samuel Bute', 52, '2025-02-27', 'Need Nhabomba'),
(28, 'Need Nhabomba adicionou um colaborador(dados pessoais) Samuel Bute', 52, '2025-02-27', 'Need Nhabomba'),
(29, 'Need Nhabomba adicionou um colaborador(dados empresariais) com ID 47', 52, '2025-02-27', 'Need Nhabomba'),
(30, 'Amina Aninha aprovou um colaborador Samuel Bute', 1, '2025-02-27', 'Amina Aninha'),
(31, 'Amina Aninha aprovou um colaborador Samuel Bute', 1, '2025-03-11', 'Amina Aninha'),
(32, 'Amina Aninha adicionou um colaborador(dados pessoais) Roque Mucanjo', 1, '2025-03-30', 'Amina Aninha'),
(33, 'Amina Aninha reecontratou um colaborador Munir Ibraimo', 1, '2025-11-04', 'Amina Aninha'),
(34, 'Amina Aninha adicionou um colaborador(dados pessoais) Amina cumbane', 1, '2025-11-06', 'Amina Aninha'),
(35, 'Amina Aninha adicionou um colaborador(dados pessoais) Amina cumbane', 1, '2025-11-06', 'Amina Aninha'),
(36, 'Amina Aninha adicionou um colaborador(dados pessoais) Amina Uamusse', 1, '2025-11-06', 'Amina Aninha'),
(37, 'Amina Aninha adicionou um colaborador(dados pessoais) Testando Sys', 1, '2025-11-07', 'Amina Aninha'),
(38, 'Amina Aninha adicionou um colaborador(dados empresariais) com ID 52', 1, '2025-11-07', 'Amina Aninha'),
(39, 'Amina Aninha adicionou um colaborador(dados pessoais) Testando SysIII', 1, '2025-11-07', 'Amina Aninha'),
(40, 'Amina Aninha adicionou um colaborador(dados pessoais) Testando SysIII', 1, '2025-11-07', 'Amina Aninha');

-- --------------------------------------------------------

--
-- Table structure for table `pelouro`
--

DROP TABLE IF EXISTS `pelouro`;
CREATE TABLE IF NOT EXISTS `pelouro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `area_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpg8vdo087kj4cl3r1xlsj07f2` (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pelouro`
--

INSERT INTO `pelouro` (`id`, `created_at`, `name`, `updated_at`, `area_id`) VALUES
(1, NULL, 'Pelouro do PCA', NULL, 2),
(2, NULL, 'Produção e Transporte', NULL, 3),
(3, NULL, 'Distribuição Comercial e Informatica', NULL, 3),
(4, NULL, 'Finanças', NULL, 2),
(5, NULL, 'Recursos Humanos', NULL, 2),
(6, NULL, 'Desenvolvimento de Negócios', NULL, 3),
(7, NULL, 'Eletrificação', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `regiao`
--

DROP TABLE IF EXISTS `regiao`;
CREATE TABLE IF NOT EXISTS `regiao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `regiao`
--

INSERT INTO `regiao` (`id`, `created_at`, `name`, `updated_at`) VALUES
(1, NULL, 'Sul', NULL),
(2, NULL, 'Centro e Norte', NULL),
(3, NULL, 'Centro', NULL),
(4, NULL, 'Norte', NULL),
(5, NULL, 'Direção Central', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `update_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `create_date`, `name`, `update_date`) VALUES
(1, '0000-00-00 00:00:00.000000', 'Normal', NULL),
(2, '0000-00-00 00:00:00.000000', 'SuperNormal', NULL),
(3, '0000-00-00 00:00:00.000000', 'Recursos Humanos', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `regiao_id` bigint DEFAULT NULL,
  `uni_org_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdo6s4qbsxf4sjshpipd9v12c9` (`regiao_id`),
  KEY `FK540ynq3xfc49h2jtjxh9irhm3` (`uni_org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`id`, `created_at`, `name`, `updated_at`, `regiao_id`, `uni_org_id`) VALUES
(1, NULL, 'GCA-Serviços de Apoio', NULL, 5, 1),
(2, NULL, 'GCRI-Subordinação Directa', NULL, 5, 2),
(3, NULL, 'DIT-Divisão de Transporte Sul', NULL, 1, 3),
(4, NULL, 'DRCM-ASC Kampfumo', NULL, 1, 4),
(5, NULL, 'GEDE-GA Estatistica Desempenho Empresari', NULL, 5, 5),
(6, NULL, 'DSG-Dep.to de Patrimonio', NULL, 5, 6),
(7, NULL, 'DACA-Dep.to Formação Desenvolvimento', NULL, 5, 7),
(8, NULL, 'DHSS-Dep.to Saúde Ocupacional e AMM', NULL, 5, 8),
(9, NULL, 'DDN-Unidades de Gestão de Projectos', NULL, 5, 9),
(10, NULL, 'GEPC-Serviços de Apoio', NULL, 5, 10),
(11, NULL, 'DPSE-Dep.to de Planeamento de Sistemas', NULL, 1, 11),
(12, NULL, 'GCRI-Serviços de Apoio', NULL, 5, 2),
(13, NULL, 'DID-Subordinação Directa', NULL, 5, 12),
(14, NULL, 'DFC-Dep.to de Contas a Pagar', NULL, 5, 13),
(15, NULL, 'GCA-Departamento de Segurança', NULL, 5, 1),
(16, NULL, 'GAJ-Serviços de Apoio', NULL, 1, 14),
(17, NULL, 'DRS-ASC Inhambane', NULL, 1, 15),
(18, NULL, 'DRN-ASC Nampula', NULL, 4, 16),
(19, NULL, 'DRC-ASC Chimoio', NULL, 2, 17),
(20, NULL, 'DPSE-Dep.to de Engenharia', NULL, 1, 11),
(21, NULL, 'DPSE-Dep.to Qualid Planeamento Ambiental', NULL, 1, 11),
(22, NULL, 'DEP-GA Gestão de Projectos', NULL, 1, 18),
(23, NULL, 'DOS-Dep.to de Operação de Sistemas', NULL, 1, 19),
(24, NULL, 'DIP-Divisão de Produção Centro Norte', NULL, 2, 20),
(25, NULL, 'GAR-Serviços de Apoio', NULL, 5, 21),
(26, NULL, 'DSG-Serviços de Apoio', NULL, 5, 6),
(27, NULL, 'DIP-Divisão de Produção Sul', NULL, 1, 20),
(28, NULL, 'DRPM-ASC Infulene', NULL, 1, 22),
(29, NULL, 'DIP-Serviços de Apoio', NULL, 1, 20),
(30, NULL, 'DGRH-Dep.to Politicas Desenvolv e Genero', NULL, 5, 23),
(31, NULL, 'DER-Dep Energias Renovaveis Dentro Rede', NULL, 5, 24),
(32, NULL, 'DDN-Serviços de Apoio', NULL, 5, 9),
(33, NULL, 'DID-Dep.to de Efeciência Energética', NULL, 5, 12),
(34, NULL, 'DIP-GA Planeamento Prod. e Estatistica', NULL, 1, 20),
(35, NULL, 'GAJ-Subordinação Directa', NULL, 1, 14),
(36, NULL, 'DEP-Serviços de Apoio', NULL, 1, 18),
(37, NULL, 'DFC-Serviços de Apoio', NULL, 5, 13),
(38, NULL, 'DDN-Unidade Monitoria Mobilização Fundos', NULL, 5, 9),
(39, NULL, 'GCRI-Director(a)', NULL, 5, 2),
(40, NULL, 'GCA-Subordinação Directa', NULL, 5, 1),
(41, NULL, 'GAJ-Director(a)', NULL, 1, 14),
(42, NULL, 'GEDE-Serviços de Apoio', NULL, 5, 5),
(43, NULL, 'DER-Serviços de Apoio', NULL, 5, 24),
(44, NULL, 'ADMIN RH - Dep.to de Fundo Social', NULL, 5, 25),
(45, NULL, 'DOM-Dep.to de Serviço ao Cliente', NULL, 5, 26),
(46, NULL, 'DPRCP-Dep.to Sistemas Inform. Geografica', NULL, 5, 27),
(47, NULL, 'DOM-Serviços de Apoio', NULL, 5, 26),
(48, NULL, 'DRCM-ASC Kaguava', NULL, 1, 4),
(49, NULL, 'DOM-Dep.to de Trocas Comerciais', NULL, 5, 26),
(50, NULL, 'DRCM-ASC Kamubuacuna', NULL, 1, 4),
(51, NULL, 'DGRH-Dep.to de Serviços Partilhados', NULL, 5, 23),
(52, NULL, 'DTI-Dep.to Aplicações Corporativas', NULL, 5, 28),
(53, NULL, 'DRCM-ASC Kamaxakeni', NULL, 1, 4),
(54, NULL, 'GIA-Subordinação Directa', NULL, 5, 29),
(55, NULL, 'DACA-Dep.to de Gestão de Conhecimento', NULL, 5, 7),
(56, NULL, 'DRCM-ASC Kamavota', NULL, 1, 4),
(57, NULL, 'DTI-Director(a)', NULL, 5, 28),
(58, NULL, 'DIC-Serviços de Apoio', NULL, 5, 30),
(59, NULL, 'DRPM-Gabinete Serviços de Apoio', NULL, 1, 22),
(60, NULL, 'GAR-GA Auditoria de Processos', NULL, 5, 21),
(61, NULL, 'DTI-Dep.to Redes Corporativas Equipament', NULL, 5, 28),
(62, NULL, 'DTI-GA Estrategias e Programa', NULL, 5, 28),
(63, NULL, 'DTI-Dep.to Centro Dados Ciber Segurança', NULL, 5, 28),
(64, NULL, 'DIC-Dep.to de Serviço ao Cliente', NULL, 5, 30),
(65, NULL, 'DIA-Dep.to de Analise e Desenvolvimento', NULL, 5, 31),
(66, NULL, 'DTI-Serviços de Apoio', NULL, 5, 28),
(67, NULL, 'DRC-ASC Quelimane', NULL, 2, 17),
(68, NULL, 'DRS-ASC Vilanculos', NULL, 1, 15),
(69, NULL, 'DACA-Academiada EDM-Director', NULL, 5, 7),
(70, NULL, 'DRPM-ASC Boane', NULL, 1, 22),
(71, NULL, 'DRPM - ASC Machava', NULL, 1, 22),
(72, NULL, 'DEP-GA Monitoria, IMS Mobilização Fundos', NULL, 1, 18),
(73, NULL, 'DPSE-Director(a)', NULL, 1, 11),
(74, NULL, 'DIT-Serviços de Apoio', NULL, 1, 3),
(75, NULL, 'PCA - Subordinação Directa', NULL, 5, 32),
(76, NULL, 'DIT-Divisão de Transporte Centro', NULL, 3, 3),
(77, NULL, 'DPRCP-Dep.to Serviços Tecnico Comerciais', NULL, 5, 27),
(78, NULL, 'DEP-Director(a)', NULL, 1, 18),
(79, NULL, 'DIT-Dep.to de Telecomunicações e SCADA', NULL, 1, 3),
(80, NULL, 'DOS-Director(a)', NULL, 5, 19),
(81, NULL, 'DER-Director(a)', NULL, 5, 24),
(82, NULL, 'DIT-Divisão de Transporte Norte', NULL, 4, 3),
(83, NULL, 'GIA-Serviços de Apoio', NULL, 1, 29),
(84, NULL, 'DIT-Dep.to de Protecções', NULL, 1, 3),
(85, NULL, 'DIT-Divisão de Transporte Centro Norte', NULL, 2, 3),
(86, NULL, 'DRS-ASC Chókwe', NULL, 1, 15),
(87, NULL, 'DID-Dep.to Planeamento de Infraestrutura', NULL, 1, 12),
(88, NULL, 'DFC-Dep.to de Contas a Receber', NULL, 5, 13),
(89, NULL, 'DSG-Dep.to de Logistica', NULL, 5, 6),
(90, NULL, 'DGRH-Serviços de Apoio', NULL, 5, 23),
(91, NULL, 'DID-Dep.to de Manutenção', NULL, 5, 12),
(92, NULL, 'DIA-Dep.to de Procurement', NULL, 5, 31),
(93, NULL, 'DPRCP-Dep.to Prev. Vand. Infra. Eq. Elec', NULL, 5, 27),
(95, NULL, 'DFC-Dep.to de Contabilidade', NULL, 5, 13),
(96, NULL, 'DFC-Dep.to de Tesouraria', NULL, 5, 13),
(97, NULL, 'GAR-GA Auditoria de Investigação', NULL, 5, 21),
(98, NULL, 'DDN-Director(a)', NULL, 5, 9),
(99, NULL, 'DFC-Dep.to de Planificação Financ e Orça', NULL, 5, 13),
(100, NULL, 'DIA-Serviços de Apoio', NULL, 5, 31),
(101, NULL, 'GEDE-Director(a)', NULL, 5, 5),
(102, NULL, 'DGRH-Dep.to Serviço ao Cliente Interno', NULL, 5, 23),
(103, NULL, 'DHSS-Director(a)', NULL, 5, 8),
(104, NULL, 'DHSS-Serviços de Apoio', NULL, 5, 8),
(105, NULL, 'DACA-Serviços de Apoio', NULL, 5, 7),
(106, NULL, 'DSG-Director(a)', NULL, 5, 6),
(107, NULL, 'Admin(a)-Recursos Humanos', NULL, 5, 25),
(108, NULL, 'GAR-Director(a)', NULL, 5, 21),
(109, NULL, 'DRPM-ASC Matola', NULL, 1, 22),
(110, NULL, 'DPRCP-Dep.to Controle Medição Metrologia', NULL, 5, 27),
(111, NULL, 'GCA-Director(a)', NULL, 5, 1),
(112, NULL, 'DIC-GA Marketing', NULL, 5, 30),
(113, NULL, 'DIC-Dep.to de Ciclo Comercial', NULL, 5, 30),
(114, NULL, 'DRC-ASC Beira', NULL, 3, 17),
(115, NULL, 'DRPM-Gabinete de Distribuição', NULL, 1, 22),
(116, NULL, 'DRN-ASC Lichinga', NULL, 4, 16),
(117, NULL, 'DRPM-Gabinete Planeamento e Estatistica', NULL, 1, 22),
(118, NULL, 'DRS-ASC Xai-Xai', NULL, 1, 15),
(119, NULL, 'DRN-ASC Pemba', NULL, 4, 16),
(120, NULL, 'DPRCP-Serviços de Apoio', NULL, 5, 27),
(121, NULL, 'DRC-ASC Tete', NULL, 3, 17),
(122, NULL, 'DRN - ASC Cuamba', NULL, 4, 16),
(123, NULL, 'DRN-ASC Angoche', NULL, 4, 16),
(124, NULL, 'GEPC-GA Provedoria ao Cliente', NULL, 5, 10),
(125, NULL, 'DRN - ASC Nacala', NULL, 4, 16),
(126, NULL, 'DRC-Gabinete de Distribuição', NULL, 3, 17),
(127, NULL, 'DRC-ASC Mocuba', NULL, 3, 17),
(128, NULL, 'DRN-Gabinete Planeamento e Estatistica', NULL, 4, 16),
(129, NULL, 'DGRH-Director(a)', NULL, 5, 23),
(130, NULL, 'DRN-Gabinete Serviços de Apoio', NULL, 4, 16),
(131, NULL, 'DOS-Serviços de Apoio', NULL, 5, 19),
(132, NULL, 'DRN-Gabinete Comercial', NULL, 4, 16),
(133, NULL, 'DRN-Gabinete de Distribuição', NULL, 4, 16),
(134, NULL, 'DRN - Director(a)', NULL, 4, 16),
(135, NULL, 'DPRCP-Director(a)', NULL, 5, 27),
(136, NULL, 'DRS-Director(a)', NULL, 1, 15),
(137, NULL, 'DID-Dep.to de Operação', NULL, 5, 12),
(138, NULL, 'DRCM-Director(a)', NULL, 1, 4),
(139, NULL, 'DRS-Gabinete Comercial', NULL, 1, 15),
(140, NULL, 'DRPM-Gabinete Comercial', NULL, 1, 22),
(141, NULL, 'DRCM-Gabinete Serviços de Apoio', NULL, 1, 4),
(142, NULL, 'DRC-ASC Caia', NULL, 3, 17),
(143, NULL, 'DOM-Director(a)', NULL, 5, 26),
(144, NULL, 'DRC-Gabinete Planeamento e Estatistica', NULL, 3, 17),
(145, NULL, 'DRC-Gabinete Serviços de Apoio', NULL, 3, 17),
(146, NULL, 'DFC-Director(a)', NULL, 5, 13),
(147, NULL, 'DID-Director(a)', NULL, 5, 12),
(148, NULL, 'DOS-Dep.to Planeamento Super. Manutenção', NULL, 5, 19),
(149, NULL, 'DIT-Director(a)', NULL, 1, 3),
(150, NULL, 'DIP-Director(a)', NULL, 1, 20),
(151, NULL, 'DRPM-Director(a)', NULL, 1, 22),
(152, NULL, 'DHSS-Dep.to Segurança no Trabalho', NULL, 5, 8),
(153, NULL, 'DRC-Director(a)', NULL, 3, 17),
(154, NULL, 'DIC-GA Processos e Tarifas', NULL, 5, 30),
(155, NULL, 'DRS-Gabinete Planeamento e Estatistica', NULL, 1, 15),
(156, NULL, 'DRCM-Gabinete Planeamento e Estatistica', NULL, 1, 4),
(157, NULL, 'ADMIN DCI - Subordinação Directa', NULL, 5, 34),
(158, NULL, 'DIC-Director(a)', NULL, 5, 30),
(159, NULL, 'DRCM-Gabinete de Distribuição', NULL, 1, 4),
(160, NULL, 'DRCM-Gabinete Comercial', NULL, 1, 4),
(161, NULL, 'GEPC-Director(a)', NULL, 1, 10),
(162, NULL, 'DIC-Dep.to de Grandes Clientes', NULL, 5, 30),
(163, NULL, 'DER-Dep Energias Renovaveis Fora Rede', NULL, 5, 24),
(164, NULL, 'DPSE-Serviços de Apoio', NULL, 5, 11),
(165, NULL, 'DRC-Gabinete Comercial', NULL, 3, 17);

-- --------------------------------------------------------

--
-- Table structure for table `situation`
--

DROP TABLE IF EXISTS `situation`;
CREATE TABLE IF NOT EXISTS `situation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `situation`
--

INSERT INTO `situation` (`id`, `created_at`, `name`, `updated_at`) VALUES
(2, NULL, 'Reforma', NULL),
(3, NULL, 'Falecimento', NULL),
(4, NULL, 'Recisão', NULL),
(5, NULL, 'Despedimento', NULL),
(6, NULL, 'Fim do Contrato', NULL),
(7, NULL, 'Reecontratar', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unidade_organica`
--

DROP TABLE IF EXISTS `unidade_organica`;
CREATE TABLE IF NOT EXISTS `unidade_organica` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `pelouro_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32o8ymxg8k92u6atpowy1yp55` (`pelouro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `unidade_organica`
--

INSERT INTO `unidade_organica` (`id`, `created_at`, `name`, `updated_at`, `pelouro_id`) VALUES
(1, NULL, 'GCA-Gab. do Conselho de Administração', NULL, 1),
(2, NULL, 'GCRI-Gab. Comunicao Relações Institucion', NULL, 1),
(3, NULL, 'DIT-Direcção de Transporte', NULL, 2),
(4, NULL, 'DRCM-Direcção Regional Cidade de Maputo', NULL, 3),
(5, NULL, 'GEDE-Gab. Estrategia Desemp. Empresarial', NULL, 1),
(6, NULL, 'DSG-Direcção de Serviços Gerais', NULL, 4),
(7, NULL, 'DACA-Academia da EDM', NULL, 5),
(8, NULL, 'DHSS-Higiene, Segurança e Saúde no Trab.', NULL, 5),
(9, NULL, 'DDN-Direcção de Desenvolvimento Negocios', NULL, 6),
(10, NULL, 'GEPC-Gab. Etica e Provedoria do Cliente', NULL, 1),
(11, NULL, 'DPSE-Planeamento Sistemas e Engenharia', NULL, 7),
(12, NULL, 'DID-Direcção de Distribuição', NULL, 3),
(13, NULL, 'DFC-Direcção de Finanças Corporativas', NULL, 4),
(14, NULL, 'GAJ-Gabinete Juridico', NULL, 1),
(15, NULL, 'DRS-Direcção Regional Sul', NULL, 3),
(16, NULL, 'DRN-Direcção Regional Norte', NULL, 3),
(17, NULL, 'DRC-Direcção Regional Centro', NULL, 3),
(18, NULL, 'DEP-Direcção Electrificação e Projectos', NULL, 7),
(19, NULL, 'DOS-Direcção de Operação de Sistemas', NULL, 2),
(20, NULL, 'DIP-Direcção de Produção', NULL, 2),
(21, NULL, 'GAR-Gab. Auditoria e Risco', NULL, 1),
(22, NULL, 'DRPM-Direcção Regional Província Maputo', NULL, 3),
(23, NULL, 'DGRH-Direcção Gestão de Recursos Humanos', NULL, 5),
(24, NULL, 'DER-Direcção de Energias Renováveies', NULL, 6),
(25, NULL, 'Pelouro de Recursos Humanos', NULL, 5),
(26, NULL, 'DOM-Direcção de Operação de Mercado', NULL, 6),
(27, NULL, 'DPRCP-Protecção Receitas Controle Perdas', NULL, 3),
(28, NULL, 'DTI-Direcção Tecnologias de Informação', NULL, 3),
(29, NULL, 'GIA-Gab. Inspenção Actividades', NULL, 1),
(30, NULL, 'DIC-Direcção Comercial', NULL, 3),
(31, NULL, 'DIA-Direcção de Aquisições', NULL, 7),
(32, NULL, 'Presidente do Conselho de Administração', NULL, 1),
(34, NULL, 'Pelouro de Distr. Comercial e Informatic', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int NOT NULL,
  `un` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `department_id`, `email`, `full_name`, `password`, `role`, `un`, `updated_at`) VALUES
(1, '2025-02-24 19:16:00.986000', 1, 'amina@edmmz.co.mz', 'Amina Aninha', '$2y$10$SkTRFO67KvrHAw14doMlXenAkLcv0difnZak.Rw1GT.iGMxW685Rm', 3, 'GCA-Gab. do Conselho de Administração', '2025-02-24 19:16:00.986000'),
(2, '2025-02-24 21:10:38.275000', 3, 'alice.tembe@edm.co.mz', 'Alice Tembe', '$2a$10$MpENe0EhdNK5hORjvtDSGOuP2O0otX5hKA9PAxbaXlb.kaNEG2Un.', 1, 'DIT-Direcção de Transporte', '2025-02-24 21:10:38.275000'),
(3, '2025-02-25 07:41:25.997000', 12, 'mariamo.simango@edm.co.mz', 'Mariamo Simango', '$2a$10$VVlzl6jWVwY9GS1C2IBsFeQoe1SwbTwPi5DXwPg2x1ZsucnUK8EdS', 1, 'DID-Direcção de Distribuição', '2025-02-25 07:41:25.997000'),
(53, '2025-02-27 09:46:28.367000', 23, 'Need.nhabomba@edm.co.mz', 'Need Nhabomba', '$2a$10$HSSHZQYOC0BqxsApOBsikOxKSdpvYsEdigAo7TIGMoyM1GbA1GGly', 1, 'DGRH-Direcção Gestão de Recursos Humanos', '2025-02-27 09:46:28.367000'),
(54, '2025-02-27 09:55:19.261000', 23, 'joao.matsimbe@edm.co.mz', 'Joao Severiano Caliche Matsimbe', '$2a$10$7NCCv9wy8bc8bDSKPpXA8erCwzPvRRhi7148RG1XYzuUXRoRfnl32', 1, 'DGRH-Direcção Gestão de Recursos Humanos', '2025-02-27 09:55:19.261000');

-- --------------------------------------------------------

--
-- Table structure for table `users_seq`
--

DROP TABLE IF EXISTS `users_seq`;
CREATE TABLE IF NOT EXISTS `users_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users_seq`
--

INSERT INTO `users_seq` (`next_val`) VALUES
(151);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `colaborador_dados_empresarias`
--
ALTER TABLE `colaborador_dados_empresarias`
  ADD CONSTRAINT `FK4ue1g2wrws1c4c3grplhyyam6` FOREIGN KEY (`unidade_organica_id`) REFERENCES `unidade_organica` (`id`),
  ADD CONSTRAINT `FK6cjbplagey7jj4dcylamrvknu` FOREIGN KEY (`colaborador_id`) REFERENCES `colaborador_dados_pessoais` (`id`),
  ADD CONSTRAINT `FKat8biox4aj3wxtmpqtv2ce6ax` FOREIGN KEY (`regiao_id`) REFERENCES `regiao` (`id`),
  ADD CONSTRAINT `FKfmeilqyffdmdwthj7ii8epco5` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`),
  ADD CONSTRAINT `FKhu62h6m3i8h3cmvuep3514b85` FOREIGN KEY (`employee_id`) REFERENCES `colaborador_dados_pessoais` (`id`),
  ADD CONSTRAINT `FKlmi2drcu962a6cdb13yqlatmi` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `FKmtkhfke7x2ibandwqukh23d3q` FOREIGN KEY (`nivel_id`) REFERENCES `nivel` (`id`),
  ADD CONSTRAINT `FKn6g4mmfle0mxmxnmfs47sh79r` FOREIGN KEY (`situacao_id`) REFERENCES `situation` (`id`),
  ADD CONSTRAINT `FKqkulhxkmehacsv5vxdqtp4rj9` FOREIGN KEY (`pelouro_id`) REFERENCES `pelouro` (`id`),
  ADD CONSTRAINT `FKrv3x6dw5yme29u8p6dvh0kon0` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`id`);

--
-- Constraints for table `colaborador_documentos`
--
ALTER TABLE `colaborador_documentos`
  ADD CONSTRAINT `FK5ypw35m7r9m4wl2qdnckgpg1c` FOREIGN KEY (`colaborador_id`) REFERENCES `colaborador_dados_pessoais` (`id`),
  ADD CONSTRAINT `FKc2ulliaipuw6732iwrj46g5s9` FOREIGN KEY (`employee_id`) REFERENCES `colaborador_dados_pessoais` (`id`);

--
-- Constraints for table `colaborador_removidos`
--
ALTER TABLE `colaborador_removidos`
  ADD CONSTRAINT `FKisfkycs6ypipr4qay9xrpjykh` FOREIGN KEY (`employee_id`) REFERENCES `colaborador_dados_pessoais` (`id`);

--
-- Constraints for table `desempenho`
--
ALTER TABLE `desempenho`
  ADD CONSTRAINT `FK1clgpp8s0hieo2vgxx8q1toel` FOREIGN KEY (`employee_id`) REFERENCES `colaborador_dados_pessoais` (`id`);

--
-- Constraints for table `employment_history`
--
ALTER TABLE `employment_history`
  ADD CONSTRAINT `FKlq4l3g2ciem4896q3t9not4xu` FOREIGN KEY (`employee_id`) REFERENCES `colaborador_dados_pessoais` (`id`);

--
-- Constraints for table `fundos_alocados`
--
ALTER TABLE `fundos_alocados`
  ADD CONSTRAINT `FKk1hh1wwj2ygq2o0egqfy0s8wa` FOREIGN KEY (`unidade_organica_id`) REFERENCES `unidade_organica` (`id`);

--
-- Constraints for table `gestao_asseduidade`
--
ALTER TABLE `gestao_asseduidade`
  ADD CONSTRAINT `FKcik6iawd4lsf1q4r97seq8jlx` FOREIGN KEY (`colaborador_id`) REFERENCES `colaborador_dados_pessoais` (`id`),
  ADD CONSTRAINT `FKkgtqsloji6978eogk1fko9jnu` FOREIGN KEY (`employee_id`) REFERENCES `colaborador_dados_pessoais` (`id`);

--
-- Constraints for table `pelouro`
--
ALTER TABLE `pelouro`
  ADD CONSTRAINT `FKpg8vdo087kj4cl3r1xlsj07f2` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`);

--
-- Constraints for table `sector`
--
ALTER TABLE `sector`
  ADD CONSTRAINT `FK540ynq3xfc49h2jtjxh9irhm3` FOREIGN KEY (`uni_org_id`) REFERENCES `unidade_organica` (`id`),
  ADD CONSTRAINT `FKdo6s4qbsxf4sjshpipd9v12c9` FOREIGN KEY (`regiao_id`) REFERENCES `regiao` (`id`);

--
-- Constraints for table `unidade_organica`
--
ALTER TABLE `unidade_organica`
  ADD CONSTRAINT `FK32o8ymxg8k92u6atpowy1yp55` FOREIGN KEY (`pelouro_id`) REFERENCES `pelouro` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
