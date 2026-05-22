CREATE DATABASE Enterprise
    ON
    PRIMARY (
    NAME = Enterprise_data,
    FILENAME = '',
    SIZE = 10MB,
    MAXSIZE = 500MB,
    FILEGROWTH = 5MB
    )
    LOG ON (
    NAME = Enterprise_log,
    FILENAME = '',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
    );
GO

use Enterprise
go

create table cat_Areas(
    id_area smallint primary key,
    nom_area varchar(30) not null
)
go

create table cat_TipoSangre(
  id_tipsan smallint primary key,
  desc_tipsan varchar(10) not null
)
go

create table cat_Deptos(
    id_depto smallint primary key,
    cve_area_depto smallint not null,
    nom_depto varchar(30) not null
    constraint "fk_cve_area_depto" foreign key(cve_area_depto)
    references cat_Areas(id_area)
)
go

create table cat_Puestos(
    id_puesto smallint primary key,
    cve_depto_puesto smallint not null,
    nom_puesto varchar(30) not null,
    sueldo_puesto decimal(10,2) not null,
    constraint "fk_cve_depto_puesto" foreign key(cve_depto_puesto)
    references cat_Deptos(id_depto)
)
go

create table Empleado
(
    id_emp smallint primary key,
    tipsan_emp smallint not null,
    puesto_emp smallint not null,
    nom_emp varchar(30) not null,
    apa_emp varchar(15),
    ama_emp varchar(15) not null,
    sex_cli varchar(1), --M masculino, F femenino, X no binario
    fna_emp date not null,
    constraint "fk_tipsan" foreign key(tipsan_emp)
    references cat_TipoSangre(id_tipsan),
    constraint "fk_puesto_emp" foreign key(puesto_emp)
    references cat_Puestos(id_puesto)
);
go


INSERT INTO cat_TipoSangre (id_tipsan, desc_tipsan) VALUES
    (1, 'A+'),
    (2, 'A-'),
    (3, 'B+'),
    (4, 'B-'),
    (5, 'AB+'),
    (6, 'AB-'),
    (7, 'O+'),
    (8, 'O-');
GO

INSERT INTO cat_Areas (id_area, nom_area) VALUES
    (1, 'Dirección General'),
    (2, 'Tecnología'),
    (3, 'Recursos Humanos'),
    (4, 'Operaciones'),
    (5, 'Ventas');
GO

INSERT INTO cat_Deptos (id_depto, nom_depto, cve_area_depto) VALUES
    (1, 'Estrategia', 1),
    (2, 'Auditoría', 1),
    (3, 'Desarrollo', 2),
    (4, 'Infraestructura', 2),
    (5, 'Reclutamiento', 3),
    (6, 'Nóminas', 3),
    (7, 'Logística', 4),
    (8, 'Producción', 4),
    (9, 'Ventas Nacionales', 5),
    (10, 'Ventas Internacionales', 5);
GO

INSERT INTO cat_Puestos (id_puesto, cve_depto_puesto, nom_puesto, sueldo_puesto) VALUES
    (1, 1, 'Director CEO', 95000.00), (2, 1, 'Asistente Dirección', 20000.00), (3, 1, 'Gerente Estrategia', 45000.00),
    (4, 2, 'Auditor Senior', 35000.00), (5, 2, 'Auditor Junior', 18000.00), (6, 2, 'Analista de Riesgos', 25000.00),
    (7, 3, 'Líder Técnico', 60000.00), (8, 3, 'Desarrollador Backend', 40000.00), (9, 3, 'Desarrollador Frontend', 38000.00),
    (10, 4, 'DevOps Engineer', 45000.00), (11, 4, 'SysAdmin', 35000.00), (12, 4, 'Soporte Técnico', 15000.00),
    (13, 5, 'Jefe Reclutamiento', 30000.00), (14, 5, 'Entrevistador', 16000.00), (15, 5, 'Psicólogo Laboral', 18000.00),
    (16, 6, 'Analista Nóminas', 22000.00), (17, 6, 'Contador', 24000.00), (18, 6, 'Auxiliar Administrativo', 12000.00),
    (19, 7, 'Coordinador Envíos', 25000.00), (20, 7, 'Chofer', 12000.00), (21, 7, 'Almacenista', 10000.00),
    (22, 8, 'Supervisor Planta', 28000.00), (23, 8, 'Operador Maquinaria', 14000.00), (24, 8, 'Ensamblador', 11000.00),
    (25, 9, 'Gerente Regional', 40000.00), (26, 9, 'Vendedor Senior', 20000.00), (27, 9, 'Vendedor Junior', 12000.00),
    (28, 10, 'Key Account Manager', 45000.00), (29, 10, 'Especialista Comercio', 30000.00), (30, 10, 'Traductor Comercial', 22000.00);
GO

INSERT INTO Empleado (id_emp, tipsan_emp, puesto_emp, nom_emp, apa_emp, ama_emp, sex_cli, fna_emp) VALUES
    (1, 3, 1, 'Carlos', 'Gómez', 'Pérez', 'M', '1985-05-12'),
    (2, 7, 8, 'Ana', 'López', 'Ruiz', 'F', '1992-08-23'),
    (3, 1, 20, 'Luis', 'Martínez', 'Soto', 'M', '1990-11-05'),
    (4, 2, 10, 'María', 'García', 'Vega', 'F', '1995-02-14'),
    (5, 1, 19, 'Jorge', 'Hernández', 'Luna', 'M', '1988-07-30'),
    (6, 4, 30, 'Diana', 'Torres', 'Mora', 'F', '1998-09-18'),
    (7, 8, 15, 'Raúl', 'Díaz', 'Ríos', 'M', '1991-04-22'),
    (8, 5, 25, 'Elena', 'Vargas', 'Cruz', 'F', '1989-12-01'),
    (9, 6, 12, 'Pedro', 'Ramírez', 'Gil', 'M', '1996-03-10'),
    (10, 1, 4, 'Sofía', 'Ortiz', 'Paz', 'F', '1994-06-25');
GO

select * from cat_Areas;
select * from cat_Deptos;
select * from cat_Puestos;
select * from cat_TipoSangre;
select * from Empleado;


select nom_emp as nombre_empleado,
       nom_puesto as nombre_puesto
from empleado, cat_puestos, cat_deptos
where puesto_emp = id_puesto
  and cve_depto_puesto = id_depto
  and cve_area_depto = 2;

select nom_emp + ' ' + isnull(apa_emp, '') + ' ' + ama_emp as nombre_completo,
       fna_emp as fecha_nacimiento,
       desc_tipsan as tipo_sangre,
       nom_area as nombre_area
from empleado, cat_tiposangre, cat_puestos, cat_deptos, cat_areas
where tipsan_emp = id_tipsan
  and puesto_emp = id_puesto
  and cve_depto_puesto = id_depto
  and cve_area_depto = id_area
  and id_area = 4
  and desc_tipsan = 'A+';

select top 1 nom_emp + ' ' + isnull(apa_emp, '') + ' ' + ama_emp as nombre_completo,
             nom_puesto as puesto,
             sueldo_puesto as sueldo
from empleado, cat_puestos
where puesto_emp = id_puesto
order by sueldo_puesto desc;

select nom_area as area,
       nom_depto as departamento,
       nom_puesto as puesto,
       sueldo_puesto as sueldo
from cat_puestos, cat_deptos, cat_areas
where cve_depto_puesto = id_depto
  and cve_area_depto = id_area
order by nom_area asc, nom_depto asc, nom_puesto asc;