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

*!* create an inventory form
frmInventory = CREATEOBJECT('Form')

*!* initialize the form
with frmInventory
    .closable = .F.  && 废止该窗口的弹出菜单
    .addObject('cmdCommand1','cmdSave')  && 添加命令按钮
    .addObject('txtProductName','txtProductName')  && 添加文本框
    .visible = .T.  && 表单可视
endwith
frmInventory.Closable = .F.  && 废止该窗口的弹出菜单

frmInventory.AddObject('cmdCommand1','cmdMyCmdBtn')  && 添加命令按钮
frmInventory.AddObject('grdGrid1','Grid')  && 添加 Grid 控件

frmInventory.grdGrid1.Left = 25  && 调整 Grid 位置

frmInventory.grdGrid1.SetAll("DynamicBackColor", ;
   "IIF(MOD(RECNO( ), 2)=0, RGB(255,255,255) ;
   , RGB(0,255,0))", "Column")  && 交替显示白色和绿色记录

frmInventory.grdGrid1.Visible = .T.  && Grid 控件可视
frmInventory.cmdCommand1.Visible =.T.  && "Quit" 命令按钮可视
frmInventory.grdGrid1.Column1.Header1.Caption = 'Customer ID'

frmInventory.SHOW  && 显示该表单
READ EVENTS  && 启动事件处理

DEFINE CLASS cmdSave AS CommandButton  && 创建命令按钮
   Caption = '\<Quit'  && 命令按钮上的标题
   Cancel = .T.  && 默认 Cancel 命令按钮 (Esc)
   Left = 125  && 命令按钮列
   Top = 210  && 命令按钮行
   Height = 25  && 命令按钮高

   PROCEDURE Click
      CLEAR EVENTS  && 停止事件处理, 关闭表单
      CLOSE ALL  && 关闭表和数据库
ENDDEFINE

DEFINE CLASS txtProductName AS TextBox  && 创建文本框
   Caption = '\<Quit'  && 命令按钮上的标题
   Cancel = .T.  && 默认 Cancel 命令按钮 (Esc)
   Left = 125  && 命令按钮列
   Top = 210  && 命令按钮行
   Height = 25  && 命令按钮高

   PROCEDURE Click
      CLEAR EVENTS  && 停止事件处理, 关闭表单
      CLOSE ALL  && 关闭表和数据库
ENDDEFINE

frmInventory.show