CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL UNIQUE,
  `password` varchar(500) NULL,
  `status` tinyint DEFAULT 0,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL,
   CONSTRAINT `unique_email` UNIQUE (`id`,`email`)
);

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(500) NULL,
  `alias` varchar(500) NULL,
  `intro` text NULL,
  `content` text NULL,
  `status` enum('created','confirmed','canceled') DEFAULT 'created',
  `created_at` timestamp NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL UNIQUE,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL,
   CONSTRAINT `unique_tag` UNIQUE (`id`,`alias`)
);

CREATE TABLE `tags_posts` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
);

ALTER TABLE `tags_posts` ADD FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
ALTER TABLE `tags_posts` ADD FOREIGN KEY (`post_id`) REFERENCES `posts`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
