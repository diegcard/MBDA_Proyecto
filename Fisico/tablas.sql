-- Tipos de datos
CREATE DOMAIN TId AS CHAR(3);
CREATE DOMAIN ECivil AS CHAR(1);
CREATE DOMAIN Money AS NUMBER(20,2);
CREATE DOMAIN tProd AS CHAR(1);

/*----------Tablas----------*/

-- Color Azul

CREATE TABLE Personas(
    idPersona NUMBER(11) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    apellidos VARCHAR2(20) NOT NULL,
    identificacion NUMBER(20) NOT NULL,
    tipoIdentificacion TId NOT NULL,
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
    ingresos Money NULL, 
    historialCredito NUMBER(10) NULL
);

CREATE TABLE Empleados(
    idPersona NUMBER(11) NOT NULL,
    sexo CHAR(1) NULL,
    etadoCivil ECivil NOT NULL,
    cargo VARCHAR2(15) NOT NULL,
    salario Money NOT NULL
);

-- Color Verde

CREATE TABLE Ventas(
    idVenta VARCHAR2(20) NOT NULL,
    idEmpleado NUMBER(11) NOT NULL,
    idCliente NUMBER(11) NOT NULL,
    fechaVenta DATE NOT NULL,
    horaVenta TIMESTAMP NOT NULL,
    totalVenta Money NOT NULL
    descripcionVenta VARCHAR2 NULL
);

CREATE TABLE DetallesVentas(
    idDetalleVenta VARCHAR2(20) NOT NULL,
    idVenta VARCHAR2(20) NOT NULL,
    idProducto VARCHAR2(10) NOT NULL,
    cantidad NUMBER(20) NOT NULL,
    precioUnitario Money NOT NULL,
    precioTotal Money NOT NULL
);

-- Color Naranja

CREATE TABLE Productos(
    idProducto VARCHAR2(10) NOT NULL,
    nombre VARCHAR2(20) NOT NULL,
    precio Money NOT NULL,
    cantidadEnStock NUMBER(10) NOT NULL,
    tipoProducto tProd NOT NULL
);

CREATE TABLE Repuestos(
    idProducto VARCHAR2(10) NOT NULL,
    tipo VARCHAR2(20) NOT NULL,
    descripcion VARCHAR2 NULL
);

CREATE TABLE Motos(
    idProducto VARCHAR2(10) NOT NULL,
    marca VARCHAR2(20) NOT NULL,
    modelo VARCHAR2(20) NOT NULL,
    anio DATE NOT NULL,
    color VARCHAR2(10) NOT NULL,
    cilindraje NUMBER(3,1) NOT NULL,
    descripcion VARCHAR2(50) NULL
);

CREATE TABLE Accesorios(
    idProdcuto VARCHAR2(10) NOT NULL,
    descripcion VARCHAR(50) NULL
);






/*----------XTablas----------*/
DROP TABLE Personas CASCADE CONSTRAINTS;
DROP TABLE Clientes CASCADE CONSTRAINTS;
DROP TABLE Empleados CASCADE CONSTRAINTS;
DROP TABLE PersonasTelefonos CASCADE CONSTRAINTS;
DROP TABLE Ventas CASCADE CONSTRAINTS;
DROP TABLE DetallesVentas CASCADE CONSTRAINTS;
DROP TABLE Productos CASCADE CONSTRAINTS;
DROP TABLE Repuestos CASCADE CONSTRAINTS;
DROP TABLE Motos CASCADE CONSTRAINTS;
DROP TABLE Accesorios CASCADE CONSTRAINTS;





