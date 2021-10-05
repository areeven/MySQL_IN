SHOW DATABASES;

CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE authors
(
    id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE books
(
    id          INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title       VARCHAR(100) NOT NULL,
    authorId    INT          NOT NULL,
    FOREIGN KEY (authorId) REFERENCES authors (id),
    description VARCHAR(200) NOT NULL,
    year        INT          NOT NULL,
    price_sek   INT          NOT NULL,
    categoryId  INT          NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES categories (id)
);

CREATE TABLE categories
(
    id   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

SELECT *
FROM books;

INSERT INTO categories(name)
VALUES ('Action'),
       ('Adventure'),
       ('Detective'),
       ('Mystery'),
       ('Horror'),
       ('Historical'),
       ('Fantasy')
       ;

UPDATE categories
SET name = 'Sci-Fi'
WHERE id = 4;

SELECT *
FROM categories;

INSERT INTO authors(name)
VALUES ('J.K Rowling'),
       ('J.R.R Tolkien'),
       ('Stephen King'),
       ('Jules Verne'),
       ('Jane Austen'),
       ('Andy Weir'),
       ('Agatha Christie')
;

INSERT INTO books(title, authorId, description, year, price_sek, categoryId)
VALUES ('Harry Potter and the philosophers stone', 1, 'The wondrous world of wizardry at Hogwarts', 2001, 189, 7),
       ('Around the world in 80 days', 4, 'A man traveling around the world to win a bet', 1958, 109, 2),
       ('Lord of the Rings', 2, 'Two guys traveling up a mountain to destroy a ring', 1954, 150, 2),
       ('The shining', 3, 'A horror story based in a haunted hotel', 1980, 100, 5),
       ('Pride and prejudice', 5, 'A love story between two people of very different titles', 1813, 179, 6),
       ('The martian', 6, 'The survival of a man alone on mars, left behind by his comrades', 2011, 100, 4),
       ('Murder on the orient express', 7, 'Investigation of a murder on the train, everyone is a suspect!', 1934, 164, 3)
       ;

SELECT * FROM books;