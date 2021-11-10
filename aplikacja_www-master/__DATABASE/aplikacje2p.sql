-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 03 Lis 2021, 15:59
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `aplikacje2p`
--
CREATE DATABASE IF NOT EXISTS `aplikacje2p` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aplikacje2p`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kontakty`
--

DROP TABLE IF EXISTS `kontakty`;
CREATE TABLE `kontakty` (
  `id_kontakt` bigint(20) UNSIGNED NOT NULL,
  `imie` varchar(30) NOT NULL,
  `nazwisko` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tresc` text NOT NULL,
  `plec` set('m','k','n') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `kontakty`
--

INSERT INTO `kontakty` (`id_kontakt`, `imie`, `nazwisko`, `email`, `tresc`, `plec`) VALUES
(3, 'Alan', 'Lisowski', 'adre@wp.pl', 'To jest kolejna treść', 'm'),
(4, 'Janek', 'Lis', 'cos@wp.pl', 'To jakaś treść', 'm');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `kontakty`
--
ALTER TABLE `kontakty`
  ADD UNIQUE KEY `id_kontakt` (`id_kontakt`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `kontakty`
--
ALTER TABLE `kontakty`
  MODIFY `id_kontakt` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
