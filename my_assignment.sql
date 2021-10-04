SHOW DATABASES;

CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE authors(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE books(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    authorId INT NOT NULL,
    FOREIGN KEY (authorId) REFERENCES authors (id),
    description VARCHAR(200) NOT NULL,
    year INT NOT NULL,
    price_sek INT NOT NULL,
    categoryId INT NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES categories (id)
);

CREATE TABLE categories(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

SELECT *
FROM books;