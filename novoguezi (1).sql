-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 18, 2026 at 06:30 PM
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
-- Database: `novoguezi`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
CREATE TABLE IF NOT EXISTS `areas` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
CREATE TABLE IF NOT EXISTS `attendances` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `worker_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendances_worker_id_foreign` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `worker_id`, `start_date`, `end_date`, `status`, `reason`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 5, '2026-01-13', '2026-01-14', 'Dispensa', 'hshdfsd pesssoais', NULL, '2026-01-12 16:12:51', '2026-01-12 16:12:51'),
(2, 7, '2026-03-16', '2026-03-16', 'Presente', 'esta presente', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/attendance_files/7/kgSnCNjEnxif6VPfG2HbRkFKimbHuN16JJzFl2tV.docx', '2026-03-16 08:47:51', '2026-03-16 08:47:51'),
(3, 7, '2026-03-16', '2026-03-16', 'Presente', 'esta presente', '/storage/attendance_files/7/GzCSa4Q7Y4JakIafHvLB7xAoGszpO5Qh6UChGW6v.docx', '2026-03-16 08:47:52', '2026-03-16 08:47:52'),
(4, 12, '2026-03-17', NULL, 'Presente', NULL, NULL, '2026-03-17 17:58:05', '2026-03-17 17:58:05'),
(5, 13, '2026-03-17', NULL, 'Presente', NULL, NULL, '2026-03-17 19:34:28', '2026-03-17 19:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
CREATE TABLE IF NOT EXISTS `contracts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `worker_id` bigint UNSIGNED NOT NULL,
  `contract_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_worker_id_foreign` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `worker_id`, `contract_type`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Certo', '2026-01-06', '2026-01-07', 'expirado', '2026-01-11 15:45:08', '2026-01-11 15:45:08'),
(4, 2, 'Indeterminado', '2025-12-30', '2026-02-06', 'ativo', '2026-01-12 14:24:36', '2026-01-12 14:24:36'),
(5, 5, 'Incerto', '2025-12-28', '2026-01-29', 'ativo', '2026-01-12 14:30:33', '2026-01-12 14:30:33'),
(7, 7, 'Incerto', '2026-01-22', '2026-01-14', 'ativo', '2026-01-12 17:11:42', '2026-01-12 17:11:42'),
(10, 10, 'Certo', '2025-02-10', '2026-02-09', 'ativo', '2026-01-13 07:24:44', '2026-01-13 07:24:44'),
(11, 11, 'Certo', '2026-02-10', '2026-08-09', 'ativo', '2026-03-17 04:48:10', '2026-03-17 04:48:10'),
(12, 12, 'Certo', '2026-01-05', '2026-12-18', 'ativo', '2026-03-17 08:07:26', '2026-03-17 08:07:26'),
(13, 13, 'Certo', '2026-01-17', '2026-11-11', 'ativo', '2026-03-17 09:51:50', '2026-03-17 09:51:50'),
(14, 14, 'Certo', '2026-03-11', '2026-03-11', 'expirado', '2026-03-17 17:09:45', '2026-03-17 17:09:45'),
(15, 14, 'Certo', '2026-03-11', '2026-03-11', 'expirado', '2026-03-17 17:10:58', '2026-03-17 17:10:58'),
(16, 14, 'Certo', '2026-01-01', '2026-07-31', 'ativo', '2026-03-17 18:30:14', '2026-03-17 18:30:14'),
(17, 14, 'Certo', '2026-01-01T00:00:00.000000Z', '2026-07-31T00:00:00.000000Z', 'ativo', '2026-03-17 18:34:00', '2026-03-17 18:34:00'),
(18, 14, 'Certo', '2026-01-01T00:00:00.000000Z', '2026-07-31T00:00:00.000000Z', 'ativo', '2026-03-18 03:01:57', '2026-03-18 03:01:57'),
(19, 15, 'Certo', '2026-01-02', '2026-12-31', 'ativo', '2026-03-18 05:06:38', '2026-03-18 05:06:38'),
(20, 16, 'Certo', '2026-01-01', '2026-12-31', 'ativo', '2026-03-18 07:22:57', '2026-03-18 07:22:57'),
(21, 16, 'Certo', '2026-01-01T00:00:00.000000Z', '2026-12-31T00:00:00.000000Z', 'ativo', '2026-03-18 07:27:02', '2026-03-18 07:27:02'),
(22, 16, 'Certo', '2026-01-01T00:00:00.000000Z', '2026-12-31T00:00:00.000000Z', 'ativo', '2026-03-18 08:48:36', '2026-03-18 08:48:36'),
(23, 16, 'Certo', '2026-01-01T00:00:00.000000Z', '2026-12-31T00:00:00.000000Z', 'ativo', '2026-03-18 08:53:43', '2026-03-18 08:53:43'),
(24, 16, 'Certo', '2026-01-01T00:00:00.000000Z', '2026-12-31T00:00:00.000000Z', 'ativo', '2026-03-18 08:54:15', '2026-03-18 08:54:15'),
(25, 17, 'Certo', '2026-01-01', '2026-01-12', 'expirado', '2026-03-18 11:42:50', '2026-03-18 11:42:50'),
(26, 19, 'Certo', '2026-01-01', '2026-12-12', 'ativo', '2026-03-18 12:03:01', '2026-03-18 12:03:01'),
(27, 19, 'Certo', '2026-01-01T00:00:00.000000Z', '2026-12-12T00:00:00.000000Z', 'ativo', '2026-03-18 12:27:01', '2026-03-18 12:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidade_organica_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `departamentos_unidade_organica_id_foreign` (`unidade_organica_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id`, `name`, `unidade_organica_id`, `created_at`, `updated_at`) VALUES
(1, 'Departamento de Segurança no Trabalho', 20, NULL, NULL),
(2, 'Departamento de  Serviço ao Cliente Interno', 19, NULL, NULL),
(4, 'Departamento de Serviços Partilhados\r\n', 19, NULL, NULL),
(5, 'Departamento de Politica  e Desenvolvimento de Genero\r\n', 19, NULL, NULL),
(6, 'Departamento de Saúde Ocupacional\r\n', 20, NULL, NULL),
(7, 'Serviço de Apoio\r\n', 20, NULL, NULL),
(8, 'Departamento de Formação e Desenvolvimento\r\n', 21, NULL, NULL),
(9, 'Departamento de Gestão do Conhecimento\r\n', 21, NULL, NULL),
(10, 'Serviço de Apoio\r\n', 21, NULL, NULL),
(11, 'Serviço Apoio', 3, NULL, NULL),
(12, 'Grupo de Actividade, Estratégias e Inovação\r\n', 3, NULL, NULL),
(13, 'Planeamento Corporativo e Estatística\r\n', 3, NULL, NULL),
(14, '\r\nDepartamento de Risco', 9, NULL, NULL),
(15, 'Departamento de Auditoria Interna\r\n', 9, NULL, NULL),
(16, 'Serviço de Apoio\r\n', 19, NULL, NULL),
(17, 'Gabinete Direcção\r\n\r\n', 7, NULL, NULL),
(18, 'Inspensao Administrativa', 60, NULL, NULL),
(19, 'Coordenação Norte', 7, NULL, NULL),
(20, 'Coordenação Centro', 7, NULL, NULL),
(21, ' Coordenação Sul', 7, NULL, NULL),
(22, 'Coordenação Cidade de Maputo', 7, NULL, NULL),
(23, 'Coordenação Sede', 7, NULL, NULL),
(24, 'Serviço de Apoio', 7, NULL, NULL),
(25, 'Serviço de Apoio\r\n', 4, NULL, NULL),
(26, 'Departamento de Provedoria ao Cliente e Conformidade\r\n', 4, NULL, NULL),
(27, 'Departamento Conformidade\r\n', 4, NULL, NULL),
(28, 'Departamento de Comunicação', 5, NULL, NULL),
(29, 'Departamento de  relações públicas e enventos\r\n', 5, NULL, NULL),
(31, 'Serviço de Apoio\r\n', 5, NULL, NULL),
(32, 'Inspensao Operacional\r\n', 60, NULL, NULL),
(33, 'Serviço de Apoio', 60, NULL, NULL),
(34, 'Departamento de Contas a Pagar', 13, NULL, NULL),
(35, 'Departamento de Contas a Receber\r\n', 13, NULL, NULL),
(36, 'Departamento Tesouraria \r\n', 13, NULL, NULL),
(37, 'Departamento Planificação Financeira e Orçamento \r\n', 13, NULL, NULL),
(38, 'Departamento de Contabilidade\r\n', 13, NULL, NULL),
(39, 'Serviço de Apoio', 13, NULL, NULL),
(40, 'Departamento de Logistica', 14, NULL, NULL),
(41, 'Departamento de Patrimonio\r\n', 14, NULL, NULL),
(42, 'Serviço de Apoio', 14, NULL, NULL),
(44, 'Departamento de Analise e Desenvolvimento\r\n', 12, NULL, NULL),
(45, 'Departamento de Procurement\r\n', 12, NULL, NULL),
(46, 'Servico de Apoio\r\n', 12, NULL, NULL),
(47, 'Departamento  de Planeamento de Sistemas\r\n', 10, NULL, NULL),
(48, 'Departamento de Qualidade e Planeamento Ambiental\r\n', 10, NULL, NULL),
(49, 'Departamento de Engenharia\r\n', 10, NULL, NULL),
(50, 'Serviço de Apoio', 10, NULL, NULL),
(51, 'Grupo de Actividade Gestão de Projectos', 11, NULL, NULL),
(52, 'Grupo de Actividade  Monitoria, IMS Mobilização Fundos\r\n', 11, NULL, NULL),
(53, 'Serviço de Apoio', 11, NULL, NULL),
(54, 'Departamento Activos de Engenharia', 6, NULL, NULL),
(55, 'Departamento de  Proteções e Controle\r\n', 6, NULL, NULL),
(56, 'Departamento de  Telecomunicações e SCADA\r\n', 6, NULL, NULL),
(57, 'Serviço de Apoio', 6, NULL, NULL),
(59, 'Gabinete Tecnico', 2, NULL, NULL),
(60, 'Seviço de Apoio', 2, NULL, NULL),
(61, 'Departamento de Operação do Sistema\r\n', 8, NULL, NULL),
(62, 'Departamento de Planeiamento Supervisão de Manutenção\r\n\r\n', 8, NULL, NULL),
(63, 'Centro Nacional de Despacho\r\n', 8, NULL, NULL),
(64, 'Centro Nacional de Despacho\r\n', 8, NULL, NULL),
(65, 'Centro de Controle de Distribuição\r\n', 8, NULL, NULL),
(66, 'Departamento de  Energias Renovaveis Fora da  Rede\r\n', 15, NULL, NULL),
(67, 'Departamento de  Energias Renovaveis Dentro da Rede\r\n', 15, NULL, NULL),
(68, 'Serviço de Apoio\r\n', 15, NULL, NULL),
(69, 'Departamento de Redes Corporativas e Equipamento', 24, NULL, NULL),
(70, 'Derpartamento de Centro de Dados e Ciber Segurança\r\n', 24, NULL, NULL),
(71, 'Departamento de Redes Corporativas e Equipamento\r\n', 24, NULL, NULL),
(72, 'Grupo de Actividades Service Desk\r\n', 24, NULL, NULL),
(73, 'Serviço de Apoio\r\n', 24, NULL, NULL),
(74, 'Grupo de Actividades de Estratégia e Programa\r\n', 24, NULL, NULL),
(75, 'Departamento de Sistemas Informação  Geográfica\r\n', 25, NULL, NULL),
(76, 'Departamento de  Prevenção , Vandalização  de Infraestrutura de Equipamento Electrico\r\n', 25, NULL, NULL),
(77, 'Departamento de  Controle de Medição e Metrologia\r\n', 25, NULL, NULL),
(78, 'Departamento de  Serviços técnicos Comerciais\r\n', 25, NULL, NULL),
(79, 'Serviço de Apoio\r\n', 25, NULL, NULL),
(80, 'Departamento de Serviço ao Cliente', 23, NULL, NULL),
(81, 'Departamento de Grandes Cliente \r\n', 23, NULL, NULL),
(82, 'Grupo Actividades de Marketing\r\n', 23, NULL, NULL),
(83, 'Gabinete de Actividades de Politicas e Procedimentos\r\n', 23, NULL, NULL),
(84, 'Departamento Planeamento de Infraestrutura\r\n', 22, NULL, NULL),
(85, 'Departamento de Manutenção \r\n', 22, NULL, NULL),
(86, 'Departamento de Efeciencia Energetica\r\n', 22, NULL, NULL),
(87, 'Departamento de Operações\r\n', 22, NULL, NULL),
(88, 'Departamento de Subestações\r\n', 22, NULL, NULL),
(89, 'Serviço de Apoio', 22, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `worker_id` bigint UNSIGNED NOT NULL,
  `nuit_document_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_document_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education_certificate_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cv_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_certifications_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_worker_id_foreign` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `worker_id`, `nuit_document_url`, `identity_document_url`, `education_certificate_url`, `cv_url`, `other_certifications_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/1/0A9Tsass9FuuvGcIhO0qzSvXqVB1OES29seT51V4.png', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/1/vAplt0DIBsiLhjX533MQE2jh9QtssGDnzJI6K2lV.png', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/1/gWeViyd6VRSRR0JsCo5mZ4nEZV51U6qavkZ78cCJ.png', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/1/gGsqV5xzsJuaUqD3BoOOQlK6TcB6myiB2AG0YJF1.png', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/1/HD6viGbZptinjvvJkLKTO6fe14iIwmidLTSv0rNu.png', '2026-01-11 15:45:42', '2026-01-11 15:45:42', NULL),
(4, 2, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/2/feVxmrmejqHKnx4sq3hIN0DFizG1YqLl2IMrUhHl.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/2/SRAm0mAdMoJi8gf89fHydgVJP8oTq6Osmvbe3UYD.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/2/N5bwPYGWizEAaeW39dU3eMvR8pLSBoMQrfzvUGAA.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/2/73g1a7AE5LUWOPdXdlieuk8vHOHM7gWrUZlBOi7O.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/2/oRhsy5PQ1qTpdoAMRdfekMgGPcCdkoRm3U3IGiQ9.pdf', '2026-01-12 14:25:33', '2026-01-12 14:25:33', NULL),
(5, 5, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/5/0JAsr2QZsxa8C7V0utUvb9Rgd7pCaI3OICJFdePk.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/5/Fom9ty64h6Bw99jRO18mnKsV8lc8RQFyctQcmCgG.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/5/HEC92464qrtuB8s6qEBZ2hCyAbZmab2eoGWUrK7Z.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/5/PRMa7onCnjsERPTZ9cXVpg1PyouZRXM2Y5IXApjC.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/5/3u4Xe2thY8P95V4U4DchCeGTM6YWSps68uPJKfmO.pdf', '2026-01-12 14:31:03', '2026-01-12 14:31:03', NULL),
(7, 7, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/7/RcIsYMJpEPt3UqR8bKwUuZ3iYkSYKjfVjCBuN8FD.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/7/BDCkxqfPGhrrgtkpkPM5FihO6dEsrO5aSWNjhD1S.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/7/CmEr2BWVdOunwpTkGvqpC5spWnExWn0ZhLb3LgQR.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/7/gNY3slRgdrejXSvVbQSD5xNe24lf9dQ8nA36Cdaj.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/7/5ktiJVYOy6hYCLlMb2R48XMspcifnybzN8RbGzsQ.pdf', '2026-01-12 17:12:40', '2026-01-12 17:12:40', NULL),
(10, 10, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/10/T7nJ79XHTWO6dTCZtFP4G0YRstChK604MVLQPZwN.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/10/Lg8rruJbsKElknaQrdL3miGaJxWx6YU7rHsKDYDk.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/10/HUmDwgZbivQVQna3nwJ7y7eeKwg6IAFmt6hacyov.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/10/0ufISRFcVAThdlDL1kuoWJKQQRvRQrfLA4KBMZUI.pdf', NULL, '2026-01-13 07:30:32', '2026-01-13 07:30:32', NULL),
(11, 11, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/11/xsA7eR0FRWPKtNShL0t1hVjpktzRcdMWnUOrc9dR.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/11/DN1dJHkyGG12niGQ6gZacOEWrUZPCZlqDUV8hca3.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/11/vmQuxyAAgm2V7T0NL5F8bpdnd7ClypRWmwg5pHQB.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/11/wdXkM3Yq5RQPyKz7HoXYo9LgaHUHrlUl1pToSFeU.pdf', NULL, '2026-03-17 04:56:24', '2026-03-17 04:56:24', NULL),
(12, 12, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/12/ppEL7OC42EH0td0jK8zFkG5CZocyWPoCtqW83DL8.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/12/GlmZeniUDlztHH3o6VrV30QafmZuB1Sqm9ANmOWh.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/12/dUOwEozMEMawo8wOwecOMlBDgRz3BcAmwfjOi5Ki.pdf', NULL, NULL, '2026-03-17 08:09:39', '2026-03-17 08:09:39', NULL),
(13, 13, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/13/n3SALJLS8cr0sPycb0QsIa4SV7WtgBGsgdmHMvio.docx', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/13/lw3vboTxTAJI2Q6lkqN9C33SoIKMYijwarxQAUbo.docx', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/13/jEOEuFByNHiYsZiZ1E2EIwtMTR1ybm2XVTigd6xv.docx', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/13/b4sde87F1VwMDKyaC0JiR8PqcX4RX1irIp4fGUxs.docx', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/13/C3RnVjyNIXKqjnugeb2UvUhMpChlsZbYUyAK8geL.docx', '2026-03-17 09:52:36', '2026-03-17 09:52:36', NULL),
(14, 14, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/14/w3Og0ZAcmAvErA5j8O5tF3759PZzl5Jaa9bfAAzK.docx', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/14/15QV9XojBRpUE0EOgJvXPvc1V8b1bCKvbpkMVOD8.docx', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/14/hwHa6HAqPxtaAISg3IE8tpad8yG7EgiXaQTXbFRM.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/14/gGTOHZAEsNp02SC5WU4AaSP33lTpy1Cj5WEEG1BF.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/14/Rsie4DDHAKIpaqDWITMWwuJk7DL1zNqFbdsxB1FF.docx', '2026-03-17 17:12:43', '2026-03-17 18:35:02', NULL),
(15, 15, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/15/Coa3Bm9vM9WPezKINlcoryr3F7ksIyc4CeEj2f6h.docx', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/15/cC2wx5a7imIE7B1RmYL3hzwJJXhTSxfJKqAWupmd.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/15/K7ONNbAIX75AKx22yAkFTymlm5nUOcPY9xo1yow0.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/15/P3sPqVTWhkEtPCFeWjqUmNC7pmPvtcrQNFMnmTlx.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/15/OF8UuS6UjxSailKtMIclV3ar2wlGi4l2tQQ36G0v.pdf', '2026-03-18 05:07:43', '2026-03-18 05:07:44', NULL),
(16, 16, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/16/dHkKk2uV6FAqgyHZPL77KOiUQmroWdozYNIif0Ft.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/16/MfJtqQ2eWqTPnQJ5f7PbiriqB5sgH4zTiaHipktz.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/16/Y4Maiz9rG6pm22InnRLpEDMezvXgGmb11bZaU1G7.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/16/hmMVf9DR5zqgeXSiA4IqyCxgqVXkWcz6AJS1CCKz.pdf', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/16/xJcDdonlmOMusbD8Rq6bB5NjamAO9VcXRcJ7Z1hB.pdf', '2026-03-18 07:23:51', '2026-03-18 07:23:52', NULL),
(17, 17, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/17/2MvTFt7cTLzG9VK9cT8DKkiJiFTC2dUqBer9gopG.csv', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/17/lwyDDrkqZWYEIZ8hn5a5tO93ssjFJdOCPIazT2sD.csv', NULL, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/17/C4jpas1ejPg2QKBu88lo8tM4rxBtLvWbAnP6FuKa.csv', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/17/8SGVOk1Ljoh7TNzTUAdg8ct4y5J9L1YEyEqWltm1.csv', '2026-03-18 11:44:27', '2026-03-18 11:44:27', NULL),
(18, 19, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/19/QWzljK4ZRYjjVKQIlyZj2hWx9qXsc8qVnLOTAm4d.csv', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/19/W1EHGpshuGTrhpMXQPJ91CTs33bxmIypJTiMxPNA.csv', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/19/28pmC9nv0z7GQ2q8Fqh58OTyxFBfA10dHh45OJs8.csv', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/19/ebV0bqQHjFjbbGmg7NmKmR5Ovk0l99VV5OZm3h1c.csv', 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_documents/19/NOOkSp1yOh3lB30KPahUJmNXtQ3ddSdnK1bfj060.csv', '2026-03-18 12:04:30', '2026-03-18 12:04:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fundo_alocados`
--

DROP TABLE IF EXISTS `fundo_alocados`;
CREATE TABLE IF NOT EXISTS `fundo_alocados` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `unidade_organica_id` bigint UNSIGNED NOT NULL,
  `valor_alocado` decimal(15,2) NOT NULL,
  `total_salarios_pagos` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fundo_alocados_unidade_organica_id_foreign` (`unidade_organica_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fundo_alocados`
--

INSERT INTO `fundo_alocados` (`id`, `unidade_organica_id`, `valor_alocado`, `total_salarios_pagos`, `created_at`, `updated_at`) VALUES
(1, 1, '1000.00', '10.00', NULL, NULL),
(2, 24, '50000.00', '50000.00', '2026-01-11 17:58:21', '2026-03-18 07:27:02'),
(3, 54, '200000.00', '0.00', '2026-01-11 19:27:51', '2026-01-11 19:27:51'),
(4, 19, '9527999.74', '481000.26', '2026-01-12 04:58:26', '2026-03-18 12:27:01'),
(5, 9, '515000.00', '485000.00', '2026-01-12 16:53:33', '2026-03-17 18:34:00'),
(6, 3, '100000.00', '0.00', '2026-01-12 17:29:24', '2026-01-12 17:29:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_01_09_095403_create_workers_table', 1),
(6, '2026_01_09_095438_create_worker_company_data_table', 1),
(7, '2026_01_09_095452_create_documents_table', 1),
(8, '2026_01_09_095614_create_worker_steps_table', 1),
(9, '2026_01_09_115703_create_attendances_table', 1),
(10, '2026_01_09_122452_create_contracts_table', 1),
(11, '2026_01_09_124529_create_worker_perfomances_table', 1),
(12, '2026_01_09_130723_create_removed_workers_table', 1),
(13, '2026_01_11_095922_create_areas_table', 1),
(14, '2026_01_11_095933_create_regiaos_table', 1),
(15, '2026_01_11_095945_create_pelouros_table', 1),
(16, '2026_01_11_095954_create_unidade_organicas_table', 1),
(17, '2026_01_11_100009_create_departamentos_table', 1),
(18, '2026_01_11_105042_create_fundo_alocados_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelouros`
--

DROP TABLE IF EXISTS `pelouros`;
CREATE TABLE IF NOT EXISTS `pelouros` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelouros`
--

INSERT INTO `pelouros` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'PCA', NULL, NULL),
(2, 'Produção e Transporte', NULL, NULL),
(3, 'Distribuição Comercial e Informatica', NULL, NULL),
(4, 'Finanças', NULL, NULL),
(5, 'Recursos Humanos', NULL, NULL),
(6, 'Desenvolvimento de Negócio', NULL, NULL),
(7, 'Eletrificação', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regiaos`
--

DROP TABLE IF EXISTS `regiaos`;
CREATE TABLE IF NOT EXISTS `regiaos` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regiaos`
--

INSERT INTO `regiaos` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'SEDE', NULL, NULL),
(2, 'SUL', NULL, NULL),
(3, 'NORTE', NULL, NULL),
(4, 'CENTRO E NORTE', NULL, NULL),
(5, 'CENTRO', NULL, NULL),
(6, 'CIDADE DE MAPUTO', NULL, NULL),
(7, 'MAPUTO PROVINCIA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `removed_workers`
--

DROP TABLE IF EXISTS `removed_workers`;
CREATE TABLE IF NOT EXISTS `removed_workers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `worker_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `attachament` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `who` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `removed_workers_worker_id_foreign` (`worker_id`),
  KEY `removed_workers_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `removed_workers`
--

INSERT INTO `removed_workers` (`id`, `worker_id`, `user_id`, `attachament`, `reason`, `who`, `created_at`, `updated_at`) VALUES
(3, 2, 1, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/removed_workers/2/2G2KaF35PLfZparNH2omWyWTsrvF5yYcU210Kqc1.pdf', 'Recisão', 'System', '2026-01-13 07:19:03', '2026-01-13 07:19:03'),
(6, 10, 5, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/removed_workers/10/Dl7MTz9aytPeU8dqsnkexxpUkwSB9x4GqEjLxXDQ.pdf', 'Fim do Contrato', 'System', '2026-03-17 04:39:18', '2026-03-17 04:39:18'),
(7, 11, 1, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/removed_workers/11/16J3RY5ItQ22iGOrKt7MVlfY99yJ0fvl5JzocYiA.docx', 'Fim do Contrato', 'System', '2026-03-17 19:33:44', '2026-03-17 19:33:44');

-- --------------------------------------------------------

--
-- Table structure for table `unidade_organicas`
--

DROP TABLE IF EXISTS `unidade_organicas`;
CREATE TABLE IF NOT EXISTS `unidade_organicas` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pelouro_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidade_organicas_pelouro_id_foreign` (`pelouro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unidade_organicas`
--

INSERT INTO `unidade_organicas` (`id`, `name`, `pelouro_id`, `created_at`, `updated_at`) VALUES
(1, 'GCA-Gab. do Conselho de Administração', 1, NULL, NULL),
(2, 'DIP-Direcção de Produção', 2, NULL, NULL),
(3, 'GEDE-Gabinete de Estrategia Desempenho Empresarial', 1, NULL, NULL),
(4, 'GEPC Gabinete de Ética e Provedoria do Cliente', 1, NULL, NULL),
(5, 'GABINETE DE COMUNICAÇÃO E RELAÇÕES INSTITUCIONAIS', 1, NULL, NULL),
(6, 'DIT-Direcção de Transporte', 2, NULL, NULL),
(7, 'GAJ-Gabinete Jurídico', 1, NULL, NULL),
(8, 'DOS-Direcção de Operação de Sistemas', 2, NULL, NULL),
(9, 'GAR-Gabinete de Auditoria e Risco', 1, NULL, NULL),
(10, 'DPSE-Planeamento Sistemas e Engenharia', 7, NULL, NULL),
(11, 'DEP-Direcção de Electrificação e Projectos', 7, NULL, NULL),
(12, 'DIA-Direcção de Aquisições', 7, NULL, NULL),
(13, 'DFC-Direcção de Finanças Corporativas', 4, NULL, NULL),
(14, 'DSG-Direcção de Serviços Gerais', 4, NULL, NULL),
(15, 'DER-Direcção de Energias Renováveies', 6, NULL, NULL),
(17, 'DDN-Direcção de Desenvolvimento Negocios', 6, NULL, NULL),
(18, 'DOM-Direcção de Operação de Mercado', 6, NULL, NULL),
(19, 'DGRH-Direcção de Gestão de Recursos Humanos', 5, NULL, NULL),
(20, 'DHSST-Direcção de Higiene, Segurança e Saúde no Trabalho', 5, NULL, NULL),
(21, 'DACA-Direcção Academia da EDM', 5, NULL, NULL),
(22, 'DID-Direcção de Distribuição', 3, NULL, NULL),
(23, 'DIC-Direcção Comercial', 3, NULL, NULL),
(24, 'Direcção de Tecnologias de Informação', 3, NULL, NULL),
(25, 'DPRCP-Direcção de Protecção de Receita e Controle de Perdas', 3, NULL, NULL),
(26, 'ASC-Area de serviço ao Cliente de Boane', 3, NULL, NULL),
(27, 'Direcção Regional Sul', 3, NULL, NULL),
(28, 'ASC- Area de Serviço ao Cliente de Infulene', 3, NULL, NULL),
(29, 'ASC- Area de Serviço ao Cliente da Matola', 3, NULL, NULL),
(30, 'Direcção Regional Centro', 3, NULL, NULL),
(31, 'ASC-Area de serviço ao Cliente de Chókwe', 3, NULL, NULL),
(32, 'ASC-Area de serviço ao Cliente de Xai-Xai', 3, NULL, NULL),
(33, 'ASC-Area de serviço ao Cliente de Inhambane', 3, NULL, NULL),
(34, 'ASC-Area de serviço ao Cliente de Tete', 3, NULL, NULL),
(35, 'ASC-Area de serviço ao Cliente de Quelimane', 3, NULL, NULL),
(36, 'ASC-Area de serviço ao Cliente da Beira', 3, NULL, NULL),
(37, 'ASC-Area de serviço ao Cliente de Lichinga', 3, NULL, NULL),
(38, 'ASC-Area de serviço ao Cliente de Pemba', 3, NULL, NULL),
(39, 'ASC-Area de serviço ao Cliente de Nampula', 3, NULL, NULL),
(40, 'Direcção Regional Norte', 3, NULL, NULL),
(41, 'ASC-Area de serviço ao Cliente de Mocuba', 3, NULL, NULL),
(42, 'ASC-Area de serviço ao Cliente de Caia', 3, NULL, NULL),
(43, 'ASC-Area de serviço ao Cliente de Cuamba', 3, NULL, NULL),
(44, 'ASC-Area de serviço ao Cliente de Nacala', 3, NULL, NULL),
(45, 'ASC-Area de serviço ao Cliente de Angoche', 3, NULL, NULL),
(46, 'ASC-Area de serviço ao Cliente de Chimoio', 3, NULL, NULL),
(47, 'ASC-Area de serviço ao Cliente de Vilanculos', 3, NULL, NULL),
(48, 'ASC-Area de serviço ao Cliente de Machava', 3, NULL, NULL),
(49, 'ASC-Area de serviço ao Cliente de Kamaxakeni', 3, NULL, NULL),
(50, 'ASC-Area de serviço ao Cliente Kamubucuane', 3, NULL, NULL),
(51, 'ASC-Area de serviço ao Cliente de Kamavota', 3, NULL, NULL),
(52, 'ASC-Area de serviço ao Cliente de Kaguava', 3, NULL, NULL),
(53, 'ASC-Area de serviço ao Cliente Kampfumu', 3, NULL, NULL),
(54, 'Divisão de Produção Sul', 2, NULL, NULL),
(55, 'Divisão de Produção Centro-Norte', 2, NULL, NULL),
(56, 'Divisão de Transporte Sul', 2, NULL, NULL),
(57, 'Divisão de Transporte Centro', 2, NULL, NULL),
(58, 'Divisão de Transporte Centro-Norte', 2, NULL, NULL),
(59, 'Divisão de Transporte Norte', 2, NULL, NULL),
(60, 'Gabinete de Inspecção de Actividades', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_organic` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `unit_organic`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Amina Uamusse', 'amina.uamusse@edm.co.mz', NULL, '$2y$10$XWPi6nqNYrUzQrUkAMfteeJj3Yc0FFkhTOTcYz062ztHREpAupPOW', 'admin', 'Unidade Organica B', NULL, '2026-01-11 15:02:59', '2026-01-11 16:29:28'),
(2, 'Normal Teste', 'normal@edm.co.mz', NULL, '$2y$10$XWPi6nqNYrUzQrUkAMfteeJj3Yc0FFkhTOTcYz062ztHREpAupPOW', 'admin', 'DGRH-Direcção de Gestão de Recursos Humanos', NULL, '2026-01-11 15:41:54', '2026-01-12 04:48:29'),
(3, 'Teste 2', 'teste.example@gmail.com', NULL, '$2y$10$XWPi6nqNYrUzQrUkAMfteeJj3Yc0FFkhTOTcYz062ztHREpAupPOW', 'admin', 'GEPC Gabinete de Ética e Provedoria do Cliente', NULL, '2026-01-12 14:02:10', '2026-01-12 14:02:10'),
(4, 'Merciana Alfiado', 'merciana.alfiado@edm.co.mz', NULL, '$2y$12$Yb5LKgdnviEfUVwEbPuImOebKGsPA36qjzrc/q4afDG8qxeGVuPjC', 'admin', 'Direcção de Tecnologias de Informação', NULL, '2026-03-16 07:49:38', '2026-03-16 07:49:38'),
(5, 'Need Nhabomba', 'need.nhabomba@edm.co.mz', NULL, '$2y$12$XK6c0qA7zqW21hrWyPwMH.WGYKvyHNbRN/7HKLpYq8El4QgNeNAka', 'admin', 'DGRH-Direcção de Gestão de Recursos Humanos', NULL, '2026-03-16 08:45:33', '2026-03-18 07:51:33'),
(6, 'Octavio Pechisso', 'octavio.pechisso@edm.co.mz', NULL, '$2y$12$dxxfJpoJeGMjlDrBEHMgruoNpGjj2/Ryf1anbtpE8UE5SnSE7vCE6', 'normal', 'DGRH-Direcção de Gestão de Recursos Humanos', NULL, '2026-03-17 07:33:20', '2026-03-17 07:33:20'),
(7, 'Alice Tembe', 'alice.tembe@edm.co.mz', NULL, '$2y$12$7y/wVQHNtQbZrmvbF2LsneQDIrK5SMTJOsdZYq8UF/AWx0KaoXF.u', 'normal', 'GAR-Gabinete de Auditoria e Risco', NULL, '2026-03-17 09:45:14', '2026-03-17 09:45:14');

-- --------------------------------------------------------

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
CREATE TABLE IF NOT EXISTS `workers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marital_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `neighborhood` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_box` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alternative_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_function` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nib_iban` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workers_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workers`
--

INSERT INTO `workers` (`id`, `full_name`, `date_of_birth`, `tax_number`, `gender`, `marital_status`, `document_type`, `document_number`, `province`, `district`, `address`, `neighborhood`, `postal_box`, `city`, `work_email`, `alternative_email`, `work_contact`, `alternative_contact`, `phone`, `job_function`, `bank`, `nib_iban`, `active`, `deleted`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrador', '2025-12-31', '1212', 'masculino', 'Casado(a)', 'Carta de Condução', '1212', 'inhambane', 'ds', 'fd', 'df', 'df', 'Maputo', 'maria@gmail.com', 'maria@gmail.com', NULL, '2323', '1212', 'dfdf', NULL, NULL, 1, 0, 2, '2026-01-11 15:43:12', '2026-01-11 15:43:12', NULL),
(2, 'Samuel Bute josé Chamusse', '2026-01-07', '163887347', 'masculino', 'Solteiro(a)', 'BI (Bilhete de Identidade)', '110101479009', 'maputo', 'Kampfumo', 'Dar es salaam', 'sommerchield', '1101', 'Maputo Cidade', 'chamusso@gmail.com', 'amina.uamusse@gmail.com', '+258829041476', '+258829041476', '865264971', 'Digitador', NULL, NULL, 1, 1, 2, '2026-01-12 04:54:29', '2026-01-13 07:19:03', NULL),
(5, 'Testando approve', '2026-01-07', '12012', 'masculino', 'Viúvo(a)', 'Carta de Condução', '1111111111111111S', 'manica', 'Kambukawana', 'Mozambique', 'sommerchield', '1009', 'Meesaid', 'amina.uamusse@gmail.com', 'amina.uamusse@gmail.com', NULL, '+258829041476', '+258878762326', 'Snr Developer II', NULL, NULL, 1, 0, 1, '2026-01-12 14:29:47', '2026-01-12 15:01:39', NULL),
(7, 'Mauro Muchanga', '2026-01-14', '123456667', 'masculino', 'Casado(a)', 'BI (Bilhete de Identidade)', '1111111111111111S', 'maputo', 'Matola', '23456789', 'Maputo', '1009', 'Meesaid', 'uamusse@gmail.com', 'uamusse@gmail.com', '+258829041476', '+258829041476', '+258878762326', 'Digitador', NULL, NULL, 1, 0, 1, '2026-01-12 16:49:37', '2026-01-12 17:08:45', NULL),
(10, 'Samuel Bute josé Chamusse', '2001-04-11', '163887347', 'masculino', 'Solteiro(a)', 'BI (Bilhete de Identidade)', '110101479009M', 'maputo', 'Kampfumo', 'Dar es salaam', 'sommerchield', '1101', 'Maputo Cidade', 'chamusse29@gmail.com', NULL, NULL, NULL, '865264971', 'Digitador', NULL, NULL, 1, 1, 2, '2026-01-13 07:23:46', '2026-03-17 04:39:17', NULL),
(11, 'Samuel Bute josé Chamusse', '2001-04-14', '163887347', 'masculino', 'Solteiro(a)', 'BI (Bilhete de Identidade)', '110101479009M', 'maputo', 'Kampfumo', 'Dar es salaam', 'sommerchield', '1101', 'Maputo Cidade', 'chamusse29@gmail.com', 'chamusse29@gmail.com', '+258865264971', '844724090', '+258865264971', 'Digitador', NULL, NULL, 1, 1, 5, '2026-03-17 04:45:33', '2026-03-17 19:33:44', NULL),
(12, 'Amina Graca', '1991-01-20', '1234567', 'masculino', 'Solteiro(a)', 'BI (Bilhete de Identidade)', '23456789', 'maputo', 'maptfa', 'matupo a', 'leje', '080808', 'mapiuto', 'aminagracaa@gmail.com', NULL, NULL, NULL, '845557222', 'caixa', NULL, NULL, 1, 0, 1, '2026-03-17 07:40:17', '2026-03-17 07:40:17', NULL),
(13, 'Mariamo Damiao', '1997-09-17', '23456789', 'feminino', 'Solteiro(a)', 'Passaporte', '23456789', 'maputo', '1234567', 'matupo a', 'zimepto', '345678', 'mapiuto', 'aminagracaa@gmail.com', NULL, NULL, NULL, '8765443', 'caixa', NULL, NULL, 1, 0, 7, '2026-03-17 09:50:42', '2026-03-17 19:24:12', NULL),
(14, 'malas de ferramentas', '2026-03-18', '1212', 'masculino', 'Divorciado(a)', 'BI (Bilhete de Identidade)', '3343434', 'niassa', 'ds', '123456789', 'ef', '0100', 'Maputo', 'maria.teste@gmail.com', 'maria.teste@gmail.com', '67676', '2323', '67676', 'Tester II', 'Absa Bank', '454545355553', 1, 0, 4, '2026-03-17 16:40:41', '2026-03-17 17:07:53', NULL),
(15, 'Maria da graca', '1977-07-08', '3434343', 'feminino', 'Solteiro(a)', 'BI (Bilhete de Identidade)', '24242656', 'maputo', 'Kampfumu', 'matupo a', 'zimepto', '345678', 'mapiuto', 'aminagracaa@gmail.com', 'aminagracaa@gmail.com', NULL, '843535353', '8765443', 'IT', 'Standard Bank', '12345678901234567890O', 1, 0, 1, '2026-03-18 05:01:46', '2026-03-18 05:01:46', NULL),
(16, 'Delma da tácia paulo Nhantumbo', '1994-11-18', '23456789', 'feminino', 'Solteiro(a)', 'BI (Bilhete de Identidade)', '23456789', 'maputo', 'kamatsolo', 'Matola gare', 'matola gare', '001003', 'Matola', 'delma.nhantumbo@edm.co.mz', 'aminagracaa@gmail.com', '845280895', NULL, '845280895', 'caixa', 'Millennium BIM', '000100000022492883957', 1, 0, 6, '2026-03-18 07:18:34', '2026-03-18 07:28:11', NULL),
(17, 'Rosa Mafume', '2004-02-10', '123456634567', 'feminino', 'Casado(a)', 'BI (Bilhete de Identidade)', '33434343456789', 'maputo', 'ds34567890', '123456789', 'df', '0100', 'Maputo', 'maria@gmail.com', 'maria@gmail.com', '67676', '2345678', '851231314', 'caixa', 'Access Bank', '12134425256626636666', 1, 0, 4, '2026-03-18 11:35:03', '2026-03-18 11:35:03', NULL),
(18, 'Maria joana', '2017-06-20', '1212', 'masculino', 'Casado(a)', 'Carta de Condução', '23456789', 'inhambane', 'ds', '123456789', '234567', '0100', 'Maputo', 'maria@gmail.com', 'maria@gmail.com', NULL, '2323', '+258851231314', 'Tester II', 'Absa Bank', '1234567899099887', 1, 0, 4, '2026-03-18 11:47:23', '2026-03-18 11:47:23', NULL),
(19, 'samuel bute', '2008-10-18', '1234567', 'masculino', 'Solteiro(a)', 'Carta de Condução', '2345678', 'gaza', 'ds', 'retrgf', 'wertyu', '234567', 'Maputo', 'maria@gmail.com', 'maria@gmail.com', NULL, NULL, '+258851231314', 'Tester II', 'UBA', '1234567890', 1, 0, 6, '2026-03-18 11:59:59', '2026-03-18 12:07:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `worker_company_data`
--

DROP TABLE IF EXISTS `worker_company_data`;
CREATE TABLE IF NOT EXISTS `worker_company_data` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `worker_id` bigint UNSIGNED NOT NULL,
  `hire_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `inss` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contract_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pelouro` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizational_unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sector` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` decimal(17,5) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `worker_company_data_worker_id_foreign` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `worker_company_data`
--

INSERT INTO `worker_company_data` (`id`, `worker_id`, `hire_date`, `end_date`, `inss`, `contract_type`, `academic_level`, `area`, `region`, `pelouro`, `organizational_unit`, `sector`, `salary`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '2026-01-06', '2026-01-07', NULL, 'Certo', 'tecnico', NULL, NULL, NULL, 'Unidade Organica B', 'Departamento A', '900.00000', 'ativo', '2026-01-11 15:45:08', '2026-01-11 15:45:08', NULL),
(23, 2, '2025-12-30', '2026-02-06', NULL, 'Indeterminado', 'superior', NULL, NULL, NULL, 'DGRH-Direcção de Gestão de Recursos Humanos', 'Departamento de Formação e Desenvolvimento', '900.00000', 'ativo', '2026-01-12 14:24:36', '2026-01-12 14:24:36', NULL),
(24, 5, '2025-12-28', '2026-01-29', NULL, 'Incerto', 'tecnico', NULL, NULL, NULL, 'DGRH-Direcção de Gestão de Recursos Humanos', 'Departamento de Formação e Desenvolvimento', '1200.00000', 'ativo', '2026-01-12 14:30:33', '2026-01-12 14:30:33', NULL),
(32, 7, '2026-01-22', '2026-01-14', NULL, 'Incerto', 'superior', NULL, NULL, NULL, 'GAR-Gabinete de Auditoria e Risco', 'Departamento de Risco', '9200.00000', 'ativo', '2026-01-12 17:11:42', '2026-01-12 17:11:42', NULL),
(37, 10, '2025-02-10', '2026-02-09', NULL, 'Certo', 'superior', NULL, NULL, NULL, 'DGRH-Direcção de Gestão de Recursos Humanos', 'Departamento de  Serviço ao Cliente Interno', '65545.13000', 'ativo', '2026-01-13 07:24:44', '2026-01-13 07:24:44', NULL),
(38, 11, '2026-02-10', '2026-08-09', NULL, 'Certo', 'superior', NULL, NULL, NULL, 'DGRH-Direcção de Gestão de Recursos Humanos', 'Departamento de  Serviço ao Cliente Interno', '65545.13000', 'ativo', '2026-03-17 04:48:09', '2026-03-17 04:48:09', NULL),
(39, 12, '2026-01-05', '2026-12-18', NULL, 'Certo', 'tecnico', NULL, NULL, NULL, 'DGRH-Direcção de Gestão de Recursos Humanos', 'Departamento de Serviços Partilhados', '100000.00000', 'ativo', '2026-03-17 08:07:26', '2026-03-17 08:07:26', NULL),
(40, 13, '2026-01-17', '2026-11-11', NULL, 'Certo', 'tecnico', NULL, NULL, NULL, 'GAR-Gabinete de Auditoria e Risco', 'Departamento de Risco', '5000.00000', 'ativo', '2026-03-17 09:51:50', '2026-03-17 09:51:50', NULL),
(43, 14, '2026-01-01', '2026-07-31', NULL, 'Certo', 'superior', NULL, NULL, 'Teste', 'DGRH-Direcção de Gestão de Recursos Humanos', 'Departamento de  Serviço ao Cliente Interno', '120000.00000', 'ativo', '2026-03-17 17:09:45', '2026-03-18 03:01:57', NULL),
(45, 15, '2026-01-02', '2026-12-31', NULL, 'Certo', 'tecnico', NULL, NULL, NULL, 'Direcção de Tecnologias de Informação', 'Departamento de Redes Corporativas e Equipamento', '10000.00000', 'ativo', '2026-03-18 05:06:38', '2026-03-18 05:06:38', NULL),
(46, 16, '2026-01-01', '2026-12-31', NULL, 'Certo', 'tecnico', NULL, NULL, NULL, 'DGRH-Direcção de Gestão de Recursos Humanos', 'Departamento de  Serviço ao Cliente Interno', '20000.00000', 'ativo', '2026-03-18 07:22:57', '2026-03-18 08:53:43', NULL),
(47, 17, '2026-01-01', '2026-01-12', NULL, 'Certo', 'secundario', NULL, NULL, NULL, 'DGRH-Direcção de Gestão de Recursos Humanos', 'Departamento de Serviços Partilhados', '20000.00000', 'ativo', '2026-03-18 11:42:50', '2026-03-18 11:42:50', NULL),
(48, 19, '2026-01-01', '2026-12-12', NULL, 'Certo', 'basico', NULL, NULL, NULL, 'DGRH-Direcção de Gestão de Recursos Humanos', 'Departamento de  Serviço ao Cliente Interno', '30000.00000', 'ativo', '2026-03-18 12:03:01', '2026-03-18 12:27:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `worker_perfomances`
--

DROP TABLE IF EXISTS `worker_perfomances`;
CREATE TABLE IF NOT EXISTS `worker_perfomances` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `worker_id` bigint UNSIGNED NOT NULL,
  `attachament` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `perfomance_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `worker_perfomances_worker_id_foreign` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `worker_perfomances`
--

INSERT INTO `worker_perfomances` (`id`, `worker_id`, `attachament`, `status`, `perfomance_date`, `created_at`, `updated_at`) VALUES
(1, 1, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/1/uoTjgujYZhSo0rcOoeSEVNMjiqc98EYlbJNqQrHR.pdf', 'Bom', '2026-01-11', '2026-01-11 16:30:09', '2026-01-11 16:30:09'),
(2, 1, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/1/aX2PvJJBpgAZxa11W1NmGGDNzJu8ciUf4NR5gGZR.pdf', 'Bom', '2026-01-11', '2026-01-11 16:30:10', '2026-01-11 16:30:10'),
(3, 1, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/1/zjeBhpRZpU4DwJlkFJ6Lfq9ZGLt8nHeJs3kUo7wQ.pdf', 'Bom', '2026-01-11', '2026-01-11 16:30:11', '2026-01-11 16:30:11'),
(4, 1, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/1/ZrbbZWh9kDFEa1mRf59wK8UBJlpLtGh7Y72YmluE.pdf', 'Bom', '2026-01-11', '2026-01-11 16:30:11', '2026-01-11 16:30:11'),
(6, 5, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/5/9rDSzCRH1qwAoViHJ60oyPLpKJkL8lyUrYindCLz.pdf', 'Bom', '2026-01-27', '2026-01-27 09:03:57', '2026-01-27 09:03:57'),
(7, 11, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/11/HHWYj3EIkXXz8oX6HErV5ZrJhKiS6fbnXyLwSGg6.pdf', 'Bom', '2026-03-17', '2026-03-17 05:09:29', '2026-03-17 05:09:29'),
(8, 12, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/12/vlaIa1TJa0SIcQsdEtdTI33TS9JHTzFOzjBX7cRw.docx', 'Bom', '2026-03-17', '2026-03-17 08:17:58', '2026-03-17 08:17:58'),
(9, 14, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/14/trRgjEUCS0f711BhhVDDFRG1VQ9grBLCp5D1yVdj.docx', 'Bom', '2026-03-17', '2026-03-17 19:19:59', '2026-03-17 19:19:59'),
(10, 16, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/16/JX4hWiQ3wyvzMKIzMAY8gYrFEoiagELjvLG2e7S9.txt', 'Bom', '2026-03-18', '2026-03-18 07:40:01', '2026-03-18 07:40:01'),
(11, 16, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/16/ckJvmDQXhPFDZRCW6wYm0caAROCaXb4p5yDvQpUB.html', 'Bom', '2026-03-18', '2026-03-18 07:40:50', '2026-03-18 07:40:50'),
(12, 15, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/15/DYbFDXjIUYSpk6H89DpfmjNs45P814WlDryIsxAh.pdf', 'Bom', '2026-03-18', '2026-03-18 08:26:14', '2026-03-18 08:26:14'),
(13, 15, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/15/nWEGvg0HQ84ZsFJZNwjnaHNXbUh6YJnM33XPSxjn.pdf', 'Bom', '2026-03-18', '2026-03-18 08:26:40', '2026-03-18 08:26:40'),
(14, 17, 'http://guezirh.edm.co.mz/rh-clarity-hub-backend/public//storage/worker_performances/17/w9IZ9tMKUgHIdrpkq0VgNFSAJCNEi8WVCBOSmDBL.csv', 'Bom', '2026-03-18', '2026-03-18 11:55:33', '2026-03-18 11:55:33');

-- --------------------------------------------------------

--
-- Table structure for table `worker_steps`
--

DROP TABLE IF EXISTS `worker_steps`;
CREATE TABLE IF NOT EXISTS `worker_steps` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `worker_id` bigint UNSIGNED NOT NULL,
  `step_personal` tinyint(1) NOT NULL DEFAULT '0',
  `step_company` tinyint(1) NOT NULL DEFAULT '0',
  `step_documents` tinyint(1) NOT NULL DEFAULT '0',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `worker_steps_worker_id_foreign` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `worker_steps`
--

INSERT INTO `worker_steps` (`id`, `worker_id`, `step_personal`, `step_company`, `step_documents`, `completed`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, '2026-01-11 15:43:12', '2026-01-11 15:45:42'),
(2, 2, 1, 1, 1, 1, '2026-01-12 04:54:29', '2026-01-12 14:25:33'),
(5, 5, 1, 1, 1, 1, '2026-01-12 14:29:47', '2026-01-12 14:31:03'),
(7, 7, 1, 1, 1, 1, '2026-01-12 16:49:37', '2026-01-12 17:12:40'),
(10, 10, 1, 1, 1, 1, '2026-01-13 07:23:46', '2026-01-13 07:30:32'),
(11, 11, 1, 1, 1, 1, '2026-03-17 04:45:33', '2026-03-17 04:56:24'),
(12, 12, 1, 1, 1, 1, '2026-03-17 07:40:17', '2026-03-17 08:09:39'),
(13, 13, 1, 1, 1, 1, '2026-03-17 09:50:42', '2026-03-17 09:52:36'),
(14, 14, 1, 1, 1, 1, '2026-03-17 16:40:41', '2026-03-17 17:12:44'),
(15, 15, 1, 1, 1, 1, '2026-03-18 05:01:46', '2026-03-18 05:07:44'),
(16, 16, 1, 1, 1, 1, '2026-03-18 07:18:34', '2026-03-18 07:23:52'),
(17, 17, 1, 1, 1, 1, '2026-03-18 11:35:04', '2026-03-18 11:44:27'),
(18, 18, 1, 0, 0, 0, '2026-03-18 11:47:23', '2026-03-18 11:47:23'),
(19, 19, 1, 1, 1, 1, '2026-03-18 11:59:59', '2026-03-18 12:04:30');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD CONSTRAINT `departamentos_unidade_organica_id_foreign` FOREIGN KEY (`unidade_organica_id`) REFERENCES `unidade_organicas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fundo_alocados`
--
ALTER TABLE `fundo_alocados`
  ADD CONSTRAINT `fundo_alocados_unidade_organica_id_foreign` FOREIGN KEY (`unidade_organica_id`) REFERENCES `unidade_organicas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `removed_workers`
--
ALTER TABLE `removed_workers`
  ADD CONSTRAINT `removed_workers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `removed_workers_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `unidade_organicas`
--
ALTER TABLE `unidade_organicas`
  ADD CONSTRAINT `unidade_organicas_pelouro_id_foreign` FOREIGN KEY (`pelouro_id`) REFERENCES `pelouros` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `worker_company_data`
--
ALTER TABLE `worker_company_data`
  ADD CONSTRAINT `worker_company_data_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `worker_perfomances`
--
ALTER TABLE `worker_perfomances`
  ADD CONSTRAINT `worker_perfomances_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `worker_steps`
--
ALTER TABLE `worker_steps`
  ADD CONSTRAINT `worker_steps_worker_id_foreign` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
