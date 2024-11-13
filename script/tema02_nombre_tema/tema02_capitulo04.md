**PROCEDIMIENTOS Y FUNCIONES ALMACENADAS**

***INTRODUCCIÓN***
En este documento se van a presentar: 
Documentación paso a paso de la creación de procedimientos y funciones.

***CREACIÓN DE PROCEDIMIENTOS ALMACENADOS***

1.	Identificar la tabla para la cual queremos crear el/los procedimiento/s
Para este ejemplo, voy a trabajar con una tabla denominada Clientes

2.	Abrimos el código para crear un procedimiento almacenado
Dentro de nuestro SQL SERVER, vamos a abrir una nueva conexión y en el Explorador de objetos accederemos a Databases-> La base de datos sobre la cual queremos trabajar -> Programmability -> click derecho en Stored Procedures -> accedemos a la opción Stored Procedure…

![image](https://github.com/user-attachments/assets/19bbf912-fa58-4be0-8c78-4ce120d284d2)
![image](https://github.com/user-attachments/assets/5e1d66f9-a970-4950-a55a-472e2b482791)



4.	Edición de las partes principales del código
Una vez se nos abra el código dónde crearemos nuestro procedimiento, vamos a acceder a la opción Query en la parte superior de nuestro compilador y clickearemos en Specify Values for Template Parameters…

5.	Modificar toda la lógica del procedimiento y ejecutar el código
Agregamos la lógica al código y ejecutamos el código con el botón Execute en la parte superior.

6.	Procedimiento creado exitosamente en la base de datos
En nuestro explorador de objetos, en la carpeta Stored Procedures podremos observar que se haya creado correctamente el procedimiento.

7.	Ejecución de los procedimientos
Existen dos maneras de ejecutar nuestro procedimiento. Desde una Query, o desde el explorador de objetos.

-	Desde una query: Escribimos la sentencia EXEC, a continuación el nombre del procedimiento, y por último le pasamos los parámetros necesarios de ésta forma.
  
-	Desde el explorador de objetos: Vamos a dar click derecho a nuestro procedimiento creado y presionar en Execute Store Procedure. En la columna Value vamos a colocar los valores que queremos guardar en los respectivos atributos. Luego presionamos Ok y se agregará un nuevo cliente (en este caso).



