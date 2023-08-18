HA$PBExportHeader$tcc.sra
$PBExportComments$Generated Application Object
forward
global type tcc from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
Long gs_IdUsuario, gs_IdEmpresa
end variables
global type tcc from application
string appname = "tcc"
end type
global tcc tcc

on tcc.create
appname="tcc"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on tcc.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Profile tcc1
SQLCA.DBMS = "ODBC"
SQLCA.AutoCommit = False
SQLCA.DBParm = "ConnectString='DSN=PostgreSQL30;UID=postgres;PWD=123456'"

CONNECT USING SQLCA;

Open(w_login)
end event

