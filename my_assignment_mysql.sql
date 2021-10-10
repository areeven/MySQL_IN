# Skapat av Emilie Öst - Campus Mölndal
# CRUD är med

SHOW DATABASES;

# Skapar databas och använder sedan för att kunna hämta requests från den
CREATE DATABASE bookstore;
USE bookstore;

# Tar bort databasen, har använt denna funktion vid behov om något blivit fel
DROP DATABASE bookstore;

# Skapar om databasen här och börjar med uppgiften
# Uppgift - Att skapa en databas med författare, böcker och kategorier enligt önskemål
CREATE DATABASE bookstore;
USE bookstore;

SHOW DATABASES;
SHOW TABLES;

# Skapar författare
CREATE TABLE authors
(
    id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);
SHOW TABLES;

# Skapar kategorier
CREATE TABLE categories
(
    id   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);
SHOW TABLES;

# Skapar böcker och importerar kategori och författare från ovan med Foreign key.
CREATE TABLE books
(
    id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(100) NOT NULL,
    authorId    INT          NOT NULL,
    FOREIGN KEY (authorId) REFERENCES authors (id),
    description VARCHAR(200) NOT NULL,
    year        INT          NOT NULL,
    price_sek   INT          NOT NULL,
    categoryId  INT,
    FOREIGN KEY (categoryId) REFERENCES categories (id)
);
SHOW TABLES;

SELECT *
FROM books;

# Skapar kategorier
INSERT INTO categories(name)
VALUES ('Action'),
       ('Adventure'),
       ('Detective'),
       ('Mystery'),
       ('Horror'),
       ('Historical'),
       ('Fantasy')
;
SELECT *
FROM categories;

# Kom på att den viktigaste kategorin saknades så fick uppdatera mina kategorier
UPDATE categories
SET name = 'Sci-Fi'
WHERE id = 4;

SELECT *
FROM categories;

# Skapar författare
INSERT INTO authors(name)
VALUES ('J.K Rowling'),
       ('J.R.R Tolkien'),
       ('Stephen King'),
       ('Jules Verne'),
       ('Jane Austen'),
       ('Andy Weir'),
       ('Agatha Christie')
;

SELECT *
FROM authors;

# Skapar böcker
INSERT INTO books(title, authorId, description, year, price_sek, categoryId)
VALUES ('Harry Potter and the philosophers stone', 1, 'The wondrous world of wizardry at Hogwarts', 2001, 189, 7),
       ('Around the world in 80 days', 4, 'A man traveling around the world to win a bet', 1958, 109, 2),
       ('Lord of the Rings', 2, 'Two guys traveling up a mountain to destroy a ring', 1954, 150, 2),
       ('The shining', 3, 'A horror story based in a haunted hotel', 1980, 100, 5),
       ('Pride and prejudice', 5, 'A love story between two people of very different titles', 1813, 179, 6),
       ('The martian', 6, 'The survival of a man alone on mars, left behind by his comrades', 2011, 100, 4),
       ('Murder on the orient express', 7, 'Investigation of a murder on the train, everyone is a suspect!', 1934, 164,
        3)
;

SELECT *
FROM books;
# CREATE
# Lägger till en författare
INSERT INTO authors(name)
VALUES ('Daniel Defoe');

SELECT *
FROM authors;

# Lägger till en bok med den nya författaren
INSERT INTO books(title, authorId, description, year, price_sek)
VALUES ('Robin Crusoe', 8, 'A man survives on an island for 28 years', 1719, 120);

# READ
SELECT *
FROM books;

# UPDATE
# Uppdaterar priset på en av böckerna, den med id 8
UPDATE books
SET price_sek = 130
WHERE id = 8;

SELECT *
FROM books;

# Skriver ut titelnamnet och id på vilken kategori det är
SELECT title, categoryId
FROM books;

# Skriver ut kategorinamnet och bokens titel
SELECT categories.name, books.title
FROM books
         INNER JOIN categories ON books.categoryId = categories.id;

# Skriver ut kategorins namn, författarens namn samt boktiteln från samtliga böcker med värden i
SELECT categories.name, authors.name, books.title
FROM books
         INNER JOIN categories ON books.categoryId = categories.id
         INNER JOIN authors ON books.authorId = authors.id;

# Skriver ut kategori och titel endast med värdet Adventure
SELECT categories.name, books.title
FROM books
         INNER JOIN categories ON books.categoryId = categories.id
WHERE categories.name = 'Adventure';

# Skriver ut kategori och titel endast med värdet Horror
SELECT categories.name, books.title
FROM books
         INNER JOIN categories ON books.categoryId = categories.id
WHERE categories.name = 'Horror';

# Försöker få till att skriva ut alla rows oavsett om de har värde eller inte
SELECT categories.name, books.title
FROM books
         INNER JOIN categories ON books.categoryId = categories.id
WHERE categories.id IS NULL;



# DELETE
# Tar bort alla böcker som är skrivna år 1980
DELETE
FROM books
WHERE year = 1980;

SELECT *
FROM books;

# Tar bort en kategori vars id är 2
SET FOREIGN_KEY_CHECKS = 0;

DELETE
FROM categories
WHERE id = 2;

SET FOREIGN_KEY_CHECKS = 1;

SELECT *
FROM categories;

SELECT *
FROM books;