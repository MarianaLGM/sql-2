/* RELACIÓN TIPO 1:1 */
-- PASO 1
-- Tu código aquí
CREATE TABLE test.ussers(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT
);

INSERT INTO ussers (nombre, apellido, email, edad) VALUES
('Juan', 'Gomez', 'juan.gomez@example.com', 28),
('Maria', 'Lopez', 'maria.lopez@example.com', 32),
('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 25),
('Laura', 'Fernandez', 'laura.fernandez@example.com', 30),
('Pedro', 'Martinez', 'pedro.martinez@example.com', 22),
('Ana', 'Hernandez', 'ana.hernandez@example.com', 35),
('Miguel', 'Perez', 'miguel.perez@example.com', 28),
('Sofia', 'Garcia', 'sofia.garcia@example.com', 26),
('Javier', 'Diaz', 'javier.diaz@example.com', 31),
('Luis', 'Sanchez', 'luis.sanchez@example.com', 27),
('Elena', 'Moreno', 'elena.moreno@example.com', 29),
('Daniel', 'Romero', 'daniel.romero@example.com', 33),
('Paula', 'Torres', 'paula.torres@example.com', 24),
('Alejandro', 'Ruiz', 'alejandro.ruiz@example.com', 28),
('Carmen', 'Vega', 'carmen.vega@example.com', 29),
('Adrian', 'Molina', 'adrian.molina@example.com', 34),
('Isabel', 'Gutierrez', 'isabel.gutierrez@example.com', 26),
('Hector', 'Ortega', 'hector.ortega@example.com', 30),
('Raquel', 'Serrano', 'raquel.serrano@example.com', 32),
('Alberto', 'Reyes', 'alberto.reyes@example.com', 28);

-- PASO 2
-- Tu código aquí
CREATE TABLE test.roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY, 
    nombre_rol VARCHAR(50) NOT NULL
);

INSERT INTO test.roles (nombre_rol) VALUES
('Bronce'),
('Plata'),
('Oro'),
('Platino');

-- PASO 3
-- Tu código aquí
ALTER TABLE test.ussers ADD COLUMN id_rol INT

--Añade la columna `id_rol` a ussers. Rellena cada rol con números asociados a la tabla de `roles` 

--Crea la clave foránea (FOREIGN)
ALTER TABLE test.ussers ADD FOREIGN KEY (id_rol) REFERENCES test.roles(id_rol);

UPDATE test.ussers SET id_rol = 1 WHERE id_usuario= 1;
UPDATE test.ussers SET id_rol = 2 WHERE id_usuario= 2;
UPDATE test.ussers SET id_rol = 3 WHERE id_usuario= 3;
UPDATE test.ussers SET id_rol = 4 WHERE id_usuario= 4;
UPDATE test.ussers SET id_rol = 1 WHERE id_usuario= 5;
UPDATE test.ussers SET id_rol = 2 WHERE id_usuario= 6;
UPDATE test.ussers SET id_rol = 3 WHERE id_usuario= 7;
UPDATE test.ussers SET id_rol = 4 WHERE id_usuario= 8;
UPDATE test.ussers SET id_rol = 1 WHERE id_usuario= 9;
UPDATE test.ussers SET id_rol = 2 WHERE id_usuario= 10;
UPDATE test.ussers SET id_rol = 3 WHERE id_usuario= 11;
UPDATE test.ussers SET id_rol = 4 WHERE id_usuario= 12;
UPDATE test.ussers SET id_rol = 1 WHERE id_usuario= 13;
UPDATE test.ussers SET id_rol = 2 WHERE id_usuario= 14;
UPDATE test.ussers SET id_rol = 3 WHERE id_usuario= 15;
UPDATE test.ussers SET id_rol = 4 WHERE id_usuario= 16;
UPDATE test.ussers SET id_rol = 1 WHERE id_usuario= 17;
UPDATE test.ussers SET id_rol = 2 WHERE id_usuario= 18;
UPDATE test.ussers SET id_rol = 3 WHERE id_usuario= 19;
UPDATE test.ussers SET id_rol = 4 WHERE id_usuario= 20;


-- PASO 4
-- Tu código aquí

SELECT ussers.id_usuario, ussers.nombre, ussers.apellido, ussers.email, ussers.edad, roles.nombre_rol
FROM test.ussers
JOIN test.roles ON ussers.id_rol = roles.id_rol;


/* RELACIÓN TIPO 1:N */
-- PASO 1
-- Tu código aquí
CREATE TABLE test.categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

INSERT INTO test.categorias (nombre_categoria) VALUES
('Electrónicos'),
('Ropa y Accesorios'),
('Libros'),
('Hogar y Cocina'),
('Deportes y aire libre'),
('Salud y cuidado personal'),
('Herramientas y mejoras para el hogar'),
('Juguetes y juegos'),
('Automotriz'),
('Música y Películas');

-- PASO 2
-- Tu código aquí
ALTER TABLE test.ussers ADD COLUMN id_categoria INT

-- PASO 3
-- Tu código aquí

UPDATE test.ussers SET id_categoria = 1 WHERE id_usuario IN (1,2,3);
UPDATE test.ussers SET id_categoria = 2 WHERE id_usuario IN (4,5,6);
UPDATE test.ussers SET id_categoria = 3 WHERE id_usuario IN (7,8);
UPDATE test.ussers SET id_categoria = 4 WHERE id_usuario IN (9,10);
UPDATE test.ussers SET id_categoria = 5 WHERE id_usuario IN (11,12);
UPDATE test.ussers SET id_categoria = 6 WHERE id_usuario IN (13,14);
UPDATE test.ussers SET id_categoria = 7 WHERE id_usuario IN (15,16);
UPDATE test.ussers SET id_categoria = 8 WHERE id_usuario IN (17,18);
UPDATE test.ussers SET id_categoria = 9 WHERE id_usuario IN (19)
UPDATE test.ussers SET id_categoria = 10 WHERE id_usuario IN (20);

-- PASO 4
-- Tu código aquí
SELECT 
    ussers.id_usuario,
    ussers.nombre, 
    ussers.apellido, 
    ussers.email, 
    ussers.edad, 
    roles.nombre_rol, 
    categorias.nombre_categoria
FROM test.ussers
JOIN test.categorias ON ussers.id_categoria = categorias.id_categoria
JOIN test.roles ON ussers.id_rol = roles.id_rol;

/* RELACIÓN TIPO N:M */
-- PASO 1
-- Tu código aquí
CREATE TABLE test.ussers_categorias(
    id_usuario_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_categoria INT
);

--Añadiremos dentro de la creación de la tabla intermedia dos claves foráneas.
ALTER TABLE test.ussers_categorias ADD FOREIGN KEY (id_usuario) REFERENCES ussers(id_usuario);--Una que haga referencia el `id_usaurio` de la tabla intermedia con el `id_usuario` de `usuarios`
ALTER TABLE test.ussers_categorias ADD FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria); -- Una que haga referencia el `id_categoría` de la tabla intermedia con el `id_categoria` de `categorías`

-- PASO 2
-- Tu código aquí
INSERT INTO test.ussers_categorias (id_usuario, id_categoria) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 6), (3, 7),
(4, 8), (4, 9), (4, 10);

INSERT INTO Autores (AutorID, Nombre, Nacionalidad) VALUES (1, 'Gabriel García Márquez', 'Colombiana');
INSERT INTO Libros (LibroID, Titulo, AñoPublicacion) VALUES (1, 'Cien años de soledad', 1967);
-- Establecer la relación entre García Márquez y 'Cien años de soledad'
INSERT INTO LibrosAutores (AutorID, LibroID) VALUES (1, 1);


-- PASO 3
-- Tu código aquí

SELECT 
    ussers.id_usuario,
    ussers.nombre, 
    ussers.apellido, 
    ussers.email, 
    ussers.edad,
    roles.nombre_rol, 
    categorias.nombre_categoria
FROM test.ussers
JOIN test.ussers_categorias ON ussers.id_rol = ussers_categorias.id_usuario
JOIN test.ussers_categorias ON ussers.id_categoria = ussers_categorias.id_categoria

SELECT 
    ussers.id_usuario,
    ussers.nombre, 
    ussers.apellido, 
    ussers.email, 
    ussers.edad, 
    roles.nombre_rol, 
    categorias.nombre_categoria
FROM test.ussers_categorias
JOIN test.categorias ON ussers.id_categoria = categorias.id_categoria
JOIN test.roles ON ussers.id_rol = roles.id_rol;
