-- ////////////////////////////////////////////////////////////////////////////////////////////

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `updated_at` timestamp ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL
);


CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED NULL,
  `name` varchar(255) NOT NULL,
  `description` TEXT NOT NULL,
  `price` decimal(6,2) NOT NULL, -- max 6 cyfr 9999.99
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL
);

ALTER TABLE `products` ADD FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL ON UPDATE RESTRICT;

-- ///////////////////////ODRBNE ZAPYTANIE TWORZĄCE KLUCZ PODSTAWOWY////////////////////////

ALTER TABLE `products`
    ADD PRIMARY KEY (`id`);

ALTER TABLE `products`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT

-- ///////////////////////ODRĘBNE ZAPYTANIE TWORZĄCE KLUCZ PODSTAWOWY////////////////////////


-- ///////////////////////ZRZUT KLUCZA//////////////////////////////////////////////////////

ALTER TABLE `products` MODIFY `id` INT NOT NULL;
ALTER TABLE `products`
    DROP PRIMARY KEY

-- ///////////////////////ZRZUT KLUCZA//////////////////////// ///////////////////////////////
