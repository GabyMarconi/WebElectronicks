USE [master]
GO
/****** Object:  Database [DBVentasElectronica]    Script Date: 18/11/2024 2:58:00 ******/
CREATE DATABASE [DBVentasElectronica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBVentasElectronica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBVentasElectronica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBVentasElectronica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBVentasElectronica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBVentasElectronica] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBVentasElectronica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBVentasElectronica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBVentasElectronica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBVentasElectronica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBVentasElectronica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBVentasElectronica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET RECOVERY FULL 
GO
ALTER DATABASE [DBVentasElectronica] SET  MULTI_USER 
GO
ALTER DATABASE [DBVentasElectronica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBVentasElectronica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBVentasElectronica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBVentasElectronica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBVentasElectronica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBVentasElectronica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBVentasElectronica', N'ON'
GO
ALTER DATABASE [DBVentasElectronica] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBVentasElectronica] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBVentasElectronica]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 18/11/2024 2:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 18/11/2024 2:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NULL,
	[CorreoElectronico] [varchar](100) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Direccion] [varchar](255) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallePedidos]    Script Date: 18/11/2024 2:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallePedidos](
	[DetallePedidoID] [int] IDENTITY(1,1) NOT NULL,
	[PedidoID] [int] NULL,
	[ProductoID] [int] NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Subtotal]  AS ([Cantidad]*[Precio]),
PRIMARY KEY CLUSTERED 
(
	[DetallePedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DireccionesEnvio]    Script Date: 18/11/2024 2:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DireccionesEnvio](
	[DireccionEnvioID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NULL,
	[Direccion] [varchar](255) NOT NULL,
	[Ciudad] [varchar](100) NULL,
	[Provincia] [varchar](100) NULL,
	[CodigoPostal] [varchar](10) NULL,
	[Pais] [varchar](100) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DireccionEnvioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoPago]    Script Date: 18/11/2024 2:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoPago](
	[MetodoPagoID] [int] IDENTITY(1,1) NOT NULL,
	[PedidoID] [int] NULL,
	[MetodoPago] [varchar](50) NOT NULL,
	[EstadoPago] [varchar](50) NOT NULL,
	[FechaPago] [datetime] NULL,
	[Detalles] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MetodoPagoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 18/11/2024 2:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[PedidoID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NULL,
	[FechaPedido] [datetime] NULL,
	[EstadoPedido] [varchar](50) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 18/11/2024 2:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [text] NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
	[Imagen] [varchar](255) NULL,
	[CategoriaID] [int] NULL,
	[ProveedorID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 18/11/2024 2:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ProveedorID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[ContactoNombre] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[CorreoElectronico] [varchar](100) NULL,
	[Direccion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProveedorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 18/11/2024 2:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contrasena] [varchar](100) NOT NULL,
	[FechaCreacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[DireccionesEnvio] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[MetodoPago] ADD  DEFAULT ('Pendiente') FOR [EstadoPago]
GO
ALTER TABLE [dbo].[MetodoPago] ADD  DEFAULT (getdate()) FOR [FechaPago]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (getdate()) FOR [FechaPedido]
GO
ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT ('Pendiente') FOR [EstadoPedido]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[DetallePedidos]  WITH CHECK ADD FOREIGN KEY([PedidoID])
REFERENCES [dbo].[Pedidos] ([PedidoID])
GO
ALTER TABLE [dbo].[DetallePedidos]  WITH CHECK ADD FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[DireccionesEnvio]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
ALTER TABLE [dbo].[MetodoPago]  WITH CHECK ADD FOREIGN KEY([PedidoID])
REFERENCES [dbo].[Pedidos] ([PedidoID])
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[Categorias] ([CategoriaID])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([ProveedorID])
REFERENCES [dbo].[Proveedores] ([ProveedorID])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
USE [master]
GO
ALTER DATABASE [DBVentasElectronica] SET  READ_WRITE 
GO
