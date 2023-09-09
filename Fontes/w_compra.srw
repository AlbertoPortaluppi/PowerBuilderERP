HA$PBExportHeader$w_compra.srw
forward
global type w_compra from w_ancestor_compravenda
end type
end forward

global type w_compra from w_ancestor_compravenda
end type
global w_compra w_compra

on w_compra.create
call super::create
end on

on w_compra.destroy
call super::destroy
end on

event open;call super::open;//
end event

type tab_geral from w_ancestor_compravenda`tab_geral within w_compra
end type

on tab_geral.create
call super::create
this.Control[]={this.tabpage_pesquisa,&
this.tabpage_operacao}
end on

on tab_geral.destroy
call super::destroy
end on

type tabpage_pesquisa from w_ancestor_compravenda`tabpage_pesquisa within tab_geral
end type

type cb_pesquisapesquisa from w_ancestor_compravenda`cb_pesquisapesquisa within tabpage_pesquisa
end type

type cb_limpafiltrospesquisa from w_ancestor_compravenda`cb_limpafiltrospesquisa within tabpage_pesquisa
end type

type dw_filtros_pesquisa from w_ancestor_compravenda`dw_filtros_pesquisa within tabpage_pesquisa
end type

type dw_pesquisa from w_ancestor_compravenda`dw_pesquisa within tabpage_pesquisa
end type

type gb_filtro from w_ancestor_compravenda`gb_filtro within tabpage_pesquisa
end type

type gb_pesquisa from w_ancestor_compravenda`gb_pesquisa within tabpage_pesquisa
end type

type tabpage_operacao from w_ancestor_compravenda`tabpage_operacao within tab_geral
string text = "Compra"
end type

type cb_limpartela from w_ancestor_compravenda`cb_limpartela within tabpage_operacao
end type

type st_data from w_ancestor_compravenda`st_data within tabpage_operacao
end type

type st_datatexto from w_ancestor_compravenda`st_datatexto within tabpage_operacao
end type

type st_empresa from w_ancestor_compravenda`st_empresa within tabpage_operacao
end type

type st_empresatexto from w_ancestor_compravenda`st_empresatexto within tabpage_operacao
end type

type st_clifor from w_ancestor_compravenda`st_clifor within tabpage_operacao
end type

type st_1 from w_ancestor_compravenda`st_1 within tabpage_operacao
end type

type sle_clifor from w_ancestor_compravenda`sle_clifor within tabpage_operacao
end type

type cb_gravar from w_ancestor_compravenda`cb_gravar within tabpage_operacao
end type

type st_usuario from w_ancestor_compravenda`st_usuario within tabpage_operacao
end type

type st_usuariotext from w_ancestor_compravenda`st_usuariotext within tabpage_operacao
end type

type cb_excluir from w_ancestor_compravenda`cb_excluir within tabpage_operacao
end type

type cb_incluir from w_ancestor_compravenda`cb_incluir within tabpage_operacao
end type

type dw_corrente from w_ancestor_compravenda`dw_corrente within tabpage_operacao
end type

type gb_corrente from w_ancestor_compravenda`gb_corrente within tabpage_operacao
string text = "Compra"
end type

type gb_informacoes from w_ancestor_compravenda`gb_informacoes within tabpage_operacao
end type

