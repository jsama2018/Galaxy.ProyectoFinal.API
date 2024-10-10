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
PRINT N'Quitando Restricción DEFAULT restricción sin nombre en [dbo].[TbMaestroDetalle]...';


GO
ALTER TABLE [dbo].[TbMaestroDetalle] DROP CONSTRAINT [DF__TbMaestro__Fecha__5BE2A6F2];


GO
PRINT N'Quitando Restricción DEFAULT restricción sin nombre en [dbo].[TbMaestroDetalle]...';


GO
ALTER TABLE [dbo].[TbMaestroDetalle] DROP CONSTRAINT [DF__TbMaestro__Usuar__5CD6CB2B];


GO
PRINT N'Quitando Clave externa [dbo].[FK_TbClientes_TbMaestroDetalle_TipoDocumento]...';


GO
ALTER TABLE [dbo].[TbClientes] DROP CONSTRAINT [FK_TbClientes_TbMaestroDetalle_TipoDocumento];


GO
PRINT N'Quitando Clave externa [dbo].[FK_TbProductos_TbMaestroDetalle_Marca]...';


GO
ALTER TABLE [dbo].[TbProductos] DROP CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Marca];


GO
PRINT N'Quitando Clave externa [dbo].[FK_TbProductos_TbMaestroDetalle_Categoria]...';


GO
ALTER TABLE [dbo].[TbProductos] DROP CONSTRAINT [FK_TbProductos_TbMaestroDetalle_Categoria];


GO
PRINT N'Quitando Clave externa [dbo].[FK_TbMaestroDetalle_TbMaestro]...';


GO
ALTER TABLE [dbo].[TbMaestroDetalle] DROP CONSTRAINT [FK_TbMaestroDetalle_TbMaestro];


GO
PRINT N'Quitando Clave externa [dbo].[FK_TbVentas_TbMaestroDetalle_id]...';


GO
ALTER TABLE [dbo].[TbVentas] DROP CONSTRAINT [FK_TbVentas_TbMaestroDetalle_id];


GO
PRINT N'Iniciando recompilación de la tabla [dbo].[TbMaestroDetalle]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_TbMaestroDetalle] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [IdMaestro]           INT           NOT NULL,
    [Codigo]              CHAR (30)     NOT NULL,
    [Nombre]              VARCHAR (50)  NOT NULL,
    [Descripcion]         VARCHAR (100) NULL,
    [Valor]               VARCHAR (100) NULL,
    [TipoMaestro]         CHAR (3)      NULL,
    [FechaCreacion]       DATETIME      DEFAULT GETDATE() NOT NULL,
    [UsuarioCreacion]     VARCHAR (50)  DEFAULT 'sql' NOT NULL,
    [FechaModificacion]   DATETIME      NULL,
    [UsuarioModificacion] VARCHAR (50)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    UNIQUE NONCLUSTERED ([Codigo] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[TbMaestroDetalle])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TbMaestroDetalle] ON;
        INSERT INTO [dbo].[tmp_ms_xx_TbMaestroDetalle] ([Id], [IdMaestro], [Codigo], [Nombre], [Descripcion], [TipoMaestro], [FechaCreacion], [UsuarioCreacion], [FechaModificacion], [UsuarioModificacion])
        SELECT   [Id],
                 [IdMaestro],
                 [Codigo],
                 [Nombre],
                 [Descripcion],
                 [TipoMaestro],
                 [FechaCreacion],
                 [UsuarioCreacion],
                 [FechaModificacion],
                 [UsuarioModificacion]
        FROM     [dbo].[TbMaestroDetalle]
        ORDER BY [Id] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_TbMaestroDetalle] OFF;
    END

DROP TABLE [dbo].[TbMaestroDetalle];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_TbMaestroDetalle]', N'TbMaestroDetalle';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


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
PRINT N'Creando Clave externa [dbo].[FK_TbVentas_TbMaestroDetalle_id]...';


GO
ALTER TABLE [dbo].[TbVentas] WITH NOCHECK
    ADD CONSTRAINT [FK_TbVentas_TbMaestroDetalle_id] FOREIGN KEY ([IdMaeEstadoVenta]) REFERENCES [dbo].[TbMaestroDetalle] ([Id]);


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

ALTER TABLE [dbo].[TbVentas] WITH CHECK CHECK CONSTRAINT [FK_TbVentas_TbMaestroDetalle_id];


GO
PRINT N'Actualización completada.';


GO
