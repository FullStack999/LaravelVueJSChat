-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 30 2019 г., 21:41
-- Версия сервера: 10.3.15-MariaDB
-- Версия PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `chat`
--

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 3, 'fgh', '2019-06-30 11:01:38', '2019-06-30 11:01:38'),
(2, 3, 'sdfgsdfg', '2019-06-30 11:01:42', '2019-06-30 11:01:42'),
(3, 3, 'dsfv', '2019-06-30 11:01:43', '2019-06-30 11:01:43'),
(4, 3, 'fdsgsd', '2019-06-30 11:11:22', '2019-06-30 11:11:22'),
(5, 3, 'dfh', '2019-06-30 11:12:27', '2019-06-30 11:12:27'),
(6, 3, 'asdfsad', '2019-06-30 11:14:29', '2019-06-30 11:14:29'),
(7, 3, 'dfhdf', '2019-06-30 11:21:33', '2019-06-30 11:21:33'),
(8, 3, 'gdfgsd', '2019-06-30 11:22:40', '2019-06-30 11:22:40'),
(9, 3, 'fff', '2019-06-30 11:23:19', '2019-06-30 11:23:19'),
(10, 4, 'fghj', '2019-06-30 11:24:24', '2019-06-30 11:24:24'),
(11, 4, 'aaa', '2019-06-30 11:28:39', '2019-06-30 11:28:39'),
(12, 4, '4324', '2019-06-30 11:30:05', '2019-06-30 11:30:05'),
(13, 3, 'dddd', '2019-06-30 11:33:41', '2019-06-30 11:33:41'),
(14, 3, 'gggg', '2019-06-30 11:43:15', '2019-06-30 11:43:15'),
(15, 4, 'mfghdf', '2019-06-30 11:43:51', '2019-06-30 11:43:51'),
(16, 3, 'fff', '2019-06-30 11:48:32', '2019-06-30 11:48:32'),
(17, 3, 'gfhd', '2019-06-30 11:54:23', '2019-06-30 11:54:23'),
(18, 3, 'ghdf', '2019-06-30 11:58:26', '2019-06-30 11:58:26'),
(19, 3, 'dgdsgd', '2019-06-30 11:58:37', '2019-06-30 11:58:37'),
(20, 3, 'dgbfg', '2019-06-30 12:03:08', '2019-06-30 12:03:08'),
(21, 4, 'dsfvd', '2019-06-30 12:03:17', '2019-06-30 12:03:17'),
(22, 4, 'dsfgsdfg', '2019-06-30 12:05:24', '2019-06-30 12:05:24'),
(23, 4, 'ggg', '2019-06-30 12:05:28', '2019-06-30 12:05:28'),
(24, 3, 'hhh', '2019-06-30 12:06:11', '2019-06-30 12:06:11'),
(25, 3, 'fnfgn', '2019-06-30 12:08:37', '2019-06-30 12:08:37'),
(26, 4, 'gjghj', '2019-06-30 12:08:53', '2019-06-30 12:08:53'),
(27, 3, 'gggg', '2019-06-30 12:10:54', '2019-06-30 12:10:54'),
(28, 3, 'rthtr', '2019-06-30 12:11:09', '2019-06-30 12:11:09'),
(29, 3, 'fdgsdfgsd', '2019-06-30 12:12:52', '2019-06-30 12:12:52'),
(30, 3, 'fdhfd', '2019-06-30 12:20:26', '2019-06-30 12:20:26'),
(31, 3, 'dfhfd', '2019-06-30 12:36:23', '2019-06-30 12:36:23'),
(32, 3, 'fgj', '2019-06-30 14:09:30', '2019-06-30 14:09:30'),
(33, 3, 'fgj', '2019-06-30 14:09:31', '2019-06-30 14:09:31'),
(34, 3, 'sfsdf', '2019-06-30 14:10:12', '2019-06-30 14:10:12'),
(35, 3, 'jfg', '2019-06-30 14:10:19', '2019-06-30 14:10:19'),
(36, 3, 'barev mard', '2019-06-30 14:10:23', '2019-06-30 14:10:23'),
(37, 3, 'erwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwgerwgrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrwg', '2019-06-30 15:01:38', '2019-06-30 15:01:38'),
(38, 3, 'sadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdfsadfsadfasfasdf', '2019-06-30 15:07:05', '2019-06-30 15:07:05'),
(39, 1, 'dfsgd', '2019-06-30 15:41:14', '2019-06-30 15:41:14');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_06_29_192536_create_websockets_statistics_entries_table', 2),
(4, '2019_06_30_140039_create_messages_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nareko', 'sardaryan17@gmail.com', NULL, '$2y$10$YZ6HVXgJ0lpTQnLx5dTHP.aBp61NJ5samyzUL90ZIXY5gQW71WV/i', '0xFTrcfnKkhxUWyOzAZdPkpBRrYIVULnCzbLvYKcxGWDdTuXiVTJLLBGgX58', '2019-06-29 10:32:03', '2019-06-29 10:32:03'),
(2, 'vardanik', 'nar.sardaryan@mail.ru', NULL, '$2y$10$hU.FxBvtCfGZbpTCDQ.E..665FIZE4oFR3Smfj.myhu5FVt3Efj7q', NULL, '2019-06-29 11:45:47', '2019-06-29 11:45:47'),
(3, 'Davit11', 'marosardaryan1966@mail.ru', NULL, '$2y$10$2SDGvISNV191Yj6dpsToqu2e/tlWdSaVLw.Qc3T5W4RMwxxliq4B2', NULL, '2019-06-30 10:15:47', '2019-06-30 10:15:47'),
(4, 'Vahe001', 'petros.baghdasaryan.97@mail.ru', NULL, '$2y$10$080wq74RQO4GV7k8K3W22ODsN5zzZVUtSK9Rq1fHMx.emYaAE4OXK', 'JIJyRhl7lykAsfWY2tDq2UUT4E5CCFq6r3o3eEICqIQIjmhHvPD2sVDzUzm5', '2019-06-30 11:11:00', '2019-06-30 11:11:00');

-- --------------------------------------------------------

--
-- Структура таблицы `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
