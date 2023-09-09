HA$PBExportHeader$w_ancestor_compravenda.srw
forward
global type w_ancestor_compravenda from w_ancestor
end type
type tab_geral from tab within w_ancestor_compravenda
end type
type tabpage_pesquisa from userobject within tab_geral
end type
type cb_pesquisapesquisa from u_commandbutton within tabpage_pesquisa
end type
type cb_limpafiltrospesquisa from u_commandbutton within tabpage_pesquisa
end type
type dw_filtros_pesquisa from datawindow within tabpage_pesquisa
end type
type dw_pesquisa from datawindow within tabpage_pesquisa
end type
type gb_filtro from groupbox within tabpage_pesquisa
end type
type gb_pesquisa from groupbox within tabpage_pesquisa
end type
type tabpage_pesquisa from userobject within tab_geral
cb_pesquisapesquisa cb_pesquisapesquisa
cb_limpafiltrospesquisa cb_limpafiltrospesquisa
dw_filtros_pesquisa dw_filtros_pesquisa
dw_pesquisa dw_pesquisa
gb_filtro gb_filtro
gb_pesquisa gb_pesquisa
end type
type tabpage_operacao from userobject within tab_geral
end type
type cb_1 from u_commandbutton within tabpage_operacao
end type
type st_usuario from u_statictext within tabpage_operacao
end type
type st_usuariotext from u_statictext within tabpage_operacao
end type
type cb_excluir from u_commandbutton within tabpage_operacao
end type
type cb_incluir from u_commandbutton within tabpage_operacao
end type
type dw_corrente from datawindow within tabpage_operacao
end type
type gb_corrente from groupbox within tabpage_operacao
end type
type tabpage_operacao from userobject within tab_geral
cb_1 cb_1
st_usuario st_usuario
st_usuariotext st_usuariotext
cb_excluir cb_excluir
cb_incluir cb_incluir
dw_corrente dw_corrente
gb_corrente gb_corrente
end type
type tab_geral from tab within w_ancestor_compravenda
tabpage_pesquisa tabpage_pesquisa
tabpage_operacao tabpage_operacao
end type
end forward

global type w_ancestor_compravenda from w_ancestor
integer width = 6112
integer height = 3024
string icon = "Window!"
tab_geral tab_geral
end type
global w_ancestor_compravenda w_ancestor_compravenda

type variables
DataWindow idw_Filtros_Pesquisa, idw_Pesquisa, idw_Corrente
end variables

on w_ancestor_compravenda.create
int iCurrent
call super::create
this.tab_geral=create tab_geral
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_geral
end on

on w_ancestor_compravenda.destroy
call super::destroy
destroy(this.tab_geral)
end on

event open;call super::open;idw_Filtros_Pesquisa = tab_geral.tabpage_pesquisa.dw_Filtros_Pesquisa
idw_Pesquisa = tab_geral.tabpage_pesquisa.dw_Pesquisa

idw_Corrente = tab_geral.tabpage_operacao.dw_Corrente

idw_Filtros_Pesquisa.SetTransObject(SQLCA)
idw_Pesquisa.SetTransObject(SQLCA)
idw_Corrente.SetTransObject(SQLCA)

idw_Filtros_Pesquisa.InsertRow(0)

 tab_geral.tabpage_operacao.st_usuario.Text = String(gl_IdUsuario) + ' - ' + gs_NomeUsuario
end event

type tab_geral from tab within w_ancestor_compravenda
integer width = 6103
integer height = 2920
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_pesquisa tabpage_pesquisa
tabpage_operacao tabpage_operacao
end type

on tab_geral.create
this.tabpage_pesquisa=create tabpage_pesquisa
this.tabpage_operacao=create tabpage_operacao
this.Control[]={this.tabpage_pesquisa,&
this.tabpage_operacao}
end on

on tab_geral.destroy
destroy(this.tabpage_pesquisa)
destroy(this.tabpage_operacao)
end on

type tabpage_pesquisa from userobject within tab_geral
integer x = 18
integer y = 112
integer width = 6066
integer height = 2792
long backcolor = 67108864
string text = "Pesquisa"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_pesquisapesquisa cb_pesquisapesquisa
cb_limpafiltrospesquisa cb_limpafiltrospesquisa
dw_filtros_pesquisa dw_filtros_pesquisa
dw_pesquisa dw_pesquisa
gb_filtro gb_filtro
gb_pesquisa gb_pesquisa
end type

on tabpage_pesquisa.create
this.cb_pesquisapesquisa=create cb_pesquisapesquisa
this.cb_limpafiltrospesquisa=create cb_limpafiltrospesquisa
this.dw_filtros_pesquisa=create dw_filtros_pesquisa
this.dw_pesquisa=create dw_pesquisa
this.gb_filtro=create gb_filtro
this.gb_pesquisa=create gb_pesquisa
this.Control[]={this.cb_pesquisapesquisa,&
this.cb_limpafiltrospesquisa,&
this.dw_filtros_pesquisa,&
this.dw_pesquisa,&
this.gb_filtro,&
this.gb_pesquisa}
end on

on tabpage_pesquisa.destroy
destroy(this.cb_pesquisapesquisa)
destroy(this.cb_limpafiltrospesquisa)
destroy(this.dw_filtros_pesquisa)
destroy(this.dw_pesquisa)
destroy(this.gb_filtro)
destroy(this.gb_pesquisa)
end on

type cb_pesquisapesquisa from u_commandbutton within tabpage_pesquisa
integer x = 5641
integer y = 468
integer taborder = 50
string text = "Pesquisar"
end type

type cb_limpafiltrospesquisa from u_commandbutton within tabpage_pesquisa
integer x = 5641
integer y = 104
integer taborder = 40
string text = "Limpar Filtros"
end type

event clicked;call super::clicked;idw_Filtros_Pesquisa.Reset()
end event

type dw_filtros_pesquisa from datawindow within tabpage_pesquisa
integer x = 37
integer y = 68
integer width = 5586
integer height = 548
integer taborder = 30
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pesquisa from datawindow within tabpage_pesquisa
integer x = 37
integer y = 708
integer width = 5586
integer height = 2064
integer taborder = 40
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_filtro from groupbox within tabpage_pesquisa
integer width = 6062
integer height = 640
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Filtros"
end type

type gb_pesquisa from groupbox within tabpage_pesquisa
integer y = 632
integer width = 6066
integer height = 2156
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Pesquisa"
end type

type tabpage_operacao from userobject within tab_geral
integer x = 18
integer y = 112
integer width = 6066
integer height = 2792
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_1 cb_1
st_usuario st_usuario
st_usuariotext st_usuariotext
cb_excluir cb_excluir
cb_incluir cb_incluir
dw_corrente dw_corrente
gb_corrente gb_corrente
end type

on tabpage_operacao.create
this.cb_1=create cb_1
this.st_usuario=create st_usuario
this.st_usuariotext=create st_usuariotext
this.cb_excluir=create cb_excluir
this.cb_incluir=create cb_incluir
this.dw_corrente=create dw_corrente
this.gb_corrente=create gb_corrente
this.Control[]={this.cb_1,&
this.st_usuario,&
this.st_usuariotext,&
this.cb_excluir,&
this.cb_incluir,&
this.dw_corrente,&
this.gb_corrente}
end on

on tabpage_operacao.destroy
destroy(this.cb_1)
destroy(this.st_usuario)
destroy(this.st_usuariotext)
destroy(this.cb_excluir)
destroy(this.cb_incluir)
destroy(this.dw_corrente)
destroy(this.gb_corrente)
end on

type cb_1 from u_commandbutton within tabpage_operacao
integer x = 23
integer y = 2676
integer taborder = 50
string text = "Gravar"
end type

type st_usuario from u_statictext within tabpage_operacao
integer x = 5157
integer y = 120
integer width = 837
integer weight = 700
fontcharset fontcharset = ansi!
alignment alignment = left!
end type

type st_usuariotext from u_statictext within tabpage_operacao
integer x = 4869
integer y = 120
integer width = 274
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Usu$$HEX1$$e100$$ENDHEX$$rio: "
end type

type cb_excluir from u_commandbutton within tabpage_operacao
integer x = 475
integer y = 76
integer taborder = 60
string text = "Excluir"
end type

event clicked;call super::clicked;Long ll_For

If idw_Corrente.RowCount() <= 0 Then Return

If idw_Corrente.Find("flag = 'T'", 1, idw_Corrente.RowCount()) <= 0 Then Return

If MessageBox('ERP', 'Deseja eliminar os registros selecionados?', Question!, YesNo!) = 2 Then Return

idw_Corrente.SetRedraw(False)

idw_Corrente.SetFilter("flag = 'T'")
idw_Corrente.Filter()

idw_Corrente.RowsMove(1, idw_Corrente.RowCount(), Primary!, idw_Corrente, idw_Corrente.DeletedCount() + 1, Delete!)

idw_Corrente.SetFilter('')
idw_Corrente.Filter()

idw_Corrente.SetRedraw(True)
end event

type cb_incluir from u_commandbutton within tabpage_operacao
integer x = 27
integer y = 76
integer taborder = 50
string text = "Incluir"
end type

event clicked;call super::clicked;idw_Corrente.InsertRow(0)
end event

type dw_corrente from datawindow within tabpage_operacao
integer x = 27
integer y = 196
integer width = 5979
integer height = 2480
integer taborder = 50
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_corrente from groupbox within tabpage_operacao
integer width = 6043
integer height = 2820
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "none"
end type

