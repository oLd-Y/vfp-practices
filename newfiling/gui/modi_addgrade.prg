Local Array laForm[1]
Local loForm1

modi form addgrade Nowait
&& Create Form lcFormPath + [frmMain.scx] As Form Nowait
ASelObj(laForm,1)


&&  Form1
loForm1 = laForm[1]
with loForm1
	.AutoCenter = .T.
	.BorderStyle = 2
    .Caption = "��¼�ɼ���"

    .SetAll("Aligment", 2, "Text")
endwith

&& ׼��֤�� Label1
loLabel1 = loForm1.Label1
With loLabel1
    .Caption = "׼��֤�ţ�"
EndWith

&& ���֤�� Label2
loLabel2 = loForm1.Label2
With loLabel2
    .Caption = "���֤�ţ�"
EndWith

&& ѧ������ Label3
loLabel3 = loForm1.Label3
With loLabel3
    .Caption = "ѧ��������"
EndWith

&& �������� Label4
loLabel4 = loForm1.Label4
With loLabel4
    .Caption = "�������ƣ�"
EndWith

&& ���� Label5
loLabel5 = loForm1.Label5
With loLabel5
    .Caption = "���ģ�"
EndWith

&& ��ѧ Label6
loLabel6 = loForm1.Label6
With loLabel6
    .Caption = "��ѧ��"
EndWith

&& Ӣ�� Label7
loLabel7 = loForm1.Label7
With loLabel7
    .Caption = "Ӣ�"
EndWith

&& �ۺ� Label8
loLabel8 = loForm1.Label8
With loLabel8
    .Caption = "�ۺϣ�"
EndWith

&& �ۺ� Label9
loLabel9 = loForm1.Label9
With loLabel9
    .Caption = "��һ־Ը��"
EndWith

&& ���� Label10
loLabel10 = loForm1.Label10
With loLabel10
    .Caption = "�ڶ�־Ը��"
EndWith

&& ��һ־Ը Label11
loLabel11 = loForm1.Label11
With loLabel11
    .Caption = "����־Ը��"
EndWith

&& ��һ־Ը Combo1
loCombo1 = loForm1.Combo1
With loCombo1
    .RowSource = "file_info.volu_name1"
    .RowSourceType = 2
EndWith

&& �ڶ�־Ը Combo2
loCombo2 = loForm1.Combo2
With loCombo2
    .RowSource = "file_info.volu_name2"
    .RowSourceType = 2
EndWith

&& ����־Ը Combo3
loCombo3 = loForm1.Combo3
With loCombo3
    .RowSource = "file_info.volu_name3"
    .RowSourceType = 2
EndWith



&& ��������


do cp2addgrade