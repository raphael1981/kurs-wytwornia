CREATE TABLE `schools` (
  `id` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `registration_number` varchar(100) NOT NULL UNIQUE,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL,
   CONSTRAINT `unique_registration number` UNIQUE (`id`,`registration_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `classes` (
  `id` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `school_id` int(10) UNSIGNED NOT NULL,
  `class_number` varchar(255) NOT NULL UNIQUE,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL,
   CONSTRAINT `unique_class_number` UNIQUE (`id`,`class_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `classes` ADD FOREIGN KEY (`school_id`) REFERENCES `schools`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `class_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL UNIQUE,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL,
   CONSTRAINT `unique_student` UNIQUE (`id`,`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `students` ADD FOREIGN KEY (`class_id`) REFERENCES `classes`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;


CREATE TABLE `grades` (
  `id` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `student_id` int(10) UNSIGNED NULL,
  `number` float,
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `grades` ADD FOREIGN KEY (`student_id`) REFERENCES `students`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;