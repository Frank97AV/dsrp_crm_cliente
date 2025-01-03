USE [master]
GO
/****** Object:  Database [dsrp_cliente_crm]    Script Date: 12/12/2024 01:26:43 p. m. ******/
CREATE DATABASE [dsrp_cliente_crm]
 
ALTER DATABASE [dsrp_cliente_crm] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dsrp_cliente_crm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dsrp_cliente_crm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET ARITHABORT OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dsrp_cliente_crm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dsrp_cliente_crm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dsrp_cliente_crm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dsrp_cliente_crm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET RECOVERY FULL 
GO
ALTER DATABASE [dsrp_cliente_crm] SET  MULTI_USER 
GO
ALTER DATABASE [dsrp_cliente_crm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dsrp_cliente_crm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dsrp_cliente_crm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dsrp_cliente_crm] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dsrp_cliente_crm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dsrp_cliente_crm] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dsrp_cliente_crm', N'ON'
GO
ALTER DATABASE [dsrp_cliente_crm] SET QUERY_STORE = ON
GO
ALTER DATABASE [dsrp_cliente_crm] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dsrp_cliente_crm]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 12/12/2024 01:26:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo_persona] [varchar](55) NOT NULL,
	[persona_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_orden]    Script Date: 12/12/2024 01:26:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_orden](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productos_id] [int] NOT NULL,
	[ordenes_id] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 12/12/2024 01:26:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[persona_id] [int] NOT NULL,
	[codigo_empleado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[interaccion]    Script Date: 12/12/2024 01:26:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[interaccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[empleado_id] [int] NOT NULL,
	[cliente_id] [int] NOT NULL,
	[tipo_interaccion] [varchar](255) NOT NULL,
	[fecha] [date] NOT NULL,
	[resumen] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordenes]    Script Date: 12/12/2024 01:26:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordenes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[empleado_id] [int] NOT NULL,
	[fecha_compra] [datetime] NOT NULL,
	[precio_total] [money] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[created_by] [int] NOT NULL,
	[updated_by] [int] NULL,
	[deleted_by] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas_juridicas]    Script Date: 12/12/2024 01:26:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas_juridicas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](20) NOT NULL,
	[razon_social] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas_naturales]    Script Date: 12/12/2024 01:26:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personas_naturales](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_documento] [varchar](25) NOT NULL,
	[nombres] [varchar](255) NOT NULL,
	[apellido_paterno] [varchar](255) NOT NULL,
	[apellido_materno] [varchar](255) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[celular] [varchar](20) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 12/12/2024 01:26:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[precio] [money] NOT NULL,
	[stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[soporte]    Script Date: 12/12/2024 01:26:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[soporte](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[empleado_id] [int] NOT NULL,
	[cliente_id] [int] NOT NULL,
	[tipo_problema] [varchar](255) NOT NULL,
	[fecha] [date] NOT NULL,
	[estado] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (1, N'Persona Natural', 1)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (2, N'Persona Natural', 2)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (3, N'Persona Natural', 3)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (4, N'Persona Natural', 4)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (5, N'Persona Natural', 5)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (6, N'Persona Natural', 6)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (7, N'Persona Natural', 7)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (8, N'Persona Natural', 8)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (9, N'Persona Natural', 9)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (10, N'Persona Natural', 10)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (11, N'Persona Natural', 11)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (12, N'Persona Natural', 12)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (13, N'Persona Natural', 13)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (14, N'Persona Natural', 14)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (15, N'Persona Natural', 15)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (16, N'Persona Natural', 16)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (17, N'Persona Natural', 17)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (18, N'Persona Natural', 18)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (19, N'Persona Natural', 19)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (20, N'Persona Natural', 20)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (21, N'Persona Jurídica', 1)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (22, N'Persona Jurídica', 2)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (23, N'Persona Jurídica', 3)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (24, N'Persona Jurídica', 4)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (25, N'Persona Jurídica', 5)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (26, N'Persona Jurídica', 6)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (27, N'Persona Jurídica', 7)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (28, N'Persona Jurídica', 8)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (29, N'Persona Jurídica', 9)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (30, N'Persona Jurídica', 10)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (31, N'Persona Jurídica', 11)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (32, N'Persona Jurídica', 12)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (33, N'Persona Jurídica', 13)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (34, N'Persona Jurídica', 14)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (35, N'Persona Jurídica', 15)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (36, N'Persona Jurídica', 16)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (37, N'Persona Jurídica', 17)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (38, N'Persona Jurídica', 18)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (39, N'Persona Jurídica', 19)
INSERT [dbo].[clientes] ([id], [tipo_persona], [persona_id]) VALUES (40, N'Persona Jurídica', 20)
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_orden] ON 

INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (1, 1, 1, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (2, 4, 1, 2)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (3, 2, 2, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (4, 3, 2, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (5, 5, 3, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (6, 7, 3, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (7, 8, 4, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (8, 9, 4, 2)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (9, 10, 5, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (10, 12, 5, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (11, 13, 6, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (12, 16, 6, 2)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (13, 17, 7, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (14, 18, 7, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (15, 19, 8, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (16, 20, 8, 2)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (17, 21, 9, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (18, 22, 9, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (19, 23, 10, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (20, 24, 10, 1)
INSERT [dbo].[detalle_orden] ([id], [productos_id], [ordenes_id], [cantidad]) VALUES (21, 25, 10, 1)
SET IDENTITY_INSERT [dbo].[detalle_orden] OFF
GO
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado]) VALUES (1, 1, N'EMP001')
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado]) VALUES (2, 2, N'EMP002')
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado]) VALUES (3, 3, N'EMP003')
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado]) VALUES (4, 4, N'EMP004')
INSERT [dbo].[empleados] ([id], [persona_id], [codigo_empleado]) VALUES (5, 5, N'EMP005')
SET IDENTITY_INSERT [dbo].[empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[interaccion] ON 

INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (1, 1, 1, N'Correo', CAST(N'2024-12-01' AS Date), N'Consulta sobre el producto X.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (2, 2, 2, N'Llamada', CAST(N'2024-12-02' AS Date), N'Consulta de precios de productos Y.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (3, 3, 3, N'WSP', CAST(N'2024-12-03' AS Date), N'Aclaración sobre el pago.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (4, 4, 4, N'Correo', CAST(N'2024-12-04' AS Date), N'Problema con la entrega del producto.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (5, 5, 5, N'Presencial', CAST(N'2024-12-05' AS Date), N'Reclamo por defectos en el producto Z.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (6, 1, 6, N'WEB', CAST(N'2024-12-06' AS Date), N'Interacción sobre descuentos.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (7, 2, 7, N'Llamada', CAST(N'2024-12-07' AS Date), N'Solicitar información sobre los métodos de pago.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (8, 3, 8, N'Correo', CAST(N'2024-12-08' AS Date), N'Preguntas sobre la garantía del producto.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (9, 4, 9, N'WSP', CAST(N'2024-12-09' AS Date), N'Confirmación de la fecha de envío.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (10, 5, 10, N'Presencial', CAST(N'2024-12-10' AS Date), N'Solicitud de cambio de producto defectuoso.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (11, 1, 11, N'Correo', CAST(N'2024-12-11' AS Date), N'Soporte sobre el proceso de compra online.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (12, 2, 12, N'Llamada', CAST(N'2024-12-12' AS Date), N'Aclaración sobre facturación.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (13, 3, 13, N'WSP', CAST(N'2024-12-13' AS Date), N'Consulta sobre las promociones del mes.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (14, 4, 14, N'WEB', CAST(N'2024-12-14' AS Date), N'Seguimiento sobre el pedido realizado.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (15, 5, 15, N'Correo', CAST(N'2024-12-15' AS Date), N'Problemas con la facturación de la compra anterior.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (16, 1, 16, N'Llamada', CAST(N'2024-12-16' AS Date), N'Consulta sobre el stock de productos.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (17, 2, 17, N'Presencial', CAST(N'2024-12-17' AS Date), N'Interacción sobre descuentos especiales.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (18, 3, 18, N'Correo', CAST(N'2024-12-18' AS Date), N'Seguimiento sobre un reembolso pendiente.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (19, 4, 19, N'WSP', CAST(N'2024-12-19' AS Date), N'Interacción sobre el cambio de dirección de entrega.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (20, 5, 20, N'WEB', CAST(N'2024-12-20' AS Date), N'Aclaraciones sobre tiempos de envío.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (21, 1, 21, N'Correo', CAST(N'2024-12-21' AS Date), N'Consulta sobre nuevos productos en el catálogo.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (22, 2, 22, N'Llamada', CAST(N'2024-12-22' AS Date), N'Información sobre pagos a plazos.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (23, 3, 23, N'Presencial', CAST(N'2024-12-23' AS Date), N'Reclamo sobre la calidad del producto adquirido.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (24, 4, 24, N'Correo', CAST(N'2024-12-24' AS Date), N'Aclaración sobre costos de envío.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (25, 5, 25, N'WSP', CAST(N'2024-12-25' AS Date), N'Solicitud de asesoramiento para una compra grande.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (26, 1, 26, N'WEB', CAST(N'2024-12-26' AS Date), N'Solicitud de cancelación de pedido.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (27, 2, 27, N'Llamada', CAST(N'2024-12-27' AS Date), N'Interacción sobre métodos de pago internacional.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (28, 3, 28, N'Correo', CAST(N'2024-12-28' AS Date), N'Consulta sobre la política de devoluciones.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (29, 4, 29, N'Presencial', CAST(N'2024-12-29' AS Date), N'Reclamo por la calidad del servicio.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (30, 5, 30, N'WSP', CAST(N'2024-12-30' AS Date), N'Aclaración sobre el proceso de entrega.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (31, 1, 31, N'WEB', CAST(N'2024-12-31' AS Date), N'Confirmación sobre el estado de un pedido pendiente.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (32, 2, 32, N'Correo', CAST(N'2024-12-01' AS Date), N'Consulta sobre los métodos de envío.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (33, 3, 33, N'Llamada', CAST(N'2024-12-02' AS Date), N'Información sobre la política de garantías.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (34, 4, 34, N'Presencial', CAST(N'2024-12-03' AS Date), N'Consulta sobre los horarios de atención.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (35, 5, 35, N'WSP', CAST(N'2024-12-04' AS Date), N'Consulta sobre el catálogo de productos tecnológicos.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (36, 1, 36, N'Correo', CAST(N'2024-12-05' AS Date), N'Asesoría sobre la compra de equipo profesional.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (37, 2, 37, N'Llamada', CAST(N'2024-12-06' AS Date), N'Información sobre productos exclusivos.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (38, 3, 38, N'WEB', CAST(N'2024-12-07' AS Date), N'Consulta sobre pagos y financiamiento.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (39, 4, 39, N'Presencial', CAST(N'2024-12-08' AS Date), N'Solicitud de instalación de productos.')
INSERT [dbo].[interaccion] ([id], [empleado_id], [cliente_id], [tipo_interaccion], [fecha], [resumen]) VALUES (40, 5, 40, N'Correo', CAST(N'2024-12-09' AS Date), N'Consulta sobre stock de productos específicos.')
SET IDENTITY_INSERT [dbo].[interaccion] OFF
GO
SET IDENTITY_INSERT [dbo].[ordenes] ON 

INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (1, 10, 1, CAST(N'2024-12-01T00:00:00.000' AS DateTime), 890.0000, CAST(N'2024-12-01T10:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (2, 20, 2, CAST(N'2024-12-02T00:00:00.000' AS DateTime), 300.0000, CAST(N'2024-12-02T11:00:00.000' AS DateTime), NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (3, 15, 3, CAST(N'2024-12-03T00:00:00.000' AS DateTime), 1049.0000, CAST(N'2024-12-03T12:00:00.000' AS DateTime), NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (4, 22, 4, CAST(N'2024-12-04T00:00:00.000' AS DateTime), 380.0000, CAST(N'2024-12-04T13:00:00.000' AS DateTime), NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (5, 35, 5, CAST(N'2024-12-05T00:00:00.000' AS DateTime), 729.0000, CAST(N'2024-12-05T14:00:00.000' AS DateTime), NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (6, 25, 1, CAST(N'2024-12-06T00:00:00.000' AS DateTime), 600.0000, CAST(N'2024-12-06T15:00:00.000' AS DateTime), NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (7, 11, 2, CAST(N'2024-12-07T00:00:00.000' AS DateTime), 790.0000, CAST(N'2024-12-07T16:00:00.000' AS DateTime), NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (8, 28, 3, CAST(N'2024-12-08T00:00:00.000' AS DateTime), 180.0000, CAST(N'2024-12-08T17:00:00.000' AS DateTime), NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (9, 18, 4, CAST(N'2024-12-09T00:00:00.000' AS DateTime), 220.0000, CAST(N'2024-12-09T18:00:00.000' AS DateTime), NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[ordenes] ([id], [cliente_id], [empleado_id], [fecha_compra], [precio_total], [created_at], [updated_at], [deleted_at], [created_by], [updated_by], [deleted_by]) VALUES (10, 30, 5, CAST(N'2024-12-10T00:00:00.000' AS DateTime), 560.0000, CAST(N'2024-12-10T19:00:00.000' AS DateTime), NULL, NULL, 5, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ordenes] OFF
GO
SET IDENTITY_INSERT [dbo].[personas_juridicas] ON 

INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (1, N'20123456789', N'Tecnología S.A.', N'contacto@tecnologia.com', N'555-1000', N'Av. Innovación 100')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (2, N'20234567890', N'Soluciones Digitales S.R.L.', N'info@solucionesdigitales.com', N'555-2000', N'Calle Progreso 200')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (3, N'20345678901', N'Computech Ltda.', N'ventas@computech.com', N'555-3000', N'Av. Central 300')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (4, N'20456789012', N'Red de Innovación S.A.C.', N'contacto@redinnovacion.com', N'555-4000', N'Calle Digital 400')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (5, N'20567890123', N'Smart Devices Corp.', N'soporte@smartdevices.com', N'555-5000', N'Calle Del Futuro 500')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (6, N'20678901234', N'Tech Solutions Group S.A.', N'soluciones@techgroup.com', N'555-6000', N'Av. Tecnológica 600')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (7, N'20789012345', N'Global Tech Innovators S.A.', N'info@globaltech.com', N'555-7000', N'Calle Global 700')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (8, N'20890123456', N'Electro Sistemas Ltda.', N'ventas@electrosistemas.com', N'555-8000', N'Av. Eléctrica 800')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (9, N'20901234567', N'Redes Digitales S.R.L.', N'contacto@redesdigitales.com', N'555-9000', N'Calle 5G 900')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (10, N'21012345678', N'Nexos Tecnológicos S.A.', N'nexos@tecnologicos.com', N'555-1001', N'Av. Conexión 1001')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (11, N'21123456789', N'Comunicaciones Avanzadas Ltda.', N'info@comunicacionesavanzadas.com', N'555-2001', N'Calle Innovadora 2001')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (12, N'21234567890', N'Software Solutions S.A.C.', N'contacto@softwaresolutions.com', N'555-3001', N'Av. Software 3001')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (13, N'21345678901', N'Red Digital S.A.', N'info@reddigital.com', N'555-4001', N'Calle Digital 4001')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (14, N'21456789012', N'Tecnologías del Futuro S.A.', N'futuro@tecnologias.com', N'555-5001', N'Calle Vanguardia 5001')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (15, N'21567890123', N'Innovative Devices Ltda.', N'ventas@innovative.com', N'555-6001', N'Av. Nueva Era 6001')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (16, N'21678901234', N'Grupo Electrónico Global S.A.C.', N'grupo@electronicos.com', N'555-7001', N'Calle Global 7001')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (17, N'21789012345', N'Dispositivos Avanzados S.R.L.', N'contacto@dispositivosavanzados.com', N'555-8001', N'Av. Inteligente 8001')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (18, N'21890123456', N'Tech Power S.A.', N'soporte@techpower.com', N'555-9001', N'Calle Alta Tecnología 9001')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (19, N'21901234567', N'Electro Ingeniería S.A.C.', N'info@electroingenieria.com', N'555-1002', N'Calle Innovación 1002')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (20, N'22012345678', N'Red Smart Ltda.', N'contacto@redsmart.com', N'555-2002', N'Av. Red 2002')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (21, N'22123456789', N'Ingeniería Tecnológica S.A.', N'ventas@ingenieriatecnologica.com', N'555-3002', N'Calle Digital 3002')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (22, N'22234567890', N'Automatización Global S.A.C.', N'info@automatizacionglobal.com', N'555-4002', N'Av. Automatización 4002')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (23, N'22345678901', N'Tecnologías Avanzadas Ltda.', N'soporte@tecnologiasavanzadas.com', N'555-5002', N'Calle Tecnología 5002')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (24, N'22456789012', N'Soluciones Inteligentes S.A.', N'contacto@solucionesinteligentes.com', N'555-6002', N'Av. Soluciones 6002')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (25, N'22567890123', N'Electrónica Pro Ltda.', N'info@electronica.com', N'555-7002', N'Calle Progreso 7002')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (26, N'22678901234', N'Grupo de Innovación Digital S.A.', N'grupo@innovaciondigital.com', N'555-8002', N'Av. Digital 8002')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (27, N'22789012345', N'Tecnología Aplicada S.A.C.', N'soporte@tecnologiaaplicada.com', N'555-9002', N'Calle Avances 9002')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (28, N'22890123456', N'Soluciones Electrónicas S.R.L.', N'contacto@solucioneselectronicas.com', N'555-1003', N'Av. Avance 1003')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (29, N'22901234567', N'Innovadores del Futuro Ltda.', N'ventas@innovadoresfuturo.com', N'555-2003', N'Calle de Innovación 2003')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (30, N'23012345678', N'Digital Tech S.A.C.', N'info@digitaltech.com', N'555-3003', N'Calle Digital 3003')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (31, N'23123456789', N'Soluciones y Tecnología S.A.', N'soporte@solucionesytecnologia.com', N'555-4003', N'Av. Soluciones 4003')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (32, N'23234567890', N'Redes de Comunicación S.A.', N'info@redescomunicacion.com', N'555-5003', N'Calle Red 5003')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (33, N'23345678901', N'Tecnologías Globales Ltda.', N'contacto@tecnologiasglobales.com', N'555-6003', N'Av. Global 6003')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (34, N'23456789012', N'Smart Devices Corporation S.A.C.', N'ventas@smartdevicescorp.com', N'555-7003', N'Calle Alta Tecnología 7003')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (35, N'23567890123', N'Future Technologies S.R.L.', N'info@futuretechnologies.com', N'555-8003', N'Av. Future 8003')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (36, N'23678901234', N'Sistemas Inteligentes Ltda.', N'soporte@sistemasinteligentes.com', N'555-9003', N'Calle Innovación 9003')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (37, N'23789012345', N'Red Digital Technologies S.A.', N'contacto@reddigitaltech.com', N'555-1004', N'Av. Tecnología 1004')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (38, N'23890123456', N'Innova Group S.A.C.', N'info@innova-group.com', N'555-2004', N'Calle Progreso 2004')
INSERT [dbo].[personas_juridicas] ([id], [numero_documento], [razon_social], [email], [telefono], [direccion]) VALUES (39, N'23901234567', N'Electro Digital Solutions Ltda.', N'ventas@electrodigital.com', N'555-3004', N'Calle Digital 3004')
SET IDENTITY_INSERT [dbo].[personas_juridicas] OFF
GO
SET IDENTITY_INSERT [dbo].[personas_naturales] ON 

INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (1, N'1234567890', N'Juan', N'Perez', N'Lopez', N'juan.perez@email.com', N'555-1234', N'Av. Siempre Viva 123')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (2, N'2345678901', N'Maria', N'Gomez', N'Fernandez', N'maria.gomez@email.com', N'555-2345', N'Calle Ficticia 456')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (3, N'3456789012', N'Carlos', N'Martinez', N'Ramirez', N'carlos.martinez@email.com', N'555-3456', N'Calle Real 789')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (4, N'4567890123', N'Ana', N'Sanchez', N'Gonzalez', N'ana.sanchez@email.com', N'555-4567', N'Av. Libertad 101')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (5, N'5678901234', N'Luis', N'Diaz', N'Hernandez', N'luis.diaz@email.com', N'555-5678', N'Calle Las Flores 202')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (6, N'6789012345', N'Laura', N'Lopez', N'Gomez', N'laura.lopez@email.com', N'555-6789', N'Calle Central 303')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (7, N'7890123456', N'Pedro', N'Perez', N'Morales', N'pedro.perez@email.com', N'555-7890', N'Av. 9 de Julio 404')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (8, N'8901234567', N'Sofia', N'Martinez', N'Lopez', N'sofia.martinez@email.com', N'555-8901', N'Calle San Martin 505')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (9, N'9012345678', N'Ricardo', N'Rodriguez', N'Jimenez', N'ricardo.rodriguez@email.com', N'555-9012', N'Av. Paseo 606')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (10, N'1123456789', N'Elena', N'Ramirez', N'Vargas', N'elena.ramirez@email.com', N'555-1235', N'Calle El Sol 707')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (11, N'2234567890', N'Miguel', N'Fernandez', N'Perez', N'miguel.fernandez@email.com', N'555-2346', N'Av. La Luna 808')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (12, N'3345678901', N'Patricia', N'Gonzalez', N'Hernandez', N'patricia.gonzalez@email.com', N'555-3457', N'Calle Las Estrellas 909')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (13, N'4456789012', N'Francisco', N'Sanchez', N'Lopez', N'francisco.sanchez@email.com', N'555-4568', N'Calle Buenos Aires 1010')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (14, N'5567890123', N'Carmen', N'Jimenez', N'Torres', N'carmen.jimenez@email.com', N'555-5679', N'Av. San Juan 1111')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (15, N'6678901234', N'Antonio', N'Vargas', N'Diaz', N'antonio.vargas@email.com', N'555-6780', N'Calle El Parque 1212')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (16, N'7789012345', N'Marta', N'Lopez', N'Rodriguez', N'marta.lopez@email.com', N'555-7891', N'Av. Constitución 1313')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (17, N'8890123456', N'Juan Carlos', N'Torres', N'Sanchez', N'juancarlos.torres@email.com', N'555-8902', N'Calle Las Palmas 1414')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (18, N'9901234567', N'Isabel', N'Perez', N'Fernandez', N'isabel.perez@email.com', N'555-9013', N'Calle El Bosque 1515')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (19, N'1012345678', N'Felipe', N'Hernandez', N'Jimenez', N'felipe.hernandez@email.com', N'555-1236', N'Av. Los Andes 1616')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (20, N'2123456789', N'Olga', N'Rodriguez', N'Lopez', N'olga.rodriguez@email.com', N'555-2347', N'Calle Norte 1717')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (21, N'3234567890', N'Eduardo', N'Vargas', N'Gonzalez', N'eduardo.vargas@email.com', N'555-3458', N'Av. La Montaña 1818')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (22, N'4345678901', N'Rosa', N'Sanchez', N'Martinez', N'rosa.sanchez@email.com', N'555-4569', N'Calle Sur 1919')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (23, N'5456789012', N'Ricardo', N'Jimenez', N'Rodriguez', N'ricardo.jimenez@email.com', N'555-5670', N'Av. Sol 2020')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (24, N'6567890123', N'Antonio', N'Lopez', N'Fernandez', N'antonio.lopez@email.com', N'555-6781', N'Calle Fuerte 2121')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (25, N'7678901234', N'Mariana', N'Rodriguez', N'Diaz', N'mariana.rodriguez@email.com', N'555-7892', N'Av. Rivadavia 2222')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (26, N'8789012345', N'David', N'Vargas', N'Jimenez', N'david.vargas@email.com', N'555-8903', N'Calle Mendoza 2323')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (27, N'9890123456', N'Cristina', N'Sanchez', N'Torres', N'cristina.sanchez@email.com', N'555-9014', N'Av. La Paz 2424')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (28, N'1090123456', N'Samuel', N'Martinez', N'Hernandez', N'samuel.martinez@email.com', N'555-1237', N'Calle Argentina 2525')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (29, N'2101234567', N'Beatriz', N'Fernandez', N'Rodriguez', N'beatriz.fernandez@email.com', N'555-2348', N'Calle Las Lomas 2626')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (30, N'3112345678', N'Gabriel', N'Gonzalez', N'Sanchez', N'gabriel.gonzalez@email.com', N'555-3459', N'Av. Santa Fe 2727')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (31, N'4123456789', N'Lourdes', N'Hernandez', N'Lopez', N'lourdes.hernandez@email.com', N'555-4560', N'Calle El Prado 2828')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (32, N'5234567890', N'Mario', N'Rodriguez', N'Vargas', N'mario.rodriguez@email.com', N'555-5671', N'Calle Roca 2929')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (33, N'6345678901', N'Patricio', N'Sanchez', N'Torres', N'patricio.sanchez@email.com', N'555-6782', N'Av. Litoral 3030')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (34, N'7456789012', N'Sandra', N'Lopez', N'Jimenez', N'sandra.lopez@email.com', N'555-7893', N'Calle Libertad 3131')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (35, N'8567890123', N'Victor', N'Gonzalez', N'Rodriguez', N'victor.gonzalez@email.com', N'555-8904', N'Av. Gran Via 3232')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (36, N'9678901234', N'Juana', N'Martinez', N'Fernandez', N'juana.martinez@email.com', N'555-9015', N'Calle Buenos Aires 3333')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (37, N'0789012345', N'Oscar', N'Vargas', N'Sanchez', N'oscar.vargas@email.com', N'555-1238', N'Calle El Oasis 3434')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (38, N'1890123456', N'Patricia', N'Rodriguez', N'Gonzalez', N'patricia.rodriguez@email.com', N'555-2349', N'Av. Paseo 3535')
INSERT [dbo].[personas_naturales] ([id], [numero_documento], [nombres], [apellido_paterno], [apellido_materno], [email], [celular], [direccion]) VALUES (39, N'2901234567', N'Javier', N'Sanchez', N'Lopez', N'javier.sanchez@email.com', N'555-3450', N'Calle El Bosque 3636')
SET IDENTITY_INSERT [dbo].[personas_naturales] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (1, N'Laptop Lenovo IdeaPad 3', N'Laptop con procesador Intel Core i5, 8GB RAM, 256GB SSD', 750.0000, 50)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (2, N'Monitor LG 24MP59G', N'Monitor de 24 pulgadas Full HD con tecnología AMD FreeSync', 180.0000, 30)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (3, N'Teclado Mecánico HyperX Alloy FPS', N'Teclado mecánico con switches Cherry MX Red', 120.0000, 40)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (4, N'Mouse Logitech G502 HERO', N'Mouse gaming con sensor de 25,000 DPI y botones programables', 70.0000, 60)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (5, N'Auriculares Sony WH-1000XM4', N'Auriculares inalámbricos con cancelación activa de ruido', 350.0000, 20)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (6, N'Smartphone Samsung Galaxy S23', N'Teléfono con pantalla AMOLED de 6.1 pulgadas y 256GB de almacenamiento', 999.0000, 15)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (7, N'Tablet Apple iPad Air', N'Tablet con pantalla de 10.9 pulgadas y chip M1', 699.0000, 25)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (8, N'Impresora HP LaserJet Pro', N'Impresora láser multifunción para oficinas', 250.0000, 10)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (9, N'Disco Duro Externo Seagate 1TB', N'Almacenamiento portátil con conexión USB 3.0', 65.0000, 100)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (10, N'Router ASUS RT-AX88U', N'Router Wi-Fi 6 con alta velocidad y cobertura extendida', 300.0000, 15)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (11, N'Smartwatch Apple Watch Series 8', N'Reloj inteligente con monitoreo de salud y fitness', 429.0000, 35)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (12, N'Cámara Canon EOS Rebel T7', N'Cámara DSLR con lente de 18-55mm', 480.0000, 20)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (13, N'MicroSD SanDisk Ultra 128GB', N'Tarjeta de memoria MicroSD con velocidad Clase 10', 25.0000, 150)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (14, N'Smart TV Samsung 55" QLED', N'Televisor QLED con resolución 4K y HDR', 1200.0000, 10)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (15, N'Barra de Sonido Bose 700', N'Barra de sonido premium con Bluetooth y control por voz', 850.0000, 8)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (16, N'Consola PlayStation 5', N'Consola de videojuegos de última generación con SSD de 825GB', 499.0000, 12)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (17, N'Control Xbox Series X', N'Control inalámbrico para consola y PC', 60.0000, 50)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (18, N'SSD Kingston A2000 1TB', N'Disco de estado sólido NVMe para alto rendimiento', 90.0000, 75)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (19, N'Procesador AMD Ryzen 7 5800X', N'Procesador de 8 núcleos para PCs de alto rendimiento', 320.0000, 25)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (20, N'Tarjeta Gráfica NVIDIA RTX 3080', N'GPU de alto rendimiento para gaming y diseño', 700.0000, 5)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (21, N'Altavoces Logitech Z623', N'Sistema de sonido 2.1 con certificación THX', 130.0000, 20)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (22, N'Cargador Rápido Anker PowerPort', N'Cargador USB con tecnología PowerIQ', 25.0000, 100)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (23, N'Estación de Doca Dell WD19', N'Docking station universal con múltiples puertos', 200.0000, 15)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (24, N'Cable HDMI Belkin Ultra HD', N'Cable HDMI de alta velocidad con soporte 4K', 20.0000, 200)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (25, N'Silla Gaming DXRacer', N'Silla ergonómica para juegos con reposabrazos ajustables', 350.0000, 10)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (26, N'Cámara de Seguridad Blink Outdoor', N'Cámara inalámbrica resistente al clima para exteriores', 100.0000, 40)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (27, N'Parlante Bluetooth JBL Flip 5', N'Parlante portátil resistente al agua', 110.0000, 60)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (28, N'Base de Enfriamiento Cooler Master', N'Base para laptops con ventiladores silenciosos', 50.0000, 80)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (29, N'Lector de Tarjetas USB UGREEN', N'Lector universal para tarjetas SD y MicroSD', 15.0000, 150)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (30, N'Webcam Logitech C920', N'Cámara web Full HD con micrófono integrado', 70.0000, 25)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (31, N'Tablet Samsung Galaxy Tab S8', N'Tablet con pantalla AMOLED de 11 pulgadas', 729.0000, 12)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (32, N'Disco NAS WD Red 4TB', N'Disco duro diseñado para almacenamiento en red', 140.0000, 30)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (33, N'Kit de Luces Elgato Key Light', N'Luces LED para transmisiones en vivo', 200.0000, 20)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (34, N'Hub USB-C Anker 7 en 1', N'Concentrador USB-C con múltiples puertos y lector de tarjetas', 60.0000, 70)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (35, N'Monitor Curvo Samsung Odyssey G7', N'Monitor gaming QHD de 32 pulgadas con 240Hz', 800.0000, 10)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (36, N'Soporte Ergonómico Fellowes', N'Soporte ajustable para monitores o laptops', 45.0000, 50)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (37, N'Memoria RAM Corsair Vengeance 16GB', N'Memoria DDR4 para PCs de alto rendimiento', 80.0000, 100)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (38, N'Auriculares Razer Kraken', N'Auriculares gaming con sonido envolvente', 60.0000, 40)
INSERT [dbo].[productos] ([id], [nombre], [descripcion], [precio], [stock]) VALUES (39, N'Fuente de Poder EVGA 750W', N'Fuente de alimentación certificada 80+ Gold', 110.0000, 30)
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[soporte] ON 

INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (1, 1, 1, N'Problema de conexión', CAST(N'2024-12-01' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (2, 2, 2, N'Error en la factura', CAST(N'2024-12-02' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (3, 3, 3, N'Fallo en el producto', CAST(N'2024-12-03' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (4, 4, 4, N'Retraso en la entrega', CAST(N'2024-12-04' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (5, 5, 5, N'Producto defectuoso', CAST(N'2024-12-05' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (6, 1, 6, N'Consulta técnica', CAST(N'2024-12-06' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (7, 2, 7, N'No llega la confirmación de pago', CAST(N'2024-12-07' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (8, 3, 8, N'Falta de stock de productos', CAST(N'2024-12-08' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (9, 4, 9, N'Error en el envío', CAST(N'2024-12-09' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (10, 5, 10, N'Cancelación de pedido', CAST(N'2024-12-10' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (11, 1, 11, N'Problema con la devolución', CAST(N'2024-12-11' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (12, 2, 12, N'Fallo en la garantía', CAST(N'2024-12-12' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (13, 3, 13, N'Información sobre la política de devoluciones', CAST(N'2024-12-13' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (14, 4, 14, N'Retraso en el envío', CAST(N'2024-12-14' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (15, 5, 15, N'Devolución por mal estado', CAST(N'2024-12-15' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (16, 1, 16, N'Descuento no aplicado', CAST(N'2024-12-16' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (17, 2, 17, N'Consulta sobre cambios en la factura', CAST(N'2024-12-17' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (18, 3, 18, N'Problemas con el pago', CAST(N'2024-12-18' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (19, 4, 19, N'Problemas en el pago de cuotas', CAST(N'2024-12-19' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (20, 5, 20, N'Dudas sobre garantía extendida', CAST(N'2024-12-20' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (21, 1, 21, N'Consulta sobre productos nuevos', CAST(N'2024-12-21' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (22, 2, 22, N'Problema con el reembolso', CAST(N'2024-12-22' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (23, 3, 23, N'Devolución de dinero no procesada', CAST(N'2024-12-23' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (24, 4, 24, N'Inconvenientes con la calidad del producto', CAST(N'2024-12-24' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (25, 5, 25, N'Retraso en la entrega del producto', CAST(N'2024-12-25' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (26, 1, 26, N'Problema en la facturación', CAST(N'2024-12-26' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (27, 2, 27, N'Solicitud de cambio de producto', CAST(N'2024-12-27' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (28, 3, 28, N'Consulta sobre el producto', CAST(N'2024-12-28' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (29, 4, 29, N'Error en el procesamiento del pago', CAST(N'2024-12-29' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (30, 5, 30, N'Problema con la instalación del producto', CAST(N'2024-12-30' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (31, 1, 31, N'Fallo de producto recibido', CAST(N'2024-12-31' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (32, 2, 32, N'Problema en la transacción de pago', CAST(N'2024-12-01' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (33, 3, 33, N'Defecto en el producto', CAST(N'2024-12-02' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (34, 4, 34, N'Consulta sobre costos adicionales', CAST(N'2024-12-03' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (35, 5, 35, N'Fallo en el pedido', CAST(N'2024-12-04' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (36, 1, 36, N'Información sobre descuentos', CAST(N'2024-12-05' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (37, 2, 37, N'Problemas con la factura', CAST(N'2024-12-06' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (38, 3, 38, N'Solicitud de reembolso', CAST(N'2024-12-07' AS Date), N'resuelto')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (39, 4, 39, N'Problema con el producto adquirido', CAST(N'2024-12-08' AS Date), N'pendiente')
INSERT [dbo].[soporte] ([id], [empleado_id], [cliente_id], [tipo_problema], [fecha], [estado]) VALUES (40, 5, 40, N'Cancelación de pedido debido a mal estado', CAST(N'2024-12-09' AS Date), N'resuelto')
SET IDENTITY_INSERT [dbo].[soporte] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__personas__7B886A638BB886F8]    Script Date: 12/12/2024 01:26:43 p. m. ******/
ALTER TABLE [dbo].[personas_juridicas] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__personas__7B886A63753C3F4F]    Script Date: 12/12/2024 01:26:43 p. m. ******/
ALTER TABLE [dbo].[personas_naturales] ADD UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detalle_orden]  WITH CHECK ADD  CONSTRAINT [FK_ordenes_detalle_orden] FOREIGN KEY([ordenes_id])
REFERENCES [dbo].[ordenes] ([id])
GO
ALTER TABLE [dbo].[detalle_orden] CHECK CONSTRAINT [FK_ordenes_detalle_orden]
GO
ALTER TABLE [dbo].[detalle_orden]  WITH CHECK ADD  CONSTRAINT [FK_productos_detalle_orden] FOREIGN KEY([productos_id])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[detalle_orden] CHECK CONSTRAINT [FK_productos_detalle_orden]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_persona_natural_empleados] FOREIGN KEY([persona_id])
REFERENCES [dbo].[personas_naturales] ([id])
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_persona_natural_empleados]
GO
ALTER TABLE [dbo].[interaccion]  WITH CHECK ADD  CONSTRAINT [FK_cliente_interaccion] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[interaccion] CHECK CONSTRAINT [FK_cliente_interaccion]
GO
ALTER TABLE [dbo].[interaccion]  WITH CHECK ADD  CONSTRAINT [FK_empleado_interaccion] FOREIGN KEY([empleado_id])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[interaccion] CHECK CONSTRAINT [FK_empleado_interaccion]
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD  CONSTRAINT [FK_cliente_ordenes] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[ordenes] CHECK CONSTRAINT [FK_cliente_ordenes]
GO
ALTER TABLE [dbo].[ordenes]  WITH CHECK ADD  CONSTRAINT [FK_empleado_ordenes] FOREIGN KEY([empleado_id])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[ordenes] CHECK CONSTRAINT [FK_empleado_ordenes]
GO
ALTER TABLE [dbo].[soporte]  WITH CHECK ADD  CONSTRAINT [FK_cliente_soporte] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[soporte] CHECK CONSTRAINT [FK_cliente_soporte]
GO
ALTER TABLE [dbo].[soporte]  WITH CHECK ADD  CONSTRAINT [FK_empleado_soporte] FOREIGN KEY([empleado_id])
REFERENCES [dbo].[empleados] ([id])
GO
ALTER TABLE [dbo].[soporte] CHECK CONSTRAINT [FK_empleado_soporte]
GO
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD  CONSTRAINT [check_tipo_persona] CHECK  (([tipo_persona]='Persona Jurídica' OR [tipo_persona]='Persona Natural'))
GO
ALTER TABLE [dbo].[clientes] CHECK CONSTRAINT [check_tipo_persona]
GO
ALTER TABLE [dbo].[interaccion]  WITH CHECK ADD  CONSTRAINT [check_tipo_interaccion] CHECK  (([tipo_interaccion]='Correo' OR [tipo_interaccion]='Presencial' OR [tipo_interaccion]='Llamada' OR [tipo_interaccion]='WSP' OR [tipo_interaccion]='WEB'))
GO
ALTER TABLE [dbo].[interaccion] CHECK CONSTRAINT [check_tipo_interaccion]
GO
ALTER TABLE [dbo].[soporte]  WITH CHECK ADD  CONSTRAINT [check_tipo_problema] CHECK  (([estado]='resuelto' OR [estado]='pendiente'))
GO
ALTER TABLE [dbo].[soporte] CHECK CONSTRAINT [check_tipo_problema]
GO
USE [master]
GO
ALTER DATABASE [dsrp_cliente_crm] SET  READ_WRITE 
GO
