-- Active: 1684982784502@@127.0.0.1@3306@telovendo

-- A. Ingrese 5 vendedores.

INSERT INTO
    Vendedores (
        RUN,
        nombre,
        apellido,
        fecha_nacimiento,
        seccion,
        salario
    )
VALUES (
        '20005121-1',
        'Felipe',
        'González',
        '1990-01-01',
        'Automotriz',
        150000
    ), (
        '19765876-2',
        'Sofía',
        'López',
        '1995-05-15',
        'Aseo e higiene',
        180000
    ), (
        '33333333-3',
        'Matías',
        'Pérez',
        '1988-09-30',
        'Ropa',
        165000
    ), (
        '12675897-4',
        'Isabella',
        'Silva',
        '1992-07-20',
        'Belleza',
        200000
    ), (
        '23555555-5',
        'Tomás',
        'Muñoz',
        '1998-12-10',
        'Deportes',
        175000
    );

-- B. Ingrese 5 clientes.

INSERT INTO
    Clientes (
        codigo_cliente,
        nombre,
        apellido,
        telefono,
        direccion,
        comuna,
        correo_electronico,
        fecha_registro,
        total_pagado
    )
VALUES (
        18,
        'Simón',
        'Bolívar',
        '+56111111111',
        'Av. Libertador Bernardo O\'Higgins 123',
        'Concepción',
        'simon.bolivar@live.cl',
        '2023-05-29',
        50000
    ), (
        19,
        'Nelson',
        'Mandela',
        '+56222222222',
        'Calle Maipú 456',
        'Temuco',
        'nelson.mandela@hotmail.com',
        '2023-05-29',
        75000
    ), (
        20,
        'Juana',
        'de Arco',
        '+56333333333',
        'Av. Arturo Prat 789',
        'Chillán',
        'juana.dearco@live.cl',
        '2023-05-29',
        100000
    ), (
        21,
        'Abraham',
        'Lincoln',
        '+56444444444',
        'Calle O\'Higgins 321',
        'Concepción',
        'abraham.lincoln@hotmail.com',
        '2023-05-29',
        25000
    ), (
        22,
        'Cleopatra',
        'VII',
        '+56555555555',
        'Calle Colo Colo 987',
        'Temuco',
        'cleopatra.vii@live.cl',
        '2023-05-29',
        35000
    );

-- C. Ingrese 5 productos.

INSERT INTO
    Productos (
        SKU,
        nombre,
        categoria,
        producto,
        cantidad_stock,
        precio
    )
VALUES (
        'SKU011',
        'Televisor LED',
        'Electrodomésticos',
        'Televisor LED de 50 pulgadas',
        10,
        500000
    ), (
        'SKU012',
        'Refrigerador',
        'Electrodomésticos',
        'Refrigerador de dos puertas',
        5,
        800000
    ), (
        'SKU013',
        'Lavadora',
        'Electrodomésticos',
        'Lavadora de carga frontal',
        8,
        600000
    ), (
        'SKU014',
        'Microondas',
        'Electrodomésticos',
        'Microondas de acero inoxidable',
        12,
        200000
    ), ('SKU015','Licuadora','Electrodomésticos','Licuadora de alta potencia',
        15,
        100000
    );

-- D. Identifique cual es el salario mínimo entre vendedores.

SELECT *
FROM Vendedores
WHERE salario = (
        SELECT MIN(salario)
        FROM Vendedores
    );

-- E. Identifique cual es el salario máximo entre vendedores.

SELECT *
FROM Vendedores
WHERE salario = (
        SELECT MAX(salario)
        FROM Vendedores
    );

-- F. Súmele el salario mínimo identificado al salario de todos los vendedores.

SELECT `Salario` + (
        SELECT MIN(salario)
        FROM Vendedores
    )
FROM Vendedores;

-- G. Elimine el producto más caro del inventario.

CREATE TEMPORARY
TABLE temp_table
SELECT `SKU`
FROM productos
WHERE precio = (
        SELECT MAX(precio)
        FROM productos
    );

DELETE FROM productos
WHERE SKU IN (
        SELECT `SKU`
        FROM temp_table
    );

DROP TEMPORARY TABLE temp_table;

-- H. Cree una tabla que contenga solo los clientes que han pagado más que el promedio.

CREATE TABLE
    promedio_clientes AS
SELECT *
FROM Clientes
WHERE total_pagado > (
        SELECT AVG(total_pagado)
        FROM Clientes
    );

-- I. Actualice los datos de tres productos.

UPDATE Productos SET precio = 20000 WHERE SKU = 'SKU015';

UPDATE Productos SET precio = 20000 WHERE SKU = 'SKU013';

UPDATE Productos SET precio = 20000 WHERE SKU = 'SKU004';

-- J. Actualice los datos de tres vendedores.

UPDATE Vendedores
SET seccion = 'Comerciante'
WHERE RUN = '1234567098';

UPDATE Vendedores
SET seccion = 'Comerciante'
WHERE RUN = '12675897-4';

UPDATE Vendedores
SET seccion = 'Comerciante'
WHERE RUN = '33333333-3';

-- Para probar el codigo(Juan)

select seccion from vendedores;

-- K. Actualice los datos de 1 cliente.

UPDATE Clientes
SET
    nombre = 'Juan',
    apellido = 'Perez',
    correo_electronico = 'juan.perez@live.cl'
WHERE codigo_cliente = 18;

-- L. Seleccione el nombre y el apellido de los vendedores que tienen un salario superior al promedio.

SELECT nombre, apellido
FROM Vendedores
WHERE salario > (
        SELECT AVG(salario)
        FROM Vendedores
    );

-- M. Indique cuál es el cliente con mayor gasto.

SELECT *
FROM Clientes
WHERE total_pagado = (
        SELECT MAX(total_pagado)
        FROM Clientes
    );