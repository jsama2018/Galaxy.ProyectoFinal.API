/*
Script de implementación para ProyectoFinal

Una herramienta generó este código.
Los cambios realizados en este archivo podrían generar un comportamiento incorrecto y se perderán si
se vuelve a generar el código.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ProyectoFinal"
:setvar DefaultFilePrefix "ProyectoFinal"
:setvar DefaultDataPath "/var/opt/mssql/data/"
:setvar DefaultLogPath "/var/opt/mssql/data/"

GO
:on error exit
GO
/*
Detectar el modo SQLCMD y deshabilitar la ejecución del script si no se admite el modo SQLCMD.
Para volver a habilitar el script después de habilitar el modo SQLCMD, ejecute lo siguiente:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'El modo SQLCMD debe estar habilitado para ejecutar correctamente este script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
/*
Debe agregarse la columna [dbo].[TbClientes].[IdMaeTipoDocumento] de la tabla [dbo].[TbClientes], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[TbClientes])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
/*
Debe agregarse la columna [dbo].[TbProductos].[IdMaeCategoria] de la tabla [dbo].[TbProductos], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.

Debe agregarse la columna [dbo].[TbProductos].[IdMaeMarca] de la tabla [dbo].[TbProductos], pero esta columna no tiene un valor predeterminado y no admite valores NULL. Si la tabla contiene datos, el script ALTER no funcionará. Para evitar esta incidencia, agregue un valor predeterminado a la columna, márquela de modo que permita valores NULL o habilite la generación de valores predeterminados inteligentes como opción de implementación.
*/

IF EXISTS (select top 1 1 from [dbo].[TbProductos])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 093a3f54-7925-4b90-930e-e06d17d2c1f5 se ha omitido; no se cambiará el nombre del elemento [dbo].[FK_TbClientes_TbMaestro] (SqlForeignKeyConstraint) a [FK_TbClientes_TbMaestro_TipoDocumento]';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 2285b630-4d53-4fe6-97de-f97de7c1af92 se ha omitido; no se cambiará el nombre del elemento [dbo].[TbProductos].[IdMaesMarca] (SqlSimpleColumn) a IdMaeMarca';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave adef2a31-a394-4816-9bde-fe449c15c59b se ha omitido; no se cambiará el nombre del elemento [dbo].[FK_TbProductos_TbMaestroDetalle] (SqlForeignKeyConstraint) a [FK_TbProductos_TbMaestroDetalle_Marca]';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 78c579db-8c2d-4cff-98ba-2777a4dbaed1 se ha omitido; no se cambiará el nombre del elemento [dbo].[FK_TbProductos_ToTable] (SqlForeignKeyConstraint) a [FK_TbProductos_TbMaestroDetalle_Categoria]';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 95a7e551-971c-401c-803c-b1ef35b42c97 se ha omitido; no se cambiará el nombre del elemento [dbo].[TbVentas].[Total_Ventas] (SqlSimpleColumn) a PrecioUnitario';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 979421bf-8d2b-4d40-9778-4d2682ad2724 se ha omitido; no se cambiará el nombre del elemento [dbo].[TbVentas].[IdCliente] (SqlSimpleColumn) a IdClientes';


GO
PRINT N'La operación de refactorización Cambiar nombre con la clave 19f79c97-5ede-47ef-a4ec-3576abca0fa2 se ha omitido; no se cambiará el nombre del elemento [dbo].[TbVentas].[IdProducto] (SqlSimpleColumn) a IdProductos';


GO
PRINT N'Quitando Restricción DEFAULT restricción sin nombre en [dbo].[TbClientes]...';


GO
ALTER TABLE [dbo].[TbClientes] DROP CONSTRAINT [DF__TbCliente__Fecha__267ABA7A];


GO
PRINT N'Quitando Restricción DEFAULT restricción sin nombre en [dbo].[TbClientes]...';


GO
ALTER TABLE [dbo].[TbClientes] DROP CONSTRAINT [DF__TbCliente__Usuar__276EDEB3];


GO
PRINT N'Quitando Restricción DEFAULT restricción sin nombre en [dbo].[TbClientes]...';


GO
ALTER TABLE [dbo].[TbClientes] DROP CONSTRAINT [DF__TbCliente__Estad__34C8D9D1];


GO
PRINT N'Quitando Restricción DEFAULT restricción sin nombre en [dbo].[TbProductos]...';


GO
ALTER TABLE [dbo].[TbProductos] DROP CONSTRAINT [DF__TbProduct__Estad__35BCFE0A];


GO
PRINT N'Quitando Restricción DEFAULT restricción sin nombre en [dbo].[TbProductos]...';


GO
ALTER TABLE [dbo].[TbProductos] DROP CONSTRAINT [DF__TbProduct__Fecha__286302EC];


GO
PRINT N'Quitando Restricción DEFAULT restricción sin nombre en [dbo].[TbProductos]...';


GO
ALTER TABLE [dbo].[TbProductos] DROP CONSTRAINT [DF__TbProduct__Usuar__29572725];


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[TbClientes]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_TbClientes] (
    [Id]                  INT          IDENTITY (1, 1) NOT NULL,
    [DocumentoIdentidad]  CHAR (12)    NOT NULL,
    [RazonSocial]         VARCHAR (50) NOT NULL,
    [Nombre]              VARCHAR (50) NOT NULL,
    [Estado]              BIT          DEFAULT 1 NOT NULL,
    [FechaCreacion]       DATETIME     DEFAULT GETDATE() NOT NULL,
    [UsuarioCreacion]     VARCHAR (50) DEFAULT 'sql' NOT NULL,
    [FechaModificacion]   DATETIME     NULL,
    [UsuarioModificacion] VARCHAR (50) NULL,
    [IdMaeTipoDocumento]  INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[TbClientes])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TbClientes] ON;
        INSERT INTO [dbo].[tmp_ms_xx_TbClientes] ([Id], [DocumentoIdentidad], [RazonSocial], [Nombre], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Estado])
        SELECT   [Id],
                 [DocumentoIdentidad],
                 [RazonSocial],
                 [Nombre],
                 [FechaCreacion],
                 [UsuarioCreacion],
                 [FechaModificacion],
                 [UsuarioModificacion],
                 [Estado]
        FROM     [dbo].[TbClientes]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TbClientes] OFF;
    END

DROP TABLE [dbo].[TbClientes];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_TbClientes]', N'TbClientes';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[TbProductos]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_TbProductos] (
    [Id]                  INT          IDENTITY (1, 1) NOT NULL,
    [Codigo]              NCHAR (10)   NOT NULL,
    [Nombre]              NCHAR (10)   NOT NULL,
    [Descripcion]         NCHAR (10)   NOT NULL,
    [Estado]              BIT          DEFAULT 1 NOT NULL,
    [FechaCreacion]       DATETIME     DEFAULT GETDATE() NOT NULL,
    [UsuarioCreacion]     VARCHAR (50) DEFAULT 'sql' NOT NULL,
    [FechaModificacion]   DATETIME     NULL,
    [UsuarioModificacion] VARCHAR (50) NULL,
    [IdMaeMarca]          INT          NOT NULL,
    [IdMaeCategoria]      INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Codigo] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[TbProductos])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TbProductos] ON;
        INSERT INTO [dbo].[tmp_ms_xx_TbProductos] ([Id], [Descripcion], [Codigo], [Nombre], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion], [Estado])
        SELECT   [Id],
                 [Descripcion],
                 [Codigo],
                 [Nombre],
                 [FechaCreacion],
                 [UsuarioCreacion],
                 [FechaModificacion],
                 [UsuarioModificacion],
                 [Estado]
        FROM     [dbo].[TbProductos]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TbProductos] OFF;
    END

DROP TABLE [dbo].[TbProductos];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_TbProductos]', N'TbProductos';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creando Tabla [dbo].[TbMaestro]...';


GO
CREATE TABLE [dbo].[TbMaestro] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [Codigo]              CHAR (30)     NOT NULL,
    [Nombre]              VARCHAR (50)  NOT NULL,
    [Descripcion]         VARCHAR (100) NULL,
    [TipoMaestro]         CHAR (3)      NULL,
    [FechaCreacion]       DATETIME      NOT NULL,
    [UsuarioCreacion]     VARCHAR (50)  NOT NULL,
    [FechaModificacion]   DATETIME      NULL,
    [UsuarioModificacion] VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Codigo] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[TbMaestroDetalle]...';


GO
CREATE TABLE [dbo].[TbMaestroDetalle] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [IdMaestro]           INT           NOT NULL,
    [Codigo]              CHAR (30)     NOT NULL,
    [Nombre]              VARCHAR (50)  NOT NULL,
    [Descripcion]         VARCHAR (100) NULL,
    [TipoMaestro]         CHAR (3)      NULL,
    [FechaCreacion]       DATETIME      NOT NULL,
    [UsuarioCreacion]     VARCHAR (50)  NOT NULL,
    [FechaModificacion]   DATETIME      NULL,
    [UsuarioModificacion] VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Codigo] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[TbVentas]...';


GO
CREATE TABLE [dbo].[TbVentas] (
    [Id]                  INT             IDENTITY (1, 1) NOT NULL,
    [IdClientes]          INT             NOT NULL,
    [IdProductos]         INT             NOT NULL,
    [IdMaeEstadoVenta]    INT             NOT NULL,
    [Stock]               INT             NOT NULL,
    [PrecioUnitario]      DECIMAL (10, 2) NOT NULL,
    [TotalBruto]          DECIMAL (10, 2) NOT NULL,
    [TotalNeto]           DECIMAL (10, 2) NOT NULL,
    [FechaCreacion]       DATETIME        NOT NULL,
    [UsuarioCreacion]     VARCHAR (50)    NOT NULL,
    [FechaModificacion]   DATETIME        NULL,
    [UsuarioModificacion] VARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbMaestro]...';


GO
ALTER TABLE [dbo].[TbMaestro]
    ADD DEFAULT GETDATE() FOR [FechaCreacion];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbMaestro]...';


GO
ALTER TABLE [dbo].[TbMaestro]
    ADD DEFAULT 'sql' FOR [UsuarioCreacion];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbMaestroDetalle]...';


GO
ALTER TABLE [dbo].[TbMaestroDetalle]
    ADD DEFAULT GETDATE() FOR [FechaCreacion];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbMaestroDetalle]...';


GO
ALTER TABLE [dbo].[TbMaestroDetalle]
    ADD DEFAULT 'sql' FOR [UsuarioCreacion];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbVentas]...';


GO
ALTER TABLE [dbo].[TbVentas]
    ADD DEFAULT GETDATE() FOR [FechaCreacion];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbVentas]...';


GO
ALTER TABLE [dbo].[TbVentas]
    ADD DEFAULT 'sql' FOR [UsuarioCreacion];


GO
PRINT N'Creando Clave externa [dbo].[FK_TbClientes_TbMaestroDetalle_TipoDocumento]...';


GO
ALTER TABLE [dbo].[TbClientes] WITH NOCHECK
    ADD CONSTRAINT [FK_TbClientes_TbMaestroDetalle_TipoDocumento] FOREIGN KEY ([IdMaeTipoDocumento]) REFERENCES [dbo].[TbMaestroDetalle] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbProductos_TbMaestroDetalle_Marca]...';


GO
ALTER TABLE [dbo].[TbProductos] WITH NOCHECK
    ADD CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Marca] FOREIGN KEY ([IdMaeMarca]) REFERENCES [dbo].[TbMaestroDetalle] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbProductos_TbMaestroDetalle_Categoria]...';


GO
ALTER TABLE [dbo].[TbProductos] WITH NOCHECK
    ADD CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Categoria] FOREIGN KEY ([IdMaeCategoria]) REFERENCES [dbo].[TbMaestroDetalle] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbMaestroDetalle_TbMaestro]...';


GO
ALTER TABLE [dbo].[TbMaestroDetalle] WITH NOCHECK
    ADD CONSTRAINT [FK_TbMaestroDetalle_TbMaestro] FOREIGN KEY ([IdMaestro]) REFERENCES [dbo].[TbMaestro] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbVentas_TbClientes_Id]...';


GO
ALTER TABLE [dbo].[TbVentas] WITH NOCHECK
    ADD CONSTRAINT [FK_TbVentas_TbClientes_Id] FOREIGN KEY ([IdClientes]) REFERENCES [dbo].[TbClientes] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbVentas_TbProductos_Id]...';


GO
ALTER TABLE [dbo].[TbVentas] WITH NOCHECK
    ADD CONSTRAINT [FK_TbVentas_TbProductos_Id] FOREIGN KEY ([IdProductos]) REFERENCES [dbo].[TbProductos] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbVentas_TbMaestroDetalle_id]...';


GO
ALTER TABLE [dbo].[TbVentas] WITH NOCHECK
    ADD CONSTRAINT [FK_TbVentas_TbMaestroDetalle_id] FOREIGN KEY ([IdMaeEstadoVenta]) REFERENCES [dbo].[TbMaestroDetalle] ([Id]);


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[Id].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador del registro, autoincrimental', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'Id';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[DocumentoIdentidad].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numero de documento de identidad', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'DocumentoIdentidad';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[RazonSocial].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Razon social', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'RazonSocial';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[Nombre].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre cliente', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'Nombre';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[Estado].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: inactivo / 1: Activo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'Estado';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[FechaCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de creacion del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[UsuarioCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre de usuario del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'UsuarioCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[FechaModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'FechaModificacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[UsuarioModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Usuario de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'UsuarioModificacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClientes].[IdMaeTipoDocumento].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador del tipo de documento de identidad', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClientes', @level2type = N'COLUMN', @level2name = N'IdMaeTipoDocumento';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbProductos].[Id].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador del registro, autoincrimental', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbProductos', @level2type = N'COLUMN', @level2name = N'Id';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbProductos].[Codigo].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Codigo del producto', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbProductos', @level2type = N'COLUMN', @level2name = N'Codigo';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbProductos].[Nombre].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre del producto', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbProductos', @level2type = N'COLUMN', @level2name = N'Nombre';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbProductos].[Descripcion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descripcion del producto', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbProductos', @level2type = N'COLUMN', @level2name = N'Descripcion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbProductos].[Estado].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0: inactivo / 1: Activo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbProductos', @level2type = N'COLUMN', @level2name = N'Estado';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbProductos].[FechaCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de creacion del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbProductos', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbProductos].[UsuarioCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre de usuario del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbProductos', @level2type = N'COLUMN', @level2name = N'UsuarioCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbProductos].[FechaModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbProductos', @level2type = N'COLUMN', @level2name = N'FechaModificacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbProductos].[UsuarioModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Usuario de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbProductos', @level2type = N'COLUMN', @level2name = N'UsuarioModificacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestro].[Id].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador del registro, autoincrimental', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestro', @level2type = N'COLUMN', @level2name = N'Id';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestro].[Codigo].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Valor constante para acceder al registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestro', @level2type = N'COLUMN', @level2name = N'Codigo';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestro].[Nombre].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre del maestro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestro', @level2type = N'COLUMN', @level2name = N'Nombre';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestro].[Descripcion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descripcion del maestro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestro', @level2type = N'COLUMN', @level2name = N'Descripcion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestro].[TipoMaestro].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Define el tipo de maestro: MAE: maestro, CFG: configuracion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestro', @level2type = N'COLUMN', @level2name = N'TipoMaestro';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestro].[FechaCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de creacion del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestro', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestro].[UsuarioCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre de usuario del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestro', @level2type = N'COLUMN', @level2name = N'UsuarioCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestro].[FechaModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestro', @level2type = N'COLUMN', @level2name = N'FechaModificacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestro].[UsuarioModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Usuario de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestro', @level2type = N'COLUMN', @level2name = N'UsuarioModificacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[Id].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador del registro, autoincrimental', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'Id';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[IdMaestro].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador de la cabezera maestro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'IdMaestro';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[Codigo].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Valor constante para acceder al registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'Codigo';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[Nombre].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre del maestro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'Nombre';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[Descripcion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descripcion del maestro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'Descripcion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[TipoMaestro].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Define el tipo de maestro: MAE: maestro, CFG: configuracion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'TipoMaestro';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[FechaCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de creacion del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[UsuarioCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre de usuario del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'UsuarioCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[FechaModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'FechaModificacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbMaestroDetalle].[UsuarioModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Usuario de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbMaestroDetalle', @level2type = N'COLUMN', @level2name = N'UsuarioModificacion';


GO
-- Paso de refactorización para actualizar el servidor de destino con los registros de transacciones implementadas
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '093a3f54-7925-4b90-930e-e06d17d2c1f5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('093a3f54-7925-4b90-930e-e06d17d2c1f5')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2285b630-4d53-4fe6-97de-f97de7c1af92')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2285b630-4d53-4fe6-97de-f97de7c1af92')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'adef2a31-a394-4816-9bde-fe449c15c59b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('adef2a31-a394-4816-9bde-fe449c15c59b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '78c579db-8c2d-4cff-98ba-2777a4dbaed1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('78c579db-8c2d-4cff-98ba-2777a4dbaed1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '95a7e551-971c-401c-803c-b1ef35b42c97')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('95a7e551-971c-401c-803c-b1ef35b42c97')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '979421bf-8d2b-4d40-9778-4d2682ad2724')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('979421bf-8d2b-4d40-9778-4d2682ad2724')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '19f79c97-5ede-47ef-a4ec-3576abca0fa2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('19f79c97-5ede-47ef-a4ec-3576abca0fa2')

GO

GO
/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/*Carga inicial de maestro*/

--Registro de marca
DECLARE @ID_MARCA INT
INSERT INTO TbMaestro (Codigo, Nombre, Descripcion, TipoMaestro, FechaCreacion, UsuarioCreacion)
VALUES ('MAE_MARCA','MARCA','MARCA DE PRODUCTOS', 'MAE', GETDATE(), 'Admin')

SET @ID_MARCA = (SELECT @@IDENTITY)

INSERT INTO TbMaestroDetalle (Codigo, IdMaestro, Descripcion, Valor, FechaCreacion, UsuarioCreacion)
VALUES
    ('MAR_GLORIA',@ID_MARCA, 'Marca Gloria', 'GLORIA', GETDATE() , 'Admin'),
    ('MAR_BOLIVAR',@ID_MARCA, 'Marca Bolivar', 'BOLIVAR', GETDATE() , 'Admin'),
    ('MAR_PRIMOR',@ID_MARCA, 'Marca Primor', 'PRIMOR', GETDATE() , 'Admin'),
    ('MAR_LAIVE',@ID_MARCA, 'Marca Laive', 'LAIVE', GETDATE() , 'Admin'),
    ('MAR_CASERITA',@ID_MARCA, 'Marca Caserita', 'CASERITA', GETDATE() , 'Admin')

GO

DECLARE @ID_TIPO_DOCUMENTO INT
INSERT INTO TbMaestro (Codigo, Nombre, Descripcion, TipoMaestro, FechaCreacion, UsuarioCreacion)
VALUES ('MAE_TIPDOC','TIPO_DOCUMENTO','ESTADOS DEL PEDIDO', 'MAE', GETDATE(), 'Admin')

SET @ID_TIPO_DOCUMENTO = (SELECT @@IDENTITY)

INSERT INTO TbMaestroDetalle (Codigo, IdMaestro, Descripcion, Valor, FechaCreacion, UsuarioCreacion)
VALUES
    ('DOC_RUC',@ID_TIPO_DOCUMENTO, 'Registro Unico de Constribuyentes', 'RUC', GETDATE() , 'Admin'),
    ('DOC_DNI',@ID_TIPO_DOCUMENTO, 'Documento nacional de identidad', 'DNI', GETDATE() , 'Admin'),
    ('DOC_PAS',@ID_TIPO_DOCUMENTO, 'Pasaporte', 'EN PASAPORTE', GETDATE() , 'Admin')

GO

DECLARE @ID_CATE INT
INSERT INTO TbMaestro (Codigo, Nombre, Descripcion, TipoMaestro, FechaCreacion, UsuarioCreacion)
VALUES ('MAE_CATEGORIA','CATEGORIA','CATEGORIA DE PRODUCTOS', 'MAE', GETDATE(), 'Admin')

SET @ID_CATE = (SELECT @@IDENTITY)

INSERT INTO TbMaestroDetalle (Codigo, IdMaestro, Descripcion, Valor, FechaCreacion, UsuarioCreacion)
VALUES
    ('CAT_ALIMENTOS',@ID_CATE, 'Categoria Alimentos', 'ALIMENTOS', GETDATE() , 'Admin'),
    ('CAT_LIMPIEZA',@ID_CATE, 'Categoria Limpieza', 'LIMPIEZA', GETDATE() , 'Admin'),
    ('CAT_PERSONAL',@ID_CATE, 'Categoria Uso Personal', 'PERSONAL', GETDATE() , 'Admin'),
    ('CAT_BEBIDAS',@ID_CATE, 'Categoria Bebidas', 'BEBIDAS', GETDATE() , 'Admin'),
    ('CAT_ALCOHOL',@ID_CATE, 'Categoria Bebidas Alcoholicas', 'ALCOHOL', GETDATE() , 'Admin')

GO
DECLARE @ID_ESTADO_VENTA INT
INSERT INTO TbMaestro (Codigo, Nombre, Descripcion, TipoMaestro, FechaCreacion, UsuarioCreacion)
VALUES ('MAE_ESTVNT','ESTADO VENTA','ESTADOS DE LA VENTA', 'MAE', GETDATE(), 'Admin')

SET @ID_ESTADO_VENTA = (SELECT @@IDENTITY)

INSERT INTO TbMaestroDetalle (Codigo, IdMaestro, Descripcion, Valor, FechaCreacion, UsuarioCreacion)
VALUES
    ('VNT_REGISTRADO',@ID_ESTADO_VENTA, 'Venta registrada', 'REGISTRADO', GETDATE() , 'Admin'),
    ('VNT_RECIBIDO',@ID_ESTADO_VENTA, 'Venta recibida por almacen', 'RECIBIDO', GETDATE() , 'Admin'),
    ('VNT_DESPACHO',@ID_ESTADO_VENTA, 'Venta en proceso de despacho', 'EN DESPACHO', GETDATE() , 'Admin'),
    ('VNT_CAMINO',@ID_ESTADO_VENTA, 'Venta en camino de entrega', 'EN CAMINO', GETDATE() , 'Admin'),
    ('VNT_ENTREGADO',@ID_ESTADO_VENTA, 'Venta entregado', 'ENTREGADO', GETDATE() , 'Admin'),
    ('VNT_CANCELADO',@ID_ESTADO_VENTA, 'Venta cancelado', 'CANCELADO', GETDATE() , 'Admin'),
    ('VNT_RETRASADO',@ID_ESTADO_VENTA, 'Venta retrasado', 'RETRASADO', GETDATE() , 'Admin')

GO

GO
PRINT N'Comprobando los datos existentes con las restricciones recién creadas';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[TbClientes] WITH CHECK CHECK CONSTRAINT [FK_TbClientes_TbMaestroDetalle_TipoDocumento];

ALTER TABLE [dbo].[TbProductos] WITH CHECK CHECK CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Marca];

ALTER TABLE [dbo].[TbProductos] WITH CHECK CHECK CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Categoria];

ALTER TABLE [dbo].[TbMaestroDetalle] WITH CHECK CHECK CONSTRAINT [FK_TbMaestroDetalle_TbMaestro];

ALTER TABLE [dbo].[TbVentas] WITH CHECK CHECK CONSTRAINT [FK_TbVentas_TbClientes_Id];

ALTER TABLE [dbo].[TbVentas] WITH CHECK CHECK CONSTRAINT [FK_TbVentas_TbProductos_Id];

ALTER TABLE [dbo].[TbVentas] WITH CHECK CHECK CONSTRAINT [FK_TbVentas_TbMaestroDetalle_id];


GO
PRINT N'Actualización completada.';


GO
