CREATE TABLE `apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `subdomain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_analytics_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itunes_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `small_artwork_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screenshots` text COLLATE utf8_unicode_ci,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `large_artwork_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itunes_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_links_on_app_id` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `screenshot_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_themes_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_count` int(11) DEFAULT NULL,
  `failed_login_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `perishable_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index_users_on_perishable_token` (`perishable_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO schema_migrations (version) VALUES ('20100217035029');

INSERT INTO schema_migrations (version) VALUES ('20100217151133');

INSERT INTO schema_migrations (version) VALUES ('20100217203116');

INSERT INTO schema_migrations (version) VALUES ('20100217213913');

INSERT INTO schema_migrations (version) VALUES ('20100217234954');

INSERT INTO schema_migrations (version) VALUES ('20100218011718');

INSERT INTO schema_migrations (version) VALUES ('20100218013040');

INSERT INTO schema_migrations (version) VALUES ('20100218014836');

INSERT INTO schema_migrations (version) VALUES ('20100218015251');

INSERT INTO schema_migrations (version) VALUES ('20100218015703');

INSERT INTO schema_migrations (version) VALUES ('20100218021250');

INSERT INTO schema_migrations (version) VALUES ('20100218022040');

INSERT INTO schema_migrations (version) VALUES ('20100218023759');

INSERT INTO schema_migrations (version) VALUES ('20100218234705');

INSERT INTO schema_migrations (version) VALUES ('20100220034807');

INSERT INTO schema_migrations (version) VALUES ('20100221014313');

INSERT INTO schema_migrations (version) VALUES ('20100221032251');

INSERT INTO schema_migrations (version) VALUES ('20100221033007');

INSERT INTO schema_migrations (version) VALUES ('20100221040844');

INSERT INTO schema_migrations (version) VALUES ('20100221061809');

INSERT INTO schema_migrations (version) VALUES ('20100221065359');

INSERT INTO schema_migrations (version) VALUES ('20100221164229');

INSERT INTO schema_migrations (version) VALUES ('20100222025841');

INSERT INTO schema_migrations (version) VALUES ('20100222031808');

INSERT INTO schema_migrations (version) VALUES ('20100222031847');

INSERT INTO schema_migrations (version) VALUES ('20100222032950');

INSERT INTO schema_migrations (version) VALUES ('20100222234547');

INSERT INTO schema_migrations (version) VALUES ('20100223030623');