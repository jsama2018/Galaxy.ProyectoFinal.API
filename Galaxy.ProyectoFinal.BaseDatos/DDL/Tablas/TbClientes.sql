CREATE TABLE [dbo].[TbClientes]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [DocumentoIdentidad] CHAR(12) NOT NULL, 
    [RazonSocial] VARCHAR(50) NOT NULL, 
    [Nombre] VARCHAR(50) NOT NULL, 
    [Estado] BIT NOT NULL DEFAULT 1,
    [FechaCreacion] DATETIME NOT NULL DEFAULT GETDATE(), 
    [UsuarioCreacion] VARCHAR(50) NOT NULL DEFAULT 'sql', 
    [FechaModificacion] DATETIME NULL, 
    [UsuarioModificacion] VARCHAR(50) NULL, 
    [IdMaeTipoDocumento] INT NOT NULL, 
    CONSTRAINT [FK_TbClientes_TbMaestroDetalle_TipoDocumento] FOREIGN KEY ([IdMaeTipoDocumento]) REFERENCES TbMaestroDetalle(Id)    
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identificador del registro, autoincrimental',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = 'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Numero de documento de identidad',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = N'DocumentoIdentidad'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Razon social',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = N'RazonSocial'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nombre cliente',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = N'Nombre'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fecha de creacion del registro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = N'FechaCreacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nombre de usuario del registro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = N'UsuarioCreacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fecha de ultima modificacion',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = N'FechaModificacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Usuario de ultima modificacion',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = N'UsuarioModificacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'0: inactivo / 1: Activo',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = N'Estado'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identificador del tipo de documento de identidad',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClientes',
    @level2type = N'COLUMN',
    @level2name = N'IdMaeTipoDocumento'