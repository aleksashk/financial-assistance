CREATE TABLE user_service (
                              id int primary key generated by default as identity ,
                              email VARCHAR(255) not null unique ,
                              password VARCHAR(255) not null
);

-- Создание таблицы Account
CREATE TABLE account (
                         id int primary key generated by default as identity ,
                         user_id INT,
                         amount DECIMAL(10, 2) not null DEFAULT 0,
                         cash DECIMAL(10, 2) not null DEFAULT 0,
                         FOREIGN KEY (user_id) REFERENCES user_service(id) ON DELETE CASCADE
);

-- Создание таблицы Transaction
CREATE TABLE transaction (
                             id int primary key generated by default as identity ,
                             from_account INT,
                             to_account INT,
                             amount DECIMAL(10, 2) not null,
                             FOREIGN KEY (from_account) REFERENCES account(id) ON DELETE CASCADE,
                             FOREIGN KEY (to_account) REFERENCES account(id) ON DELETE CASCADE
);

-- Создание таблицы Category
CREATE TABLE category (
                          id int primary key generated by default as identity ,
                          name VARCHAR(255) not null
);

-- Примеры запросов:

-- 1. Выбрать всех пользователей
SELECT * FROM user_service;

-- 2. Выбрать все счета пользователя с id=1
SELECT * FROM account WHERE user_id = 1;

-- 3. Выбрать все транзакции с счета с id=2
SELECT * FROM transaction WHERE from_account = 2 OR to_account = 2;

-- 4. Выбрать все категории
SELECT * FROM category;



-- Вставляем данные в таблицу User
INSERT INTO user_service (email, password)
VALUES
    ('user1@example.com', 'password1'),
    ('user2@example.com', 'password2'),
    ('user3@example.com', 'password3'),
    ('user4@example.com', 'password4'),
    ('user5@example.com', 'password5'),
    ('user6@example.com', 'password6'),
    ('user7@example.com', 'password7'),
    ('user8@example.com', 'password8'),
    ('user9@example.com', 'password9'),
    ('user10@example.com', 'password10');

-- Вставляем данные в таблицу Account
INSERT INTO account (user_id, amount, cash)
VALUES
    (1, 100.50, 50),
    (2, 200.75, 60),
    (3, 300.25, 70),
    (4, 400.00, 80),
    (5, 500.10, 90),
    (6, 600.55, 100),
    (7, 700.65, 110),
    (8, 800.75, 120),
    (9, 900.85, 130),
    (10, 1000.95, 140);

-- Вставляем данные в таблицу Transaction
INSERT INTO transaction (from_account, to_account, amount)
VALUES
    (1, 2, 10),
    (2, 3, 15),
    (3, 4, 20),
    (4, 5, 25),
    (5, 6, 30),
    (6, 7, 35),
    (7, 8, 40),
    (8, 9, 45),
    (9, 10, 50),
    (10, 1, 55);

-- Вставляем данные в таблицу Category
INSERT INTO category (name)
VALUES
    ('Groceries'),
    ('Entertainment'),
    ('Utilities'),
    ('Rent'),
    ('Travel'),
    ('Health'),
    ('Education'),
    ('Clothing'),
    ('Electronics'),
    ('Others');