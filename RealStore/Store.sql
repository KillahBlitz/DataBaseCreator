-- DDL ES PARA ESTRUCTURAS DATA LENGUAJE
-- DML ES PARA DATOS DATA MANAGMENT LENGUAJE


CREATE DATABASE RealStore
ON
PRIMARY (
    NAME = RealStore_data,
    FILENAME = '',
    SIZE = 10MB,
    MAXSIZE = 500MB,
    FILEGROWTH = 5MB
)
LOG ON (
    NAME = RealStore_log,
    FILENAME = '',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
);
GO

use RealStore
go

create table clientes
(
    id_cli smallint primary key,
    nom_cli varchar(30) not null,
    patt_cli varchar(15),
    matt_cli varchar(15) not null,
    sex_cli varchar(1), --M masculino, F femenino, X no binario
    tel_cli varchar(10) not null,
    dir_cli varchar(100) not null
);
go

create table productos
(
    id_prod int primary key,
    nom_prod varchar(60) not null,
    prec_compra decimal(6,2) not null,
    prec_venta decimal(6,2) not null,
    stock_prod smallint not null
);
go

create table ventas
(
    nota_vta int primary key,
    num_cli_vta smallint not null,
    fecha_vta date not null,
    hora_vta time not null,
    constraint "fk_cliente" foreign key(num_cli_vta)
    references clientes(id_cli)
)
go

create table detalles
(
    id_nota_det int not null,
    cve_prod_det int not null,
    quantity_prod_det smallint not null,
    constraint "fk_venta" foreign key(id_nota_det)
    references ventas(nota_vta),
    constraint "fk_productos" foreign key(cve_prod_det)
    references productos(id_prod)
)
go

insert into clientes values (1,'MARIA','GOMEZ',
                             'PEREZ','F',
                             '5556581111','CASA 1')

select * from clientes

insert into clientes values (1,'MARIA','GOMEZ',
                             'PEREZ','F',
                             '5556581111','CASA 1')
GO

insert into clientes values (3,'MARIANA','GOMEZ',
                             'PEREIRA','F',
                             '5556584501','CASA 3')
GO

insert into clientes values (4,'RAMIRO','RUIZ',
                             'JIMENEZ','M',
                             '5551312141','CASA 4')
GO

insert into clientes
(nom_cli, matt_cli, patt_cli, dir_cli, sex_cli, tel_cli, id_cli)
values
('Francisco', 'Rojas', 'Gutierrez', 'CASA 2', 'M', '5587965500', 2)
GO

select * from clientes

insert into productos values
(1, 'COCA COLA ZERO 600ML', 17.50, 22.50, 50),
(2, 'LECHE ALPURA 1L', 25.00, 30.00, 10),
(3, 'CEREAL KELLOGS 1KG', 50.00, 58.00, 9),
(4, 'MALBORO ROJO', 60.00, 75.00, 20),
(5, 'AGUA BONAFONT 600ML', 9.00, 13.00, 15);
GO

select * from productos

insert into ventas values
(1,2, '10-05-2026', '17:30')
GO

select * from ventas

insert into detalles values
(1, 5, 2),
(1, 4, 1),
(1, 1, 2),
(1, 2, 1)

select * from detalles

--saber cliente, nombre con apellidos, numero de la nota, dia de la compra, productos comprados y cuanto de cada uno

select id_cli, nom_cli + ' ' + patt_cli + ' ' +  matt_cli as nombre,
       nota_vta, fecha_vta, nom_prod, quantity_prod_det
from clientes, ventas, detalles, productos
where num_cli_vta = id_cli
and nota_vta = id_nota_det
and cve_prod_det = id_prod

--que quieres? select
--de donde from
--como lo obtengo where predicado

select * from ventas
insert into ventas values(
2, 1,'2026-11-05', '20:59'
                         )

insert into detalles values
(2, 3, 1),
(2, 4, 2),
(2, 3, 4)

select id_cli, nom_cli, sum(quantity_prod_det * prec_venta) as compras, sex_cli
from clientes, ventas, detalles, productos
where num_cli_vta = id_cli
and nota_vta = id_nota_det
and cve_prod_det = id_prod
and patt_cli <> 'GOMEZ'
group by nom_cli, id_cli, sex_cli

select * from ventas
where fecha_vta = '2026-10-05'

select * from ventas
where fecha_vta not like '%05%'

select * from clientes
where patt_cli = 'GUTIERREZ' or patt_cli = 'GOMEZ'

select * from clientes
where patt_cli not in ('GUTIERREZ', 'RUIZ')