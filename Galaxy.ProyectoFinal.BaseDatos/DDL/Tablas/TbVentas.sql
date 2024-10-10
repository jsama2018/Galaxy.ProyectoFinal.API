CREATE TABLE [dbo].[TbVentas]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdClientes] INT NOT NULL, 
    [IdProductos] INT NOT NULL, 
    [IdMaeEstadoVenta] INT NOT NULL, 
    [Stock] INT NOT NULL, 
    [PrecioUnitario] DECIMAL(10, 2) NOT NULL, 
    [TotalBruto] DECIMAL(10, 2) NOT NULL, 
    [TotalNeto] DECIMAL(10, 2) NOT NULL,
    [FechaCreacion] DATETIME NOT NULL DEFAULT GETDATE(), 
    [UsuarioCreacion] VARCHAR(50) NOT NULL DEFAULT 'sql', 
    [FechaModificacion] DATETIME NULL, 
    [UsuarioModificacion] VARCHAR(50) NULL,     
    CONSTRAINT [FK_TbVentas_TbClientes_Id] FOREIGN KEY ([IdClientes]) REFERENCES TbClientes(id), 
    CONSTRAINT [FK_TbVentas_TbProductos_Id] FOREIGN KEY ([IdProductos]) REFERENCES TbProductos(id), 
    CONSTRAINT [FK_TbVentas_TbMaestroDetalle_id] FOREIGN KEY ([IdMaeEstadoVenta]) REFERENCES TbMaestroDetalle(id), 
)
