-- ======================================================
-- SCRIPT BASE DE DATOS - DISTRIBUIDORA DE BEBIDAS SAN MIGUEL
-- Evidencia GA6-220501096-AA2-EV03
-- ======================================================

CREATE DATABASE distribuidora_bebidas;
USE distribuidora_bebidas;

-- =========================
-- TABLA CLIENTES
-- =========================
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  direccion VARCHAR(80) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  barrio VARCHAR(50) NOT NULL
);

-- =========================
-- TABLA PRODUCTOS
-- =========================
CREATE TABLE productos (
  id_producto INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(60) NOT NULL,
  categoria VARCHAR(40) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL
);

-- =========================
-- TABLA USUARIOS
-- =========================
CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  rol ENUM('Administrador', 'Cajero', 'Domiciliario') NOT NULL,
  usuario VARCHAR(30) UNIQUE NOT NULL,
  contraseña VARCHAR(100) NOT NULL
);

-- =========================
-- TABLA PEDIDOS
-- =========================
CREATE TABLE pedidos (
  id_pedido INT PRIMARY KEY AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  fecha DATETIME NOT NULL,
  estado ENUM('Pendiente','En camino','Entregado') NOT NULL,
  forma_pago ENUM('Efectivo','Transferencia','Datáfono') NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- ===============================
-- TABLA DETALLE DEL PEDIDO
-- ===============================
CREATE TABLE detalle_pedido (
  id_detalle INT PRIMARY KEY AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- =========================
-- TABLA FACTURA
-- =========================
CREATE TABLE factura (
  id_factura INT PRIMARY KEY AUTO_INCREMENT,
  id_pedido INT NOT NULL,
  fecha DATETIME NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

-- ================================================
-- INSERTS OPCIONALES (DATOS DE PRUEBA)
-- ================================================

INSERT INTO clientes(nombre, direccion, telefono, barrio) VALUES
('Juan Pérez','Calle 10 #15-20','3115559874','San Miguel'),
('Laura Torres','Carrera 7 #22-11','3207784455','San Joaquín');

INSERT INTO productos(nombre,categoria,precio,stock) VALUES
('Cerveza Poker 330ml','Cerveza',3200,100),
('Aguardiente Néctar Verde 750ml','Licor',35000,50),
('Gaseosa Coca-Cola 1.5L','Gaseosa',4500,80);

INSERT INTO usuarios(nombre, rol, usuario, contraseña) VALUES
('Admin Principal','Administrador','admin','1234'),
('Cajero No.1','Cajero','cajero1','1234');

