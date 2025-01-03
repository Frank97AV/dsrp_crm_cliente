USE [master]
GO
/****** Object:  Database [dsrp_cliente_crm]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
/****** Object:  Table [dbo].[clientes]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
/****** Object:  Table [dbo].[detalle_orden]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
/****** Object:  Table [dbo].[empleados]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
/****** Object:  Table [dbo].[interaccion]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
/****** Object:  Table [dbo].[ordenes]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
/****** Object:  Table [dbo].[personas_juridicas]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personas_naturales]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[numero_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
/****** Object:  Table [dbo].[soporte]    Script Date: 12/12/2024 01:24:02 p. m. ******/
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
