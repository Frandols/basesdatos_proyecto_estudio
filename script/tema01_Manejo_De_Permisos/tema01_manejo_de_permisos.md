#Manejo de Permisos 

Es un sistema de control de acceso que determina quién puede acceder y realizar operaciones sobre los datos. Estos permisos se establecen en función de roles y privilegios, que son otorgados o revocados a usuarios o grupos de usuarios.

####Roles y usuarios

Usuarios: Son las cuentas individuales creadas que pueden autenticarse para interactuar con los distintos objetos de la base de datos (tablas, procedimientos, etc.), este nivel de control es esencial para proteger los datos y definir las responsabilidades y el alcance de cada usuario dentro del sistema.
Roles: Los roles actúan como contenedores de permisos que pueden asignarse a múltiples usuarios, lo cual facilita la administración, especialmente en bases de datos con un gran número de usuarios y necesidades de permisos variadas.

####Tipos de Permisos 

Existen distintos tipos de permisos que pueden ser otorgados a nivel de distintos objetos de nuestra base de datos, es decir, permitir o restringir acciones que un usuario puede realizar sobre cada uno de estos componentes de manera detallada.
#####Permisos de control de datos:
SELECT: Este comando se utiliza para consultar o recuperar datos de una tabla en la base de datos.
DELETE: Se usa para eliminar registros de una tabla.
INSERT: Este comando se emplea para agregar nuevos registros a una tabla.
UPDATE: Se utiliza para modificar los datos existentes en una tabla.
#####Permisos de ejecución y uso de objetos:
EXECUTE: Este permiso permite ejecutar procedimientos almacenados, funciones y otros objetos de programa en la base de datos
REFERENCES: Este permiso permite referenciar objetos como tablas o vistas en claves externas (foreign keys) o en otros tipos de relaciones.
Permisos de control de estructura:
CREATE: Este comando crea un nuevo objeto en la base de datos, como una tabla, vista, procedimiento almacenado
ALTER: Este comando se usa para modificar un objeto existente en la base de datos.
DROP: Este comando se utiliza para eliminar un objeto existente en la base de datos, como una tabla, vista, índice, o procedimiento almacenado.
#####Permisos de administración:
GRANT: Permite especificar permisos para realizar acciones (como SELECT, INSERT, UPDATE, etc.) en objetos específicos de la base de datos.
