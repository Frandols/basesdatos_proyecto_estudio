BEGIN TRY
    BEGIN TRANSACTION;

    -- Inserta un registro en la tabla Reparaciones
    INSERT INTO [dbo].[Reparaciones] (idPresupuesto, reparado, observaciones, fechaDeFinalizacion, irreparable)
    VALUES (1, 1, 'Reparación completada', GETDATE(), 0);

    -- Obtiene el id de la reparación recién insertada
    DECLARE @idReparacion INT = SCOPE_IDENTITY();

    -- Inserta un registro en la tabla Entregas relacionado con la reparación
    INSERT INTO [dbo].[Entregas] (idReparacion, fecha, idMetodoPago)
    VALUES (@idReparacion, GETDATE(), 1);

    -- Actualiza el estado de baja del equipo relacionado
    UPDATE [dbo].[Equipos]
    SET baja = 'si'
    WHERE idEquipo = (SELECT idEquipo FROM [dbo].[Revisiones] WHERE idEquipo = (SELECT idEquipo FROM [dbo].[Presupuestos] WHERE idPresupuesto = 1));

    -- Confirma la transacción
    COMMIT;
    PRINT 'Transacción completada con éxito';
END TRY
BEGIN CATCH
    -- Realiza un rollback si hay un error
    ROLLBACK;
    PRINT 'Ocurrió un error. Se realizó un rollback de la transacción';
END CATCH;
