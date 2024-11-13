BEGIN TRY
    BEGIN TRANSACTION;

    -- Inserta un registro en la tabla Reparaciones
    INSERT INTO [dbo].[Reparaciones] (idPresupuesto, reparado, observaciones, fechaDeFinalizacion, irreparable)
    VALUES (1, 1, 'Reparaci�n con error', GETDATE(), 0);

    -- Provoca un error intencional (violaci�n de clave primaria en Entregas)
    INSERT INTO [dbo].[Entregas] (idReparacion, fecha, idMetodoPago)
    VALUES (9999, GETDATE(), 1);  -- idReparacion 9999 no existe en Reparaciones

    -- Actualiza el estado de baja del equipo relacionado
    UPDATE [dbo].[Equipos]
    SET baja = 'si'
    WHERE idEquipo = (SELECT idEquipo FROM [dbo].[Revisiones] WHERE idEquipo = (SELECT idEquipo FROM [dbo].[Presupuestos] WHERE idPresupuesto = 1));

    -- Confirma la transacci�n
    COMMIT;
    PRINT 'Transacci�n completada con �xito';
END TRY
BEGIN CATCH
    -- Realiza un rollback si hay un error
    ROLLBACK;
    PRINT 'Ocurri� un error. Se realiz� un rollback de la transacci�n';
END CATCH;
