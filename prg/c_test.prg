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
    .closable = .F.  && ��ֹ�ô��ڵĵ����˵�
    .addObject('cmdCommand1','cmdSave')  && ������ť
    .addObject('txtProductName','txtProductName')  && ����ı���
    .visible = .T.  && ������
endwith
frmInventory.Closable = .F.  && ��ֹ�ô��ڵĵ����˵�

frmInventory.AddObject('cmdCommand1','cmdMyCmdBtn')  && ������ť
frmInventory.AddObject('grdGrid1','Grid')  && ��� Grid �ؼ�

frmInventory.grdGrid1.Left = 25  && ���� Grid λ��

frmInventory.grdGrid1.SetAll("DynamicBackColor", ;
   "IIF(MOD(RECNO( ), 2)=0, RGB(255,255,255) ;
   , RGB(0,255,0))", "Column")  && ������ʾ��ɫ����ɫ��¼

frmInventory.grdGrid1.Visible = .T.  && Grid �ؼ�����
frmInventory.cmdCommand1.Visible =.T.  && "Quit" ���ť����
frmInventory.grdGrid1.Column1.Header1.Caption = 'Customer ID'

frmInventory.SHOW  && ��ʾ�ñ�
READ EVENTS  && �����¼�����

DEFINE CLASS cmdSave AS CommandButton  && �������ť
   Caption = '\<Quit'  && ���ť�ϵı���
   Cancel = .T.  && Ĭ�� Cancel ���ť (Esc)
   Left = 125  && ���ť��
   Top = 210  && ���ť��
   Height = 25  && ���ť��

   PROCEDURE Click
      CLEAR EVENTS  && ֹͣ�¼�����, �رձ�
      CLOSE ALL  && �رձ�����ݿ�
ENDDEFINE

DEFINE CLASS txtProductName AS TextBox  && �����ı���
   Caption = '\<Quit'  && ���ť�ϵı���
   Cancel = .T.  && Ĭ�� Cancel ���ť (Esc)
   Left = 125  && ���ť��
   Top = 210  && ���ť��
   Height = 25  && ���ť��

   PROCEDURE Click
      CLEAR EVENTS  && ֹͣ�¼�����, �رձ�
      CLOSE ALL  && �رձ�����ݿ�
ENDDEFINE

frmInventory.show