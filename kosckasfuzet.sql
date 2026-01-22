-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Jan 22. 13:32
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `kosckasfuzet`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szamla`
--

CREATE TABLE `szamla` (
  `id` int(11) NOT NULL,
  `SzolgaltatoAzon` int(32) NOT NULL,
  `SzolgaltatoRovidnEv` varchar(32) NOT NULL,
  `Tol` date NOT NULL,
  `Ig` date NOT NULL,
  `Osszeg` int(32) NOT NULL,
  `Hatarido` date NOT NULL,
  `Befizetve` date NOT NULL,
  `Megjegyzes` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szolgaltatas`
--

CREATE TABLE `szolgaltatas` (
  `Azon` int(32) NOT NULL,
  `Nev` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szolgaltato`
--

CREATE TABLE `szolgaltato` (
  `RovidNev` varchar(32) NOT NULL,
  `Nev` varchar(256) NOT NULL,
  `Ugyfelszolgalat` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `szamla`
--
ALTER TABLE `szamla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SzolgaltatoAzon` (`SzolgaltatoAzon`),
  ADD KEY `SzolgaltatoRovidnEv` (`SzolgaltatoRovidnEv`);

--
-- A tábla indexei `szolgaltatas`
--
ALTER TABLE `szolgaltatas`
  ADD PRIMARY KEY (`Azon`);

--
-- A tábla indexei `szolgaltato`
--
ALTER TABLE `szolgaltato`
  ADD PRIMARY KEY (`RovidNev`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `szamla`
--
ALTER TABLE `szamla`
  ADD CONSTRAINT `szamla_ibfk_1` FOREIGN KEY (`SzolgaltatoAzon`) REFERENCES `szolgaltatas` (`Azon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `szamla_ibfk_2` FOREIGN KEY (`SzolgaltatoRovidnEv`) REFERENCES `szolgaltato` (`RovidNev`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
