USE Biblioteca;

-- Categorías
INSERT INTO Categorias (id_categoria, nombre_categoria, descripcion) VALUES
(1, 'Ficción', 'Obras literarias de ficción, novelas y cuentos'),
(2, 'Misterio', 'Novelas policiales y de suspenso'),
(3, 'Ciencia Ficción', 'Obras de ciencia ficción y fantasía'),
(4, 'Historia', 'Libros de historia y biografías históricas'),
(5, 'Biografías', 'Biografías de personalidades destacadas'),
(6, 'Ciencia', 'Libros científicos y divulgación científica'),
(7, 'Arte', 'Libros sobre arte, pintura y cultura');

-- Autores
INSERT INTO Autores (id_autor, nombre_completo, fecha_nacimiento, nacionalidad, biografia) VALUES
(1, 'Gabriel García Márquez', '1927-03-06', 'Colombiana', 'Escritor colombiano, Premio Nobel de Literatura 1982'),
(2, 'Isabel Allende', '1942-08-02', 'Chilena', 'Escritora chilena, una de las novelistas más leídas del mundo'),
(3, 'Stephen King', '1947-09-21', 'Estadounidense', 'Maestro del terror y suspense contemporáneo'),
(4, 'Agatha Christie', '1890-09-15', 'Británica', 'Escritora británica, reina del misterio'),
(5, 'Isaac Asimov', '1920-01-02', 'Estadounidense', 'Escritor de ciencia ficción y divulgador científico'),
(6, 'Mario Vargas Llosa', '1936-03-28', 'Peruana', 'Escritor peruano, Premio Nobel de Literatura 2010'),
(7, 'Carl Sagan', '1934-11-09', 'Estadounidense', 'Astrónomo y divulgador científico'),
(8, 'Leonardo da Vinci', '1452-04-15', 'Italiana', 'Genio del Renacimiento, artista e inventor');

-- Libros
INSERT INTO Libros (isbn, titulo, año_publicacion, numero_paginas, ejemplares_disponibles) VALUES
('978-0-06-088328-7', 'Cien años de soledad', 1967, 417, 3),
('978-0-525-43534-3', 'La casa de los espíritus', 1982, 433, 2),
('978-0-385-12167-9', 'El resplandor', 1977, 447, 4),
('978-0-06-207350-4', 'Asesinato en el Orient Express', 1934, 256, 2),
('978-0-553-29337-0', 'Fundación', 1951, 244, 3),
('978-84-204-8252-8', 'La ciudad y los perros', 1963, 413, 2),
('978-0-345-33135-0', 'Cosmos', 1980, 365, 2),
('978-0-307-27779-6', 'IT (Eso)', 1986, 1138, 1),
('978-0-06-112241-5', 'Paula', 1994, 330, 3),
('978-0-553-38326-9', 'Yo, Robot', 1950, 253, 2);

-- Libros_Autores
INSERT INTO Libros_Autores (isbn, id_autor) VALUES
('978-0-06-088328-7', 1),
('978-0-525-43534-3', 2),
('978-0-385-12167-9', 3),
('978-0-06-207350-4', 4),
('978-0-553-29337-0', 5),
('978-84-204-8252-8', 6),
('978-0-345-33135-0', 7),
('978-0-307-27779-6', 3),
('978-0-06-112241-5', 2),
('978-0-553-38326-9', 5);

-- Libros_Categorias
INSERT INTO Libros_Categorias (isbn, id_categoria) VALUES
('978-0-06-088328-7', 1),
('978-0-525-43534-3', 1),
('978-0-385-12167-9', 2),
('978-0-385-12167-9', 3),
('978-0-06-207350-4', 2),
('978-0-553-29337-0', 3),
('978-84-204-8252-8', 1),
('978-0-345-33135-0', 6),
('978-0-307-27779-6', 2),
('978-0-307-27779-6', 3),
('978-0-06-112241-5', 5),
('978-0-553-38326-9', 3);

-- Socios
INSERT INTO Socios (numero_socio, nombre_completo, direccion, telefono, email, fecha_inscripcion, estado) VALUES
(1001, 'María González Pérez', 'Av. Libertador 1234, Montevideo', '099123456', 'maria.gonzalez@email.com', '2023-01-15', 'Activo'),
(1002, 'Carlos Rodríguez López', 'Calle 18 de Julio 567, Montevideo', '098765432', 'carlos.rodriguez@email.com', '2023-02-20', 'Activo'),
(1003, 'Ana Martínez Silva', 'Bvar. Artigas 890, Montevideo', '097111222', 'ana.martinez@email.com', '2022-11-10', 'Activo'),
(1004, 'Luis Fernández Castro', 'Av. Italia 2345, Montevideo', '096333444', 'luis.fernandez@email.com', '2023-03-05', 'Activo'),
(1005, 'Carmen Díaz Morales', 'Calle Colonia 678, Montevideo', '095555666', 'carmen.diaz@email.com', '2022-08-22', 'Inactivo'),
(1006, 'Roberto Sánchez Vega', 'Av. Brasil 1567, Montevideo', '094777888', 'roberto.sanchez@email.com', '2023-04-12', 'Activo');

-- Empleados
INSERT INTO Empleados (id_empleado, nombre_completo, cargo, fecha_contratacion, salario) VALUES
(101, 'Patricia Álvarez Ruiz', 'Bibliotecario', '2020-03-01', 45000.00),
(102, 'Miguel Torres Gómez', 'Asistente', '2021-07-15', 32000.00),
(103, 'Laura Mendoza Cruz', 'Administrador', '2019-01-10', 55000.00),
(104, 'Diego Ramírez Flores', 'Bibliotecario', '2022-05-20', 43000.00),
(105, 'Sandra López Herrera', 'Asistente', '2023-02-01', 30000.00);

-- Préstamos
INSERT INTO Prestamos (numero_prestamo, numero_socio, id_empleado, fecha_prestamo, fecha_devolucion_prevista, fecha_devolucion_real, dias_retraso) VALUES
(2001, 1001, 101, '2024-05-01', '2024-05-16', '2024-05-15', 0),
(2002, 1002, 102, '2024-05-03', '2024-05-18', NULL, NULL),
(2003, 1003, 101, '2024-05-05', '2024-05-20', '2024-05-22', 2),
(2004, 1001, 103, '2024-05-10', '2024-05-25', NULL, NULL),
(2005, 1004, 104, '2024-05-12', '2024-05-27', '2024-05-26', 0),
(2006, 1006, 102, '2024-05-15', '2024-05-30', NULL, NULL),
(2007, 1002, 105, '2024-05-20', '2024-06-04', '2024-06-07', 3);

-- Detalle_Prestamos
INSERT INTO Detalle_Prestamos (numero_prestamo, isbn) VALUES
(2001, '978-0-06-088328-7'),
(2001, '978-0-525-43534-3'),
(2002, '978-0-385-12167-9'),
(2003, '978-0-06-207350-4'),
(2003, '978-0-553-29337-0'),
(2004, '978-84-204-8252-8'),
(2005, '978-0-345-33135-0'),
(2005, '978-0-06-112241-5'),
(2006, '978-0-307-27779-6'),
(2007, '978-0-553-38326-9');