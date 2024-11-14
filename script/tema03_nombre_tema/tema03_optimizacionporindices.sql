-- Eliminar índices existentes si no son necesarios
--DROP INDEX IF EXISTS IX_Usuarios_DNI ON dbo.Usuarios;
--DROP INDEX IF EXISTS IX_Usuarios_Correo ON dbo.Usuarios;

-- carga masiva de datos
DECLARE @i INT = 0;
WHILE @i < 1000000
BEGIN
    INSERT INTO [dbo].[Usuarios] (nombre, usuario, contrasena, apellido, DNI, telefono, correo, fechaDeIngreso)
    VALUES (
        CONCAT('Nombre', @i),
        CONCAT('Usuario', @i),
        'contrasena123',
        CONCAT('Apellido', @i),
        RIGHT(CONCAT('00000000', @i), 8),
        CONCAT('1123456789', @i % 10),
        CONCAT('correo', @i, '@example.com'),
        DATEADD(DAY, @i % 365, '2020-01-01')  -- Fecha de ingreso variada
    );
    SET @i = @i + 1;
END;
GO



-- 2. Consulta sin índice en fechaDeIngreso y registro del plan de ejecución
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT * FROM [dbo].[Usuarios]
WHERE fechaDeIngreso BETWEEN '2021-01-01' AND '2021-12-31';
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
GO

-- 3. Crear índice Clustered en la columna fechaDeIngreso
CREATE CLUSTERED INDEX IX_Usuarios_fechaDeIngreso ON [dbo].[Usuarios](fechaDeIngreso);
GO

-- Repetir la consulta y medir rendimiento con índice Clustered en fechaDeIngreso
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT * FROM [dbo].[Usuarios]
WHERE fechaDeIngreso BETWEEN '2021-01-01' AND '2021-12-31';
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
GO

--  Borrar el índice Clustered en fechaDeIngreso
DROP INDEX IX_Usuarios_fechaDeIngreso ON [dbo].[Usuarios];
GO

--  Crear otro índice Clustered en fechaDeIngreso con columnas adicionales
CREATE CLUSTERED INDEX IX_Usuarios_fechaDeIngreso_Incluye ON [dbo].[Usuarios](fechaDeIngreso) INCLUDE (nombre, usuario, correo);
GO

-- Repetir la consulta y medir rendimiento con índice Clustered que incluye columnas
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT nombre, usuario, correo FROM [dbo].[Usuarios]
WHERE fechaDeIngreso BETWEEN '2021-01-01' AND '2021-12-31';
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
GO

--Crea índices adicionales

-- Índice no agrupado en DNI
CREATE NONCLUSTERED INDEX IX_Usuarios_DNI ON [dbo].[Usuarios](DNI);
GO

-- Índice único no agrupado en correo
CREATE UNIQUE NONCLUSTERED INDEX IX_Usuarios_Correo ON [dbo].[Usuarios](correo);
GO

-- Índice filtrado en usuarios que ingresaron en 2021
CREATE NONCLUSTERED INDEX IX_Usuarios_Filtro2021 ON [dbo].[Usuarios](fechaDeIngreso) WHERE fechaDeIngreso BETWEEN '2021-01-01' AND '2021-12-31';
GO

-- Consulta final con los índices creados y registro de estadísticas
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT nombre, usuario, correo FROM [dbo].[Usuarios]
WHERE fechaDeIngreso BETWEEN '2021-01-01' AND '2021-12-31';
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
GO
