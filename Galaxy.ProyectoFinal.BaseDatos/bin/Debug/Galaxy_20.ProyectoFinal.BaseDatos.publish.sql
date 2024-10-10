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
Se está quitando la columna [dbo].[TbMaestroDetalle].[Nombre]; puede que se pierdan datos.
*/

IF EXISTS (select top 1 1 from [dbo].[TbMaestroDetalle])
    RAISERROR (N'Se detectaron filas. La actualización del esquema va a terminar debido a una posible pérdida de datos.', 16, 127) WITH NOWAIT

GO
PRINT N'Modificando Tabla [dbo].[TbMaestroDetalle]...';


GO
ALTER TABLE [dbo].[TbMaestroDetalle] DROP COLUMN [Nombre];


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
PRINT N'Actualización completada.';


GO
