HA$PBExportHeader$w_login.srw
forward
global type w_login from window
end type
type sle_login from u_singlelineedit within w_login
end type
type sle_senha from u_singlelineedit within w_login
end type
type st_1 from u_statictext within w_login
end type
type st_login from u_statictext within w_login
end type
type cb_login from u_commandbutton within w_login
end type
end forward

global type w_login from window
integer width = 1979
integer height = 608
boolean titlebar = true
string title = "Login"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "DataWindow5!"
boolean center = true
sle_login sle_login
sle_senha sle_senha
st_1 st_1
st_login st_login
cb_login cb_login
end type
global w_login w_login

forward prototypes
public function integer of_validar_campos ()
public function integer of_login ()
end prototypes

public function integer of_validar_campos ();If sle_Login.Text = '' Then
	Msg('Informe um endere$$HEX1$$e700$$ENDHEX$$o de email v$$HEX1$$e100$$ENDHEX$$lido!')
	Return -1
End If

If Pos(sle_Login.Text, '@') = 0 Then
	Msg('Informe um endere$$HEX1$$e700$$ENDHEX$$o de email v$$HEX1$$e100$$ENDHEX$$lido!')
	Return -1
End If

If sle_Senha.Text = '' Then
	Msg('Informe um valor ao campo Senha!')
	Return -1
End If

Return 1
end function

public function integer of_login ();String ls_Login, ls_Senha
Long ll_IdUsuario, ll_IdEmpresa

ls_Login = Trim(sle_Login.Text)
ls_Senha = Trim(sle_Senha.Text)

SELECT
	IDUSUARIO,
	IDEMPRESA
INTO
	:ll_IdUsuario,
	:ll_IdEmpresa
FROM
	USUARIO
WHERE
	EMAIL = :ls_Login AND
	SENHA = :ls_Senha
USING
	SQLCA;

If ll_IdUsuario <= 0 Then
	Msg('Email ou senha incorretos. Verifique!')
	Return -1
End If

gs_IdUsuario = ll_IdUsuario
gs_IdEmpresa = ll_IdEmpresa

Open(w_menu)
end function

on w_login.create
this.sle_login=create sle_login
this.sle_senha=create sle_senha
this.st_1=create st_1
this.st_login=create st_login
this.cb_login=create cb_login
this.Control[]={this.sle_login,&
this.sle_senha,&
this.st_1,&
this.st_login,&
this.cb_login}
end on

on w_login.destroy
destroy(this.sle_login)
destroy(this.sle_senha)
destroy(this.st_1)
destroy(this.st_login)
destroy(this.cb_login)
end on

type sle_login from u_singlelineedit within w_login
integer x = 443
integer y = 84
integer width = 1275
integer taborder = 10
string text = "a@a"
textcase textcase = upper!
end type

type sle_senha from u_singlelineedit within w_login
integer x = 443
integer y = 188
integer width = 1275
integer taborder = 30
string text = "1"
boolean password = true
end type

type st_1 from u_statictext within w_login
integer x = 219
integer y = 204
integer width = 201
string text = "Senha:"
alignment alignment = left!
end type

type st_login from u_statictext within w_login
integer x = 219
integer y = 96
integer width = 192
string text = "Email:"
alignment alignment = left!
end type

type cb_login from u_commandbutton within w_login
integer x = 800
integer y = 356
integer taborder = 20
string text = "Logar"
end type

event clicked;call super::clicked;If of_Validar_Campos() > 0 Then 
	of_Login()
End If
end event

