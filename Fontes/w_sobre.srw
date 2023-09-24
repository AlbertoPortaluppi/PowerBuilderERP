HA$PBExportHeader$w_sobre.srw
forward
global type w_sobre from w_ancestor
end type
type st_7 from statictext within w_sobre
end type
type st_6 from statictext within w_sobre
end type
type st_5 from statictext within w_sobre
end type
type p_1 from picture within w_sobre
end type
type st_3 from statictext within w_sobre
end type
type st_2 from statictext within w_sobre
end type
type st_1 from statictext within w_sobre
end type
type st_4 from statictext within w_sobre
end type
end forward

global type w_sobre from w_ancestor
integer width = 2738
integer height = 892
string title = "ERP - Sobre"
st_7 st_7
st_6 st_6
st_5 st_5
p_1 p_1
st_3 st_3
st_2 st_2
st_1 st_1
st_4 st_4
end type
global w_sobre w_sobre

on w_sobre.create
int iCurrent
call super::create
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.p_1=create p_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_7
this.Control[iCurrent+2]=this.st_6
this.Control[iCurrent+3]=this.st_5
this.Control[iCurrent+4]=this.p_1
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_4
end on

on w_sobre.destroy
call super::destroy
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.p_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_4)
end on

type st_7 from statictext within w_sobre
integer y = 532
integer width = 2130
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Contato: portaluppi@alunos.utfpr.edu.br"
boolean focusrectangle = false
end type

type st_6 from statictext within w_sobre
integer y = 452
integer width = 2130
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "migrar esse software para a linguagem C#."
boolean focusrectangle = false
end type

type st_5 from statictext within w_sobre
integer y = 252
integer width = 2738
integer height = 104
integer textsize = -13
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Data de cria$$HEX2$$e700e300$$ENDHEX$$o: 24/09/2023"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_1 from picture within w_sobre
integer x = 2126
integer y = 348
integer width = 594
integer height = 464
string picturename = "Imagens\imagem1.jpg"
boolean focusrectangle = false
end type

type st_3 from statictext within w_sobre
integer y = 708
integer width = 2117
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Professor Orientador: Gustavo Jansen de Souza Santos"
boolean focusrectangle = false
end type

type st_2 from statictext within w_sobre
integer y = 380
integer width = 2130
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criado pelo acad$$HEX1$$ea00$$ENDHEX$$mico Alberto Junior Portaluppi com o intuito de"
boolean focusrectangle = false
end type

type st_1 from statictext within w_sobre
integer width = 2747
integer height = 148
integer textsize = -22
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217856
long backcolor = 67108864
string text = "Sistema de ERP"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_sobre
integer y = 152
integer width = 2743
integer height = 104
integer textsize = -13
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vers$$HEX1$$e300$$ENDHEX$$o 1.0.0"
alignment alignment = center!
boolean focusrectangle = false
end type

