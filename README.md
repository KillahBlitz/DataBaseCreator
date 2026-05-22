# DataBaseCreator

Este repositorio reúne scripts SQL Server para crear y poblar distintas bases de datos de práctica. Cada archivo representa un sistema de datos diferente y contiene la definición de su estructura, relaciones entre tablas, inserción de datos de ejemplo y algunas consultas para validación.

## Estructura del proyecto

```text
DataBaseCreator/
├── Enterprise/
│   └── EnterpriseDB.sql
└── RealStore/
    └── Store.sql
```

## Archivos SQL

### 1. `RealStore/Store.sql`

Este script crea la base de datos **RealStore**, pensada como un sistema de ventas para tienda o comercio minorista.

Incluye:

- Creación de la base de datos y sus archivos de datos y registro.
- Tablas principales:
    - `clientes`: almacena información de clientes.
    - `productos`: registra catálogo, precios y existencia.
    - `ventas`: guarda la nota de venta y la relación con el cliente.
    - `detalles`: contiene el detalle de productos vendidos por nota.
- Relaciones entre tablas mediante llaves foráneas.
- Inserción de datos de ejemplo para clientes, productos, ventas y detalles.
- Consultas de práctica para obtener:
    - Nombre completo del cliente con sus compras.
    - Totales de compra por cliente.
    - Filtros por fecha y por apellido.

Uso recomendado:

- Ejecutar primero la creación de la base de datos.
- Después crear las tablas.
- Luego cargar los datos de prueba.
- Finalmente correr las consultas de ejemplo.

### 2. `Enterprise/EnterpriseDB.sql`

Este script crea la base de datos **Enterprise**, enfocada en un sistema empresarial o de recursos humanos.

Incluye:

- Creación de la base de datos Enterprise.
- Tablas de catálogo:
    - `cat_Areas`: áreas o divisiones de la empresa.
    - `cat_TipoSangre`: catálogo de tipos de sangre.
    - `cat_Deptos`: departamentos ligados a un área.
    - `cat_Puestos`: puestos vinculados a un departamento y con sueldo asignado.
- Tabla principal:
    - `Empleado`: contiene los datos personales, tipo de sangre, puesto y fecha de nacimiento de cada empleado.
- Relaciones entre catálogos y empleados mediante llaves foráneas.
- Inserción de datos de ejemplo en catálogos y empleados.
- Consultas de validación para:
    - Ver contenido de cada tabla.
    - Obtener empleados por área.
    - Filtrar empleados por tipo de sangre y área.
    - Identificar el puesto mejor pagado.
    - Listar áreas, departamentos y puestos ordenados.

## Cómo ejecutar los scripts en SQL Server

1. Abre SQL Server Management Studio o tu cliente SQL preferido.
2. Conéctate a una instancia de SQL Server.
3. Ejecuta el script que quieras probar:
   - `RealStore/Store.sql`
   - `Enterprise/EnterpriseDB.sql`
4. Revisa que la base de datos, tablas y datos de ejemplo se creen correctamente.

## Notas importantes

- Los scripts están escritos para **SQL Server**.
- Los campos `FILENAME` aparecen vacíos porque el objetivo del repositorio es didáctico; en un entorno real debes indicar la ruta física de los archivos `.mdf` y `.ldf`.
- Algunos inserts usan datos de ejemplo que permiten probar consultas y relaciones entre tablas.
- Si ejecutas un script más de una vez, puede aparecer error por objetos ya existentes o por registros duplicados.

## Objetivo del repositorio

El propósito de este proyecto es servir como base de aprendizaje para:

- Diseño de bases de datos relacionales.
- Creación de tablas con llaves primarias y foráneas.
- Inserción de datos de prueba.
- Consultas con joins, filtros, agrupaciones y funciones básicas.
- Organización de diferentes sistemas de datos dentro de SQL Server.

