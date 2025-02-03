--CREATE DATABASE INTECAP
--GO

USE INTECAP
GO
--YA
DROP TABLE IF EXISTS PARTICIPANTE
CREATE TABLE PARTICIPANTE(
CARNET_PARTICIPANTE		VARCHAR(100)
,NOMBRE					VARCHAR(50)
,APELLIDO				VARCHAR(50)
,CORREO					VARCHAR(50)
,DIRECCION				VARCHAR(50) 
,NO_BANCARIO			VARCHAR(25)
,GRADO_ACADEMICO		VARCHAR(50)
,FECHA_NACIMIENTO		DATE
,TELEFONO				VARCHAR(10)
,FECHA_REGISTRO         DATE DEFAULT(GETDATE())
,COD_ESTIPENDIO			INT
)
--YA
DROP TABLE IF EXISTS TIPO_CARRERA
CREATE TABLE TIPO_CARRERA(
COD_TIPO		INT							IDENTITY(1,1) PRIMARY KEY
,DESCRIPCION	VARCHAR(50)
)

DROP TABLE IF EXISTS PROFESOR
CREATE TABLE PROFESOR (
COD_PROFESOR	INT							IDENTITY(1,1) PRIMARY KEY,
NOMBRE			VARCHAR(50),
APELLIDO		VARCHAR(50),
TELEFONO		VARCHAR(10),
CORREO			VARCHAR(50)
)
--YA
DROP TABLE IF EXISTS TIPO_CURSO
CREATE TABLE TIPO_CURSO(
COD_TIPO_CURSO	INT							IDENTITY(1,1) PRIMARY KEY,
DESCRIPCION		VARCHAR(50)
)
--YA
DROP TABLE IF EXISTS CARRERA
CREATE TABLE CARRERA(
COD_CARRERA		INT							IDENTITY(1,1) PRIMARY KEY
,NOMBRE			VARCHAR(100)
,DESCRIPCION	VARCHAR(200)
,HORA_INICIO    TIME
,HORA_FINAL     TIME
,DURACION       VARCHAR(100)
,COD_TIPO		INT
)
--YA CASI
DROP TABLE IF EXISTS CURSO
CREATE TABLE CURSO(
COD_CURSO			INT						IDENTITY(1,1) PRIMARY KEY
,NOMBRE				VARCHAR(100)
,DESCRIPCION		VARCHAR(50)
,COD_PROFESOR       INT
,COD_TIPO_CURSO		INT
,COD_CARRERA		INT
)

DROP TABLE IF EXISTS TIPO_ESTIPENDIO
CREATE TABLE TIPO_ESTIPENDIO(
COD_TIPO			INT							IDENTITY(1,1) PRIMARY KEY
,DESCRIPCION        VARCHAR(100)
,CANTIDAD			NUMERIC(20,2)
)

DROP TABLE IF EXISTS INSCRIPCION
CREATE TABLE INSCRIPCION (
COD_INSCRIPCION				INT				IDENTITY(1,1) PRIMARY KEY
,ESTADO						VARCHAR(100)
,FECHA_ACTUALIZACION		DATE DEFAULT(GETDATE())
,CARNET_PARTICIPANTE		INT
,COD_CARRERA				INT
)

--DROP DATABASE INTECAP

--SELECT * FROM PROFESOR
