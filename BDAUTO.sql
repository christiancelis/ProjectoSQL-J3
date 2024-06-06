create database AutoTaller;
use AutoTaller;
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Direccion VARCHAR(100),
    Email VARCHAR(50)
);

CREATE TABLE Marca (
    id INT PRIMARY KEY,
    nombre VARCHAR(20)
);

CREATE TABLE Modelo (
    id INT PRIMARY KEY,
    nombre VARCHAR(20)
);

CREATE TABLE Vehiculo (
    id INT PRIMARY KEY,
    Placa VARCHAR(10),
    idCliente INT,
    idMarca INT,
    idModelo INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id),
    FOREIGN KEY (idMarca) REFERENCES Marca(id),
    FOREIGN KEY (idModelo) REFERENCES Modelo(id)
);

CREATE TABLE Cita (
    id INT PRIMARY KEY,
    FechaHora DATETIME,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE Facturacion (
    id INT PRIMARY KEY,
    Fecha DATE,
    Total DECIMAL,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(id)
);

CREATE TABLE Servicio (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(100),
    costo DECIMAL,
    idCita INT,
    FOREIGN KEY (idCita) REFERENCES Cita(id)
);

CREATE TABLE Reparacion (
    id INT PRIMARY KEY,
    Fecha DATE,
    CostoTotal DECIMAL,
    descripcion VARCHAR(50)
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
    Cantidad INT,
    Precio DECIMAL,
    idFacturacion INT,
    idServicio_Reparacion INT,
    FOREIGN KEY (idFacturacion) REFERENCES Facturacion(id),
    FOREIGN KEY (idServicio_Reparacion) REFERENCES Servicio_reparacion(id)
);

CREATE TABLE Cargo (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Empleado (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
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
    nombre VARCHAR(100),
    descripcion VARCHAR(100),
    precio DECIMAL
);


CREATE TABLE Reparacion_pieza (
    id INT PRIMARY KEY,
    idReparacion INT,
    idPieza INT,
    FOREIGN KEY (idReparacion) REFERENCES Reparacion(id),
    FOREIGN KEY (idPieza) REFERENCES Pieza(id)
);

CREATE TABLE Ubicacion (
    id INT PRIMARY KEY,
    zona VARCHAR(50)
);

CREATE TABLE Inventario (
    id INT PRIMARY KEY,
    Cantidad INT,
    idPieza INT,
    idUbicacion INT,
    FOREIGN KEY (idPieza) REFERENCES Pieza(id),
    FOREIGN KEY (idUbicacion) REFERENCES Ubicacion(id)
);

CREATE TABLE Proveedor (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    Contacto VARCHAR(50),
    Email VARCHAR(50)
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
    fecha DATE,
    total DECIMAL,
    idEmpleado INT,
    idProveedor INT,
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(id),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(id)
);

CREATE TABLE Orden_detalle (
    id INT PRIMARY KEY,
    cantidad INT,
    precio DECIMAL,
    idOrden_compra INT,
    idPieza INT,
    FOREIGN KEY (idOrden_compra) REFERENCES Orden_compra(id),
    FOREIGN KEY (idPieza) REFERENCES Pieza(id)
);

CREATE TABLE Tipo_telefono (
    id INT PRIMARY KEY,
    tipo VARCHAR(20)
);

CREATE TABLE Telefono (
    id INT PRIMARY KEY,
    telefono VARCHAR(20),
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