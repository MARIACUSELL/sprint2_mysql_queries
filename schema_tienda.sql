DROP DATABASE IF EXISTS tienda;

CREATE DATABASE tienda CHARACTER SET utf8mb4;

USE tienda;

CREATE TABLE fabricante (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
    codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DOUBLE NOT NULL,
    codigo_fabricante INT UNSIGNED NOT NULL,
    FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');

INSERT INTO fabricante VALUES(2, 'Lenovo');

INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');

INSERT INTO fabricante VALUES(4, 'Samsung');

INSERT INTO fabricante VALUES(5, 'Seagate');

INSERT INTO fabricante VALUES(6, 'Crucial');

INSERT INTO fabricante VALUES(7, 'Gigabyte');

INSERT INTO fabricante VALUES(8, 'Huawei');

INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);

INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);

INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);

INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);

INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);

INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);

INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);

INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);

INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);

INSERT INTO
    producto
VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);

INSERT INTO
    producto
VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- QUERIES:

-- 1.Llista el nom de tots els productos que hi ha en la taula producto.

SELECT nombre FROM producto;

-- 2.Llista els noms i els preus de tots els productos de la taula producto.

SELECT nombre, precio FROM producto;

-- 3.Llista totes les columnes de la taula producto.

SELECT * FROM producto;

-- 4.Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).

SELECT
    nombre,
    precio,
    TRUNCATE((precio * 1.4), 2) AS 'precio en USD'
FROM
    producto;

-- 5.Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).Utilitza els seg ü ents à lies per a les columnes: nom de producto,euros,dolars.

SELECT
    nombre AS 'nom del producto',
    precio AS 'euros',
    TRUNCATE((precio * 1.04), 2) AS 'dolars'
FROM
    producto;

-- 6.Llista els noms i els preus de tots els productos de la taula producto,convertint els noms a maj ú scula.

SELECT
    UPPER(nombre) AS 'NOMBRE DEL PRODUCTO',
    UPPER(precio) AS 'EUROS'
FROM
    producto;

-- 7.Llista els noms i els preus de tots els productos de la taula producto,convertint els noms a minúscula.

SELECT
    LOWER(nombre) AS 'nombre del producto',
    LOWER(precio) AS 'euros'
FROM
    producto;

-- 8.Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.

SELECT nombre, LEFT(UPPER(nombre), 2) FROM FABRICANTE;

-- 9.Llista els noms i els preus de tots els productos de la taula producto,arrodonint el valor del preu.

SELECT
    nombre AS 'NOMBRE DEL PRODUCTO',
    ROUND(precio) AS 'EUROS'
FROM
    producto;

-- 10.Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar - lo sense cap xifra decimal.

SELECT
    nombre AS 'NOMBRE DEL PRODUCTO',
    TRUNCATE(precio, 0) AS 'EUROS'
FROM
    producto;

-- 11.Llista el codi dels fabricants que tenen productos en la taula producto.

SELECT
    fabricante.codigo
FROM
    fabricante
    INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 12.Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.

SELECT
    DISTINCT fabricante.codigo
FROM
    fabricante
    INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 13.Llista els noms dels fabricants ordenats de manera ascendent.

SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14.Llista els noms dels fabricants ordenats de manera descendent.

SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15.Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.

SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;

-- 16.Retorna una llista amb les 5 primeres files de la taula fabricante.

SELECT * FROM fabricante LIMIT 5;

-- 17.Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.

SELECT * FROM fabricante WHERE codigo BETWEEN 4 AND 5;

-- 18.Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY

SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19.Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.

SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20.Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.

SELECT
    producto.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.c ó digo_fabricante
WHERE
    fabricante.codigo = 2;

-- 21.Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.

SELECT
    producto.nombre,
    producto.precio,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22.Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.

SELECT
    producto.nombre,
    producto.precio,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY
    fabricante.nombre ASC;

-- 23.Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.

SELECT
    producto.codigo,
    producto.nombre,
    fabricante.codigo,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante;

-- 24.Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.

SELECT
    producto.nombre,
    producto.precio,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY
    producto.precio ASC
LIMIT
    1;

-- 25.Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.

SELECT
    producto.nombre,
    producto.precio,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
ORDER BY
    producto.precio DESC
LIMIT
    1;

-- 26. Retorna una llista de tots els productes del fabricador Lenovo.

SELECT
    producto.nombre,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre LIKE "Lenovo";

-- 27. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.

SELECT
    producto.nombre,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre LIKE "Crucial"
    AND producto.precio > 200;

-- 28. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.

SELECT
    producto.nombre,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre LIKE "Asus"
    OR fabricante.nombre LIKE "Hewlett-Packard"
    OR fabricante.nombre LIKE "Seagate";

-- 29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Utilitzant l'operador IN.

SELECT
    producto.nombre,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre IN("Asus", "Hewlett-Packard", "Seagate");

-- 30. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.

SELECT
    producto.nombre,
    producto.precio,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre LIKE '%e';

-- 31. Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.

SELECT
    producto.nombre,
    producto.precio,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre LIKE '%w%';

-- 32. Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)

SELECT
    producro.nombre,
    producto.precio,
    fabricante.nombre
FROM
    producto
    INNER JOIN fabricante ON abricante.codigo = producto.codigo_fabricante
WHERE
    producto.precio >= 180
ORDER BY
    producto.precio DESC,
    producto.nombre ASC;

-- 33. Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.

SELECT
    DISTINCT fabricante.codigo,
    fabricante.nombre
FROM
    fabricante
    INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.

SELECT
    fabricante.nombre,
    producto.nombre
FROM
    fabricante
    LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 35. Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.

SELECT
    fabricante.nombre,
    producto.nombre
FROM
    fabricante
    LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante
WHERE
    producto.nombre IS NULL;

-- 36. Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).

SELECT
    *
FROM
    producto
WHERE
    codigo_fabricante = (
        SELECT
            codigo
        FROM
            fabricante
        WHERE
            nombre LIKE 'Lenovo'
    );

-- 37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).

SELECT
    *
FROM
    producto
WHERE
    producto.precio = (
        SELECT
            max(producto.precio)
        FROM
            producto
        WHERE
            producto.codigo_fabricante = (
                SELECT
                    fabricante.codigo
                FROM
                    fabricante
                WHERE
                    fabricante.nombre LIKE 'Lenovo'
            )
    );

-- 38. Llista el nom del producte més car del fabricador Lenovo.

SELECT
    producto.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre LIKE 'Lenovo'
ORDER BY
    producto.precio DESC
LIMIT
    1;

-- 39. Llista el nom del producte més barat del fabricant Hewlett-Packard.

SELECT
    producto.nombre
FROM
    producto
    INNER JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
WHERE
    fabricante.nombre LIKE 'Hewlett-Packard'
ORDER BY
    producto.precio ASC
LIMIT
    1;

-- 40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.

SELECT
    producto.codigo,
    producto.nombre,
    producto.precio
FROM
    producto
WHERE
    producto.precio >= (
        SELECT
            producto.precio
        FROM
            producto
            LEFT JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante
        WHERE
            fabricante.nombre LIKE 'Lenovo'
        ORDER BY
            producto.precio DESC
        LIMIT
            1
    );

-- 41. Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.

SELECT
    *
FROM
    producto
WHERE
    codigo_fabricante = (
        SELECT
            fabricante.codigo
        FROM
            fabricante
        WHERE
            fabricante.nombre LIKE 'Asus'
    )
    AND producto.precio >= (
        SELECT
            avg(producto.precio)
        FROM
            producto
        WHERE
            producto.codigo_fabricante = (
                SELECT
                    fabricante.codigo
                FROM
                    fabricante
                WHERE
                    fabricante.nombre LIKE 'Asus'
            )
    );