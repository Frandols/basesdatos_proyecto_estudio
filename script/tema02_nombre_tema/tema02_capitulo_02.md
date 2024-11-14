**TEMA 2 " Procedimientos y Funciones Almacenadas "**
- En esta sección, vamos a abordar distintos puntos respecto a los procedimientos y funciones almacenadas dentro de SQL server.
- Se hará una no muy extensa presentación sobre los conceptos referidos a cada uno, sus tipos y las ventajas que posee el utilizar estas funciones o procedimientos, a comparación de las operaciones directas.
  
***DEFINICIONES***
  
  ****Procedimientos Almacenados****
  - Un procedimiento almacenado de SQL Server es un grupo de una o varias instrucciones Transact-SQL. Donde una instrucción Transact-SQL (T-SQL) es una orden que       le das a SQL Server para que haga algo en la base de datos (sea agregar datos, obtener información de la base de datos, actualizar datos, eliminar datos.          Además también se puede definir condiciones, usar bucles y hacer transacciones).
  - Éstos procedimientos almacenados pueden:
      -	Aceptar parámetros de entrada y devolver varios valores en forma de parámetros de salida al programa que realiza la llamada.
      -	Contener instrucciones de programación que realicen operaciones en la base de datos. Entre otras, pueden contener llamadas a otros procedimientos.
      -	Devolver un valor de estado a un programa que realiza una llamada para indicar si la operación se ha realizado correctamente o se han producido errores, y         el motivo de estos.

  ****Funciones Almacenadas****
  - Una función almacenada en SQL es un conjunto de instrucciones que se agrupan para realizar una tarea específica en la base de datos. Las funciones almacenadas     son similares a los procedimientos almacenados, pero tienen algunas diferencias clave:
        -	Una función siempre devuelve un valor, a diferencia de los procedimientos almacenados, que pueden no devolver nada.
        -	Las funciones pueden usarse directamente en consultas SQL (como en SELECT, WHERE, etc.), mientras que los procedimientos almacenados no pueden.
        -	Una función puede devolver un solo valor de tipo de datos o una tabla (en el caso de las funciones de tipo tabla).
    
***TIPOS***

****Procedimientos Almacenados****
 
	Procedimientos almacenados del usuario 
		- Son procedimientos definidos por el usuario y se diseñaron para realizar tareas específicas en la base de datos. Son los más comunes y los 	que usualmente se crean para manejar operaciones en la base de datos como insertar, actualizar, eliminar o consultar datos.

	Procedimientos almacenados del sistema
 		- Son procedimientos definidos por SQL Server y están diseñados para realizar tareas administrativas y de mantenimiento en la base de datos. Estos procedimientos pueden ser invocados directamente sin necesidad de ser definidos por el usuario. Por ejemplo: 
   		sp_help: Muestra información sobre objetos de base de datos. 
   		sp_adduser: Agrega un nuevo 	usuario a la base de datos. 
   		sp_configure: Configura opciones del servidor.

	Procedimientos Temporales 
		- Son una variación de procedimientos definidos por el usuario, pero se almacenan en una base de datos especial llamada tempdb. Son útiles cuando se necesita crear procedimientos que solo existan durante una sesión o para realizar tareas temporales y específicas. 
		- Por ejemplo: 
			Locales: Se identifican con un solo signo de número (#) al principio del nombre del procedimiento. Son visibles solo para la conexión del usuario que los creó. Se eliminan automáticamente cuando se cierra la conexión. Ejemplo: #MiProcedimientoTemporal 
			Globales: Se identifican con doble signo de número (##) al principio del nombre del procedimiento. Son visibles para cualquier usuario que tenga acceso a la base de datos y se eliminan automáticamente después de que se cierre la última conexión que esté utilizando el procedimiento. Ejemplo: ##MiProcedimientoGlobal

	Procedimientos Extendidos Definidos por el Usuario 
		- Los procedimientos extendidos definidos por el usuario son bibliotecas externas (DLL) que puedes cargar y ejecutar desde SQL Server. Estos procedimientos permiten realizar operaciones más complejas que no se pueden hacer directamente con Transact-SQL.

****Funciones Almacenadas****

	Funciones escalares 
		- Descripción: Las funciones escalares son las más comunes. Devuelven un único valor de un tipo de datos específico (como int, varchar, date, etc.). Uso: Se utilizan en consultas para devolver un valor calculado. Por ejemplo, una función que calcule el salario total de un empleado sumando varias columnas.

	Funciones de tabla 
		- Descripción: Las funciones de tabla devuelven un conjunto de resultados, es decir, una tabla completa. A diferencia de las funciones escalares, no devuelven un único valor, sino que pueden devolver filas y columnas como una tabla virtual. Uso: Se utilizan cuando necesitas devolver varias filas o un conjunto de datos basado en un conjunto de condiciones.

	Funciones agregadas 
		- Descripción: Son funciones que realizan una operación de agregación, como contar, promediar, sumar, encontrar el máximo o el mínimo. Uso: Se utilizan para realizar cálculos agregados dentro de una consulta.

***VENTAJAS***

Procedimientos y Funciones Almacenadas

	Mayor seguridad 
		- Se limita el acceso a las tablas y otros objetos de base de datos a través de éstos procedimientos y funciones, en lugar de dar acceso directo a cada tabla o comando. 
  	Reutilización del código 
		- Se puede encapsular operaciones comunes en la base de datos dentro de un proceso similar para evitar escribir el código repetidas veces en diferentes partes de una aplicación. 
	Trafico de red reducido 
		- Se refiere a que usar los procedimientos y las funciones almacenadas, el cliente, solo envía una llamada única al procedimiento almacenado en el servidor, en lugar de enviar múltiples comandos SQL individuales.
	Simple mantenimiento 
		- Si necesitas modificar algo en la lógica de una operación, lo cambias solo una vez dentro de la función o el procedimiento. Seguís llamando al mismo procedimiento o función sin tener que preocuparte por la lógica interna. Esto hace que el mantenimiento sea más sencillo, ya que solo se cambia la base de datos y no el código de la aplicación.
	Rendimiento mejorado 
		- De forma predeterminada, un procedimiento o una función se compila la primera vez que se ejecuta y crea un plan de ejecución que vuelve a usarse en posteriores ejecuciones. Como el procesador de consultas no tiene que crear un nuevo plan, normalmente necesita menos tiempo para procesarlo.
