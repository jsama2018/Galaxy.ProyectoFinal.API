CREATE TABLE [dbo].[TbClienteUsuario]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	IdClientes INT NOT NULL,
    Usuario VARCHAR(50),
    Clave VARCHAR(50),
    BloqueadoHasta DATETIME NOT NULL,
    UltimoBloqueo DATETIME NOT NULL,
    IntentosFallidos INT,
    Estado bit NOT NULL DEFAULT 1,
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(), 
    UsuarioCreacion VARCHAR(50) NOT NULL DEFAULT 'sql',
    FechaModificacion DATETIME NULL, 
    UsuarioModificacion VARCHAR(50), 
    CONSTRAINT [FK_TbClienteUsuario_TbClientes_Id] FOREIGN KEY (IdClientes) REFERENCES TbClientes(Id)
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identificador del registro, autoincrimental',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Identificador del clientes',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'IdClientes'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nombre de usuario',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'Usuario'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'password',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'Clave'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'bloqueo hasta',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'BloqueadoHasta'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'ultimo bloqueo',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'UltimoBloqueo'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'intentos fallidos',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'IntentosFallidos'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'estado',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'Estado'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fecha de creacion del registro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'FechaCreacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Nombre de usuario del registro',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'UsuarioCreacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Fecha de ultima modificacion',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'FechaModificacion'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Usuario de ultima modificacion',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'TbClienteUsuario',
    @level2type = N'COLUMN',
    @level2name = N'UsuarioModificacion'