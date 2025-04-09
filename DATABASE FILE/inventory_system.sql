DROP DATABASE IF EXISTS `inventory_system`;
CREATE DATABASE `inventory_system`;
USE `inventory_system`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";




CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



-- Table structure for table `media`


CREATE TABLE IF NOT EXISTS `media` (
`id` int(11) unsigned NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- Table structure for table `products`


CREATE TABLE IF NOT EXISTS `products` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `buy_price` decimal(25,2) DEFAULT NULL,
  `sale_price` decimal(25,2) NOT NULL,
  `categorie_id` int(11) unsigned NOT NULL,
  `media_id` int(11) DEFAULT '0',
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;




-- Dumping data for table `products`

INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `categorie_id`, `media_id`, `date`) VALUES
(1, 'Sample Product', '48', '100.00', '500.00', 1, 0, '2025-04-04 16:45:51'),
(2, 'Cardboard Boxes', '12000', '55.00', '130.00', 4, 0, '20215-04-04 18:44:52'),
(3, 'Maize (Yellow)', '69', '2.00', '5.00', 2, 0, '2025-04-04 18:48:53'),
(4, 'Timber Planks', '1200', '780.00', '1069.00', 2, 0, '2025-04-04 19:03:23'),
(5, 'Corn Milling Machine', '26', '299.00', '494.00', 5, 0, '2025-04-04 19:11:30'),
(6, 'Cocoa Dryer Fan', '42', '280.00', '415.00', 5, 0, '2025-04-04 19:13:35'),
(7, 'Koko Powder Sachets (3 Pk)', '107', '3.00', '7.00', 3, 0, '2025-04-04 19:15:38'),
(8, 'Titus Sardines', '110', '13.00', '20.00', 3, 0, '2025-04-04 19:17:11'),
(9, 'Ananse Storybook Toy', '67', '29.00', '55.00', 3, 0, '2025-04-04 19:19:20'),
(10, 'Kente-Inspired Figurine Set', '106', '219.00', '322.00', 3, 0, '2025-04-04 19:20:28'),
(11, 'Foam Peanuts', '78', '21.00', '31.00', 4, 0, '2025-04-04 19:25:22'),
(12, 'Desk Stapler', '160', '5.00', '10.00', 8, 0, '2025-04-04 19:48:01'),
(13, 'Bubble Wrap Roll', '199', '8.00', '19.00', 4, 0, '2025-04-04 19:49:00');

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
`id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


-- Dumping data for table `sales`


INSERT INTO `sales` (`id`, `product_id`, `qty`, `price`, `date`) VALUES
(1, 1, 2, '1000.00', '2025-04-04'),
(2, 3, 3, '15.00', '2025-04-04'),
(3, 10, 6, '1932.00', '2025-04-04'),
(4, 6, 2, '830.00', '2025-04-04'),
(5, 12, 5, '50.00', '2025-04-04'),
(6, 13, 21, '399.=00', '2025-04-04'),
(7, 7, 5, '35.00', '2025-04-04'),
(8, 9, 2, '110.00', '2025-04-04');



-- Table structure for table `users`


CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;


-- Dumping data for table `users`


INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(1, 'Kwame Asante', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'no_image.png', 1, '2025-04-04 19:45:52'),
(2, 'Ama Serwaa', 'special', 'ba36b97a41e7faf742ab09bf88405ac04f99599a', 2, 'no_image.png', 1, '2025-04-04 19:53:26'),
(3, 'Yaw Mensah', 'user', '12dea96fec20593566ab75692c9949596833adc9', 3, 'no_image.png', 1, '2025-04-04 19:54:46'),
(4, 'Afia Boateng', 'afia', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 3, 'no_image.png', 1, NULL),
(5, 'Kojo Owusu', 'kojo', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 3, 'no_image.png', 1, '2025-04-04 19:54:29');


-- Table structure for table `user_groups`


CREATE TABLE IF NOT EXISTS `user_groups` (
`id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


-- Dumping data for table `user_groups`



INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Admin', 1, 1),
(2, 'Special User', 2, 1),
(3, 'General User', 3, 1);


-- Indexes for table `categories`

ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
 ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`name`), ADD KEY `categorie_id` (`categorie_id`), ADD KEY `media_id` (`media_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
 ADD PRIMARY KEY (`id`), ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `user_level` (`user_level`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `group_level` (`group_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;

-- AUTO_INCREMENT for table `sales`

ALTER TABLE `sales`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;

-- AUTO_INCREMENT for table `users`

ALTER TABLE `users`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;

-- AUTO_INCREMENT for table `user_groups`

ALTER TABLE `user_groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;

-- Constraints for dumped tables



-- Constraints for table `products`

ALTER TABLE `products`
ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


-- Constraints for table `sales`

ALTER TABLE `sales`
ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


-- Constraints for table `users`
ALTER TABLE `users`
ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;

