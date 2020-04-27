-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2020 at 10:25 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trainreservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add passenger_detail', 7, 'add_passenger_detail'),
(26, 'Can change passenger_detail', 7, 'change_passenger_detail'),
(27, 'Can delete passenger_detail', 7, 'delete_passenger_detail'),
(28, 'Can view passenger_detail', 7, 'view_passenger_detail'),
(29, 'Can add train_detail', 8, 'add_train_detail'),
(30, 'Can change train_detail', 8, 'change_train_detail'),
(31, 'Can delete train_detail', 8, 'delete_train_detail'),
(32, 'Can view train_detail', 8, 'view_train_detail'),
(33, 'Can add detail', 9, 'add_detail'),
(34, 'Can change detail', 9, 'change_detail'),
(35, 'Can delete detail', 9, 'delete_detail'),
(36, 'Can view detail', 9, 'view_detail'),
(37, 'Can add booked_passenger_details', 10, 'add_booked_passenger_details'),
(38, 'Can change booked_passenger_details', 10, 'change_booked_passenger_details'),
(39, 'Can delete booked_passenger_details', 10, 'delete_booked_passenger_details'),
(40, 'Can view booked_passenger_details', 10, 'view_booked_passenger_details'),
(41, 'Can add daily', 11, 'add_daily'),
(42, 'Can change daily', 11, 'change_daily'),
(43, 'Can delete daily', 11, 'delete_daily'),
(44, 'Can view daily', 11, 'view_daily');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book_booked_passenger_details`
--

CREATE TABLE `book_booked_passenger_details` (
  `id` int(11) NOT NULL,
  `f_name` varchar(200) NOT NULL,
  `l_name` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `pnr_no_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_booked_passenger_details`
--

INSERT INTO `book_booked_passenger_details` (`id`, `f_name`, `l_name`, `age`, `pnr_no_id`) VALUES
(33, 'vishant', 'vaghani', 18, 1058727844),
(34, 'vishant', 'vaghani', 18, 1077994535),
(35, 'vishant', 'vaghani', 18, 1082207278);

-- --------------------------------------------------------

--
-- Table structure for table `book_daily`
--

CREATE TABLE `book_daily` (
  `id` int(11) NOT NULL,
  `first_class` int(11) NOT NULL,
  `second_class` int(11) NOT NULL,
  `date` date NOT NULL,
  `train_no_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_daily`
--

INSERT INTO `book_daily` (`id`, `first_class`, `second_class`, `date`, `train_no_id`) VALUES
(55, 5, 5, '2020-04-26', 2);

-- --------------------------------------------------------

--
-- Table structure for table `book_detail`
--

CREATE TABLE `book_detail` (
  `pnr_no` int(11) NOT NULL,
  `no_of_passenger` int(11) NOT NULL,
  `date` date NOT NULL,
  `train_class` varchar(100) NOT NULL,
  `departure_station` varchar(100) NOT NULL,
  `arrival_station` varchar(100) NOT NULL,
  `departure_station_rdist` int(11) NOT NULL,
  `arrival_station_rdist` int(11) NOT NULL,
  `train_no_id` int(11) NOT NULL,
  `username_id` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book_train_detail`
--

CREATE TABLE `book_train_detail` (
  `train_no` int(11) NOT NULL,
  `train_name` varchar(30) NOT NULL,
  `no_of_seat` int(11) NOT NULL,
  `route` mediumtext NOT NULL,
  `distance` mediumtext NOT NULL,
  `time` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_train_detail`
--

INSERT INTO `book_train_detail` (`train_no`, `train_name`, `no_of_seat`, `route`, `distance`, `time`) VALUES
(1, 'Rajdhani', 10, 'Mumbai,Surat,Bharuch,Vadodara,Anand,Nadiad,Ahmedabad,Jaipur,Delhi', '0,100,200,300,450,500,600,800,1100', '00:00,01:25,02:00,03:00,04:00,05:00,10:15,13:26,17:00'),
(2, 'Karnavati Express', 10, 'Ahmedabad,Nadiad,Anand,Vadodara,Ankleshwar,Bharuch,Sayan,Surat,Vapi,Valsad,Mumbai', '0,50,75,130,175,190,220,240,280,350,400', '11:25,12:00,13:00,14:25,15:35,16:52,17:42,18:30,20:00,21:00,21:45');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(10, 'book', 'booked_passenger_details'),
(11, 'book', 'daily'),
(9, 'book', 'detail'),
(8, 'book', 'train_detail'),
(5, 'contenttypes', 'contenttype'),
(7, 'login', 'passenger_detail'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-03-15 06:29:48.285183'),
(2, 'auth', '0001_initial', '2020-03-15 06:29:48.541583'),
(3, 'admin', '0001_initial', '2020-03-15 06:29:49.302262'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-03-15 06:29:49.510807'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-03-15 06:29:49.535740'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-03-15 06:29:49.630720'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-03-15 06:29:49.652660'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-03-15 06:29:49.680632'),
(9, 'auth', '0004_alter_user_username_opts', '2020-03-15 06:29:49.691603'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-03-15 06:29:49.790040'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-03-15 06:29:49.795057'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-03-15 06:29:49.806058'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-03-15 06:29:49.838066'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-03-15 06:29:49.862027'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-03-15 06:29:49.885968'),
(16, 'auth', '0011_update_proxy_permissions', '2020-03-15 06:29:49.898936'),
(17, 'login', '0001_initial', '2020-03-15 06:29:49.947875'),
(18, 'book', '0001_initial', '2020-03-15 06:29:50.079502'),
(19, 'sessions', '0001_initial', '2020-03-15 06:29:50.379152'),
(20, 'book', '0002_daily', '2020-03-15 14:57:18.354641'),
(21, 'book', '0003_detail_got_slot', '2020-03-15 18:40:58.629297'),
(22, 'book', '0004_remove_detail_got_slot', '2020-04-24 06:24:31.004644');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login_passenger_detail`
--

CREATE TABLE `login_passenger_detail` (
  `username` varchar(15) NOT NULL,
  `password` varchar(14) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birth_date` date NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `email_address` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `book_booked_passenger_details`
--
ALTER TABLE `book_booked_passenger_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_booked_passenge_pnr_no_id_5b6d0ae5_fk_book_deta` (`pnr_no_id`);

--
-- Indexes for table `book_daily`
--
ALTER TABLE `book_daily`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_daily_train_no_id_696ae740_fk_book_train_detail_train_no` (`train_no_id`);

--
-- Indexes for table `book_detail`
--
ALTER TABLE `book_detail`
  ADD PRIMARY KEY (`pnr_no`),
  ADD KEY `book_detail_train_no_id_21b720c1_fk_book_train_detail_train_no` (`train_no_id`),
  ADD KEY `book_detail_username_id_5fb54ed1_fk_login_pas` (`username_id`);

--
-- Indexes for table `book_train_detail`
--
ALTER TABLE `book_train_detail`
  ADD PRIMARY KEY (`train_no`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `login_passenger_detail`
--
ALTER TABLE `login_passenger_detail`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_booked_passenger_details`
--
ALTER TABLE `book_booked_passenger_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `book_daily`
--
ALTER TABLE `book_daily`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `book_train_detail`
--
ALTER TABLE `book_train_detail`
  MODIFY `train_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
