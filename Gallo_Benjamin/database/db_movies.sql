-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2022 at 02:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_movies`
--

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name_gen` varchar(100) NOT NULL,
  `url_image` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name_gen`, `url_image`) VALUES
(1, 'terror', 'images/genres/terror_card.png'),
(2, 'comedia', 'images/genres/comedia_card.png'),
(3, 'drama', 'images/genres/drama_card.png'),
(4, 'accion', 'images/genres/accion_card.png'),
(5, 'suspenso', 'images/genres/suspenso_card.png'),
(6, 'aventuras', 'images/genres/aventuras_card.png'),
(7, 'western', 'images/genres/western_card.png'),
(8, 'crimen', 'images/genres/crimen_card.png');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year_movie` varchar(50) NOT NULL,
  `producer` varchar(250) NOT NULL,
  `synopsis` varchar(1500) NOT NULL,
  `duration` int(10) NOT NULL,
  `url_image` varchar(150) NOT NULL,
  `id_genre_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `year_movie`, `producer`, `synopsis`, `duration`, `url_image`, `id_genre_fk`) VALUES
(1, 'El padrino', '1972', 'Francis Ford Coppola', 'Don Vito Corleone es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York en los años 40. El hombre tiene cuatro hijos: Connie, Sonny, Fredo y Michael, que no quiere saber nada de los negocios sucios de su padre. Cuando otro capo, Sollozzo, intenta asesinar a Corleone, empieza una cruenta lucha entre los distintos clanes.', 175, 'images/movies/elpadrino.png', 3),
(2, 'El señor de los anillos: El retorno del rey', '2003', 'Peter Jackson', '', 0, '0', 6),
(3, 'Pulp Fiction', '1994', 'Quentin Tarantino', 'Vincent y Jules trabajan para Marsellus Wallace, un gánster que controla los negocios oscuros de la ciudad, entre ellos, las apuestas. Los dos matones tienen diferentes misiones que cumplir para Marsellus. La principal de ellas es recuperar un maletín misterioso. A lo largo de sus tareas, su destino se entrelaza con los más diversos personajes.', 154, 'images/movies/pulpfiction.png', 3),
(4, 'El bueno, el feo y el malo', '1966', 'Sergio Leone', '', 0, '0', 7),
(5, 'Forrest Gump', '1994', 'Robert Zemeckis', 'Sentado en un banco en Savannah, Georgia, Forrest Gump espera al autobús. Mientras éste tarda en llegar, el joven cuenta su vida a las personas que se sientan a esperar con él. Aunque sufre un pequeño retraso mental, esto no le impide hacer cosas maravillosas. Sin entender del todo lo que sucede a su alrededor, Forrest toma partido en los eventos más importantes de la historia de los Estados Unidos.', 142, 'images/movies/forestgump.png', 3),
(6, 'Origen', '2010', 'Christopher Nolan', '', 0, '0', 4),
(7, 'Seven', '1995', 'David Fincher', '', 0, '0', 8),
(8, 'Salvar al soldado Ryan', '1998', 'Steven Spielberg', '', 0, '0', 4),
(9, 'Interstellar', '2014', 'Christopher Nolan', '', 0, '0', 6),
(11, 'El teléfono del senor Harrigan', '2022 ', 'John Lee Hancock', 'Un joven se hace amigo de un multimillonario mayor. Cuando el hombre muere, el niño descubre que puede comunicarse con su amigo desde la tumba dejándole mensajes de voz en el teléfono que fue enterrado con él.', 135, 'images/movies/EltelefonodelsenorHarrigan.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `pass` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name_user`, `pass`) VALUES
(3, 'ben123', '$2y$10$KXuYStlhaGocWMEO3pRuiOKlMiW3s8mWOw0Qmh9RZP.98ZCItfUsm'),
(4, 'admin', '$2y$10$YhMbqJOQq0C428P6qaVkRejqEjIJKzzYiBupo.YuYzwKUHcSalCmu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_genre_fk` (`id_genre_fk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`id_genre_fk`) REFERENCES `genres` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
