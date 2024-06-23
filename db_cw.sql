-- Создаем базу данных Human Friends
CREATE DATABASE IF NOT EXISTS Human_Friends;
USE Human_Friends;

-- Создаем таблицу типов животных
CREATE TABLE IF NOT EXISTS Type_animals (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(20) UNIQUE
);

-- Создаем общую таблицу для животных
CREATE TABLE IF NOT EXISTS Animals (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    name_animal VARCHAR(20),
    type_id INT,
    birth_date DATE,
    commands TEXT,
    FOREIGN KEY (type_id) REFERENCES Type_animals(ID)
);

-- Создаем таблицу для домашних животных
CREATE TABLE IF NOT EXISTS Pets (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    animal_id INT,
    FOREIGN KEY (animal_id) REFERENCES Animals(ID)
);

-- Создаем таблицу для вьючных животных
CREATE TABLE IF NOT EXISTS Pack_Animals (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    animal_id INT,
    FOREIGN KEY (animal_id) REFERENCES Animals(ID)
);

-- Создаем таблицы для конкретных типов домашних животных
CREATE TABLE IF NOT EXISTS Cats (
    pet_id INT PRIMARY KEY,
    FOREIGN KEY (pet_id) REFERENCES Pets(ID)
);

CREATE TABLE IF NOT EXISTS Dogs (
    pet_id INT PRIMARY KEY,
    FOREIGN KEY (pet_id) REFERENCES Pets(ID)
);

CREATE TABLE IF NOT EXISTS Hamsters (
    pet_id INT PRIMARY KEY,
    FOREIGN KEY (pet_id) REFERENCES Pets(ID)
);

-- Создаем таблицы для конкретных типов вьючных животных
CREATE TABLE IF NOT EXISTS Camels (
    pack_animal_id INT PRIMARY KEY,
    FOREIGN KEY (pack_animal_id) REFERENCES Pack_Animals(ID)
);

CREATE TABLE IF NOT EXISTS Horses (
    pack_animal_id INT PRIMARY KEY,
    FOREIGN KEY (pack_animal_id) REFERENCES Pack_Animals(ID)
);

CREATE TABLE IF NOT EXISTS Donkeys (
    pack_animal_id INT PRIMARY KEY,
    FOREIGN KEY (pack_animal_id) REFERENCES Pack_Animals(ID)
);

-- Вставка данных в таблицу Type_animals
INSERT INTO Type_animals (type_name) VALUES
('Dog'),
('Cat'),
('Hamster'),
('Horse'),
('Camel'),
('Donkey');

-- Вставка данных в таблицу Animals
INSERT INTO Animals (name_animal, type_id, birth_date, commands) VALUES
('Fido', (SELECT ID FROM Type_animals WHERE type_name = 'Dog'), '2020-01-01', 'Sit, Stay, Fetch'),
('Whiskers', (SELECT ID FROM Type_animals WHERE type_name = 'Cat'), '2019-05-15', 'Sit, Pounce'),
('Hammy', (SELECT ID FROM Type_animals WHERE type_name = 'Hamster'), '2021-03-10', 'Roll, Hide'),
('Buddy', (SELECT ID FROM Type_animals WHERE type_name = 'Dog'), '2021-12-10', 'Sit, Paw, Bark'),
('Smudge', (SELECT ID FROM Type_animals WHERE type_name = 'Cat'), '2020-02-20', 'Sit, Pounce, Scratch'),
('Peanut', (SELECT ID FROM Type_animals WHERE type_name = 'Hamster'), '2021-08-01', 'Roll, Spin'),
('Bella', (SELECT ID FROM Type_animals WHERE type_name = 'Dog'), '2019-11-11', 'Sit, Stay, Roll'),
('Oliver', (SELECT ID FROM Type_animals WHERE type_name = 'Cat'), '2020-06-30', 'Meow, Scratch, Jump'),
('Thunder', (SELECT ID FROM Type_animals WHERE type_name = 'Horse'), '2022-07-21', 'Trot, Canter, Gallop'),
('Sandy', (SELECT ID FROM Type_animals WHERE type_name = 'Camel'), '2021-11-03', 'Walk, Carry Load'),
('Eeyore', (SELECT ID FROM Type_animals WHERE type_name = 'Donkey'), '2017-09-18', 'Walk, Carry Load, Bray'),
('Storm', (SELECT ID FROM Type_animals WHERE type_name = 'Horse'), '2024-05-05', 'Trot, Canter'),
('Dune', (SELECT ID FROM Type_animals WHERE type_name = 'Camel'), '2018-12-12', 'Walk, Sit'),
('Burro', (SELECT ID FROM Type_animals WHERE type_name = 'Donkey'), '2019-01-23', 'Walk, Bray, Kick'),
('Blaze', (SELECT ID FROM Type_animals WHERE type_name = 'Horse'), '2022-02-28', 'Trot, Jump, Gallop'),
('Sahara', (SELECT ID FROM Type_animals WHERE type_name = 'Camel'), '2023-08-14', 'Walk, Run');

-- Вставка данных в таблицу Pets
INSERT INTO Pets (animal_id) VALUES
((SELECT ID FROM Animals WHERE name_animal = 'Fido')),
((SELECT ID FROM Animals WHERE name_animal = 'Whiskers')),
((SELECT ID FROM Animals WHERE name_animal = 'Hammy')),
((SELECT ID FROM Animals WHERE name_animal = 'Buddy')),
((SELECT ID FROM Animals WHERE name_animal = 'Smudge')),
((SELECT ID FROM Animals WHERE name_animal = 'Peanut')),
((SELECT ID FROM Animals WHERE name_animal = 'Bella')),
((SELECT ID FROM Animals WHERE name_animal = 'Oliver'));

-- Вставка данных в таблицу Pack_Animals
INSERT INTO Pack_Animals (animal_id) VALUES
((SELECT ID FROM Animals WHERE name_animal = 'Thunder')),
((SELECT ID FROM Animals WHERE name_animal = 'Sandy')),
((SELECT ID FROM Animals WHERE name_animal = 'Eeyore')),
((SELECT ID FROM Animals WHERE name_animal = 'Storm')),
((SELECT ID FROM Animals WHERE name_animal = 'Dune')),
((SELECT ID FROM Animals WHERE name_animal = 'Burro')),
((SELECT ID FROM Animals WHERE name_animal = 'Blaze')),
((SELECT ID FROM Animals WHERE name_animal = 'Sahara'));

-- Вставка данных в таблицу Cats
INSERT INTO Cats (pet_id) VALUES
((SELECT ID FROM Pets WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Whiskers'))),
((SELECT ID FROM Pets WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Smudge'))),
((SELECT ID FROM Pets WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Oliver')));

-- Вставка данных в таблицу Dogs
INSERT INTO Dogs (pet_id) VALUES
((SELECT ID FROM Pets WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Fido'))),
((SELECT ID FROM Pets WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Buddy'))),
((SELECT ID FROM Pets WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Bella')));

-- Вставка данных в таблицу Hamsters
INSERT INTO Hamsters (pet_id) VALUES
((SELECT ID FROM Pets WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Hammy'))),
((SELECT ID FROM Pets WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Peanut')));

-- Вставка данных в таблицу Horses
INSERT INTO Horses (pack_animal_id) VALUES
((SELECT ID FROM Pack_Animals WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Thunder'))),
((SELECT ID FROM Pack_Animals WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Storm'))),
((SELECT ID FROM Pack_Animals WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Blaze')));

-- Вставка данных в таблицу Camels
INSERT INTO Camels (pack_animal_id) VALUES
((SELECT ID FROM Pack_Animals WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Sandy'))),
((SELECT ID FROM Pack_Animals WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Dune'))),
((SELECT ID FROM Pack_Animals WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Sahara')));

-- Вставка данных в таблицу Donkeys
INSERT INTO Donkeys (pack_animal_id) VALUES
((SELECT ID FROM Pack_Animals WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Eeyore'))),
((SELECT ID FROM Pack_Animals WHERE animal_id = (SELECT ID FROM Animals WHERE name_animal = 'Burro')));

-- Удаление всех записей из таблицы Camels
TRUNCATE TABLE Camels;

-- Удаление записей о верблюдах из таблицы Pack_Animals
DELETE FROM Pack_Animals WHERE animal_id IN (SELECT ID FROM Animals WHERE type_id IN (SELECT ID FROM Type_animals WHERE type_name = 'Camel'));

-- Удаление записей о верблюдах из таблицы Animals
DELETE FROM Animals WHERE type_id IN (SELECT ID FROM Type_animals WHERE type_name = 'Camel');

-- Перенос данных из таблицы Horses в таблицу Donkeys
INSERT INTO Donkeys (pack_animal_id)
SELECT pack_animal_id FROM Horses;

-- Переименовывание таблицы Donkeys в Horses_And_Donkeys
RENAME TABLE Donkeys TO Horses_And_Donkeys;

-- Удаление старых таблиц
DROP TABLE IF EXISTS Horses;
DROP TABLE IF EXISTS Camels;

-- Создание новой таблицы для животных в возрасте от 1 до 3 лет
CREATE TABLE IF NOT EXISTS Young_Animals (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    name_animal VARCHAR(20),
    type_id INT,
    birth_date DATE,
    age_months INT,
    commands TEXT,
    FOREIGN KEY (type_id) REFERENCES Type_animals(ID)
);

-- Вставка данных в таблицу Young_Animals
INSERT INTO Young_Animals (name_animal, type_id, birth_date, age_months, commands)
SELECT name_animal, type_id, birth_date, TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) AS age_months, commands
FROM Animals
WHERE TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) BETWEEN 12 AND 36;

-- Объединение всех таблиц в одну
SELECT 'Animals' AS source_table, ID, NULL AS pack_animal_id, NULL AS pet_id
FROM Animals
UNION ALL
SELECT 'Pets' AS source_table, animal_id AS ID, NULL AS pack_animal_id, animal_id AS pet_id
FROM Pets
UNION ALL
SELECT 'Pack_Animals' AS source_table, animal_id AS ID, animal_id AS pack_animal_id, NULL AS pet_id
FROM Pack_Animals
UNION ALL
SELECT 'Cats' AS source_table, p.animal_id AS ID, NULL AS pack_animal_id, pet_id
FROM Cats c
JOIN Pets p ON c.pet_id = p.ID
UNION ALL
SELECT 'Dogs' AS source_table, p.animal_id AS ID, NULL AS pack_animal_id, pet_id
FROM Dogs d
JOIN Pets p ON d.pet_id = p.ID
UNION ALL
SELECT 'Hamsters' AS source_table, p.animal_id AS ID, NULL AS pack_animal_id, pet_id
FROM Hamsters h
JOIN Pets p ON h.pet_id = p.ID
UNION ALL
SELECT 'Horses_And_Donkeys' AS source_table, pa.animal_id AS ID, pack_animal_id, NULL AS pet_id
FROM Horses_And_Donkeys hd
JOIN Pack_Animals pa ON hd.pack_animal_id = pa.ID;
