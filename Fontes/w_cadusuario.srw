HA$PBExportHeader$w_cadusuario.srw
forward
global type w_cadusuario from w_ancestor_cadastro
end type
end forward

global type w_cadusuario from w_ancestor_cadastro
string title = "ERP - Cadastro de Usu$$HEX1$$e100$$ENDHEX$$rio"
end type
global w_cadusuario w_cadusuario

forward prototypes
public function integer of_pesquisar ()
public subroutine of_gravar ()
public function integer of_validar_inclusao ()
end prototypes

public function integer of_pesquisar ();String ls_Filter

dw_Filtros.AcceptText()

If dw_Corrente.RowCount() <= 0 Then dw_Corrente.retrieve()

If Uf_Null(dw_Filtros.GetItemNumber(1, 'idusuario'), 0) <> 0 Then
	ls_Filter = "idusuario = " + String(dw_Filtros.GetItemNumber(1, 'idusuario'))
End If

If Uf_Null(dw_Filtros.GetItemNumber(1, 'idempresa'), 0) <> 0 Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(idempresa = " + String(dw_Filtros.GetItemNumber(1, 'idempresa')) + ')'
	Else
		ls_Filter = ls_Filter + ' and (idempresa = ' + String(dw_Filtros.GetItemNumber(1, 'idempresa')) + ')'
	End If
End If

If Uf_Null(dw_Filtros.GetItemString(1, "nomeusuario"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(lower(nome) LIKE '%" + String(dw_Filtros.GetItemString(1, "nomeusuario")) + "%')"
	Else
		ls_Filter = ls_Filter + " and (lower(nome) LIKE '%" + String(dw_Filtros.GetItemString(1, "nomeusuario")) + "%')"
	End If
End If

If Uf_Null(dw_Filtros.GetItemString(1, "email"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(lower(email) LIKE '%" + String(dw_Filtros.GetItemString(1, "email")) + "%')"
	Else
		ls_Filter = ls_Filter + " and (lower(email) LIKE '%" + String(dw_Filtros.GetItemString(1, "email")) + "%')"
	End If
End If

If Uf_Null(dw_Filtros.GetItemString(1, "flaginativo"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(flaginativo = '" + String(dw_Filtros.GetItemString(1, "flaginativo")) + "')"
	Else
		ls_Filter = ls_Filter + " and (flaginativo = '" + String(dw_Filtros.GetItemString(1, "flaginativo")) + "')"
	End If
End If

dw_Corrente.SetFilter(ls_Filter)
dw_Corrente.Filter()

dw_Corrente.SetSort('idusuario asc')
dw_Corrente.Sort()

Return 1
end function

public subroutine of_gravar ();Long ll_For, ll_MaxId
String ls_Teste
Integer li_Ret

dw_Corrente.SetFilter("IsNull(idusuario)")
dw_Corrente.Filter()

SELECT
	MAX(IDUSUARIO)
INTO :ll_MaxId
	FROM USUARIO
USING SQLCA;

For ll_For = 1 To dw_Corrente.RowCount()
	ll_MaxId++
	
	dw_Corrente.SetItem(ll_For, 'idusuario', ll_MaxId)
Next

dw_Corrente.SetFilter("")
dw_Corrente.Filter()

li_Ret = dw_Corrente.Update()

If li_Ret > 0 Then
	dw_Corrente.SetRedraw(True)
	Msg('Informa$$HEX2$$e700f500$$ENDHEX$$es salvas com sucesso!')
Else
	Msg('Ocorreu um erro ao gravar as informa$$HEX2$$e700f500$$ENDHEX$$es.')
End If

of_Pesquisar()
end subroutine

public function integer of_validar_inclusao ();Long ll_For, ll_IdUsuario
String ls_Email, ls_Usuario

dw_Corrente.AcceptText()

For ll_For = 1 To dw_Corrente.RowCount()
	
	ls_Email = Uf_Null(dw_Corrente.GetItemString(ll_For, "email"), "")
	
	If Uf_Null(Trim(dw_Corrente.GetItemString(ll_For, "nome")), "") = "" Then
		Msg('Informe um nome para o usu$$HEX1$$e100$$ENDHEX$$rio.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	End If
	
	If ls_Email = "" Then
		Msg('Informe um email para o usu$$HEX1$$e100$$ENDHEX$$rio.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	Else
		If Uf_Null(dw_Corrente.GetItemNumber(ll_For, 'idusuario'), 0) = 0 Then
			SELECT 
				IDUSUARIO,
				NOME
			INTO
				:ll_IdUsuario,
				:ls_Usuario
			FROM
				USUARIO
			WHERE
				EMAIL = :ls_Email
			USING SQLCA;
				
			If Uf_Null(ll_IdUsuario, 0) > 0 Then
				Msg('Esse email j$$HEX2$$e1002000$$ENDHEX$$est$$HEX2$$e1002000$$ENDHEX$$sendo utilizado pelo usu$$HEX1$$e100$$ENDHEX$$rio ' + String(ll_IdUsuario) + ' - ' + ls_Usuario)
				dw_Corrente.SetRow(ll_For)
				dw_Corrente.SelectRow(ll_For, true)
				dw_Corrente.SetFocus()
				Return -1
			End If
		End If
	End If
	
	If Uf_Null(dw_Corrente.GetItemNumber(ll_For, "idempresa"), 0.00) = 0.00 Then
		Msg('Informe uma empresa para o usu$$HEX1$$e100$$ENDHEX$$rio.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	End If
	
	dw_Corrente.SetItem(ll_For, 'email', lower(ls_Email))
Next

Return 1

end function

on w_cadusuario.create
call super::create
end on

on w_cadusuario.destroy
call super::destroy
end on

type cb_incluir from w_ancestor_cadastro`cb_incluir within w_cadusuario
end type

type dw_filtros from w_ancestor_cadastro`dw_filtros within w_cadusuario
string dataobject = "d_filtros_usuario"
end type

type cb_limparfiltros from w_ancestor_cadastro`cb_limparfiltros within w_cadusuario
end type

type cb_pesquisar from w_ancestor_cadastro`cb_pesquisar within w_cadusuario
end type

type dw_corrente from w_ancestor_cadastro`dw_corrente within w_cadusuario
string dataobject = "d_cadusuario"
boolean hsplitscroll = true
end type

event dw_corrente::ue_postitemchanged;call super::ue_postitemchanged;Long ll_IdUsuario

If dwo.name = 'email' Then
	SELECT
		IDUSUARIO
	INTO
		:ll_IdUsuario
	FROM
		USUARIO
	WHERE
		EMAIL = :DATA
	USING
		SQLCA;
		
	If Uf_Null(ll_IdUsuario, 0) > 0 Then
		This.SetItem(row, 'email', '')
		Msg('Email j$$HEX2$$e1002000$$ENDHEX$$utilizado.')
	End If
End If
end event

type cb_voltar from w_ancestor_cadastro`cb_voltar within w_cadusuario
end type

type cb_gravar from w_ancestor_cadastro`cb_gravar within w_cadusuario
end type

type gb_1 from w_ancestor_cadastro`gb_1 within w_cadusuario
end type

type gb_2 from w_ancestor_cadastro`gb_2 within w_cadusuario
end type

