HA$PBExportHeader$w_menu.srw
forward
global type w_menu from window
end type
type p_1 from picture within w_menu
end type
end forward

global type w_menu from window
integer width = 3831
integer height = 3380
boolean titlebar = true
string title = "ERP"
string menuname = "m_menu"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_1 p_1
end type
global w_menu w_menu

on w_menu.create
if this.MenuName = "m_menu" then this.MenuID = create m_menu
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on w_menu.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.p_1)
end on

event open;If IsValid(w_Login) Then close(w_Login)
end event

type p_1 from picture within w_menu
integer width = 3771
integer height = 3192
boolean originalsize = true
string picturename = "C:\Users\alber\OneDrive\$$HEX1$$c100$$ENDHEX$$rea de Trabalho\FxV3fHxWcAAy_Zv.jpg"
end type

