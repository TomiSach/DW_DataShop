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