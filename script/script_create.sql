CREATE DATABASE [gestion_reparacion_equipos]
GO

USE [gestion_reparacion_equipos]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[DNI] [varchar](8) NOT NULL,
	[nombres] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[telefono] [varchar](12) NOT NULL,
	[correo] [varchar](256) NOT NULL,
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entregas]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entregas](
	[idReparacion] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[idMetodoPago] [int] NULL,
 CONSTRAINT [PK_idReparacion] PRIMARY KEY CLUSTERED 
(
	[idReparacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipos]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[numeroDeSerie] [varchar](256) NOT NULL,
	[observaciones] [varchar](max) NULL,
	[razonDeIngreso] [varchar](max) NOT NULL,
	[enciende] [varchar](256) NOT NULL,
	[idEquipo] [int] IDENTITY(1,1) NOT NULL,
	[fechaDeIngreso] [date] NOT NULL,
	[idTipoDeEquipo] [int] NOT NULL,
	[idMarca] [int] NOT NULL,
	[idModelo] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[baja] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marcas](
	[nombre] [varchar](50) NOT NULL,
	[idMarca] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodosPago]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodosPago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modelos]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modelos](
	[nombre] [varchar](50) NOT NULL,
	[idModelo] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presupuestos]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presupuestos](
	[idPresupuesto] [int] IDENTITY(1,1) NOT NULL,
	[detalles] [varchar](max) NOT NULL,
	[monto] [real] NOT NULL,
	[aprobado] [bit] NULL,
	[idRevision] [int] NOT NULL,
 CONSTRAINT [PK_idPresupuesto] PRIMARY KEY CLUSTERED 
(
	[idPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reparaciones]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reparaciones](
	[idPresupuesto] [int] NOT NULL,
	[reparado] [bit] NULL,
	[observaciones] [varchar](max) NOT NULL,
	[fechaDeFinalizacion] [date] NULL,
	[irreparable] [bit] NOT NULL,
 CONSTRAINT [PK_idPresupuesto_Reparaciones] PRIMARY KEY CLUSTERED 
(
	[idPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Revisiones]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Revisiones](
	[idEquipo] [int] NOT NULL,
	[observaciones] [varchar](max) NOT NULL,
	[fechaDeFinalizacion] [date] NULL,
 CONSTRAINT [PK_idEquipo] PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeEquipo]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeEquipo](
	[nombre] [varchar](50) NOT NULL,
	[idTipoDeEquipo] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoDeEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposDeUsuario]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposDeUsuario](
	[idTipoDeUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoDeUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasena] [varchar](max) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[DNI] [varchar](8) NOT NULL,
	[telefono] [varchar](12) NOT NULL,
	[correo] [varchar](256) NOT NULL,
	[idTipoDeUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT ('activo') FOR [estado]
GO
ALTER TABLE [dbo].[Presupuestos] ADD  CONSTRAINT [DF_Presupuestos_Aprobado]  DEFAULT (NULL) FOR [aprobado]
GO
ALTER TABLE [dbo].[Reparaciones] ADD  DEFAULT (NULL) FOR [fechaDeFinalizacion]
GO
ALTER TABLE [dbo].[Reparaciones] ADD  DEFAULT ((0)) FOR [irreparable]
GO
ALTER TABLE [dbo].[Revisiones] ADD  DEFAULT (NULL) FOR [fechaDeFinalizacion]
GO
ALTER TABLE [dbo].[Entregas]  WITH CHECK ADD  CONSTRAINT [FK_idMetodoPago] FOREIGN KEY([idMetodoPago])
REFERENCES [dbo].[MetodosPago] ([id])
GO
ALTER TABLE [dbo].[Entregas] CHECK CONSTRAINT [FK_idMetodoPago]
GO
ALTER TABLE [dbo].[Entregas]  WITH CHECK ADD  CONSTRAINT [FK_idReparacion] FOREIGN KEY([idReparacion])
REFERENCES [dbo].[Reparaciones] ([idPresupuesto])
GO
ALTER TABLE [dbo].[Entregas] CHECK CONSTRAINT [FK_idReparacion]
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marcas] ([idMarca])
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([idModelo])
REFERENCES [dbo].[Modelos] ([idModelo])
GO
ALTER TABLE [dbo].[Equipos]  WITH CHECK ADD FOREIGN KEY([idTipoDeEquipo])
REFERENCES [dbo].[TiposDeEquipo] ([idTipoDeEquipo])
GO
ALTER TABLE [dbo].[Presupuestos]  WITH CHECK ADD  CONSTRAINT [FK_idRevision] FOREIGN KEY([idRevision])
REFERENCES [dbo].[Revisiones] ([idEquipo])
GO
ALTER TABLE [dbo].[Presupuestos] CHECK CONSTRAINT [FK_idRevision]
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD  CONSTRAINT [FK_idPresupuesto] FOREIGN KEY([idPresupuesto])
REFERENCES [dbo].[Presupuestos] ([idPresupuesto])
GO
ALTER TABLE [dbo].[Reparaciones] CHECK CONSTRAINT [FK_idPresupuesto]
GO
ALTER TABLE [dbo].[Revisiones]  WITH CHECK ADD  CONSTRAINT [FK_idEquipo] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Revisiones] CHECK CONSTRAINT [FK_idEquipo]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([idTipoDeUsuario])
REFERENCES [dbo].[TiposDeUsuario] ([idTipoDeUsuario])
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD CHECK  (([estado]='inactivo' OR [estado]='activo'))
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD  CONSTRAINT [ck_irreparable_reparado] CHECK  ((NOT ([irreparable]=(1) AND [reparado]=(1))))
GO
ALTER TABLE [dbo].[Reparaciones] CHECK CONSTRAINT [ck_irreparable_reparado]
GO
ALTER TABLE [dbo].[Reparaciones]  WITH CHECK ADD  CONSTRAINT [CK_reparado_fechafinalizacion] CHECK  ((NOT ([fechaDeFinalizacion] IS NULL AND [reparado] IS NOT NULL OR [fechaDeFinalizacion] IS NOT NULL AND [reparado] IS NULL)))
GO
ALTER TABLE [dbo].[Reparaciones] CHECK CONSTRAINT [CK_reparado_fechafinalizacion]
GO
/****** Object:  Trigger [dbo].[TRG_Entregas_ValidacionFecha]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TRG_Entregas_ValidacionFecha]
ON [dbo].[Entregas]
FOR INSERT, UPDATE
AS
BEGIN
    -- Verifica que ninguna entrega esté asociada a una reparación cuya fecha de finalización sea NULL
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Reparaciones r ON i.idReparacion = r.idPresupuesto
        WHERE r.fechaDeFinalizacion IS NULL
    )
    BEGIN
        RAISERROR ('No se puede asociar una entrega a una reparación cuya fecha de finalización sea NULL.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
ALTER TABLE [dbo].[Entregas] ENABLE TRIGGER [TRG_Entregas_ValidacionFecha]
GO
/****** Object:  Trigger [dbo].[trg_check_revision_fecha_finalizacion]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_check_revision_fecha_finalizacion]
ON [dbo].[Presupuestos]
AFTER INSERT, UPDATE
AS
BEGIN
    -- Verificamos si existe algún presupuesto con una revisión cuya fechaDeFinalizacion sea NULL
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN [dbo].[Revisiones] r ON r.idEquipo = i.idRevision
        WHERE r.fechaDeFinalizacion IS NULL
    )
    BEGIN
        -- Si existe, deshacemos la operación y lanzamos un error
        RAISERROR('No se puede insertar o actualizar un presupuesto con una revisión cuya fecha de finalización sea NULL.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END

GO
ALTER TABLE [dbo].[Presupuestos] ENABLE TRIGGER [trg_check_revision_fecha_finalizacion]
GO
/****** Object:  Trigger [dbo].[trg_check_presupuesto_aprobado]    Script Date: 14/11/2024 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_check_presupuesto_aprobado]
ON [dbo].[Reparaciones]
AFTER INSERT
AS
BEGIN
    -- Verificamos si el presupuesto relacionado con la reparación está aprobado
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN [dbo].[Presupuestos] p ON p.idPresupuesto = i.idPresupuesto
        WHERE p.aprobado IS NULL OR p.aprobado = 0
    )
    BEGIN
        -- Si el presupuesto no está aprobado, deshacemos la operación y lanzamos un error
        RAISERROR('No se puede asociar una reparación a un presupuesto que no esté aprobado.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO
ALTER TABLE [dbo].[Reparaciones] ENABLE TRIGGER [trg_check_presupuesto_aprobado]
GO
