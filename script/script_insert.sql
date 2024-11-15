USE [gestion_reparacion_equipos]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([DNI], [nombres], [apellidos], [telefono], [correo], [idCliente], [estado]) VALUES (N'12345678', N'Carlos', N'Pérez', N'555123456', N'carlos.perez@example.com', 13, N'activo')
INSERT [dbo].[Clientes] ([DNI], [nombres], [apellidos], [telefono], [correo], [idCliente], [estado]) VALUES (N'87654321', N'María', N'López', N'555987654', N'maria.lopez@example.com', 14, N'activo')
INSERT [dbo].[Clientes] ([DNI], [nombres], [apellidos], [telefono], [correo], [idCliente], [estado]) VALUES (N'11223344', N'Ana', N'Gómez', N'555112233', N'ana.gomez@example.com', 15, N'inactivo')
INSERT [dbo].[Clientes] ([DNI], [nombres], [apellidos], [telefono], [correo], [idCliente], [estado]) VALUES (N'22334455', N'Juan', N'Martínez', N'555223344', N'juan.martinez@example.com', 16, N'activo')
INSERT [dbo].[Clientes] ([DNI], [nombres], [apellidos], [telefono], [correo], [idCliente], [estado]) VALUES (N'33445566', N'Luis', N'Hernández', N'555334455', N'luis.hernandez@example.com', 17, N'activo')
INSERT [dbo].[Clientes] ([DNI], [nombres], [apellidos], [telefono], [correo], [idCliente], [estado]) VALUES (N'44556677', N'Sofía', N'Torres', N'555445566', N'sofia.torres@example.com', 18, N'activo')
INSERT [dbo].[Clientes] ([DNI], [nombres], [apellidos], [telefono], [correo], [idCliente], [estado]) VALUES (N'55667788', N'Pedro', N'Ortiz', N'555556677', N'pedro.ortiz@example.com', 19, N'inactivo')
INSERT [dbo].[Clientes] ([DNI], [nombres], [apellidos], [telefono], [correo], [idCliente], [estado]) VALUES (N'66778899', N'Lucía', N'Méndez', N'555667788', N'lucia.mendez@example.com', 20, N'activo')
INSERT [dbo].[Clientes] ([DNI], [nombres], [apellidos], [telefono], [correo], [idCliente], [estado]) VALUES (N'77889900', N'Miguel', N'Jiménez', N'555778899', N'miguel.jimenez@example.com', 21, N'activo')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([nombre], [idMarca]) VALUES (N'Toshiba', 1)
INSERT [dbo].[Marcas] ([nombre], [idMarca]) VALUES (N'Kyozera', 2)
SET IDENTITY_INSERT [dbo].[Marcas] OFF
GO
SET IDENTITY_INSERT [dbo].[Modelos] ON 

INSERT [dbo].[Modelos] ([nombre], [idModelo]) VALUES (N'2015', 3)
INSERT [dbo].[Modelos] ([nombre], [idModelo]) VALUES (N'2017', 4)
SET IDENTITY_INSERT [dbo].[Modelos] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposDeEquipo] ON 

INSERT [dbo].[TiposDeEquipo] ([nombre], [idTipoDeEquipo]) VALUES (N'Impresora con inyección de tinta', 3)
INSERT [dbo].[TiposDeEquipo] ([nombre], [idTipoDeEquipo]) VALUES (N'Computadora', 4)
INSERT [dbo].[TiposDeEquipo] ([nombre], [idTipoDeEquipo]) VALUES (N'Fotocopiadora', 5)
INSERT [dbo].[TiposDeEquipo] ([nombre], [idTipoDeEquipo]) VALUES (N'Impresora láser', 6)
SET IDENTITY_INSERT [dbo].[TiposDeEquipo] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipos] ON 

INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN123456', N'Pantalla rota', N'No enciende', N'No', 1048, CAST(N'2024-10-10' AS Date), 3, 1, 3, 13, N'si')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN234567', N'Batería defectuosa', N'Apagado repentino', N'Sí', 1049, CAST(N'2024-10-15' AS Date), 4, 2, 3, 14, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN345678', N'Teclado dañado', N'Algunas teclas no funcionan', N'Sí', 1050, CAST(N'2024-11-01' AS Date), 5, 1, 4, 15, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN456789', N'Lento rendimiento', N'Revisión general', N'Sí', 1051, CAST(N'2024-11-05' AS Date), 6, 2, 4, 16, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN567890', N'Problemas de sonido', N'Altavoces no funcionan', N'Sí', 1052, CAST(N'2024-11-10' AS Date), 3, 1, 3, 13, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN678901', N'Pantalla con píxeles muertos', N'Revisión de pantalla', N'Sí', 1053, CAST(N'2024-11-12' AS Date), 4, 2, 4, 14, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN789012', N'Batería inflada', N'Reemplazo de batería', N'No', 1054, CAST(N'2024-11-13' AS Date), 5, 1, 3, 15, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN890123', N'Sistema operativo lento', N'Optimización general', N'Sí', 1055, CAST(N'2024-11-14' AS Date), 6, 2, 4, 16, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN901234', N'Daños por agua', N'Secado y revisión', N'No', 1056, CAST(N'2024-11-15' AS Date), 3, 1, 3, 17, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN012345', N'Teclado atascado', N'Revisión de teclado', N'Sí', 1057, CAST(N'2024-11-16' AS Date), 4, 2, 4, 18, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN123456A', N'Cámara no funciona', N'Revisión de cámara', N'Sí', 1058, CAST(N'2024-11-17' AS Date), 5, 1, 3, 19, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN234567B', N'Software corrupto', N'Reinstalación de software', N'Sí', 1059, CAST(N'2024-11-18' AS Date), 6, 2, 4, 20, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN345678C', N'Sobrecalentamiento', N'Revisión de ventilación', N'No', 1060, CAST(N'2024-11-19' AS Date), 3, 1, 3, 21, N'no')
INSERT [dbo].[Equipos] ([numeroDeSerie], [observaciones], [razonDeIngreso], [enciende], [idEquipo], [fechaDeIngreso], [idTipoDeEquipo], [idMarca], [idModelo], [idCliente], [baja]) VALUES (N'SN456789D', N'No carga la batería', N'Cambio de puerto de carga', N'No', 1061, CAST(N'2024-11-20' AS Date), 4, 2, 4, 13, N'no')
SET IDENTITY_INSERT [dbo].[Equipos] OFF
GO
INSERT [dbo].[Revisiones] ([idEquipo], [observaciones], [fechaDeFinalizacion]) VALUES (1048, N'La pantalla está rota', CAST(N'2024-10-11' AS Date))
INSERT [dbo].[Revisiones] ([idEquipo], [observaciones], [fechaDeFinalizacion]) VALUES (1049, N'Se necesita reemplazar la batería', CAST(N'2024-10-15' AS Date))
INSERT [dbo].[Revisiones] ([idEquipo], [observaciones], [fechaDeFinalizacion]) VALUES (1050, N'El teclado está fallando', NULL)
INSERT [dbo].[Revisiones] ([idEquipo], [observaciones], [fechaDeFinalizacion]) VALUES (1051, N'El sistema operativo necesita actualización', CAST(N'2024-11-06' AS Date))
INSERT [dbo].[Revisiones] ([idEquipo], [observaciones], [fechaDeFinalizacion]) VALUES (1056, N'La placa madre está dañada', NULL)
INSERT [dbo].[Revisiones] ([idEquipo], [observaciones], [fechaDeFinalizacion]) VALUES (1058, N'La cámara está defectuosa', NULL)
INSERT [dbo].[Revisiones] ([idEquipo], [observaciones], [fechaDeFinalizacion]) VALUES (1060, N'El ventilador no está funcionando correctamente', NULL)
GO
SET IDENTITY_INSERT [dbo].[MetodosPago] ON 

INSERT [dbo].[MetodosPago] ([id], [nombre]) VALUES (1, N'Efectivo')
INSERT [dbo].[MetodosPago] ([id], [nombre]) VALUES (2, N'Tarjeta de crédito')
INSERT [dbo].[MetodosPago] ([id], [nombre]) VALUES (3, N'Tarjeta de débito')
INSERT [dbo].[MetodosPago] ([id], [nombre]) VALUES (4, N'MercadoPago')
SET IDENTITY_INSERT [dbo].[MetodosPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Presupuestos] ON 

INSERT [dbo].[Presupuestos] ([idPresupuesto], [detalles], [monto], [aprobado], [idRevision]) VALUES (1020, N'Reemplazo de pantalla rota', 150, 1, 1048)
INSERT [dbo].[Presupuestos] ([idPresupuesto], [detalles], [monto], [aprobado], [idRevision]) VALUES (1021, N'Reemplazo de batería', 80, 0, 1049)
INSERT [dbo].[Presupuestos] ([idPresupuesto], [detalles], [monto], [aprobado], [idRevision]) VALUES (1022, N'Actualización de sistema operativo', 120, NULL, 1051)
SET IDENTITY_INSERT [dbo].[Presupuestos] OFF
GO
INSERT [dbo].[Reparaciones] ([idPresupuesto], [reparado], [observaciones], [fechaDeFinalizacion], [irreparable]) VALUES (1020, 1, N'Pantalla reemplazada correctamente.', CAST(N'2024-11-15' AS Date), 0)
GO
INSERT [dbo].[Entregas] ([idReparacion], [fecha], [idMetodoPago]) VALUES (1020, CAST(N'2024-11-16' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[TiposDeUsuario] ON 

INSERT [dbo].[TiposDeUsuario] ([idTipoDeUsuario], [nombre]) VALUES (1, N'maestro')
INSERT [dbo].[TiposDeUsuario] ([idTipoDeUsuario], [nombre]) VALUES (2, N'administrador')
INSERT [dbo].[TiposDeUsuario] ([idTipoDeUsuario], [nombre]) VALUES (3, N'tecnico')
SET IDENTITY_INSERT [dbo].[TiposDeUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [usuario], [contrasena], [apellido], [DNI], [telefono], [correo], [idTipoDeUsuario]) VALUES (1, N'Cristian', N'maestro', N'233e1cded61ace811d7a930947b06acb18cda1dc7b67e215941e1830fdec3b7c', N'Perez', N'44000000', N'3794000000', N'cristianperez@gmail.com', 1)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [usuario], [contrasena], [apellido], [DNI], [telefono], [correo], [idTipoDeUsuario]) VALUES (3, N'Fabian', N'admin', N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', N'Flores', N'44111111', N'3794111111', N'fabianflores@gmail.com', 2)
INSERT [dbo].[Usuarios] ([idUsuario], [nombre], [usuario], [contrasena], [apellido], [DNI], [telefono], [correo], [idTipoDeUsuario]) VALUES (4, N'Rodrigo', N'tecnico', N'0e949b5f9de9cfa8437d0beeca8d8c96a6b578caa889fd6659e85b7dff22e59b', N'Pereira', N'44222222', N'3794222222', N'rodrigopereira@gmail.com', 3)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
