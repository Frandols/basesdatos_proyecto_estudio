PROCEDIMIENTOS Y FUNCIONES ALMACENADAS

INTRODUCCIÓN
En este documento se van a presentar: 
Documentación paso a paso de la creación de procedimientos y funciones.

***CREACIÓN DE PROCEDIMIENTOS ALMACENADOS***

****1.	Identificar la tabla para la cual queremos crear el/los procedimiento/s****
Para este ejemplo, voy a trabajar con una tabla denominada Clientes

****2.	Abrimos el código para crear un procedimiento almacenado****
Dentro de nuestro SQL SERVER, vamos a abrir una nueva conexión y en el Explorador de objetos accederemos a Databases-> La base de datos sobre la cual queremos trabajar -> Programmability -> click derecho en Stored Procedures -> accedemos a la opción Stored Procedure…

![image](https://github.com/user-attachments/assets/19bbf912-fa58-4be0-8c78-4ce120d284d2)
![image](https://github.com/user-attachments/assets/5e1d66f9-a970-4950-a55a-472e2b482791)



****3.	Edición de las partes principales del código****
Una vez se nos abra el código dónde crearemos nuestro procedimiento, vamos a acceder a la opción Query en la parte superior de nuestro compilador y clickearemos en Specify Values for Template Parameters…

![image](https://github.com/user-attachments/assets/92296bac-4f88-4bd6-970a-b1be82dd4cfb)
![image](https://github.com/user-attachments/assets/989da09d-7865-44ec-b820-e173f87332ea)
![image](https://github.com/user-attachments/assets/9f756d8e-5ffe-4872-ae55-88ac8fb576e1)

Al abrir esta ventana, podremos modificar el autor, agregar una fecha, una descripción de lo que realiza el procedimiento, el nombre del procedimiento, etc.
Quedando algo así:

![image](https://github.com/user-attachments/assets/085b5a64-ce37-4303-922c-8aff5f516094)



****4.	Modificar toda la lógica del procedimiento y ejecutar el código****
Agregamos la lógica al código y ejecutamos el código con el botón Execute en la parte superior.

![image](https://github.com/user-attachments/assets/1149d1ff-85ee-4028-88e9-a0ec20beba97)


****5.	Procedimiento creado exitosamente en la base de datos****
En nuestro explorador de objetos, en la carpeta Stored Procedures podremos observar que se haya creado correctamente el procedimiento.

![image](https://github.com/user-attachments/assets/951406d8-28c0-4d54-a806-7b0d37d49b56)


****6.	Ejecución de los procedimientos****
Existen dos maneras de ejecutar nuestro procedimiento. Desde una Query, o desde el explorador de objetos.

-	Desde una query: Escribimos la sentencia EXEC, a continuación el nombre del procedimiento, y por último le pasamos los parámetros necesarios de ésta forma.

![image](https://github.com/user-attachments/assets/c7872bc1-91fd-465f-a7b2-3e56620706e2)

  
-	Desde el explorador de objetos: Vamos a dar click derecho a nuestro procedimiento creado y presionar en Execute Store Procedure. En la columna Value vamos a colocar los valores que queremos guardar en los respectivos atributos. Luego presionamos Ok y se agregará un nuevo cliente (en este caso).

![image](https://github.com/user-attachments/assets/32f7ffb8-cdd0-47d1-bc85-41fab608aa71)


***CREACIÓN DE FUNCIONES ALMACENADAS***

1.	Abrimos el código generador de la función
Vamos a crear una conexión->Acceder al explorador de objetos->Clickeamos en la base de datos en cual queremos crear la función->Programmability-> click derecho en la carpeta Functions->New->Seleccionamos el tipo de función que queremos crear

![image](https://github.com/user-attachments/assets/eb65dfcd-0195-4eb9-83c6-5e4d775f8565)

2.	Editar la información de nuestra función
Procedemos a una vez estando con el código abierto, acceder a Query->Specify Values for Template Parameters. Vamos a modificar el autor, la fecha, la descripción y el nombre de nuestra función

![image](https://github.com/user-attachments/assets/f32567e6-ee96-4180-b4ee-d3ccc05b0253)
![image](https://github.com/user-attachments/assets/36554388-2cab-4a37-9dbb-67df98ef17aa)

3.	Modificar la función
Ahora procederemos a crear la función teniendo en cuenta la manera en la que se construye la función como se observa en la imagen

![image](https://github.com/user-attachments/assets/18a38a96-8c19-4249-9163-e6f2b1adcb61)

Quedando:

![image](https://github.com/user-attachments/assets/b4e22415-b561-47a9-9283-56b8f1d1d991)

4.	Ejecutamos el código

5.	Llamamos a la función
Para llamar a la función que creamos, en este caso se llamaría con la sentencia SELECT, el nombre de la función y entre paréntesis el parámetro, quedando de ésta forma

![image](https://github.com/user-attachments/assets/3648d31b-ab68-4a24-989b-37fa02d21b71)







![image](https://github.com/user-attachments/assets/f5df8bf2-bb68-4818-a5b5-948055027ed9)





