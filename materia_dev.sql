-- phpMyAdmin SQL Dump
-- version 2.10.1
-- http://www.phpmyadmin.net
-- 
-- ホスト: localhost
-- 生成時間: 2012 年 7 月 21 日 16:07
-- サーバのバージョン: 5.1.22
-- PHP のバージョン: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- データベース: `materia_candy`
-- 

-- --------------------------------------------------------

-- 
-- テーブルの構造 `attachments`
-- 

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) NOT NULL DEFAULT '0',
  `container_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disk_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `digest` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `attachments`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `auth_sources`
-- 

DROP TABLE IF EXISTS `auth_sources`;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `host` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `base_dn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_login` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_firstname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_lastname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attr_mail` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `auth_sources`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `boards`
-- 

DROP TABLE IF EXISTS `boards`;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT '1',
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `boards`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `changes`
-- 

DROP TABLE IF EXISTS `changes`;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `from_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_revision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revision` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `changes`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `changesets`
-- 

DROP TABLE IF EXISTS `changesets`;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `committer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `changesets`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `changesets_issues`
-- 

DROP TABLE IF EXISTS `changesets_issues`;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- テーブルのデータをダンプしています `changesets_issues`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `comments`
-- 

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comments` text COLLATE utf8_unicode_ci,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `comments`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `custom_fields`
-- 

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field_format` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `possible_values` text COLLATE utf8_unicode_ci,
  `regexp` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `min_length` int(11) NOT NULL DEFAULT '0',
  `max_length` int(11) NOT NULL DEFAULT '0',
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `custom_fields`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `custom_fields_projects`
-- 

DROP TABLE IF EXISTS `custom_fields_projects`;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- テーブルのデータをダンプしています `custom_fields_projects`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `custom_fields_trackers`
-- 

DROP TABLE IF EXISTS `custom_fields_trackers`;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- テーブルのデータをダンプしています `custom_fields_trackers`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `custom_values`
-- 

DROP TABLE IF EXISTS `custom_values`;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `custom_values`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `documents`
-- 

DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `documents`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `enabled_modules`
-- 

DROP TABLE IF EXISTS `enabled_modules`;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=48 ;

-- 
-- テーブルのデータをダンプしています `enabled_modules`
-- 

INSERT INTO `enabled_modules` (`id`, `project_id`, `name`) VALUES 
(1, 1, 'issue_tracking'),
(2, 1, 'time_tracking'),
(3, 1, 'news'),
(4, 1, 'documents'),
(5, 1, 'files'),
(6, 1, 'wiki'),
(7, 1, 'repository'),
(8, 1, 'boards'),
(32, 3, 'issue_tracking'),
(33, 3, 'files'),
(34, 3, 'wiki'),
(35, 3, 'repository'),
(36, 2, 'issue_tracking'),
(37, 2, 'files'),
(38, 2, 'wiki'),
(39, 2, 'repository'),
(40, 4, 'issue_tracking'),
(41, 4, 'files'),
(42, 4, 'wiki'),
(43, 4, 'repository'),
(44, 5, 'issue_tracking'),
(45, 5, 'files'),
(46, 5, 'wiki'),
(47, 5, 'repository');

-- --------------------------------------------------------

-- 
-- テーブルの構造 `enumerations`
-- 

DROP TABLE IF EXISTS `enumerations`;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opt` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

-- 
-- テーブルのデータをダンプしています `enumerations`
-- 

INSERT INTO `enumerations` (`id`, `opt`, `name`, `position`, `is_default`) VALUES 
(1, 'DCAT', 'ユーザ文書', 1, 0),
(2, 'DCAT', '技術文書', 2, 0),
(3, 'IPRI', '低め', 1, 0),
(4, 'IPRI', '通常', 2, 1),
(5, 'IPRI', '高め', 3, 0),
(6, 'IPRI', '急いで', 4, 0),
(7, 'IPRI', '今すぐ', 5, 0),
(8, 'ACTI', '設計作業', 1, 0),
(9, 'ACTI', '開発作業', 2, 0);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `issues`
-- 

DROP TABLE IF EXISTS `issues`;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '0',
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL DEFAULT '0',
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=35 ;

-- 
-- テーブルのデータをダンプしています `issues`
-- 

INSERT INTO `issues` (`id`, `tracker_id`, `project_id`, `subject`, `description`, `due_date`, `category_id`, `status_id`, `assigned_to_id`, `priority_id`, `fixed_version_id`, `author_id`, `lock_version`, `created_on`, `updated_on`, `start_date`, `done_ratio`, `estimated_hours`) VALUES 
(1, 1, 1, 'Sample Ticket', 'Hello candycane users.', NULL, NULL, 1, NULL, 3, NULL, 3, 0, '2009-03-14 10:32:00', '2012-05-12 18:42:54', '2009-03-14', 0, 0),
(2, 1, 2, 'リクエストURLに期間を指定するとエラーになる。', '* 既に終了、又は開催日が過ぎたイベントのみの場合\r\n* ブラウザからURLを直接叩いた場合は、結果が取れる\r\n', NULL, NULL, 1, 4, 4, 4, 4, 0, '2012-04-08 03:44:19', '2012-04-08 03:44:19', '2012-04-08', 0, 0),
(3, 2, 2, 'クッキーが保存されているなら、その情報をもとにしてボタンを押さずに結果が表示されるようにしてみたい。', '', NULL, NULL, 1, 4, 4, 4, 4, 0, '2012-04-08 03:46:29', '2012-04-08 03:46:29', '2012-04-08', 0, 0),
(4, 2, 2, 'クッキー削除、セッション削除時、画面変遷が必要ないAjax仕様にする', '', NULL, NULL, 1, 4, 4, 4, 4, 0, '2012-04-08 03:47:12', '2012-04-08 03:47:12', '2012-04-08', 0, 0),
(5, 2, 2, '気になるリスト に保存した際、画面変遷がない仕様にする', '', NULL, NULL, 1, 4, 4, 4, 4, 0, '2012-04-08 03:47:42', '2012-04-08 03:47:42', '2012-04-08', 0, 0),
(6, 4, 2, '過去の検索ワードを保存して、何らかの仕組を作ってみたい', '取得するのは検索語だけ。', NULL, NULL, 1, 4, 4, 4, 4, 0, '2012-04-08 03:48:51', '2012-04-08 03:48:51', '2012-04-08', 0, 0),
(7, 4, 3, 'view の拡張子を ctp から php に変更する', 'baserCMS 2.0 への対応', NULL, NULL, 5, 4, 4, 2, 4, 0, '2012-04-22 04:19:31', '2012-04-22 04:37:04', '2012-04-22', 0, 0),
(8, 4, 3, '「高さ」の設定項目を追加する', 'アップデートスクリプトでの対応', NULL, NULL, 5, 4, 4, 2, 4, 0, '2012-04-22 04:21:06', '2012-04-22 04:37:33', '2012-04-22', 0, 0),
(9, 4, 3, '設定変更中の状態をリアルタイムで確認できるようにする', '', NULL, 1, 5, 4, 4, 5, 4, 0, '2012-04-22 08:20:09', '2012-07-01 00:57:48', '2012-04-22', 0, 0),
(10, 4, 3, 'baserCMSのHelper名変更に対応する', '', NULL, 1, 5, 4, 4, 2, 4, 0, '2012-04-26 03:09:12', '2012-04-29 00:06:47', '2012-04-26', 0, 0),
(11, 4, 2, 'baserCMS2.0に入れ替える', '', NULL, NULL, 1, 4, 4, NULL, 4, 0, '2012-04-26 03:10:21', '2012-04-26 03:10:21', '2012-04-26', 0, 0),
(12, 4, 3, '初期フォーカスを追加する', '', NULL, 1, 5, 4, 4, 2, 4, 0, '2012-04-29 00:09:33', '2012-04-29 00:11:19', '2012-04-29', 0, 0),
(13, 4, 4, 'Version 1.0.0 リリース', '', NULL, NULL, 5, 4, 4, 6, 4, 0, '2012-05-11 23:25:22', '2012-05-12 09:00:57', '2012-05-11', 0, 0),
(14, 4, 4, 'ヘルパー利用時は設定値を上書きできるオプションを付ける', '<pre>\r\n		$options = array_merge(\r\n			array(''permaLink'' => true), $options\r\n		);\r\n</pre>', NULL, NULL, 2, 4, 7, 7, 4, 0, '2012-05-12 02:03:47', '2012-05-12 09:30:02', '2012-05-12', 0, 0),
(15, 4, 4, 'HTML5版とXFBML版を選択できるようにする', '', NULL, NULL, 1, NULL, 4, NULL, 4, 0, '2012-05-12 02:05:05', '2012-05-12 02:05:05', '2012-05-12', 0, 0),
(16, 4, 4, '設定画面で変更した値が、「現在の表示状態」欄にリアルタイムで反映されるようにする', '', NULL, NULL, 1, NULL, 4, NULL, 4, 0, '2012-05-12 02:33:36', '2012-05-12 02:33:36', '2012-05-12', 0, 0),
(17, 4, 4, '「「いいね！」と言っている友達はまだいません。」が表示・非表示設定ができるかどうか調査する', '', NULL, NULL, 1, NULL, 4, NULL, 4, 0, '2012-05-12 09:00:26', '2012-05-12 09:00:26', '2012-05-12', 0, 0),
(18, 4, 3, 'help用のポップアップテキストが、正しい内容を指していないものがある', '1行に2つ以上あると、1つ目のポップアップの内容が2つ目にも適用されている。。。', NULL, 1, 5, 4, 5, 5, 4, 0, '2012-05-12 17:53:06', '2012-05-13 04:22:25', '2012-05-12', 0, 0),
(19, 1, 1, '問題点：通常', '', NULL, NULL, 1, NULL, 4, NULL, 4, 0, '2012-05-12 18:40:50', '2012-05-12 18:40:50', '2012-05-12', 0, 0),
(20, 1, 1, '問題点：高め', '', NULL, NULL, 1, NULL, 5, NULL, 4, 0, '2012-05-12 18:41:08', '2012-05-12 18:41:08', '2012-05-12', 0, 0),
(21, 1, 1, '問題点：急いで', '', NULL, NULL, 1, NULL, 6, NULL, 4, 0, '2012-05-12 18:41:24', '2012-05-12 18:41:24', '2012-05-12', 0, 0),
(22, 1, 1, '問題点：今すぐ', '', NULL, NULL, 1, NULL, 7, NULL, 4, 0, '2012-05-12 18:41:45', '2012-05-12 18:41:45', '2012-05-12', 0, 0),
(23, 4, 1, 'TODO：通常', '', NULL, NULL, 1, NULL, 4, NULL, 4, 0, '2012-05-12 18:43:59', '2012-05-12 18:43:59', '2012-05-12', 0, 0),
(24, 4, 1, 'TODO：低め', '', NULL, NULL, 1, NULL, 3, NULL, 4, 0, '2012-05-12 18:44:15', '2012-05-12 18:44:15', '2012-05-12', 0, 0),
(25, 4, 1, 'TODO：高め', '', NULL, NULL, 1, NULL, 5, NULL, 4, 0, '2012-05-12 18:44:31', '2012-05-12 18:44:31', '2012-05-12', 0, 0),
(26, 4, 1, 'TODO：急いで', '', NULL, NULL, 1, NULL, 6, NULL, 4, 0, '2012-05-12 18:44:46', '2012-05-12 18:44:46', '2012-05-12', 0, 0),
(27, 4, 1, 'TODO：今すぐ', '', NULL, NULL, 1, NULL, 7, NULL, 4, 0, '2012-05-12 18:45:06', '2012-05-12 18:45:06', '2012-05-12', 0, 0),
(28, 4, 5, '設定画面を作成する', '', NULL, 3, 2, 4, 4, 8, 4, 0, '2012-05-20 23:00:03', '2012-05-20 23:01:55', '2012-05-20', 0, 0),
(29, 4, 5, 'ヘルパーによる表示機能', '独自ヘルパーを用いてコメント表示を行う。', NULL, NULL, 2, 4, 4, 8, 4, 0, '2012-05-20 23:03:14', '2012-05-20 23:03:14', '2012-05-20', 0, 0),
(30, 4, 5, 'ページのコンテンツ下部にコメント欄を表示する', '', NULL, NULL, 1, NULL, 4, NULL, 4, 0, '2012-05-20 23:04:02', '2012-05-20 23:04:02', '2012-05-20', 0, 0),
(31, 4, 5, 'ブログ記事コンテンツのフッター部分にコメント欄を表示する', '', NULL, NULL, 1, NULL, 4, NULL, 4, 0, '2012-05-20 23:04:48', '2012-05-20 23:04:48', '2012-05-20', 0, 0),
(32, 4, 3, 'Version 2.1.0 をリリース', '', '2012-07-01', NULL, 5, 4, 7, 5, 4, 0, '2012-06-30 23:21:47', '2012-07-01 00:59:22', '2012-06-30', 0, 0),
(33, 4, 5, '設定画面で変更した値が、「現在の表示状態」欄にリアルタイムで反映されるようにする', '', NULL, NULL, 1, NULL, 4, NULL, 4, 0, '2012-07-01 01:11:15', '2012-07-01 01:11:15', '2012-07-01', 0, 0),
(34, 4, 3, 'baser本体のプラグイン作成仕様変更に対応する', '■ baserCMS 2.0.3 のプラグイン作成仕様変更に対応する\r\n▼ BaserPluginAppController の継承\r\n　→ プラグイン・モデル定義削除\r\n▼ BaserPluginAppModel の継承\r\n　→ プラグイン用DB設定プロパティの削除\r\n\r\nhttp://basercms.net/release/2_0_3', NULL, NULL, 1, 4, 4, 9, 4, 0, NULL, '2012-07-21 15:34:52', '2012-07-21', 0, 0);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `issue_categories`
-- 

DROP TABLE IF EXISTS `issue_categories`;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- 
-- テーブルのデータをダンプしています `issue_categories`
-- 

INSERT INTO `issue_categories` (`id`, `project_id`, `name`, `assigned_to_id`) VALUES 
(1, 3, '管理側', NULL),
(2, 4, '管理側', NULL),
(3, 5, '管理側', NULL);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `issue_relations`
-- 

DROP TABLE IF EXISTS `issue_relations`;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `issue_relations`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `issue_statuses`
-- 

DROP TABLE IF EXISTS `issue_statuses`;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

-- 
-- テーブルのデータをダンプしています `issue_statuses`
-- 

INSERT INTO `issue_statuses` (`id`, `name`, `is_closed`, `is_default`, `position`) VALUES 
(1, '新規', 0, 1, 1),
(2, '担当', 0, 0, 2),
(3, '解決', 0, 0, 3),
(4, 'フィードバック', 0, 0, 4),
(5, '終了', 1, 0, 5),
(6, '却下', 1, 0, 6);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `journals`
-- 

DROP TABLE IF EXISTS `journals`;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

-- 
-- テーブルのデータをダンプしています `journals`
-- 

INSERT INTO `journals` (`id`, `journalized_id`, `journalized_type`, `user_id`, `notes`, `created_on`) VALUES 
(1, 7, 'Issue', 4, '変更対応完了！', '2012-04-22 04:37:04'),
(2, 8, 'Issue', 4, '追加完了！', '2012-04-22 04:37:33'),
(3, 10, 'Issue', 4, '対応完了！', '2012-04-29 00:06:47'),
(4, 12, 'Issue', 4, '対応完了！', '2012-04-29 00:11:19'),
(5, 13, 'Issue', 4, '', '2012-05-12 09:00:57'),
(6, 14, 'Issue', 4, '', '2012-05-12 09:30:02'),
(7, 1, 'Issue', 4, '', '2012-05-12 18:42:54'),
(8, 18, 'Issue', 4, '項目のレイアウトを変更し、1行につき1項目とすることで解消。', '2012-05-13 04:22:25'),
(9, 28, 'Issue', 4, '', '2012-05-20 23:01:55'),
(10, 9, 'Issue', 4, '以下の内容にて完了。\r\nhttps://github.com/materializing/fb_likebox/commit/fa8dd0607c9744d9d746cb907f4e98769e181e26\r\n', '2012-07-01 00:57:48'),
(11, 32, 'Issue', 4, 'https://github.com/materializing/fb_likebox/commit/1259ce1ae13e8e85bb60969cb5ea69a90c6a397e\r\n', '2012-07-01 00:59:22'),
(12, 34, 'Issue', 4, '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- テーブルの構造 `journal_details`
-- 

DROP TABLE IF EXISTS `journal_details`;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `prop_key` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `old_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

-- 
-- テーブルのデータをダンプしています `journal_details`
-- 

INSERT INTO `journal_details` (`id`, `journal_id`, `property`, `prop_key`, `old_value`, `value`) VALUES 
(1, 1, 'attr', 'status_id', '1', '5'),
(2, 2, 'attr', 'status_id', '1', '5'),
(3, 3, 'attr', 'status_id', '1', '5'),
(4, 4, 'attr', 'status_id', '1', '5'),
(5, 4, 'attr', 'assigned_to_id', NULL, '4'),
(6, 5, 'attr', 'status_id', '2', '5'),
(7, 6, 'attr', 'status_id', '1', '2'),
(8, 6, 'attr', 'priority_id', '4', '7'),
(9, 6, 'attr', 'assigned_to_id', NULL, '4'),
(10, 6, 'attr', 'fixed_version_id', NULL, '7'),
(11, 7, 'attr', 'priority_id', '4', '3'),
(12, 7, 'attr', 'estimated_hours', NULL, '0'),
(13, 8, 'attr', 'status_id', '2', '5'),
(14, 9, 'attr', 'subject', '基本動作作成', '設定画面を作成する'),
(15, 9, 'attr', 'category_id', NULL, '3'),
(16, 10, 'attr', 'status_id', '1', '5'),
(17, 11, 'attr', 'status_id', '2', '5'),
(18, 12, 'attr', 'fixed_version_id', NULL, '9');

-- --------------------------------------------------------

-- 
-- テーブルの構造 `members`
-- 

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

-- 
-- テーブルのデータをダンプしています `members`
-- 

INSERT INTO `members` (`id`, `user_id`, `project_id`, `role_id`, `created_on`, `mail_notification`) VALUES 
(1, 4, 1, 3, '2012-03-11 19:35:45', 0),
(2, 4, 2, 3, '2012-04-08 01:02:12', 0),
(3, 4, 3, 3, '2012-04-08 01:30:28', 0),
(4, 5, 1, 5, '2012-04-08 05:02:47', 0),
(5, 4, 4, 3, '2012-05-11 22:58:31', 0),
(6, 4, 5, 3, '2012-05-12 17:29:50', 0);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `messages`
-- 

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8_unicode_ci,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `messages`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `news`
-- 

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- 
-- テーブルのデータをダンプしています `news`
-- 

INSERT INTO `news` (`id`, `project_id`, `title`, `summary`, `description`, `author_id`, `created_on`, `comments_count`) VALUES 
(1, 1, 'Sample News', 'Working fine.', 'Worked\r\n*YEAH!!*', 3, '2009-03-20 23:25:45', 0);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `plugin_schema_info`
-- 

DROP TABLE IF EXISTS `plugin_schema_info`;
CREATE TABLE `plugin_schema_info` (
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- テーブルのデータをダンプしています `plugin_schema_info`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `projects`
-- 

DROP TABLE IF EXISTS `projects`;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  `homepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `projects_count` int(11) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

-- 
-- テーブルのデータをダンプしています `projects`
-- 

INSERT INTO `projects` (`id`, `name`, `description`, `homepage`, `is_public`, `parent_id`, `projects_count`, `created_on`, `updated_on`, `identifier`, `status`) VALUES 
(1, 'Sample Project', 'Candycane rocks!', '', 0, NULL, 0, '2009-03-04 23:09:49', '2009-03-04 23:09:49', 'sampleproject', 1),
(2, '気になるATND検索', 'ATNDに登録してあるイベントを検索出来ます。', 'http://kininaruatnd.materializing.net/', 1, NULL, 0, '2012-04-08 00:58:49', NULL, 'kininaruatnd', 1),
(3, 'facebook LikeBoxプラグイン', 'facebook LikeBoxを表示するbaserCMS用プラグイン。', 'https://github.com/materializing/fb_likebox', 1, NULL, 0, '2012-04-08 01:28:31', NULL, 'fb_likebox', 1),
(4, 'facebook LikeButtonプラグイン', 'facebook LikeButtonを表示するbaserCMS用プラグイン。', 'https://github.com/materializing/fb_likebutton', 1, NULL, 0, '2012-05-11 22:58:04', NULL, 'fb_likebutton', 1),
(5, 'facebook Commentsプラグイン', 'facebook Commentsを表示するbaserCMS用プラグイン。', 'https://github.com/materializing/fb_comments', 1, NULL, 0, '2012-05-12 17:29:28', NULL, 'fb_comments', 1);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `projects_trackers`
-- 

DROP TABLE IF EXISTS `projects_trackers`;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- テーブルのデータをダンプしています `projects_trackers`
-- 

INSERT INTO `projects_trackers` (`project_id`, `tracker_id`) VALUES 
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `queries`
-- 

DROP TABLE IF EXISTS `queries`;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filters` text COLLATE utf8_unicode_ci,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `column_names` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `queries`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `repositories`
-- 

DROP TABLE IF EXISTS `repositories`;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `root_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `repositories`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `roles`
-- 

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

-- 
-- テーブルのデータをダンプしています `roles`
-- 

INSERT INTO `roles` (`id`, `name`, `position`, `assignable`, `builtin`, `permissions`) VALUES 
(1, 'Non member', 1, 1, 1, '--- \n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :add_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n'),
(2, 'Anonymous', 2, 1, 2, '--- \n- :view_gantt\n- :view_calendar\n- :view_time_entries\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :view_files\n- :browse_repository\n- :view_changesets\n'),
(3, '管理者', 3, 1, 0, '--- \n- :edit_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :manage_categories\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :move_issues\n- :delete_issues\n- :manage_public_queries\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :view_issue_watchers\n- :add_issue_watchers\n- :log_time\n- :view_time_entries\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_news\n- :comment_news\n- :manage_documents\n- :view_documents\n- :manage_files\n- :view_files\n- :manage_wiki\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages_attachments\n- :protect_wiki_pages\n- :manage_repository\n- :browse_repository\n- :view_changesets\n- :commit_access\n- :manage_boards\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n'),
(4, '開発者', 4, 1, 0, '--- \n- :manage_versions\n- :manage_categories\n- :add_issues\n- :edit_issues\n- :manage_issue_relations\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :edit_wiki_pages\n- :delete_wiki_pages\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :manage_files\n- :browse_repository\n- :view_changesets\n- :commit_access\n'),
(5, '報告者', 5, 1, 0, '--- \n- :add_issues\n- :add_issue_notes\n- :save_queries\n- :view_gantt\n- :view_calendar\n- :log_time\n- :view_time_entries\n- :comment_news\n- :view_documents\n- :view_wiki_pages\n- :view_wiki_edits\n- :add_messages\n- :edit_own_messages\n- :view_files\n- :browse_repository\n- :view_changesets\n');

-- --------------------------------------------------------

-- 
-- テーブルの構造 `schema_migrations`
-- 

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- テーブルのデータをダンプしています `schema_migrations`
-- 

INSERT INTO `schema_migrations` (`version`) VALUES 
('1'),
('10'),
('100'),
('101'),
('11'),
('12'),
('13'),
('14'),
('15'),
('16'),
('17'),
('18'),
('19'),
('2'),
('20'),
('21'),
('22'),
('23'),
('24'),
('25'),
('26'),
('27'),
('28'),
('29'),
('3'),
('30'),
('31'),
('32'),
('33'),
('34'),
('35'),
('36'),
('37'),
('38'),
('39'),
('4'),
('40'),
('41'),
('42'),
('43'),
('44'),
('45'),
('46'),
('47'),
('48'),
('49'),
('5'),
('50'),
('51'),
('52'),
('53'),
('54'),
('55'),
('56'),
('57'),
('58'),
('59'),
('6'),
('60'),
('61'),
('62'),
('63'),
('64'),
('65'),
('66'),
('67'),
('68'),
('69'),
('7'),
('70'),
('71'),
('72'),
('73'),
('74'),
('75'),
('76'),
('77'),
('78'),
('79'),
('8'),
('80'),
('81'),
('82'),
('83'),
('84'),
('85'),
('86'),
('87'),
('88'),
('89'),
('9'),
('90'),
('91'),
('92'),
('93'),
('94'),
('95'),
('96'),
('97'),
('98'),
('99');

-- --------------------------------------------------------

-- 
-- テーブルの構造 `settings`
-- 

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` text COLLATE utf8_unicode_ci,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

-- 
-- テーブルのデータをダンプしています `settings`
-- 

INSERT INTO `settings` (`id`, `name`, `value`, `updated_on`) VALUES 
(1, 'app_title', 'project.materializing.net', '2012-03-11 22:18:19'),
(2, 'welcome_text', 'materializing.net のプロジェクト管理。\r\nCandyCaneにて稼働。', '2012-03-11 22:18:19'),
(3, 'ui_theme', '', '2012-03-11 22:18:19'),
(4, 'default_language', 'jpn', '2012-03-11 22:18:19'),
(5, 'date_format', '0', '2012-03-11 22:18:19'),
(6, 'time_format', '0', '2012-03-11 22:18:19'),
(7, 'user_format', 'firstname_lastname', '2012-03-11 22:18:19'),
(8, 'attachment_max_size', '5120', '2012-03-11 22:18:19'),
(9, 'per_page_options', '25,50,100', '2012-03-11 22:18:19'),
(10, 'activity_days_default', '30', '2012-03-11 22:18:19'),
(11, 'host_name', 'project.materializing.net', '2012-03-11 22:18:19'),
(12, 'protocol', 'http', '2012-03-11 22:18:19'),
(13, 'text_formatting', '0', '2012-03-11 22:18:19'),
(14, 'wiki_compression', '0', '2012-03-11 22:18:19'),
(15, 'feeds_limit', '15', '2012-03-11 22:18:19'),
(16, 'diff_max_lines_displayed', '1500', '2012-03-11 22:18:19'),
(17, 'gravatar_enabled', '1', '2012-03-11 22:18:19'),
(18, 'login_required', '0', '2012-04-22 07:39:47'),
(19, 'autologin', '30', '2012-04-22 07:39:47'),
(20, 'self_registration', '2', '2012-04-22 07:39:47'),
(21, 'lost_password', '1', '2012-04-22 07:39:47'),
(22, 'default_projects_public', '0', '2012-03-11 20:24:27'),
(23, 'sequential_project_identifiers', '0', '2012-03-11 20:24:27'),
(24, 'cross_project_issue_relations', '1', '2012-04-08 05:06:42'),
(25, 'display_subprojects_issues', '1', '2012-04-08 05:06:42'),
(26, 'issues_export_limit', '500', '2012-04-08 05:06:42'),
(27, 'issue_list_default_columns', '---\n- tracker\n- status\n- priority\n- subject\n- assigned_to\n- updated_on\n- category\n- fixed_version\n- due_date\n', '2012-04-08 05:06:42'),
(28, 'mail_from', 'info@materializing.net', '2012-03-11 20:29:06'),
(29, 'bcc_recipients', '0', '2012-03-11 20:29:06'),
(30, 'plain_text_mail', '0', '2012-03-11 20:29:06'),
(31, 'emails_footer', '-- \r\nBy materializing.net of Projects\r\nhttp://www.materializing.net/\r\n\r\n通知設定の変更は以下よりどうぞ。\r\nhttp://project.materializing.net/my/account\r\n', '2012-03-11 20:29:06');

-- --------------------------------------------------------

-- 
-- テーブルの構造 `time_entries`
-- 

DROP TABLE IF EXISTS `time_entries`;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `time_entries`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `tokens`
-- 

DROP TABLE IF EXISTS `tokens`;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- 
-- テーブルのデータをダンプしています `tokens`
-- 

INSERT INTO `tokens` (`id`, `user_id`, `action`, `value`, `created_on`) VALUES 
(1, 1, 'feeds', 'D7ukdhHJXK7MTwDELqToVcTHPczo4rbCsLTim0pv', '2009-03-04 23:03:11'),
(2, 1, 'feeds', 'rV5I24UQkA7AImh0FOYM84eNSpDbsOpTFCRcMort', '2009-03-04 23:03:11'),
(3, 3, 'feeds', 'Zi1s5C1vyA8TAzMXm2hAAIOD8CveWiT3LSI763Ie', '2009-03-04 23:08:46'),
(4, 3, 'feeds', 'HxAUNOsdgv1y3m8Y0ilEOpW6P3sQaydgCxcmsHx8', '2009-03-04 23:08:46');

-- --------------------------------------------------------

-- 
-- テーブルの構造 `trackers`
-- 

DROP TABLE IF EXISTS `trackers`;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- 
-- テーブルのデータをダンプしています `trackers`
-- 

INSERT INTO `trackers` (`id`, `name`, `is_in_chlog`, `position`, `is_in_roadmap`) VALUES 
(1, '問題点', 1, 2, 0),
(2, '課題', 1, 3, 1),
(3, 'サポート', 0, 4, 0),
(4, 'TODO', 0, 1, 1);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `users`
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hashed_password` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mail` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mail_notification` tinyint(1) NOT NULL DEFAULT '1',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

-- 
-- テーブルのデータをダンプしています `users`
-- 

INSERT INTO `users` (`id`, `login`, `hashed_password`, `firstname`, `lastname`, `mail`, `mail_notification`, `admin`, `status`, `last_login_on`, `language`, `auth_source_id`, `created_on`, `updated_on`, `type`) VALUES 
(1, 'admin', '91f280f9968bb245090ae1642919bae7a8778003', 'Redmine', 'Admin', 'info@materializing.net', 1, 1, 1, '2012-03-11 22:19:40', 'jpn', NULL, '2009-03-04 23:00:57', '2012-03-11 22:19:40', 'User'),
(2, '', '', '', 'Anonymous', '', 0, 0, 0, NULL, '', NULL, '2009-03-04 23:02:30', '2009-03-04 23:02:30', 'AnonymousUser'),
(3, 'testuser', 'AWESOME', 'yusuke', 'ando', 'test@example.com', 0, 1, 3, '2009-03-20 23:24:42', 'jpn', NULL, '2009-03-04 23:06:32', '2012-03-11 14:07:33', NULL),
(4, 'arata', '91f280f9968bb245090ae1642919bae7a8778003', 'arata', '　', 'contact@materializing.net', 1, 1, 1, '2012-07-21 15:01:29', 'jpn', NULL, NULL, '2012-07-21 15:01:29', NULL),
(5, 'demo', '5863d9e4cbdf522eaa62e0747fceb1c5b249ba13', 'DEMO', 'USER', 'demo@materializing.net', 0, 0, 1, '2012-04-08 05:02:03', 'jpn', NULL, NULL, '2012-04-08 05:02:22', NULL);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `user_preferences`
-- 

DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text COLLATE utf8_unicode_ci,
  `hide_mail` tinyint(1) DEFAULT '0',
  `time_zone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

-- 
-- テーブルのデータをダンプしています `user_preferences`
-- 

INSERT INTO `user_preferences` (`id`, `user_id`, `others`, `hide_mail`, `time_zone`) VALUES 
(1, 1, '---\nno_self_notified: false\ncomments_sorting: asc\n', 0, NULL),
(2, 2, '--- {}\n\n', 0, NULL),
(3, 3, '--- {}\n\n', 0, NULL),
(4, 4, '---\nno_self_notified: true\ncomments_sorting: asc\n', 1, NULL),
(5, 5, '---\nno_self_notified: true\ncomments_sorting: asc\n', 1, NULL);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `versions`
-- 

DROP TABLE IF EXISTS `versions`;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

-- 
-- テーブルのデータをダンプしています `versions`
-- 

INSERT INTO `versions` (`id`, `project_id`, `name`, `description`, `effective_date`, `created_on`, `updated_on`, `wiki_page_title`) VALUES 
(1, 3, '1.1.1', '', '2011-11-07', '2012-04-08 01:30:13', NULL, ''),
(2, 3, '2.0.0', 'baserCMS 2.0 に対応', '2012-05-31', NULL, NULL, ''),
(3, 2, '1.0 stable', '', '2011-02-06', '2012-04-08 03:37:58', NULL, ''),
(4, 2, '2.0 stable', 'baserCMS にて実装', '2011-11-05', NULL, NULL, ''),
(5, 3, '2.1.0', '', '2012-07-01', NULL, NULL, ''),
(6, 4, '1.0.0', 'baserCMS 2.0 対応', '2012-05-11', '2012-05-11 22:59:24', NULL, ''),
(7, 4, '1.1.0', '', '2012-05-12', NULL, NULL, ''),
(8, 5, '1.0.0', 'baserCMS 2.0 対応版', '2012-05-12', '2012-05-12 17:30:28', NULL, ''),
(9, 3, '2.1.1', '', NULL, NULL, NULL, '');

-- --------------------------------------------------------

-- 
-- テーブルの構造 `watchers`
-- 

DROP TABLE IF EXISTS `watchers`;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `watchers`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `wikis`
-- 

DROP TABLE IF EXISTS `wikis`;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- 
-- テーブルのデータをダンプしています `wikis`
-- 

INSERT INTO `wikis` (`id`, `project_id`, `start_page`, `status`) VALUES 
(1, 2, 'home', 1),
(2, 3, 'home', 1),
(3, 4, 'home', 1),
(4, 5, 'home', 1);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `wiki_contents`
-- 

DROP TABLE IF EXISTS `wiki_contents`;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- 
-- テーブルのデータをダンプしています `wiki_contents`
-- 

INSERT INTO `wiki_contents` (`id`, `page_id`, `author_id`, `text`, `comments`, `updated_on`, `version`) VALUES 
(1, 1, NULL, 'h1. 概要\r\n\r\n* ATNDに登録してあるイベントを検索出来ます。\r\n* 利用した検索ワードはクッキーに保存され、次アクセス時等、一旦ページを離れた場合でも、フォームに自動入力されます。\r\n* 気になったイベントは保存する事が出来ます。保存の仕組にクッキーを利用してます。\r\n* 基本的にiPhone(スマートフォン)用\r\n* baserCMS Version:1.6系\r\n\r\nh2. ソースコード\r\n\r\n* "https://github.com/materializing/KininaruATND":https://github.com/materializing/KininaruATND\r\n\r\nh2. 関連URL\r\n\r\n* "http://www.materializing.net/archives/2011/11/05013843.php":http://www.materializing.net/archives/2011/11/05013843.php\r\n* "MA7 サイト内、作品紹介ページ":https://ma7.mashupaward.jp/works/231?locale=ja', '', '2012-04-08 03:50:05', 4),
(2, 2, NULL, 'h1. 概要\r\n\r\nh2. ソースコード\r\n\r\n* "https://github.com/materializing/fb_likebox":https://github.com/materializing/fb_likebox\r\n\r\n\r\nh2. 使い方とか\r\n\r\n* "https://github.com/materializing/fb_likebox/wiki":https://github.com/materializing/fb_likebox/wiki\r\n\r\n\r\nh2. 関連URL\r\n\r\n* "http://www.materializing.net/archives/2011/05/28164038.php":http://www.materializing.net/archives/2011/05/28164038.php\r\n', '', '2012-05-12 08:54:31', 4),
(3, 3, NULL, 'h1. 概要\r\n\r\nh2. ソースコード\r\n\r\n* "https://github.com/materializing/fb_likebutton":https://github.com/materializing/fb_likebutton\r\n\r\n\r\nh2. 使い方とか\r\n\r\n* "https://github.com/materializing/fb_likebutton/wiki":https://github.com/materializing/fb_likebutton/wiki\r\n\r\n\r\nh2. 関連URL\r\n\r\n* "http://www.materializing.net/archives/2012/05/12084224.php":http://www.materializing.net/archives/2012/05/12084224.php\r\n', '', '2012-05-12 08:54:39', 2);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `wiki_content_versions`
-- 

DROP TABLE IF EXISTS `wiki_content_versions`;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` blob,
  `compression` varchar(6) COLLATE utf8_unicode_ci DEFAULT '',
  `comments` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- 
-- テーブルのデータをダンプしています `wiki_content_versions`
-- 

INSERT INTO `wiki_content_versions` (`id`, `wiki_content_id`, `page_id`, `author_id`, `data`, `compression`, `comments`, `updated_on`, `version`) VALUES 
(1, 1, 1, NULL, 0x68312e20e6a682e8a6810d0a0d0a2a2041544e44e381abe799bbe98cb2e38197e381a6e38182e3828be382a4e38399e383b3e38388e38292e6a49ce7b4a2e587bae69da5e381bee38199e380820d0a2a20e588a9e794a8e38197e3819fe6a49ce7b4a2e383afe383bce38389e381afe382afe38383e382ade383bce381abe4bf9de5ad98e38195e3828ce38081e6aca1e382a2e382afe382bbe382b9e69982e7ad89e38081e4b880e697a6e3839ae383bce382b8e38292e99ba2e3828ce3819fe5a0b4e59088e381a7e38282e38081e38395e382a9e383bce383a0e381abe887aae58b95e585a5e58a9be38195e3828ce381bee38199e380820d0a2a20e6b097e381abe381aae381a3e3819fe382a4e38399e383b3e38388e381afe4bf9de5ad98e38199e3828be4ba8be3818ce587bae69da5e381bee38199e38082e4bf9de5ad98e381aee4bb95e7b584e381abe382afe38383e382ade383bce38292e588a9e794a8e38197e381a6e381bee38199e380820d0a2a20e59fbae69cace79a84e381ab6950686f6e6528e382b9e3839ee383bce38388e38395e382a9e383b329e794a80d0a0d0a68322e20e996a2e980a355524c0d0a0d0a2a2068747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f4b696e696e61727541544e440d0a2a20687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f31312f30353031333834332e7068700d0a, '', '', '2012-04-08 01:16:39', 1),
(2, 1, 1, NULL, 0x68312e20e6a682e8a6810d0a0d0a2a2041544e44e381abe799bbe98cb2e38197e381a6e38182e3828be382a4e38399e383b3e38388e38292e6a49ce7b4a2e587bae69da5e381bee38199e380820d0a2a20e588a9e794a8e38197e3819fe6a49ce7b4a2e383afe383bce38389e381afe382afe38383e382ade383bce381abe4bf9de5ad98e38195e3828ce38081e6aca1e382a2e382afe382bbe382b9e69982e7ad89e38081e4b880e697a6e3839ae383bce382b8e38292e99ba2e3828ce3819fe5a0b4e59088e381a7e38282e38081e38395e382a9e383bce383a0e381abe887aae58b95e585a5e58a9be38195e3828ce381bee38199e380820d0a2a20e6b097e381abe381aae381a3e3819fe382a4e38399e383b3e38388e381afe4bf9de5ad98e38199e3828be4ba8be3818ce587bae69da5e381bee38199e38082e4bf9de5ad98e381aee4bb95e7b584e381abe382afe38383e382ade383bce38292e588a9e794a8e38197e381a6e381bee38199e380820d0a2a20e59fbae69cace79a84e381ab6950686f6e6528e382b9e3839ee383bce38388e38395e382a9e383b329e794a80d0a0d0a68322e20e996a2e980a355524c0d0a0d0a2a202268747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f4b696e696e61727541544e44223a68747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f4b696e696e61727541544e440d0a2a2022687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f31312f30353031333834332e706870223a687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f31312f30353031333834332e7068700d0a, '', '', '2012-04-08 01:17:42', 2),
(3, 2, 2, NULL, 0x68312e20e6a682e8a6810d0a0d0a6261736572434d53e381aee7aea1e79086e794bbe99da2e4b88ae3818be38289e3808146616365626f6f6b204c696b65426f78e381aee8a1a8e7a4bae78ab6e6858be38292e5a489e69bb4e383bbe7a2bae8aa8de38197e38081e382a6e382a3e382b8e382a7e38383e38388e381a8e38197e381a6e588a9e794a8e38199e3828be4ba8be3818ce587bae69da5e3828be38397e383a9e382b0e382a4e383b3e381a7e38199e380820d0a6261736572434d53e794a8e38397e383a9e382b0e382a4e383b3e380820d0a0d0a68322e20e382bde383bce382b9e382b3e383bce383890d0a0d0a2a202268747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65626f78223a68747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65626f780d0a0d0a68322e20e996a2e980a355524c0d0a0d0a2a2022687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f30352f32383136343033382e706870223a687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f30352f32383136343033382e7068700d0a, '', '', '2012-04-08 01:37:17', 1),
(4, 1, 1, NULL, 0x68312e20e6a682e8a6810d0a0d0a2a2041544e44e381abe799bbe98cb2e38197e381a6e38182e3828be382a4e38399e383b3e38388e38292e6a49ce7b4a2e587bae69da5e381bee38199e380820d0a2a20e588a9e794a8e38197e3819fe6a49ce7b4a2e383afe383bce38389e381afe382afe38383e382ade383bce381abe4bf9de5ad98e38195e3828ce38081e6aca1e382a2e382afe382bbe382b9e69982e7ad89e38081e4b880e697a6e3839ae383bce382b8e38292e99ba2e3828ce3819fe5a0b4e59088e381a7e38282e38081e38395e382a9e383bce383a0e381abe887aae58b95e585a5e58a9be38195e3828ce381bee38199e380820d0a2a20e6b097e381abe381aae381a3e3819fe382a4e38399e383b3e38388e381afe4bf9de5ad98e38199e3828be4ba8be3818ce587bae69da5e381bee38199e38082e4bf9de5ad98e381aee4bb95e7b584e381abe382afe38383e382ade383bce38292e588a9e794a8e38197e381a6e381bee38199e380820d0a2a20e59fbae69cace79a84e381ab6950686f6e6528e382b9e3839ee383bce38388e38395e382a9e383b329e794a80d0a2a206261736572434d532056657273696f6e3a312e36e7b3bb0d0a0d0a68322e20e382bde383bce382b9e382b3e383bce383890d0a0d0a2a202268747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f4b696e696e61727541544e44223a68747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f4b696e696e61727541544e440d0a0d0a68322e20e996a2e980a355524c0d0a0d0a2a2022687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f31312f30353031333834332e706870223a687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f31312f30353031333834332e7068700d0a, '', '', '2012-04-08 03:50:05', 3),
(5, 2, 2, NULL, 0x68312e20e6a682e8a6810d0a0d0a6261736572434d53e381aee7aea1e79086e794bbe99da2e4b88ae3818be38289e3808146616365626f6f6b204c696b65426f78e381aee8a1a8e7a4bae78ab6e6858be38292e5a489e69bb4e383bbe7a2bae8aa8de38197e38081e382a6e382a3e382b8e382a7e38383e38388e381a8e38197e381a6e588a9e794a8e38199e3828be4ba8be3818ce587bae69da5e3828be38397e383a9e382b0e382a4e383b3e381a7e38199e380820d0a6261736572434d53e794a8e38397e383a9e382b0e382a4e383b3e380820d0a0d0a68322e20e382bde383bce382b9e382b3e383bce383890d0a0d0a2a202268747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65626f78223a68747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65626f780d0a0d0a68322e20e996a2e980a355524c0d0a0d0a2a2022687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f30352f32383136343033382e706870223a687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f30352f32383136343033382e7068700d0a0d0a68332e20e382a4e383b3e382b9e38388e383bce383ab0d0a0d0ae38395e382a1e382a4e383abe38292e8a7a3e5878de38197e381a6e587bae69da5e3819fe38395e382a9e383abe383802866625f6c696b65626f7829e38292e38081e3819de381aee381bee381be202f6170702f706c7567696e7320e381aee4b8ade381abe382a2e38383e38397e380820d0ae3819de381aee5be8ce38081e382b7e382b9e38386e383a0e8a8ade5ae9a202d3e20e38397e383a9e382b0e382a4e383b3e7aea1e7908620e381a8e980b2e381bfe3808146616365626f6f6b204c696b65426f78e38397e383a9e382b0e382a4e383b3e38292e799bbe98cb2e38197e381bee38199e380820d0a0d0a68332e20e4bdbfe38184e696b90d0a0d0ae38397e383a9e382b0e382a4e383b3e4b880e8a6a7e381abe4b8a6e38293e381a7e3828b2046616365626f6f6b204c696b65426f78e38397e383a9e382b0e382a4e383b320e381aee3808ce7aea1e79086e3808de3839ce382bfe383b3e3818be38289e38081e8a8ade5ae9ae794bbe99da2e381b8e7a7bbe58b95e587bae69da5e381bee38199e380820d0ae280bbe382b7e382b9e38386e383a0e8a8ade5ae9a202d3e20e382b0e383ade383bce38390e383abe383a1e3838be383a5e383bce7aea1e7908620e381a8e980b2e381bfe38081e7aea1e79086e794bbe99da2e581b4e381aee382b0e383ade383bce38390e383abe383a1e3838be383a5e383bce381a8e38197e381a6e799bbe98cb2e38197e381a6e3818ae3818fe99a9be381afe38081e4bba5e4b88be381ae55524ce38292e799bbe98cb2e38197e381a6e3818ae3818fe381a8e889afe38184e381a7e38199e380820d0a2f61646d696e2f66625f6c696b65626f782f66625f6c696b65626f785f636f6e666967730d0a0d0a68332e20e8a1a8e7a4bae38195e3819be3828be69982e381aee4bdbfe38184e696b90d0a0d0a46616365626f6f6b204c696b65426f78e38397e383a9e382b0e382a4e383b3e381afe38081e3819de381aee8a1a8e7a4bae983a8e58886e382926261736572e381aee382a6e382a3e382b8e382a7e38383e38388e381abe799bbe98cb2e38197e381a6e381bee38199e380820d0ae382b7e382b9e38386e383a0e8a8ade5ae9a202d3e20e382a6e382a3e382b8e382a7e38383e38388e382a8e383aae382a2e7aea1e79086202d3e2028e4bbbbe6848fe381ae29e382a6e382a3e382b8e382a7e38383e38388e381aee7b7a8e99b860d0ae381abe585a5e381a3e381a6e38081e3808ce588a9e794a8e4b8ade381aee382a6e382a3e382b8e382a7e38383e38388e3808de6ac84e381abe3808146616365626f6f6b204c696b65426f78e38397e383a9e382b0e382a4e383b3e383bbe382a6e382a3e382b8e382a7e38383e38388e38292e38389e383a9e38383e382b0efbc86e38389e383ade38383e38397e38197e381bee38199e380820d0ae38389e383ade38383e38397e38197e3819fe69982e381abe8a1a8e7a4bae38195e3828ce3828be5808be588a5e382a6e382a3e382b8e382a7e38383e38388e8a8ade5ae9ae381aee3808ce588a9e794a8e38199e3828be3808de38381e382a7e38383e382afe3839ce38383e382afe382b9e381abe38381e382a7e38383e382afe38292e585a5e3828ce381a6e3808ce4bf9de5ad98e3808de380820d0a0d0ae4bba5e4b88ae381a7e588a9e794a8e4b8ade381aee382a6e382a3e382b8e382a7e38383e38388e382a8e383aae382a2e58685e381abe8a1a8e7a4bae38195e3828ce3828be38288e38186e381abe381aae3828ae381bee38199e380820d0a, '', '', '2012-04-08 06:21:26', 2),
(6, 2, 2, NULL, 0x68312e20e6a682e8a6810d0a0d0a6261736572434d53e381aee7aea1e79086e382b7e382b9e38386e383a0e3818be38289e3808166616365626f6f6b204c696b65426f78e381aee8a1a8e7a4bae78ab6e6858be38292e5a489e69bb4e383bbe7a2bae8aa8de38197e38081e382a6e382a3e382b8e382a7e38383e38388e381a8e38197e381a6e588a9e794a8e38199e3828be4ba8be3818ce587bae69da5e3828b6261736572434d53e794a8e38397e383a9e382b0e382a4e383b3e381a7e38199e380820d0a0d0a68322e20e382bde383bce382b9e382b3e383bce383890d0a0d0a2a202268747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65626f78223a68747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65626f780d0a0d0a68322e20e996a2e980a355524c0d0a0d0a2a2022687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f30352f32383136343033382e706870223a687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031312f30352f32383136343033382e7068700d0a0d0a68322e20e382a4e383b3e382b9e38388e383bce383ab0d0a0d0ae38395e382a1e382a4e383abe38292e8a7a3e5878de38197e381a6e587bae69da5e3819fe38395e382a9e383abe383802866625f6c696b65626f7829e38292e38081e3819de381aee381bee381be202f6170702f706c7567696e7320e381aee4b8ade381abe382a2e38383e38397e380820d0ae3819de381aee5be8ce38081e382b7e382b9e38386e383a0e8a8ade5ae9a202d3e20e38397e383a9e382b0e382a4e383b3e7aea1e7908620e381a8e980b2e381bfe3808146616365626f6f6b204c696b65426f78e38397e383a9e382b0e382a4e383b3e38292e799bbe98cb2e38197e381bee38199e380820d0a0d0a68322e20e4bdbfe38184e696b90d0a0d0ae38397e383a9e382b0e382a4e383b3e4b880e8a6a7e381abe4b8a6e38293e381a7e3828b2046616365626f6f6b204c696b65426f78e38397e383a9e382b0e382a4e383b320e381aee3808ce7aea1e79086e3808de3839ce382bfe383b3e3818be38289e38081e8a8ade5ae9ae794bbe99da2e381b8e7a7bbe58b95e587bae69da5e381bee38199e380820d0ae280bbe382b7e382b9e38386e383a0e8a8ade5ae9a202d3e20e382b0e383ade383bce38390e383abe383a1e3838be383a5e383bce7aea1e7908620e381a8e980b2e381bfe38081e7aea1e79086e794bbe99da2e581b4e381aee382b0e383ade383bce38390e383abe383a1e3838be383a5e383bce381a8e38197e381a6e799bbe98cb2e38197e381a6e3818ae3818fe99a9be381afe38081e4bba5e4b88be381ae55524ce38292e799bbe98cb2e38197e381a6e3818ae3818fe381a8e889afe38184e381a7e38199e380820d0a2f61646d696e2f66625f6c696b65626f782f66625f6c696b65626f785f636f6e666967730d0a0d0a68332e20e8a1a8e7a4bae38195e3819be3828be69982e381aee4bdbfe38184e696b90d0a0d0a46616365626f6f6b204c696b65426f78e38397e383a9e382b0e382a4e383b3e381afe38081e3819de381aee8a1a8e7a4bae983a8e58886e382926261736572e381aee382a6e382a3e382b8e382a7e38383e38388e381abe799bbe98cb2e38197e381a6e381bee38199e380820d0ae382b7e382b9e38386e383a0e8a8ade5ae9a202d3e20e382a6e382a3e382b8e382a7e38383e38388e382a8e383aae382a2e7aea1e79086202d3e2028e4bbbbe6848fe381ae29e382a6e382a3e382b8e382a7e38383e38388e381aee7b7a8e99b860d0ae381abe585a5e381a3e381a6e38081e3808ce588a9e794a8e4b8ade381aee382a6e382a3e382b8e382a7e38383e38388e3808de6ac84e381abe3808146616365626f6f6b204c696b65426f78e38397e383a9e382b0e382a4e383b3e383bbe382a6e382a3e382b8e382a7e38383e38388e38292e38389e383a9e38383e382b0efbc86e38389e383ade38383e38397e38197e381bee38199e380820d0ae38389e383ade38383e38397e38197e3819fe69982e381abe8a1a8e7a4bae38195e3828ce3828be5808be588a5e382a6e382a3e382b8e382a7e38383e38388e8a8ade5ae9ae381aee3808ce588a9e794a8e38199e3828be3808de38381e382a7e38383e382afe3839ce38383e382afe382b9e381abe38381e382a7e38383e382afe38292e585a5e3828ce381a6e3808ce4bf9de5ad98e3808de380820d0a0d0ae4bba5e4b88ae381a7e588a9e794a8e4b8ade381aee382a6e382a3e382b8e382a7e38383e38388e382a8e383aae382a2e58685e381abe8a1a8e7a4bae38195e3828ce3828be38288e38186e381abe381aae3828ae381bee38199e380820d0a, '', '', '2012-05-12 08:54:31', 3),
(7, 3, 3, NULL, 0x68312e20e6a682e8a6810d0a0d0a68322e20e382bde383bce382b9e382b3e383bce383890d0a0d0a2a202268747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65627574746f6e223a68747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65627574746f6e0d0a0d0a0d0a68322e20e4bdbfe38184e696b9e381a8e3818b0d0a0d0a2a202268747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65627574746f6e2f77696b69223a68747470733a2f2f6769746875622e636f6d2f6d6174657269616c697a696e672f66625f6c696b65627574746f6e2f77696b690d0a0d0a0d0a68322e20e996a2e980a355524c0d0a0d0a2a2022687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031322f30352f31323038343232342e706870223a687474703a2f2f7777772e6d6174657269616c697a696e672e6e65742f61726368697665732f323031322f30352f31323038343232342e7068700d0a, '', '', '2012-05-12 08:54:39', 1);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `wiki_pages`
-- 

DROP TABLE IF EXISTS `wiki_pages`;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- 
-- テーブルのデータをダンプしています `wiki_pages`
-- 

INSERT INTO `wiki_pages` (`id`, `wiki_id`, `title`, `created_on`, `protected`, `parent_id`) VALUES 
(1, 1, 'Home', '2012-04-08 01:15:37', 0, NULL),
(2, 2, 'Home', '2012-04-08 01:32:42', 0, NULL),
(3, 3, 'Home', '2012-05-12 08:49:45', 0, NULL);

-- --------------------------------------------------------

-- 
-- テーブルの構造 `wiki_redirects`
-- 

DROP TABLE IF EXISTS `wiki_redirects`;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirects_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- テーブルのデータをダンプしています `wiki_redirects`
-- 


-- --------------------------------------------------------

-- 
-- テーブルの構造 `workflows`
-- 

DROP TABLE IF EXISTS `workflows`;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=212 ;

-- 
-- テーブルのデータをダンプしています `workflows`
-- 

INSERT INTO `workflows` (`id`, `tracker_id`, `old_status_id`, `new_status_id`, `role_id`) VALUES 
(1, 1, 1, 2, 3),
(2, 1, 1, 3, 3),
(3, 1, 1, 4, 3),
(4, 1, 1, 5, 3),
(5, 1, 1, 6, 3),
(6, 1, 2, 1, 3),
(7, 1, 2, 3, 3),
(8, 1, 2, 4, 3),
(9, 1, 2, 5, 3),
(10, 1, 2, 6, 3),
(11, 1, 3, 1, 3),
(12, 1, 3, 2, 3),
(13, 1, 3, 4, 3),
(14, 1, 3, 5, 3),
(15, 1, 3, 6, 3),
(16, 1, 4, 1, 3),
(17, 1, 4, 2, 3),
(18, 1, 4, 3, 3),
(19, 1, 4, 5, 3),
(20, 1, 4, 6, 3),
(21, 1, 5, 1, 3),
(22, 1, 5, 2, 3),
(23, 1, 5, 3, 3),
(24, 1, 5, 4, 3),
(25, 1, 5, 6, 3),
(26, 1, 6, 1, 3),
(27, 1, 6, 2, 3),
(28, 1, 6, 3, 3),
(29, 1, 6, 4, 3),
(30, 1, 6, 5, 3),
(31, 2, 1, 2, 3),
(32, 2, 1, 3, 3),
(33, 2, 1, 4, 3),
(34, 2, 1, 5, 3),
(35, 2, 1, 6, 3),
(36, 2, 2, 1, 3),
(37, 2, 2, 3, 3),
(38, 2, 2, 4, 3),
(39, 2, 2, 5, 3),
(40, 2, 2, 6, 3),
(41, 2, 3, 1, 3),
(42, 2, 3, 2, 3),
(43, 2, 3, 4, 3),
(44, 2, 3, 5, 3),
(45, 2, 3, 6, 3),
(46, 2, 4, 1, 3),
(47, 2, 4, 2, 3),
(48, 2, 4, 3, 3),
(49, 2, 4, 5, 3),
(50, 2, 4, 6, 3),
(51, 2, 5, 1, 3),
(52, 2, 5, 2, 3),
(53, 2, 5, 3, 3),
(54, 2, 5, 4, 3),
(55, 2, 5, 6, 3),
(56, 2, 6, 1, 3),
(57, 2, 6, 2, 3),
(58, 2, 6, 3, 3),
(59, 2, 6, 4, 3),
(60, 2, 6, 5, 3),
(61, 3, 1, 2, 3),
(62, 3, 1, 3, 3),
(63, 3, 1, 4, 3),
(64, 3, 1, 5, 3),
(65, 3, 1, 6, 3),
(66, 3, 2, 1, 3),
(67, 3, 2, 3, 3),
(68, 3, 2, 4, 3),
(69, 3, 2, 5, 3),
(70, 3, 2, 6, 3),
(71, 3, 3, 1, 3),
(72, 3, 3, 2, 3),
(73, 3, 3, 4, 3),
(74, 3, 3, 5, 3),
(75, 3, 3, 6, 3),
(76, 3, 4, 1, 3),
(77, 3, 4, 2, 3),
(78, 3, 4, 3, 3),
(79, 3, 4, 5, 3),
(80, 3, 4, 6, 3),
(81, 3, 5, 1, 3),
(82, 3, 5, 2, 3),
(83, 3, 5, 3, 3),
(84, 3, 5, 4, 3),
(85, 3, 5, 6, 3),
(86, 3, 6, 1, 3),
(87, 3, 6, 2, 3),
(88, 3, 6, 3, 3),
(89, 3, 6, 4, 3),
(90, 3, 6, 5, 3),
(91, 1, 1, 2, 4),
(92, 1, 1, 3, 4),
(93, 1, 1, 4, 4),
(94, 1, 1, 5, 4),
(95, 1, 2, 3, 4),
(96, 1, 2, 4, 4),
(97, 1, 2, 5, 4),
(98, 1, 3, 2, 4),
(99, 1, 3, 4, 4),
(100, 1, 3, 5, 4),
(101, 1, 4, 2, 4),
(102, 1, 4, 3, 4),
(103, 1, 4, 5, 4),
(104, 2, 1, 2, 4),
(105, 2, 1, 3, 4),
(106, 2, 1, 4, 4),
(107, 2, 1, 5, 4),
(108, 2, 2, 3, 4),
(109, 2, 2, 4, 4),
(110, 2, 2, 5, 4),
(111, 2, 3, 2, 4),
(112, 2, 3, 4, 4),
(113, 2, 3, 5, 4),
(114, 2, 4, 2, 4),
(115, 2, 4, 3, 4),
(116, 2, 4, 5, 4),
(117, 3, 1, 2, 4),
(118, 3, 1, 3, 4),
(119, 3, 1, 4, 4),
(120, 3, 1, 5, 4),
(121, 3, 2, 3, 4),
(122, 3, 2, 4, 4),
(123, 3, 2, 5, 4),
(124, 3, 3, 2, 4),
(125, 3, 3, 4, 4),
(126, 3, 3, 5, 4),
(127, 3, 4, 2, 4),
(128, 3, 4, 3, 4),
(129, 3, 4, 5, 4),
(130, 1, 1, 5, 5),
(131, 1, 2, 5, 5),
(132, 1, 3, 5, 5),
(133, 1, 4, 5, 5),
(134, 1, 3, 4, 5),
(135, 2, 1, 5, 5),
(136, 2, 2, 5, 5),
(137, 2, 3, 5, 5),
(138, 2, 4, 5, 5),
(139, 2, 3, 4, 5),
(140, 3, 1, 5, 5),
(141, 3, 2, 5, 5),
(142, 3, 3, 5, 5),
(143, 3, 4, 5, 5),
(144, 3, 3, 4, 5),
(145, 4, 1, 2, 3),
(146, 4, 1, 3, 3),
(147, 4, 1, 4, 3),
(148, 4, 1, 5, 3),
(149, 4, 1, 6, 3),
(150, 4, 2, 1, 3),
(151, 4, 2, 3, 3),
(152, 4, 2, 4, 3),
(153, 4, 2, 5, 3),
(154, 4, 2, 6, 3),
(155, 4, 3, 1, 3),
(156, 4, 3, 2, 3),
(157, 4, 3, 4, 3),
(158, 4, 3, 5, 3),
(159, 4, 3, 6, 3),
(160, 4, 4, 1, 3),
(161, 4, 4, 2, 3),
(162, 4, 4, 3, 3),
(163, 4, 4, 5, 3),
(164, 4, 4, 6, 3),
(165, 4, 5, 1, 3),
(166, 4, 5, 2, 3),
(167, 4, 5, 3, 3),
(168, 4, 5, 4, 3),
(169, 4, 5, 6, 3),
(170, 4, 6, 1, 3),
(171, 4, 6, 2, 3),
(172, 4, 6, 3, 3),
(173, 4, 6, 4, 3),
(174, 4, 6, 5, 3),
(175, 4, 1, 2, 4),
(176, 4, 1, 3, 4),
(177, 4, 1, 4, 4),
(178, 4, 1, 5, 4),
(179, 4, 1, 6, 4),
(180, 4, 2, 1, 4),
(181, 4, 2, 3, 4),
(182, 4, 2, 4, 4),
(183, 4, 2, 5, 4),
(184, 4, 2, 6, 4),
(185, 4, 3, 1, 4),
(186, 4, 3, 2, 4),
(187, 4, 3, 4, 4),
(188, 4, 3, 5, 4),
(189, 4, 3, 6, 4),
(190, 4, 4, 1, 4),
(191, 4, 4, 2, 4),
(192, 4, 4, 3, 4),
(193, 4, 4, 5, 4),
(194, 4, 4, 6, 4),
(195, 4, 5, 1, 4),
(196, 4, 5, 2, 4),
(197, 4, 5, 3, 4),
(198, 4, 5, 4, 4),
(199, 4, 5, 6, 4),
(200, 4, 6, 1, 4),
(201, 4, 6, 2, 4),
(202, 4, 6, 3, 4),
(203, 4, 6, 4, 4),
(204, 4, 6, 5, 4),
(207, 4, 1, 5, 5),
(208, 4, 2, 5, 5),
(209, 4, 3, 4, 5),
(210, 4, 3, 5, 5),
(211, 4, 4, 5, 5);
