# ProjectoSQL-J3 Christian Celis

## Consultas requeridas

1. Obtener el historial de reparaciones de un vehículo específico

    ``` sql
    select re.id as "Codigo Reparacion", veh.id as "CodigoVehiculo", re.Fecha, re.CostoTotal
    from Vehiculo as veh
    inner join Reparacion as re on re.IdVehiculo=veh.id
    where veh.id="3";
    ```
    ```bash
    +-------------------+----------------+------------+------------+
    | Codigo Reparacion | CodigoVehiculo | Fecha      | CostoTotal |
    +-------------------+----------------+------------+------------+
    |                 3 |              3 | 2024-06-11 |     180000 |
    +-------------------+----------------+------------+------------+

    ```
2. Calcular el costo total de todas las reparaciones realizadas por un empleado específico en un período de tiempo

    ```sql
    select sum(re.CostoTotal) as "Costo Total Reparaciones"
    from Reparacion as re
    inner join Reparacion_Empleado as repemp on repemp.IdReparacion=re.id
    inner join Empleado as emp on emp.id=repemp.IdEmpleado
    where emp.id=16 and re.Fecha BETWEEN "2024-07-02" and "2024-07-07";
    ```
    ```bash
    +--------------------------+
    | Costo Total Reparaciones |
    +--------------------------+
    |                   180000 |
    +--------------------------+
    ```

3. Listar todos los clientes y los vehículos que poseen
    ```sql
    select cli.id, mo.nombre, mc.nombre
    from Cliente as cli
    inner join Vehiculo as veh on veh.idCliente=cli.id
    inner join Marca as mc on mc.id = veh.idMarca
    inner join Modelo as mo on mo.id=veh.idModelo
    order by cli.id;
    ```
    ```bash
    +----+---------+------------+
    | id | nombre  | nombre     |
    +----+---------+------------+
    |  1 | Spark   | Chevrolet  |
    |  2 | Fiesta  | Ford       |
    |  3 | Corolla | Toyota     |
    |  4 | Sentra  | Nissan     |
    |  5 | Civic   | Honda      |
    |  6 | Accent  | Hyundai    |
    |  7 | Golf    | Volkswagen |
    |  8 | Clio    | Renault    |
    |  9 | CX-5    | Mazda      |
    | 10 | Rio     | Kia        |
    | 11 | Spark   | Chevrolet  |
    | 12 | Fiesta  | Ford       |
    | 13 | Corolla | Toyota     |
    | 14 | Sentra  | Nissan     |
    | 15 | Civic   | Honda      |
    | 16 | Accent  | Hyundai    |
    | 17 | Golf    | Volkswagen |
    | 18 | Clio    | Renault    |
    +----+---------+------------+|
    ```

4. Obtener la cantidad de piezas en inventario para cada pieza

    ```sql
    select pz.nombre as Pieza, inv.cantidad
    from Pieza as pz
    inner join Inventario as inv on inv.IdPieza=pz.id;
    ```
    ```bash
    +------------------------+----------+
    | Pieza                  | cantidad |
    +------------------------+----------+
    | Filtro de aceite       |      100 |
    | Pastillas de freno     |       50 |
    | Amortiguadores         |       80 |
    | Bujías                 |       60 |
    | Sensor de oxígeno      |       70 |
    | Batería                |      120 |
    | Filtro de aire         |       90 |
    | Bobina de encendido    |      110 |
    | Correa de distribución |       95 |
    | Líquido refrigerante   |       40 |
    +------------------------+----------+
    ```

5. Obtener las citas programadas para un día específico

    ```sql
    select date(ct.FechaHora) as Fecha ,ct.id, ser.nombre, ser.costo
    from Cita as ct
    inner join Servicio as ser on ser.id=ct.idServicio
    where date(ct.FechaHora)="2024-06-18";
    ```
    ```bash
    +------------+----+------------+-------+
    | Fecha      | id | nombre     | costo |
    +------------+----+------------+-------+
    | 2024-06-18 |  7 | Suspensión | 80000 |
    +------------+----+------------+-------+
    ```
6. Generar una factura para un cliente específico en una fecha determinada
    ```sql
    insert into Facturacion values(19,"2024-06-22",100000,19);
    insert into Facturacion_detalle values(19,2,50000,19,1);
    ```
    ```bash
        Query OK, 1 row affected (0.01 sec)
    ```

7. Listar todas las órdenes de compra y sus detalles
    ```sql
    select oc.id, oc.fecha, odt.cantidad,odt.precio, oc.total
    from Orden_compra as oc
    inner join Orden_detalle as odt on odt.idOrden_compra=oc.id
    order by oc.id;
    ```
    ```bash
    +----+------------+----------+--------+--------+
    | id | fecha      | cantidad | precio | total  |
    +----+------------+----------+--------+--------+
    |  1 | 2024-06-06 |        1 |  50000 |  50000 |
    |  2 | 2024-06-08 |        2 |  80000 | 160000 |
    |  3 | 2024-06-10 |        1 | 120000 | 120000 |
    |  4 | 2024-06-12 |        2 |  60000 | 120000 |
    |  5 | 2024-06-14 |        1 |  70000 |  70000 |
    |  6 | 2024-06-16 |        3 | 150000 | 450000 |
    |  7 | 2024-06-18 |        2 |  40000 |  80000 |
    |  8 | 2024-06-20 |        1 |  90000 |  90000 |
    |  9 | 2024-06-22 |        1 | 100000 | 100000 |
    | 10 | 2024-06-24 |        1 |  30000 |  30000 |
    +----+------------+----------+--------+--------+
    ```

8. Obtener el costo total de piezas utilizadas en una reparación específica
    ```sql
    select rp.idReparacion,SUM(rp.cantidad*pz.precio) as "Costo Total piezas en la reparacion"
    from Reparacion_pieza as rp
    inner join Pieza as pz on pz.id=rp.IdPieza
    where rp.idReparacion=1;
    ```
    ```bash
    +--------------+-------------------------------------+
    | idReparacion | Costo Total piezas en la reparacion |
    +--------------+-------------------------------------+
    |            1 |                              150000 |
    +--------------+-------------------------------------+
    ```

9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
menor que un umbral)
    ```sql
    select pz.id,pz.nombre,inv.cantidad
    from Inventario as inv
    inner join Pieza as pz on pz.id=inv.idPieza
    where inv.cantidad < 50;
    ```
    ```bash
    +----+----------------------+----------+
    | id | nombre               | cantidad |
    +----+----------------------+----------+
    | 10 | Líquido refrigerante |       40 |
    +----+----------------------+----------+
    ```


10. Obtener la lista de servicios más solicitados en un período específico
    ```sql
    select sv.nombre, count(ct.idServicio) as Cantidad
    from Servicio as sv
    inner join Cita as ct on ct.idServicio=sv.id
    where date(ct.FechaHora) BETWEEN "2024-06-08" and "2024-06-12"
    group by sv.nombre
    order by cantidad desc;
    ```
    ```bash
    +-------------------+----------+
    | nombre            | Cantidad |
    +-------------------+----------+
    | Revisión general  |        1 |
    | Cambio de llantas |        1 |
    | Frenos            |        1 |
    +-------------------+----------+
    ```

11. Obtener el costo total de reparaciones para cada cliente en un período específico
    ```sql
    SELECt rp.fecha,fa.idCliente, CostoTotal
    from Reparacion as rp
    inner join Servicio_reparacion as sr on sr.idReparacion=rp.id
    inner join Facturacion_detalle as fd on fd.idServicio_Reparacion=sr.id
    inner join Facturacion as fa on fa.id=fd.idFacturacion
    where rp.Fecha BETWEEN "2024-06-08" and "2024-06-12";
    ```
    ```bash
    +------------+-----------+------------+
    | fecha      | idCliente | CostoTotal |
    +------------+-----------+------------+
    | 2024-06-09 |         2 |     150000 |
    | 2024-06-11 |         3 |     180000 |
    +------------+-----------+------------+
    ```
12. Listar los empleados con mayor cantidad de reparaciones realizadas en un período específico
    ```sql
    select distinct(emp.nombre) as Empleado, rp.Fecha,count(rp.id) AS "Cantidad de Reparaciones"
    from Reparacion as rp
    inner join Reparacion_Empleado as remp on remp.idReparacion=rp.id
    inner join Empleado as emp on emp.id=remp.idEmpleado
    group by emp.nombre, rp.Fecha
    having rp.Fecha BETWEEN "2024-06-08" and "2024-06-12"
    order by "Cantidad de Reparaciones" DESC;
    ```
    ```bash
    +----------+------------+--------------------------+
    | Empleado | Fecha      | Cantidad de Reparaciones |
    +----------+------------+--------------------------+
    | Carlos   | 2024-06-09 |                        1 |
    | Carlos   | 2024-06-11 |                        1 |
    +----------+------------+--------------------------+

    ```
13. Obtener las piezas más utilizadas en reparaciones durante un período específico
    ```sql
    select rp.Fecha, pz.nombre
    from Reparacion as rp
    inner join Reparacion_pieza as rpz on rpz.idReparacion=rp.id
    inner join Pieza as pz on pz.id= rpz.idPieza
    where rp.Fecha BETWEEN "2024-06-08" and "2024-06-12";
    ```
    ```bash
    +------------+--------------------+
    | Fecha      | nombre             |
    +------------+--------------------+
    | 2024-06-09 | Pastillas de freno |
    +------------+--------------------+
    ```
14. Calcular el promedio de costo de reparaciones por vehículo
    ```sql
    select vh.id, md.nombre, avg(rp.CostoTotal) as "Costo Promedio"
    from vehiculo as vh
    inner join Reparacion as rp on rp.idVehiculo=vh.id
    inner join Modelo as md on md.id=vh.idModelo
    GROUP BY vh.id, md.nombre
    order by vh.id;
    ```
    ```bash
    +----+---------+----------------+
    | id | nombre  | Costo Promedio |
    +----+---------+----------------+
    |  1 | Spark   |    120000.0000 |
    |  2 | Fiesta  |    150000.0000 |
    |  3 | Corolla |    180000.0000 |
    |  4 | Sentra  |    200000.0000 |
    |  5 | Civic   |    220000.0000 |
    |  6 | Accent  |    250000.0000 |
    |  7 | Golf    |    300000.0000 |
    |  8 | Clio    |    280000.0000 |
    |  9 | CX-5    |    260000.0000 |
    | 10 | Rio     |    230000.0000 |
    | 11 | Spark   |    210000.0000 |
    | 12 | Fiesta  |    190000.0000 |
    | 13 | Corolla |    170000.0000 |
    | 14 | Sentra  |    140000.0000 |
    | 15 | Civic   |    160000.0000 |
    | 16 | Accent  |    180000.0000 |
    | 17 | Golf    |    200000.0000 |
    | 18 | Clio    |    220000.0000 |
    +----+---------+----------------+
    ```

15. Obtener el inventario de piezas por proveedor
    ```sql
    select pro.nombre, pz.nombre, pz.precio,inv.Cantidad
    from Pieza as pz
    inner join Inventario as inv on inv.idPieza=pz.id
    inner join Proveedor_pieza as ppz on ppz.idPieza=pz.id
    inner join Proveedor as pro on pro.id=ppz.idProveedor;
    ```
    ```bash
    +--------------------------+------------------------+--------+----------+
    | nombre                   | nombre                 | precio | Cantidad |
    +--------------------------+------------------------+--------+----------+
    | AutoPartes S.A.          | Filtro de aceite       |  50000 |      100 |
    | AutoPartes S.A.          | Batería                | 150000 |      120 |
    | Repuestos Rodríguez      | Pastillas de freno     |  80000 |       50 |
    | Repuestos Rodríguez      | Filtro de aire         |  40000 |       90 |
    | Autopiezas Ltda.         | Amortiguadores         | 120000 |       80 |
    | Autopiezas Ltda.         | Bobina de encendido    |  90000 |      110 |
    | Frenos y Suspensiones    | Bujías                 |  60000 |       60 |
    | Frenos y Suspensiones    | Correa de distribución | 100000 |       95 |
    | Suministros Automotrices | Sensor de oxígeno      |  70000 |       70 |
    | Suministros Automotrices | Líquido refrigerante   |  30000 |       40 |
    +--------------------------+------------------------+--------+----------+

    ```
16. Listar los clientes que no han realizado reparaciones en el último año
    ```sql
    SELECt id, cli.nombre
    from Cliente as cli
    where cli.id not in (select idCliente from  Facturacion as fa);
    ```
    ```bash
    +----+----------+
    | id | nombre   |
    +----+----------+
    | 20 | Emmanuel |
    +----+----------+

    ```

17. Obtener las ganancias totales del taller en un período específico
    ```sql
    select sum(CostoTotal) as "Costo Total"
    from Reparacion
    where Fecha BETWEEN "2024-06-08" and "2024-06-12";
    ```
    ```bash
    +-------------+
    | Costo Total |
    +-------------+
    |      330000 |
    +-------------+

    ```

18. Listar los empleados y el total de horas trabajadas en reparaciones en un período específico (asumiendo que se registra la duración de cada reparación)

    ```sql
    select distinct(emp.id), emp.nombre, sum(duracionTotal) as "Total Horas Trabajadas"
    from Empleado as emp
    inner join Reparacion_Empleado as remp on remp.idEmpleado=emp.id
    inner join Reparacion as rp on rp.id=remp.idReparacion
    where rp.Fecha BETWEEN "2024-06-01" and "2024-06-12"
    GROUP BY emp.nombre, emp.id;
    ```
    ```bash
    +----+--------+------------------------+
    | id | nombre | Total Horas Trabajadas |
    +----+--------+------------------------+
    |  1 | Carlos |                     27 |
    +----+--------+------------------------+

    ```

19. Obtener el listado de servicios prestados por cada empleado en un período específico.

    ```sql
    select emp.nombre, sv.nombre
    from Servicio as sv
    inner join Servicio_reparacion as svr on svr.idServicio=sv.id
    inner join Reparacion as rp on rp.id=svr.idReparacion
    inner join Reparacion_Empleado as remp on remp.idReparacion=rp.id
    inner join Empleado as emp on emp.id=remp.idEmpleado
    where rp.Fecha BETWEEN "2024-06-01" and "2024-06-12";
    ```
    ```bash
    +--------+-------------------+
    | nombre | nombre            |
    +--------+-------------------+
    | Carlos | Cambio de aceite  |
    | Carlos | Revisión general  |
    | Carlos | Cambio de llantas |
    +--------+-------------------+

    ```

## Subconsultas

1. Obtener el cliente que ha gastado más en reparaciones durante el último año.
    ```sql
    select id, concat(nombre," ",apellido) as Nombre,(select Total from Facturacion as fac where fac.idCliente=cli.id and year(Fecha)="2024") as "Max Gastado"
    from Cliente as cli
    order by (select Total from Facturacion as fac where fac.idCliente=cli.id) desc
    limit 1;
    ```
    ```bash
    +----+--------------+-------------+
    | id | Nombre       | Max Gastado |
    +----+--------------+-------------+
    | 10 | Andrés Pérez |      260000 |
    +----+--------------+-------------+

    ```

2. Obtener la pieza más utilizada en reparaciones durante el último mes

    ```sql
    select f.cf as "Pieza",  max(f.ct) as "Cantidad Utilizado"
    from(select pz.nombre as cf, count(pz.id) as ct, rp.Fecha
    from pieza as pz
    inner join Reparacion_pieza as rpz on rpz.idPieza= pz.id
    inner join Reparacion as rp on rp.id=rpz.idReparacion
    where (year(rp.Fecha),month(rp.Fecha)) in (select max(Year(Fecha)) , max(Month(Fecha))
    from Reparacion)
    group by pz.id,rp.Fecha) as f
    group by f.cf;
    ```
    ```bash
    +---------------------+--------------------+
    | Pieza               | Cantidad Utilizado |
    +---------------------+--------------------+
    | Bujías              |                  1 |
    | Sensor de oxígeno   |                  1 |
    | Batería             |                  1 |
    | Filtro de aire      |                  1 |
    | Bobina de encendido |                  1 |
    +---------------------+--------------------+

    ```
3. Obtener los proveedores que suministran las piezas más caras

    ```sql
    select distinct pro.id , pro.nombre
    from Proveedor as pro
    inner join Proveedor_pieza as ppz on ppz.idProveedor=pro.id
    where ppz.idPieza in (
    select id
    from Pieza
    order by precio desc)
    limit 3;
    ```
    ```bash
    +----+---------------------+
    | id | nombre              |
    +----+---------------------+
    |  1 | AutoPartes S.A.     |
    |  2 | Repuestos Rodríguez |
    |  3 | Autopiezas Ltda.    |
    +----+---------------------+
    ```

4. Listar las reparaciones que no utilizaron piezas específicas durante el último año
    ```sql
    select rp.descripcion
    from Reparacion as rp
    where rp.id in (select idReparacion
    from Reparacion_pieza as rpz
    where idPieza is null);
    ```
    ```bash
    +------------------------------------+
    | descripcion                        |
    +------------------------------------+
    | Reparación de suspensión           |
    | Reparación de transmisión          |
    | Reparación de sistema de emisiones |
    +------------------------------------+

    ``` 
5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial
    ```sql
    select pz.nombre, inv.Cantidad 
    from pieza as pz
    inner join Inventario as inv on inv.idPieza=pz.id 
    where inv.Cantidad < (600*0.1);
    ```
    ```bash
    +----------------------+----------+
    | nombre               | Cantidad |
    +----------------------+----------+
    | Pastillas de freno   |       50 |
    | Líquido refrigerante |       40 |
    +----------------------+----------+
    ```

## Procedimientos Almacenados

1. Crear un procedimiento almacenado para insertar una nueva reparación.
    ```sql
    DELIMITER $$
    CREATE PROCEDURE InsertarReparacion(
        IN ide INT,
        IN Fecha DATE,
        IN Costot DECIMAL(10,2),
        IN descripcion VARCHAR(50),
        IN idVehiculo INT,
        IN duracionTotal INT
    )
    BEGIN
        DECLARE Mensaje varchar(30);
        INSERT INTO Reparacion VALUES (ide, Fecha, Costot, descripcion, idVehiculo, duracionTotal);
        IF (ROW_COUNT() > 0) THEN
            SET mensaje = "Reparacion Insertada con exito";
        ELSE
            SET mensaje = "Error al insertar una Reparacion";
        END IF;
        
        select mensaje;
    END$$

    DELIMITER ;

    call InsertarReparacion(30,"2024-12-22",3300000,"Limpieza de Motor",1,4);
    ```
    ```bash
    +--------------------------------+
    | mensaje                        |
    +--------------------------------+
    | Reparacion Insertada con exito |
    +--------------------------------+
    ```
2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.
    ```sql
    delimiter $$
    create procedure ActualizarInvPieza
    (
    in idPiezap int,
    in Cantidadp int
    )
    begin
        DECLARE Mensaje varchar(50);
        update Inventario
            set Cantidad = Cantidadp
        where idPieza=idPiezap; 

        IF (ROW_COUNT() > 0) THEN
        
            SET mensaje = "Actualizacion del inventario exitosa";
        ELSE
            SET mensaje = "Error al Actualizar el inventario";
        END IF;
        
        select mensaje;
    end$$

    delimiter ;
    call ActualizarInvPieza(1,23);
    ```
    ```bash
    +--------------------------------------+
    | mensaje                              |
    +--------------------------------------+
    | Actualizacion del inventario exitosa |
    +--------------------------------------+
    ```
3. Crear un procedimiento almacenado para eliminar una cita
    ```sql
    delimiter $$
    CREATE PROCEDURE BorrarCita(
    in idCita int
    )
    begin
        declare mensaje varchar(50);
        
        delete from Cita where id = idCita;
        
        if row_count() >0 then
            set mensaje = concat("Cita con id ",idCita,"Fue eliminada con exito");
        else
            set mensaje = "Error al eliminar la cita";
        end if;
        
        select mensaje;
    end$$
    delimiter ;

    call BorrarCita(2);
    ```
    ```bash
    +--------------------------------------+
    | mensaje                              |
    +--------------------------------------+
    | Cita con id 2Fue eliminada con exito |
    +--------------------------------------+
    ```

4. Crear un procedimiento almacenado para generar una factura;
    ```sql
        delimiter $$
        create procedure generarFactura(
            in idFactura int,
            in Fechaf date,
            in idClientef int,
            in Cantidadf int,
            in precio decimal,
            in idServicioReparacion int
        )
        begin
            declare mensaje varchar(50);
            insert into Facturacion values(idFactura,Fechaf,precio*Cantidadf,idClientef);
            insert into Facturacion_detalle values(idFactura,Cantidadf,precio,idFactura,idServicioReparacion);
            
            if(ROW_COUNT() > 0) THEN
                set mensaje = "La factura se ha creado con exito";
            else 
                set mensaje = "Error no se creo correctamente";
            end if;

            select mensaje;

        end$$

        delimiter ;

        call generarFactura(45,"2024-09-22",5,9,28000,2);
    ```
    ```bash
    +-----------------------------------+
    | mensaje                           |
    +-----------------------------------+
    | La factura se ha creado con exito |
    +-----------------------------------+
    ```
5. Crear un procedimiento almacenado para obtener el historial de reparaciones de un vehículo
    ```sql
    delimiter $$

    create procedure historialReparacionesvh(
        in idVehiculo int
    )
    begin
        select re.id as "Codigo Reparacion", veh.id as "Codigo Vehiculo ", re.Fecha, re.CostoTotal
        from Vehiculo as veh
        inner join Reparacion as re on re.IdVehiculo=veh.id
        where veh.id= idVehiculo;
        end$$

    delimiter ;

    call historialReparacionesvh(3);
    ```
    ```bash
    +-------------------+------------------+------------+------------+
    | Codigo Reparacion | Codigo Vehiculo  | Fecha      | CostoTotal |
    +-------------------+------------------+------------+------------+
    |                 3 |                3 | 2024-06-11 |     180000 |
    +-------------------+------------------+------------+------------+

    ```

6. Crear un procedimiento almacenado para calcular el costo total de reparaciones de un cliente en un período
    ```sql
    DELIMITER $$

    CREATE PROCEDURE costoTotalReparaciones(
        IN idCliente INT,
        IN FechaInicial DATE,
        IN FechaFinal DATE
    )
    BEGIN
        DECLARE mensaje VARCHAR(50);
        DECLARE bandera BOOLEAN DEFAULT FALSE;

        IF FechaInicial > FechaFinal THEN
            SET mensaje = 'Fecha Inicial no puede ser mayor a fecha final';
            SET bandera = TRUE;
        END IF;

        IF bandera THEN
            SELECT mensaje AS Mensaje;
        ELSE
            SELECT 
                fa.idCliente,
                SUM(rp.CostoTotal) AS CostoTotal
            FROM Reparacion AS rp
            INNER JOIN Servicio_reparacion AS sr ON sr.idReparacion = rp.id
            INNER JOIN Facturacion_detalle AS fd ON fd.idServicio_Reparacion = sr.id
            INNER JOIN Facturacion AS fa ON fa.id = fd.idFacturacion
            WHERE rp.Fecha BETWEEN FechaInicial AND FechaFinal  and fa.idCliente=idCliente
            GROUP BY fa.idCliente;
        END IF;
    END$$

    DELIMITER ;

    CALL costoTotalReparaciones(2,'2024-06-08', '2024-06-12');
    ```
    ```bash
    +-----------+------------+
    | idCliente | CostoTotal |
    +-----------+------------+
    |         2 |     150000 |
    +-----------+------------+

    ```

7. Crear un procedimiento almacenado para obtener la lista de vehículos que
requieren mantenimiento basado en el kilometraje.

    ```sql
    delimiter $$
    create procedure ListaVHmantenimiento(in kilometraje decimal)
    begin
        select vh.id, md.nombre , vh.Kilometraje
        from Vehiculo as vh
        inner join Modelo as md on md.id=vh.idModelo
        where vh.Kilometraje >= kilometraje;
    end$$
    delimiter ;


    call ListaVHmantenimiento(40000);
    ```
    ```bash
    +----+---------+-------------+
    | id | nombre  | Kilometraje |
    +----+---------+-------------+
    |  3 | Corolla |       45000 |
    |  5 | Civic   |      342100 |
    |  7 | Golf    |       56000 |
    | 10 | Rio     |       56000 |
    | 11 | Spark   |       54000 |
    | 14 | Sentra  |       98000 |
    +----+---------+-------------+

    ```
8. Crear un procedimiento almacenado para insertar una nueva orden de compra
    ```sql
    delimiter $$
    create procedure InsertarOrdenCompra
    (
        in idCompra int,
        in Fecha date,
        in idEmpleado int,
        in idProveedor int,
        in cantidad int,
        in precio decimal,
        in idPieza int
    )
    begin
            insert into Orden_compra values(idCompra,Fecha,cantidad*precio,idEmpleado,idProveedor);
            insert into Orden_detalle values(idCompra,cantidad,precio,idCompra,idPieza);
    end$$
        
    delimiter ;

    call InsertarOrdenCompra(11,"2024-03-22",2,2,4,10000,6);
    ```
    ```bash
    Query OK, 1 row affected (0.01 sec)
    ```


9. Crear un procedimiento almacenado para actualizar los datos de un cliente
    ```sql
    delimiter $$
    create procedure ActualizarCliente(
        in idCliente int,
        in Nombrecli varchar(50),
        in Apellidocli varchar(50),
        in Direccioncli varchar(70),
        in Emailcli varchar(30)
    )
    begin
        declare mensaje varchar(50);
        update Cliente
        set Nombre=Nombrecli,
        Apellido=Apellidocli,
        Direccion=Direccioncli,
        Email=Emailcli
        where id=idCliente;

        if ROW_COUNT() >0 THEN
            set mensaje = "Actualizacion del cliente exitosa";
        ELSE
            set mensaje = "Error al actualizar el cliente";
        end if;

        select mensaje;

    end$$
    delimiter ;

    call ActualizarCliente(1,"Juan","perez","Avenida siempre viva","pepejuan@dad.com");
    ```
    ```bash
    +-----------------------------------+
    | mensaje                           |
    +-----------------------------------+
    | Actualizacion del cliente exitosa |
    +-----------------------------------+

    ```

10. Crear un procedimiento almacenado para obtener los servicios más solicitados en un período
    ```sql
    delimiter $$
    create procedure ServicioxPeriodo
    (
        in FechaInicio date,
        in FechaFin date
    )
        begin
                select sv.nombre, count(ct.idServicio) as Cantidad
                from Servicio as sv
                inner join Cita as ct on ct.idServicio=sv.id
                where date(ct.FechaHora) BETWEEN FechaInicio and FechaFin
                group by sv.nombre
                order by cantidad desc;
        end$$
    delimiter ;

    call ServicioxPeriodo("2024-06-08","2024-06-12");
    ```
    ```bash
    +-------------------+----------+
    | nombre            | Cantidad |
    +-------------------+----------+
    | Cambio de llantas |        1 |
    | Frenos            |        1 |
    +-------------------+----------+

```