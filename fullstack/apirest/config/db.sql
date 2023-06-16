-- Active: 1685022170860@@127.0.0.1@3306
CREATE DATABASE alquilartemis;
    DEFAULT CHARACTER SET = 'utf8mb4';

use alquilartemis;

CREATE TABLE empleados(
  id_empleado INT PRIMARY KEY AUTO_INCREMENT,
  nombres VARCHAR(255) NOT NULL,
  direccion VARCHAR(255) NOT NULL,
  telefono INT NOT NULL,
  email VARCHAR(255) NOT NULL
);

INSERT INTO empleados(id_empleado, nombres, direccion, telefono, email)
VALUES
(1, 'Sebastian Alvarado Martínez', 'Cra 27 #45-21', 31542678, 'sebastian@gmail.com'),
(2, 'Ana María Suárez', 'Calle 31 #21-56', 31542312, 'maria@gmail.com'),
(3, 'Fabian Torres Alba', 'Avenida 21 #21-56', 31541454, 'fabian@gmail.com');

CREATE TABLE clientes(
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  ubicacion VARCHAR(255) NOT NULL,
  telefono INT NOT NULL,
  email VARCHAR(255) NOT NULL
);

INSERT INTO clientes(id_cliente, nombre, ubicacion, telefono, email)
VALUES
(1, 'ConstruSoluciones', 'Bogotá, Cundinamarca', 6657412, 'construsoluciones@gmail.com'),
(2, 'Constructora ArqTech', 'Pereira, Quindio', 6632145, 'arqtech@gmail.com'),
(3, 'Edificaciones Prime', 'Pasto, Nariño', 6618754, 'prime@gmail.com'),
(4, 'Proyectos Construcción', 'Piedecuesta, Santander', 6621547, 'proyectos@gmail.com'),
(5, 'ConstruLideres', 'Riohacha, Guajira', 6231563, 'construlideres@gmail.com');

CREATE TABLE obras(
  id_obra INTEGER PRIMARY KEY
);

CREATE TABLE productos(
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  stock_inicial INT NOT NULL,
  cantidad_ingresos INT NOT NULL,
  cantidad_salidas INT NOT NULL,
  stock_final INT NOT NULL,
  fecha_inventario DATE NOT NULL,
  tipo_operacion VARCHAR(255) NOT NULL
);

INSERT INTO productos(id_producto, nombre, stock_inicial, cantidad_ingresos, cantidad_salidas, stock_final, fecha_inventario, tipo_operacion)
VALUES
(1, 'Cementos Portland', 500,1, 1, 500, '2023-06-16', 'Compra'),
(2, 'Ladrillos', 5000,1, 1, 5000, '2023-06-16', 'Salida'),
(3, 'Pintura blanca (galón)', 350,1, 1, 350, '2023-06-16', 'Devolución'),
(4, 'Tubería PVC', 60,1, 1, 60, '2023-06-16', 'DAÑO'),
(5, 'Herramientas de mano', 50, 10, 5, 55, '2023-06-01', 'Compra');

CREATE TABLE salida(
  id_salida INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  fecha_salida DATE NOT NULL,
  hora_salida TIME NOT NULL,
  subtotal_peso FLOAT NOT NULL,
  placa_transporte VARCHAR(255) NOT NULL,
  observaciones VARCHAR(255) NOT NULL,
  id_empleado INT NOT NULL,
  REFERENCE (id_cliente) REFERENCES clientes(id_cliente),
  REFERENCE (id_empleado) REFERENCES empleados(id_empleado),
);

CREATE TABLE salida_detalle(
  id_salida_detalle INT PRIMARY KEY AUTO_INCREMENT,
  id_salida INT NOT NULL,
  id_obra INT NOT NULL,
  id_empleado INT NOT NULL,
  cantidad_salida INT NOT NULL,
  cantidad_propia INT NOT NULL,
  cantidad_subalquilada INT NOT NULL,
  valor_unidad FLOAT NOT NULL,
  fecha_standBye DATE NOT NULL,
  estado VARCHAR(255) NOT NULL,
  valor_total FLOAT NOT NULL
  REFERENCE (id_salida) REFERENCES salida(id_salida),
  REFERENCE (id_obra) REFERENCES obras(id_obra),
  REFERENCE (id_empleado) REFERENCES empleados(id_empleado)
);