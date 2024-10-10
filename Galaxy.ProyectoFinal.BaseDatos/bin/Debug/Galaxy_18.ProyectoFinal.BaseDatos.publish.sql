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
PRINT N'Actualización completada.';


GO
