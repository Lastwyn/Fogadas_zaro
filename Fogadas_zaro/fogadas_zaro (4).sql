-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Feb 20. 17:13
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `fogadas_zaro`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `be/ki_fizetes`
--

CREATE TABLE `be/ki_fizetes` (
  `penztarca_id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `kartyaszam` int(11) NOT NULL,
  `osszeg` double NOT NULL,
  `kartya_tulajdonos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznaloi_adatok`
--

CREATE TABLE `felhasznaloi_adatok` (
  `felhasz_id` int(11) NOT NULL,
  `felhasz_nev` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `jelszo` varchar(255) NOT NULL,
  `reg_datum` date NOT NULL,
  `okmany` varchar(255) NOT NULL,
  `neme` varchar(255) NOT NULL,
  `lakcim` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fogadas`
--

CREATE TABLE `fogadas` (
  `felhasz_id` int(11) NOT NULL,
  `fog_id` int(11) NOT NULL,
  `fogadasi_osszeg` int(11) NOT NULL,
  `profit/buko` double NOT NULL,
  `meccs_id` int(11) NOT NULL,
  `fogadasi_szam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fogadasi_lehetoseg`
--

CREATE TABLE `fogadasi_lehetoseg` (
  `fogadasi_szam` int(11) NOT NULL,
  `fogadas_neve` varchar(255) NOT NULL,
  `szorzo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jatekosok`
--

CREATE TABLE `jatekosok` (
  `nemzet_id` int(11) NOT NULL,
  `jatekos_nev` varchar(255) NOT NULL,
  `pozicio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `meccs_eredmeny`
--

CREATE TABLE `meccs_eredmeny` (
  `meccs_id` int(11) NOT NULL,
  `eredmeny` varchar(255) NOT NULL,
  `gol_szerzo` varchar(255) NOT NULL,
  `golszam` int(11) NOT NULL,
  `hazai_id` int(11) NOT NULL,
  `vendeg_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `meccs_eredmeny`
--

INSERT INTO `meccs_eredmeny` (`meccs_id`, `eredmeny`, `gol_szerzo`, `golszam`, `hazai_id`, `vendeg_id`) VALUES
(1, '4-0', '', 4, 2, 1),
(2, '3-2', '', 5, 1, 2),
(3, '1-0', '', 1, 2, 1),
(4, '2-2', '', 4, 1, 2),
(5, '1-3', '', 4, 2, 1),
(6, '3-0', '', 3, 2, 1),
(7, '1-1', '', 2, 1, 2),
(8, '2-0', '', 2, 3, 4),
(9, '1-2', '', 3, 1, 3),
(10, '1-0', '', 1, 3, 2),
(11, '2-0', '', 2, 3, 4),
(12, '2-3', '', 5, 1, 3),
(13, '2-0', '', 2, 2, 4),
(14, '0-3', '', 3, 4, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `nemzetek`
--

CREATE TABLE `nemzetek` (
  `nemzet_id` int(11) NOT NULL,
  `nemzet_nev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `nemzetek`
--

INSERT INTO `nemzetek` (`nemzet_id`, `nemzet_nev`) VALUES
(1, 'Németország'),
(2, 'Franciaország'),
(3, 'Magyarország'),
(4, 'Olaszország');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `penztarca`
--

CREATE TABLE `penztarca` (
  `felhasz_id` int(11) NOT NULL,
  `penztarca_id` int(11) NOT NULL,
  `egyenleg` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `be/ki_fizetes`
--
ALTER TABLE `be/ki_fizetes`
  ADD PRIMARY KEY (`penztarca_id`);

--
-- A tábla indexei `felhasznaloi_adatok`
--
ALTER TABLE `felhasznaloi_adatok`
  ADD PRIMARY KEY (`felhasz_id`);

--
-- A tábla indexei `fogadas`
--
ALTER TABLE `fogadas`
  ADD PRIMARY KEY (`fog_id`),
  ADD KEY `felhasz_id` (`felhasz_id`),
  ADD KEY `meccs_id` (`meccs_id`),
  ADD KEY `fogadasi_szam` (`fogadasi_szam`);

--
-- A tábla indexei `fogadasi_lehetoseg`
--
ALTER TABLE `fogadasi_lehetoseg`
  ADD PRIMARY KEY (`fogadasi_szam`);

--
-- A tábla indexei `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD KEY `nemzet_id` (`nemzet_id`);

--
-- A tábla indexei `meccs_eredmeny`
--
ALTER TABLE `meccs_eredmeny`
  ADD PRIMARY KEY (`meccs_id`),
  ADD KEY `hazai_id` (`hazai_id`),
  ADD KEY `vendeg_id` (`vendeg_id`);

--
-- A tábla indexei `nemzetek`
--
ALTER TABLE `nemzetek`
  ADD PRIMARY KEY (`nemzet_id`);

--
-- A tábla indexei `penztarca`
--
ALTER TABLE `penztarca`
  ADD PRIMARY KEY (`penztarca_id`),
  ADD KEY `felhasz_id` (`felhasz_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznaloi_adatok`
--
ALTER TABLE `felhasznaloi_adatok`
  MODIFY `felhasz_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `fogadas`
--
ALTER TABLE `fogadas`
  MODIFY `fog_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `fogadasi_lehetoseg`
--
ALTER TABLE `fogadasi_lehetoseg`
  MODIFY `fogadasi_szam` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `meccs_eredmeny`
--
ALTER TABLE `meccs_eredmeny`
  MODIFY `meccs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `nemzetek`
--
ALTER TABLE `nemzetek`
  MODIFY `nemzet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `penztarca`
--
ALTER TABLE `penztarca`
  MODIFY `penztarca_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `be/ki_fizetes`
--
ALTER TABLE `be/ki_fizetes`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`penztarca_id`) REFERENCES `penztarca` (`penztarca_id`);

--
-- Megkötések a táblához `fogadas`
--
ALTER TABLE `fogadas`
  ADD CONSTRAINT `FK2` FOREIGN KEY (`fogadasi_szam`) REFERENCES `fogadasi_lehetoseg` (`fogadasi_szam`),
  ADD CONSTRAINT `FK3` FOREIGN KEY (`felhasz_id`) REFERENCES `felhasznaloi_adatok` (`felhasz_id`),
  ADD CONSTRAINT `FK4` FOREIGN KEY (`meccs_id`) REFERENCES `meccs_eredmeny` (`meccs_id`);

--
-- Megkötések a táblához `jatekosok`
--
ALTER TABLE `jatekosok`
  ADD CONSTRAINT `FK5` FOREIGN KEY (`nemzet_id`) REFERENCES `nemzetek` (`nemzet_id`);

--
-- Megkötések a táblához `meccs_eredmeny`
--
ALTER TABLE `meccs_eredmeny`
  ADD CONSTRAINT `FK6` FOREIGN KEY (`hazai_id`) REFERENCES `nemzetek` (`nemzet_id`),
  ADD CONSTRAINT `FK7` FOREIGN KEY (`vendeg_id`) REFERENCES `nemzetek` (`nemzet_id`);

--
-- Megkötések a táblához `penztarca`
--
ALTER TABLE `penztarca`
  ADD CONSTRAINT `FK8` FOREIGN KEY (`felhasz_id`) REFERENCES `felhasznaloi_adatok` (`felhasz_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
