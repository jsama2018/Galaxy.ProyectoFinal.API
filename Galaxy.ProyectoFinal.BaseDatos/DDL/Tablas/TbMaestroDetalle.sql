CREATE TABLE [dbo].[TbMaestroDetalle]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [IdMaestro] INT NOT NULL,
	[Codigo] CHAR(30) NOT NULL UNIQUE, 
    [Descripcion] VARCHAR(100) NULL, 
    [Valor] VARCHAR(100) NULL, 
    [TipoMaestro] CHAR(3) NULL,
    [FechaCreacion] DATETIME NOT NULL DEFAULT GETDATE(), 
    [UsuarioCreacion] VARCHAR(50) NOT NULL DEFAULT 'sql', 
    [FechaModificacion] DATETIME NULL, 
    [UsuarioModificacion] VARCHAR(50) NULL, 
    CONSTRAINT [FK_TbMaestroDetalle_TbMaestro] FOREIGN KEY ([IdMaestro]) REFERENCES TbMaestro(Id)
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identificador del registro, autoincrimental',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbMaestroDetalle',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identificador de la cabezera maestro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbMaestroDetalle',
    @level2type = N'COLUMN',
    @level2name = N'IdMaestro'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Valor constante para acceder al registro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbMaestroDetalle',
    @level2type = N'COLUMN',
    @level2name = N'Codigo'
GO

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Descripcion del maestro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbMaestroDetalle',
    @level2type = N'COLUMN',
    @level2name = N'Descripcion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Define el tipo de maestro: MAE: maestro, CFG: configuracion',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbMaestroDetalle',
    @level2type = N'COLUMN',
    @level2name = N'TipoMaestro'
GO

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fecha de creacion del registro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbMaestroDetalle',
    @level2type = N'COLUMN',
    @level2name = N'FechaCreacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nombre de usuario del registro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbMaestroDetalle',
    @level2type = N'COLUMN',
    @level2name = N'UsuarioCreacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fecha de ultima modificacion',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbMaestroDetalle',
    @level2type = N'COLUMN',
    @level2name = N'FechaModificacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Usuario de ultima modificacion',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbMaestroDetalle',
    @level2type = N'COLUMN',
    @level2name = N'UsuarioModificacion'