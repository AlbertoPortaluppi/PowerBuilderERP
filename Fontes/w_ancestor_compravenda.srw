HA$PBExportHeader$w_ancestor_compravenda.srw
forward
global type w_ancestor_compravenda from w_ancestor
end type
type tab_geral from tab within w_ancestor_compravenda
end type
type tabpage_pesquisa from userobject within tab_geral
end type
type cb_excluirpesquisa from u_commandbutton within tabpage_pesquisa
end type
type cb_alterar from u_commandbutton within tabpage_pesquisa
end type
type dw_produtos from datawindow within tabpage_pesquisa
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
type gb_produtos from groupbox within tabpage_pesquisa
end type
type tabpage_pesquisa from userobject within tab_geral
cb_excluirpesquisa cb_excluirpesquisa
cb_alterar cb_alterar
dw_produtos dw_produtos
cb_pesquisapesquisa cb_pesquisapesquisa
cb_limpafiltrospesquisa cb_limpafiltrospesquisa
dw_filtros_pesquisa dw_filtros_pesquisa
dw_pesquisa dw_pesquisa
gb_filtro gb_filtro
gb_pesquisa gb_pesquisa
gb_produtos gb_produtos
end type
type tabpage_operacao from userobject within tab_geral
end type
type cb_limpartela from u_commandbutton within tabpage_operacao
end type
type st_data from u_statictext within tabpage_operacao
end type
type st_datatexto from u_statictext within tabpage_operacao
end type
type st_empresa from u_statictext within tabpage_operacao
end type
type st_empresatexto from u_statictext within tabpage_operacao
end type
type st_clifor from u_statictext within tabpage_operacao
end type
type st_1 from u_statictext within tabpage_operacao
end type
type sle_clifor from u_singlelineedit within tabpage_operacao
end type
type cb_gravar from u_commandbutton within tabpage_operacao
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
type gb_informacoes from groupbox within tabpage_operacao
end type
type tabpage_operacao from userobject within tab_geral
cb_limpartela cb_limpartela
st_data st_data
st_datatexto st_datatexto
st_empresa st_empresa
st_empresatexto st_empresatexto
st_clifor st_clifor
st_1 st_1
sle_clifor sle_clifor
cb_gravar cb_gravar
st_usuario st_usuario
st_usuariotext st_usuariotext
cb_excluir cb_excluir
cb_incluir cb_incluir
dw_corrente dw_corrente
gb_corrente gb_corrente
gb_informacoes gb_informacoes
end type
type tab_geral from tab within w_ancestor_compravenda
tabpage_pesquisa tabpage_pesquisa
tabpage_operacao tabpage_operacao
end type
end forward

global type w_ancestor_compravenda from w_ancestor
integer width = 5271
integer height = 3024
string icon = "Window!"
tab_geral tab_geral
end type
global w_ancestor_compravenda w_ancestor_compravenda

type variables
DataWindow idw_Filtros_Pesquisa, idw_Pesquisa, idw_Produtos, idw_Corrente
Date idt_Data
Long il_IdCliFor
String is_SqlOriginal
end variables

forward prototypes
public subroutine of_limpar ()
public subroutine of_gravar ()
public function integer of_valida_gravacao ()
public function integer of_valida_insercao_produto (long al_idproduto)
public subroutine of_pesquisar ()
end prototypes

public subroutine of_limpar ();idw_Corrente.Reset()

tab_geral.tabpage_operacao.sle_CliFor.Enabled = True
tab_geral.tabpage_operacao.st_clifor.Text = ''

tab_geral.tabpage_operacao.sle_CliFor.Text = ''
tab_geral.tabpage_operacao.st_CliFor.Visible = False
tab_geral.tabpage_operacao.cb_incluir.Enabled = False
tab_geral.tabpage_operacao.cb_excluir.Enabled = False
tab_geral.tabpage_operacao.cb_gravar.Enabled = False

il_IdCliFor = 0
end subroutine

public subroutine of_gravar ();//
end subroutine

public function integer of_valida_gravacao ();Long ll_For

idw_Corrente.AcceptText()

For ll_For = 1 To idw_Corrente.RowCount()
	If Uf_Null(idw_Corrente.GetItemDecimal(ll_For, "quantidade"), 0) = 0 Then
		Msg('Informe uma quantidade para o produto.')
		idw_Corrente.SetRow(ll_For)
		idw_Corrente.SelectRow(ll_For, true)
		idw_Corrente.SetFocus()
		Return -1
	End If
	
	If Uf_Null(idw_Corrente.GetItemDecimal(ll_For, "preco"), 0) = 0 Then
		Msg('Informe um pre$$HEX1$$e700$$ENDHEX$$o para o produto.')
		idw_Corrente.SetRow(ll_For)
		idw_Corrente.SelectRow(ll_For, true)
		idw_Corrente.SetFocus()
		Return -1
	End If
	
Next

Return 1
end function

public function integer of_valida_insercao_produto (long al_idproduto);Long ll_Find

ll_Find = idw_Corrente.Find('idproduto = ' + String(al_IdProduto), 1, idw_Corrente.RowCount())

If ll_Find > 0 Then
	Return -1
Else
	Return 1
End If


end function

public subroutine of_pesquisar ();String ls_Where, ls_SqlNew

If is_SqlOriginal = '' Then
	is_SqlOriginal = idw_Pesquisa.GetSqlSelect()
Else
	idw_Pesquisa.SetSqlSelect(is_SqlOriginal)
End If

idw_Filtros_Pesquisa.AcceptText()
idw_Produtos.Reset()

If Uf_Null(idw_Filtros_Pesquisa.GetItemNumber(1, 'IDMOVIMENTO'), 0) <> 0 Then
	ls_Where = 'CV.IDMOVIMENTO = ' + String(idw_Filtros_Pesquisa.GetItemNumber(1, 'IDMOVIMENTO'))
End If

If Uf_Null(idw_Filtros_Pesquisa.GetItemNumber(1, "IDUSUARIO"), 0) <> 0 Then
	If Len(ls_Where) <= 0 Then
		ls_Where = "CV.IDUSUARIO = " + String(idw_Filtros_Pesquisa.GetItemNumber(1, "IDUSUARIO"))
	Else
		ls_Where = ls_Where + " and CV.IDUSUARIO = " + String(idw_Filtros_Pesquisa.GetItemNumber(1, "IDUSUARIO"))
	End If
End If

If Uf_Null(idw_Filtros_Pesquisa.GetItemNumber(1, "IDCLIFOR"), 0) <> 0 Then
	If Len(ls_Where) <= 0 Then
		ls_Where = "CV.IDCLIFOR = " + String(idw_Filtros_Pesquisa.GetItemNumber(1, "IDCLIFOR"))
	Else
		ls_Where = ls_Where + " and CV.IDCLIFOR = " + String(idw_Filtros_Pesquisa.GetItemNumber(1, "IDCLIFOR"))
	End If
End If

If Uf_Null(idw_Filtros_Pesquisa.GetItemNumber(1, "IDEMPRESA"), 0) <> 0 Then
	If Len(ls_Where) <= 0 Then
		ls_Where = "CV.IDEMPRESA = " + String(idw_Filtros_Pesquisa.GetItemNumber(1, "IDEMPRESA"))
	Else
		ls_Where = ls_Where + " and CV.IDEMPRESA = " + String(idw_Filtros_Pesquisa.GetItemNumber(1, "IDEMPRESA"))
	End If
End If

If Uf_Null(idw_Filtros_Pesquisa.GetItemString(1, "TIPOMOVIMENTO"), "") <> "" Then
	If Len(ls_Where) <= 0 Then
		ls_Where = "((CV.TIPOMOVIMENTO) = '" + String(idw_Filtros_Pesquisa.GetItemString(1, "CNPJ")) + "')"
	Else
		ls_Where = ls_Where + " and ((CV.TIPOMOVIMENTO) = '" + String(idw_Filtros_Pesquisa.GetItemString(1, "CNPJ")) + "')"
	End If
End If

If Len(ls_Where) > 0 Then
	ls_SqlNew = uf_StrTran(is_SqlOriginal, '1 = 1', ls_Where)
	
	idw_Pesquisa.SetSqlSelect(ls_SqlNew)
End If
idw_Pesquisa.Retrieve()

If idw_Pesquisa.RowCount() <= 0 Then
	Msg('Nenhum registro encontrado.')
	idw_Pesquisa.SetSqlSelect(is_SqlOriginal)
Else
	tab_geral.tabpage_pesquisa.cb_excluirpesquisa.Enabled = True
	tab_geral.tabpage_pesquisa.cb_alterar.Enabled = True
	idw_Pesquisa.SetItem(1, 'FLAG', 'T')
	
	idw_Produtos.Retrieve(idw_Pesquisa.GetItemNumber(1, 'IDMOVIMENTO'))
End If
end subroutine

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

event open;call super::open;String ls_Empresa

idw_Filtros_Pesquisa = tab_geral.tabpage_pesquisa.dw_Filtros_Pesquisa
idw_Pesquisa = tab_geral.tabpage_pesquisa.dw_Pesquisa
idw_Produtos = tab_geral.tabpage_pesquisa.dw_Produtos

idw_Corrente = tab_geral.tabpage_operacao.dw_Corrente

idw_Filtros_Pesquisa.SetTransObject(SQLCA)
idw_Pesquisa.SetTransObject(SQLCA)
idw_Produtos.SetTransObject(SQLCA)

idw_Corrente.SetTransObject(SQLCA)

idw_Filtros_Pesquisa.InsertRow(0)

SELECT
	NOME,
	CURRENT_DATE
INTO
	:ls_Empresa,
	:idt_Data
FROM
	EMPRESA
WHERE
	IDEMPRESA = :gl_IdEmpresa
USING SQLCA;

tab_geral.tabpage_operacao.st_usuario.Text = String(gl_IdUsuario) + ' - ' + gs_NomeUsuario
tab_geral.tabpage_operacao.st_empresa.Text = String(gl_IdEmpresa) + ' - ' + ls_Empresa
tab_geral.tabpage_operacao.st_data.Text = String(idt_Data)

idw_Filtros_Pesquisa.SetItem(1, 'dtfim', DateTime(idt_Data, Time("23:59:59")))
end event

type tab_geral from tab within w_ancestor_compravenda
integer width = 5239
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
integer width = 5202
integer height = 2792
long backcolor = 67108864
string text = "Pesquisa"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_excluirpesquisa cb_excluirpesquisa
cb_alterar cb_alterar
dw_produtos dw_produtos
cb_pesquisapesquisa cb_pesquisapesquisa
cb_limpafiltrospesquisa cb_limpafiltrospesquisa
dw_filtros_pesquisa dw_filtros_pesquisa
dw_pesquisa dw_pesquisa
gb_filtro gb_filtro
gb_pesquisa gb_pesquisa
gb_produtos gb_produtos
end type

on tabpage_pesquisa.create
this.cb_excluirpesquisa=create cb_excluirpesquisa
this.cb_alterar=create cb_alterar
this.dw_produtos=create dw_produtos
this.cb_pesquisapesquisa=create cb_pesquisapesquisa
this.cb_limpafiltrospesquisa=create cb_limpafiltrospesquisa
this.dw_filtros_pesquisa=create dw_filtros_pesquisa
this.dw_pesquisa=create dw_pesquisa
this.gb_filtro=create gb_filtro
this.gb_pesquisa=create gb_pesquisa
this.gb_produtos=create gb_produtos
this.Control[]={this.cb_excluirpesquisa,&
this.cb_alterar,&
this.dw_produtos,&
this.cb_pesquisapesquisa,&
this.cb_limpafiltrospesquisa,&
this.dw_filtros_pesquisa,&
this.dw_pesquisa,&
this.gb_filtro,&
this.gb_pesquisa,&
this.gb_produtos}
end on

on tabpage_pesquisa.destroy
destroy(this.cb_excluirpesquisa)
destroy(this.cb_alterar)
destroy(this.dw_produtos)
destroy(this.cb_pesquisapesquisa)
destroy(this.cb_limpafiltrospesquisa)
destroy(this.dw_filtros_pesquisa)
destroy(this.dw_pesquisa)
destroy(this.gb_filtro)
destroy(this.gb_pesquisa)
destroy(this.gb_produtos)
end on

type cb_excluirpesquisa from u_commandbutton within tabpage_pesquisa
integer x = 4741
integer y = 1120
integer taborder = 50
integer weight = 700
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "Excluir"
end type

type cb_alterar from u_commandbutton within tabpage_pesquisa
integer x = 4741
integer y = 744
integer taborder = 50
boolean enabled = false
string text = "Alterar"
end type

type dw_produtos from datawindow within tabpage_pesquisa
integer x = 37
integer y = 1404
integer width = 5111
integer height = 1360
integer taborder = 60
string title = "none"
string dataobject = "d_produtos_compravenda"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_pesquisapesquisa from u_commandbutton within tabpage_pesquisa
integer x = 4741
integer y = 468
integer taborder = 50
string text = "Pesquisar"
end type

event clicked;call super::clicked;of_Pesquisar()
end event

type cb_limpafiltrospesquisa from u_commandbutton within tabpage_pesquisa
integer x = 4741
integer y = 104
integer taborder = 40
string text = "Limpar Filtros"
end type

event clicked;call super::clicked;idw_Filtros_Pesquisa.Reset()
idw_Filtros_Pesquisa.InsertRow(0)

tab_geral.tabpage_pesquisa.cb_excluirpesquisa.Enabled = False
tab_geral.tabpage_pesquisa.cb_alterar.Enabled = False

idw_Pesquisa.Reset()
idw_Produtos.Reset()
end event

type dw_filtros_pesquisa from datawindow within tabpage_pesquisa
integer x = 37
integer y = 68
integer width = 4658
integer height = 548
integer taborder = 30
string title = "none"
string dataobject = "d_filtros_compravenda"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_pesquisa from datawindow within tabpage_pesquisa
event ue_post_itemchanged ( long row,  dwobject dwo,  string data )
event ue_clicked ( integer xpos,  integer ypos,  long row,  dwobject dwo )
integer x = 37
integer y = 708
integer width = 4658
integer height = 584
integer taborder = 40
string title = "none"
string dataobject = "d_cabecalho_compras"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_post_itemchanged(long row, dwobject dwo, string data);This.SetItem(row, "FLAG", 'T')

idw_Pesquisa.Retrieve(This.GetItemNumber(row, 'IDMOVIMENTO'))
end event

event ue_clicked(integer xpos, integer ypos, long row, dwobject dwo);idw_Produtos.Retrieve(This.GetItemNumber(row, 'IDMOVIMENTO'))
end event

event itemchanged;Long ll_Find

If row > 0 Then
	ll_Find = This.Find("FLAG = 'T'", 1, This.RowCount())
	
	This.SetItem(ll_Find, "FLAG", 'F')
	
	//Post Event ue_Post_itemchanged(row, dwo, data)
End If
end event

event clicked;If dwo.Name = 'flag' then
	Post Event ue_Clicked(xpos, ypos, row, dwo)
End If
end event

type gb_filtro from groupbox within tabpage_pesquisa
integer width = 5184
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
integer width = 5184
integer height = 700
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

type gb_produtos from groupbox within tabpage_pesquisa
integer y = 1332
integer width = 5184
integer height = 1452
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Produtos"
end type

type tabpage_operacao from userobject within tab_geral
integer x = 18
integer y = 112
integer width = 5202
integer height = 2792
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_limpartela cb_limpartela
st_data st_data
st_datatexto st_datatexto
st_empresa st_empresa
st_empresatexto st_empresatexto
st_clifor st_clifor
st_1 st_1
sle_clifor sle_clifor
cb_gravar cb_gravar
st_usuario st_usuario
st_usuariotext st_usuariotext
cb_excluir cb_excluir
cb_incluir cb_incluir
dw_corrente dw_corrente
gb_corrente gb_corrente
gb_informacoes gb_informacoes
end type

on tabpage_operacao.create
this.cb_limpartela=create cb_limpartela
this.st_data=create st_data
this.st_datatexto=create st_datatexto
this.st_empresa=create st_empresa
this.st_empresatexto=create st_empresatexto
this.st_clifor=create st_clifor
this.st_1=create st_1
this.sle_clifor=create sle_clifor
this.cb_gravar=create cb_gravar
this.st_usuario=create st_usuario
this.st_usuariotext=create st_usuariotext
this.cb_excluir=create cb_excluir
this.cb_incluir=create cb_incluir
this.dw_corrente=create dw_corrente
this.gb_corrente=create gb_corrente
this.gb_informacoes=create gb_informacoes
this.Control[]={this.cb_limpartela,&
this.st_data,&
this.st_datatexto,&
this.st_empresa,&
this.st_empresatexto,&
this.st_clifor,&
this.st_1,&
this.sle_clifor,&
this.cb_gravar,&
this.st_usuario,&
this.st_usuariotext,&
this.cb_excluir,&
this.cb_incluir,&
this.dw_corrente,&
this.gb_corrente,&
this.gb_informacoes}
end on

on tabpage_operacao.destroy
destroy(this.cb_limpartela)
destroy(this.st_data)
destroy(this.st_datatexto)
destroy(this.st_empresa)
destroy(this.st_empresatexto)
destroy(this.st_clifor)
destroy(this.st_1)
destroy(this.sle_clifor)
destroy(this.cb_gravar)
destroy(this.st_usuario)
destroy(this.st_usuariotext)
destroy(this.cb_excluir)
destroy(this.cb_incluir)
destroy(this.dw_corrente)
destroy(this.gb_corrente)
destroy(this.gb_informacoes)
end on

type cb_limpartela from u_commandbutton within tabpage_operacao
integer x = 4722
integer y = 48
integer taborder = 40
string text = "Limpar"
end type

event clicked;call super::clicked;of_Limpar()
end event

type st_data from u_statictext within tabpage_operacao
integer x = 4183
integer y = 76
integer width = 311
integer weight = 700
fontcharset fontcharset = ansi!
string text = "27/12/2000"
end type

type st_datatexto from u_statictext within tabpage_operacao
integer x = 3977
integer y = 76
integer width = 192
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Data:"
alignment alignment = left!
end type

type st_empresa from u_statictext within tabpage_operacao
integer x = 3223
integer y = 76
integer width = 736
integer weight = 700
fontcharset fontcharset = ansi!
alignment alignment = left!
end type

type st_empresatexto from u_statictext within tabpage_operacao
integer x = 2921
integer y = 76
integer width = 288
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Empresa:"
end type

type st_clifor from u_statictext within tabpage_operacao
boolean visible = false
integer x = 983
integer y = 76
integer width = 617
integer weight = 700
fontcharset fontcharset = ansi!
alignment alignment = left!
end type

type st_1 from u_statictext within tabpage_operacao
integer y = 76
integer width = 398
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Fornecedor:"
end type

type sle_clifor from u_singlelineedit within tabpage_operacao
integer x = 416
integer y = 64
integer taborder = 40
end type

event modified;call super::modified;Long ll_IdCliFor
String ls_NomeCliFor

If Len(This.Text) > 0 Then
	If IsNumber(This.Text) Then
		
		ll_IdCliFor = Long(This.Text)
		
		SELECT
			IDCLIFOR,
			NOME
		INTO
			:il_IdCliFor,
			:ls_NomeCliFor
		FROM
			CLIENTE_FORNECEDOR
		WHERE
			IDCLIFOR = :ll_IdCliFor
		USING
			SQLCA;
			
		If il_IdCliFor > 0 Then
			tab_geral.tabpage_operacao.sle_CliFor.Enabled = False
			tab_geral.tabpage_operacao.st_clifor.Text = ls_NomeCliFor
			
			tab_geral.tabpage_operacao.sle_CliFor.Text = String(il_IdCliFor) + ' - '
			tab_geral.tabpage_operacao.st_CliFor.Visible = True
			tab_geral.tabpage_operacao.cb_incluir.Enabled = True
			tab_geral.tabpage_operacao.cb_excluir.Enabled = True
			tab_geral.tabpage_operacao.cb_gravar.Enabled = True
		Else
			Msg('Cliente / Fornecedor n$$HEX1$$e300$$ENDHEX$$o encontrado.')
		End If
	Else
		
	End If
End If
end event

type cb_gravar from u_commandbutton within tabpage_operacao
integer x = 23
integer y = 2676
integer taborder = 50
boolean enabled = false
string text = "Gravar"
end type

event clicked;call super::clicked;If Of_Valida_Gravacao() > 0 Then
	of_Gravar()
End If
end event

type st_usuario from u_statictext within tabpage_operacao
integer x = 2071
integer y = 76
integer width = 837
integer weight = 700
fontcharset fontcharset = ansi!
alignment alignment = left!
end type

type st_usuariotext from u_statictext within tabpage_operacao
integer x = 1783
integer y = 76
integer width = 274
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Usu$$HEX1$$e100$$ENDHEX$$rio: "
end type

type cb_excluir from u_commandbutton within tabpage_operacao
integer x = 475
integer y = 200
integer taborder = 60
boolean enabled = false
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
integer y = 200
integer taborder = 50
boolean enabled = false
string text = "Incluir"
end type

event clicked;call super::clicked;Long ll_Row

ll_Row = idw_Corrente.InsertRow(0)

idw_Corrente.SetItem(ll_Row, 'IDCLIFOR', il_IdCliFor)
idw_Corrente.SetItem(ll_Row, 'DATA_MOVIMENTO', idt_Data)
idw_Corrente.SetItem(ll_Row, 'IDEMPRESA', gl_IdEmpresa)
idw_Corrente.SetItem(ll_Row, 'IDUSUARIO', gl_IdUsuario)
end event

type dw_corrente from datawindow within tabpage_operacao
event ue_postitemchanged ( long row,  dwobject dwo,  string data )
integer x = 27
integer y = 332
integer width = 5088
integer height = 2320
integer taborder = 50
string title = "none"
string dataobject = "d_compravenda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_postitemchanged(long row, dwobject dwo, string data);Long ll_IdProduto, ll_IdProdutoData
String ls_NomeProduto, ls_NomeProdutoData
Boolean lb_Inseriu

If dwo.Name = 'idprodutoe' Then
	If IsNumber(data) Then
		
		ll_IdProdutoData = Long(data)
		SELECT
			IDPRODUTO,
			NOME
		INTO
			:ll_IdProduto,
			:ls_NomeProduto
		FROM
			PRODUTO
		WHERE
			IDPRODUTO = :ll_IdProdutoData
		USING SQLCA;
		
		If Uf_Null(ll_IdProduto, 0) > 0 Then
			If of_Valida_insercao_produto(ll_IdProduto) > 0 Then
				This.SetItem(Row, 'idproduto', ll_IdProduto)
				This.SetItem(Row, 'produto_nome', ls_NomeProduto)
			Else
				Msg('Produto j$$HEX2$$e1002000$$ENDHEX$$inserido.')
				This.SetItem(Row, 'idprodutoe', '')
			End If
		Else
			Msg('Produto n$$HEX1$$e300$$ENDHEX$$o encontrado.')
		End If
	Else
		ls_NomeProdutoData = '%' + Trim(data) + '%'
		ls_NomeProdutoData = Trim(ls_NomeProdutoData)
		SELECT
			IDPRODUTO,
			NOME
		INTO
			:ll_IdProduto,
			:ls_NomeProduto
		FROM
			PRODUTO
		WHERE
			NOME LIKE :ls_NomeProdutoData
		USING SQLCA;
		
		If Uf_Null(ll_IdProduto, 0) > 0 Then
			If of_Valida_insercao_produto(ll_IdProduto) > 0 Then
				This.SetItem(Row, 'idproduto', ll_IdProduto)
				This.SetItem(Row, 'idprodutoe', String(ll_IdProduto))
				This.SetItem(Row, 'produto_nome', ls_NomeProduto)
			Else
				Msg('Produto j$$HEX2$$e1002000$$ENDHEX$$inserido.')
				This.SetItem(Row, 'idprodutoe', '')
			End If
		Else
			Msg('Produto n$$HEX1$$e300$$ENDHEX$$o encontrado.')
		End If
	End If
End If
end event

event rowfocuschanged;Selectrow(0,false)
end event

event itemchanged;Post Event ue_PostItemChanged(row, dwo, data)
end event

type gb_corrente from groupbox within tabpage_operacao
integer y = 144
integer width = 5161
integer height = 2652
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

type gb_informacoes from groupbox within tabpage_operacao
integer width = 5157
integer height = 180
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Informa$$HEX2$$e700f500$$ENDHEX$$es"
end type

