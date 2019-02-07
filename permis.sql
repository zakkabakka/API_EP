-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  mer. 06 fév. 2019 à 15:04
-- Version du serveur :  5.6.38
-- Version de PHP :  7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `FPermis`
--

-- --------------------------------------------------------

--
-- Structure de la table `AccompanistNotes`
--

CREATE TABLE `AccompanistNotes` (
  `id` int(11) NOT NULL,
  `note` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Appointments`
--

CREATE TABLE `Appointments` (
  `id` int(11) NOT NULL,
  `accompanist_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cancelation_reasons` varchar(255) DEFAULT NULL,
  `price_final` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Appointments`
--

INSERT INTO `Appointments` (`id`, `accompanist_id`, `student_id`, `date`, `start_time`, `end_time`, `status`, `cancelation_reasons`, `price_final`, `createdAt`, `updatedAt`) VALUES
(1, 37, 6, '2017-10-19 00:00:00', '11:00:00', '12:10:00', 'pending', NULL, NULL, '2017-11-24 12:34:07', '2017-11-24 12:34:07'),
(2, 37, 6, '2017-10-19 00:00:00', '11:00:00', '12:10:00', 'pending', NULL, NULL, '2017-11-24 12:35:08', '2017-11-24 12:35:08'),
(3, 37, 6, '2017-10-19 00:00:00', '11:00:00', '12:10:00', 'pending', NULL, NULL, '2017-11-24 12:35:44', '2017-11-24 12:35:44'),
(4, 37, 6, '2017-10-19 00:00:00', '11:00:00', '12:10:00', 'pending', NULL, NULL, '2017-11-24 12:36:12', '2017-11-24 12:36:12'),
(5, 37, 6, '2017-10-19 00:00:00', '11:00:00', '12:10:00', 'pending', NULL, NULL, '2017-11-24 12:36:53', '2017-11-24 12:36:53'),
(6, 37, 6, '2017-10-19 00:00:00', '11:00:00', '12:10:00', 'pending', NULL, NULL, '2017-11-24 12:37:10', '2017-11-24 12:37:10'),
(7, 37, 6, '2017-10-19 00:00:00', '11:00:00', '12:10:00', 'pending', NULL, NULL, '2017-11-24 12:37:11', '2017-11-24 12:37:11');

-- --------------------------------------------------------

--
-- Structure de la table `Cities`
--

CREATE TABLE `Cities` (
  `id` int(11) NOT NULL,
  `lat` decimal(10,0) DEFAULT NULL,
  `long` decimal(10,0) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Qualities`
--

CREATE TABLE `Qualities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Qualities`
--

INSERT INTO `Qualities` (`id`, `user_id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'test', '2017-11-23 16:24:44', '2017-11-23 16:24:44'),
(2, 1, 'test2', '2017-11-23 16:25:13', '2017-11-23 16:25:13'),
(3, 1, 'test2', '2017-11-23 16:25:40', '2017-11-23 16:25:40'),
(4, 1, 'test2', '2017-11-23 16:26:26', '2017-11-23 16:26:26');

-- --------------------------------------------------------

--
-- Structure de la table `Schedules`
--

CREATE TABLE `Schedules` (
  `id` int(11) NOT NULL,
  `UserId` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Schedules`
--

INSERT INTO `Schedules` (`id`, `UserId`, `date`, `startTime`, `endTime`, `createdAt`, `updatedAt`) VALUES
(1, 37, '2017-10-19', '11:00:00', '12:10:00', '2017-11-24 08:41:14', '2017-11-24 08:41:14'),
(2, 37, '2017-10-20', '11:00:00', '12:10:00', '2017-11-24 08:41:28', '2017-11-24 08:41:28'),
(3, 2, '2017-10-20', '11:00:00', '12:10:00', '2017-11-24 08:41:28', '2017-11-24 08:41:28'),
(4, 2, '2018-04-02', '16:31:00', '16:37:00', '2018-03-02 15:37:01', '2018-03-02 15:37:01'),
(5, 41, '2018-02-03', '22:15:00', '23:19:00', '2018-03-02 18:38:59', '2018-03-02 18:38:59'),
(6, 234, '2018-11-20', '12:43:00', '13:43:00', '2018-12-20 13:36:44', '2018-12-20 13:36:44'),
(7, 234, '2018-11-21', '14:43:00', '19:43:00', '2018-12-20 13:40:17', '2018-12-20 13:40:17'),
(8, 261, '2018-10-22', '13:00:00', '14:00:00', '2018-12-22 12:04:31', '2018-12-22 12:04:31'),
(9, 45, '2018-11-22', '14:18:00', '15:18:00', '2018-12-22 13:19:23', '2018-12-22 13:19:23');

-- --------------------------------------------------------

--
-- Structure de la table `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20171122171949-create-user.js'),
('20171122172053-create-quality.js'),
('20171123163155-create-schedule.js'),
('20171123163429-create-appointment.js'),
('20171123163544-create-student-note.js'),
('20171123163615-create-accompanist-note.js'),
('20171123163708-create-city.js'),
('20171123163749-create-user-city.js');

-- --------------------------------------------------------

--
-- Structure de la table `StudentNotes`
--

CREATE TABLE `StudentNotes` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `times` int(11) DEFAULT NULL,
  `km` int(11) DEFAULT NULL,
  `road_type` varchar(255) DEFAULT NULL,
  `circumstance` varchar(255) DEFAULT NULL,
  `observation` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `UserCities`
--

CREATE TABLE `UserCities` (
  `id` int(11) NOT NULL,
  `accompanist_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `driving_hours` varchar(255) DEFAULT NULL,
  `licence_date` date DEFAULT NULL,
  `diploma` tinyint(1) DEFAULT NULL,
  `years_experience` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `phone` int(11) NOT NULL,
  `city` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Users`
--

INSERT INTO `Users` (`id`, `firstname`, `lastname`, `email`, `password`, `role`, `driving_hours`, `licence_date`, `diploma`, `years_experience`, `price`, `createdAt`, `updatedAt`, `phone`, `city`) VALUES
(1, 'kevin', 'kevin', 'kevin@etna.fr', 'pass', 'student', NULL, NULL, NULL, NULL, NULL, '2017-11-22 18:47:03', '2017-11-22 18:47:03', 0, ''),
(2, 'kevin', 'kevin', 'kevin@etna1.fr', 'pass', 'accompanist', NULL, NULL, NULL, NULL, '20', '2017-11-22 19:52:54', '2017-11-22 19:52:54', 0, '75012'),
(3, 'kevin', 'kevin', 'kevin@etna12.fr', 'pass', 'student', NULL, NULL, NULL, NULL, NULL, '2017-11-22 19:55:48', '2017-11-22 19:55:48', 0, ''),
(6, 'kevin', 'kevin', 'kevin@etna2.fr', 'pass', 'student', NULL, NULL, NULL, NULL, NULL, '2017-11-23 11:16:56', '2017-11-23 11:16:56', 0, '75012'),
(9, 'kevin', 'kevin', 'kevin@etna42.fr', '$2a$12$JBfRmTlPgRfWOrzkyCocIOlq2JhznBGNngwTkq3yeB/AZ8teYN7rG', 'student', NULL, NULL, NULL, NULL, NULL, '2017-11-23 11:35:44', '2017-11-23 11:35:47', 0, ''),
(34, 'kevin', 'kevin', 'kevin@new.fr', '$2a$08$ZOHSasmmK3bxCV2VbQCevu7GaFaYj/jKWkv.tHrGxMknwNJ48zhKy', 'student', NULL, NULL, NULL, NULL, NULL, '2017-11-23 14:30:01', '2017-11-23 14:30:01', 0, ''),
(35, 'Kevin', 'Dung', 'kevindung04@gmail.com', '$2a$08$.zjzg9p6dfQWkxy//H2ekea.Y9G7RW6eMTfXQ6YbffBNOcBmydXk2', 'student', NULL, NULL, NULL, NULL, NULL, '2017-11-23 15:04:18', '2017-11-23 15:04:18', 0, ''),
(37, 'kevin', 'kevin', 'kevin@etna4r2.fr', 'pass', 'accompanist', NULL, NULL, NULL, NULL, '10', '2017-11-23 15:30:53', '2017-11-23 15:30:53', 0, '75012'),
(38, 'Iliad', 'Marchoud', 'Iliass@gmail.com', 'pass', 'student', '21', NULL, NULL, NULL, NULL, '2018-03-02 15:28:36', '2018-03-02 15:28:36', 102030405, '77100'),
(39, 'Aka', 'Kherfiii', 'Zak@kherfi.com', 'kherfi', 'student', '23', NULL, NULL, NULL, NULL, '2018-03-02 16:17:17', '2018-03-02 16:17:17', 651352228, '92110'),
(41, 'Manu', 'Manu', 'Manu@manu.com', 'pass', 'accompanist', NULL, NULL, 0, 5, '40', '2018-03-02 18:33:29', '2018-03-02 18:33:29', 601010101, '92110'),
(42, 'Hello', 'Hello', 'Hello@hello.com', 'hello', 'accompanist', NULL, '2007-10-15', 0, 6, '20', '2018-03-28 16:32:52', '2018-03-28 16:32:52', 651352228, '92110'),
(43, 'Test1', 'Test2', 'Test@test.com', 'test', 'student', '20', NULL, NULL, NULL, NULL, '2018-06-05 15:35:21', '2018-06-05 15:35:21', 651352228, '92110'),
(44, 'Zak', 'zakka', 'Zakka@bakka.com', 'kherfizakka', 'student', '21', NULL, NULL, NULL, NULL, '2018-08-29 13:32:28', '2018-08-29 13:32:28', 651352228, '92110'),
(45, 'Bakka', 'Bakka', 'Bakka@zakka.com', 'kherfizakka', 'accompanist', NULL, NULL, 0, 7, '29', '2018-08-29 13:55:24', '2018-08-29 13:55:24', 751352228, '69002'),
(46, 'zakouiiii', 'zakOuiiiii', 'zak', 'zakoui', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 14:56:02', '2018-11-01 14:56:02', 0, 'zak'),
(47, 'zak@bak.com', 'kherfizakka', 'kherfizakka', 'kherfizakka', 'accompanist', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 15:22:26', '2018-11-01 15:22:26', 0, '75012'),
(61, 'toto@bak.com', 'kherfizakka', 'tata', 'kherfizakka', 'accompanist', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:17:35', '2018-11-01 16:17:35', 0, '75012'),
(63, 'tata', 'zakOuiiiii', 'tatattatta', 'zakoui', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:18:21', '2018-11-01 16:18:21', 0, 'zak'),
(66, 'toto@bak.com', 'kherfizakka', 'tata1', 'kherfizakka', 'accompanist', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:15', '2018-11-01 16:27:15', 0, '75012'),
(67, 'toto@bak.com', 'kherfizakka', 'tata2', 'kherfizakka', 'accompanist', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:15', '2018-11-01 16:27:15', 0, '75011'),
(68, 'toto@bak.com', 'kherfizakka', 'tata3', 'kherfizakka', 'accompanist', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:15', '2018-11-01 16:27:15', 0, '75010'),
(69, 'toto@bak.com', 'kherfizakka', 'tata4', 'kherfizakka', 'accompanist', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:15', '2018-11-01 16:27:15', 0, '75012'),
(70, 'toto@bak.com', 'kherfizakka', 'tata5', 'kherfizakka', 'accompanist', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:15', '2018-11-01 16:27:15', 0, '75014'),
(71, 'toto@bak.com', 'kherfizakka', 'tata53', 'kherfizakka', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:15', '2018-11-01 16:27:15', 0, '75015'),
(72, 'toto@bak.com', 'kherfizakka', 'tataDF', 'kherfizakka', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, '75012'),
(73, 'toto@bak.com', 'kherfizakka', 'tatalkj', 'kherfizakka', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, '75013'),
(74, 'toto@bak.com', 'kherfizakka', 'tatadsq', 'kherfizakka', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, '75015'),
(75, 'toto@bak.com', 'kherfizakka', 'tatadqd', 'kherfizakka', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, '75016'),
(76, 'toto@bak.com', 'kherfizakka', 'tatacxcs', 'kherfizakka', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, '75019'),
(77, 'toto@bak.com', 'kherfizakka', 'tataqddf', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(78, 'toto@bak.com', 'kherfizakka', 'tatafertr', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(79, 'toto@bak.com', 'kherfizakka', 'tataljlj', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(80, 'toto@bak.com', 'kherfizakka', 'tatakjlkj', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(81, 'toto@bak.com', 'kherfizakka', 'tatakjkkj', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(82, 'toto@bak.com', 'kherfizakka', 'tatakhkjh', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(83, 'toto@bak.com', 'kherfizakka', 'tatakkjmmlkj', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(84, 'toto@bak.com', 'kherfizakka', 'tatatrfd', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(85, 'toto@bak.com', 'kherfizakka', 'tataklmkjhk', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(86, 'toto@bak.com', 'kherfizakka', 'tatadfgf', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(87, 'toto@bak.com', 'kherfizakka', 'tataerfd', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(88, 'toto@bak.com', 'kherfizakka', 'tatacde', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(89, 'toto@bak.com', 'kherfizakka', 'tataze', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(90, 'toto@bak.com', 'kherfizakka', 'tatahgtr', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(91, 'toto@bak.com', 'kherfizakka', 'tataklo', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(92, 'toto@bak.com', 'kherfizakka', 'tataiouiehfds', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(93, 'toto@bak.com', 'kherfizakka', 'tataskjhskf', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(94, 'toto@bak.com', 'kherfizakka', 'tatazakkakkaka', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-01 16:27:16', '2018-11-01 16:27:16', 0, 'kherfizakka'),
(232, 'Manu', 'Manu', 'Manucom', 'manu', 'accompanist', NULL, NULL, 1, 21, '21', '2018-11-01 18:33:52', '2018-11-01 18:33:52', 999999999, '98888'),
(233, 'tata', 'zakOuiiiii', 'tatattattaa@kherfi.com', 'zakoui', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-11-06 14:28:49', '2018-11-06 14:28:49', 0, 'zak'),
(234, 'Massim', 'Massi', 'Massi.m@gmail.com', 'massi', 'accompanist', NULL, NULL, 1, 5, '32', '2018-11-06 15:50:40', '2018-11-06 15:50:40', 999999999, '92110'),
(235, 'hello@bajk.com', 'djammalo', 'hello@bajk.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-11-10 21:47:36', '2018-11-10 21:47:36', 0, 'Wahren'),
(237, 'tata', 'zakOuiiiii', 'wahedallah@kherfi.com', 'zakoui', 'student', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 09:55:54', '2018-12-18 09:55:54', 0, 'zak'),
(251, 'toto@bak.com', 'kherfizakka', 'toto1@bak.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 10:33:19', '2018-12-18 10:33:19', 0, 'kherfizakka'),
(252, 'toto@bak.com', 'kherfizakka', 'toto2@bak.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 10:33:19', '2018-12-18 10:33:19', 0, 'kherfizakka'),
(253, 'toto@bak.com', 'kherfizakka', 'toto3@bak.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 10:33:19', '2018-12-18 10:33:19', 0, 'kherfizakka'),
(254, 'toto@bak.com', 'kherfizakka', 'toto4@bak.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 10:33:19', '2018-12-18 10:33:19', 0, 'kherfizakka'),
(255, 'toto@bak.com', 'kherfizakka', 'toto5@bak.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 10:33:19', '2018-12-18 10:33:19', 0, 'kherfizakka'),
(256, 'toto@bak.com', 'kherfizakka', 'toto6@bak.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 10:33:19', '2018-12-18 10:33:19', 0, 'kherfizakka'),
(258, 'toto@bak.com', 'kherfizakka', 'toto7@bak.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 10:33:19', '2018-12-18 10:33:19', 0, 'kherfizakka'),
(259, 'toto@bak.com', 'kherfizakka', 'toto8@bak.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 10:33:19', '2018-12-18 10:33:19', 0, 'kherfizakka'),
(260, 'toto@bak.com', 'kherfizakka', 'toto9@bak.com', 'kherfizakka', 'kherfizakka', NULL, '0000-00-00', 0, 0, '0', '2018-12-18 10:33:19', '2018-12-18 10:33:19', 0, 'kherfizakka'),
(261, 'Emma', 'Martel', 'Emma@martel.com', 'emma', 'accompanist', NULL, '2012-11-22', 1, 5, '30', '2018-12-22 12:03:51', '2018-12-22 12:03:51', 753535353, '92110'),
(262, 'Élève1', 'Eleve', 'Eleve1@gmail.com', 'kherfizakka', 'student', '23', NULL, NULL, NULL, NULL, '2018-12-22 13:16:29', '2018-12-22 13:16:29', 678678678, '92110');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `AccompanistNotes`
--
ALTER TABLE `AccompanistNotes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Appointments`
--
ALTER TABLE `Appointments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Cities`
--
ALTER TABLE `Cities`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Qualities`
--
ALTER TABLE `Qualities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `Schedules`
--
ALTER TABLE `Schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserId` (`UserId`);

--
-- Index pour la table `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `SequelizeMeta_name_unique` (`name`);

--
-- Index pour la table `StudentNotes`
--
ALTER TABLE `StudentNotes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `UserCities`
--
ALTER TABLE `UserCities`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `AccompanistNotes`
--
ALTER TABLE `AccompanistNotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Appointments`
--
ALTER TABLE `Appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `Cities`
--
ALTER TABLE `Cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Qualities`
--
ALTER TABLE `Qualities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `Schedules`
--
ALTER TABLE `Schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `StudentNotes`
--
ALTER TABLE `StudentNotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `UserCities`
--
ALTER TABLE `UserCities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=263;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Qualities`
--
ALTER TABLE `Qualities`
  ADD CONSTRAINT `qualities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Contraintes pour la table `Schedules`
--
ALTER TABLE `Schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`id`);
