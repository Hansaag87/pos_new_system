-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 23, 2025 at 06:16 AM
-- Server version: 8.0.42
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `posnew`
--

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `sku`, `barcode`, `category_id`, `description`, `image`, `unit_id`, `stock`, `reorder_level`, `created_at`, `updated_at`) VALUES
(1, 'hansa', '3535313', '321313', 1, 'wsrtgedghdfghbdhg', NULL, 2, 5, 6, '2025-06-13 12:08:27', '2025-06-13 12:08:27'),
(4, 'hansa', '35353131223', '321313424554', 1, 'wsrtgedghdfghbdhg', 'prod_684c160cd7a335.31904372.jpg', 2, 5, 6, '2025-06-13 12:14:04', '2025-06-13 12:14:04'),
(5, 'hansa chathushka', '3244564756', '457647676457', 1, 'dhgbdfhbdfhbdhghgdrfg', 'prod_684c1666ad1677.57202516.jpg', 3, 5, 8, '2025-06-13 12:15:34', '2025-06-13 12:15:34'),
(7, 'Coming soon personal portfolio website', '123456789', '2234567890[', 1, 'dfgxcfhgcxhgcxgh', 'prod_684c468e8a2712.53444747.jpg', 3, 5, 4, '2025-06-13 15:41:02', '2025-06-13 15:41:02'),
(8, 'bookss', '5447567436453', '5447567436453', 5, 'edrgedfgfhg', NULL, 1, 11, 10, '2025-06-16 13:43:24', '2025-06-17 16:31:50'),
(9, 'boo1', '34534563453456', '34534563453456', 5, 'sdfsdgfsdf', NULL, 1, 1, 10, '2025-06-16 13:50:29', '2025-06-17 16:39:50'),
(11, 'hansa', 'dfdfdfgdfg', 'dgfdfgdfgfdg', 1, ']o[]op', NULL, 3, 10, 1, '2025-06-19 04:54:37', '2025-06-19 04:54:37');

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `description`, `icon`) VALUES
(1, 'Electronics', 'Electronic devices', NULL),
(2, 'Stationery', 'Office and school', NULL),
(5, 'book', 'book', NULL);

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `supplier_id`, `po_date`, `status`, `created_at`) VALUES
(1, 2, '2025-06-10', 'confirmed', '2025-06-17 21:54:00');

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`) VALUES
(1, 1, 9, 4, 50.00);

--
-- Dumping data for table `stock_adjustments`
--

INSERT INTO `stock_adjustments` (`id`, `date`, `product_id`, `old_stock`, `new_stock`, `reason`, `user_id`, `created_at`) VALUES
(1, '2025-06-17', 9, 14, 5, 'error', 4, '2025-06-17 22:08:44'),
(2, '2025-06-17', 9, 5, 2, 'error', 4, '2025-06-17 22:09:16'),
(3, '2025-06-17', 9, 2, 1, 'error', 4, '2025-06-17 22:09:50');

--
-- Dumping data for table `stock_out`
--

INSERT INTO `stock_out` (`id`, `date`, `type`, `reference`, `created_at`) VALUES
(1, '2025-06-17', 'damage', 'ghgcchg', '2025-06-17 22:01:50');

--
-- Dumping data for table `stock_out_items`
--

INSERT INTO `stock_out_items` (`id`, `stock_out_id`, `product_id`, `quantity`) VALUES
(1, 1, 8, 2);

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact`, `email`, `address`, `active`) VALUES
(2, 'hishu', '12454545', 'h@m.com', 'sdfcfsdfdfsdfsdfsdfcv', 1),
(4, 'hansa chathushka', '6557567', 'hansaag87@gmail.com', '61/1.koorakolayaya,gammulla,walawela,matale\r\n61/1,koorakolayaya,gammulla,walawela,matale', 1),
(5, 'hansa chathushka', '676767', 'hansaag87@gmail.com', '61/1.koorakolayaya,gammulla,walawela,matale\r\n61/1,koorakolayaya,gammulla,walawela,matale', 1);

--
-- Dumping data for table `supplier_products`
--

INSERT INTO `supplier_products` (`id`, `supplier_id`, `product_id`) VALUES
(1, 5, 4),
(2, 5, 5),
(3, 5, 4),
(4, 5, 5);

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `abbreviation`) VALUES
(1, 'Piece', 'pcs'),
(2, 'Box', 'box'),
(3, 'Kilogram', 'kg');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$EXAMPLEHASHEDPASSWORDGENERATEDWITHPASSWORD_HASH', 'admin', '2025-06-13 10:25:51'),
(2, 'hhh', 'hhh', 'admin', '2025-06-13 10:31:45'),
(4, 'hhhh', '$2y$10$YvaPSZDRiJGG5lirh7qdB.RZmHLVS4d658jhCtqUFQ1O13Wx01tdu', 'admin', '2025-06-13 10:45:59');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
