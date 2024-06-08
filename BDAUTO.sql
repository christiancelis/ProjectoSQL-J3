drop database AutoTaller;
create database AutoTaller;
use AutoTaller;
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    Nombre VARCHAR(50) not null,
    Apellido VARCHAR(50) not null,
    Direccion VARCHAR(100) not null,
    Email VARCHAR(50) not null unique
);

CREATE TABLE Marca (
    id INT PRIMARY KEY,
    nombre VARCHAR(20) not null
);

CREATE TABLE Modelo (
    id INT PRIMARY KEY,
    nombre VARCHAR(20) not null
);

CREATE TABLE Vehiculo (
    id INT PRIMARY KEY,
    Placa VARCHAR(10) not null,
    Kilometraje decimal not null,
    idCliente INT,
    idMarca INT,
    idModelo INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id),
    FOREIGN KEY (idMarca) REFERENCES Marca(id),
    FOREIGN KEY (idModelo) REFERENCES Modelo(id)
);

CREATE TABLE Servicio (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) not null,
    descripcion VARCHAR(100) not null,
    costo DECIMAL not null
);


CREATE TABLE Cita (
    id INT PRIMARY KEY,
    FechaHora DATETIME not null,
    idCliente INT,
    idServicio INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id),
    FOREIGN KEY (idServicio) REFERENCES Servicio(id)
);

CREATE TABLE Facturacion (
    id INT PRIMARY KEY,
    Fecha DATE not null,
    Total DECIMAL not null,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);


CREATE TABLE Reparacion (
    id INT PRIMARY KEY,
    Fecha DATE not null,
    CostoTotal DECIMAL not null,
    descripcion VARCHAR(50) not null,
    duracionTotal INT not null,
    IdVehiculo INT,
    FOREIGN KEY (IdVehiculo) REFERENCES Vehiculo(id)
);

CREATE TABLE Servicio_reparacion (
    id INT PRIMARY KEY,
    idServicio INT,
    idReparacion INT,
    FOREIGN KEY (idServicio) REFERENCES Servicio(id),
    FOREIGN KEY (idReparacion) REFERENCES Reparacion(id)
);


CREATE TABLE Facturacion_detalle (
    id INT PRIMARY KEY,
    Cantidad INT not null,
    Precio DECIMAL not null,
    idFacturacion INT,
    idServicio_Reparacion INT,
    FOREIGN KEY (idFacturacion) REFERENCES Facturacion(id),
    FOREIGN KEY (idServicio_Reparacion) REFERENCES Servicio_reparacion(id)
);

CREATE TABLE Cargo (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) not null
);

CREATE TABLE Empleado (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) not null,
    apellido VARCHAR(50), 
    idCargo INT,
    FOREIGN KEY (idCargo) REFERENCES Cargo(id)
);


CREATE TABLE Reparacion_Empleado (
    id INT PRIMARY KEY,
    idReparacion INT,
    idEmpleado INT,
    FOREIGN KEY (idReparacion) REFERENCES Reparacion(id),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(id)
);

CREATE TABLE Pieza (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) not null,
    descripcion VARCHAR(100) not null,
    precio DECIMAL not null
);


CREATE TABLE Reparacion_pieza (
    id INT PRIMARY KEY,
    cantidad INT not null,
    idReparacion INT,
    idPieza INT,
    FOREIGN KEY (idReparacion) REFERENCES Reparacion(id),
    FOREIGN KEY (idPieza) REFERENCES Pieza(id)
    
);

CREATE TABLE Ubicacion (
    id INT PRIMARY KEY,
    zona VARCHAR(50) not null
);

CREATE TABLE Inventario (
    id INT PRIMARY KEY,
    Cantidad INT not null,
    idPieza INT,
    idUbicacion INT,
    FOREIGN KEY (idPieza) REFERENCES Pieza(id),
    FOREIGN KEY (idUbicacion) REFERENCES Ubicacion(id)
);

CREATE TABLE Proveedor (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) not null,
    Contacto VARCHAR(50) not null,
    Email VARCHAR(50) not null unique
);

CREATE TABLE Proveedor_pieza (
    id INT PRIMARY KEY,
    idPieza INT,
    idProveedor INT,
    FOREIGN KEY (idPieza) REFERENCES Pieza(id),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(id)
);

CREATE TABLE Orden_compra (
    id INT PRIMARY KEY,
    fecha DATE not null,
    total DECIMAL not null,
    idEmpleado INT,
    idProveedor INT,
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(id),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(id)
);

CREATE TABLE Orden_detalle (
    id INT PRIMARY KEY,
    cantidad INT not null,
    precio DECIMAL not null,
    idOrden_compra INT,
    idPieza INT,
    FOREIGN KEY (idOrden_compra) REFERENCES Orden_compra(id),
    FOREIGN KEY (idPieza) REFERENCES Pieza(id)
);

CREATE TABLE Tipo_telefono (
    id INT PRIMARY KEY,
    tipo VARCHAR(20) not null
);

CREATE TABLE Telefono (
    id INT PRIMARY KEY,
    telefono VARCHAR(20) unique,
    idTipoTelefono INT,
    FOREIGN KEY (idTipoTelefono) REFERENCES Tipo_telefono(id)
);

CREATE TABLE Telefono_cliente (
    id INT PRIMARY KEY,
    idCliente INT,
    idTelefono INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id),
    FOREIGN KEY (idTelefono) REFERENCES Telefono(id)
);

CREATE TABLE Telefono_empleado (
    id INT PRIMARY KEY,
    idTelefono INT,
    idEmpleado INT,
    FOREIGN KEY (idTelefono) REFERENCES Telefono(id),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(id)
);


CREATE TABLE Telefono_proveedor (
    id INT PRIMARY KEY,
    idTelefono INT,
    idProveedor INT,
    FOREIGN KEY (idTelefono) REFERENCES Telefono(id),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(id)
);


