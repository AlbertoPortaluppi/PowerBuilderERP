HA$PBExportHeader$w_cadclifor.srw
forward
global type w_cadclifor from w_ancestor_cadastro
end type
end forward

global type w_cadclifor from w_ancestor_cadastro
end type
global w_cadclifor w_cadclifor

forward prototypes
public function integer of_pesquisar ()
public function integer of_validar_inclusao ()
public subroutine of_gravar ()
end prototypes

public function integer of_pesquisar ();String ls_Filter

dw_Filtros.AcceptText()

If dw_Corrente.RowCount() <= 0 Then dw_Corrente.retrieve()

If Uf_Null(dw_Filtros.GetItemNumber(1, 'IDCLIFOR'), 0) <> 0 Then
	ls_Filter = 'IDCLIFOR = ' + String(dw_Filtros.GetItemNumber(1, 'IDCLIFOR'))
End If

If Uf_Null(dw_Filtros.GetItemString(1, "TIPOCLIFOR"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "TIPOCLIFOR = '" + String(dw_Filtros.GetItemString(1, "TIPOCLIFOR")) + "'" 
	Else
		ls_Filter = ls_Filter + " and TIPOCLIFOR = '" + String(dw_Filtros.GetItemString(1, "TIPOCLIFOR")) + "'" 
	End If
End If

If Uf_Null(dw_Filtros.GetItemString(1, "NOME"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(upper(NOME) LIKE '%" + String(dw_Filtros.GetItemString(1, "NOME")) + "%')"
	Else
		ls_Filter = ls_Filter + " and (upper(NOME) LIKE '%" + String(dw_Filtros.GetItemString(1, "NOME")) + "%')"
	End If
End If

If Uf_Null(dw_Filtros.GetItemString(1, "CNPJCPF"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(upper(CNPJCPF) LIKE '%" + String(dw_Filtros.GetItemString(1, "CNPJCPF")) + "%')"
	Else
		ls_Filter = ls_Filter + " and (upper(CNPJCPF) LIKE '%" + String(dw_Filtros.GetItemString(1, "CNPJCPF")) + "%')"
	End If
End If

If Uf_Null(dw_Filtros.GetItemString(1, "TELEFONE"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(upper(TELEFONE) LIKE '%" + String(dw_Filtros.GetItemString(1, "TELEFONE")) + "%')"
	Else
		ls_Filter = ls_Filter + " and (upper(TELEFONE) LIKE '%" + String(dw_Filtros.GetItemString(1, "TELEFONE")) + "%')"
	End If
End If

If Uf_Null(dw_Filtros.GetItemString(1, "ENDERECO"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(upper(ENDERECO) LIKE '%" + String(dw_Filtros.GetItemString(1, "ENDERECO")) + "%')"
	Else
		ls_Filter = ls_Filter + " and (upper(ENDERECO) LIKE '%" + String(dw_Filtros.GetItemString(1, "ENDERECO")) + "%')"
	End If
End If

dw_Corrente.SetFilter(ls_Filter)
dw_Corrente.Filter()

dw_Corrente.SetSort('IDEMPRESA asc')
dw_Corrente.Sort()

Return 1
end function

public function integer of_validar_inclusao ();Long ll_For	

dw_Corrente.AcceptText()

For ll_For = 1 To dw_Corrente.RowCount()
	If Uf_Null(Trim(dw_Corrente.GetItemString(ll_For, "nome")), "") = "" Then
		Msg('Informe um nome para o cliente/fornecedor.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	End If
	
	If Uf_Null(dw_Corrente.GetItemString(ll_For, "TIPOCLIFOR"), "") = "" Then
		Msg('Informe se o registro $$HEX2$$e9002000$$ENDHEX$$um cliente/fornecedor.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	End If
	
	If Uf_Null(dw_Corrente.GetItemString(ll_For, "ENDERECO"), "") = "" Then
		Msg('Informe um endere$$HEX1$$e700$$ENDHEX$$o para o cliente/fornecedor.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	End If
	
	If Uf_Null(dw_Corrente.GetItemString(ll_For, "CNPJCPF"), "") = "" Then
		Msg('Informe um CNPJ / CPF para o cliente/fornecedor.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	End If
	
	If Uf_Null(dw_Corrente.GetItemString(ll_For, "TELEFONE"), "") = "" Then
		Msg('Informe um n$$HEX1$$fa00$$ENDHEX$$mero de telefone para o cliente/fornecedor.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	End If
Next

Return 1
end function

public subroutine of_gravar ();Long ll_For, ll_MaxId
String ls_Teste
Integer li_Ret

dw_Corrente.SetFilter("IsNull(IDCLIFOR)")
dw_Corrente.Filter()

SELECT
	MAX(IDCLIFOR)
INTO :ll_MaxId
	FROM CLIENTE_FORNECEDOR
USING SQLCA;

For ll_For = 1 To dw_Corrente.RowCount()
	ll_MaxId++
	
	dw_Corrente.SetItem(ll_For, 'IDCLIFOR', ll_MaxId)
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

on w_cadclifor.create
call super::create
end on

on w_cadclifor.destroy
call super::destroy
end on

type cb_incluir from w_ancestor_cadastro`cb_incluir within w_cadclifor
end type

type dw_filtros from w_ancestor_cadastro`dw_filtros within w_cadclifor
string dataobject = "d_filtros_clifor"
end type

type cb_limparfiltros from w_ancestor_cadastro`cb_limparfiltros within w_cadclifor
end type

type cb_pesquisar from w_ancestor_cadastro`cb_pesquisar within w_cadclifor
end type

type dw_corrente from w_ancestor_cadastro`dw_corrente within w_cadclifor
string dataobject = "d_cadclifor"
end type

type cb_voltar from w_ancestor_cadastro`cb_voltar within w_cadclifor
end type

type cb_gravar from w_ancestor_cadastro`cb_gravar within w_cadclifor
end type

type gb_1 from w_ancestor_cadastro`gb_1 within w_cadclifor
end type

type gb_2 from w_ancestor_cadastro`gb_2 within w_cadclifor
end type

