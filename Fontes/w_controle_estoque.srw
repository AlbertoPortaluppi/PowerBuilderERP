HA$PBExportHeader$w_controle_estoque.srw
forward
global type w_controle_estoque from w_ancestor_cadastro
end type
end forward

global type w_controle_estoque from w_ancestor_cadastro
string title = "ERP - Controle de Estoque"
end type
global w_controle_estoque w_controle_estoque

forward prototypes
public function integer of_pesquisar ()
end prototypes

public function integer of_pesquisar ();String ls_Filter

dw_Filtros.AcceptText()

If dw_Corrente.RowCount() <= 0 Then dw_Corrente.retrieve()

ls_Filter = "(quantidade BETWEEN " + String(dw_Filtros.GetItemDecimal(1, "QUANTIDADEMENOR")) + " AND " + String(dw_Filtros.GetItemDecimal(1, "QUANTIDADEMAIOR")) + ")"

If Uf_Null(dw_Filtros.GetItemNumber(1, 'idproduto'), 0) <> 0 Then
	ls_Filter = ls_Filter + ' and (idproduto = ' + String(dw_Filtros.GetItemNumber(1, 'idproduto')) + ')'
End If

If Uf_Null(dw_Filtros.GetItemNumber(1, "IDEMPRESA"), 0) <> 0 Then
	ls_Filter = ls_Filter + " and (IDEMPRESA = " + String(dw_Filtros.GetItemNumber(1, "IDEMPRESA")) + ")"
End If

If Uf_Null(dw_Filtros.GetItemString(1, "nome"), "") <> "" Then
	ls_Filter = ls_Filter + " and (lower(nome) LIKE '%" + String(dw_Filtros.GetItemString(1, "nome")) + "%')"
End If

If Uf_Null(dw_Filtros.GetItemString(1, "descricao"), "") <> "" Then
	ls_Filter = ls_Filter + " and (lower(descricao) LIKE '%" + String(dw_Filtros.GetItemString(1, "descricao")) + "%')"
End If

dw_Corrente.SetFilter(ls_Filter)
dw_Corrente.Filter()

dw_Corrente.SetSort('idproduto asc, idempresa asc')
dw_Corrente.Sort()

Return 1
end function

on w_controle_estoque.create
call super::create
end on

on w_controle_estoque.destroy
call super::destroy
end on

type cb_incluir from w_ancestor_cadastro`cb_incluir within w_controle_estoque
boolean visible = false
end type

type dw_filtros from w_ancestor_cadastro`dw_filtros within w_controle_estoque
event ue_postitemchanged ( long row,  dwobject dwo,  string data )
string dataobject = "d_filtros_estoque"
end type

event dw_filtros::ue_postitemchanged(long row, dwobject dwo, string data);If dwo.Name = 'quantidademenor' Then
	If This.GetItemDecimal(row, 'QUANTIDADEMENOR') > This.GetItemDecimal(row, 'QUANTIDADEMAIOR') Then
		This.SetItem(row, 'QUANTIDADEMENOR', This.GetItemDecimal(row, 'QUANTIDADEMAIOR'))
	End If
	
	If This.GetItemDecimal(row, 'QUANTIDADEMENOR') < 0 Then This.SetItem(row, 'QUANTIDADEMENOR', 0)
End If

If dwo.Name = 'quantidademaior' Then
	If This.GetItemDecimal(row, 'QUANTIDADEMAIOR') < This.GetItemDecimal(row, 'QUANTIDADEMENOR') Then
		This.SetItem(row, 'QUANTIDADEMAIOR', This.GetItemDecimal(row, 'QUANTIDADEMENOR'))
	End If
End If
end event

event dw_filtros::itemchanged;call super::itemchanged;Post Event ue_postitemchanged(row, dwo, data)
end event

type cb_limparfiltros from w_ancestor_cadastro`cb_limparfiltros within w_controle_estoque
end type

type cb_pesquisar from w_ancestor_cadastro`cb_pesquisar within w_controle_estoque
end type

type dw_corrente from w_ancestor_cadastro`dw_corrente within w_controle_estoque
string dataobject = "d_controle_estoque"
end type

type cb_voltar from w_ancestor_cadastro`cb_voltar within w_controle_estoque
end type

type cb_gravar from w_ancestor_cadastro`cb_gravar within w_controle_estoque
boolean visible = false
end type

type gb_1 from w_ancestor_cadastro`gb_1 within w_controle_estoque
end type

type gb_2 from w_ancestor_cadastro`gb_2 within w_controle_estoque
end type

