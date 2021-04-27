-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 27 avr. 2021 à 16:26
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite_compl`
--

CREATE TABLE `activite_compl` (
  `AC_NUM` int(11) NOT NULL,
  `AC_DATE` datetime NOT NULL,
  `AC_LIEU` char(255) NOT NULL,
  `AC_THEME` char(255) NOT NULL,
  `AC_MOTIF` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `activite_compl`
--

INSERT INTO `activite_compl` (`AC_NUM`, `AC_DATE`, `AC_LIEU`, `AC_THEME`, `AC_MOTIF`) VALUES
(6, '2001-09-26 21:49:13', '309, avenue de Deschamps\n50 641 Fernandez', 'cueillette de champignon', 'anniversaire de Marie Curry'),
(7, '2002-02-20 01:25:40', '51, boulevard Le Gall\n56313 ThibaultBourg', 'docteur maboule IRL', 'la découverte du sida'),
(8, '2006-08-17 08:45:48', '54, chemin Lefort\n48 374 Blin-sur-Fernandes', 'escape game', 'le nouvel ans'),
(9, '1976-04-01 13:21:28', '69, impasse Frédérique Pereira\n51643 Faivre', 'golf', 'telethon'),
(10, '2001-06-12 00:18:39', '29, chemin Pelletier\n39 678 Roger', ' degustation oenologie', 'Zevent');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210212095559', '2021-02-12 10:56:33', 230);

-- --------------------------------------------------------

--
-- Structure de la table `inviter`
--

CREATE TABLE `inviter` (
  `ID_INVITER` int(11) NOT NULL,
  `AC_NUM` int(11) DEFAULT NULL,
  `PRA_NUM` smallint(6) DEFAULT NULL,
  `SPECIALISTEON` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `inviter`
--

INSERT INTO `inviter` (`ID_INVITER`, `AC_NUM`, `PRA_NUM`, `SPECIALISTEON`) VALUES
(15, 6, 39, 1),
(16, 6, 38, 1),
(17, 8, 40, 1),
(18, 7, 37, 1),
(19, 7, 34, 1),
(20, 9, 36, 1),
(21, 7, 33, 1),
(22, 9, 38, 1),
(23, 9, 31, 1),
(24, 6, 36, 1),
(25, 8, 35, 1),
(26, 7, 36, 1),
(27, 7, 38, 1);

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

CREATE TABLE `posseder` (
  `ID_POSSEDER` int(11) NOT NULL,
  `PRA_NUM` smallint(6) DEFAULT NULL,
  `SPE_CODE` int(11) DEFAULT NULL,
  `POS_DIPLOME` char(10) NOT NULL,
  `POS_COEFPRESCRIPTION` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `posseder`
--

INSERT INTO `posseder` (`ID_POSSEDER`, `PRA_NUM`, `SPE_CODE`, `POS_DIPLOME`, `POS_COEFPRESCRIPTION`) VALUES
(30, 35, 29, 'lg', 2.7),
(31, 38, 27, 'ty', 2),
(32, 32, 26, 'pi', 3),
(33, 40, 26, 'ka', 2.4),
(34, 35, 26, 'zh', 1.3),
(35, 34, 24, 'sc', 3.7),
(36, 39, 28, 'sw', 0.3);

-- --------------------------------------------------------

--
-- Structure de la table `praticien`
--

CREATE TABLE `praticien` (
  `PRA_NUM` smallint(6) NOT NULL,
  `PRA_NOM` char(255) NOT NULL,
  `PRA_PRENOM` char(30) NOT NULL,
  `PRA_ADRESSE` char(255) NOT NULL,
  `PRA_CP` char(100) NOT NULL,
  `PRA_VILLE` char(25) NOT NULL,
  `PRA_COEFNOTORIETE` double NOT NULL,
  `TYP_CODE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `praticien`
--

INSERT INTO `praticien` (`PRA_NUM`, `PRA_NOM`, `PRA_PRENOM`, `PRA_ADRESSE`, `PRA_CP`, `PRA_VILLE`, `PRA_COEFNOTORIETE`, `TYP_CODE`) VALUES
(31, 'Claude Guillaume', 'Théodore', '6, chemin de Allain\n15481 Noel-les-Bains', '18 532', 'Imbert-sur-Olivier', 0.4, 16),
(32, 'Théophile Begue', 'Alix', '79, place de Mahe\n29 091 Lelievre-les-Bains', '19362', 'Gilletnec', 4.2, 17),
(33, 'Margaret-Amélie Benoit', 'Victoire', '57, rue de Pottier\n85031 Bouchet-les-Bains', '18 675', 'Peltier', 3.1, 16),
(34, 'Agnès Blin', 'Christiane', '45, impasse Maryse Cohen\n99 233 Aubert', '91 781', 'Roger', 1.2, 18),
(35, 'Thomas-François Moreau', 'Jérôme', '807, rue Isabelle Riou\n20 894 Lecomte-sur-Leroy', '99 599', 'Lucas', 4.9, 16),
(36, 'Alexandre Laurent', 'Constance', '7, boulevard de Le Gall\n57879 Simon-les-Bains', '29 268', 'Gonzalezdan', 2.6, 16),
(37, 'Édouard Cordier-Lucas', 'Thomas', '97, chemin Sophie Ollivier\n90874 Gimenez', '97 192', 'Lemonniernec', 1.9, 18),
(38, 'Camille Jacob', 'Guy', '22, avenue de Perrin\n23091 Andre', '46935', 'Boulanger-la-Forêt', 1.9, 17),
(39, 'Alfred Huet', 'Susanne', '9, impasse de Parent\n88457 Wagnerdan', '53 655', 'Da CostaVille', 3, 18),
(40, 'Lucas Lemaitre', 'Jacqueline', 'avenue Legros\n63 287 Carrenec', '45497', 'Wagner-les-Bains', 0.2, 17);

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `SPE_CODE` int(11) NOT NULL,
  `SPE_LIBELLE` char(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`SPE_CODE`, `SPE_LIBELLE`) VALUES
(24, 'orthopediste'),
(26, 'PNL'),
(27, 'ophtalmologie'),
(28, 'cardiologie'),
(29, 'cancérologie'),
(30, 'ORL'),
(35, 'acuponcture');

-- --------------------------------------------------------

--
-- Structure de la table `type_praticien`
--

CREATE TABLE `type_praticien` (
  `TYP_CODE` int(11) NOT NULL,
  `TYP_LIBELLE` char(25) NOT NULL,
  `TYP_LIEU` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_praticien`
--

INSERT INTO `type_praticien` (`TYP_CODE`, `TYP_LIBELLE`, `TYP_LIEU`) VALUES
(16, 'feu', '5, impasse de Bernard\n15726 Dubois'),
(17, 'eau', '99, rue Paulette Vallee\n21846 Marynec'),
(18, 'terre', '86, boulevard Besnard\n49 273 PelletierBourg'),
(19, 'glasse', '87, rue Briand\n85805 Guichard-la-Forêt'),
(20, 'vent', '88, avenue de Michaud\n25836 Pons-la-Forêt');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite_compl`
--
ALTER TABLE `activite_compl`
  ADD PRIMARY KEY (`AC_NUM`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `inviter`
--
ALTER TABLE `inviter`
  ADD PRIMARY KEY (`ID_INVITER`),
  ADD KEY `AC_NUM` (`AC_NUM`),
  ADD KEY `PRA_NUM` (`PRA_NUM`);

--
-- Index pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD PRIMARY KEY (`ID_POSSEDER`),
  ADD KEY `PRA_NUM` (`PRA_NUM`),
  ADD KEY `SPE_CODE` (`SPE_CODE`);

--
-- Index pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD PRIMARY KEY (`PRA_NUM`),
  ADD KEY `TYP_CODE` (`TYP_CODE`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`SPE_CODE`);

--
-- Index pour la table `type_praticien`
--
ALTER TABLE `type_praticien`
  ADD PRIMARY KEY (`TYP_CODE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activite_compl`
--
ALTER TABLE `activite_compl`
  MODIFY `AC_NUM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `inviter`
--
ALTER TABLE `inviter`
  MODIFY `ID_INVITER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `posseder`
--
ALTER TABLE `posseder`
  MODIFY `ID_POSSEDER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `praticien`
--
ALTER TABLE `praticien`
  MODIFY `PRA_NUM` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `SPE_CODE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `type_praticien`
--
ALTER TABLE `type_praticien`
  MODIFY `TYP_CODE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `inviter`
--
ALTER TABLE `inviter`
  ADD CONSTRAINT `inviter_ibfk_1` FOREIGN KEY (`AC_NUM`) REFERENCES `activite_compl` (`AC_NUM`),
  ADD CONSTRAINT `inviter_ibfk_2` FOREIGN KEY (`PRA_NUM`) REFERENCES `praticien` (`PRA_NUM`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `posseder_ibfk_1` FOREIGN KEY (`PRA_NUM`) REFERENCES `praticien` (`PRA_NUM`),
  ADD CONSTRAINT `posseder_ibfk_2` FOREIGN KEY (`SPE_CODE`) REFERENCES `specialite` (`SPE_CODE`);

--
-- Contraintes pour la table `praticien`
--
ALTER TABLE `praticien`
  ADD CONSTRAINT `praticien_ibfk_1` FOREIGN KEY (`TYP_CODE`) REFERENCES `type_praticien` (`TYP_CODE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
