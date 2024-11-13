# Uso de Transacciones y Transacciones Anidadas en SQL Server

## Introducción

Este documento describe el procedimiento seguido para implementar una transacción en SQL Server con el objetivo de asegurar la consistencia de los datos en una serie de operaciones de inserción y actualización distribuidas en múltiples tablas. La transacción abarca la inserción de registros en las tablas `Reparaciones` y `Entregas` y la actualización de la tabla `Equipos` para marcar un equipo como dado de baja después de ser entregado. También se incluyen los pasos necesarios para provocar intencionalmente un error y observar el comportamiento de `ROLLBACK` en una transacción fallida.

## Objetivo

El propósito de este procedimiento es garantizar que todas las operaciones de inserción y actualización se realicen de forma atómica: si una de las operaciones falla, ninguna de las modificaciones en la base de datos debe ser persistida, logrando así que los datos se mantengan en un estado consistente.

## Requisitos Previos

1. Estructura de base de datos con las tablas `Reparaciones`, `Entregas`, y `Equipos` correctamente definidas y relaciones de clave externa configuradas.
2. Configuración de SQL Server y acceso a la base de datos con permisos para realizar transacciones y manipulaciones de datos.

## Procedimiento

### Paso 1: Creación de una Transacción Principal

1. Primero, definimos una transacción principal usando `BEGIN TRANSACTION`. Esta transacción agrupa todas las operaciones que deben realizarse juntas.
2. Realizamos la primera operación: una inserción en la tabla `Reparaciones`. Esta inserción representa el inicio del proceso de reparación de un equipo y se asegura de que el presupuesto ha sido aceptado.

   ```sql
   BEGIN TRANSACTION
   -- Insertar en la tabla Reparaciones
   INSERT INTO Reparaciones (idPresupuesto, reparado, observaciones, fechaDeFinalizacion, irreparable)
   VALUES (1, NULL, 'Reparación en proceso', NULL, 0);
   ```

### Paso 2: Inserción en la Tabla `Entregas`

1. La segunda operación consiste en insertar un registro en la tabla `Entregas`, indicando que el equipo reparado ha sido entregado.
2. Esta operación se realiza dentro de la misma transacción iniciada en el paso anterior.

   ```sql
   -- Insertar en la tabla Entregas
   INSERT INTO Entregas (idReparacion, fecha, idMetodoPago)
   VALUES (SCOPE_IDENTITY(), GETDATE(), 1);
   ```

### Paso 3: Actualización en la Tabla `Equipos`

1. Finalmente, se realiza una actualización en la tabla `Equipos` para marcar el equipo correspondiente como dado de baja (`baja = 'si'`).
2. Esta actualización se ejecuta si las inserciones previas en `Reparaciones` y `Entregas` se completaron correctamente.

   ```sql
   -- Actualizar el estado del equipo para marcarlo como dado de baja
   UPDATE Equipos
   SET baja = 'si'
   WHERE idEquipo = (SELECT idEquipo FROM Revisiones WHERE idEquipo = 1);
   ```

### Paso 4: Confirmación o Reversión de la Transacción

1. Al finalizar las operaciones, verificamos si se han realizado sin errores. Si todas las operaciones se ejecutaron con éxito, se hace un `COMMIT` para confirmar la transacción y persistir los cambios en la base de datos.
2. Si ocurre algún error durante cualquiera de las operaciones, se ejecuta `ROLLBACK` para revertir la transacción y deshacer todos los cambios realizados hasta el momento.

   ```sql
   -- Confirmar la transacción
   COMMIT TRANSACTION;
   ```

### Paso 5: Prueba de Error y Rollback Intencional

Para asegurar que el `ROLLBACK` funcione correctamente, se crea una situación de error intencional tras la inserción en `Reparaciones`. Este error se simula añadiendo una instrucción incorrecta inmediatamente después de la primera inserción, para luego verificar que no se realizaron cambios en las tablas al ejecutar el `ROLLBACK`.

```sql
BEGIN TRANSACTION
-- Intento de inserción en Reparaciones
INSERT INTO Reparaciones (idPresupuesto, reparado, observaciones, fechaDeFinalizacion, irreparable)
VALUES (1, NULL, 'Error intencional', NULL, 0);

-- Error intencional
RAISERROR ('Error simulado para prueba de ROLLBACK', 16, 1);

-- Insertar en Entregas (esta operación no debería ejecutarse)
INSERT INTO Entregas (idReparacion, fecha, idMetodoPago)
VALUES (SCOPE_IDENTITY(), GETDATE(), 1);

-- Actualización en Equipos (esta operación no debería ejecutarse)
UPDATE Equipos
SET baja = 'si'
WHERE idEquipo = (SELECT idEquipo FROM Revisiones WHERE idEquipo = 1);

-- Confirmación de transacción o ROLLBACK
IF @@ERROR <> 0
    ROLLBACK TRANSACTION;
ELSE
    COMMIT TRANSACTION;
```
