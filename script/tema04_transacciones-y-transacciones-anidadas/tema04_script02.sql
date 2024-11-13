BEGIN TRY
    BEGIN TRANSACTION;

    -- Inserta un registro en la tabla Reparaciones
    INSERT INTO [dbo].[Reparaciones] (idPresupuesto, reparado, observaciones, fechaDeFinalizacion, irreparable)
    VALUES (1, 1, 'Reparación con error', GETDATE(), 0);

    -- Provoca un error intencional (violación de clave primaria en Entregas)
    INSERT INTO [dbo].[Entregas] (idReparacion, fecha, idMetodoPago)
    VALUES (9999, GETDATE(), 1);  -- idReparacion 9999 no existe en Reparaciones

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
