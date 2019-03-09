# Wypełnianie bazy przykładowymi danymi

## instalacja zależności
```composer log
composer install
```
lub (kiedy pobieramy composer z https://getcomposer.org/download/)
```composer log
php composer.phar install
```

## konfigurcja połącznia serverem baz danych
plik connect.json
```json
{
  "host":"localhost",
  "username":"root",
  "password":""
}
```

## konfigurcja połącznia z bazą
```php
//plik products.php
$db = new MysqliDb(
    $connData->host,
    $connData->username,
    $connData->password,
    'NAZWA_BAZY'
);

//plik schools.php
$db = new MysqliDb(
    $connData->host,
    $connData->username,
    $connData->password,
    'NAZWA_BAZY'
);
//plik blog.php
$db = new MysqliDb(
    $connData->host,
    $connData->username,
    $connData->password,
    'NAZWA_BAZY'
);
```

## pliki z zapytaniami tworzącymi strukturę bazy
#### base_products.sql
#### base_schools.sql
#### base_blog.sql

## uruchomienie wytwórni
```composer log
php products.php
```

```composer log
php schools.php
```

```composer log
php blog.php
```