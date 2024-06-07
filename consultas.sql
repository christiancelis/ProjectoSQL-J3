-- Consultas requeridas
use AutoTaller;
-- 1. Obtener el historial de reparaciones de un vehículo específico

select re.id as "Codigo Reparacion", veh.id as "Codigo ", re.Fecha, re.CostoTotal
from Vehiculo as veh
inner join Reparacion as re on re.IdVehiculo=veh.id
where veh.id="3";

-- 2. Calcular el costo total de todas las reparaciones realizadas por un empleado
-- específico en un período de tiempo


select sum(re.CostoTotal) as "Costo Total Reparaciones"
from Reparacion as re 
inner join Reparacion_Empleado as repemp on repemp.IdReparacion=re.id 
inner join Empleado as emp on emp.id=repemp.IdEmpleado
where emp.id=16 and re.Fecha BETWEEN "2024-07-02" and "2024-07-07";


-- 3. Listar todos los clientes y los vehículos que poseen
select cli.id, mo.nombre, mc.nombre
from Cliente as cli
inner join Vehiculo as veh on veh.idCliente=cli.id
inner join Marca as mc on mc.id = veh.idMarca
inner join Modelo as mo on mo.id=veh.idModelo
order by cli.id;

-- 4. Obtener la cantidad de piezas en inventario para cada pieza

select pz.nombre as Pieza, inv.cantidad
from Pieza as pz
inner join Inventario as inv on inv.IdPieza=pz.id;

-- 5. Obtener las citas programadas para un día específico

select date(ct.FechaHora) as Fecha ,ct.id, ser.nombre, ser.costo
from Cita as ct
inner join Servicio as ser on ser.id=ct.idServicio
where date(ct.FechaHora)="2024-06-18";

-- 6. Generar una factura para un cliente específico en una fecha determinada

insert into Facturacion values(19,"2024-06-22",100000,19);
insert into Facturacion_detalle values(19,2,50000,19,1);


-- 7. Listar todas las órdenes de compra y sus detalles

select oc.id, oc.fecha, odt.cantidad,odt.precio, oc.total
from Orden_compra as oc
inner join Orden_detalle as odt on odt.idOrden_compra=oc.id
order by oc.id;

-- 8. Obtener el costo total de piezas utilizadas en una reparación específica

select rp.idReparacion,SUM(rp.cantidad*pz.precio) as "Costo Total piezas en la reparacion"
from Reparacion_pieza as rp
inner join Pieza as pz on pz.id=rp.IdPieza 
where rp.idReparacion=1;

-- 9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
-- menor que un umbral)

select pz.id,pz.nombre,inv.cantidad
from Inventario as inv
inner join Pieza as pz on pz.id=inv.idPieza
where inv.cantidad < 50;

-- 10. Obtener la lista de servicios más solicitados en un período específico

select distinct(sv.nombre)
from Servicio as sv
inner join Cita as ct on ct.idServicio=sv.id
where date(ct.FechaHora) BETWEEN "2024-06-08" and "2024-06-12";
-- 11. Obtener el costo total de reparaciones para cada cliente en un período
-- específico

SELECt rp.fecha,fa.idCliente, CostoTotal
from Reparacion as rp
inner join Servicio_reparacion as sr on sr.idReparacion=rp.id 
inner join Facturacion_detalle as fd on fd.idServicio_Reparacion=sr.id
inner join Facturacion as fa on fa.id=fd.idFacturacion
where rp.Fecha BETWEEN "2024-06-08" and "2024-06-12";

-- 12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
-- período específico

select distinct(emp.nombre) as Empleado, rp.Fecha,count(rp.id) AS "Cantidad de Reparaciones"
from Reparacion as rp
inner join Reparacion_Empleado as remp on remp.idReparacion=rp.id
inner join Empleado as emp on emp.id=remp.idEmpleado
group by emp.nombre, rp.Fecha
having rp.Fecha BETWEEN "2024-06-08" and "2024-06-12"
order by "Cantidad de Reparaciones" DESC;

-- 13. Obtener las piezas más utilizadas en reparaciones durante un período
-- específico

select rp.Fecha, pz.nombre
from Reparacion as rp 
inner join Reparacion_pieza as rpz on rpz.idReparacion=rp.id  
inner join Pieza as pz on pz.id= rpz.idPieza
where rp.Fecha BETWEEN "2024-06-08" and "2024-06-12";

-- 14. Calcular el promedio de costo de reparaciones por vehículo

select vh.id, md.nombre, avg(rp.CostoTotal) as "Costo Promedio"
from vehiculo as vh
inner join Reparacion as rp on rp.idVehiculo=vh.id
inner join Modelo as md on md.id=vh.idModelo
GROUP BY vh.id, md.nombre
order by vh.id;

-- 15. Obtener el inventario de piezas por proveedor

select pro.nombre, pz.nombre, pz.precio,inv.Cantidad
from Pieza as pz
inner join Inventario as inv on inv.idPieza=pz.id
inner join Proveedor_pieza as ppz on ppz.idPieza=pz.id 
inner join Proveedor as pro on pro.id=ppz.idProveedor;


-- 16. Listar los clientes que no han realizado reparaciones en el último año

SELECt id, cli.nombre
from Cliente as cli 
where cli.id not in (select idCliente from  Facturacion as fa);


-- 17. Obtener las ganancias totales del taller en un período específico

select sum(CostoTotal) as "Costo Total"
from Reparacion
where Fecha BETWEEN "2024-06-08" and "2024-06-12";


-- 18. Listar los empleados y el total de horas trabajadas en reparaciones en un
-- período específico (asumiendo que se registra la duración de cada reparación)

select distinct(emp.id), emp.nombre, sum(duracionTotal) as "Total Horas Trabajadas"
from Empleado as emp 
inner join Reparacion_Empleado as remp on remp.idEmpleado=emp.id 
inner join Reparacion as rp on rp.id=remp.idReparacion
where rp.Fecha BETWEEN "2024-06-01" and "2024-06-12"
GROUP BY emp.nombre, emp.id;


-- 19. Obtener el listado de servicios prestados por cada empleado en un período
-- específico.

select emp.nombre, sv.nombre
from Servicio as sv 
inner join Servicio_reparacion as svr on svr.idServicio=sv.id
inner join Reparacion as rp on rp.id=svr.idReparacion
inner join Reparacion_Empleado as remp on remp.idReparacion=rp.id 
inner join Empleado as emp on emp.id=remp.idEmpleado
where rp.Fecha BETWEEN "2024-06-01" and "2024-06-12";

-- Subconsultas

-- 1. Obtener el cliente que ha gastado más en reparaciones durante el último año.

select id, concat(nombre," ",apellido) as Nombre,(select Total from Facturacion as fac where fac.idCliente=cli.id and year(Fecha)="2024") as "Max Gastado" 
from Cliente as cli
order by (select Total from Facturacion as fac where fac.idCliente=cli.id) desc
limit 1;


-- 2. Obtener la pieza más utilizada en reparaciones durante el último mes

select f.cf as "Pieza",  max(f.ct) as "Cantidad Utilizado"
from(select pz.nombre as cf, count(pz.id) as ct, rp.Fecha
from pieza as pz
inner join Reparacion_pieza as rpz on rpz.idPieza= pz.id 
inner join Reparacion as rp on rp.id=rpz.idReparacion
where (year(rp.Fecha),month(rp.Fecha)) in (select max(Year(Fecha)) , max(Month(Fecha)) 
from Reparacion)
group by pz.id,rp.Fecha) as f
group by f.cf;


-- 3. Obtener los proveedores que suministran las piezas más caras



-- 4. Listar las reparaciones que no utilizaron piezas específicas durante el último
-- año
-- 5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial

-- Procedimientos Almacenados
-- 1. Crear un procedimiento almacenado para insertar una nueva reparación.
-- 2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.
-- 3. Crear un procedimiento almacenado para eliminar una cita
-- 4. Crear un procedimiento almacenado para generar una factura
-- 5. Crear un procedimiento almacenado para obtener el historial de reparaciones
-- de un vehículo
-- 6. Crear un procedimiento almacenado para calcular el costo total de
-- reparaciones de un cliente en un período
-- 7. Crear un procedimiento almacenado para obtener la lista de vehículos que
-- requieren mantenimiento basado en el kilometraje.
-- 8. Crear un procedimiento almacenado para insertar una nueva orden de compra
-- 9. Crear un procedimiento almacenado para actualizar los datos de un cliente
-- 10. Crear un procedimiento almacenado para obtener los servicios más solicitados
-- en un período