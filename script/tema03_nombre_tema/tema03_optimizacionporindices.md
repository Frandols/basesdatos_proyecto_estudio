## TEMA 3 "Optimización de Consultas a través de índices"

En SQLSERVER, los índices representan una herramienta eficaz que se utilizan para mejorar la eficiencia de las consultas a una tabla. Estos contienen copias de los datos de la tabla, organizados de una manera tal que permite que las consultas encuentren los datos de manera más rápida. Los índices son importantes en las bases de datos relacionales grandes, donde las consultas pueden ser muy complejas y los tiempos de respuestas de la consulta pueden ser críticos. Al agregar índices, se puede acelerar el proceso de recuperación de datos y mejorar el rendimiento de la base de datos.

### Los tipos de índices que existen en SQL Server:

> **_Clustered Index:_** Es un tipo de índice que determina el orden físico de los datos en una tabla. Solo puede haber un índice agrupado por tabla y este ordena la tabla en función de la clave primaria. Es decir, los datos se almacenan en el disco en función de los valores de la columna de la clave primaria. Por ejemplo con la tabla Equipos:
> CREATE CLUSTERED INDEX IX_Equipos_FechaDeIngreso ON dbo.Equipos(fechaDeIngreso);

> **_Nonclustered Index:_** A diferencia del índice agrupado, los índices no agrupados no ordenan físicamente la tabla. En su lugar, crean una estructura separada que incluye una copia de la columna de la clave primaria y la columna de índice. Esto permite una búsqueda más rápida de datos en la tabla. Por ejemplo con la tabla Equipos:
> CREATE NONCLUSTERED INDEX IX_Equipos_FechaDeIngreso_NC ON dbo.Equipos(fechaDeIngreso);

> **_Unique Index:_** Este tipo de índice se utiliza para garantizar que no se inserten valores duplicados en una tabla. Es similar a un índice no agrupado, pero solo puede haber un valor único para cada valor de la clave. Por ejemplo con la tabla Equipos:
> CREATE UNIQUE NONCLUSTERED INDEX IX_Equipos_FechaDeIngreso_Unique ON dbo.Equipos(fechaDeIngreso);

> **_Filtered Index:_** Este tipo de índice se utiliza para filtrar datos específicos en una tabla. Solo incluyen filas que cumplen con una condición específica. Esto reduce el tamaño del índice y mejora la velocidad de búsqueda de datos. Por ejemplo con la tabla Equipos:
> CREATE NONCLUSTERED INDEX IX_Equipos_FechaDeIngreso_Filtered ON dbo.Equipos(fechaDeIngreso) WHERE baja = 'No';

> **_Full-Text Index:_** Este tipo de índice se utiliza para buscar texto completo en una tabla. Permite la búsqueda de palabras clave y frases en lugar de simplemente buscar coincidencias exactas. Por ejemplo con la tabla Equipos:
> CREATE FULLTEXT INDEX ON dbo.Equipos(razonDeIngreso) KEY INDEX IX_Equipos_FechaDeIngreso;

> Es importante conocer los diferentes tipos de índices para poder elegir el más adecuado según las necesidades de la base de datos y mejorar la eficiencia de las consultas.

## CONCLUSIONES PARTICULARES DEL TEMA
Con las pruebas realizadas e información obtenida, pudimos observar que, el uso de índices agrupados y la inclusion de columnas adicionales en el indice redujeron los tiempos de respuesta y ejecucion del motor de base de datos, mejorando la eficiencia de las consultas al contener un gran volumen de datos o bases de datos extremadamente grandes. Teniendo en cuenta que la seleccion de un tipo de indice incorrecto podria tener un impacto negativo en el rendimiento.
