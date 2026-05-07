DROP TABLE IF EXISTS Libros;
CREATE TABLE Libros (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(255),
    Autor VARCHAR(255),
    Año_publicacion INT,
    Genero VARCHAR(100),
    Disponible BOOLEAN
);

INSERT INTO Libros (Titulo, Autor, Año_publicacion, Genero, Disponible) VALUES
("Antes de que se enfrie el cafe", "Toshikazu", 2015, "ficción", TRUE),
("Un detective suelto en el colegio", "Liliana Cinetto", 2011, "Suspenso", TRUE),
("La piel del miedo", "Sebastian Pedrozo", 2010, "miedo", FALSE),
("El misterio de la casa abandonada", "Liliana Cinetto", 2013, "Suspenso", TRUE);
SELECT * FROM Libros;
DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Mail VARCHAR(255),
    Telefono VARCHAR(20)
);
INSERT INTO Clientes (Nombre, Mail, Telefono) VALUES
("Juan Perez", "juanperez@gmail.com", "2314327890"),
("Maria Gomez", "mariagomez@gmail.com", "2314327891"),
("Carlos Sanchez", "carlossanchez@gmail.com", "2314327892");

SELECT * FROM Clientes;
DROP TABLE IF EXISTS Prestamos;
CREATE TABLE Prestamos (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Libro_id INT,
    Cliente_id INT,
    Fecha_prestamo DATE,
    Fecha_devolucion DATE,
    FOREIGN KEY (Libro_id) REFERENCES Libros(ID),
    FOREIGN KEY (Cliente_id) REFERENCES Clientes(ID)
);
INSERT INTO Prestamos (Libro_id, Cliente_id, Fecha_prestamo, Fecha_devolucion) VALUES
(1, 1, '2024-01-01', '2024-01-15'),
(2, 2, '2024-01-05', '2024-01-20'),
(4, 3, '2024-01-10', '2024-01-25');
SELECT * FROM Prestamos;

CREATE TABLE Categorias (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100)
);

INSERT INTO Categorias (Nombre) VALUES
("Ficción"),
("Suspenso"),
("Miedo");
SELECT * FROM Categorias;
DROP TABLE IF EXISTS Libro_categoria;
CREATE TABLE Libro_categoria (
    Libro_id INT,
    Categoria_id INT,
    PRIMARY KEY (Libro_id, Categoria_id),
    FOREIGN KEY (Libro_id) REFERENCES Libros(ID),
    FOREIGN KEY (Categoria_id) REFERENCES Categorias(ID)
);

INSERT INTO Libro_categoria (Libro_id, Categoria_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2);

CREATE TABLE Autores (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Biografia TEXT
);
INSERT INTO Autores (Nombre, Biografia) VALUES
("Toshikazu", "Toshikazu es un autor japonés conocido por sus novelas de ficción que exploran temas de amor y vida cotidiana."),
("Liliana Cinetto", "Liliana Cinetto es una escritora argentina especializada en literatura de suspenso, con varias novelas publicadas."),
("Sebastian Pedrozo", "Sebastian Pedrozo es un autor argentino reconocido por sus obras de terror y misterio, con una carrera literaria destacada.");
SELECT * FROM Autores;
DROP TABLE IF EXISTS Libro_autor;
CREATE TABLE Libro_autor (
    Libro_id INT,
    Autor_id INT,
    PRIMARY KEY (Libro_id, Autor_id),
    FOREIGN KEY (Libro_id) REFERENCES Libros(ID),
    FOREIGN KEY (Autor_id) REFERENCES Autores(ID)
);
INSERT INTO Libro_autor (Libro_id, Autor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2);
SELECT * FROM Libro_autor;
DROP TABLE IF EXISTS Clientes_prestamos;
CREATE TABLE Clientes_prestamos (
    Cliente_id INT,
    Prestamo_id INT,
    PRIMARY KEY (Cliente_id, Prestamo_id),
    FOREIGN KEY (Cliente_id) REFERENCES Clientes(ID),
    FOREIGN KEY (Prestamo_id) REFERENCES Prestamos(ID)
);
INSERT INTO Clientes_prestamos (Cliente_id, Prestamo_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4);
SELECT * FROM Clientes_prestamos;