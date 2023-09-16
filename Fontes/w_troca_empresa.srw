HA$PBExportHeader$w_troca_empresa.srw
forward
global type w_troca_empresa from w_ancestor
end type
type cb_1 from u_commandbutton within w_troca_empresa
end type
type st_empresa from statictext within w_troca_empresa
end type
type st_1 from statictext within w_troca_empresa
end type
type dw_corrente from datawindow within w_troca_empresa
end type
type gb_1 from groupbox within w_troca_empresa
end type
type gb_2 from groupbox within w_troca_empresa
end type
end forward

global type w_troca_empresa from w_ancestor
integer width = 2469
integer height = 1628
string title = "ERP - Troca de Empresa"
cb_1 cb_1
st_empresa st_empresa
st_1 st_1
dw_corrente dw_corrente
gb_1 gb_1
gb_2 gb_2
end type
global w_troca_empresa w_troca_empresa

type variables

end variables

forward prototypes
public subroutine of_alimenta_campos_empresa ()
end prototypes

public subroutine of_alimenta_campos_empresa ();String ls_Empresa, ls_CNPJSelect, ls_CNPJ

SELECT
	NOME,
	CNPJ
INTO
	:ls_Empresa,
	:ls_CNPJSelect
FROM
	EMPRESA
WHERE
	IDEMPRESA = :gl_IdEmpresa
USING
	SQLCA;

ls_CNPJ = String(ls_CNPJSelect, "@@-@@@-@@@/@@@@-@@")

st_Empresa.Text = String(gl_IdEmpresa) + ' - ' + ls_Empresa + Fill(' ', 5) + ' CNPJ: ' + String(ls_Cnpj)
end subroutine

on w_troca_empresa.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_empresa=create st_empresa
this.st_1=create st_1
this.dw_corrente=create dw_corrente
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_empresa
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.dw_corrente
this.Control[iCurrent+5]=this.gb_1
this.Control[iCurrent+6]=this.gb_2
end on

on w_troca_empresa.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_empresa)
destroy(this.st_1)
destroy(this.dw_corrente)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;call super::open;String ls_Empresa, ls_Cnpj
Long ll_Find

of_alimenta_campos_empresa()

dw_Corrente.SetTransObject(SQLCA)
dw_Corrente.Retrieve()

ll_Find = dw_Corrente.Find('idempresa = ' + String(gl_IdEmpresa), 1, dw_Corrente.RowCount())
dw_Corrente.SetItem(ll_Find, 'FLAG', 'T')
end event

type cb_1 from u_commandbutton within w_troca_empresa
integer x = 1989
integer y = 80
integer taborder = 20
string text = "Trocar"
end type

event clicked;call super::clicked;Long ll_Find

ll_Find = dw_Corrente.Find("flag = 'T'", 1, dw_Corrente.RowCount())

If dw_Corrente.GetItemNumber(ll_Find, 'idempresa') <> gl_IdEmpresa Then
	gl_IdEmpresa = dw_Corrente.GetItemNumber(ll_Find, 'idempresa')
	
	of_alimenta_campos_empresa()
	
	Msg('Empresa trocada com sucesso!')
End If
end event

type st_empresa from statictext within w_troca_empresa
integer x = 329
integer y = 108
integer width = 1614
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within w_troca_empresa
integer x = 46
integer y = 108
integer width = 274
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Empresa:"
boolean focusrectangle = false
end type

type dw_corrente from datawindow within w_troca_empresa
event ue_clicked ( integer xpos,  integer ypos,  long row,  dwobject dwo )
event ue_post_itemchanged ( long row,  dwobject dwo,  string data )
integer x = 18
integer y = 304
integer width = 2391
integer height = 1220
integer taborder = 30
string title = "none"
string dataobject = "d_empresas"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_clicked(integer xpos, integer ypos, long row, dwobject dwo);//
end event

event itemchanged;Long ll_Find

If row > 0 Then
	ll_Find = This.Find("FLAG = 'T'", 1, This.RowCount())
	
	This.SetItem(ll_Find, "FLAG", 'F')
End If
end event

type gb_1 from groupbox within w_troca_empresa
integer width = 2427
integer height = 236
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Empresa Logada"
end type

type gb_2 from groupbox within w_troca_empresa
integer y = 244
integer width = 2427
integer height = 1292
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Empresas Dispon$$HEX1$$ed00$$ENDHEX$$veis"
end type

