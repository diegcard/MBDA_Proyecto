/*----------Tablas----------*/
/*
Comentarios:
Total de Tablas: 14
Total de Atributos: 69
*/
-- Color Azul


CREATE TABLE Personas(
    idPersona NUMBER(11) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    apellidos VARCHAR2(20) NOT NULL,
    identificacion NUMBER(20) NOT NULL,
    tipoIdentificacion CHAR(5) NOT NULL,
    dirrecion VARCHAR2(50) NULL,
    correoElectronico VARCHAR2(50) NOT NULL
);

CREATE TABLE telefonosPersona(
    idPersona NUMBER(11) NOT NULL,
    telefono NUMBER(11) NOT NULL
);

CREATE TABLE Clientes(
    idPersona NUMBER(11) NOT NULL,
    ocupacion VARCHAR2(20) NULL,
    ingresos NUMBER(20,2) NULL, 
    historialCredito NUMBER(10) NULL
);

CREATE TABLE Empleados(
    idPersona NUMBER(11) NOT NULL,
    sexo CHAR(1) NULL,
    etadoCivil CHAR(1) NULL,
    cargo VARCHAR2(15) NOT NULL,
    salario NUMBER(20,2) NOT NULL
);

-- Color Verde

CREATE TABLE Ventas(
    idVenta NUMBER(20) NOT NULL,
    idEmpleado NUMBER(11) NULL,
    idCliente NUMBER(11) NULL,
    fechaVenta DATE NOT NULL,
    horaVenta TIMESTAMP NOT NULL,
    totalVenta NUMBER(20,2) NULL,
    descripcionVenta VARCHAR2(200) NULL
);

CREATE TABLE DetallesVentas(
    idDetalleVenta NUMBER(20) NOT NULL,
    idVenta NUMBER(20) NOT NULL,
    idProducto VARCHAR2(10) NULL,
    cantidad NUMBER(20) NULL,
    precioUnitario NUMBER(20,2) NULL,
    precioTotal NUMBER(20,2) NULL
);

-- Color Naranja

CREATE TABLE Productos(
    idProducto VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    precio NUMBER(20,2) NOT NULL,
    cantidadEnStock NUMBER(10) NOT NULL,
    tipoProducto CHAR(1) NOT NULL
);

CREATE TABLE Repuestos(
    idProducto VARCHAR2(10) NOT NULL,
    tipo VARCHAR2(20) NULL,
    descripcion VARCHAR2(200) NULL
);

CREATE TABLE Motos(
    idProducto VARCHAR2(10) NOT NULL,
    marca VARCHAR2(20) NULL,
    modelo VARCHAR2(20) NOT NULL,
    anio DATE NULL,
    color VARCHAR2(100) NOT NULL,
    cilindraje NUMBER(4) NOT NULL,
    descripcion VARCHAR2(200) NULL
);

CREATE TABLE Accesorios(
    idProducto VARCHAR2(10) NOT NULL,
    descripcion VARCHAR(200) NULL
);

-- Color Morado

CREATE TABLE DetallesCompras(
    idDetalleCompra NUMBER(10) NOT NULL,
    idCompra NUMBER(20) NOT NULL,
    idProducto VARCHAR2(10) NOT NULL,
    cantidad NUMBER(3) NOT NULL,
    precioUnitario NUMBER(20,2) NOT NULL,
    subtotal NUMBER(20,2) NULL
);

CREATE TABLE Compras(
    idCompra NUMBER(20) NOT NULL,
    idProveedor VARCHAR2(10) NULL,
    idEmpleado NUMBER(11) NULL,
    fecha DATE NOT NULL,
    totalCompra NUMBER(20,2) NULL,
    estadoCompra CHAR(1) NOT NULL,
    descripcionCompra VARCHAR2(200) NULL
);

CREATE TABLE Proveedores(
    idProveedor VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(50) NOT NULL,
    direccion VARCHAR(100) NULL,
    correoElectronico VARCHAR(50) NOT NULL,
    informacionContacto VARCHAR(200) NULL
);

CREATE TABLE telefonosProveedores(
    idProveedor VARCHAR2(10) NOT NULL,
    telefono NUMBER(10) NOT NULL
);