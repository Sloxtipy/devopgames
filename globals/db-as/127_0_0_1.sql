-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-02-2017 a las 19:49:56
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cilfer`
--
CREATE DATABASE IF NOT EXISTS `cilfer` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cilfer`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_bdasurvey`
--

CREATE TABLE `cbbfloorplan_bdasurvey` (
  `id` int(11) NOT NULL,
  `foreign_floor` int(11) DEFAULT NULL,
  `foreign_section` int(11) DEFAULT NULL,
  `frequency` float(11,0) DEFAULT NULL,
  `decibel` float(11,0) DEFAULT NULL,
  `note` text,
  `status` enum('T','F') CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cbbfloorplan_bdasurvey`
--

INSERT INTO `cbbfloorplan_bdasurvey` (`id`, `foreign_floor`, `foreign_section`, `frequency`, `decibel`, `note`, `status`) VALUES
(1, 7, 359, 2, 120, 'TEST DECIBEL', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_fields`
--

CREATE TABLE `cbbfloorplan_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `type` enum('backend','frontend','arrays') DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `source` enum('script','plugin') DEFAULT 'script',
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_fields`
--

INSERT INTO `cbbfloorplan_fields` (`id`, `key`, `type`, `label`, `source`, `modified`) VALUES
(2, 'adminForgot', 'backend', 'Forgot password', 'script', NULL),
(3, 'adminLogin', 'backend', 'Admin Login', 'script', NULL),
(4, 'backend', 'backend', 'Backend titles', 'script', NULL),
(8, 'btnCancel', 'backend', 'Button Cancel', 'script', NULL),
(11, 'btnLogin', 'backend', 'Login', 'script', NULL),
(13, 'btnSave', 'backend', 'Save', 'script', NULL),
(14, 'btnSearch', 'backend', 'Search', 'script', NULL),
(15, 'btnSend', 'backend', 'Button Send', 'script', NULL),
(18, 'email', 'backend', 'E-Mail', 'script', NULL),
(19, 'emailForgotBody', 'backend', 'Email / Forgot Body', 'script', NULL),
(20, 'emailForgotSubject', 'backend', 'Email / Forgot Subject', 'script', NULL),
(21, 'frontend', 'backend', 'Front-end titles', 'script', NULL),
(22, 'gridActionTitle', 'backend', 'Grid / Action Title', 'script', NULL),
(23, 'gridBtnCancel', 'backend', 'Grid / Button Cancel', 'script', NULL),
(24, 'gridBtnDelete', 'backend', 'Grid / Button Delete', 'script', NULL),
(25, 'gridBtnOk', 'backend', 'Grid / Button OK', 'script', NULL),
(26, 'gridChooseAction', 'backend', 'Grid / Choose Action', 'script', NULL),
(27, 'gridConfirmationTitle', 'backend', 'Grid / Confirmation Title', 'script', NULL),
(28, 'gridDeleteConfirmation', 'backend', 'Grid / Delete confirmation', 'script', NULL),
(29, 'gridEmptyResult', 'backend', 'Grid / Empty resultset', 'script', NULL),
(30, 'gridGotoPage', 'backend', 'Grid / Go to page', 'script', NULL),
(31, 'gridItemsPerPage', 'backend', 'Grid / Items per page', 'script', NULL),
(32, 'gridNext', 'backend', 'Grid / Next', 'script', NULL),
(33, 'gridNextPage', 'backend', 'Grid / Next page', 'script', NULL),
(34, 'gridPrev', 'backend', 'Grid / Prev', 'script', NULL),
(35, 'gridPrevPage', 'backend', 'Grid / Prev page', 'script', NULL),
(36, 'gridTotalItems', 'backend', 'Grid / Total items', 'script', NULL),
(58, 'lblChoose', 'backend', 'Choose', 'script', NULL),
(62, 'lblExport', 'backend', 'Export', 'script', NULL),
(63, 'lblForgot', 'backend', 'Forgot password', 'script', NULL),
(64, 'lblIp', 'backend', 'IP address', 'script', NULL),
(65, 'lblIsActive', 'backend', 'Is Active', 'script', NULL),
(66, 'lblName', 'backend', 'Name', 'script', NULL),
(67, 'lblNo', 'backend', 'No', 'script', NULL),
(68, 'lblOption', 'backend', 'Option', 'script', NULL),
(70, 'lblRole', 'backend', 'Role', 'script', NULL),
(71, 'lblStatus', 'backend', 'Status', 'script', NULL),
(74, 'lblUserCreated', 'backend', 'User / Registration Date & Time', 'script', NULL),
(75, 'lblValue', 'backend', 'Value', 'script', NULL),
(77, 'lnkBack', 'backend', 'Link Back', 'script', NULL),
(84, 'menuBackup', 'backend', 'Menu Backup', 'script', NULL),
(85, 'menuDashboard', 'backend', 'Menu Dashboard', 'script', NULL),
(87, 'menuLocales', 'backend', 'Menu Languages', 'script', NULL),
(88, 'menuLogout', 'backend', 'Menu Logout', 'script', NULL),
(89, 'menuOptions', 'backend', 'Menu Options', 'script', NULL),
(91, 'menuProfile', 'backend', 'Menu Profile', 'script', NULL),
(92, 'menuUsers', 'backend', 'Menu Users', 'script', NULL),
(93, 'multilangTooltip', 'backend', 'MultiLang / Tooltip', 'script', NULL),
(94, 'opt_o_currency', 'backend', 'Options / Currency', 'script', NULL),
(95, 'opt_o_date_format', 'backend', 'Options / Date format', 'script', NULL),
(96, 'opt_o_send_email', 'backend', 'opt_o_send_email', 'script', NULL),
(97, 'opt_o_smtp_host', 'backend', 'opt_o_smtp_host', 'script', NULL),
(98, 'opt_o_smtp_pass', 'backend', 'opt_o_smtp_pass', 'script', NULL),
(99, 'opt_o_smtp_port', 'backend', 'opt_o_smtp_port', 'script', NULL),
(100, 'opt_o_smtp_user', 'backend', 'opt_o_smtp_user', 'script', NULL),
(101, 'opt_o_timezone', 'backend', 'Options / Timezone', 'script', NULL),
(102, 'opt_o_week_start', 'backend', 'Options / First day of the week', 'script', NULL),
(103, 'pass', 'backend', 'Password', 'script', NULL),
(125, 'revert_status', 'backend', 'Revert status', 'script', NULL),
(129, 'days_ARRAY_0', 'arrays', 'days_ARRAY_0', 'script', NULL),
(130, 'days_ARRAY_1', 'arrays', 'days_ARRAY_1', 'script', NULL),
(131, 'days_ARRAY_2', 'arrays', 'days_ARRAY_2', 'script', NULL),
(132, 'days_ARRAY_3', 'arrays', 'days_ARRAY_3', 'script', NULL),
(133, 'days_ARRAY_4', 'arrays', 'days_ARRAY_4', 'script', NULL),
(134, 'days_ARRAY_5', 'arrays', 'days_ARRAY_5', 'script', NULL),
(135, 'days_ARRAY_6', 'arrays', 'days_ARRAY_6', 'script', NULL),
(136, 'day_names_ARRAY_0', 'arrays', 'day_names_ARRAY_0', 'script', NULL),
(137, 'day_names_ARRAY_1', 'arrays', 'day_names_ARRAY_1', 'script', NULL),
(138, 'day_names_ARRAY_2', 'arrays', 'day_names_ARRAY_2', 'script', NULL),
(139, 'day_names_ARRAY_3', 'arrays', 'day_names_ARRAY_3', 'script', NULL),
(140, 'day_names_ARRAY_4', 'arrays', 'day_names_ARRAY_4', 'script', NULL),
(141, 'day_names_ARRAY_5', 'arrays', 'day_names_ARRAY_5', 'script', NULL),
(142, 'day_names_ARRAY_6', 'arrays', 'day_names_ARRAY_6', 'script', NULL),
(143, 'error_bodies_ARRAY_AA10', 'arrays', 'error_bodies_ARRAY_AA10', 'script', NULL),
(144, 'error_bodies_ARRAY_AA11', 'arrays', 'error_bodies_ARRAY_AA11', 'script', NULL),
(145, 'error_bodies_ARRAY_AA12', 'arrays', 'error_bodies_ARRAY_AA12', 'script', NULL),
(146, 'error_bodies_ARRAY_AA13', 'arrays', 'error_bodies_ARRAY_AA13', 'script', NULL),
(152, 'error_bodies_ARRAY_AO01', 'arrays', 'error_bodies_ARRAY_AO01', 'script', NULL),
(153, 'error_bodies_ARRAY_AU01', 'arrays', 'error_bodies_ARRAY_AU01', 'script', NULL),
(154, 'error_bodies_ARRAY_AU03', 'arrays', 'error_bodies_ARRAY_AU03', 'script', NULL),
(155, 'error_bodies_ARRAY_AU04', 'arrays', 'error_bodies_ARRAY_AU04', 'script', NULL),
(156, 'error_bodies_ARRAY_AU08', 'arrays', 'error_bodies_ARRAY_AU08', 'script', NULL),
(159, 'error_titles_ARRAY_AA10', 'arrays', 'error_titles_ARRAY_AA10', 'script', NULL),
(160, 'error_titles_ARRAY_AA11', 'arrays', 'error_titles_ARRAY_AA11', 'script', NULL),
(161, 'error_titles_ARRAY_AA12', 'arrays', 'error_titles_ARRAY_AA12', 'script', NULL),
(162, 'error_titles_ARRAY_AA13', 'arrays', 'error_titles_ARRAY_AA13', 'script', NULL),
(167, 'error_titles_ARRAY_AO01', 'arrays', 'error_titles_ARRAY_AO01', 'script', NULL),
(168, 'error_titles_ARRAY_AU01', 'arrays', 'error_titles_ARRAY_AU01', 'script', NULL),
(169, 'error_titles_ARRAY_AU03', 'arrays', 'error_titles_ARRAY_AU03', 'script', NULL),
(170, 'error_titles_ARRAY_AU04', 'arrays', 'error_titles_ARRAY_AU04', 'script', NULL),
(171, 'error_titles_ARRAY_AU08', 'arrays', 'error_titles_ARRAY_AU08', 'script', NULL),
(174, 'filter_ARRAY_active', 'arrays', 'filter_ARRAY_active', 'script', NULL),
(175, 'filter_ARRAY_inactive', 'arrays', 'filter_ARRAY_inactive', 'script', NULL),
(176, 'login_err_ARRAY_1', 'arrays', 'login_err_ARRAY_1', 'script', NULL),
(177, 'login_err_ARRAY_2', 'arrays', 'login_err_ARRAY_2', 'script', NULL),
(178, 'login_err_ARRAY_3', 'arrays', 'login_err_ARRAY_3', 'script', NULL),
(179, 'months_ARRAY_1', 'arrays', 'months_ARRAY_1', 'script', NULL),
(180, 'months_ARRAY_10', 'arrays', 'months_ARRAY_10', 'script', NULL),
(181, 'months_ARRAY_11', 'arrays', 'months_ARRAY_11', 'script', NULL),
(182, 'months_ARRAY_12', 'arrays', 'months_ARRAY_12', 'script', NULL),
(183, 'months_ARRAY_2', 'arrays', 'months_ARRAY_2', 'script', NULL),
(184, 'months_ARRAY_3', 'arrays', 'months_ARRAY_3', 'script', NULL),
(185, 'months_ARRAY_4', 'arrays', 'months_ARRAY_4', 'script', NULL),
(186, 'months_ARRAY_5', 'arrays', 'months_ARRAY_5', 'script', NULL),
(187, 'months_ARRAY_6', 'arrays', 'months_ARRAY_6', 'script', NULL),
(188, 'months_ARRAY_7', 'arrays', 'months_ARRAY_7', 'script', NULL),
(189, 'months_ARRAY_8', 'arrays', 'months_ARRAY_8', 'script', NULL),
(190, 'months_ARRAY_9', 'arrays', 'months_ARRAY_9', 'script', NULL),
(191, 'personal_titles_ARRAY_dr', 'arrays', 'personal_titles_ARRAY_dr', 'script', NULL),
(192, 'personal_titles_ARRAY_miss', 'arrays', 'personal_titles_ARRAY_miss', 'script', NULL),
(193, 'personal_titles_ARRAY_mr', 'arrays', 'personal_titles_ARRAY_mr', 'script', NULL),
(194, 'personal_titles_ARRAY_mrs', 'arrays', 'personal_titles_ARRAY_mrs', 'script', NULL),
(195, 'personal_titles_ARRAY_ms', 'arrays', 'personal_titles_ARRAY_ms', 'script', NULL),
(196, 'personal_titles_ARRAY_other', 'arrays', 'personal_titles_ARRAY_other', 'script', NULL),
(197, 'personal_titles_ARRAY_prof', 'arrays', 'personal_titles_ARRAY_prof', 'script', NULL),
(198, 'personal_titles_ARRAY_rev', 'arrays', 'personal_titles_ARRAY_rev', 'script', NULL),
(199, 'short_months_ARRAY_1', 'arrays', 'short_months_ARRAY_1', 'script', NULL),
(200, 'short_months_ARRAY_10', 'arrays', 'short_months_ARRAY_10', 'script', NULL),
(201, 'short_months_ARRAY_11', 'arrays', 'short_months_ARRAY_11', 'script', NULL),
(202, 'short_months_ARRAY_12', 'arrays', 'short_months_ARRAY_12', 'script', NULL),
(203, 'short_months_ARRAY_2', 'arrays', 'short_months_ARRAY_2', 'script', NULL),
(204, 'short_months_ARRAY_3', 'arrays', 'short_months_ARRAY_3', 'script', NULL),
(205, 'short_months_ARRAY_4', 'arrays', 'short_months_ARRAY_4', 'script', NULL),
(206, 'short_months_ARRAY_5', 'arrays', 'short_months_ARRAY_5', 'script', NULL),
(207, 'short_months_ARRAY_6', 'arrays', 'short_months_ARRAY_6', 'script', NULL),
(208, 'short_months_ARRAY_7', 'arrays', 'short_months_ARRAY_7', 'script', NULL),
(209, 'short_months_ARRAY_8', 'arrays', 'short_months_ARRAY_8', 'script', NULL),
(210, 'short_months_ARRAY_9', 'arrays', 'short_months_ARRAY_9', 'script', NULL),
(211, 'status_ARRAY_1', 'arrays', 'status_ARRAY_1', 'script', NULL),
(212, 'status_ARRAY_123', 'arrays', 'status_ARRAY_123', 'script', NULL),
(213, 'status_ARRAY_2', 'arrays', 'status_ARRAY_2', 'script', NULL),
(214, 'status_ARRAY_3', 'arrays', 'status_ARRAY_3', 'script', NULL),
(215, 'status_ARRAY_7', 'arrays', 'status_ARRAY_7', 'script', NULL),
(216, 'status_ARRAY_996', 'arrays', 'status_ARRAY_996', 'script', NULL),
(217, 'status_ARRAY_997', 'arrays', 'status_ARRAY_997', 'script', NULL),
(218, 'status_ARRAY_998', 'arrays', 'status_ARRAY_998', 'script', NULL),
(219, 'status_ARRAY_999', 'arrays', 'status_ARRAY_999', 'script', NULL),
(220, 'status_ARRAY_9997', 'arrays', 'status_ARRAY_9997', 'script', NULL),
(221, 'status_ARRAY_9998', 'arrays', 'status_ARRAY_9998', 'script', NULL),
(222, 'status_ARRAY_9999', 'arrays', 'status_ARRAY_9999', 'script', NULL),
(223, 'timezones_ARRAY_-10800', 'arrays', 'timezones_ARRAY_-10800', 'script', NULL),
(224, 'timezones_ARRAY_-14400', 'arrays', 'timezones_ARRAY_-14400', 'script', NULL),
(225, 'timezones_ARRAY_-18000', 'arrays', 'timezones_ARRAY_-18000', 'script', NULL),
(226, 'timezones_ARRAY_-21600', 'arrays', 'timezones_ARRAY_-21600', 'script', NULL),
(227, 'timezones_ARRAY_-25200', 'arrays', 'timezones_ARRAY_-25200', 'script', NULL),
(228, 'timezones_ARRAY_-28800', 'arrays', 'timezones_ARRAY_-28800', 'script', NULL),
(229, 'timezones_ARRAY_-32400', 'arrays', 'timezones_ARRAY_-32400', 'script', NULL),
(230, 'timezones_ARRAY_-3600', 'arrays', 'timezones_ARRAY_-3600', 'script', NULL),
(231, 'timezones_ARRAY_-36000', 'arrays', 'timezones_ARRAY_-36000', 'script', NULL),
(232, 'timezones_ARRAY_-39600', 'arrays', 'timezones_ARRAY_-39600', 'script', NULL),
(233, 'timezones_ARRAY_-43200', 'arrays', 'timezones_ARRAY_-43200', 'script', NULL),
(234, 'timezones_ARRAY_-7200', 'arrays', 'timezones_ARRAY_-7200', 'script', NULL),
(235, 'timezones_ARRAY_0', 'arrays', 'timezones_ARRAY_0', 'script', NULL),
(236, 'timezones_ARRAY_10800', 'arrays', 'timezones_ARRAY_10800', 'script', NULL),
(237, 'timezones_ARRAY_14400', 'arrays', 'timezones_ARRAY_14400', 'script', NULL),
(238, 'timezones_ARRAY_18000', 'arrays', 'timezones_ARRAY_18000', 'script', NULL),
(239, 'timezones_ARRAY_21600', 'arrays', 'timezones_ARRAY_21600', 'script', NULL),
(240, 'timezones_ARRAY_25200', 'arrays', 'timezones_ARRAY_25200', 'script', NULL),
(241, 'timezones_ARRAY_28800', 'arrays', 'timezones_ARRAY_28800', 'script', NULL),
(242, 'timezones_ARRAY_32400', 'arrays', 'timezones_ARRAY_32400', 'script', NULL),
(243, 'timezones_ARRAY_3600', 'arrays', 'timezones_ARRAY_3600', 'script', NULL),
(244, 'timezones_ARRAY_36000', 'arrays', 'timezones_ARRAY_36000', 'script', NULL),
(245, 'timezones_ARRAY_39600', 'arrays', 'timezones_ARRAY_39600', 'script', NULL),
(246, 'timezones_ARRAY_43200', 'arrays', 'timezones_ARRAY_43200', 'script', NULL),
(247, 'timezones_ARRAY_46800', 'arrays', 'timezones_ARRAY_46800', 'script', NULL),
(248, 'timezones_ARRAY_7200', 'arrays', 'timezones_ARRAY_7200', 'script', NULL),
(249, 'u_statarr_ARRAY_F', 'arrays', 'u_statarr_ARRAY_F', 'script', NULL),
(250, 'u_statarr_ARRAY_T', 'arrays', 'u_statarr_ARRAY_T', 'script', NULL),
(251, '_yesno_ARRAY_F', 'arrays', '_yesno_ARRAY_F', 'script', NULL),
(252, '_yesno_ARRAY_T', 'arrays', '_yesno_ARRAY_T', 'script', NULL),
(253, 'delete_selected', 'backend', 'Label / Delete selected', 'script', NULL),
(254, 'delete_confirmation', 'backend', 'Label / delete confirmation', 'script', NULL),
(255, 'lblAll', 'backend', 'Label / All', 'script', NULL),
(256, 'email_taken', 'backend', 'Label / email taken', 'script', NULL),
(308, 'lblDashLastLogin', 'backend', 'Label / Last login', 'script', NULL),
(360, 'menuInstall', 'backend', 'Menu / Install', 'script', NULL),
(361, 'menuPreview', 'backend', 'Menu / Preview', 'script', NULL),
(480, 'infoUsersTitle', 'backend', 'Infobox / List of users', 'script', NULL),
(481, 'infoUsersDesc', 'backend', 'Infobox / List of users', 'script', NULL),
(482, 'btnAddUser', 'backend', 'Button / + Add user', 'script', NULL),
(483, 'gridEmptyTitle', 'backend', 'Grid / No records selected', 'script', NULL),
(484, 'gridEmptyBody', 'backend', 'Grid / You need to select at least a single record.', 'script', NULL),
(485, 'infoAddUserTitle', 'backend', 'Infobox / Add user', 'script', NULL),
(486, 'infoAddUserDesc', 'backend', 'Infobox / Add user', 'script', NULL),
(487, 'lblPhone', 'backend', 'Label / Phone', 'script', NULL),
(488, 'infoUpdateUserTitle', 'backend', 'Infobox / Update user', 'script', NULL),
(489, 'infoUpdateUserDesc', 'backend', 'Infobox / Update user', 'script', NULL),
(490, 'menuGeneral', 'backend', 'Menu / General', 'script', NULL),
(491, 'infoGeneralTitle', 'backend', 'Infobox / General options', 'script', NULL),
(492, 'infoGeneralDesc', 'backend', 'Infobox / General options', 'script', NULL),
(493, 'opt_o_time_format', 'backend', 'Options / Time format', 'script', NULL),
(639, 'menuFloorplans', 'backend', 'Menu / Floor plans', 'script', NULL),
(640, 'infoFloorplansTitle', 'backend', 'Infobox / Floor plans list', 'script', NULL),
(641, 'infoFloorplansDesc', 'backend', 'Infobox / List of floorplans', 'script', NULL),
(642, 'btnAddFloorplan', 'backend', 'Button / + Add floor plan', 'script', NULL),
(643, 'lblTitle', 'backend', 'Label / Title', 'script', NULL),
(644, 'lblFloorplan', 'backend', 'Label / Floorplan', 'script', NULL),
(645, 'error_titles_ARRAY_AF01', 'arrays', 'error_titles_ARRAY_AF01', 'script', NULL),
(646, 'error_bodies_ARRAY_AF01', 'arrays', 'error_bodies_ARRAY_AF01', 'script', NULL),
(647, 'error_titles_ARRAY_AF03', 'arrays', 'error_titles_ARRAY_AF03', 'script', NULL),
(648, 'error_bodies_ARRAY_AF03', 'arrays', 'error_bodies_ARRAY_AF03', 'script', NULL),
(649, 'error_titles_ARRAY_AF04', 'arrays', 'error_titles_ARRAY_AF04', 'script', NULL),
(650, 'error_bodies_ARRAY_AF04', 'arrays', 'error_bodies_ARRAY_AF04', 'script', NULL),
(651, 'error_titles_ARRAY_AF05', 'arrays', 'error_titles_ARRAY_AF05', 'script', NULL),
(652, 'error_bodies_ARRAY_AF05', 'arrays', 'error_bodies_ARRAY_AF05', 'script', NULL),
(653, 'error_titles_ARRAY_AF08', 'arrays', 'error_titles_ARRAY_AF08', 'script', NULL),
(654, 'error_bodies_ARRAY_AF08', 'arrays', 'error_bodies_ARRAY_AF08', 'script', NULL),
(655, 'error_titles_ARRAY_AF09', 'arrays', 'error_titles_ARRAY_AF09', 'script', NULL),
(656, 'error_bodies_ARRAY_AF09', 'arrays', 'error_bodies_ARRAY_AF09', 'script', NULL),
(657, 'infoAddFloorplanTitle', 'backend', 'Infobox / Add floor plan', 'script', NULL),
(658, 'infoAddFloorplanDesc', 'backend', 'Infobox / Add floor plan', 'script', NULL),
(659, 'tabFloorplan', 'backend', 'Tab / Floor plan', 'script', NULL),
(660, 'tabImages', 'backend', 'Tab / Images', 'script', NULL),
(661, 'infoUpdateFloorplanTitle', 'backend', 'Infobox / Edit floor plan', 'script', NULL),
(662, 'infoUpdateFloorplanDesc', 'backend', 'Infobox / Update floorplan', 'script', NULL),
(663, 'infoImagesTitle', 'backend', 'Infobox / Images', 'script', NULL),
(664, 'infoImagesDesc', 'backend', 'Infobox / Images', 'script', NULL),
(665, 'btnDeleteFloorplan', 'backend', 'Button / Delete floor plan', 'script', NULL),
(666, 'lblAdd', 'backend', 'Label / Add', 'script', NULL),
(667, 'lblRotationDegree', 'backend', 'Label / Rotation degree', 'script', NULL),
(668, 'lblSize', 'backend', 'Label / Size', 'script', NULL),
(669, 'buttons_ARRAY_save', 'arrays', 'buttons_ARRAY_save', 'script', NULL),
(670, 'lblUpdate', 'backend', 'Label / Edit camera icon & image', 'script', NULL),
(671, 'lblImagePosition', 'backend', 'Label / Image tooltip position', 'script', NULL),
(672, 'position_ARRAY_top_left', 'arrays', 'position_ARRAY_top_left', 'script', NULL),
(673, 'position_ARRAY_top_center', 'arrays', 'position_ARRAY_top_center', 'script', NULL),
(674, 'position_ARRAY_top_right', 'arrays', 'position_ARRAY_top_right', 'script', NULL),
(675, 'position_ARRAY_bottom_right', 'arrays', 'position_ARRAY_bottom_right', 'script', NULL),
(676, 'position_ARRAY_bottom_center', 'arrays', 'position_ARRAY_bottom_center', 'script', NULL),
(677, 'position_ARRAY_bottom_left', 'arrays', 'position_ARRAY_bottom_left', 'script', NULL),
(678, 'lblDimensions', 'backend', 'Label / Dimensions', 'script', NULL),
(679, 'lblInfo', 'backend', 'Label / Description', 'script', NULL),
(680, 'lblDeleteFloorplanConfirm', 'backend', 'Label / Delete floor plan confirmation', 'script', NULL),
(681, 'lblInstallJs1_title', 'backend', 'Label / Install title', 'script', NULL),
(682, 'lblInstallJs1_body', 'backend', 'Label / Install body', 'script', NULL),
(683, 'lblChooseTheme', 'backend', 'Label / Choose theme', 'script', NULL),
(684, 'infoPreviewTitle', 'backend', 'Label / Preview front end', 'script', NULL),
(685, 'infoPreviewDesc', 'backend', 'Label / Preview front end', 'script', NULL),
(686, 'infoThemeTitle', 'backend', 'Infobox / Preview front end', 'script', NULL),
(687, 'infoThemeDesc', 'backend', 'Infobox / Preview front end', 'script', NULL),
(688, 'lblInstallTheme', 'backend', 'Label / Choose theme', 'script', NULL),
(689, 'option_themes_ARRAY_1', 'arrays', 'option_themes_ARRAY_1', 'script', NULL),
(690, 'option_themes_ARRAY_2', 'arrays', 'option_themes_ARRAY_2', 'script', NULL),
(691, 'option_themes_ARRAY_3', 'arrays', 'option_themes_ARRAY_3', 'script', NULL),
(692, 'option_themes_ARRAY_4', 'arrays', 'option_themes_ARRAY_4', 'script', NULL),
(693, 'option_themes_ARRAY_5', 'arrays', 'option_themes_ARRAY_5', 'script', NULL),
(694, 'option_themes_ARRAY_6', 'arrays', 'option_themes_ARRAY_6', 'script', NULL),
(695, 'option_themes_ARRAY_7', 'arrays', 'option_themes_ARRAY_7', 'script', NULL),
(696, 'option_themes_ARRAY_8', 'arrays', 'option_themes_ARRAY_8', 'script', NULL),
(697, 'option_themes_ARRAY_9', 'arrays', 'option_themes_ARRAY_9', 'script', NULL),
(698, 'option_themes_ARRAY_10', 'arrays', 'option_themes_ARRAY_10', 'script', NULL),
(699, 'lblCurrentlyInUse', 'backend', 'Label / Currently in use', 'script', NULL),
(700, 'btnUseThisTheme', 'backend', 'Label / Use this theme', 'script', NULL),
(701, 'infoGeneralOptionTitle', 'backend', 'General options', 'script', NULL),
(702, 'infoGeneralOptionDesc', 'backend', 'General options', 'script', NULL),
(703, 'buttons_ARRAY_delete', 'arrays', 'buttons_ARRAY_delete', 'script', NULL),
(704, 'buttons_ARRAY_cancel', 'arrays', 'buttons_ARRAY_cancel', 'script', NULL),
(705, 'front_size', 'frontend', 'Label / Size', 'script', NULL),
(706, 'front_dimensions', 'frontend', 'Label / Dimensions', 'script', NULL),
(707, 'buttons_ARRAY_resize', 'arrays', 'buttons_ARRAY_resize', 'script', NULL),
(708, 'btnResizeImage', 'backend', 'Button / Resize floor plan', 'script', NULL),
(709, 'lblCurrentImageSize', 'backend', 'Label / Current image size', 'script', NULL),
(710, 'lblNewWidth', 'backend', 'Label / New width', 'script', NULL),
(711, 'lblNewHeight', 'backend', 'Label / New height', 'script', NULL),
(712, 'lblSelectFloorplan', 'backend', 'Label / Select floor plan', 'script', NULL),
(713, 'lblNoFloorplansMessage', 'backend', 'Label / No floorplans found.', 'script', NULL),
(714, 'btnPreview', 'backend', 'Button / Preview', 'script', NULL),
(715, 'btnGetInstallCode', 'backend', 'Button / Get Install Code', 'script', NULL),
(716, 'menuInstallPreview', 'backend', 'Menu / Install & Preview', 'script', NULL),
(717, 'lblImages', 'backend', 'Label / Images', 'script', NULL),
(718, 'lblSelectAnImage', 'backend', 'Label / Select an image', 'script', NULL),
(719, 'lblFieldRequired', 'backend', 'Label / This field is required.', 'script', NULL),
(720, 'lblNoImagesMessage', 'backend', 'Label / No images found.', 'script', NULL),
(721, 'lblEmailInvalid', 'backend', 'Label / Email is invalid.', 'script', NULL),
(722, 'front_floorplan_not_exist', 'frontend', 'Label / The floorplan does not exist.', 'script', NULL),
(723, 'error_titles_ARRAY_AF07', 'arrays', 'error_titles_ARRAY_AF07', 'script', NULL),
(724, 'error_bodies_ARRAY_AF07', 'arrays', 'error_bodies_ARRAY_AF07', 'script', NULL),
(725, 'error_titles_ARRAY_AF10', 'arrays', 'error_titles_ARRAY_AF10', 'script', NULL),
(727, 'error_bodies_ARRAY_AF10', 'arrays', 'error_bodies_ARRAY_AF10', 'script', NULL),
(728, 'lblRestoreImage', 'backend', 'Label / Restore image', 'script', NULL),
(729, 'lblOriginalSize', 'backend', 'Label / Original size', 'script', NULL),
(730, 'lblCameraIcon', 'backend', 'Label / Camera icon', 'script', NULL),
(731, 'lblInfoBox', 'backend', 'Label / Infobox', 'script', NULL),
(732, 'lblUpdate2', 'backend', 'Label / Edit infobox', 'script', NULL),
(733, 'role_arr_ARRAY_admin', 'arrays', 'role_arr_ARRAY_admin', 'script', NULL),
(734, 'role_arr_ARRAY_editor', 'arrays', 'role_arr_ARRAY_editor', 'script', NULL),
(735, 'error_titles_ARRAY_AF06', 'arrays', 'error_titles_ARRAY_AF06', 'script', NULL),
(736, 'error_bodies_ARRAY_AF06', 'arrays', 'error_bodies_ARRAY_AF06', 'script', NULL),
(737, 'error_titles_ARRAY_AF11', 'arrays', 'error_titles_ARRAY_AF11', 'script', NULL),
(738, 'error_bodies_ARRAY_AF11', 'arrays', 'error_bodies_ARRAY_AF11', 'script', NULL),
(739, 'plugin_locale_languages', 'backend', 'Locale plugin / Languages', 'plugin', NULL),
(740, 'plugin_locale_titles', 'backend', 'Locale plugin / Title', 'plugin', NULL),
(741, 'plugin_locale_index_title', 'backend', 'Locale plugin / Languages info title', 'plugin', NULL),
(742, 'plugin_locale_index_body', 'backend', 'Locale plugin / Languages info body', 'plugin', NULL),
(743, 'plugin_locale_titles_title', 'backend', 'Locale plugin / Titles info title', 'plugin', NULL),
(744, 'plugin_locale_titles_body', 'backend', 'Locale plugin / Titles info body', 'plugin', NULL),
(745, 'plugin_locale_lbl_title', 'backend', 'Locale plugin / Title', 'plugin', NULL),
(746, 'plugin_locale_lbl_flag', 'backend', 'Locale plugin / Flag', 'plugin', NULL),
(747, 'plugin_locale_lbl_is_default', 'backend', 'Locale plugin / Is default', 'plugin', NULL),
(748, 'plugin_locale_lbl_order', 'backend', 'Locale plugin / Order', 'plugin', NULL),
(749, 'plugin_locale_add_lang', 'backend', 'Locale plugin / Add Language', 'plugin', NULL),
(750, 'plugin_locale_lbl_field', 'backend', 'Locale plugin / Field', 'plugin', NULL),
(751, 'plugin_locale_lbl_value', 'backend', 'Locale plugin / Value', 'plugin', NULL),
(752, 'plugin_locale_type_backend', 'backend', 'Locale plugin / Back-end title', 'plugin', NULL),
(753, 'plugin_locale_type_frontend', 'backend', 'Locale plugin / Front-end title', 'plugin', NULL),
(754, 'plugin_locale_type_arrays', 'backend', 'Locale plugin / Special title', 'plugin', NULL),
(755, 'error_titles_ARRAY_PAL01', 'arrays', 'Locale plugin / Status title', 'plugin', NULL),
(756, 'error_bodies_ARRAY_PAL01', 'arrays', 'Locale plugin / Status body', 'plugin', NULL),
(757, 'plugin_locale_lbl_rows', 'backend', 'Locale plugin / Per page', 'plugin', NULL),
(758, 'error_titles_ARRAY_PAL02', 'arrays', 'Locale plugin / Status title', 'plugin', NULL),
(759, 'error_bodies_ARRAY_PAL02', 'arrays', 'Locale plugin / Status body', 'plugin', NULL),
(760, 'error_titles_ARRAY_PAL03', 'arrays', 'Locale plugin / Status title', 'plugin', NULL),
(761, 'error_bodies_ARRAY_PAL03', 'arrays', 'Locale plugin / Status body', 'plugin', NULL),
(762, 'error_titles_ARRAY_PAL04', 'arrays', 'Locale plugin / Status title', 'plugin', NULL),
(763, 'error_bodies_ARRAY_PAL04', 'arrays', 'Locale plugin / Status body', 'plugin', NULL),
(764, 'error_titles_ARRAY_PAL05', 'arrays', 'Locale plugin / Status title', 'plugin', NULL),
(765, 'error_bodies_ARRAY_PAL05', 'arrays', 'Locale plugin / Status body', 'plugin', NULL),
(766, 'plugin_locale_import_export', 'backend', 'Locale plugin / Import Export menu', 'plugin', NULL),
(767, 'plugin_locale_import', 'backend', 'Locale plugin / Import', 'plugin', NULL),
(768, 'plugin_locale_export', 'backend', 'Locale plugin / Export', 'plugin', NULL),
(769, 'plugin_locale_language', 'backend', 'Locale plugin / Language', 'plugin', NULL),
(770, 'plugin_locale_browse', 'backend', 'Locale plugin / Browse your computer', 'plugin', NULL),
(771, 'plugin_locale_ie_title', 'backend', 'Locale plugin / Import Export (title)', 'plugin', NULL),
(772, 'plugin_locale_ie_body', 'backend', 'Locale plugin / Import Export (body)', 'plugin', NULL),
(773, 'plugin_locale_separator', 'backend', 'Locale plugin / Delimiter', 'plugin', '2014-07-16 14:02:18'),
(774, 'plugin_locale_separators_ARRAY_comma', 'arrays', 'Locale plugin / Delimiter: comma', 'plugin', '2014-07-16 14:02:36'),
(775, 'plugin_locale_separators_ARRAY_semicolon', 'arrays', 'Locale plugin / Delimiter: semicolon', 'plugin', '2014-07-16 14:02:52'),
(776, 'plugin_locale_separators_ARRAY_tab', 'arrays', 'Locale plugin / Delimiter: tab', 'plugin', '2014-07-16 14:03:09'),
(777, 'error_bodies_ARRAY_PAL20', 'arrays', 'error_bodies_ARRAY_PAL20', 'plugin', '2014-07-21 07:54:40'),
(778, 'error_titles_ARRAY_PAL20', 'arrays', 'error_titles_ARRAY_PAL20', 'plugin', '2014-07-21 07:55:25'),
(779, 'error_titles_ARRAY_PAL11', 'arrays', 'error_titles_ARRAY_PAL11', 'plugin', '2014-07-21 07:58:06'),
(780, 'error_bodies_ARRAY_PAL11', 'arrays', 'error_bodies_ARRAY_PAL11', 'plugin', '2014-07-21 07:58:37'),
(781, 'error_titles_ARRAY_PAL12', 'arrays', 'error_titles_ARRAY_PAL12', 'plugin', '2014-07-21 07:59:00'),
(782, 'error_bodies_ARRAY_PAL12', 'arrays', 'error_bodies_ARRAY_PAL12', 'plugin', '2014-07-21 07:59:46'),
(783, 'error_titles_ARRAY_PAL13', 'arrays', 'error_titles_ARRAY_PAL13', 'plugin', '2014-07-21 08:00:05'),
(784, 'error_bodies_ARRAY_PAL13', 'arrays', 'error_bodies_ARRAY_PAL13', 'plugin', '2014-07-21 08:01:02'),
(785, 'error_titles_ARRAY_PAL14', 'arrays', 'error_titles_ARRAY_PAL14', 'plugin', '2014-07-21 08:01:15'),
(786, 'error_bodies_ARRAY_PAL14', 'arrays', 'error_bodies_ARRAY_PAL14', 'plugin', '2014-07-21 08:01:37'),
(787, 'error_titles_ARRAY_PAL15', 'arrays', 'error_titles_ARRAY_PAL15', 'plugin', '2014-07-21 08:01:51'),
(788, 'error_bodies_ARRAY_PAL15', 'arrays', 'error_bodies_ARRAY_PAL15', 'plugin', '2014-07-21 08:04:05'),
(789, 'error_titles_ARRAY_PAL16', 'arrays', 'error_titles_ARRAY_PAL16', 'plugin', '2014-07-21 08:04:13'),
(790, 'error_bodies_ARRAY_PAL16', 'arrays', 'error_bodies_ARRAY_PAL16', 'plugin', '2014-07-21 08:05:29'),
(791, 'error_titles_ARRAY_PAL17', 'arrays', 'error_titles_ARRAY_PAL17', 'plugin', '2014-07-21 08:06:10'),
(792, 'error_bodies_ARRAY_PAL17', 'arrays', 'error_bodies_ARRAY_PAL17', 'plugin', '2014-07-21 08:06:27'),
(793, 'error_titles_ARRAY_PAL18', 'arrays', 'error_titles_ARRAY_PAL18', 'plugin', '2014-07-21 08:26:34'),
(794, 'error_bodies_ARRAY_PAL18', 'arrays', 'error_bodies_ARRAY_PAL18', 'plugin', '2014-07-21 08:27:01'),
(795, 'error_titles_ARRAY_PAL19', 'arrays', 'error_titles_ARRAY_PAL19', 'plugin', '2014-07-21 08:27:15'),
(796, 'error_bodies_ARRAY_PAL19', 'arrays', 'error_bodies_ARRAY_PAL19', 'plugin', '2014-07-21 08:27:27'),
(797, 'plugin_locale_lbl_id', 'backend', 'Label / ID:', 'plugin', NULL),
(798, 'plugin_locale_lbl_show_id', 'backend', 'Label / Show ID in all titles to easily locate them', 'plugin', NULL),
(799, 'plugin_locale_showid_dialog_title', 'backend', 'Label / Show IDs', 'plugin', NULL),
(800, 'plugin_locale_showid_dialog_desc', 'backend', 'Label / Show IDs', 'plugin', NULL),
(801, 'plugin_locale_button_confirm', 'backend', 'Button / Confirm', 'plugin', NULL),
(802, 'plugin_locale_button_cancel', 'backend', 'Button / Cancel', 'plugin', NULL),
(803, 'plugin_locale_default', 'backend', 'Label / default', 'plugin', NULL),
(804, 'plugin_log_menu_log', 'backend', 'Log plugin / Menu Log', 'plugin', NULL),
(805, 'plugin_log_menu_config', 'backend', 'Log plugin / Menu Config', 'plugin', NULL),
(806, 'plugin_log_btn_empty', 'backend', 'Log plugin / Empty button', 'plugin', NULL),
(807, 'error_titles_ARRAY_PLG01', 'arrays', 'error_titles_ARRAY_PLG01', 'plugin', NULL),
(808, 'error_bodies_ARRAY_PLG01', 'arrays', 'error_bodies_ARRAY_PLG01', 'plugin', NULL),
(809, 'error_titles_ARRAY_PBU01', 'arrays', 'error_titles_ARRAY_PBU01', 'plugin', NULL),
(810, 'error_titles_ARRAY_PBU02', 'arrays', 'error_titles_ARRAY_PBU02', 'plugin', NULL),
(811, 'error_titles_ARRAY_PBU03', 'arrays', 'error_titles_ARRAY_PBU03', 'plugin', NULL),
(812, 'error_titles_ARRAY_PBU04', 'arrays', 'error_titles_ARRAY_PBU04', 'plugin', NULL),
(813, 'error_bodies_ARRAY_PBU01', 'arrays', 'error_bodies_ARRAY_PBU01', 'plugin', NULL),
(814, 'error_bodies_ARRAY_PBU02', 'arrays', 'error_bodies_ARRAY_PBU02', 'plugin', NULL),
(815, 'error_bodies_ARRAY_PBU03', 'arrays', 'error_bodies_ARRAY_PBU03', 'plugin', NULL),
(816, 'error_bodies_ARRAY_PBU04', 'arrays', 'error_bodies_ARRAY_PBU04', 'plugin', NULL),
(817, 'plugin_backup_menu_backup', 'backend', 'Backup plugin / Menu Backup', 'plugin', NULL),
(818, 'plugin_backup_database', 'backend', 'Backup plugin / Backup database', 'plugin', NULL),
(819, 'plugin_backup_files', 'backend', 'Backup plugin / Backup files', 'plugin', NULL),
(820, 'plugin_backup_btn_backup', 'backend', 'Backup plugin / Backup button', 'plugin', NULL),
(821, 'error_titles_ARRAY_PBU05', 'arrays', 'error_titles_ARRAY_PBU05', 'plugin', NULL),
(822, 'error_bodies_ARRAY_PBU05', 'arrays', 'error_bodies_ARRAY_PBU05', 'plugin', NULL),
(823, 'error_titles_ARRAY_PBU06', 'arrays', 'error_titles_ARRAY_PBU06', 'plugin', NULL),
(824, 'error_bodies_ARRAY_PBU06', 'arrays', 'error_bodies_ARRAY_PBU06', 'plugin', NULL),
(825, 'plugin_one_admin_menu_index', 'backend', 'One Admin plugin / List', 'plugin', NULL),
(826, 'plugin_one_admin_btn_add', 'backend', 'One Admin plugin / Add button', 'plugin', NULL),
(827, 'error_titles_ARRAY_POA01', 'arrays', 'error_titles_ARRAY_POA01', 'plugin', NULL),
(828, 'error_bodies_ARRAY_POA01', 'arrays', 'error_bodies_ARRAY_POA01', 'plugin', NULL),
(829, 'plugin_gallery_alt', 'backend', 'Gallery plugin / ALT', 'plugin', NULL),
(830, 'plugin_gallery_watermark_position', 'backend', 'Gallery plugin / Watermark position', 'plugin', NULL),
(831, 'plugin_gallery_position', 'backend', 'Gallery plugin / Position', 'plugin', NULL),
(832, 'plugin_gallery_image_settings', 'backend', 'Gallery plugin / Image settings', 'plugin', NULL),
(833, 'plugin_gallery_confirmation_multi', 'backend', 'Gallery plugin / Delete all confirmation', 'plugin', NULL),
(834, 'plugin_gallery_confirmation_single', 'backend', 'Gallery plugin / Delete image confirmation', 'plugin', NULL),
(835, 'plugin_gallery_delete_confirmation', 'backend', 'Gallery plugin / Delete confirmation', 'plugin', NULL),
(836, 'plugin_gallery_compression_note', 'backend', 'Gallery plugin / Compression note', 'plugin', NULL),
(837, 'plugin_gallery_btn_delete', 'backend', 'Gallery plugin / Button Delete', 'plugin', NULL),
(838, 'plugin_gallery_btn_cancel', 'backend', 'Gallery plugin / Button Cancel', 'plugin', NULL),
(839, 'plugin_gallery_btn_save', 'backend', 'Gallery plugin / Button Save', 'plugin', NULL),
(840, 'plugin_gallery_btn_set_watermark', 'backend', 'Gallery plugin / Set watermark', 'plugin', NULL),
(841, 'plugin_gallery_btn_clear_current', 'backend', 'Gallery plugin / Clear current one', 'plugin', NULL),
(842, 'plugin_gallery_btn_compress', 'backend', 'Gallery plugin / Button Compress', 'plugin', NULL),
(843, 'plugin_gallery_btn_recreate', 'backend', 'Gallery plugin / Button Recreate', 'plugin', NULL),
(844, 'plugin_gallery_top_left', 'backend', 'Gallery plugin / Top Left', 'plugin', NULL),
(845, 'plugin_gallery_top_center', 'backend', 'Gallery plugin / Top Center', 'plugin', NULL),
(846, 'plugin_gallery_bottom_left', 'backend', 'Gallery plugin / Bottom Left', 'plugin', NULL),
(847, 'plugin_gallery_bottom_right', 'backend', 'Gallery plugin / Bottom Right', 'plugin', NULL),
(848, 'plugin_gallery_bottom_center', 'backend', 'Gallery plugin / Bottom Center', 'plugin', NULL),
(849, 'plugin_gallery_center_left', 'backend', 'Gallery plugin / Center Left', 'plugin', NULL),
(850, 'plugin_gallery_center_right', 'backend', 'Gallery plugin / Center Right', 'plugin', NULL),
(851, 'plugin_gallery_center_center', 'backend', 'Gallery plugin / Center Center', 'plugin', NULL),
(852, 'plugin_gallery_top_right', 'backend', 'Gallery plugin / Top Right', 'plugin', NULL),
(853, 'plugin_gallery_empty_result', 'backend', 'Gallery plugin / Empty result set', 'plugin', NULL),
(854, 'plugin_gallery_move', 'backend', 'Gallery plugin / Move', 'plugin', NULL),
(855, 'plugin_gallery_edit', 'backend', 'Gallery plugin / Edit', 'plugin', NULL),
(856, 'plugin_gallery_delete', 'backend', 'Gallery plugin / Delete', 'plugin', NULL),
(857, 'plugin_gallery_resize', 'backend', 'Gallery plugin / Resize', 'plugin', NULL),
(858, 'plugin_gallery_rotate', 'backend', 'Gallery plugin / Rotate', 'plugin', NULL),
(859, 'plugin_gallery_watermark', 'backend', 'Gallery plugin / Watermark', 'plugin', NULL),
(860, 'plugin_gallery_compression', 'backend', 'Gallery plugin / Compression', 'plugin', NULL),
(861, 'plugin_gallery_delete_all', 'backend', 'Gallery plugin / Delete All', 'plugin', NULL),
(862, 'plugin_gallery_originals', 'backend', 'Gallery plugin / Originals', 'plugin', NULL),
(863, 'plugin_gallery_thumbs', 'backend', 'Gallery plugin / Thumbs', 'plugin', NULL),
(864, 'plugin_gallery_photos', 'backend', 'Gallery plugin / photos', 'plugin', NULL),
(865, 'plugin_gallery_upload', 'backend', 'Gallery plugin / Upload', 'plugin', NULL),
(866, 'plugin_gallery_recreate', 'backend', 'Gallery plugin / Recreate from original', 'plugin', NULL),
(867, 'plugin_gallery_original', 'backend', 'Gallery plugin / Original', 'plugin', NULL),
(868, 'plugin_gallery_preview', 'backend', 'Gallery plugin / Preview', 'plugin', NULL),
(869, 'plugin_gallery_thumb', 'backend', 'Gallery plugin / Thumb', 'plugin', NULL),
(870, 'plugin_gallery_btn_back', 'backend', 'Gallery plugin / Button Back', 'plugin', NULL),
(871, 'plugin_gallery_resize_body', 'backend', 'Gallery plugin / Resize Notice body', 'plugin', NULL),
(872, 'plugin_gallery_resize_title', 'backend', 'Gallery plugin / Resize Notice title', 'plugin', NULL),
(873, 'plugin_gallery_watermark_text', 'backend', 'Gallery plugin / Watermark text', 'plugin', '2015-09-10 17:06:06'),
(874, 'plugin_gallery_watermark_image', 'backend', 'Gallery plugin / Watermark text', 'plugin', '2015-09-10 17:06:06'),
(875, 'plugin_gallery_compression_title', 'backend', 'Gallery plugin / Watermark text', 'plugin', '2015-09-10 17:06:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_floorplans`
--

CREATE TABLE `cbbfloorplan_floorplans` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `original_image` varchar(255) DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T',
  `floor` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_floorplans`
--

INSERT INTO `cbbfloorplan_floorplans` (`id`, `title`, `image`, `original_image`, `status`, `floor`) VALUES
(4, 'Floor 20', 'app/web/upload/floorplans/4_1c6ff1054fe961d2648d4974fe4a7528.jpg', 'app/web/upload/floorplans/original/4_1c6ff1054fe961d2648d4974fe4a7528.jpg', 'T', 20),
(5, 'Floor 40', 'app/web/upload/floorplans/5_a0e0ca31007c4c1107d0dfd631db6a8f.png', 'app/web/upload/floorplans/original/5_a0e0ca31007c4c1107d0dfd631db6a8f.png', 'T', 40),
(6, 'FLOOR 30', 'app/web/upload/floorplans/6_6b756c2b48d5ed98b592367f97b2fc66.jpg', 'app/web/upload/floorplans/original/6_6b756c2b48d5ed98b592367f97b2fc66.jpg', 'T', 30),
(10, 'Mezzanina', 'app/web/upload/floorplans/10_96cc72fb56e3fddd3f7f512ceca44cca.jpg', 'app/web/upload/floorplans/original/10_96cc72fb56e3fddd3f7f512ceca44cca.jpg', 'T', 1001),
(13, 'Floorplan 7', 'app/web/upload/floorplans/13_594cf939b8b478756cb2f6cbf515bf9d.png', 'app/web/upload/floorplans/original/13_594cf939b8b478756cb2f6cbf515bf9d.png', 'T', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_floorroom`
--

CREATE TABLE `cbbfloorplan_floorroom` (
  `id` int(11) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `status` enum('T','F') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cbbfloorplan_floorroom`
--

INSERT INTO `cbbfloorplan_floorroom` (`id`, `room`, `status`) VALUES
(4, 'Electrical', 'T'),
(5, 'Communications', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_listplans`
--

CREATE TABLE `cbbfloorplan_listplans` (
  `id` int(11) NOT NULL,
  `foreign_floor` int(11) DEFAULT NULL,
  `foreign_typeplane` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` enum('T','F') CHARACTER SET utf8 NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cbbfloorplan_listplans`
--

INSERT INTO `cbbfloorplan_listplans` (`id`, `foreign_floor`, `foreign_typeplane`, `image`, `title`, `status`, `thumbnail`) VALUES
(15, 40, 6, 'app/web/upload/floorplans/original/15_3d66e344c8c2144bfb1f18c34c69ce03.jpg', 'Segundo plano', 'T', 'app/web/upload/floorplans/15_3d66e344c8c2144bfb1f18c34c69ce03.jpg'),
(16, 2, 10, 'app/web/upload/floorplans/original/16_1f7b9b25180557d514b2d97fe4d02859.png', 'Primer Plano', 'T', 'app/web/upload/floorplans/16_1f7b9b25180557d514b2d97fe4d02859.png'),
(17, 40, 6, 'app/web/upload/floorplans/original/17_13ef2ddfb424bf7be4f7bf85f48743d8.jpg', 'Tercer plano', 'T', 'app/web/upload/floorplans/17_13ef2ddfb424bf7be4f7bf85f48743d8.jpg'),
(18, 40, 10, 'app/web/upload/floorplans/original/18_af0179671ca837ba7c5156663ccebb25.jpg', 'Plano Mecanico', 'T', 'app/web/upload/floorplans/18_af0179671ca837ba7c5156663ccebb25.jpg'),
(19, 1001, 6, 'app/web/upload/floorplans/original/19_21cbef0ba7808c0e55e9fb4020f2ecfd.png', 'Plano electrico de mezzanina', 'T', 'app/web/upload/floorplans/19_21cbef0ba7808c0e55e9fb4020f2ecfd.png'),
(21, 1000, 6, 'app/web/upload/floorplans/original/21_1057fbc876edb3714ec6c2374d3374e2.png', 'Electrical Lobby', 'T', 'app/web/upload/floorplans/21_1057fbc876edb3714ec6c2374d3374e2.png'),
(22, 7, 6, 'app/web/upload/floorplans/original/22_8571cd2314640c5f99f0f521bcd8db86.png', 'Electrical Plan 7', 'T', 'app/web/upload/floorplans/22_8571cd2314640c5f99f0f521bcd8db86.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_multi_lang`
--

CREATE TABLE `cbbfloorplan_multi_lang` (
  `id` int(10) UNSIGNED NOT NULL,
  `foreign_id` int(10) UNSIGNED DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `locale` tinyint(3) UNSIGNED DEFAULT NULL,
  `field` varchar(50) DEFAULT NULL,
  `content` text,
  `source` enum('script','plugin','data') DEFAULT 'script'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_multi_lang`
--

INSERT INTO `cbbfloorplan_multi_lang` (`id`, `foreign_id`, `model`, `locale`, `field`, `content`, `source`) VALUES
(1, 2, 'pjField', 1, 'title', 'Password reminder', 'script'),
(2, 3, 'pjField', 1, 'title', 'Admin Login', 'script'),
(3, 4, 'pjField', 1, 'title', 'Back-end titles', 'script'),
(4, 8, 'pjField', 1, 'title', 'Cancel', 'script'),
(5, 11, 'pjField', 1, 'title', 'Login', 'script'),
(6, 13, 'pjField', 1, 'title', 'Save', 'script'),
(7, 14, 'pjField', 1, 'title', 'Search', 'script'),
(8, 15, 'pjField', 1, 'title', 'Send', 'script'),
(9, 18, 'pjField', 1, 'title', 'Email', 'script'),
(10, 19, 'pjField', 1, 'title', 'Dear {Name},Your password: {Password}', 'script'),
(11, 20, 'pjField', 1, 'title', 'Password reminder', 'script'),
(12, 21, 'pjField', 1, 'title', 'Front-end titles', 'script'),
(13, 22, 'pjField', 1, 'title', 'Action confirmation', 'script'),
(14, 23, 'pjField', 1, 'title', 'Cancel', 'script'),
(15, 24, 'pjField', 1, 'title', 'Delete', 'script'),
(16, 25, 'pjField', 1, 'title', 'OK', 'script'),
(17, 26, 'pjField', 1, 'title', 'Choose Action', 'script'),
(18, 27, 'pjField', 1, 'title', 'Are you sure you want to delete selected record?', 'script'),
(19, 28, 'pjField', 1, 'title', 'Delete confirmation', 'script'),
(20, 29, 'pjField', 1, 'title', 'No records found', 'script'),
(21, 30, 'pjField', 1, 'title', 'Go to page:', 'script'),
(22, 31, 'pjField', 1, 'title', 'Items per page', 'script'),
(23, 32, 'pjField', 1, 'title', 'Next ', 'script'),
(24, 33, 'pjField', 1, 'title', 'Next page', 'script'),
(25, 34, 'pjField', 1, 'title', 'Prev', 'script'),
(26, 35, 'pjField', 1, 'title', 'Prev page', 'script'),
(27, 36, 'pjField', 1, 'title', 'Total items:', 'script'),
(28, 58, 'pjField', 1, 'title', 'Choose', 'script'),
(29, 62, 'pjField', 1, 'title', 'Export', 'script'),
(30, 63, 'pjField', 1, 'title', 'Forgot password', 'script'),
(31, 64, 'pjField', 1, 'title', 'IP address', 'script'),
(32, 65, 'pjField', 1, 'title', 'Is confirmed', 'script'),
(33, 66, 'pjField', 1, 'title', 'Name', 'script'),
(34, 67, 'pjField', 1, 'title', 'No', 'script'),
(35, 68, 'pjField', 1, 'title', 'Option', 'script'),
(36, 70, 'pjField', 1, 'title', 'Role', 'script'),
(37, 71, 'pjField', 1, 'title', 'Status', 'script'),
(38, 74, 'pjField', 1, 'title', 'Registration date/time', 'script'),
(39, 75, 'pjField', 1, 'title', 'Value', 'script'),
(40, 77, 'pjField', 1, 'title', 'Back', 'script'),
(41, 84, 'pjField', 1, 'title', 'Backup', 'script'),
(42, 85, 'pjField', 1, 'title', 'Dashboard', 'script'),
(43, 87, 'pjField', 1, 'title', 'Languages', 'script'),
(44, 88, 'pjField', 1, 'title', 'Logout', 'script'),
(45, 89, 'pjField', 1, 'title', 'Options', 'script'),
(46, 91, 'pjField', 1, 'title', 'Profile', 'script'),
(47, 92, 'pjField', 1, 'title', 'Users', 'script'),
(48, 93, 'pjField', 1, 'title', 'Click on the flag icon to choose which language version of the content you wish to edit.', 'script'),
(49, 94, 'pjField', 1, 'title', 'Currency', 'script'),
(50, 95, 'pjField', 1, 'title', 'Date format', 'script'),
(51, 96, 'pjField', 1, 'title', 'Send email', 'script'),
(52, 97, 'pjField', 1, 'title', 'SMTP Host', 'script'),
(53, 98, 'pjField', 1, 'title', 'SMTP Password', 'script'),
(54, 99, 'pjField', 1, 'title', 'SMTP Port', 'script'),
(55, 100, 'pjField', 1, 'title', 'SMTP Username', 'script'),
(56, 101, 'pjField', 1, 'title', 'Timezone', 'script'),
(57, 102, 'pjField', 1, 'title', 'First day of the week', 'script'),
(58, 103, 'pjField', 1, 'title', 'Password', 'script'),
(59, 125, 'pjField', 1, 'title', 'Revert status', 'script'),
(60, 129, 'pjField', 1, 'title', 'Sunday', 'script'),
(61, 130, 'pjField', 1, 'title', 'Monday', 'script'),
(62, 131, 'pjField', 1, 'title', 'Tuesday', 'script'),
(63, 132, 'pjField', 1, 'title', 'Wednesday', 'script'),
(64, 133, 'pjField', 1, 'title', 'Thursday', 'script'),
(65, 134, 'pjField', 1, 'title', 'Friday', 'script'),
(66, 135, 'pjField', 1, 'title', 'Saturday', 'script'),
(67, 136, 'pjField', 1, 'title', 'S', 'script'),
(68, 137, 'pjField', 1, 'title', 'M', 'script'),
(69, 138, 'pjField', 1, 'title', 'T', 'script'),
(70, 139, 'pjField', 1, 'title', 'W', 'script'),
(71, 140, 'pjField', 1, 'title', 'T', 'script'),
(72, 141, 'pjField', 1, 'title', 'F', 'script'),
(73, 142, 'pjField', 1, 'title', 'S', 'script'),
(74, 143, 'pjField', 1, 'title', 'Given email address is not associated with any account.', 'script'),
(75, 144, 'pjField', 1, 'title', 'For further instructions please check your mailbox.', 'script'),
(76, 145, 'pjField', 1, 'title', 'We are sorry, please try again later.', 'script'),
(77, 146, 'pjField', 1, 'title', 'All the changes made to your profile have been saved.', 'script'),
(78, 152, 'pjField', 1, 'title', 'All the changes made to options have been saved.', 'script'),
(79, 153, 'pjField', 1, 'title', 'All the changes made to this user have been saved.', 'script'),
(80, 154, 'pjField', 1, 'title', 'All the changes made to this user have been saved.', 'script'),
(81, 155, 'pjField', 1, 'title', 'We are sorry, but the user has not been added.', 'script'),
(82, 156, 'pjField', 1, 'title', 'User your looking for is missing.', 'script'),
(83, 159, 'pjField', 1, 'title', 'Account not found!', 'script'),
(84, 160, 'pjField', 1, 'title', 'Password send!', 'script'),
(85, 161, 'pjField', 1, 'title', 'Password not send!', 'script'),
(86, 162, 'pjField', 1, 'title', 'Profile updated!', 'script'),
(87, 167, 'pjField', 1, 'title', 'Options updated!', 'script'),
(88, 168, 'pjField', 1, 'title', 'User updated!', 'script'),
(89, 169, 'pjField', 1, 'title', 'User added!', 'script'),
(90, 170, 'pjField', 1, 'title', 'User failed to add.', 'script'),
(91, 171, 'pjField', 1, 'title', 'User not found.', 'script'),
(92, 174, 'pjField', 1, 'title', 'Active', 'script'),
(93, 175, 'pjField', 1, 'title', 'Inactive', 'script'),
(94, 176, 'pjField', 1, 'title', 'Wrong username or password', 'script'),
(95, 177, 'pjField', 1, 'title', 'Access denied', 'script'),
(96, 178, 'pjField', 1, 'title', 'Account is disabled', 'script'),
(97, 179, 'pjField', 1, 'title', 'January', 'script'),
(98, 180, 'pjField', 1, 'title', 'October', 'script'),
(99, 181, 'pjField', 1, 'title', 'November', 'script'),
(100, 182, 'pjField', 1, 'title', 'December', 'script'),
(101, 183, 'pjField', 1, 'title', 'February', 'script'),
(102, 184, 'pjField', 1, 'title', 'March', 'script'),
(103, 185, 'pjField', 1, 'title', 'April', 'script'),
(104, 186, 'pjField', 1, 'title', 'May', 'script'),
(105, 187, 'pjField', 1, 'title', 'June', 'script'),
(106, 188, 'pjField', 1, 'title', 'July', 'script'),
(107, 189, 'pjField', 1, 'title', 'August', 'script'),
(108, 190, 'pjField', 1, 'title', 'September', 'script'),
(109, 191, 'pjField', 1, 'title', 'Dr.', 'script'),
(110, 192, 'pjField', 1, 'title', 'Miss', 'script'),
(111, 193, 'pjField', 1, 'title', 'Mr.', 'script'),
(112, 194, 'pjField', 1, 'title', 'Mrs.', 'script'),
(113, 195, 'pjField', 1, 'title', 'Ms.', 'script'),
(114, 196, 'pjField', 1, 'title', 'Other', 'script'),
(115, 197, 'pjField', 1, 'title', 'Prof.', 'script'),
(116, 198, 'pjField', 1, 'title', 'Rev.', 'script'),
(117, 199, 'pjField', 1, 'title', 'Jan', 'script'),
(118, 200, 'pjField', 1, 'title', 'Oct', 'script'),
(119, 201, 'pjField', 1, 'title', 'Nov', 'script'),
(120, 202, 'pjField', 1, 'title', 'Dec', 'script'),
(121, 203, 'pjField', 1, 'title', 'Feb', 'script'),
(122, 204, 'pjField', 1, 'title', 'Mar', 'script'),
(123, 205, 'pjField', 1, 'title', 'Apr', 'script'),
(124, 206, 'pjField', 1, 'title', 'May', 'script'),
(125, 207, 'pjField', 1, 'title', 'Jun', 'script'),
(126, 208, 'pjField', 1, 'title', 'Jul', 'script'),
(127, 209, 'pjField', 1, 'title', 'Aug', 'script'),
(128, 210, 'pjField', 1, 'title', 'Sep', 'script'),
(129, 211, 'pjField', 1, 'title', 'You are not loged in.', 'script'),
(130, 212, 'pjField', 1, 'title', 'Your hosting account does not allow uploading such a large image.', 'script'),
(131, 213, 'pjField', 1, 'title', 'Access denied. You have not requisite rights to.', 'script'),
(132, 214, 'pjField', 1, 'title', 'Empty resultset.', 'script'),
(133, 215, 'pjField', 1, 'title', 'The operation is not allowed in demo mode.', 'script'),
(134, 216, 'pjField', 1, 'title', 'No property for the reservation found', 'script'),
(135, 217, 'pjField', 1, 'title', 'No reservation found', 'script'),
(136, 218, 'pjField', 1, 'title', 'No permisions to edit the reservation', 'script'),
(137, 219, 'pjField', 1, 'title', 'No permisions to edit the property', 'script'),
(138, 220, 'pjField', 1, 'title', 'E-Mail address already exist', 'script'),
(139, 221, 'pjField', 1, 'title', 'Your registration was successfull. Your account needs to be approved.', 'script'),
(140, 222, 'pjField', 1, 'title', 'Your registration was successfull.', 'script'),
(141, 223, 'pjField', 1, 'title', 'GMT-03:00', 'script'),
(142, 224, 'pjField', 1, 'title', 'GMT-04:00', 'script'),
(143, 225, 'pjField', 1, 'title', 'GMT-05:00', 'script'),
(144, 226, 'pjField', 1, 'title', 'GMT-06:00', 'script'),
(145, 227, 'pjField', 1, 'title', 'GMT-07:00', 'script'),
(146, 228, 'pjField', 1, 'title', 'GMT-08:00', 'script'),
(147, 229, 'pjField', 1, 'title', 'GMT-09:00', 'script'),
(148, 230, 'pjField', 1, 'title', 'GMT-01:00', 'script'),
(149, 231, 'pjField', 1, 'title', 'GMT-10:00', 'script'),
(150, 232, 'pjField', 1, 'title', 'GMT-11:00', 'script'),
(151, 233, 'pjField', 1, 'title', 'GMT-12:00', 'script'),
(152, 234, 'pjField', 1, 'title', 'GMT-02:00', 'script'),
(153, 235, 'pjField', 1, 'title', 'GMT', 'script'),
(154, 236, 'pjField', 1, 'title', 'GMT+03:00', 'script'),
(155, 237, 'pjField', 1, 'title', 'GMT+04:00', 'script'),
(156, 238, 'pjField', 1, 'title', 'GMT+05:00', 'script'),
(157, 239, 'pjField', 1, 'title', 'GMT+06:00', 'script'),
(158, 240, 'pjField', 1, 'title', 'GMT+07:00', 'script'),
(159, 241, 'pjField', 1, 'title', 'GMT+08:00', 'script'),
(160, 242, 'pjField', 1, 'title', 'GMT+09:00', 'script'),
(161, 243, 'pjField', 1, 'title', 'GMT+01:00', 'script'),
(162, 244, 'pjField', 1, 'title', 'GMT+10:00', 'script'),
(163, 245, 'pjField', 1, 'title', 'GMT+11:00', 'script'),
(164, 246, 'pjField', 1, 'title', 'GMT+12:00', 'script'),
(165, 247, 'pjField', 1, 'title', 'GMT+13:00', 'script'),
(166, 248, 'pjField', 1, 'title', 'GMT+02:00', 'script'),
(167, 249, 'pjField', 1, 'title', 'Inactive', 'script'),
(168, 250, 'pjField', 1, 'title', 'Active', 'script'),
(169, 251, 'pjField', 1, 'title', 'No', 'script'),
(170, 252, 'pjField', 1, 'title', 'Yes', 'script'),
(171, 253, 'pjField', 1, 'title', 'Delete selected', 'script'),
(172, 254, 'pjField', 1, 'title', 'Are you sure that you want to delete selected record(s)?', 'script'),
(173, 255, 'pjField', 1, 'title', 'All', 'script'),
(174, 256, 'pjField', 1, 'title', 'Client with such email address exists.', 'script'),
(175, 308, 'pjField', 1, 'title', 'Last login', 'script'),
(176, 360, 'pjField', 1, 'title', 'Install', 'script'),
(177, 361, 'pjField', 1, 'title', 'Preview', 'script'),
(178, 480, 'pjField', 1, 'title', 'Users', 'script'),
(179, 481, 'pjField', 1, 'title', 'Below you can see all users who have access to the Interactive Floor Plan admin panel. There are two types of users - Administrators and Editors. Click on "+ Add user" to add a new user.', 'script'),
(180, 482, 'pjField', 1, 'title', '+ Add user', 'script'),
(181, 483, 'pjField', 1, 'title', 'No records selected', 'script'),
(182, 484, 'pjField', 1, 'title', 'You need to select at least a single record.', 'script'),
(183, 485, 'pjField', 1, 'title', 'Add user', 'script'),
(184, 486, 'pjField', 1, 'title', 'You can add a new Administrator who has full access to the back-end system and can add other users; or an Editor who will only be able to access the Floor plans.', 'script'),
(185, 487, 'pjField', 1, 'title', 'Phone', 'script'),
(186, 488, 'pjField', 1, 'title', 'Update user', 'script'),
(187, 489, 'pjField', 1, 'title', 'You can make any change to the form below. Just click "Save" to update the user information.', 'script'),
(188, 490, 'pjField', 1, 'title', 'General', 'script'),
(189, 491, 'pjField', 1, 'title', 'General options', 'script'),
(190, 492, 'pjField', 1, 'title', 'Here you can set the General options for the Menu Builder.', 'script'),
(191, 493, 'pjField', 1, 'title', 'Time format', 'script'),
(192, 639, 'pjField', 1, 'title', 'Floor plans', 'script'),
(193, 640, 'pjField', 1, 'title', 'Floor plans list', 'script'),
(194, 641, 'pjField', 1, 'title', 'Below is a list of all floor plans. To add a new floor plan, just click on "+ Add floor plan". Click on the pencil icon of the corresponding floor plan entry to view more details.', 'script'),
(195, 642, 'pjField', 1, 'title', '+ Add floor plan', 'script'),
(196, 643, 'pjField', 1, 'title', 'Title', 'script'),
(197, 644, 'pjField', 1, 'title', 'Floor plan', 'script'),
(198, 645, 'pjField', 1, 'title', 'Floor plan updated!', 'script'),
(199, 646, 'pjField', 1, 'title', 'Changes made on floor plan have been saved.', 'script'),
(200, 647, 'pjField', 1, 'title', 'Floor plan added!', 'script'),
(201, 648, 'pjField', 1, 'title', 'Floor plan has been added into the system.', 'script'),
(202, 649, 'pjField', 1, 'title', 'Floor plan not added!', 'script'),
(203, 650, 'pjField', 1, 'title', 'Floor plan could not be added. Please try again.', 'script'),
(204, 651, 'pjField', 1, 'title', 'Floor plan not added!', 'script'),
(205, 652, 'pjField', 1, 'title', 'Floor plan could not be added because the post content is greater than {MAXSIZE}.', 'script'),
(206, 653, 'pjField', 1, 'title', 'Floor plan not found!', 'script'),
(207, 654, 'pjField', 1, 'title', 'Floor plan you are looking is missing. Please try again.', 'script'),
(208, 655, 'pjField', 1, 'title', 'Floor plan not updated!', 'script'),
(209, 656, 'pjField', 1, 'title', 'Floor plan could not be updated because the post content is greater than {MAXSIZE}. Please try again.', 'script'),
(210, 657, 'pjField', 1, 'title', 'Add floor plan', 'script'),
(211, 658, 'pjField', 1, 'title', 'Fill in the fields below and click "Save" to add a new floor plan. Click "Browse" to upload your floor plan (.jpg, .png, .gif files up to {MAXSIZE}). After this you can set more details for your new floor plan. Enable/disable the floor plan from the "Status" menu.', 'script'),
(212, 659, 'pjField', 1, 'title', 'Floor plan', 'script'),
(213, 660, 'pjField', 1, 'title', 'Images', 'script'),
(214, 661, 'pjField', 1, 'title', 'Edit floor plan', 'script'),
(215, 662, 'pjField', 1, 'title', 'Rename the floor plan, if necessary. Delete and replace the floor plan you have previously uploaded or just resize the image. Select the icon you would like to add. <br/> \r\n<br/>\r\nClick to add a new camera icon and show image. Rotate the camera icon; resize it by clicking on the bottom right corner and drag & drop to move it. Click on the camera icon to select image, specify rotation degree, size and set tooltip position. <br/> \r\n <br/> \r\nUse the same logic to add an infobox. Add title, size, dimensions and short description. You can rename the "Size" and "Dimensions" fields and add your own parameters from Options/Languages.', 'script'),
(216, 663, 'pjField', 1, 'title', 'Images', 'script'),
(217, 664, 'pjField', 1, 'title', 'Upload as many images as you need for this floor plan. You can resize, crop, rotate, watermark and compress the images. Drag & drop to rearrange them.', 'script'),
(218, 665, 'pjField', 1, 'title', 'Delete floor plan', 'script'),
(219, 666, 'pjField', 1, 'title', 'Add / Edit', 'script'),
(220, 667, 'pjField', 1, 'title', 'Rotation degree', 'script'),
(221, 668, 'pjField', 1, 'title', 'Size', 'script'),
(222, 669, 'pjField', 1, 'title', 'Save', 'script'),
(223, 670, 'pjField', 1, 'title', 'Edit camera icon & image', 'script'),
(224, 671, 'pjField', 1, 'title', 'Image tooltip position', 'script'),
(225, 672, 'pjField', 1, 'title', 'Top left', 'script'),
(226, 673, 'pjField', 1, 'title', 'Top center', 'script'),
(227, 674, 'pjField', 1, 'title', 'Top right', 'script'),
(228, 675, 'pjField', 1, 'title', 'Bottom right', 'script'),
(229, 676, 'pjField', 1, 'title', 'Bottom center', 'script'),
(230, 677, 'pjField', 1, 'title', 'Bottom left', 'script'),
(231, 678, 'pjField', 1, 'title', 'Dimensions', 'script'),
(232, 679, 'pjField', 1, 'title', 'Description', 'script'),
(233, 680, 'pjField', 1, 'title', 'If you delete the floor plan image, it will also delete all hotspots. Are you sure that you want to delete floorplan image?', 'script'),
(234, 681, 'pjField', 1, 'title', 'Install instructions', 'script'),
(235, 682, 'pjField', 1, 'title', 'Copy the code below and paste it on the web page where you want the floor plan to appear. The code can be placed just before the closing body tag of your web page.', 'script'),
(236, 683, 'pjField', 1, 'title', 'Choose theme', 'script'),
(237, 684, 'pjField', 1, 'title', 'Preview front end', 'script'),
(238, 685, 'pjField', 1, 'title', 'There are multiple color schemes available for the front end. Click on each of the thumbnails below to preview it. Click on "Use this theme" button for the theme you want to use.', 'script'),
(239, 686, 'pjField', 1, 'title', 'Preview front end', 'script'),
(240, 687, 'pjField', 1, 'title', 'There are multiple color schemes available for the front end. Click on each of the thumbnails below to preview it. Click on "Use this theme" button for the theme you want to use.', 'script'),
(241, 688, 'pjField', 1, 'title', 'Choose theme', 'script'),
(242, 689, 'pjField', 1, 'title', 'Theme 1', 'script'),
(243, 690, 'pjField', 1, 'title', 'Theme 2', 'script'),
(244, 691, 'pjField', 1, 'title', 'Theme 3', 'script'),
(245, 692, 'pjField', 1, 'title', 'Theme 4', 'script'),
(246, 693, 'pjField', 1, 'title', 'Theme 5', 'script'),
(247, 694, 'pjField', 1, 'title', 'Theme 6', 'script'),
(248, 695, 'pjField', 1, 'title', 'Theme 7', 'script'),
(249, 696, 'pjField', 1, 'title', 'Theme 8', 'script'),
(250, 697, 'pjField', 1, 'title', 'Theme 9', 'script'),
(251, 698, 'pjField', 1, 'title', 'Theme 10', 'script'),
(252, 699, 'pjField', 1, 'title', 'Currently in use', 'script'),
(253, 700, 'pjField', 1, 'title', 'Use this theme', 'script'),
(254, 701, 'pjField', 1, 'title', 'General options', 'script'),
(255, 702, 'pjField', 1, 'title', 'Here you can make the general settings for the Interactive Floor Plan script.', 'script'),
(256, 703, 'pjField', 1, 'title', 'Delete', 'script'),
(257, 704, 'pjField', 1, 'title', 'Cancel', 'script'),
(258, 705, 'pjField', 1, 'title', 'Size', 'script'),
(259, 706, 'pjField', 1, 'title', 'Dimensions', 'script'),
(260, 707, 'pjField', 1, 'title', 'Resize', 'script'),
(261, 708, 'pjField', 1, 'title', 'Resize floor plan', 'script'),
(262, 709, 'pjField', 1, 'title', 'Current image size', 'script'),
(263, 710, 'pjField', 1, 'title', 'New width', 'script'),
(264, 711, 'pjField', 1, 'title', 'New height', 'script'),
(265, 712, 'pjField', 1, 'title', 'Select floor plan', 'script'),
(266, 713, 'pjField', 1, 'title', 'No floor plans found. Click {STAG}here{ETAG} to add one.', 'script'),
(267, 714, 'pjField', 1, 'title', 'Preview', 'script'),
(268, 715, 'pjField', 1, 'title', 'Get Install Code', 'script'),
(269, 716, 'pjField', 1, 'title', 'Install & Preview', 'script'),
(270, 717, 'pjField', 1, 'title', 'Images', 'script'),
(271, 718, 'pjField', 1, 'title', 'Select an image', 'script'),
(272, 719, 'pjField', 1, 'title', 'This field is required.', 'script'),
(273, 720, 'pjField', 1, 'title', 'No images found. {STAG}Upload images{ETAG}', 'script'),
(274, 721, 'pjField', 1, 'title', 'Email is invalid.', 'script'),
(275, 722, 'pjField', 1, 'title', 'The floor plan does not exist.', 'script'),
(276, 723, 'pjField', 1, 'title', 'Floor plan image not uploaded!', 'script'),
(277, 724, 'pjField', 1, 'title', 'Floor plan title was added, but the floor plan image could not be uploaded because the image size is greater than {POSTSIZE}.', 'script'),
(278, 725, 'pjField', 1, 'title', 'Floor plan image not uploaded!', 'script'),
(279, 727, 'pjField', 1, 'title', 'Floor plan title was updated, but the floor plan image could not be uploaded because the image size is greater than {POSTSIZE}.', 'script'),
(280, 728, 'pjField', 1, 'title', 'Restore image', 'script'),
(281, 729, 'pjField', 1, 'title', 'Original size', 'script'),
(282, 730, 'pjField', 1, 'title', 'Camera icon', 'script'),
(283, 731, 'pjField', 1, 'title', 'Infobox', 'script'),
(284, 732, 'pjField', 1, 'title', 'Edit infobox', 'script'),
(285, 733, 'pjField', 1, 'title', 'Admin', 'script'),
(286, 734, 'pjField', 1, 'title', 'Editor', 'script'),
(287, 735, 'pjField', 1, 'title', 'Floor plan image not uploaded!', 'script'),
(288, 736, 'pjField', 1, 'title', 'Floor plan title has been saved, but floor plan file could not be uploaded because the selected file is not an image. Please check file extension again. Only images files are allowed.', 'script'),
(289, 737, 'pjField', 1, 'title', 'Floor plan image not uploaded!', 'script'),
(290, 738, 'pjField', 1, 'title', 'Floor plan title was updated, but the floor plan file could not be uploaded because the selected file is not an image. Please check file extension again. Only images files are allowed.', 'script'),
(291, 739, 'pjField', 1, 'title', 'Languages', 'plugin'),
(292, 739, 'pjField', 2, 'title', 'Languages', 'plugin'),
(293, 739, 'pjField', 3, 'title', 'Languages', 'plugin'),
(294, 740, 'pjField', 1, 'title', 'Translate', 'plugin'),
(295, 740, 'pjField', 2, 'title', 'Translate', 'plugin'),
(296, 740, 'pjField', 3, 'title', 'Translate', 'plugin'),
(297, 741, 'pjField', 1, 'title', 'Languages', 'plugin'),
(298, 741, 'pjField', 2, 'title', 'Languages', 'plugin'),
(299, 741, 'pjField', 3, 'title', 'Languages', 'plugin'),
(300, 742, 'pjField', 1, 'title', 'Add as many languages as you need to your script. For each of the languages added you need to translate all the text titles.', 'plugin'),
(301, 742, 'pjField', 2, 'title', 'Add as many languages as you need to your script. For each of the languages added you need to translate all the text titles.', 'plugin'),
(302, 742, 'pjField', 3, 'title', 'Add as many languages as you need to your script. For each of the languages added you need to translate all the text titles.', 'plugin'),
(303, 743, 'pjField', 1, 'title', 'Titles', 'plugin'),
(304, 743, 'pjField', 2, 'title', 'Titles', 'plugin'),
(305, 743, 'pjField', 3, 'title', 'Titles', 'plugin'),
(306, 744, 'pjField', 1, 'title', 'Using the form below you can edit all the text in the software.<br /><br />Each piece of text used in the software is saved in the database and has its own unique ID. In the first column below you can see the ID for each piece of text. To show these IDs in the script itself check the "Show IDs" checkbox and click Save button next to it. This will show the corresponding :ID: for each text message. Please, note that ONLY you will see these IDs. Now you can search for any ID and easily change and/or translate the text. Have in the mind that you shoud use : before and after the ID when you search for it.  <br /><br />Check our <a target="_blank" href="http://www.phpjabbers.com/knowledgebase/other">knowledgebase</a> and watch video tutorial how to change and/or translate the text.', 'plugin'),
(307, 744, 'pjField', 2, 'title', 'Using the form below you can edit all the text in the software.<br /><br />Each piece of text used in the software is saved in the database and has its own unique ID. In the first column below you can see the ID for each piece of text. To show these IDs in the script itself check the "Show IDs" checkbox and click Save button next to it. This will show the corresponding :ID: for each text message. Please, note that ONLY you will see these IDs. Now you can search for any ID and easily change and/or translate the text. Have in the mind that you shoud use : before and after the ID when you search for it.  <br /><br />Check our <a target="_blank" href="http://www.phpjabbers.com/knowledgebase/other">knowledgebase</a> and watch video tutorial how to change and/or translate the text.', 'plugin'),
(308, 744, 'pjField', 3, 'title', 'Using the form below you can edit all the text in the software.<br /><br />Each piece of text used in the software is saved in the database and has its own unique ID. In the first column below you can see the ID for each piece of text. To show these IDs in the script itself check the "Show IDs" checkbox and click Save button next to it. This will show the corresponding :ID: for each text message. Please, note that ONLY you will see these IDs. Now you can search for any ID and easily change and/or translate the text. Have in the mind that you shoud use : before and after the ID when you search for it.  <br /><br />Check our <a target="_blank" href="http://www.phpjabbers.com/knowledgebase/other">knowledgebase</a> and watch video tutorial how to change and/or translate the text.', 'plugin'),
(309, 745, 'pjField', 1, 'title', 'Title', 'plugin'),
(310, 745, 'pjField', 2, 'title', 'Title', 'plugin'),
(311, 745, 'pjField', 3, 'title', 'Title', 'plugin'),
(312, 746, 'pjField', 1, 'title', 'Flag', 'plugin'),
(313, 746, 'pjField', 2, 'title', 'Flag', 'plugin'),
(314, 746, 'pjField', 3, 'title', 'Flag', 'plugin'),
(315, 747, 'pjField', 1, 'title', 'Is default', 'plugin'),
(316, 747, 'pjField', 2, 'title', 'Is default', 'plugin'),
(317, 747, 'pjField', 3, 'title', 'Is default', 'plugin'),
(318, 748, 'pjField', 1, 'title', 'Order', 'plugin'),
(319, 748, 'pjField', 2, 'title', 'Order', 'plugin'),
(320, 748, 'pjField', 3, 'title', 'Order', 'plugin'),
(321, 749, 'pjField', 1, 'title', 'Add Language', 'plugin'),
(322, 749, 'pjField', 2, 'title', 'Add Language', 'plugin'),
(323, 749, 'pjField', 3, 'title', 'Add Language', 'plugin'),
(324, 750, 'pjField', 1, 'title', 'Field', 'plugin'),
(325, 750, 'pjField', 2, 'title', 'Field', 'plugin'),
(326, 750, 'pjField', 3, 'title', 'Field', 'plugin'),
(327, 751, 'pjField', 1, 'title', 'Value', 'plugin'),
(328, 751, 'pjField', 2, 'title', 'Value', 'plugin'),
(329, 751, 'pjField', 3, 'title', 'Value', 'plugin'),
(330, 752, 'pjField', 1, 'title', 'Back-end title', 'plugin'),
(331, 752, 'pjField', 2, 'title', 'Back-end title', 'plugin'),
(332, 752, 'pjField', 3, 'title', 'Back-end title', 'plugin'),
(333, 753, 'pjField', 1, 'title', 'Front-end title', 'plugin'),
(334, 753, 'pjField', 2, 'title', 'Front-end title', 'plugin'),
(335, 753, 'pjField', 3, 'title', 'Front-end title', 'plugin'),
(336, 754, 'pjField', 1, 'title', 'Special title', 'plugin'),
(337, 754, 'pjField', 2, 'title', 'Special title', 'plugin'),
(338, 754, 'pjField', 3, 'title', 'Special title', 'plugin'),
(339, 755, 'pjField', 1, 'title', 'Titles Updated', 'plugin'),
(340, 755, 'pjField', 2, 'title', 'Titles Updated', 'plugin'),
(341, 755, 'pjField', 3, 'title', 'Titles Updated', 'plugin'),
(342, 756, 'pjField', 1, 'title', 'All the changes made to titles have been saved.', 'plugin'),
(343, 756, 'pjField', 2, 'title', 'All the changes made to titles have been saved.', 'plugin'),
(344, 756, 'pjField', 3, 'title', 'All the changes made to titles have been saved.', 'plugin'),
(345, 757, 'pjField', 1, 'title', 'Per page', 'plugin'),
(346, 757, 'pjField', 2, 'title', 'Per page', 'plugin'),
(347, 757, 'pjField', 3, 'title', 'Per page', 'plugin'),
(348, 758, 'pjField', 1, 'title', 'Import error', 'plugin'),
(349, 758, 'pjField', 2, 'title', 'Import error', 'plugin'),
(350, 758, 'pjField', 3, 'title', 'Import error', 'plugin'),
(351, 759, 'pjField', 1, 'title', 'Import failed due missing parameters.', 'plugin'),
(352, 759, 'pjField', 2, 'title', 'Import failed due missing parameters.', 'plugin'),
(353, 759, 'pjField', 3, 'title', 'Import failed due missing parameters.', 'plugin'),
(354, 760, 'pjField', 1, 'title', 'Import complete', 'plugin'),
(355, 760, 'pjField', 2, 'title', 'Import complete', 'plugin'),
(356, 760, 'pjField', 3, 'title', 'Import complete', 'plugin'),
(357, 761, 'pjField', 1, 'title', 'The import was performed successfully.', 'plugin'),
(358, 761, 'pjField', 2, 'title', 'The import was performed successfully.', 'plugin'),
(359, 761, 'pjField', 3, 'title', 'The import was performed successfully.', 'plugin'),
(360, 762, 'pjField', 1, 'title', 'Import error', 'plugin'),
(361, 762, 'pjField', 2, 'title', 'Import error', 'plugin'),
(362, 762, 'pjField', 3, 'title', 'Import error', 'plugin'),
(363, 763, 'pjField', 1, 'title', 'Import failed due empty data.', 'plugin'),
(364, 763, 'pjField', 2, 'title', 'Import failed due empty data.', 'plugin'),
(365, 763, 'pjField', 3, 'title', 'Import failed due empty data.', 'plugin'),
(366, 764, 'pjField', 1, 'title', 'Import error', 'plugin'),
(367, 764, 'pjField', 2, 'title', 'Import error', 'plugin'),
(368, 764, 'pjField', 3, 'title', 'Import error', 'plugin'),
(369, 765, 'pjField', 1, 'title', 'Import failed because file cannot be open.', 'plugin'),
(370, 765, 'pjField', 2, 'title', 'Import failed because file cannot be open.', 'plugin'),
(371, 765, 'pjField', 3, 'title', 'Import failed because file cannot be open.', 'plugin'),
(372, 766, 'pjField', 1, 'title', 'Import / Export', 'plugin'),
(373, 766, 'pjField', 2, 'title', 'Import / Export', 'plugin'),
(374, 766, 'pjField', 3, 'title', 'Import / Export', 'plugin'),
(375, 767, 'pjField', 1, 'title', 'Import', 'plugin'),
(376, 767, 'pjField', 2, 'title', 'Import', 'plugin'),
(377, 767, 'pjField', 3, 'title', 'Import', 'plugin'),
(378, 768, 'pjField', 1, 'title', 'Export', 'plugin'),
(379, 768, 'pjField', 2, 'title', 'Export', 'plugin'),
(380, 768, 'pjField', 3, 'title', 'Export', 'plugin'),
(381, 769, 'pjField', 1, 'title', 'Language', 'plugin'),
(382, 769, 'pjField', 2, 'title', 'Language', 'plugin'),
(383, 769, 'pjField', 3, 'title', 'Language', 'plugin'),
(384, 770, 'pjField', 1, 'title', 'Browse your computer', 'plugin'),
(385, 770, 'pjField', 2, 'title', 'Browse your computer', 'plugin'),
(386, 770, 'pjField', 3, 'title', 'Browse your computer', 'plugin'),
(387, 771, 'pjField', 1, 'title', 'Import / Export', 'plugin'),
(388, 771, 'pjField', 2, 'title', 'Import / Export', 'plugin'),
(389, 771, 'pjField', 3, 'title', 'Import / Export', 'plugin'),
(390, 772, 'pjField', 1, 'title', 'Use form below to Import or Export CSV with all titles. Please, do not change first row and first and second column in the CSV file.', 'plugin'),
(391, 772, 'pjField', 2, 'title', 'Use form below to Import or Export CSV with all titles. Please, do not change first row and first and second column in the CSV file.', 'plugin'),
(392, 772, 'pjField', 3, 'title', 'Use form below to Import or Export CSV with all titles. Please, do not change first row and first and second column in the CSV file.', 'plugin'),
(393, 773, 'pjField', 1, 'title', 'Delimiter', 'plugin'),
(394, 773, 'pjField', 2, 'title', 'Delimiter', 'plugin'),
(395, 773, 'pjField', 3, 'title', 'Delimiter', 'plugin'),
(396, 774, 'pjField', 1, 'title', 'Comma', 'plugin'),
(397, 774, 'pjField', 2, 'title', 'Comma', 'plugin'),
(398, 774, 'pjField', 3, 'title', 'Comma', 'plugin'),
(399, 775, 'pjField', 1, 'title', 'Semicolon', 'plugin'),
(400, 775, 'pjField', 2, 'title', 'Semicolon', 'plugin'),
(401, 775, 'pjField', 3, 'title', 'Semicolon', 'plugin'),
(402, 776, 'pjField', 1, 'title', 'Tab', 'plugin'),
(403, 776, 'pjField', 2, 'title', 'Tab', 'plugin'),
(404, 776, 'pjField', 3, 'title', 'Tab', 'plugin'),
(405, 777, 'pjField', 1, 'title', 'The following languages have been found. Select those you want to import.', 'plugin'),
(406, 777, 'pjField', 2, 'title', 'The following languages have been found. Select those you want to import.', 'plugin'),
(407, 777, 'pjField', 3, 'title', 'The following languages have been found. Select those you want to import.', 'plugin'),
(408, 778, 'pjField', 1, 'title', 'Import confirmation', 'plugin'),
(409, 778, 'pjField', 2, 'title', 'Import confirmation', 'plugin'),
(410, 778, 'pjField', 3, 'title', 'Import confirmation', 'plugin'),
(411, 779, 'pjField', 1, 'title', 'Import failed', 'plugin'),
(412, 779, 'pjField', 2, 'title', 'Import failed', 'plugin'),
(413, 779, 'pjField', 3, 'title', 'Import failed', 'plugin'),
(414, 780, 'pjField', 1, 'title', 'Missing, empty or invalid parameters.', 'plugin'),
(415, 780, 'pjField', 2, 'title', 'Missing, empty or invalid parameters.', 'plugin'),
(416, 780, 'pjField', 3, 'title', 'Missing, empty or invalid parameters.', 'plugin'),
(417, 781, 'pjField', 1, 'title', 'Import failed', 'plugin'),
(418, 781, 'pjField', 2, 'title', 'Import failed', 'plugin'),
(419, 781, 'pjField', 3, 'title', 'Import failed', 'plugin'),
(420, 782, 'pjField', 1, 'title', 'File have not been uploaded.', 'plugin'),
(421, 782, 'pjField', 2, 'title', 'File have not been uploaded.', 'plugin'),
(422, 782, 'pjField', 3, 'title', 'File have not been uploaded.', 'plugin'),
(423, 783, 'pjField', 1, 'title', 'Import failed', 'plugin'),
(424, 783, 'pjField', 2, 'title', 'Import failed', 'plugin'),
(425, 783, 'pjField', 3, 'title', 'Import failed', 'plugin'),
(426, 784, 'pjField', 1, 'title', 'Uploaded file cannot open for reading.', 'plugin'),
(427, 784, 'pjField', 2, 'title', 'Uploaded file cannot open for reading.', 'plugin'),
(428, 784, 'pjField', 3, 'title', 'Uploaded file cannot open for reading.', 'plugin'),
(429, 785, 'pjField', 1, 'title', 'Import failed', 'plugin'),
(430, 785, 'pjField', 2, 'title', 'Import failed', 'plugin'),
(431, 785, 'pjField', 3, 'title', 'Import failed', 'plugin'),
(432, 786, 'pjField', 1, 'title', 'New line(s) have been found.', 'plugin'),
(433, 786, 'pjField', 2, 'title', 'New line(s) have been found.', 'plugin'),
(434, 786, 'pjField', 3, 'title', 'New line(s) have been found.', 'plugin'),
(435, 787, 'pjField', 1, 'title', 'Import failed', 'plugin'),
(436, 787, 'pjField', 2, 'title', 'Import failed', 'plugin'),
(437, 787, 'pjField', 3, 'title', 'Import failed', 'plugin'),
(438, 788, 'pjField', 1, 'title', 'Uploaded file doesn''t contain the necessary columns.', 'plugin'),
(439, 788, 'pjField', 2, 'title', 'Uploaded file doesn''t contain the necessary columns.', 'plugin'),
(440, 788, 'pjField', 3, 'title', 'Uploaded file doesn''t contain the necessary columns.', 'plugin'),
(441, 789, 'pjField', 1, 'title', 'Import failed', 'plugin'),
(442, 789, 'pjField', 2, 'title', 'Import failed', 'plugin'),
(443, 789, 'pjField', 3, 'title', 'Import failed', 'plugin'),
(444, 790, 'pjField', 1, 'title', 'Number of columns are not equal on every row.', 'plugin'),
(445, 790, 'pjField', 2, 'title', 'Number of columns are not equal on every row.', 'plugin'),
(446, 790, 'pjField', 3, 'title', 'Number of columns are not equal on every row.', 'plugin'),
(447, 791, 'pjField', 1, 'title', 'Import failed', 'plugin'),
(448, 791, 'pjField', 2, 'title', 'Import failed', 'plugin'),
(449, 791, 'pjField', 3, 'title', 'Import failed', 'plugin'),
(450, 792, 'pjField', 1, 'title', 'Invalid data found.', 'plugin'),
(451, 792, 'pjField', 2, 'title', 'Invalid data found.', 'plugin'),
(452, 792, 'pjField', 3, 'title', 'Invalid data found.', 'plugin'),
(453, 793, 'pjField', 1, 'title', 'Import failed', 'plugin'),
(454, 793, 'pjField', 2, 'title', 'Import failed', 'plugin'),
(455, 793, 'pjField', 3, 'title', 'Import failed', 'plugin'),
(456, 794, 'pjField', 1, 'title', 'Missing columns.', 'plugin'),
(457, 794, 'pjField', 2, 'title', 'Missing columns.', 'plugin'),
(458, 794, 'pjField', 3, 'title', 'Missing columns.', 'plugin'),
(459, 795, 'pjField', 1, 'title', 'Import failed', 'plugin'),
(460, 795, 'pjField', 2, 'title', 'Import failed', 'plugin'),
(461, 795, 'pjField', 3, 'title', 'Import failed', 'plugin'),
(462, 796, 'pjField', 1, 'title', 'Invalid data found.', 'plugin'),
(463, 796, 'pjField', 2, 'title', 'Invalid data found.', 'plugin'),
(464, 796, 'pjField', 3, 'title', 'Invalid data found.', 'plugin'),
(465, 797, 'pjField', 1, 'title', 'ID:', 'plugin'),
(466, 797, 'pjField', 2, 'title', 'ID:', 'plugin'),
(467, 797, 'pjField', 3, 'title', 'ID:', 'plugin'),
(468, 798, 'pjField', 1, 'title', 'Show IDs', 'plugin'),
(469, 798, 'pjField', 2, 'title', 'Show IDs', 'plugin'),
(470, 798, 'pjField', 3, 'title', 'Show IDs', 'plugin'),
(471, 799, 'pjField', 1, 'title', 'Show IDs', 'plugin'),
(472, 799, 'pjField', 2, 'title', 'Show IDs', 'plugin'),
(473, 799, 'pjField', 3, 'title', 'Show IDs', 'plugin'),
(474, 800, 'pjField', 1, 'title', 'ID will be displayed next to each text found in the software. You can then search for an ID to easily change or translate the text.', 'plugin'),
(475, 800, 'pjField', 2, 'title', 'ID will be displayed next to each text found in the software. You can then search for an ID to easily change or translate the text', 'plugin'),
(476, 800, 'pjField', 3, 'title', 'ID will be displayed next to each text found in the software. You can then search for an ID to easily change or translate the text', 'plugin'),
(477, 801, 'pjField', 1, 'title', 'Confirm', 'plugin'),
(478, 801, 'pjField', 2, 'title', 'Confirm', 'plugin'),
(479, 801, 'pjField', 3, 'title', 'Confirm', 'plugin'),
(480, 802, 'pjField', 1, 'title', 'Cancel', 'plugin'),
(481, 802, 'pjField', 2, 'title', 'Cancel', 'plugin'),
(482, 802, 'pjField', 3, 'title', 'Cancel', 'plugin'),
(483, 803, 'pjField', 1, 'title', 'default', 'plugin'),
(484, 803, 'pjField', 2, 'title', 'default', 'plugin'),
(485, 803, 'pjField', 3, 'title', 'default', 'plugin'),
(486, 804, 'pjField', 1, 'title', 'Log', 'plugin'),
(487, 804, 'pjField', 2, 'title', 'Log', 'plugin'),
(488, 804, 'pjField', 3, 'title', 'Log', 'plugin'),
(489, 805, 'pjField', 1, 'title', 'Config log', 'plugin'),
(490, 805, 'pjField', 2, 'title', 'Config log', 'plugin'),
(491, 805, 'pjField', 3, 'title', 'Config log', 'plugin'),
(492, 806, 'pjField', 1, 'title', 'Empty log', 'plugin'),
(493, 806, 'pjField', 2, 'title', 'Empty log', 'plugin'),
(494, 806, 'pjField', 3, 'title', 'Empty log', 'plugin'),
(495, 807, 'pjField', 1, 'title', 'Config log updated.', 'plugin'),
(496, 807, 'pjField', 2, 'title', 'Config log updated.', 'plugin'),
(497, 807, 'pjField', 3, 'title', 'Config log updated.', 'plugin'),
(498, 808, 'pjField', 1, 'title', 'The config log have been updated.', 'plugin'),
(499, 808, 'pjField', 2, 'title', 'The config log have been updated.', 'plugin'),
(500, 808, 'pjField', 3, 'title', 'The config log have been updated.', 'plugin'),
(501, 809, 'pjField', 1, 'title', 'Backup', 'plugin'),
(502, 809, 'pjField', 2, 'title', 'Backup', 'plugin'),
(503, 809, 'pjField', 3, 'title', 'Backup', 'plugin'),
(504, 810, 'pjField', 1, 'title', 'Backup complete!', 'plugin'),
(505, 810, 'pjField', 2, 'title', 'Backup complete!', 'plugin'),
(506, 810, 'pjField', 3, 'title', 'Backup complete!', 'plugin'),
(507, 811, 'pjField', 1, 'title', 'Backup failed!', 'plugin'),
(508, 811, 'pjField', 2, 'title', 'Backup failed!', 'plugin'),
(509, 811, 'pjField', 3, 'title', 'Backup failed!', 'plugin'),
(510, 812, 'pjField', 1, 'title', 'Backup failed!', 'plugin'),
(511, 812, 'pjField', 2, 'title', 'Backup failed!', 'plugin'),
(512, 812, 'pjField', 3, 'title', 'Backup failed!', 'plugin'),
(513, 813, 'pjField', 1, 'title', 'We recommend you to regularly back up your database and files to prevent any loss of information.', 'plugin'),
(514, 813, 'pjField', 2, 'title', 'We recommend you to regularly back up your database and files to prevent any loss of information.', 'plugin'),
(515, 813, 'pjField', 3, 'title', 'We recommend you to regularly back up your database and files to prevent any loss of information.', 'plugin'),
(516, 814, 'pjField', 1, 'title', 'All backup files have been saved.', 'plugin'),
(517, 814, 'pjField', 2, 'title', 'All backup files have been saved.', 'plugin'),
(518, 814, 'pjField', 3, 'title', 'All backup files have been saved.', 'plugin'),
(519, 815, 'pjField', 1, 'title', 'No option was selected.', 'plugin'),
(520, 815, 'pjField', 2, 'title', 'No option was selected.', 'plugin'),
(521, 815, 'pjField', 3, 'title', 'No option was selected.', 'plugin'),
(522, 816, 'pjField', 1, 'title', 'Backup not performed.', 'plugin'),
(523, 816, 'pjField', 2, 'title', 'Backup not performed.', 'plugin'),
(524, 816, 'pjField', 3, 'title', 'Backup not performed.', 'plugin'),
(525, 817, 'pjField', 1, 'title', 'Backup', 'plugin'),
(526, 817, 'pjField', 2, 'title', 'Backup', 'plugin'),
(527, 817, 'pjField', 3, 'title', 'Backup', 'plugin'),
(528, 818, 'pjField', 1, 'title', 'Backup database', 'plugin'),
(529, 818, 'pjField', 2, 'title', 'Backup database', 'plugin'),
(530, 818, 'pjField', 3, 'title', 'Backup database', 'plugin'),
(531, 819, 'pjField', 1, 'title', 'Backup files', 'plugin'),
(532, 819, 'pjField', 2, 'title', 'Backup files', 'plugin'),
(533, 819, 'pjField', 3, 'title', 'Backup files', 'plugin'),
(534, 820, 'pjField', 1, 'title', 'Backup', 'plugin'),
(535, 820, 'pjField', 2, 'title', 'Backup', 'plugin'),
(536, 820, 'pjField', 3, 'title', 'Backup', 'plugin'),
(537, 821, 'pjField', 1, 'title', 'Backup failed!', 'plugin'),
(538, 821, 'pjField', 2, 'title', 'Backup failed!', 'plugin'),
(539, 821, 'pjField', 3, 'title', 'Backup failed!', 'plugin'),
(540, 822, 'pjField', 1, 'title', 'Backup folder not found. Please ensure that "app/web/backup" folder exists.', 'plugin'),
(541, 822, 'pjField', 2, 'title', 'Backup folder not found. Please ensure that "app/web/backup" folder exists.', 'plugin'),
(542, 822, 'pjField', 3, 'title', 'Backup folder not found. Please ensure that "app/web/backup" folder exists.', 'plugin'),
(543, 823, 'pjField', 1, 'title', 'Backup failed!', 'plugin'),
(544, 823, 'pjField', 2, 'title', 'Backup failed!', 'plugin'),
(545, 823, 'pjField', 3, 'title', 'Backup failed!', 'plugin'),
(546, 824, 'pjField', 1, 'title', 'You need to set write permissions (chmod 777) to "app/web/backup" folder.', 'plugin'),
(547, 824, 'pjField', 2, 'title', 'You need to set write permissions (chmod 777) to "app/web/backup" folder.', 'plugin'),
(548, 824, 'pjField', 3, 'title', 'You need to set write permissions (chmod 777) to "app/web/backup" folder.', 'plugin'),
(549, 825, 'pjField', 1, 'title', 'List', 'plugin'),
(550, 825, 'pjField', 2, 'title', 'List', 'plugin'),
(551, 825, 'pjField', 3, 'title', 'List', 'plugin'),
(552, 826, 'pjField', 1, 'title', '+ Add', 'plugin'),
(553, 826, 'pjField', 2, 'title', '+ Add', 'plugin'),
(554, 826, 'pjField', 3, 'title', '+ Add', 'plugin'),
(555, 827, 'pjField', 1, 'title', 'Information', 'plugin'),
(556, 827, 'pjField', 2, 'title', 'Information', 'plugin'),
(557, 827, 'pjField', 3, 'title', 'Information', 'plugin'),
(558, 828, 'pjField', 1, 'title', 'Please, note that after changing the scripts in the list below you will need to refresh the page to apply the new updates in the "One admiN" menu.', 'plugin'),
(559, 828, 'pjField', 2, 'title', 'Please, note that after changing the scripts in the list below you will need to refresh the page to apply the new updates in the "One admiN" menu.', 'plugin'),
(560, 828, 'pjField', 3, 'title', 'Please, note that after changing the scripts in the list below you will need to refresh the page to apply the new updates in the "One admiN" menu.', 'plugin'),
(561, 829, 'pjField', 1, 'title', 'ALT', 'plugin'),
(562, 829, 'pjField', 2, 'title', 'ALT', 'plugin'),
(563, 829, 'pjField', 3, 'title', 'ALT', 'plugin'),
(564, 830, 'pjField', 1, 'title', 'Watermark position', 'plugin'),
(565, 830, 'pjField', 2, 'title', 'Watermark position', 'plugin'),
(566, 830, 'pjField', 3, 'title', 'Watermark position', 'plugin'),
(567, 831, 'pjField', 1, 'title', 'Position', 'plugin'),
(568, 831, 'pjField', 2, 'title', 'Position', 'plugin'),
(569, 831, 'pjField', 3, 'title', 'Position', 'plugin'),
(570, 832, 'pjField', 1, 'title', 'Image settings', 'plugin'),
(571, 832, 'pjField', 2, 'title', 'Image settings', 'plugin'),
(572, 832, 'pjField', 3, 'title', 'Image settings', 'plugin'),
(573, 833, 'pjField', 1, 'title', 'Are you sure you want to delete all images?', 'plugin'),
(574, 833, 'pjField', 2, 'title', 'Are you sure you want to delete all images?', 'plugin'),
(575, 833, 'pjField', 3, 'title', 'Are you sure you want to delete all images?', 'plugin'),
(576, 834, 'pjField', 1, 'title', 'Are you sure you want to delete selected image?', 'plugin'),
(577, 834, 'pjField', 2, 'title', 'Are you sure you want to delete selected image?', 'plugin'),
(578, 834, 'pjField', 3, 'title', 'Are you sure you want to delete selected image?', 'plugin'),
(579, 835, 'pjField', 1, 'title', 'Delete confirmation', 'plugin'),
(580, 835, 'pjField', 2, 'title', 'Delete confirmation', 'plugin'),
(581, 835, 'pjField', 3, 'title', 'Delete confirmation', 'plugin'),
(582, 836, 'pjField', 1, 'title', 'Compress all images using the slider to specify percentage. Please note that reducing the size of the images leads to quality losses.', 'plugin'),
(583, 836, 'pjField', 2, 'title', 'Compress all images using the slider to specify percentage. Please note that reducing the size of the images leads to quality losses.', 'plugin'),
(584, 836, 'pjField', 3, 'title', 'Compress all images using the slider to specify percentage. Please note that reducing the size of the images leads to quality losses.', 'plugin'),
(585, 837, 'pjField', 1, 'title', 'Delete', 'plugin'),
(586, 837, 'pjField', 2, 'title', 'Delete', 'plugin'),
(587, 837, 'pjField', 3, 'title', 'Delete', 'plugin'),
(588, 838, 'pjField', 1, 'title', 'Cancel', 'plugin'),
(589, 838, 'pjField', 2, 'title', 'Cancel', 'plugin'),
(590, 838, 'pjField', 3, 'title', 'Cancel', 'plugin'),
(591, 839, 'pjField', 1, 'title', 'Save', 'plugin'),
(592, 839, 'pjField', 2, 'title', 'Save', 'plugin'),
(593, 839, 'pjField', 3, 'title', 'Save', 'plugin'),
(594, 840, 'pjField', 1, 'title', 'Set watermark', 'plugin'),
(595, 840, 'pjField', 2, 'title', 'Set watermark', 'plugin'),
(596, 840, 'pjField', 3, 'title', 'Set watermark', 'plugin'),
(597, 841, 'pjField', 1, 'title', 'Clear current one', 'plugin'),
(598, 841, 'pjField', 2, 'title', 'Clear current one', 'plugin'),
(599, 841, 'pjField', 3, 'title', 'Clear current one', 'plugin'),
(600, 842, 'pjField', 1, 'title', 'Compress', 'plugin'),
(601, 842, 'pjField', 2, 'title', 'Compress', 'plugin'),
(602, 842, 'pjField', 3, 'title', 'Compress', 'plugin'),
(603, 843, 'pjField', 1, 'title', 'Re-create thumbs', 'plugin'),
(604, 843, 'pjField', 2, 'title', 'Re-create thumbs', 'plugin'),
(605, 843, 'pjField', 3, 'title', 'Re-create thumbs', 'plugin'),
(606, 844, 'pjField', 1, 'title', 'Top Left', 'plugin'),
(607, 844, 'pjField', 2, 'title', 'Top Left', 'plugin'),
(608, 844, 'pjField', 3, 'title', 'Top Left', 'plugin'),
(609, 845, 'pjField', 1, 'title', 'Top Center', 'plugin'),
(610, 845, 'pjField', 2, 'title', 'Top Center', 'plugin'),
(611, 845, 'pjField', 3, 'title', 'Top Center', 'plugin'),
(612, 846, 'pjField', 1, 'title', 'Bottom Left', 'plugin'),
(613, 846, 'pjField', 2, 'title', 'Bottom Left', 'plugin'),
(614, 846, 'pjField', 3, 'title', 'Bottom Left', 'plugin'),
(615, 847, 'pjField', 1, 'title', 'Bottom Right', 'plugin'),
(616, 847, 'pjField', 2, 'title', 'Bottom Right', 'plugin'),
(617, 847, 'pjField', 3, 'title', 'Bottom Right', 'plugin'),
(618, 848, 'pjField', 1, 'title', 'Bottom Center', 'plugin'),
(619, 848, 'pjField', 2, 'title', 'Bottom Center', 'plugin'),
(620, 848, 'pjField', 3, 'title', 'Bottom Center', 'plugin'),
(621, 849, 'pjField', 1, 'title', 'Center Left', 'plugin'),
(622, 849, 'pjField', 2, 'title', 'Center Left', 'plugin'),
(623, 849, 'pjField', 3, 'title', 'Center Left', 'plugin'),
(624, 850, 'pjField', 1, 'title', 'Center Right', 'plugin'),
(625, 850, 'pjField', 2, 'title', 'Center Right', 'plugin'),
(626, 850, 'pjField', 3, 'title', 'Center Right', 'plugin'),
(627, 851, 'pjField', 1, 'title', 'Center Center', 'plugin'),
(628, 851, 'pjField', 2, 'title', 'Center Center', 'plugin'),
(629, 851, 'pjField', 3, 'title', 'Center Center', 'plugin'),
(630, 852, 'pjField', 1, 'title', 'Top Right', 'plugin'),
(631, 852, 'pjField', 2, 'title', 'Top Right', 'plugin'),
(632, 852, 'pjField', 3, 'title', 'Top Right', 'plugin'),
(633, 853, 'pjField', 1, 'title', 'No images uploaded yet.', 'plugin'),
(634, 853, 'pjField', 2, 'title', 'No images uploaded yet.', 'plugin'),
(635, 853, 'pjField', 3, 'title', 'No images uploaded yet.', 'plugin'),
(636, 854, 'pjField', 1, 'title', 'Move', 'plugin'),
(637, 854, 'pjField', 2, 'title', 'Move', 'plugin'),
(638, 854, 'pjField', 3, 'title', 'Move', 'plugin'),
(639, 855, 'pjField', 1, 'title', 'Edit', 'plugin'),
(640, 855, 'pjField', 2, 'title', 'Edit', 'plugin'),
(641, 855, 'pjField', 3, 'title', 'Edit', 'plugin'),
(642, 856, 'pjField', 1, 'title', 'Delete', 'plugin'),
(643, 856, 'pjField', 2, 'title', 'Delete', 'plugin'),
(644, 856, 'pjField', 3, 'title', 'Delete', 'plugin'),
(645, 857, 'pjField', 1, 'title', 'Resize/Crop', 'plugin'),
(646, 857, 'pjField', 2, 'title', 'Resize/Crop', 'plugin'),
(647, 857, 'pjField', 3, 'title', 'Resize/Crop', 'plugin'),
(648, 858, 'pjField', 1, 'title', 'Rotate', 'plugin'),
(649, 858, 'pjField', 2, 'title', 'Rotate', 'plugin'),
(650, 858, 'pjField', 3, 'title', 'Rotate', 'plugin'),
(651, 859, 'pjField', 1, 'title', 'Watermark', 'plugin'),
(652, 859, 'pjField', 2, 'title', 'Watermark', 'plugin'),
(653, 859, 'pjField', 3, 'title', 'Watermark', 'plugin'),
(654, 860, 'pjField', 1, 'title', 'Compression', 'plugin'),
(655, 860, 'pjField', 2, 'title', 'Compression', 'plugin'),
(656, 860, 'pjField', 3, 'title', 'Compression', 'plugin'),
(657, 861, 'pjField', 1, 'title', 'Delete All', 'plugin'),
(658, 861, 'pjField', 2, 'title', 'Delete All', 'plugin'),
(659, 861, 'pjField', 3, 'title', 'Delete All', 'plugin'),
(660, 862, 'pjField', 1, 'title', 'Originals', 'plugin'),
(661, 862, 'pjField', 2, 'title', 'Originals', 'plugin'),
(662, 862, 'pjField', 3, 'title', 'Originals', 'plugin'),
(663, 863, 'pjField', 1, 'title', 'Thumbs', 'plugin'),
(664, 863, 'pjField', 2, 'title', 'Thumbs', 'plugin'),
(665, 863, 'pjField', 3, 'title', 'Thumbs', 'plugin'),
(666, 864, 'pjField', 1, 'title', 'images', 'plugin'),
(667, 864, 'pjField', 2, 'title', 'images', 'plugin'),
(668, 864, 'pjField', 3, 'title', 'images', 'plugin'),
(669, 865, 'pjField', 1, 'title', 'Upload', 'plugin'),
(670, 865, 'pjField', 2, 'title', 'Upload', 'plugin'),
(671, 865, 'pjField', 3, 'title', 'Upload', 'plugin'),
(672, 866, 'pjField', 1, 'title', 're-create from original', 'plugin'),
(673, 866, 'pjField', 2, 'title', 're-create from original', 'plugin'),
(674, 866, 'pjField', 3, 'title', 're-create from original', 'plugin'),
(675, 867, 'pjField', 1, 'title', 'Original', 'plugin'),
(676, 867, 'pjField', 2, 'title', 'Original', 'plugin'),
(677, 867, 'pjField', 3, 'title', 'Original', 'plugin'),
(678, 868, 'pjField', 1, 'title', 'Preview', 'plugin'),
(679, 868, 'pjField', 2, 'title', 'Preview', 'plugin'),
(680, 868, 'pjField', 3, 'title', 'Preview', 'plugin'),
(681, 869, 'pjField', 1, 'title', 'Thumb', 'plugin'),
(682, 869, 'pjField', 2, 'title', 'Thumb', 'plugin'),
(683, 869, 'pjField', 3, 'title', 'Thumb', 'plugin'),
(684, 870, 'pjField', 1, 'title', '&laquo; Back', 'plugin'),
(685, 870, 'pjField', 2, 'title', '&laquo; Back', 'plugin'),
(686, 870, 'pjField', 3, 'title', '&laquo; Back', 'plugin'),
(687, 871, 'pjField', 1, 'title', 'Move the outer parts of the rectangular and/or position it over the image to change framing, aspect ratio or accentuate an object.', 'plugin');
INSERT INTO `cbbfloorplan_multi_lang` (`id`, `foreign_id`, `model`, `locale`, `field`, `content`, `source`) VALUES
(688, 871, 'pjField', 2, 'title', 'Move the outer parts of the rectangular and/or position it over the image to change framing, aspect ratio or accentuate an object.', 'plugin'),
(689, 871, 'pjField', 3, 'title', 'Move the outer parts of the rectangular and/or position it over the image to change framing, aspect ratio or accentuate an object.', 'plugin'),
(690, 872, 'pjField', 1, 'title', 'Crop Image', 'plugin'),
(691, 872, 'pjField', 2, 'title', 'Crop Image', 'plugin'),
(692, 872, 'pjField', 3, 'title', 'Crop Image', 'plugin'),
(693, 873, 'pjField', 1, 'title', 'Watermark text', 'plugin'),
(694, 873, 'pjField', 2, 'title', 'Watermark text', 'plugin'),
(695, 873, 'pjField', 3, 'title', 'Watermark text', 'plugin'),
(696, 874, 'pjField', 1, 'title', 'Watermark image', 'plugin'),
(697, 874, 'pjField', 2, 'title', 'Watermark image', 'plugin'),
(698, 874, 'pjField', 3, 'title', 'Watermark image', 'plugin'),
(699, 875, 'pjField', 1, 'title', 'Compress image', 'plugin'),
(700, 875, 'pjField', 2, 'title', 'Compress image', 'plugin'),
(701, 875, 'pjField', 3, 'title', 'Compress image', 'plugin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_noteplan`
--

CREATE TABLE `cbbfloorplan_noteplan` (
  `id` int(11) NOT NULL,
  `foreign_plane` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cbbfloorplan_noteplan`
--

INSERT INTO `cbbfloorplan_noteplan` (`id`, `foreign_plane`, `note`, `user`, `date`) VALUES
(2, 'FP5', 'Primera nota en el floorplan', 'Jose Garcia', '2016-06-30 10:32:46'),
(5, 'FP5', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tatio', 'Jose Garcia', '2016-06-30 10:51:40'),
(6, 'FP5', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam', 'Jose Garcia', '2016-06-30 10:51:54'),
(7, 'FP4', 'Nota en el piso 20', 'Jose Garcia', '2016-06-30 11:21:55'),
(8, 'FP5', 'Alguna nota', 'Jose Garcia', '2016-06-30 11:29:18'),
(9, 'FP5', 'TEST', 'Jose Garcia', '2016-06-30 14:30:05'),
(10, 'FP5', 'NEW TEST', 'Jose Garcia', '2016-06-30 14:31:05'),
(11, 'FP5', 'An other', 'Jose Garcia', '2016-06-30 14:32:45'),
(12, 'FP5', 'OTRa Prueba', 'Jose Garcia', '2016-06-30 14:37:20'),
(13, 'FP5', 'Prueba de retorno del id de la nota', 'Jose Garcia', '2016-06-30 14:38:27'),
(14, 'FP5', 'Last Test', 'Jose Garcia', '2016-06-30 14:41:28'),
(15, 'FP5', 'Ver el ultimo id ingresado', 'Jose Garcia', '2016-06-30 14:44:26'),
(16, 'P17', 'Primera nota en plano', 'Jose Garcia', '2016-07-01 10:27:03'),
(17, 'P17', 'Segunda nota en el plano electrico\n', 'Jose Garcia', '2016-07-01 10:50:06'),
(23, 'FP5', 'Nota con preloader', 'Jose Garcia', '2016-07-21 09:52:13'),
(25, 'P15', 'test preloader', 'Jose Garcia', '2016-07-21 10:01:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_options`
--

CREATE TABLE `cbbfloorplan_options` (
  `foreign_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(255) NOT NULL DEFAULT '',
  `tab_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `value` text,
  `label` text,
  `type` enum('string','text','int','float','enum') NOT NULL DEFAULT 'string',
  `order` int(10) UNSIGNED DEFAULT NULL,
  `is_visible` tinyint(1) UNSIGNED DEFAULT '1',
  `style` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_options`
--

INSERT INTO `cbbfloorplan_options` (`foreign_id`, `key`, `tab_id`, `value`, `label`, `type`, `order`, `is_visible`, `style`) VALUES
(1, 'o_date_format', 1, 'd.m.Y|m.d.Y|Y.m.d|j.n.Y|n.j.Y|Y.n.j|d/m/Y|m/d/Y|Y/m/d|j/n/Y|n/j/Y|Y/n/j|d-m-Y|m-d-Y|Y-m-d|j-n-Y|n-j-Y|Y-n-j::d-m-Y', 'd.m.Y (25.09.2012)|m.d.Y (09.25.2012)|Y.m.d (2012.09.25)|j.n.Y (25.9.2012)|n.j.Y (9.25.2012)|Y.n.j (2012.9.25)|d/m/Y (25/09/2012)|m/d/Y (09/25/2012)|Y/m/d (2012/09/25)|j/n/Y (25/9/2012)|n/j/Y (9/25/2012)|Y/n/j (2012/9/25)|d-m-Y (25-09-2012)|m-d-Y (09-25-2012)|Y-m-d (2012-09-25)|j-n-Y (25-9-2012)|n-j-Y (9-25-2012)|Y-n-j (2012-9-25)', 'enum', 1, 1, NULL),
(1, 'o_fields_index', 99, 'd874fcc5fe73b90d770a544664a3775d', NULL, 'string', NULL, 0, NULL),
(1, 'o_multi_lang', 99, '1|0::0', 'Yes|No', 'enum', NULL, 0, NULL),
(1, 'o_send_email', 1, 'mail|smtp::mail', 'PHP mail()|SMTP', 'enum', 5, 1, NULL),
(1, 'o_smtp_host', 1, NULL, NULL, 'string', 6, 1, NULL),
(1, 'o_smtp_pass', 1, NULL, NULL, 'string', 7, 1, NULL),
(1, 'o_smtp_port', 1, '25', NULL, 'int', 8, 1, NULL),
(1, 'o_smtp_user', 1, NULL, NULL, 'string', 9, 1, NULL),
(1, 'o_theme', 1, 'theme1|theme2|theme3|theme4|theme5|theme6|theme7|theme8|theme9|theme10::theme1', 'Theme 1|Theme 2|Theme 3|Theme 4|Theme 5|Theme 6|Theme 7|Theme 8|Theme 9|Theme 10', 'enum', 10, 0, NULL),
(1, 'o_timezone', 1, '-43200|-39600|-36000|-32400|-28800|-25200|-21600|-18000|-14400|-10800|-7200|-3600|0|3600|7200|10800|14400|18000|21600|25200|28800|32400|36000|39600|43200|46800::0', 'GMT-12:00|GMT-11:00|GMT-10:00|GMT-09:00|GMT-08:00|GMT-07:00|GMT-06:00|GMT-05:00|GMT-04:00|GMT-03:00|GMT-02:00|GMT-01:00|GMT|GMT+01:00|GMT+02:00|GMT+03:00|GMT+04:00|GMT+05:00|GMT+06:00|GMT+07:00|GMT+08:00|GMT+09:00|GMT+10:00|GMT+11:00|GMT+12:00|GMT+13:00', 'enum', 3, 1, NULL),
(1, 'o_time_format', 1, 'H:i|G:i|h:i|h:i a|h:i A|g:i|g:i a|g:i A::H:i', 'H:i (09:45)|G:i (9:45)|h:i (09:45)|h:i a (09:45 am)|h:i A (09:45 AM)|g:i (9:45)|g:i a (9:45 am)|g:i A (9:45 AM)', 'enum', 2, 1, NULL),
(1, 'o_update_2015_04_06_14_45_32.sql_3bda7e51d6fcb0ff845917535b44afa1', 99, '2016-07-13 11:29:26', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2015_04_09_03_33_52.sql_f2dbe32732fefcd11b0509872224a46e', 99, '2016-07-13 11:29:26', NULL, 'string', NULL, 1, NULL),
(1, 'o_update_2015_09_10_10_06_19.sql_b48e7cf06f81f12fdb0773734f70e222', 99, '2016-07-13 11:29:27', NULL, 'string', NULL, 1, NULL),
(1, 'o_week_start', 1, '0|1|2|3|4|5|6::1', 'Sunday|Monday|Tuesday|Wednesday|Thursday|Friday|Saturday', 'enum', 4, 0, NULL),
(1, 'private_key', 99, 'QxWgfQjd1Gwzi9Z0vXEdJkJEvJq7oqeJgpub5HQ3wbEduDwt2B7qykeb32voitk5vYdqsbo7d0ONengEaXhAZKAKwiXdCtzspxnkekmByxxTP9ucfyaLIOx9bjlQnxls3k5RfFsxMWsr0wOLrh3RD6SkijAwSxV+YEIjJoFyigYaV9gwdh+m45zjNGukFBFRHQc5CymLZzmhmVX0feoIt9v2Za6uhtbk6x23DKLhL40fxDmUek/TFjb0q3Z/sJnPAIJKJI3AtVA1ioy3RHda0+ocCOiI7ownGiMFQcK8LuxVIEQ7dgyIdrobMX2AlvfnX1HGSBu3DHQNqgRY/nGdXA==', NULL, 'string', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_plugin_gallery`
--

CREATE TABLE `cbbfloorplan_plugin_gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `foreign_id` int(10) UNSIGNED DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `small_path` varchar(255) DEFAULT NULL,
  `small_size` int(10) UNSIGNED DEFAULT NULL,
  `small_width` smallint(5) UNSIGNED DEFAULT NULL,
  `small_height` smallint(5) UNSIGNED DEFAULT NULL,
  `medium_path` varchar(255) DEFAULT NULL,
  `medium_size` int(10) UNSIGNED DEFAULT NULL,
  `medium_width` smallint(5) UNSIGNED DEFAULT NULL,
  `medium_height` smallint(5) UNSIGNED DEFAULT NULL,
  `large_path` varchar(255) DEFAULT NULL,
  `large_size` int(10) UNSIGNED DEFAULT NULL,
  `large_width` smallint(5) UNSIGNED DEFAULT NULL,
  `large_height` smallint(5) UNSIGNED DEFAULT NULL,
  `source_path` varchar(255) DEFAULT NULL,
  `source_size` int(10) UNSIGNED DEFAULT NULL,
  `source_width` smallint(5) UNSIGNED DEFAULT NULL,
  `source_height` smallint(5) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `watermark` varchar(255) DEFAULT NULL,
  `sort` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_plugin_gallery`
--

INSERT INTO `cbbfloorplan_plugin_gallery` (`id`, `foreign_id`, `hash`, `mime_type`, `small_path`, `small_size`, `small_width`, `small_height`, `medium_path`, `medium_size`, `medium_width`, `medium_height`, `large_path`, `large_size`, `large_width`, `large_height`, `source_path`, `source_size`, `source_width`, `source_height`, `name`, `alt`, `watermark`, `sort`) VALUES
(1, 40, NULL, 'image/jpeg', 'app/web/upload/small/40_306a6f3c35db675626ea3a6d2d8ddeeb.jpg', 13841, 100, 100, 'app/web/upload/medium/40_306a6f3c35db675626ea3a6d2d8ddeeb.jpg', 88142, 350, 350, 'app/web/upload/large/40_306a6f3c35db675626ea3a6d2d8ddeeb.jpg', 247731, 860, 460, 'app/web/upload/source/40_306a6f3c35db675626ea3a6d2d8ddeeb.jpg', 290108, 860, 460, 'electrico1.jpg', NULL, NULL, 1),
(2, 40, NULL, 'image/jpeg', 'app/web/upload/small/40_846ebcd84a924a33e1b1ad0b1015c2bf.jpg', 13443, 100, 100, 'app/web/upload/medium/40_846ebcd84a924a33e1b1ad0b1015c2bf.jpg', 110789, 350, 350, 'app/web/upload/large/40_846ebcd84a924a33e1b1ad0b1015c2bf.jpg', 319062, 860, 460, 'app/web/upload/source/40_846ebcd84a924a33e1b1ad0b1015c2bf.jpg', 419662, 860, 460, 'electrico3.jpg', NULL, NULL, 2),
(3, 40, NULL, 'image/jpeg', 'app/web/upload/small/40_2a1d1fa4a9ff8dea59b2774fcd8ce3ae.jpg', 12992, 100, 100, 'app/web/upload/medium/40_2a1d1fa4a9ff8dea59b2774fcd8ce3ae.jpg', 92708, 350, 350, 'app/web/upload/large/40_2a1d1fa4a9ff8dea59b2774fcd8ce3ae.jpg', 119804, 800, 450, 'app/web/upload/source/40_2a1d1fa4a9ff8dea59b2774fcd8ce3ae.jpg', 56475, 800, 450, 'RedesElectricas.jpg', NULL, NULL, 3),
(4, 40, NULL, 'image/jpeg', 'app/web/upload/small/40_0b917d391ed9de3cc18450edd8d02e0b.jpg', 13204, 100, 100, 'app/web/upload/medium/40_0b917d391ed9de3cc18450edd8d02e0b.jpg', 102778, 350, 350, 'app/web/upload/large/40_0b917d391ed9de3cc18450edd8d02e0b.jpg', 177342, 800, 600, 'app/web/upload/source/40_0b917d391ed9de3cc18450edd8d02e0b.jpg', 74616, 800, 600, 'redes03.jpg', NULL, NULL, 4),
(11, 9, NULL, 'image/png', 'app/web/upload/small/-101_9f7007ae0aeb74480433137fe33f6008.png', 18772, 100, 100, 'app/web/upload/medium/-101_9f7007ae0aeb74480433137fe33f6008.png', 159287, 350, 350, 'app/web/upload/large/-101_9f7007ae0aeb74480433137fe33f6008.png', 673058, 1920, 900, 'app/web/upload/source/-101_9f7007ae0aeb74480433137fe33f6008.png', 667117, 1920, 900, 'slide-3.png', NULL, NULL, 5),
(12, 1001, NULL, 'image/png', 'app/web/upload/small/1001_e4afee8ff400265d4b266db30074ebaa.png', 18772, 100, 100, 'app/web/upload/medium/1001_e4afee8ff400265d4b266db30074ebaa.png', 159287, 350, 350, 'app/web/upload/large/1001_e4afee8ff400265d4b266db30074ebaa.png', 673058, 1920, 900, 'app/web/upload/source/1001_e4afee8ff400265d4b266db30074ebaa.png', 667117, 1920, 900, 'slide-3.png', NULL, NULL, 1),
(13, 20, NULL, 'image/jpeg', 'app/web/upload/small/20_d6472164e3f00225fb0c2360e929ac28.jpg', 12441, 100, 100, 'app/web/upload/medium/20_d6472164e3f00225fb0c2360e929ac28.jpg', 95279, 350, 350, 'app/web/upload/large/20_d6472164e3f00225fb0c2360e929ac28.jpg', 483272, 1024, 768, 'app/web/upload/source/20_d6472164e3f00225fb0c2360e929ac28.jpg', 620888, 1024, 768, 'Tulips.jpg', NULL, NULL, 1),
(15, 20, NULL, 'image/jpeg', 'app/web/upload/small/20_ff2585221b11cdd26286d6d41c45db41.jpg', 11286, 100, 100, 'app/web/upload/medium/20_ff2585221b11cdd26286d6d41c45db41.jpg', 108832, 350, 350, 'app/web/upload/large/20_ff2585221b11cdd26286d6d41c45db41.jpg', 620912, 1024, 768, 'app/web/upload/source/20_ff2585221b11cdd26286d6d41c45db41.jpg', 780831, 1024, 768, 'Koala.jpg', NULL, NULL, 2),
(30, 20, NULL, 'image/png', 'app/web/upload/small/20_3cce039ef6a6964a54fa3deed2d112eb.jpg', 26462, 100, 100, 'app/web/upload/medium/20_3cce039ef6a6964a54fa3deed2d112eb.jpg', 271606, 350, 350, 'app/web/upload/large/20_3cce039ef6a6964a54fa3deed2d112eb.jpg', 2052550, 1449, 815, 'app/web/upload/source/20_3cce039ef6a6964a54fa3deed2d112eb.jpg', 2815366, 1449, 815, 'Suicide-Squad-2016.png', NULL, NULL, 3),
(31, 40, NULL, 'image/jpeg', 'app/web/upload/small/40_24a91ac079267d258987929e909ae69e.jpg', 11286, 100, 100, 'app/web/upload/medium/40_24a91ac079267d258987929e909ae69e.jpg', 108832, 350, 350, 'app/web/upload/large/40_24a91ac079267d258987929e909ae69e.jpg', 620912, 1024, 768, 'app/web/upload/source/40_24a91ac079267d258987929e909ae69e.jpg', 780831, 1024, 768, 'Koala.jpg', NULL, NULL, 5),
(32, 5, NULL, 'image/jpeg', 'app/web/upload/small/5_8ba09a472f4ed0f50e44bbd3a102ebb0.jpg', 13717, 100, 100, 'app/web/upload/medium/5_8ba09a472f4ed0f50e44bbd3a102ebb0.jpg', 110643, 350, 350, 'app/web/upload/large/5_8ba09a472f4ed0f50e44bbd3a102ebb0.jpg', 214876, 640, 401, 'app/web/upload/source/5_8ba09a472f4ed0f50e44bbd3a102ebb0.jpg', 214075, 640, 401, '15_3d66e344c8c2144bfb1f18c34c69ce03.jpg', NULL, NULL, 1),
(33, 5, NULL, 'image/png', 'app/web/upload/small/5_7827f7873c89e240c9e86ae5316b1d77.jpg', 16476, 100, 100, 'app/web/upload/medium/5_7827f7873c89e240c9e86ae5316b1d77.jpg', 136193, 350, 350, 'app/web/upload/large/5_7827f7873c89e240c9e86ae5316b1d77.jpg', 133772, 500, 280, 'app/web/upload/source/5_7827f7873c89e240c9e86ae5316b1d77.jpg', 133772, 500, 280, '16_1f7b9b25180557d514b2d97fe4d02859.png', NULL, NULL, 2),
(35, 5, NULL, 'image/jpeg', 'app/web/upload/small/5_d604299c2162bec7a7ab3871d09a05e6.jpg', 11286, 100, 100, 'app/web/upload/medium/5_d604299c2162bec7a7ab3871d09a05e6.jpg', 108832, 350, 350, 'app/web/upload/large/5_d604299c2162bec7a7ab3871d09a05e6.jpg', 620912, 1024, 768, 'app/web/upload/source/5_d604299c2162bec7a7ab3871d09a05e6.jpg', 780831, 1024, 768, 'Koala.jpg', NULL, NULL, 3),
(36, 7, NULL, 'image/jpeg', 'app/web/upload/small/7_1ea6bc6fe7de4131392178107052c87b.jpg', 13779, 100, 100, 'app/web/upload/medium/7_1ea6bc6fe7de4131392178107052c87b.jpg', 118059, 350, 350, 'app/web/upload/large/7_1ea6bc6fe7de4131392178107052c87b.jpg', 162799, 642, 403, 'app/web/upload/source/7_1ea6bc6fe7de4131392178107052c87b.jpg', 156855, 642, 403, '15_3d66e344c8c2144bfb1f18c34c69ce03.jpg', NULL, NULL, 1),
(37, 7, NULL, 'image/jpeg', 'app/web/upload/small/7_0b326ea58657a8597c94534ebece8cc5.jpg', 12797, 100, 100, 'app/web/upload/medium/7_0b326ea58657a8597c94534ebece8cc5.jpg', 116761, 350, 350, 'app/web/upload/large/7_0b326ea58657a8597c94534ebece8cc5.jpg', 287356, 700, 467, 'app/web/upload/source/7_0b326ea58657a8597c94534ebece8cc5.jpg', 285491, 700, 467, '17_13ef2ddfb424bf7be4f7bf85f48743d8.jpg', NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_plugin_locale`
--

CREATE TABLE `cbbfloorplan_plugin_locale` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_iso` varchar(2) DEFAULT NULL,
  `sort` int(10) UNSIGNED DEFAULT NULL,
  `is_default` tinyint(1) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_plugin_locale`
--

INSERT INTO `cbbfloorplan_plugin_locale` (`id`, `language_iso`, `sort`, `is_default`) VALUES
(1, 'gb', 1, 1),
(2, 'nl', 3, 0),
(3, 'es', 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_plugin_locale_languages`
--

CREATE TABLE `cbbfloorplan_plugin_locale_languages` (
  `iso` varchar(2) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_plugin_locale_languages`
--

INSERT INTO `cbbfloorplan_plugin_locale_languages` (`iso`, `title`, `file`) VALUES
('aa', 'Afar', NULL),
('ab', 'Abkhazian', NULL),
('ae', 'Avestan', 'ae.png'),
('af', 'Afrikaans', 'af.png'),
('ak', 'Akan', NULL),
('am', 'Amharic', 'am.png'),
('an', 'Aragonese', 'an.png'),
('as', 'Assamese', 'as.png'),
('av', 'Avaric', NULL),
('ay', 'Aymara', NULL),
('ba', 'Bashkir', 'ba.png'),
('be', 'Belarusian', 'be.png'),
('bg', 'Bulgarian', 'bg.png'),
('bh', 'Bihari', 'bh.png'),
('bi', 'Bislama', 'bi.png'),
('bm', 'Bambara', 'bm.png'),
('bn', 'Bengali', 'bn.png'),
('bo', 'Tibetan', 'bo.png'),
('br', 'Breton', 'br.png'),
('bs', 'Bosnian', 'bs.png'),
('ca', 'Catalan', 'catalonia.png'),
('ce', 'Chechen', NULL),
('ch', 'Chamorro', 'ch.png'),
('co', 'Corsican', 'co.png'),
('cr', 'Cree', 'cr.png'),
('cs', 'Czech', 'cz.png'),
('cu', 'Church Slavic', 'cu.png'),
('cv', 'Chuvash', 'cv.png'),
('cy', 'Welsh', 'cy.png'),
('da', 'Danish', 'dk.png'),
('de', 'German', 'de.png'),
('dz', 'Dzongkha', 'dz.png'),
('ee', 'Ewe', 'ee.png'),
('el', 'Greek', 'gr.png'),
('eo', 'Esperanto', NULL),
('es', 'Spanish', 'es.png'),
('et', 'Estonian', 'et.png'),
('eu', 'Basque', 'eu.png'),
('ff', 'Fulah', NULL),
('fi', 'Finnish', 'fi.png'),
('fj', 'Fijian', 'fj.png'),
('fo', 'Faroese', 'fo.png'),
('fr', 'French', 'fr.png'),
('fy', 'Western Frisian', NULL),
('ga', 'Irish', 'ga.png'),
('gb', 'English - UK', 'gb.png'),
('gd', 'Scottish Gaelic', 'gd.png'),
('gl', 'Galician', 'gl.png'),
('gn', 'Guarani', 'gn.png'),
('gu', 'Gujarati', 'gu.png'),
('gv', 'Manx', NULL),
('ha', 'Hausa', NULL),
('hi', 'Hindi', NULL),
('ho', 'Hiri Motu', NULL),
('hr', 'Croatian', 'hr.png'),
('ht', 'Haitian', 'ht.png'),
('hu', 'Hungarian', 'hu.png'),
('hy', 'Armenian', NULL),
('hz', 'Herero', NULL),
('ia', 'Interlingua (International Auxiliary Language Association)', NULL),
('id', 'Indonesian', 'id.png'),
('ie', 'Interlingue', 'ie.png'),
('ig', 'Igbo', NULL),
('ii', 'Sichuan Yi', NULL),
('ik', 'Inupiaq', NULL),
('io', 'Ido', 'io.png'),
('is', 'Icelandic', 'is.png'),
('it', 'Italian', 'it.png'),
('iu', 'Inuktitut', NULL),
('ka', 'Georgian', NULL),
('kg', 'Kongo', 'kg.png'),
('ki', 'Kikuyu', 'ki.png'),
('kj', 'Kwanyama', NULL),
('kl', 'Kalaallisut', NULL),
('km', 'Khmer', 'km.png'),
('kn', 'Kannada', 'kn.png'),
('ko', 'Korean', NULL),
('kr', 'Kanuri', 'kr.png'),
('kv', 'Komi', NULL),
('kw', 'Cornish', 'kw.png'),
('ky', 'Kirghiz', 'ky.png'),
('la', 'Latin', 'la.png'),
('lb', 'Luxembourgish', 'lb.png'),
('lg', 'Ganda', NULL),
('li', 'Limburgish', 'li.png'),
('ln', 'Lingala', NULL),
('lo', 'Lao', NULL),
('lt', 'Lithuanian', 'lt.png'),
('lu', 'Luba-Katanga', 'lu.png'),
('lv', 'Latvian', 'lv.png'),
('mg', 'Malagasy', 'mg.png'),
('mh', 'Marshallese', 'mh.png'),
('mi', 'Maori', NULL),
('mk', 'Macedonian', 'mk.png'),
('mn', 'Mongolian', 'mn.png'),
('mr', 'Marathi', 'mr.png'),
('mt', 'Maltese', 'mt.png'),
('my', 'Burmese', 'my.png'),
('na', 'Nauru', 'na.png'),
('nb', 'Norwegian Bokmal', NULL),
('nd', 'North Ndebele', NULL),
('ne', 'Nepali', 'ne.png'),
('ng', 'English - Nigeria', 'ng.png'),
('nl', 'Dutch', 'nl.png'),
('nn', 'Norwegian Nynorsk', NULL),
('no', 'Norwegian', 'no.png'),
('nr', 'South Ndebele', 'nr.png'),
('nv', 'Navajo', NULL),
('ny', 'Chichewa', NULL),
('oc', 'Occitan', NULL),
('oj', 'Ojibwa', NULL),
('om', 'Oromo', 'om.png'),
('or', 'Oriya', NULL),
('os', 'Ossetian', NULL),
('pi', 'Pali', NULL),
('pl', 'Polish', 'pl.png'),
('pt', 'Portuguese', 'pt.png'),
('qu', 'Quechua', NULL),
('rm', 'Raeto-Romance', NULL),
('rn', 'Kirundi', NULL),
('ro', 'Romanian', 'ro.png'),
('ru', 'Russian', 'ru.png'),
('rw', 'Kinyarwanda', 'rw.png'),
('sa', 'Sanskrit', 'sa.png'),
('sc', 'Sardinian', 'sc.png'),
('se', 'Northern Sami', 'se.png'),
('sg', 'Sango', 'sg.png'),
('si', 'Sinhala', 'si.png'),
('sk', 'Slovak', 'sk.png'),
('sl', 'Slovenian', 'sl.png'),
('sm', 'Samoan', 'sm.png'),
('sn', 'Shona', 'sn.png'),
('sq', 'Albanian', 'al.png'),
('sr', 'Serbian', 'sr.png'),
('ss', 'Swati', NULL),
('st', 'Southern Sotho', 'st.png'),
('su', 'Sundanese', NULL),
('sv', 'Swedish', 'se.png'),
('sw', 'Swahili', NULL),
('ta', 'Tamil', NULL),
('te', 'Telugu', NULL),
('tg', 'Tajik', 'tg.png'),
('th', 'Thai', 'th.png'),
('ti', 'Tigrinya', NULL),
('tl', 'Tagalog', 'tl.png'),
('tn', 'Tswana', 'tn.png'),
('to', 'Tonga', 'to.png'),
('tr', 'Turkish', 'tr.png'),
('ts', 'Tsonga', NULL),
('tt', 'Tatar', 'tt.png'),
('tw', 'Twi', 'tw.png'),
('ty', 'Tahitian', NULL),
('uk', 'Ukrainian', NULL),
('us', 'English - USA', 'us.png'),
('uz', 'Uzbek', 'uz.png'),
('ve', 'Venda', 've.png'),
('vi', 'Vietnamese', 'vi.png'),
('vo', 'Volapuk', NULL),
('wa', 'Walloon', 'wa.png'),
('wo', 'Wolof', NULL),
('xh', 'Xhosa', NULL),
('yo', 'Yoruba', NULL),
('za', 'Zhuang', 'za.png'),
('zu', 'Zulu', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_plugin_log`
--

CREATE TABLE `cbbfloorplan_plugin_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `value` text,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_plugin_log_config`
--

CREATE TABLE `cbbfloorplan_plugin_log_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_plugin_one_admin`
--

CREATE TABLE `cbbfloorplan_plugin_one_admin` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_roles`
--

CREATE TABLE `cbbfloorplan_roles` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_roles`
--

INSERT INTO `cbbfloorplan_roles` (`id`, `role`, `status`) VALUES
(1, 'admin', 'T'),
(2, 'editor', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_sections`
--

CREATE TABLE `cbbfloorplan_sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `floorplan_id` int(10) UNSIGNED DEFAULT NULL,
  `top` smallint(5) UNSIGNED DEFAULT NULL,
  `left` smallint(5) UNSIGNED DEFAULT NULL,
  `width` smallint(5) UNSIGNED DEFAULT NULL,
  `height` smallint(5) UNSIGNED DEFAULT NULL,
  `type` enum('image','info','room','com','bda') DEFAULT NULL,
  `image_id` int(10) UNSIGNED DEFAULT NULL,
  `deg` int(10) DEFAULT NULL,
  `transform` varchar(255) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL,
  `info` text,
  `floor_id` int(10) DEFAULT NULL,
  `foreign_room` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_sections`
--

INSERT INTO `cbbfloorplan_sections` (`id`, `floorplan_id`, `top`, `left`, `width`, `height`, `type`, `image_id`, `deg`, `transform`, `position`, `title`, `size`, `dimensions`, `info`, `floor_id`, `foreign_room`) VALUES
(277, 4, 64, 167, 98, 98, 'image', 17, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(278, 4, 36, 59, 80, 80, 'image', 18, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(280, 4, 214, 307, 200, 200, 'com', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 20, 5),
(283, 5, 173, 327, 41, 41, 'image', 2, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(284, 5, 284, 257, 55, 55, 'image', 3, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(285, 5, 252, 324, 200, 200, 'com', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 40, 5),
(287, 5, 45, 48, 200, 200, 'bda', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 40, NULL),
(300, 5, 206, 292, 200, 200, 'com', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 40, 5),
(302, 5, 44, 164, 200, 200, 'bda', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 40, NULL),
(303, 5, 219, 381, 200, 200, 'com', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 40, 5),
(307, 6, 61, 51, 115, 115, 'image', 24, 1, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(308, 6, 305, 138, 108, 108, 'image', 25, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(310, 6, 371, 552, 200, 200, 'info', NULL, 0, NULL, 'top_right', 'title', '500', '300*200', 'test', NULL, 4),
(312, 6, 176, 151, 111, 111, 'image', 26, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(319, 5, 175, 191, 48, 48, 'image', 1, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(321, 5, 281, 359, 51, 51, 'image', 4, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(326, 7, 0, 587, 200, 200, 'image', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(328, 8, 441, 440, 200, 200, 'image', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(329, 9, 109, 239, 130, 130, 'image', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(331, 10, 79, 196, 173, 173, 'image', 12, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(334, 5, 347, 181, 200, 200, 'bda', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 40, NULL),
(337, 5, 350, 589, 200, 200, 'com', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 40, 5),
(339, 5, 171, 425, 200, 200, 'info', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(340, 10, 83, 279, 200, 200, 'bda', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 1001, NULL),
(342, 5, 254, 428, 200, 200, 'com', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 40, 5),
(344, 4, 243, 390, 200, 200, 'com', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 20, 5),
(345, 5, 232, 125, 66, 66, 'image', 31, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(355, 13, 170, 78, 81, 81, 'image', 36, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(356, 13, 253, 78, 83, 83, 'image', 37, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, NULL, NULL),
(357, 13, 99, 134, 200, 200, 'info', NULL, 0, NULL, 'top_right', 'Electrical Floor 7', '500m', '250 * 250', 'TEST DESCRIPTION', NULL, 4),
(358, 13, 96, 401, 200, 200, 'com', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 7, 5),
(359, 13, 342, 605, 200, 200, 'bda', NULL, 0, NULL, 'top_right', NULL, NULL, NULL, NULL, 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_typeplane`
--

CREATE TABLE `cbbfloorplan_typeplane` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` enum('T','F') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cbbfloorplan_typeplane`
--

INSERT INTO `cbbfloorplan_typeplane` (`id`, `type`, `status`) VALUES
(6, 'Electrical', 'T'),
(10, 'Mechanical', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_typewire`
--

CREATE TABLE `cbbfloorplan_typewire` (
  `id` int(11) NOT NULL,
  `wire` varchar(255) DEFAULT NULL,
  `status` enum('T','F') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cbbfloorplan_typewire`
--

INSERT INTO `cbbfloorplan_typewire` (`id`, `wire`, `status`) VALUES
(2, 'Red', 'T'),
(3, 'phone', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_users`
--

CREATE TABLE `cbbfloorplan_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` blob,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `status` enum('T','F') NOT NULL DEFAULT 'T',
  `is_active` enum('T','F') NOT NULL DEFAULT 'F',
  `ip` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cbbfloorplan_users`
--

INSERT INTO `cbbfloorplan_users` (`id`, `role_id`, `email`, `password`, `name`, `phone`, `created`, `last_login`, `status`, `is_active`, `ip`) VALUES
(1, 1, 'admin@admin.com', 0xe161260d66af52ed4e653c3995c03b46, 'Administrator', NULL, '2016-07-13 11:29:27', '2016-08-30 19:43:44', 'T', 'F', '::1'),
(2, 2, 'jgarcia@cilfer.com', 0xe161260d66af52ed4e653c3995c03b46, 'Jose Garcia', '4129126717', '2016-07-13 11:36:41', '2016-08-30 19:50:15', 'T', 'T', '::1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_vendors`
--

CREATE TABLE `cbbfloorplan_vendors` (
  `id` int(11) NOT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `status` enum('T','F') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cbbfloorplan_vendors`
--

INSERT INTO `cbbfloorplan_vendors` (`id`, `vendor`, `status`) VALUES
(1, 'Telefonica', 'T'),
(2, 'Digitel', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_wirecolor`
--

CREATE TABLE `cbbfloorplan_wirecolor` (
  `id` int(11) NOT NULL,
  `color` varchar(150) DEFAULT NULL,
  `status` enum('T','F') CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cbbfloorplan_wirecolor`
--

INSERT INTO `cbbfloorplan_wirecolor` (`id`, `color`, `status`) VALUES
(1, 'Blue', 'T'),
(4, 'Red', 'T'),
(5, 'Black', 'T'),
(6, 'Green', 'T'),
(7, 'White', 'T');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cbbfloorplan_wiredetail`
--

CREATE TABLE `cbbfloorplan_wiredetail` (
  `id` int(11) NOT NULL,
  `foreign_floor` int(11) NOT NULL,
  `foreign_wire` int(11) NOT NULL,
  `foreign_vendor` int(11) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `status` enum('T','F') CHARACTER SET utf8 NOT NULL,
  `foreign_section` int(11) NOT NULL,
  `foreign_color` int(11) NOT NULL,
  `long` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cbbfloorplan_wiredetail`
--

INSERT INTO `cbbfloorplan_wiredetail` (`id`, `foreign_floor`, `foreign_wire`, `foreign_vendor`, `tag`, `status`, `foreign_section`, `foreign_color`, `long`) VALUES
(103, 20, 2, 1, 'TAG TEST', 'T', 40, 0, '50M'),
(122, 20, 2, 1, 'TAG 01', 'T', 38, 7, '20m'),
(123, 20, 2, 1, 'COM 1', 'F', 42, 5, '230'),
(124, 20, 2, 1, 'TAG 1', 'T', 280, 4, '230M'),
(125, 40, 2, 1, 'TAG 2', 'T', 285, 5, '280'),
(126, 40, 2, 2, 'TAG 40', 'T', 286, 4, '300'),
(127, 40, 2, 1, 'CONM', 'T', 300, 5, '311'),
(128, 40, 2, 1, 'NEW TAG ', 'T', 303, 1, '550M'),
(129, 40, 2, 2, 'TAG 2 FLOOR 40', 'T', 303, 5, '650M'),
(130, 40, 2, 1, 'TAG 3 FLOOR 40', 'T', 303, 4, '750M'),
(131, 40, 2, 2, 'TAG 3 FLOOR 40', 'T', 303, 6, '850'),
(132, 40, 2, 1, 'TAG 4 FLOOR 40', 'T', 303, 7, '950'),
(133, 40, 2, 2, 'tag 132', 'T', 337, 5, '230'),
(134, 40, 2, 1, 'tag 533', 'T', 337, 5, '250'),
(135, 40, 2, 2, 'tag 452', 'T', 337, 1, '310'),
(136, 40, 2, 1, 'tag 765', 'T', 337, 4, '330'),
(137, 40, 3, 1, 'TAG 01', 'T', 342, 5, '110m'),
(138, 40, 3, 1, 'TAG 02', 'T', 342, 5, '150m'),
(139, 40, 3, 1, 'TAG 03', 'T', 342, 5, '170m'),
(140, 20, 2, 1, 'TAG 04', 'T', 344, 1, '200m'),
(141, 20, 2, 1, 'TAG 05', 'T', 344, 1, '220m'),
(142, 20, 2, 1, 'TAG 06', 'T', 344, 1, '250m'),
(143, 20, 3, 1, 'TAG 07', 'T', 344, 4, '270m'),
(144, 20, 3, 1, 'TAG 08', 'T', 344, 4, '300m'),
(145, 7, 2, 1, 'TAG 01', 'T', 358, 1, '150m'),
(146, 7, 3, 1, 'TAG 02', 'T', 358, 5, '180m'),
(147, 7, 3, 2, 'TAG 03', 'T', 358, 4, '210m');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cbbfloorplan_bdasurvey`
--
ALTER TABLE `cbbfloorplan_bdasurvey`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_fields`
--
ALTER TABLE `cbbfloorplan_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indices de la tabla `cbbfloorplan_floorplans`
--
ALTER TABLE `cbbfloorplan_floorplans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `floor` (`floor`);

--
-- Indices de la tabla `cbbfloorplan_floorroom`
--
ALTER TABLE `cbbfloorplan_floorroom`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_listplans`
--
ALTER TABLE `cbbfloorplan_listplans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_typeplane` (`foreign_typeplane`),
  ADD KEY `foreign_floor` (`foreign_floor`);

--
-- Indices de la tabla `cbbfloorplan_multi_lang`
--
ALTER TABLE `cbbfloorplan_multi_lang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `foreign_id` (`foreign_id`,`model`,`locale`,`field`);

--
-- Indices de la tabla `cbbfloorplan_noteplan`
--
ALTER TABLE `cbbfloorplan_noteplan`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_options`
--
ALTER TABLE `cbbfloorplan_options`
  ADD PRIMARY KEY (`foreign_id`,`key`);

--
-- Indices de la tabla `cbbfloorplan_plugin_gallery`
--
ALTER TABLE `cbbfloorplan_plugin_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_id` (`foreign_id`),
  ADD KEY `hash` (`hash`);

--
-- Indices de la tabla `cbbfloorplan_plugin_locale`
--
ALTER TABLE `cbbfloorplan_plugin_locale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `language_iso` (`language_iso`);

--
-- Indices de la tabla `cbbfloorplan_plugin_locale_languages`
--
ALTER TABLE `cbbfloorplan_plugin_locale_languages`
  ADD PRIMARY KEY (`iso`);

--
-- Indices de la tabla `cbbfloorplan_plugin_log`
--
ALTER TABLE `cbbfloorplan_plugin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_plugin_log_config`
--
ALTER TABLE `cbbfloorplan_plugin_log_config`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_plugin_one_admin`
--
ALTER TABLE `cbbfloorplan_plugin_one_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_roles`
--
ALTER TABLE `cbbfloorplan_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indices de la tabla `cbbfloorplan_sections`
--
ALTER TABLE `cbbfloorplan_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `floorplan_id` (`floorplan_id`);

--
-- Indices de la tabla `cbbfloorplan_typeplane`
--
ALTER TABLE `cbbfloorplan_typeplane`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_typewire`
--
ALTER TABLE `cbbfloorplan_typewire`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_users`
--
ALTER TABLE `cbbfloorplan_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `status` (`status`);

--
-- Indices de la tabla `cbbfloorplan_vendors`
--
ALTER TABLE `cbbfloorplan_vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_wirecolor`
--
ALTER TABLE `cbbfloorplan_wirecolor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cbbfloorplan_wiredetail`
--
ALTER TABLE `cbbfloorplan_wiredetail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_bdasurvey`
--
ALTER TABLE `cbbfloorplan_bdasurvey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_fields`
--
ALTER TABLE `cbbfloorplan_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=876;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_floorplans`
--
ALTER TABLE `cbbfloorplan_floorplans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_floorroom`
--
ALTER TABLE `cbbfloorplan_floorroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_listplans`
--
ALTER TABLE `cbbfloorplan_listplans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_multi_lang`
--
ALTER TABLE `cbbfloorplan_multi_lang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=702;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_noteplan`
--
ALTER TABLE `cbbfloorplan_noteplan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_plugin_gallery`
--
ALTER TABLE `cbbfloorplan_plugin_gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_plugin_locale`
--
ALTER TABLE `cbbfloorplan_plugin_locale`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_plugin_log`
--
ALTER TABLE `cbbfloorplan_plugin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_plugin_log_config`
--
ALTER TABLE `cbbfloorplan_plugin_log_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_plugin_one_admin`
--
ALTER TABLE `cbbfloorplan_plugin_one_admin`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_roles`
--
ALTER TABLE `cbbfloorplan_roles`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_sections`
--
ALTER TABLE `cbbfloorplan_sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_typeplane`
--
ALTER TABLE `cbbfloorplan_typeplane`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_typewire`
--
ALTER TABLE `cbbfloorplan_typewire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_users`
--
ALTER TABLE `cbbfloorplan_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_vendors`
--
ALTER TABLE `cbbfloorplan_vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_wirecolor`
--
ALTER TABLE `cbbfloorplan_wirecolor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `cbbfloorplan_wiredetail`
--
ALTER TABLE `cbbfloorplan_wiredetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;--
-- Base de datos: `forum`
--
CREATE DATABASE IF NOT EXISTS `forum` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `forum`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_api_access`
--

CREATE TABLE `tec_api_access` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_api_keys`
--

CREATE TABLE `tec_api_keys` (
  `id` int(11) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_api_limits`
--

CREATE TABLE `tec_api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_api_logs`
--

CREATE TABLE `tec_api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_badges`
--

CREATE TABLE `tec_badges` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_badges`
--

INSERT INTO `tec_badges` (`id`, `title`, `class`) VALUES
(1, 'Star', 'fa fa-star'),
(2, 'Heart', 'fa fa-heart');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_captcha`
--

CREATE TABLE `tec_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent_id` int(11) UNSIGNED DEFAULT NULL,
  `slug` varchar(80) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `private` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `name`, `description`, `parent_id`, `slug`, `active`, `private`) VALUES
(1, 'General', 'This is meta description for general category', 0, 'general', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_conversations`
--

CREATE TABLE `tec_conversations` (
  `id` int(11) UNSIGNED NOT NULL,
  `subject` varchar(100) NOT NULL,
  `sender_id` int(11) UNSIGNED NOT NULL,
  `receiver_id` int(11) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_reply_time` datetime DEFAULT NULL,
  `sender_read` tinyint(1) DEFAULT '1',
  `receiver_read` tinyint(1) DEFAULT '0',
  `unique_id` varchar(50) NOT NULL,
  `important` tinyint(1) DEFAULT NULL,
  `receiver_delete` tinyint(1) DEFAULT NULL,
  `sender_delete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_fields`
--

CREATE TABLE `tec_fields` (
  `id` int(10) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `unique_id` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `public` tinyint(1) DEFAULT '1',
  `options` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_fields_data`
--

CREATE TABLE `tec_fields_data` (
  `field_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'moderator', 'Moderator'),
(3, 'member', 'Member');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_messages`
--

CREATE TABLE `tec_messages` (
  `id` int(11) NOT NULL,
  `con_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_pages`
--

CREATE TABLE `tec_pages` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(180) NOT NULL,
  `slug` varchar(55) NOT NULL,
  `body` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_no` mediumint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_pages`
--

INSERT INTO `tec_pages` (`id`, `title`, `description`, `slug`, `body`, `active`, `updated_at`, `order_no`) VALUES
(1, 'About us', 'This is about us page and we will write meta description soon', 'about', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas&period; Vestibulum tortor quam&comma; feugiat vitae&comma; ultricies eget&comma; tempor sit amet&comma; ante&period; Donec eu libero sit amet quam egestas semper&period; Aenean ultricies mi vitae est&period; Mauris placerat eleifend leo&period; Quisque sit amet est et sapien ullamcorper pharetra&period; Vestibulum erat wisi&comma; condimentum sed&comma; commodo vitae&comma; ornare sit amet&comma; wisi&period; Aenean fermentum&comma; elit eget tincidunt condimentum&comma; eros ipsum rutrum orci&comma; sagittis tempus lacus enim ac dui&period; Donec non enim in turpis pulvinar facilisis&period; Ut felis&period; Praesent dapibus&comma; neque id cursus faucibus&comma; tortor neque egestas augue&comma; eu vulputate magna eros eu erat&period; Aliquam erat volutpat&period; Nam dui mi&comma; tincidunt quis&comma; accumsan porttitor&comma; facilisis luctus&comma; metus&lt;br&gt;&lt;br&gt;\r&NewLine;Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas&period; Vestibulum tortor quam&comma; feugiat vitae&comma; ultricies eget&comma; tempor sit amet&comma; ante&period; Donec eu libero sit amet quam egestas semper&period; Aenean ultricies mi vitae est&period; Mauris placerat eleifend leo&period;', 1, '2015-09-10 18:20:37', 1),
(2, 'Terms', 'Terms page description, please review our terms before registering and using our forum.', 'terms', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas&period; Vestibulum tortor quam&comma; feugiat vitae&comma; ultricies eget&comma; tempor sit amet&comma; ante&period; Donec eu libero sit amet quam egestas semper&period; Aenean ultricies mi vitae est&period; Mauris placerat eleifend leo&period; Quisque sit amet est et sapien ullamcorper pharetra&period; Vestibulum erat wisi&comma; condimentum sed&comma; commodo vitae&comma; ornare sit amet&comma; wisi&period; Aenean fermentum&comma; elit eget tincidunt condimentum&comma; eros ipsum rutrum orci&comma; sagittis tempus lacus enim ac dui&period; Donec non enim in turpis pulvinar facilisis&period; Ut felis&period; Praesent dapibus&comma; neque id cursus faucibus&comma; tortor neque egestas augue&comma; eu vulputate magna eros eu erat&period; Aliquam erat volutpat&period; Nam dui mi&comma; tincidunt quis&comma; accumsan porttitor&comma; facilisis luctus&comma; metus&lt;br&gt;', 1, '2015-09-10 18:20:13', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_posts`
--

CREATE TABLE `tec_posts` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `topic_slug` varchar(100) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_slug` varchar(55) DEFAULT NULL,
  `body` text NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notify` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('03cbb90bce89f48ad84aece60d12b6762a1360f8', '::1', 1466106966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363130363932353b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('08f3f2d67b832ad4d3076aebcbbb8d1fbf2c51ab', '::1', 1466170428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363137303431393b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343636303838393731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('13733c2ded2720a89771db5adb35a860a1c7361c', '::1', 1466099204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039383937343b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('182a55a420a2ec761d51a2294a0bae7fb5f96d55', '::1', 1466099668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039393633323b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('1887b81fbae00edb24809f1e4dfcd5fcfed9116e', '::1', 1466102779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363130323438333b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('18ec738bc3b5cceac9bd1577b8fa1b3cb90a82f5', '::1', 1466102371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363130323038363b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('25b194631481a8d7bdc2250f5718da1542e8b38a', '::1', 1466182453, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363138323435333b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343636303838393731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('34aa254e8421238fc786cc2fdb1149f06f8a3716', '::1', 1466089215, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363038383937313b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('53a6461f1350c7d7f30bf36b253fab7919f319d0', '::1', 1466176016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363137363030333b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343636303838393731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('5b095b4d4472bbf1d0bc5c9f658964ba35ce9f0b', '::1', 1466093741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039333437303b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('69641f4185c3641cc8da6d8ee0a294ead5314a20', '::1', 1466102912, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363130323837373b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('77437db1ad25e3eb6e43016610caf3cdf796a3e9', '::1', 1466101537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363130313433333b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('7d1f0e2d196d06501eff962bbf5fb363bddd4b73', '::1', 1466093882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039333838323b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('84d0e1f4fbe895122b0e0200a408c251040a5237', '::1', 1466098465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039383230363b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('88561f1582589ad0d7e122941cdde26baeb9a94c', '::1', 1466175185, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363137353137323b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343636303838393731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('8d2feaae2fb2803bf22185cceb044553b0b1b28c', '::1', 1466106244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363130363234343b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('8f22daed9ef4a45bf676340d620a0db48c56b727', '::1', 1466098575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039383537303b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('8f5d26ac99b3b2aeebe8ee0ff7f4054a64dcad2f', '::1', 1466090899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039303839313b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('937012ce58bed61e79a99a387607a2118258be6c', '::1', 1466092610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039323432383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('953b8ff12d392a135a9a2dd20867bd65508e26a0', '::1', 1466089661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363038393532343b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('96da34f27fa3a16852602ab9f0e604ee61c5735a', '::1', 1466110635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363131303633353b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('97c58a89191688407b17d18196bc0316fed7ffca', '::1', 1466105675, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363130353338303b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('9c2494b0ec4c49db6411431381e171e8f0455043', '::1', 1466092041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039313833323b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('be4ce0693dceff5833004bc35c708b53852b6897', '::1', 1466177499, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363137373439393b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343636303838393731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('c85a9194b5c8e2b97a68e39754d41dabe820db33', '::1', 1466106915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363130363631383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('e592e17db2c771a3eb952742762c4c7145aeee8b', '::1', 1466171577, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363137313535353b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343636303838393731223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b),
('feb3ac73a051bc4fe2bfc35e73b9c9401e7052d5', '::1', 1466091629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313436363039313333333b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343434323836383937223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_settings`
--

CREATE TABLE `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `records_per_page` int(2) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '0.1',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `style` varchar(20) DEFAULT NULL,
  `editor` varchar(20) DEFAULT NULL,
  `sidebar` varchar(20) DEFAULT NULL,
  `description` varchar(180) DEFAULT NULL,
  `banned_words` varchar(1000) DEFAULT NULL,
  `censore_word` varchar(20) DEFAULT NULL,
  `captcha_length` tinyint(1) NOT NULL DEFAULT '4',
  `facebook` varchar(50) DEFAULT NULL,
  `twitter` varchar(50) DEFAULT NULL,
  `google_plus` varchar(50) DEFAULT NULL,
  `terms_page` varchar(55) DEFAULT NULL,
  `notification` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `change_vote` tinyint(1) DEFAULT NULL,
  `sorting` tinyint(1) DEFAULT NULL,
  `reply_sorting` tinyint(1) DEFAULT NULL,
  `voting` tinyint(1) DEFAULT NULL,
  `ad_thread` tinyint(1) NOT NULL DEFAULT '0',
  `ad_thread_code` varchar(1000) DEFAULT NULL,
  `ad_sidebar` tinyint(1) NOT NULL DEFAULT '0',
  `ad_sidebar_code` varchar(1000) DEFAULT NULL,
  `ad_sidebar2` tinyint(1) NOT NULL DEFAULT '0',
  `ad_sidebar2_code` varchar(1000) DEFAULT NULL,
  `ad_footer` tinyint(1) NOT NULL DEFAULT '0',
  `ad_footer_code` varchar(1000) DEFAULT NULL,
  `apis` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `file_path`, `records_per_page`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mode`, `captcha`, `mailpath`, `style`, `editor`, `sidebar`, `description`, `banned_words`, `censore_word`, `captcha_length`, `facebook`, `twitter`, `google_plus`, `terms_page`, `notification`, `rtl`, `change_vote`, `sorting`, `reply_sorting`, `voting`, `ad_thread`, `ad_thread_code`, `ad_sidebar`, `ad_sidebar_code`, `ad_sidebar2`, `ad_sidebar2_code`, `ad_footer`, `ad_footer_code`, `apis`) VALUES
(1, 'logo.png', 'SimpleForum', '', 10, 'd/m/Y', 'h:i A', 'noreply@forum.tecdiary.my', 'english', '0.4.1', 'default', 'Asia/Kuala_Lumpur', 'mail', 'pop.gmail.com', 'noreply@forum.tecdiary.my', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, 0, 0, NULL, 'blue', 'redactor', 'right', 'Simple forums is the most useful for those who need private forum for their clietns. This item can be used for general purpose forum or bulletin board.', 'fuck, ass', '', 4, 'http://facebook.com/tecdiary', 'http://twitter.com/tecdiary', '', 'terms', 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_star_votes`
--

CREATE TABLE `tec_star_votes` (
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `stars` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_topics`
--

CREATE TABLE `tec_topics` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(180) DEFAULT NULL,
  `category_id` int(11) UNSIGNED DEFAULT NULL,
  `category_slug` varchar(80) DEFAULT NULL,
  `child_category_id` int(11) DEFAULT NULL,
  `child_category_slug` varchar(55) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `protected` tinyint(1) DEFAULT NULL,
  `sticky` tinyint(1) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `flagged` tinyint(1) DEFAULT NULL,
  `slug` varchar(120) DEFAULT NULL,
  `notify` tinyint(1) DEFAULT '1',
  `created_by` int(11) UNSIGNED DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_reply_time` varchar(255) DEFAULT NULL,
  `votes` int(11) NOT NULL DEFAULT '0',
  `up_votes` int(11) NOT NULL DEFAULT '0',
  `down_votes` int(11) NOT NULL DEFAULT '0',
  `stars` decimal(3,2) NOT NULL DEFAULT '0.00',
  `last_reply_by` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_user_badges`
--

CREATE TABLE `tec_user_badges` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_user_logins`
--

CREATE TABLE `tec_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_users`
--

CREATE TABLE `tec_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT '0',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '3',
  `wp_login_token` varchar(40) DEFAULT NULL,
  `last_activity` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `dob`, `phone`, `avatar`, `gender`, `group_id`, `wp_login_token`, `last_activity`) VALUES
(1, 0x3a3a31, 0x7f0000, 'admin', 'e9599f4555077e51455f5d8b5af1eec9cbdadd14', NULL, 'admin@tecdiary.com', NULL, NULL, NULL, '940a20408b0235261e42fba374445c1937f0f224', 1351661704, 1466170419, 1, 'Admin', 'User', '1982-09-12', '012345678', NULL, 'male', 1, NULL, '1466182453');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_votes`
--

CREATE TABLE `tec_votes` (
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tec_api_access`
--
ALTER TABLE `tec_api_access`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_api_keys`
--
ALTER TABLE `tec_api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_api_limits`
--
ALTER TABLE `tec_api_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_api_logs`
--
ALTER TABLE `tec_api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_badges`
--
ALTER TABLE `tec_badges`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_captcha`
--
ALTER TABLE `tec_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indices de la tabla `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`slug`);

--
-- Indices de la tabla `tec_conversations`
--
ALTER TABLE `tec_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indices de la tabla `tec_fields`
--
ALTER TABLE `tec_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `tec_fields_data`
--
ALTER TABLE `tec_fields_data`
  ADD KEY `field_id` (`field_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indices de la tabla `tec_groups`
--
ALTER TABLE `tec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_messages`
--
ALTER TABLE `tec_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `con_id` (`con_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `tec_pages`
--
ALTER TABLE `tec_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_posts`
--
ALTER TABLE `tec_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `topic_id_2` (`topic_id`),
  ADD KEY `id` (`id`,`topic_id`,`topic_slug`,`category_slug`,`created_by`);

--
-- Indices de la tabla `tec_sessions`
--
ALTER TABLE `tec_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `tec_settings`
--
ALTER TABLE `tec_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indices de la tabla `tec_star_votes`
--
ALTER TABLE `tec_star_votes`
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `stars` (`stars`);

--
-- Indices de la tabla `tec_topics`
--
ALTER TABLE `tec_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`category_id`,`category_slug`,`child_category_id`,`child_category_slug`,`slug`,`created_by`);

--
-- Indices de la tabla `tec_user_badges`
--
ALTER TABLE `tec_user_badges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`,`user_id`,`badge_id`);

--
-- Indices de la tabla `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_users`
--
ALTER TABLE `tec_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `id` (`id`,`username`,`group_id`);

--
-- Indices de la tabla `tec_votes`
--
ALTER TABLE `tec_votes`
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `vote` (`vote`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tec_api_access`
--
ALTER TABLE `tec_api_access`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_api_keys`
--
ALTER TABLE `tec_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_api_limits`
--
ALTER TABLE `tec_api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_api_logs`
--
ALTER TABLE `tec_api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_badges`
--
ALTER TABLE `tec_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tec_conversations`
--
ALTER TABLE `tec_conversations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_fields`
--
ALTER TABLE `tec_fields`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_groups`
--
ALTER TABLE `tec_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_messages`
--
ALTER TABLE `tec_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_pages`
--
ALTER TABLE `tec_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tec_posts`
--
ALTER TABLE `tec_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_topics`
--
ALTER TABLE `tec_topics`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_user_badges`
--
ALTER TABLE `tec_user_badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;--
-- Base de datos: `namecus`
--
CREATE DATABASE IF NOT EXISTS `namecus` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `namecus`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_login`
--

CREATE TABLE `tbl_login` (
  `USR_ID` int(10) NOT NULL,
  `USR_NAME` varchar(10) NOT NULL,
  `USR_PASS` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_login`
--

INSERT INTO `tbl_login` (`USR_ID`, `USR_NAME`, `USR_PASS`) VALUES
(1, 'admin', '12345');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`USR_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `USR_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{"angular_direct":"direct","snap_to_grid":"off","relation_lines":"true"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'namecus', '{"quick_or_custom":"quick","what":"sql","db_select[]":["cilfer","forum","namecus","phpmyadmin","test"],"output_format":"sendit","filename_template":"@SERVER@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","codegen_structure_or_data":"data","codegen_format":"0","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","json_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Estructura de la tabla @TABLE@","latex_structure_continued_caption":"Estructura de la tabla @TABLE@ (continÃºa)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Contenido de la tabla @TABLE@","latex_data_continued_caption":"Contenido de la tabla @TABLE@ (continÃºa)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","mediawiki_structure_or_data":"data","mediawiki_caption":"something","mediawiki_headers":"something","ods_null":"NULL","ods_structure_or_data":"data","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","pdf_report_title":"","pdf_structure_or_data":"data","phparray_structure_or_data":"data","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","yaml_structure_or_data":"data","":null,"as_separate_files":null,"csv_removeCRLF":null,"csv_columns":null,"excel_removeCRLF":null,"excel_columns":null,"htmlword_columns":null,"json_pretty_print":null,"ods_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_drop_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"texytext_columns":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"namecus","table":"tbl_login"},{"db":"namecus","table":"login"},{"db":"forum","table":"tec_posts"},{"db":"forum","table":"tec_sessions"},{"db":"forum","table":"tec_settings"},{"db":"forum","table":"tec_star_votes"},{"db":"forum","table":"tec_topics"},{"db":"forum","table":"tec_users"},{"db":"forum","table":"tec_user_badges"},{"db":"forum","table":"tec_user_logins"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

--
-- Volcado de datos para la tabla `pma__relation`
--

INSERT INTO `pma__relation` (`master_db`, `master_table`, `master_field`, `foreign_db`, `foreign_table`, `foreign_field`) VALUES
('cilfer', 'cbbfloorplan_listplans', 'foreign_floor', 'cilfer', 'cbbfloorplan_floorplans', 'floor'),
('cilfer', 'cbbfloorplan_listplans', 'foreign_typeplane', 'cilfer', 'cbbfloorplan_typeplane', 'id');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2016-05-25 18:34:33', '{"lang":"es","collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
