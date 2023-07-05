SET MARK TO "-"
SET DATE TO ANSI
SET HOUR TO 24
SET DELE ON
SET CENT ON
SET TALK OFF
SET STATUS OFF
*!* SET STAT BAR OFF
SET SAFETY OFF
SET EXCL OFF

CLEA
CLOSE DATABASES
CLEAR ALL && clear variables ..

m.pub_path = "D:\Desktop\vfp-practices\dbf\"
USE m.pub_path + "inventory" exclusive in 1

set classlib to ivt_clslib additive
*!* create an inventory form
frmInventory = CREATEOBJECT('Form')


*!* add a grid to the form
frmInventory.AddObject('gridInventory','Grid')
*!* add a command button to the form
frmInventory.AddObject('cmdSave','CmdSave')
*!* add a text box to the form
frmInventory.AddObject('txtProductName','TextBox')

INVENTORY_FORM_WIDTH = 1000
INVENTORY_FORM_HEIGHT = 800

INVENTORY_GRID_WIDTH = 600
INVENTORY_GRID_HEIGHT = 500
*!* INVENTORY_GRID_LEFT =

*!* initialize the form
WITH frmInventory
    .Name = "frmInventory"
    .Caption = "frmInventory"
    .Left = 100
    .Top = 100
    .Width = 400
    .Height = 300
    .visible = .T.
    WITH frmInventory.gridInventory
        .Left = 10
        .Top = 10
        .Width = 600
        .Height = 500
        .visible = .T.
        .Column1.ControlSource = "ivt_date"
        .Column2.ControlSource = "ivt_type"
        .Column3.ControlSource = "ivt_name"
        .Column4.ControlSource = "ivt_quan"

    ENDWITH

    WITH frmInventory.txtProductName
    *!*         .Left = frmInventory.gridInventory.Left
    *!*         .Top = frmInventory.gridInventory.Height + 20
        .Left = 600
        .Top = 520
        .Width = 200
        .visible = .T.
        .ControlSource = "Inventory.ivt_name"

    ENDWITH

    WITH frmInventory.cmdSave
    *!*         .Left = frmInventory.txtProductName.Width + 20
    *!*         .Top = frmInventory.gridInventory.Height + 20
        .Left = 650
        .Top = 550
        .Width = 70
        .Height = 50
        .visible = .T.
    ENDWITH
ENDWITH



lcFilePath = "D:\Desktop\vfp-practices\prg\inventory.scx"
frmInventory.SaveAs(lcFilePath)
*!* 销毁Form对象
RELEASE frmInventory


*!* 显示保存成功消息
MESSAGEBOX("Form已成功保存到：" + lcFilePath, 64, "保存成功")
*!* modify form inventory


*!* do form inventory.scx

*!* DEFINE CLASS cmdSave AS CommandButton
*!*     caption = 'Save'
*!*     left = 10
*!*     top = 10
*!*     height = 25
*!*     width = 50
*!*     visible = .T.
*!*     procedure Parent.Click
*!*         txt = LTRIM(Inventory.ivt_name)
*!*
*!*         if EMPTY(ALLTRIM(thisForm.txtProductName.value))
*!*             messagebox("请重新输入品名！", 16, "提示")
*!*             thisForm.txtProductName.setFocus()
*!*         else
*!*             replace next 1 Inventory.ivt_name with LTRIM(Inventory.ivt_name)
*!*             thisForm.gridInventory.refresh
*!*             thisForm.gridInventory.setFocus()
*!*         endif
*!* ENDDEFINE



*!* DEFINE CLASS Form AS Form
*!*     PROCEDURE Load
*!*         SET MARK TO "-"
*!*         SET DATE TO ANSI
*!*         SET HOUR TO 24
*!*         SET DELE ON
*!*         SET CENT ON
*!*         SET TALK OFF
*!*         SET STATUS OFF
*!*         *!* SET STAT BAR OFF
*!*         SET SAFETY OFF
*!*         SET EXCL OFF
*!*
*!*         m.pub_path = "D:\Desktop\vfp-practices\practice1\dbf\"
*!*         USE m.pub_path + "inventory" alias inventory IN 1
*!* ENDDEFINE

*!*
*!* *!* define the save command button
*!* define class txtProductName as TextBox
*!*     .Left = frmInventory.gridInventory.Left
*!*     .Top = frmInventory.gridInventory.Height + 20
*!*     .Width = 200
*!*     .ControlSource = "Inventory.ivt_name"
*!*
*!* enddefine
*!*
*!* *!* frmInventory.saveAs("D:\Desktop\vfp-practices\prg\inventory.scx")
*!* *!* 保存Form为PRG文件
*!* lcFilePath = "D:\Desktop\vfp-practices\prg\inventory.scx"
*!* loForm.SaveAs(lcFilePath)
*!*
*!* *!* 销毁Form对象
*!* RELEASE frmInventory
*!*
*!* *!* 显示保存成功消息
*!* MESSAGEBOX("Form已成功保存到：" + lcFilePath, 64, "保存成功")

*!* CLOSE ALL
*!* CLEAR ALL
*!* CLEAR
*!* CLOSE DATABASES
return

CLEAR ALL
CLOSE DATABASES
CLOSE TABLES
CLEAR EVENTS
CLEAR WINDOWS
CLEAR POPUP

CLEAR PRECISION
SET SYSMENU ON