CREATE TABLE [dbo].[TbProductos]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Codigo] NCHAR(10) NOT NULL UNIQUE, 
    [Nombre] NCHAR(10) NOT NULL, 
    [Descripcion] NCHAR(10) NOT NULL, 
    [Estado] BIT NOT NULL DEFAULT 1,
    [FechaCreacion] DATETIME NOT NULL DEFAULT GETDATE(), 
    [UsuarioCreacion] VARCHAR(50) NOT NULL DEFAULT 'sql', 
    [FechaModificacion] DATETIME NULL, 
    [UsuarioModificacion] VARCHAR(50) NULL, 
    [IdMaeMarca] INT NOT NULL, 
    [IdMaeCategoria] INT NOT NULL, 
    CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Marca] FOREIGN KEY (IdMaeMarca) REFERENCES TbMaestroDetalle(id), 
    CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Categoria] FOREIGN KEY (IdMaeCategoria) REFERENCES TbMaestroDetalle(id)
    
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identificador del registro, autoincrimental',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbProductos',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Descripcion del producto',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbProductos',
    @level2type = N'COLUMN',
    @level2name = N'Descripcion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Codigo del producto',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbProductos',
    @level2type = N'COLUMN',
    @level2name = N'Codigo'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nombre del producto',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbProductos',
    @level2type = N'COLUMN',
    @level2name = N'Nombre'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fecha de creacion del registro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbProductos',
    @level2type = N'COLUMN',
    @level2name = N'FechaCreacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nombre de usuario del registro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbProductos',
    @level2type = N'COLUMN',
    @level2name = N'UsuarioCreacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fecha de ultima modificacion',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbProductos',
    @level2type = N'COLUMN',
    @level2name = N'FechaModificacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Usuario de ultima modificacion',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbProductos',
    @level2type = N'COLUMN',
    @level2name = N'UsuarioModificacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'0: inactivo / 1: Activo',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbProductos',
    @level2type = N'COLUMN',
    @level2name = N'Estado'
GO
