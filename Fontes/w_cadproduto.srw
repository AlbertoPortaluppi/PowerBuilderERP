HA$PBExportHeader$w_cadproduto.srw
forward
global type w_cadproduto from w_ancestor_cadastro
end type
end forward

global type w_cadproduto from w_ancestor_cadastro
string title = "ERP - Cadastro de Produto"
end type
global w_cadproduto w_cadproduto

forward prototypes
public function integer of_pesquisar ()
public subroutine of_gravar ()
public function integer of_validar_inclusao ()
end prototypes

public function integer of_pesquisar ();String ls_Filter

dw_Filtros.AcceptText()

If dw_Corrente.RowCount() <= 0 Then dw_Corrente.retrieve()

If Uf_Null(dw_Filtros.GetItemNumber(1, 'idproduto'), 0) <> 0 Then
	ls_Filter = 'idproduto = ' + String(dw_Filtros.GetItemNumber(1, 'idproduto'))
End If

If Uf_Null(dw_Filtros.GetItemString(1, "nome"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(lower(nome) LIKE '%" + String(dw_Filtros.GetItemString(1, "nome")) + "%')"
	Else
		ls_Filter = ls_Filter + " and (lower(nome) LIKE '%" + String(dw_Filtros.GetItemString(1, "nome")) + "%')"
	End If
End If

If Uf_Null(dw_Filtros.GetItemString(1, "descricao"), "") <> "" Then
	If Len(ls_Filter) <= 0 Then
		ls_Filter = "(lower(descricao) LIKE '%" + String(dw_Filtros.GetItemString(1, "descricao")) + "%')"
	Else
		ls_Filter = ls_Filter + " and (lower(descricao) LIKE '%" + String(dw_Filtros.GetItemString(1, "descricao")) + "%')"
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

dw_Corrente.SetSort('idproduto asc')
dw_Corrente.Sort()

Return 1
end function

public subroutine of_gravar ();Long ll_For, ll_MaxId
String ls_Teste
Integer li_Ret

dw_Corrente.SetFilter("IsNull(idproduto)")
dw_Corrente.Filter()

SELECT
	MAX(IDPRODUTO)
INTO :ll_MaxId
	FROM PRODUTO
USING SQLCA;

For ll_For = 1 To dw_Corrente.RowCount()
	ll_MaxId++
	
	dw_Corrente.SetItem(ll_For, 'idproduto', ll_MaxId)
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

public function integer of_validar_inclusao ();Long ll_For	

dw_Corrente.AcceptText()

For ll_For = 1 To dw_Corrente.RowCount()
	If Uf_Null(Trim(dw_Corrente.GetItemString(ll_For, "nome")), "") = "" Then
		Msg('Informe um nome para o produto.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	End If
	
	If Uf_Null(dw_Corrente.GetItemString(ll_For, "descricao"), "") = "" Then
		Msg('Informe uma descri$$HEX2$$e700e300$$ENDHEX$$o para o produto.')
		dw_Corrente.SetRow(ll_For)
		dw_Corrente.SelectRow(ll_For, true)
		dw_Corrente.SetFocus()
		Return -1
	End If
Next

Return 1
end function

on w_cadproduto.create
call super::create
end on

on w_cadproduto.destroy
call super::destroy
end on

type cb_incluir from w_ancestor_cadastro`cb_incluir within w_cadproduto
end type

type dw_filtros from w_ancestor_cadastro`dw_filtros within w_cadproduto
string dataobject = "d_filtros_produto"
end type

type cb_limparfiltros from w_ancestor_cadastro`cb_limparfiltros within w_cadproduto
end type

type cb_pesquisar from w_ancestor_cadastro`cb_pesquisar within w_cadproduto
end type

type dw_corrente from w_ancestor_cadastro`dw_corrente within w_cadproduto
string dataobject = "d_cadproduto"
boolean hsplitscroll = true
end type

type cb_voltar from w_ancestor_cadastro`cb_voltar within w_cadproduto
end type

type cb_gravar from w_ancestor_cadastro`cb_gravar within w_cadproduto
end type

type gb_1 from w_ancestor_cadastro`gb_1 within w_cadproduto
end type

type gb_2 from w_ancestor_cadastro`gb_2 within w_cadproduto
end type

