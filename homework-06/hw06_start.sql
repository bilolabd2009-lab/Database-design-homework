-- hw06_start.sql — ВОССТАНОВЛЕННАЯ подготовка по тексту задания.
-- Если преподаватель приложил свой hw06_start.sql, выполняйте его, а не этот файл.
-- Имя столбца поставщика (supplier_name) здесь предположено; если в оригинале
-- оно другое, поправьте его в hw06.sql в двух местах (INSERT и SELECT).

DROP SCHEMA IF EXISTS hw06 CASCADE;
CREATE SCHEMA hw06;
SET search_path TO hw06;

-- Исходная таблица: одна строка = одно поступление, позиции списком в items
CREATE TABLE raw_deliveries (
    delivery_id   integer PRIMARY KEY,
    supplier_name text    NOT NULL,
    items         text    NOT NULL
);

INSERT INTO raw_deliveries (delivery_id, supplier_name, items) VALUES
    (5001, 'Север',  '201|Тетрадь|10|45.50;202|Ручка|20|30.00'),
    (5002, 'Вектор', '201|Тетрадь|5|44.00;203|Папка|8|120.00'),
    (5003, 'Север',  '202|Ручка|12|29.50');

-- Целевая таблица в 1НФ: одна строка = один товар в одном поступлении
CREATE TABLE delivery_lines_1nf (
    delivery_id   integer        NOT NULL,
    supplier_name text           NOT NULL,
    product_id    integer        NOT NULL,
    product_title text           NOT NULL,
    quantity      integer        NOT NULL,
    unit_price    numeric(10, 2) NOT NULL,
    PRIMARY KEY (delivery_id, product_id)
);
