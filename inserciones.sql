INSERT INTO Marca (id, nombre) VALUES
(1, 'Chevrolet'),
(2, 'Ford'),
(3, 'Toyota'),
(4, 'Nissan'),
(5, 'Honda'),
(6, 'Hyundai'),
(7, 'Volkswagen'),
(8, 'Renault'),
(9, 'Mazda'),
(10, 'Kia');

INSERT INTO Cliente (id, Nombre, Apellido, Direccion, Email) VALUES
(1, 'Juan', 'García', 'Calle 123, Bogotá', 'juan.garcia@example.com'),
(2, 'María', 'López', 'Carrera 45, Medellín', 'maria.lopez@example.com'),
(3, 'Carlos', 'Martínez', 'Avenida 567, Cali', 'carlos.martinez@example.com'),
(4, 'Laura', 'Gómez', 'Calle 89, Barranquilla', 'laura.gomez@example.com'),
(5, 'Pedro', 'Hernández', 'Carrera 10, Cartagena', 'pedro.hernandez@example.com'),
(6, 'Ana', 'Díaz', 'Avenida 23, Pereira', 'ana.diaz@example.com'),
(7, 'Sofía', 'Rodríguez', 'Calle 76, Bucaramanga', 'sofia.rodriguez@example.com'),
(8, 'Diego', 'Suárez', 'Carrera 30, Santa Marta', 'diego.suarez@example.com'),
(9, 'Camila', 'Gutiérrez', 'Avenida 54, Manizales', 'camila.gutierrez@example.com'),
(10, 'Andrés', 'Pérez', 'Calle 12, Armenia', 'andres.perez@example.com'),
(11, 'Valentina', 'Londoño', 'Carrera 89, Villavicencio', 'valentina.londono@example.com'),
(12, 'Mateo', 'Castro', 'Avenida 67, Cúcuta', 'mateo.castro@example.com'),
(13, 'Isabella', 'Ramírez', 'Calle 45, Pasto', 'isabella.ramirez@example.com'),
(14, 'Juan', 'Herrera', 'Carrera 20, Ibague', 'juan.herrera@example.com'),
(15, 'Sara', 'Muñoz', 'Avenida 12, Tunja', 'sara.munoz@example.com'),
(16, 'Nicolás', 'Arias', 'Calle 34, Montería', 'nicolas.arias@example.com'),
(17, 'Valeria', 'Zapata', 'Carrera 67, Popayán', 'valeria.zapata@example.com'),
(18, 'Samuel', 'Ospina', 'Avenida 56, Florencia', 'samuel.ospina@example.com'),
(19, 'Luciana', 'Góngora', 'Calle 78, Quibdó', 'luciana.gongora@example.com'),
(20, 'Emmanuel', 'Osorio', 'Carrera 23, Riohacha', 'emmanuel.osorio@example.com');

INSERT INTO Modelo (id, nombre) VALUES
(1, 'Spark'),
(2, 'Fiesta'),
(3, 'Corolla'),
(4, 'Sentra'),
(5, 'Civic'),
(6, 'Accent'),
(7, 'Golf'),
(8, 'Clio'),
(9, 'CX-5'),
(10, 'Rio');

INSERT INTO Vehiculo (id, Placa, idCliente, idMarca, idModelo) VALUES
(1, 'ABC123', 1, 1, 1),
(2, 'DEF456', 2, 2, 2),
(3, 'GHI789', 3, 3, 3),
(4, 'JKL012', 4, 4, 4),
(5, 'MNO345', 5, 5, 5),
(6, 'PQR678', 6, 6, 6),
(7, 'STU901', 7, 7, 7),
(8, 'VWX234', 8, 8, 8),
(9, 'YZA567', 9, 9, 9),
(10, 'BCD890', 10, 10, 10),
(11, 'EFG123', 11, 1, 1),
(12, 'HIJ456', 12, 2, 2),
(13, 'KLM789', 13, 3, 3),
(14, 'NOP012', 14, 4, 4),
(15, 'PQR345', 15, 5, 5),
(16, 'STU678', 16, 6, 6),
(17, 'VWX901', 17, 7, 7),
(18, 'YZA234', 18, 8, 8)

INSERT INTO Cita (id, FechaHora, idCliente) VALUES
(1, '2024-06-06 08:00:00', 1),
(2, '2024-06-08 09:30:00', 2),
(3, '2024-06-10 11:00:00', 3),
(4, '2024-06-12 13:30:00', 4),
(5, '2024-06-14 15:00:00', 5),
(6, '2024-06-16 16:30:00', 6),
(7, '2024-06-18 18:00:00', 7),
(8, '2024-06-20 19:30:00', 8),
(9, '2024-06-22 21:00:00', 9),
(10, '2024-06-24 22:30:00', 10),
(11, '2024-06-26 08:00:00', 11),
(12, '2024-06-28 09:30:00', 12),
(13, '2024-06-30 11:00:00', 13),
(14, '2024-07-02 13:30:00', 14),
(15, '2024-07-04 15:00:00', 15),
(16, '2024-07-06 16:30:00', 16),
(17, '2024-07-08 18:00:00', 17),
(18, '2024-07-10 19:30:00', 18)

INSERT INTO Facturacion (id, Fecha, Total, idCliente) VALUES
(1, '2024-06-06', 150000, 1),
(2, '2024-06-08', 200000, 2),
(3, '2024-06-10', 180000, 3),
(4, '2024-06-12', 220000, 4),
(5, '2024-06-14', 250000, 5),
(6, '2024-06-16', 190000, 6),
(7, '2024-06-18', 170000, 7),
(8, '2024-06-20', 210000, 8),
(9, '2024-06-22', 240000, 9),
(10, '2024-06-24', 260000, 10),
(11, '2024-06-26', 175000, 11),
(12, '2024-06-28', 185000, 12),
(13, '2024-06-30', 195000, 13),
(14, '2024-07-02', 205000, 14),
(15, '2024-07-04', 215000, 15),
(16, '2024-07-06', 225000, 16),
(17, '2024-07-08', 235000, 17),
(18, '2024-07-10', 245000, 18)


INSERT INTO Servicio (id, nombre, descripcion, costo, idCita) VALUES
(1, 'Cambio de aceite', 'Cambio de aceite y filtro', 80000, 1),
(2, 'Revisión general', 'Revisión de motor y sistemas', 120000, 2),
(3, 'Cambio de llantas', 'Cambio de llantas y alineación', 150000, 3),
(4, 'Frenos', 'Revisión y ajuste de frenos', 100000, 4),
(5, 'Reparación de motor', 'Reparación completa de motor', 300000, 5),
(6, 'Aire acondicionado', 'Recarga y mantenimiento del aire acondicionado', 50000, 6),
(7, 'Suspensión', 'Revisión y ajuste de suspensión', 80000, 7),
(8, 'Electricidad', 'Revisión y reparación de sistema eléctrico', 70000, 8),
(9, 'Cambio de batería', 'Cambio de batería y revisión', 60000, 9),
(10, 'Transmisión', 'Reparación y ajuste de transmisión', 200000, 10),
(11, 'Reparación de carrocería', 'Reparación de golpes y daños en la carrocería', 250000, 11),
(12, 'Sistema de frenos ABS', 'Reparación y ajuste del sistema ABS', 120000, 12),
(13, 'Sistema de dirección', 'Revisión y ajuste del sistema de dirección', 90000, 13),
(14, 'Cambio de líquidos', 'Cambio de líquidos y fluidos', 70000, 14),
(15, 'Sistema de escape', 'Reparación y mantenimiento del sistema de escape', 80000, 15),
(16, 'Reparación de luces', 'Reparación de luces y sistema de iluminación', 60000, 16),
(17, 'Cambio de filtro de aire', 'Cambio de filtro de aire y limpieza', 50000, 17),
(18, 'Diagnóstico de fallas', 'Diagnóstico y solución de fallas', 100000, 18)


INSERT INTO Reparacion (id, Fecha, CostoTotal, descripcion) VALUES
(1, '2024-06-07', 120000, 'Reparación de motor'),
(2, '2024-06-09', 150000, 'Reparación de frenos'),
(3, '2024-06-11', 180000, 'Reparación de suspensión'),
(4, '2024-06-13', 200000, 'Reparación de dirección'),
(5, '2024-06-15', 220000, 'Reparación de sistema eléctrico'),
(6, '2024-06-17', 250000, 'Reparación de carrocería'),
(7, '2024-06-19', 300000, 'Reparación de transmisión'),
(8, '2024-06-21', 280000, 'Reparación de sistema ABS'),
(9, '2024-06-23', 260000, 'Reparación de sistema de escape'),
(10, '2024-06-25', 230000, 'Reparación de sistema de enfriamiento'),
(11, '2024-06-27', 210000, 'Reparación de sistema de luces'),
(12, '2024-06-29', 190000, 'Reparación de sistema de aire acondicionado'),
(13, '2024-07-01', 170000, 'Reparación de sistema de emisiones'),
(14, '2024-07-03', 140000, 'Reparación de sistema de dirección'),
(15, '2024-07-05', 160000, 'Reparación de sistema de enfriamiento'),
(16, '2024-07-07', 180000, 'Reparación de sistema de suspensión'),
(17, '2024-07-09', 200000, 'Reparación de sistema de frenos'),
(18, '2024-07-11', 220000, 'Reparación de sistema eléctrico')


INSERT INTO Servicio_reparacion (id, idServicio, idReparacion) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18)


INSERT INTO Facturacion_detalle (id, Cantidad, Precio, idFacturacion, idServicio_Reparacion) VALUES
(1, 1, 80000, 1, 1),
(2, 1, 150000, 2, 2),
(3, 1, 180000, 3, 3),
(4, 1, 200000, 4, 4),
(5, 1, 220000, 5, 5),
(6, 1, 250000, 6, 6),
(7, 1, 300000, 7, 7),
(8, 1, 280000, 8, 8),
(9, 1, 260000, 9, 9),
(10, 1, 230000, 10, 10),
(11, 1, 210000, 11, 11),
(12, 1, 190000, 12, 12),
(13, 1, 170000, 13, 13),
(14, 1, 140000, 14, 14),
(15, 1, 160000, 15, 15),
(16, 1, 180000, 16, 16),
(17, 1, 200000, 17, 17),
(18, 1, 220000, 18, 18)


INSERT INTO Cargo (id, nombre) VALUES
(1, 'Mecánico'),
(2, 'Electricista'),
(3, 'Pintor'),
(4, 'Ingeniero'),
(5, 'Administrativo');


INSERT INTO Empleado (id, nombre, apellido, idCargo) VALUES
(1, 'Carlos', 'Gómez', 1),
(2, 'Laura', 'Martínez', 2),
(3, 'Juan', 'Hernández', 3),
(4, 'María', 'López', 4),
(5, 'Pedro', 'González', 1),
(6, 'Sofía', 'Díaz', 2),
(7, 'Andrés', 'Sánchez', 3),
(8, 'Valentina', 'Muñoz', 4),
(9, 'Diego', 'Torres', 1),
(10, 'Camila', 'Vargas', 2),
(11, 'Samuel', 'Rojas', 3),
(12, 'Isabella', 'Gutiérrez', 4),
(13, 'Nicolás', 'Pérez', 1),
(14, 'Luciana', 'Flores', 2),
(15, 'Emmanuel', 'Álvarez', 3),
(16, 'Valeria', 'Moreno', 4),
(17, 'Mateo', 'Jiménez', 1),
(18, 'Sara', 'Góngora', 2),
(19, 'Juan', 'Ospina', 3),
(20, 'Ana', 'Zapata', 4);


INSERT INTO Reparacion_Empleado (id, idReparacion, idEmpleado) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18)


INSERT INTO Pieza (id, nombre, descripcion, precio) VALUES
(1, 'Filtro de aceite', 'Filtro de aceite para cambio', 50000),
(2, 'Pastillas de freno', 'Pastillas de freno delanteras', 80000),
(3, 'Amortiguadores', 'Juego de amortiguadores delanteros', 120000),
(4, 'Bujías', 'Bujías para motor', 60000),
(5, 'Sensor de oxígeno', 'Sensor de oxígeno para sistema de escape', 70000),
(6, 'Batería', 'Batería de alto rendimiento', 150000),
(7, 'Filtro de aire', 'Filtro de aire para motor', 40000),
(8, 'Bobina de encendido', 'Bobina de encendido para motor', 90000),
(9, 'Correa de distribución', 'Correa de distribución para motor', 100000),
(10, 'Líquido refrigerante', 'Líquido refrigerante para sistema de enfriamiento', 30000);


INSERT INTO Reparacion_pieza (id, idReparacion, idPieza) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 1),
(12, 12, 2),
(13, 13, 3),
(14, 14, 4),
(15, 15, 5),
(16, 16, 6),
(17, 17, 7),
(18, 18, 8);

INSERT INTO Ubicacion (id, zona) VALUES
(1, 'Almacén principal'),
(2, 'Bodega 1'),
(3, 'Bodega 2'),
(4, 'Bodega 3'),
(5, 'Taller 1'),
(6, 'Taller 2'),
(7, 'Oficina de ventas'),
(8, 'Oficina administrativa'),
(9, 'Área de servicio al cliente'),
(10, 'Área de reparaciones especiales');


INSERT INTO Inventario (id, Cantidad, idPieza, idUbicacion) VALUES
(1, 100, 1, 1),
(2, 50, 2, 2),
(3, 80, 3, 3),
(4, 60, 4, 4),
(5, 70, 5, 5),
(6, 120, 6, 6),
(7, 90, 7, 7),
(8, 110, 8, 8),
(9, 95, 9, 9),
(10, 40, 10, 10);


INSERT INTO Proveedor (id, nombre, Contacto, Email) VALUES
(1, 'AutoPartes S.A.', 'Juan Pérez', 'juanperez@autopartes.com'),
(2, 'Repuestos Rodríguez', 'Pedro González', 'pedrogonzalez@repuestos.com'),
(3, 'Autopiezas Ltda.', 'María López', 'marialopez@autopiezas.com'),
(4, 'Frenos y Suspensiones', 'Andrés Sánchez', 'andressanchez@frenos.com'),
(5, 'Suministros Automotrices', 'Sofía Díaz', 'sofiadiaz@suministros.com');


INSERT INTO Proveedor_pieza (id, idPieza, idProveedor) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3),
(9, 9, 4),
(10, 10, 5);

INSERT INTO Orden_compra (id, fecha, total, idEmpleado, idProveedor) VALUES
(1, '2024-06-06', 200000, 1, 1),
(2, '2024-06-08', 250000, 2, 2),
(3, '2024-06-10', 300000, 3, 3),
(4, '2024-06-12', 280000, 4, 4),
(5, '2024-06-14', 260000, 5, 5),
(6, '2024-06-16', 240000, 6, 1),
(7, '2024-06-18', 230000, 7, 2),
(8, '2024-06-20', 220000, 8, 3),
(9, '2024-06-22', 210000, 9, 4),
(10, '2024-06-24', 190000, 10, 5);

INSERT INTO Orden_detalle (id, cantidad, precio, idOrden_compra, idPieza) VALUES
(1, 1, 50000, 1, 1),
(2, 2, 80000, 2, 2),
(3, 1, 120000, 3, 3),
(4, 2, 60000, 4, 4),
(5, 1, 70000, 5, 5),
(6, 3, 150000, 6, 6),
(7, 2, 40000, 7, 7),
(8, 1, 90000, 8, 8),
(9, 1, 100000, 9, 9),
(10, 1, 30000, 10, 10);


INSERT INTO Tipo_telefono (id, tipo) VALUES
(1, 'Casa'),
(2, 'Móvil'),
(3, 'Trabajo');


INSERT INTO Telefono (id, telefono, idTipoTelefono) VALUES
(1, '3123456789', 2),
(2, '3209876543', 2),
(3, '3101234567', 2),
(4, '3187654321', 2),
(5, '3152345678', 2),
(6, '3018765432', 2),
(7, '3045678910', 2),
(8, '3176543210', 2),
(9, '3134567890', 2),
(10, '3193456789', 2);

INSERT INTO Telefono_cliente (id, idCliente, idTelefono) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);


INSERT INTO Telefono_empleado (id, idTelefono, idEmpleado) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);


INSERT INTO Telefono_proveedor (id, idTelefono, idProveedor) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3),
(9, 9, 4),
(10, 10, 5);