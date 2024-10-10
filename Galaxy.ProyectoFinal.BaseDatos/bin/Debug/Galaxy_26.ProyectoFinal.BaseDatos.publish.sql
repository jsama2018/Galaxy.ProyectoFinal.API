﻿/*
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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creando la base de datos $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'No se puede modificar la configuración de la base de datos. Debe ser un administrador del sistema para poder aplicar esta configuración.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creando Tabla [dbo].[TbClientes]...';


GO
CREATE TABLE [dbo].[TbClientes] (
    [Id]                  INT          IDENTITY (1, 1) NOT NULL,
    [DocumentoIdentidad]  CHAR (12)    NOT NULL,
    [RazonSocial]         VARCHAR (50) NOT NULL,
    [Nombre]              VARCHAR (50) NOT NULL,
    [Estado]              BIT          NOT NULL,
    [FechaCreacion]       DATETIME     NOT NULL,
    [UsuarioCreacion]     VARCHAR (50) NOT NULL,
    [FechaModificacion]   DATETIME     NULL,
    [UsuarioModificacion] VARCHAR (50) NULL,
    [IdMaeTipoDocumento]  INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[TbClienteUsuario]...';


GO
CREATE TABLE [dbo].[TbClienteUsuario] (
    [Id]                  INT          IDENTITY (1, 1) NOT NULL,
    [IdClientes]          INT          NOT NULL,
    [Usuario]             VARCHAR (50) NULL,
    [Clave]               VARCHAR (50) NULL,
    [BloqueadoHasta]      DATETIME     NOT NULL,
    [UltimoBloqueo]       DATETIME     NOT NULL,
    [IntentosFallidos]    INT          NULL,
    [Estado]              BIT          NOT NULL,
    [FechaCreacion]       DATETIME     NOT NULL,
    [UsuarioCreacion]     VARCHAR (50) NOT NULL,
    [FechaModificacion]   DATETIME     NULL,
    [UsuarioModificacion] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


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
    [Descripcion]         VARCHAR (100) NULL,
    [Valor]               VARCHAR (100) NULL,
    [TipoMaestro]         CHAR (3)      NULL,
    [FechaCreacion]       DATETIME      NOT NULL,
    [UsuarioCreacion]     VARCHAR (50)  NOT NULL,
    [FechaModificacion]   DATETIME      NULL,
    [UsuarioModificacion] VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Codigo] ASC)
);


GO
PRINT N'Creando Tabla [dbo].[TbProductos]...';


GO
CREATE TABLE [dbo].[TbProductos] (
    [Id]                  INT          IDENTITY (1, 1) NOT NULL,
    [Codigo]              NCHAR (10)   NOT NULL,
    [Nombre]              NCHAR (10)   NOT NULL,
    [Descripcion]         NCHAR (10)   NOT NULL,
    [Estado]              BIT          NOT NULL,
    [FechaCreacion]       DATETIME     NOT NULL,
    [UsuarioCreacion]     VARCHAR (50) NOT NULL,
    [FechaModificacion]   DATETIME     NULL,
    [UsuarioModificacion] VARCHAR (50) NULL,
    [IdMaeMarca]          INT          NOT NULL,
    [IdMaeCategoria]      INT          NOT NULL,
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
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbClientes]...';


GO
ALTER TABLE [dbo].[TbClientes]
    ADD DEFAULT 1 FOR [Estado];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbClientes]...';


GO
ALTER TABLE [dbo].[TbClientes]
    ADD DEFAULT GETDATE() FOR [FechaCreacion];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbClientes]...';


GO
ALTER TABLE [dbo].[TbClientes]
    ADD DEFAULT 'sql' FOR [UsuarioCreacion];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbClienteUsuario]...';


GO
ALTER TABLE [dbo].[TbClienteUsuario]
    ADD DEFAULT 1 FOR [Estado];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbClienteUsuario]...';


GO
ALTER TABLE [dbo].[TbClienteUsuario]
    ADD DEFAULT GETDATE() FOR [FechaCreacion];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbClienteUsuario]...';


GO
ALTER TABLE [dbo].[TbClienteUsuario]
    ADD DEFAULT 'sql' FOR [UsuarioCreacion];


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
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbProductos]...';


GO
ALTER TABLE [dbo].[TbProductos]
    ADD DEFAULT 1 FOR [Estado];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbProductos]...';


GO
ALTER TABLE [dbo].[TbProductos]
    ADD DEFAULT GETDATE() FOR [FechaCreacion];


GO
PRINT N'Creando Restricción DEFAULT restricción sin nombre en [dbo].[TbProductos]...';


GO
ALTER TABLE [dbo].[TbProductos]
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
ALTER TABLE [dbo].[TbClientes]
    ADD CONSTRAINT [FK_TbClientes_TbMaestroDetalle_TipoDocumento] FOREIGN KEY ([IdMaeTipoDocumento]) REFERENCES [dbo].[TbMaestroDetalle] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbClienteUsuario_TbClientes_Id]...';


GO
ALTER TABLE [dbo].[TbClienteUsuario]
    ADD CONSTRAINT [FK_TbClienteUsuario_TbClientes_Id] FOREIGN KEY ([IdClientes]) REFERENCES [dbo].[TbClientes] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbMaestroDetalle_TbMaestro]...';


GO
ALTER TABLE [dbo].[TbMaestroDetalle]
    ADD CONSTRAINT [FK_TbMaestroDetalle_TbMaestro] FOREIGN KEY ([IdMaestro]) REFERENCES [dbo].[TbMaestro] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbProductos_TbMaestroDetalle_Marca]...';


GO
ALTER TABLE [dbo].[TbProductos]
    ADD CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Marca] FOREIGN KEY ([IdMaeMarca]) REFERENCES [dbo].[TbMaestroDetalle] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbProductos_TbMaestroDetalle_Categoria]...';


GO
ALTER TABLE [dbo].[TbProductos]
    ADD CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Categoria] FOREIGN KEY ([IdMaeCategoria]) REFERENCES [dbo].[TbMaestroDetalle] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbVentas_TbClientes_Id]...';


GO
ALTER TABLE [dbo].[TbVentas]
    ADD CONSTRAINT [FK_TbVentas_TbClientes_Id] FOREIGN KEY ([IdClientes]) REFERENCES [dbo].[TbClientes] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbVentas_TbProductos_Id]...';


GO
ALTER TABLE [dbo].[TbVentas]
    ADD CONSTRAINT [FK_TbVentas_TbProductos_Id] FOREIGN KEY ([IdProductos]) REFERENCES [dbo].[TbProductos] ([Id]);


GO
PRINT N'Creando Clave externa [dbo].[FK_TbVentas_TbMaestroDetalle_id]...';


GO
ALTER TABLE [dbo].[TbVentas]
    ADD CONSTRAINT [FK_TbVentas_TbMaestroDetalle_id] FOREIGN KEY ([IdMaeEstadoVenta]) REFERENCES [dbo].[TbMaestroDetalle] ([Id]);


GO
PRINT N'Creando Procedimiento [dbo].[SpInsertarProductos]...';


GO
CREATE PROCEDURE [dbo].[SpInsertarProductos]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
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
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[Id].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador del registro, autoincrimental', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'Id';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[IdClientes].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador del clientes', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'IdClientes';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[Usuario].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre de usuario', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'Usuario';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[Clave].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'password', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'Clave';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[BloqueadoHasta].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'bloqueo hasta', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'BloqueadoHasta';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[UltimoBloqueo].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ultimo bloqueo', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'UltimoBloqueo';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[IntentosFallidos].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'intentos fallidos', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'IntentosFallidos';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[Estado].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'estado', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'Estado';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[FechaCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de creacion del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'FechaCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[UsuarioCreacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Nombre de usuario del registro', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'UsuarioCreacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[FechaModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'FechaModificacion';


GO
PRINT N'Creando Propiedad extendida [dbo].[TbClienteUsuario].[UsuarioModificacion].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Usuario de ultima modificacion', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TbClienteUsuario', @level2type = N'COLUMN', @level2name = N'UsuarioModificacion';


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
-- Paso de refactorización para actualizar el servidor de destino con los registros de transacciones implementadas

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '94e2a5d0-2109-4d48-be11-188ceb0f9aac')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('94e2a5d0-2109-4d48-be11-188ceb0f9aac')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'bc7714e3-9a90-4287-b9b1-fe176d651076')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('bc7714e3-9a90-4287-b9b1-fe176d651076')
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

INSERT INTO TbMaestroDetalle (IdMaestro, Codigo, Descripcion, Valor, FechaCreacion, UsuarioCreacion)
VALUES
    (@ID_MARCA, 'MAR_GLORIA', 'Marca Gloria', 'GLORIA', GETDATE() , 'Admin'),
    (@ID_MARCA, 'MAR_BOLIVAR', 'Marca Bolivar', 'BOLIVAR', GETDATE() , 'Admin'),
    (@ID_MARCA, 'MAR_PRIMOR', 'Marca Primor', 'PRIMOR', GETDATE() , 'Admin'),
    (@ID_MARCA, 'MAR_LAIVE', 'Marca Laive', 'LAIVE', GETDATE() , 'Admin'),
    (@ID_MARCA, 'MAR_CASERITA', 'Marca Caserita', 'CASERITA', GETDATE() , 'Admin')

GO

DECLARE @ID_TIPO_DOCUMENTO INT
INSERT INTO TbMaestro (Codigo, Nombre, Descripcion, TipoMaestro, FechaCreacion, UsuarioCreacion)
VALUES ('MAE_TIPDOC','TIPO_DOCUMENTO','ESTADOS DEL PEDIDO', 'MAE', GETDATE(), 'Admin')

SET @ID_TIPO_DOCUMENTO = (SELECT @@IDENTITY)

INSERT INTO TbMaestroDetalle (IdMaestro, Codigo,  Descripcion, Valor, FechaCreacion, UsuarioCreacion)
VALUES
    (@ID_TIPO_DOCUMENTO, 'DOC_RUC', 'Registro Unico de Constribuyentes', 'RUC', GETDATE() , 'Admin'),
    (@ID_TIPO_DOCUMENTO, 'DOC_DNI', 'Documento nacional de identidad', 'DNI', GETDATE() , 'Admin'),
    (@ID_TIPO_DOCUMENTO, 'DOC_PAS', 'Pasaporte', 'EN PASAPORTE', GETDATE() , 'Admin')

GO

DECLARE @ID_CATE INT
INSERT INTO TbMaestro (Codigo, Nombre, Descripcion, TipoMaestro, FechaCreacion, UsuarioCreacion)
VALUES ('MAE_CATEGORIA','CATEGORIA','CATEGORIA DE PRODUCTOS', 'MAE', GETDATE(), 'Admin')

SET @ID_CATE = (SELECT @@IDENTITY)

INSERT INTO TbMaestroDetalle (IdMaestro, Codigo, Descripcion, Valor, FechaCreacion, UsuarioCreacion)
VALUES
    (@ID_CATE, 'CAT_ALIMENTOS', 'Categoria Alimentos', 'ALIMENTOS', GETDATE() , 'Admin'),
    (@ID_CATE, 'CAT_LIMPIEZA', 'Categoria Limpieza', 'LIMPIEZA', GETDATE() , 'Admin'),
    (@ID_CATE, 'CAT_PERSONAL', 'Categoria Uso Personal', 'PERSONAL', GETDATE() , 'Admin'),
    (@ID_CATE, 'CAT_BEBIDAS', 'Categoria Bebidas', 'BEBIDAS', GETDATE() , 'Admin'),
    (@ID_CATE, 'CAT_ALCOHOL', 'Categoria Bebidas Alcoholicas', 'ALCOHOL', GETDATE() , 'Admin')

GO
DECLARE @ID_ESTADO_VENTA INT
INSERT INTO TbMaestro (Codigo, Nombre, Descripcion, TipoMaestro, FechaCreacion, UsuarioCreacion)
VALUES ('MAE_ESTVNT','ESTADO VENTA','ESTADOS DE LA VENTA', 'MAE', GETDATE(), 'Admin')

SET @ID_ESTADO_VENTA = (SELECT @@IDENTITY)

INSERT INTO TbMaestroDetalle (IdMaestro, Codigo,  Descripcion, Valor, FechaCreacion, UsuarioCreacion)
VALUES
    (@ID_ESTADO_VENTA, 'VNT_REGISTRADO', 'Venta registrada', 'REGISTRADO', GETDATE() , 'Admin'),
    (@ID_ESTADO_VENTA, 'VNT_RECIBIDO', 'Venta recibida por almacen', 'RECIBIDO', GETDATE() , 'Admin'),
    (@ID_ESTADO_VENTA, 'VNT_DESPACHO', 'Venta en proceso de despacho', 'EN DESPACHO', GETDATE() , 'Admin'),
    (@ID_ESTADO_VENTA, 'VNT_CAMINO', 'Venta en camino de entrega', 'EN CAMINO', GETDATE() , 'Admin'),
    (@ID_ESTADO_VENTA, 'VNT_ENTREGADO', 'Venta entregado', 'ENTREGADO', GETDATE() , 'Admin'),
    (@ID_ESTADO_VENTA, 'VNT_CANCELADO', 'Venta cancelado', 'CANCELADO', GETDATE() , 'Admin'),
    (@ID_ESTADO_VENTA, 'VNT_RETRASADO', 'Venta retrasado', 'RETRASADO', GETDATE() , 'Admin')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Actualización completada.';


GO