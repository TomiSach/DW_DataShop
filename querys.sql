CREATE TABLE [dbo].[Fact_Ventas](
	[FechaVenta] [datetime] NOT NULL,
	[idProducto] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioVenta] [decimal]NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdTienda] [int] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL
	)
GO
CREATE TABLE [dbo].[Dim_Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[CodigoProducto] [int] NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Categoria] [nvarchar](50) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[PrecioCosto] [decimal](18,2) NOT NULL,
	[PrecioVentaSugerido] [decimal](18,2) NOT NULL,
	[CodProveedor] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON)
)ON [PRIMARY]

GO

CREATE TABLE [dbo].[Dim_Tienda](
	[IdTienda] [int] IDENTITY(1,1) NOT NULL,
	[CodigoTienda] [int] NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Localidad] [nvarchar](100) NOT NULL,
	[Provincia] [nvarchar](100) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[TipoTienda] [nvarchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[IdTienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON)
)ON [PRIMARY]

GO

CREATE TABLE [dbo].[Dim_Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[CodCliente] [int] NOT NULL,
	[RazonSocial] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Mail] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Localidad] [nvarchar](100) NOT NULL,
	[Provincia] [nvarchar](100) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaActualizacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON)
)ON [PRIMARY]

GO


ALTER TABLE [dbo].[Fact_Ventas] 
WITH CHECK ADD FOREIGN KEY ([IdCliente])
REFERENCES [dbo].[Dim_Cliente] ([IdCliente])
GO

ALTER TABLE [dbo].[Fact_Ventas] 
WITH CHECK ADD FOREIGN KEY ([IdTienda])
REFERENCES [dbo].[Dim_Tienda] ([IdTienda])
GO

ALTER TABLE [dbo].[Fact_Ventas] 
WITH CHECK ADD FOREIGN KEY ([IdProducto])
REFERENCES [dbo].[Dim_Producto] ([IdProducto])
GO


CREATE TABLE [dbo].[Stg_Dim_Producto](
	[CodigoProducto] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Categoria] [nvarchar](50) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[PrecioCosto] [nvarchar](100) NOT NULL,
	[PrecioVentaSugerido] [nvarchar](100) NOT NULL,
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Stg_Dim_Tienda](
	[CodigoTienda] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Localidad] [nvarchar](100) NOT NULL,
	[Provincia] [nvarchar](100) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
	[TipoTienda] [nvarchar](50) NOT NULL,
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Stg_Dim_Cliente](
	[CodCliente] [nvarchar](100) NOT NULL,
	[RazonSocial] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NOT NULL,
	[Mail] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
	[Localidad] [nvarchar](100) NOT NULL,
	[Provincia] [nvarchar](100) NOT NULL,
	[CP] [nvarchar](10) NOT NULL,
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Stg_Fact_Venta](
	[FechaVenta] [nvarchar](255) NOT NULL,
	[CodigoProducto] [nvarchar](255) NOT NULL,
	[Cantidad] [nvarchar](255) NOT NULL,
	[PrecioVenta] [nvarchar](255) NOT NULL,
	[CodigoCliente] [nvarchar](255) NOT NULL,
	[CodigoVenta] [nvarchar](100) NOT NULL,
) ON [PRIMARY]

GO