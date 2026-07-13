create database FUNVENTANA
use FUNVENTANA

-- Crear tabla Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Ciudad NVARCHAR(100)
);

-- Crear tabla Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Precio DECIMAL(10, 2)
);

-- Crear tabla Pedidos
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    ProductoID INT,
    Fecha DATE,
    Cantidad INT,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);








-- Insertar registros en las tablas Clientes, Productos y Pedidos
INSERT INTO Clientes (ClienteID, Nombre, Ciudad)
VALUES 
(1, 'Juan Pérez', 'Madrid'),
(2, 'Ana Gómez', 'Barcelona'),
(3, 'Carlos López', 'Sevilla'),
(4, 'Marta Ruiz', 'Valencia'),
(5, 'José Fernández', 'Madrid'),
(6, 'Laura Martínez', 'Barcelona'),
(7, 'Pedro Sánchez', 'Sevilla'),
(8, 'Isabel Torres', 'Valencia'),
(9, 'Antonio García', 'Madrid'),
(10, 'Sofía López', 'Barcelona');

INSERT INTO Productos (ProductoID, Nombre, Precio)
VALUES 
(1, 'Camiseta', 20.50),
(2, 'Pantalón', 35.75),
(3, 'Zapatos', 50.30),
(4, 'Chaqueta', 45.00),
(5, 'Sombrero', 15.40),
(6, 'Bufanda', 12.90),
(7, 'Guantes', 18.20),
(8, 'Mochila', 25.60),
(9, 'Gafas de sol', 30.10),
(10, 'Reloj', 100.00);

INSERT INTO Pedidos (PedidoID, ClienteID, ProductoID, Fecha, Cantidad)
VALUES 
(1, 1, 3, '2025-03-01', 2),
(2, 2, 5, '2025-03-02', 1),
(3, 3, 6, '2025-03-03', 3),
(4, 4, 7, '2025-03-04', 2),
(5, 5, 8, '2025-03-05', 1),
(6, 6, 9, '2025-03-06', 1),
(7, 7, 1, '2025-03-07', 5),
(8, 8, 2, '2025-03-08', 3),
(9, 9, 4, '2025-03-09', 1),
(10, 10, 10, '2025-03-10', 1);


-- row_number   ----coloca posiciones a productos

SELECT * FROM Productos

SELECT 
    ROW_NUMBER() OVER(ORDER BY PRECIO DESC) AS ROWNUMBER,
    NOMBRE,
    PRECIO
FROM Productos

UPDATE Productos
    sET Precio=35.75
    WHERE ProductoID=8


-- USO RANK
SELECT 
    RANK () OVER(ORDER BY PRECIO DESC) AS RANK,
    NOMBRE,
    PRECIO
FROM Productos

--DENSE_RANK
SELECT 
    DENSE_RANK () OVER(ORDER BY PRECIO DESC) AS DENSERANK,
    NOMBRE,
    PRECIO
FROM Productos

 SELECT 
    ROW_NUMBER() OVER(ORDER BY PRECIO DESC) AS ROWNUMBER,
    RANK () OVER(ORDER BY PRECIO DESC) AS RANK,
    DENSE_RANK () OVER(ORDER BY PRECIO DESC) AS DENSERANK,
    NOMBRE,
    PRECIO
FROM Productos