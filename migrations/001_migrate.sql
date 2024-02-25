-- +goose Up

CREATE TABLE countries (
                           id serial PRIMARY KEY,
                           country_code TEXT unique,
                           name TEXT
);

INSERT INTO countries(country_code, name)
VALUES ('US', 'United States');

INSERT INTO countries(country_code, name)
VALUES ('CA', 'Canada');

INSERT INTO countries(country_code, name)
VALUES ('IN', 'India');

INSERT INTO countries(country_code, name)
VALUES ('JP', 'Japan');

INSERT INTO countries(country_code, name)
VALUES ('BR', 'Brazil');

CREATE TABLE users (
                       id serial PRIMARY KEY,
                       name TEXT NOT NULL,
                       age INTEGER NOT NULL,
                       country_code text references countries(country_code) on delete cascade,
                       username TEXT UNIQUE,
                       password TEXT NOT NULL,
                       is_admin BOOLEAN
);

INSERT INTO users( name, age, country_code, username, password, is_admin)
VALUES ( 'David', 34, 'US', 'DavidDev', 'insertPractice', false);

INSERT INTO users( name, age, country_code, username, password, is_admin)
VALUES ( 'Samantha', 29, 'BR', 'Sammy93', 'addingRecords!', false);

INSERT INTO users( name, age, country_code, username, password, is_admin)
VALUES ( 'John', 39, 'CA', 'Jjdev21', 'welovebootdev', false);

INSERT INTO users( name, age, country_code, username, password, is_admin)
VALUES ( 'Ram', 42, 'IN', 'Ram11c', 'thisSQLcourserocks', false);

INSERT INTO users( name, age, country_code, username, password, is_admin)
VALUES ( 'Hunter', 30, 'US', 'Hdev92', 'backendDev', false);

INSERT INTO users( name, age, country_code, username, password, is_admin)
VALUES ( 'Allan', 27, 'US', 'Alires', 'iLoveB00tdev', true);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Lance', 20, 'US', 'LanChr', 'b00tdevisbest', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Tiffany', 28, 'US', 'Tifferoon', 'autoincrement', true);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Lane', 27, 'US', 'wagslane', 'update_me', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Darren', 15, 'CA', 'Dshan', 'found_me', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Albert', 55, 'BR', 'BertDev', 'one_al_name', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Alvin', 27, 'US', 'AlvinA27', 'easter_egg', false);

INSERT INTO users(name, age, country_code, username, password, is_admin)
VALUES ('Al', 39, 'JP', 'quickCoder', 'snake_case', false);



-- +goose Down
drop table users;
drop table countries;