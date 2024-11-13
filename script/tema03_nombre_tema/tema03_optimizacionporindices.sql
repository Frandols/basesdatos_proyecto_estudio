-- Paso 1: Carga masiva de datos en la tabla Equipos
DECLARE @i INT = 1;
BEGIN TRANSACTION;
WHILE @i <= 1000000
BEGIN
    INSERT INTO [dbo].[Equipos] (
        [numeroDeSerie], 
        [observaciones], 
        [razonDeIngreso], 
        [enciende], 
        [fechaDeIngreso], 
        [idTipoDeEquipo], 
        [idMarca], 
        [idModelo], 
        [idCliente], 
        [baja], 
        [estado]
    )
    VALUES (
        'SN-' + CAST(@i AS VARCHAR), 
        'Observaci�n de prueba', 
        'Reparaci�n', 
        'S�', 
        DATEADD(DAY, -@i % 365, GETDATE()), -- Genera una fecha aleatoria dentro del �ltimo a�o
        1, 
        1, 
        1, 
        1, 
        'No', 
        1
    );
    SET @i = @i + 1;
END;
COMMIT TRANSACTION;

-- Paso 2: B�squeda de registros en un rango de fechas y registro del plan de ejecuci�n
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT * FROM [dbo].[Equipos]
WHERE [fechaDeIngreso] BETWEEN '2024-01-01' AND '2024-12-31';
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-- Paso 3: Crear un �ndice agrupado sobre la columna fechaDeIngreso
CREATE CLUSTERED INDEX IX_FechaDeIngreso ON [dbo].[Equipos] ([fechaDeIngreso]);

-- Paso 4: Repetir la consulta de b�squeda y registrar el plan de ejecuci�n
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT * FROM [dbo].[Equipos]
WHERE [fechaDeIngreso] BETWEEN '2024-01-01' AND '2024-12-31';
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-- Paso 5: Borrar el �ndice agrupado creado
DROP INDEX IX_FechaDeIngreso ON [dbo].[Equipos];

-- Paso 6: Crear nuevamente el �ndice agrupado sin usar INCLUDE
-- Crear un �ndice no agrupado en fechaDeIngreso

--Crear el nuevo �ndice agrupado en fechaDeIngreso
CREATE NONCLUSTERED INDEX IDX_fechaDeIngreso ON [dbo].[Equipos] ([fechaDeIngreso]);



-- Paso 7: Repetir la consulta y registrar el plan de ejecuci�n
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
SELECT * FROM [dbo].[Equipos]
WHERE [fechaDeIngreso] BETWEEN '2024-01-01' AND '2024-12-31';
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
