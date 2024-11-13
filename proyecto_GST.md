# Proyecto de Estudio!

**Estructura del documento principal:**

# PRESENTACIÓN (Gestion de servicio tecnico)

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:

- Boneta, Hiras
- Cabral, Braian
- De Los Santos, Francisco
- Echeverria, Theo

**Profesor**: Walter Vallejos

**Institucion**: Universidad Nacional del Nordeste

**Carrera**: Licenciatura en Sistemas de Informacion

**Año**: 2024

**Fecha**: 2/10/2024

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

En un negocio de servicio de reparacion de equipos electronicos se utiliza un flujo de trabajo desde que un cliente lleva su dispositivo para ser reparado, hasta que este es devuelto al cliente. En medio de esos dos eventos, el equipo pasa por un proceso de revision, de asignacion de presupuesto (el cual es analizado por un administrador del negocio) para reparar el dispositivo y finalmente pasa por su reparacion y es entregado al cliente.
El negocio trabaja con un conjunto de marcas preestablecidas, las cuales son Canon, Toshiba y Kyocera. Los tipos de dispositivos con los que se trabaja tambien estan preestablecidos, estos son: Impresoras, tanto laser como de inyeccion de tinta, fotocopiadoras y computadoras portatiles.
El personal que trabaja en la empresa puede ser de tres tipos: Master (que solo existe uno), Administrador y Tecnico. El usuario Master se encarga de dar de alta o de baja a los otros dos usuarios (administrador y tecnico). El administrador se encarga de ingresar los datos de los clientes que llegan al negocio y de los equipos que estos traen para reparacion, de aprobar o rechazar un presupuesto para la reparacion de un equipo, de aprobar la entrega de un equipo y generar un informe sobre el mismo. El tecnico se encarga de generar una revision de un equipo despues de su analisis, y de marcar un equipo como reparado.
Los equipos tienen un estado dependiendo de en que fase de su ciclo de vida a traves del negocio se encuentran, estos pueden estar: Pendiente de revision, en revision, pendiente de presupuesto, a la espera de aprobacion de presupuesto, pendiente de reparacion, en reparacion, listo para la entrega o irreparable. A un equipo solo le puede ser asignado un unico tecnico, asi como tambien un equipo solo puede tener una revision asociada al mismo.
Hay ciertos datos que resultan reelevantes para el negocio como ser:

- Sobre los clientes: DNI, apellido/s, nombre/s, telefono y correo.
- Sobre los equipos: Cliente, tipo de equipo, numero de serie, marca, modelo, observaciones (opcional), razon de ingreso, si el equipo a la hora de ingresar y estado del equipo.

### Definición o planteamiento del problema

Dado a que el negocio actualmente gestiona su flujo de trabajo a traves del uso de documentos fisicos, se encuentra la problematica de que los documentos se pierden, se dañan, llegan a destiempo y producen problemas en la dinamica de trabajo. En resumen: el hecho de trabajar con documentos fisicos genera deficiencias temporales que necesitan ser solventadas.

### Objetivo

- Objetivos generales: Se desea construir una base de datos para guardar toda la informacion relevante que actualmente el negocio gestiona de forma fisica, atendiendo a los datos relevantes para ellos y ayudando asi a la eficiencia del flujo de trabajo.
- Objetivos especificos: Que la empresa pueda organizar su flujo de trabajo, tener a su alcance de manera rapida la informacion de sus equipos, clientes y el estado de los mismos, optimizar al maximo la informacion relevante, mejorar el seguimiento de los equipos que son ingresados, que este disponible la informacion de manera rapida a la hora de generar un informe sobre los equipos que son devueltos a los clientes y tener un historial de los equipos, clientes y presupuestos que fueron trabajados.

## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

**TEMA 1 " ---- "**
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.

**TEMA 2 " Procedimientos y Funciones Almacenadas "**

- En esta sección, vamos a abordar distintos puntos respecto a los procedimientos y funciones almacenadas dentro de SQL server.
- Se hará una no muy extensa presentación sobre los conceptos referidos a cada uno, sus tipos y las ventajas que posee el utilizar estas funciones o procedimientos, a comparación de las operaciones directas.

**_DEFINICIONES_**

\***\*Procedimientos Almacenados\*\***

- Un procedimiento almacenado de SQL Server es un grupo de una o varias instrucciones Transact-SQL. Donde una instrucción Transact-SQL (T-SQL) es una orden que le das a SQL Server para que haga algo en la base de datos (sea agregar datos, obtener información de la base de datos, actualizar datos, eliminar datos. Además también se puede definir condiciones, usar bucles y hacer transacciones).
- Éstos procedimientos almacenados pueden:
  - Aceptar parámetros de entrada y devolver varios valores en forma de parámetros de salida al programa que realiza la llamada.
  - Contener instrucciones de programación que realicen operaciones en la base de datos. Entre otras, pueden contener llamadas a otros procedimientos.
  - Devolver un valor de estado a un programa que realiza una llamada para indicar si la operación se ha realizado correctamente o se han producido errores, y el motivo de estos.

\***\*Funciones Almacenadas\*\***

- Una función almacenada en SQL es un conjunto de instrucciones que se agrupan para realizar una tarea específica en la base de datos. Las funciones almacenadas son similares a los procedimientos almacenados, pero tienen algunas diferencias clave: - Una función siempre devuelve un valor, a diferencia de los procedimientos almacenados, que pueden no devolver nada. - Las funciones pueden usarse directamente en consultas SQL (como en SELECT, WHERE, etc.), mientras que los procedimientos almacenados no pueden. - Una función puede devolver un solo valor de tipo de datos o una tabla (en el caso de las funciones de tipo tabla).

**_TIPOS_**

\***\*Procedimientos Almacenados\*\***

    Procedimientos almacenados del usuario
    	- Son procedimientos definidos por el usuario y se diseñaron para realizar tareas específicas en la base de datos. Son los más comunes y los 	que usualmente se crean para manejar operaciones en la base de datos como insertar, actualizar, eliminar o consultar datos.

    Procedimientos almacenados del sistema

- Son procedimientos definidos por SQL Server y están diseñados para realizar tareas administrativas y de mantenimiento en la base de datos. Estos procedimientos pueden ser invocados directamente sin necesidad de ser definidos por el usuario. Por ejemplo:
  sp_help: Muestra información sobre objetos de base de datos.
  sp_adduser: Agrega un nuevo usuario a la base de datos.
  sp_configure: Configura opciones del servidor.

  Procedimientos Temporales - Son una variación de procedimientos definidos por el usuario, pero se almacenan en una base de datos especial llamada tempdb. Son útiles cuando se necesita crear procedimientos que solo existan durante una sesión o para realizar tareas temporales y específicas. - Por ejemplo:
  Locales: Se identifican con un solo signo de número (#) al principio del nombre del procedimiento. Son visibles solo para la conexión del usuario que los creó. Se eliminan automáticamente cuando se cierra la conexión. Ejemplo: #MiProcedimientoTemporal
  Globales: Se identifican con doble signo de número (##) al principio del nombre del procedimiento. Son visibles para cualquier usuario que tenga acceso a la base de datos y se eliminan automáticamente después de que se cierre la última conexión que esté utilizando el procedimiento. Ejemplo: ##MiProcedimientoGlobal

  Procedimientos Extendidos Definidos por el Usuario - Los procedimientos extendidos definidos por el usuario son bibliotecas externas (DLL) que puedes cargar y ejecutar desde SQL Server. Estos procedimientos permiten realizar operaciones más complejas que no se pueden hacer directamente con Transact-SQL.

\***\*Funciones Almacenadas\*\***

    Funciones escalares
    	- Descripción: Las funciones escalares son las más comunes. Devuelven un único valor de un tipo de datos específico (como int, varchar, date, etc.). Uso: Se utilizan en consultas para devolver un valor calculado. Por ejemplo, una función que calcule el salario total de un empleado sumando varias columnas.

    Funciones de tabla
    	- Descripción: Las funciones de tabla devuelven un conjunto de resultados, es decir, una tabla completa. A diferencia de las funciones escalares, no devuelven un único valor, sino que pueden devolver filas y columnas como una tabla virtual. Uso: Se utilizan cuando necesitas devolver varias filas o un conjunto de datos basado en un conjunto de condiciones.

    Funciones agregadas
    	- Descripción: Son funciones que realizan una operación de agregación, como contar, promediar, sumar, encontrar el máximo o el mínimo. Uso: Se utilizan para realizar cálculos agregados dentro de una consulta.

**_VENTAJAS_**

Procedimientos y Funciones Almacenadas

    Mayor seguridad
    	- Se limita el acceso a las tablas y otros objetos de base de datos a través de éstos procedimientos y funciones, en lugar de dar acceso directo a cada tabla o comando.

Reutilización del código - Se puede encapsular operaciones comunes en la base de datos dentro de un proceso similar para evitar escribir el código repetidas veces en diferentes partes de una aplicación.
Trafico de red reducido - Se refiere a que usar los procedimientos almacenados, el cliente, solo envía una llamada única al procedimiento almacenado en el servidor, en lugar de enviar múltiples comandos SQL individuales.
Simple mantenimiento - Si necesitas modificar algo en la lógica de una operación, lo cambias solo una vez dentro de la función almacenada. Seguís llamando al mismo procedimiento sin tener que preocuparte por la lógica interna. Esto hace que el mantenimiento sea más sencillo, ya que solo se cambia la base de datos y no el código de la aplicación.
Rendimiento mejorado - De forma predeterminada, un procedimiento se compila la primera vez que se ejecuta y crea un plan de ejecución que vuelve a usarse en posteriores ejecuciones. Como el procesador de consultas no tiene que crear un nuevo plan, normalmente necesita menos tiempo para procesar el procedimiento.

**TEMA 4 "Transacciones y transacciones anidadas"**

## ¿Qué son las transacciones?

Las transacciones en bases de datos son operaciones que garantizan la **integridad y consistencia de los datos**. Consisten en una o más instrucciones que se ejecutan de forma secuencial y se consideran una unidad **atómica**, es decir, **la transacción completa o no se realiza en absoluto**.

SQL Server y otros sistemas de gestión de bases de datos relacionales implementan el modelo **ACID** (Atomicidad, Consistencia, Aislamiento y Durabilidad) para asegurar el manejo confiable de las transacciones. Este modelo asegura que los datos se mantengan íntegros incluso en caso de errores o fallos del sistema.

## ¿Qué nos ofrece una transacción?

Una transacción garantiza que todas las operaciones **se completen o se reviertan en su totalidad**. Esto es particularmente útil en operaciones complejas que involucran múltiples instrucciones, ya que, si una instrucción falla, la transacción completa puede revertirse usando la instrucción **ROLLBACK**. Esto asegura que los datos no queden en un estado intermedio o inconsistente.

## ¿Cómo se escriben las transacciones en T-SQL?

En **Transact-SQL (T-SQL)**, se inicia una transacción con `BEGIN TRANSACTION`, se confirma con `COMMIT` y, si ocurre un error, se revierte con `ROLLBACK`. Este enfoque es ampliamente utilizado para **operaciones de inserción, actualización o eliminación de datos** en varias tablas que dependen unas de otras.

## ¿Qué son las transacciones anidadas?

Las **transacciones anidadas** son transacciones dentro de otra transacción. En T-SQL, las transacciones anidadas permiten realizar **múltiples operaciones agrupadas en varios niveles de transacciones**. Cada `BEGIN TRANSACTION` anidado incrementa un contador de nivel de transacción, pero solo la primera transacción iniciada puede realizar un `COMMIT` definitivo.

> **Nota:** Si una transacción anidada interna realiza un `ROLLBACK`, la transacción externa también debe revertirse, garantizando así la consistencia de los datos.

### Ventajas

- Las transacciones aseguran que las operaciones complejas se realicen completamente o no se realicen en absoluto.
- Las transacciones anidadas permiten manejar sub-operaciones dentro de una transacción principal, ofreciendo mayor control y manejo de errores.

### Desventajas

- Las transacciones anidadas pueden dificultar la **depuración** y el manejo de errores en sistemas complejos.
- Un `ROLLBACK` en una transacción anidada provoca la reversión de toda la transacción, lo cual puede no ser siempre el comportamiento deseado.

## Conclusión

Las **transacciones** y las **transacciones anidadas** son herramientas cruciales en el manejo de la consistencia de los datos. El uso adecuado de estas técnicas depende del contexto y de la naturaleza de las operaciones de la base de datos.

## CAPÍTULO III: METODOLOGÍA SEGUIDA

Donec lobortis tincidunt erat, non egestas mi volutpat in. Cras ante purus, luctus sed fringilla non, ullamcorper at eros.

**a) Cómo se realizó el Trabajo Práctico**
Vestibulum rutrum feugiat molestie. Nunc id varius augue. Ut augue mauris, venenatis et lacus ut, mattis blandit urna. Fusce lobortis, quam non vehicula scelerisque, nisi enim ultrices diam, ac tristique libero ex nec orci.

**b) Herramientas (Instrumentos y procedimientos)**
Donec lobortis tincidunt erat, non egestas mi volutpat in. Cras ante purus, luctus sed fringilla non, ullamcorper at eros. Integer interdum id orci id rutrum. Curabitur facilisis lorem sed metus interdum accumsan.

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS

Maecenas molestie lacus tincidunt, placerat dolor et, ullamcorper erat. Mauris tortor nisl, ultricies ac scelerisque nec, feugiat in nibh. Pellentesque interdum aliquam magna sit amet rutrum.

### Diagrama conceptual (opcional)

Ejemplo usando Live Editor https://mermaid.js.org/ (ejemplo opcional)

```mermaid
erDiagram
CUSTOMER  }|..|{  DELIVERY-ADDRESS  : has
CUSTOMER  ||--o{  ORDER  : places
CUSTOMER  ||--o{  INVOICE  : "liable for"
DELIVERY-ADDRESS  ||--o{  ORDER  : receives
INVOICE  ||--|{  ORDER  : covers
ORDER  ||--|{  ORDER-ITEM  : includes
PRODUCT-CATEGORY  ||--|{  PRODUCT  : contains
PRODUCT  ||--o{  ORDER-ITEM  : "ordered in"
```

### Diagrama relacional

![diagrama_relacional](https://github.com/Frandols/basesdatos_proyecto_estudio/blob/main/doc/image_relational.png)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_datos.pdf) del diccionario de datos.

### Script de definicion de datos

Acceso al documento [SQL](script/script_ddl_proyecto.sql) del script.

### Desarrollo TEMA 1 "----"

Fusce auctor finibus lectus, in aliquam orci fermentum id. Fusce sagittis lacus ante, et sodales eros porta interdum. Donec sed lacus et eros condimentum posuere.

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)

### Desarrollo TEMA 2 "Procedimientos y Funciones Almacenadas"

En esta sección se colocará un documento el cual se enseña como crear funciones y procedimientos almacenados, además de que se colocaran los archivos .SQL donde estaran los códigos pedidos como tarea y un archivo que se utilizará para la exposición

> Documento sobre procedimientos y funciones almacenadas [DOCX]()
> Scripts utilizados para la exposición [scripts-> tema_2](script/tema02_nombre_tema)
> Archivo utilizado para la presentación

### Desarrollo TEMA 3 "Optimización de Consultas a través de índices"

### Desarrollo TEMA 4 "Transacciones y transacciones anidadas"

Aqui se desarrolla el tema "Transacciones y transacciones anidadas".

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_4](script/tema04_transacciones-y-transacciones-anidadas)

## CAPÍTULO V: CONCLUSIONES

Nunc sollicitudin purus quis ante sodales luctus. Proin a scelerisque libero, vitae pharetra lacus. Nunc finibus, tellus et dictum semper, nisi sem accumsan ligula, et euismod quam ex a tellus.

## BIBLIOGRAFÍA DE CONSULTA

### TEMA 2

- https://learn.microsoft.com/es-es/sql/t-sql/language-reference?view=sql-server-ver15
- https://learn.microsoft.com/es-es/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16
- https://learn.microsoft.com/es-es/sql/relational-databases/user-defined-functions/user-defined-functions?view=sql-server-ver15
- https://learn.microsoft.com/es-es/sql/relational-databases/stored-procedures/create-a-stored-procedure?view=sql-server-ver16
- https://learn.microsoft.com/en-us/sql/relational-databases/user-defined-functions/create-user-defined-functions-database-engine?view=sql-server-ver16
