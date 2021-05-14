-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Mai 2021 um 18:20
-- Server-Version: 10.4.18-MariaDB
-- PHP-Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr13_bigevents_almerrichard`
--
CREATE DATABASE IF NOT EXISTS `cr13_bigevents_almerrichard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cr13_bigevents_almerrichard`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210514085133', '2021-05-14 10:51:56', 102);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `event`
--

INSERT INTO `event` (`id`, `name`, `start`, `description`, `image`, `capacity`, `email`, `phone`, `country`, `address`, `url`, `type`) VALUES
(1, 'Flow Experience', '2021-07-08 18:00:00', 'FLOW ( aus dem engl. fließen, strömen ) beschreibt das Gefühl völligen Aufgehens in einer Tätigkeit. Man befindet sich in einem sog. Tätigkeitsrausch, in dem man in totaler Loslösung schafft, willensfrei und zentriert. In diesem Zustand befindet sich unser Herzschlag, unsere Atmung und unser Blutdruck in einer einzigartigen, optimalen Synchronisation – einer Symbiose des Einklanges der inneren und äußeren Anteile und der Umwelt. Zwischen dem Bewusstseinszustand, also unserem Verstand und unseren Emotionen, besteht zu dieser Zeit eine absolute harmonische Verbindung. Flow ist eine Form von Glück auf die man Einfluss hat!', 'https://lh3.googleusercontent.com/proxy/9D6h5mlX_1RNOig8iU0mJis0lX8FyIcASs_AFYJYwdjYuJPltdyL2L0MkT19rTPpdbEnR5AqebhiMiw08OtcmVoQr-5nBZZqdx2gUdrTq-QO7q6jSfpvDI4myMYDMc43ga8', 10000, 'info@flow-events.at', 2147483647, 'Austria', 'Tritolstraße 10, 2492 Eggendorf', 'http://flow-experience.at/index.php/de/', 'Festival'),
(2, 'Burning Mountain', '2022-06-23 18:00:00', 'Above 1450m over the sea level, the Burning Mountain takes place in the middle of one of the highest inhabited valleys of Europe: the Engadine! Come and enjoy the campsite next to the beautifull River INN and relax in one of the most amazing spots along the PsyTrance circuit. Flamethrowers, dozens of performance artists, fire installations, a huge central fire, some say we\'re pyromaniacs. Maybe they are right. We just love to make the mountain burn!', 'https://media.resources.festicket.com/image/fit-in/412x264/filters:quality(70)/www/photos/card_EmCWIEH.jpg', 20000, 'info@burning-mountain.ch', 1231564655, 'Switzerland', 'Dorfstrasse 20,  8185 Winkel', 'https://www.burning-mountain.ch/', 'Festival'),
(5, 'Volbeat', '2022-06-07 18:00:00', 'Das neue Album Rewind, Replay, Rebound vereint den unverkennbar punkigen Psychobilly-Rock’n’Roll-Sound von Volbeat mit neuen kreativen Höhepunkten. „Der Grund für uns ins Studio zu gehen ist, dass wir immer noch etwas beweisen müssen – den Fans, aber vor allem uns selbst“, erklärt Sänger Michael Poulsen. „Wir hätten dieses Album ohne die Arbeit der letzten Jahre nicht machen können. Aber egal wie alt die Band wird oder wie viele Alben wir veröffentlichen, es wird immer diesen unverkennbaren Volbeat-Sound geben.“\r\n2001 in Kopenhagen gegründet haben sich Volbeat durch ständiges touren und sechs von den Fans gefeierte Alben an die Spitze des Hardrocks gekämpft. Das letzte Album Seal The Deal & Let’s Boogie erreichte in sieben Ländern Platz 1 – darunter auch in Deutschland, Österreich und der Schweiz.', 'https://service.oeticket.com/wp-content/uploads/2019/11/Volbeat-2019-CMS-Source1-1024x768.jpg', 4000, 'volbeat@gmail.com', 2147483647, 'Norway', 'Bergenhus Festning - Koengen - BERGEN', 'https://www.volbeat.dk/de/', 'Concert'),
(6, 'Red Hot Chilli Peppers', '2022-08-10 18:00:00', 'Red Hot Chili Peppers sind eine Alternative Band aus Los Angeles (US) die 1983 gegründet wurde.\r\nRed Hot Chili Peppers sind für 3 Festivals (u.a. Felyn Stadium Festival, Mad Cool Festival, NOS Alive Festival, bestätigt.\r\nHier findet ihr eine Übersicht aller kommenden Red Hot Chili Peppers Festivals.\r\nIn den vergangenen Jahren spielten Red Hot Chili Peppers unter anderem bei Orion Music + More, Boston Calling Music Festival, Roskilde Festival, Austin City Limits Festival, Paléo Festival, Lollapalooza Festival Paris, Open\'er Festival, Rock am Ring, Greenfield Festival, Pinkpop Festival und vielen mehr.', 'https://1000logos.net/wp-content/uploads/2017/05/Red-Hot-Chili-Peppers-Logo.png', 11000, 'rhcp@gmail.com', 546465511, 'Austria', 'Roland-Rainer-Platz 1, 1150 Wien', 'https://redhotchilipeppers.com/', 'Concert'),
(7, 'Beach Volleyball EM', '2021-08-11 12:00:00', 'Nach der pandemiebedingten Pause feiert Wien 2021 ein sensationelles Comeback – und das mit einem sportlichen Großereignis!\r\n\r\nHannes Jagerhofer und seinem ACTS-Team ist es gelungen, die Europameisterschaften ins Zentrum der österreichischen Bundeshauptstadt zu holen – in das Mekka des Sports, Lifestyles und Entertainments.', 'https://images.derstandard.at/img/2019/07/30/Beach.jpg?w=600&h=400&s=a8de9247', 5000, 'beach@acts.at', 147072470, 'Austria', 'Lothringerstraße 22, 1030 Wien', 'https://www.beachvolleyball.at/', 'Sport'),
(10, 'Nova Rock', '2022-06-09 12:00:00', 'Nova Rock ist ein österreichisches Rockmusik-Festival, das seit 2005 jedes Jahr im Juni in Nickelsdorf (Burgenland) stattfindet. Veranstalter ist die Firma Nova Music Entertainment GmbH in Zusammenarbeit mit Musicnet Entertainment GmbH. Geschäftsführer von Nova Music und somit ausführender Veranstalter des Festivals ist Ewald Tatar, der auch die Festivals in Wiesen bis 2004 mitorganisiert hat und das seit 2008 mit den Festivals Two Days a Week oder Lovely Days wieder veranstaltet. Seit 2009 tritt auch die Skalar Entertainment GmbH als Mitveranstalter des Nova Rock-Festivals auf.', 'https://www.novarock.at/wp-content/uploads/sites/15/Insta-Post-1080-x-1080-1-720x720.png', 220000, 'office@barracudamusic.at', 262665601, 'Austria', 'Pannonia Fields II, Nickelsdorf', 'https://www.novarock.at/', 'Festival');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
