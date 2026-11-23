-- hw07_start.sql — ВОССТАНОВЛЕННАЯ подготовка по тексту задания.
-- Если преподаватель приложил свой hw07_start.sql, выполняйте его, а не этот файл.

DROP SCHEMA IF EXISTS hw07 CASCADE;
CREATE SCHEMA hw07;
SET search_path TO hw07;

CREATE TABLE departments (
    department_id   integer PRIMARY KEY,
    department_name text    NOT NULL
);

CREATE TABLE employees (
    employee_id   integer PRIMARY KEY,
    employee_name text    NOT NULL,
    department_id integer REFERENCES departments (department_id),
    mentor_id     integer REFERENCES employees (employee_id)
);

INSERT INTO departments (department_id, department_name) VALUES
    (1, 'Разработка'),
    (2, 'Дизайн'),
    (3, 'Поддержка'),
    (4, 'Аналитика');

INSERT INTO employees (employee_id, employee_name, department_id, mentor_id) VALUES
    (1, 'Анна',  1,    NULL),
    (2, 'Борис', 1,    1),
    (3, 'Вера',  2,    1),
    (4, 'Глеб',  NULL, NULL),
    (5, 'Дина',  3,    3);
