Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
&& ���з�
br = chr(13)

&& ���� nowait ����ڹرձ�֮���ִ�к������䣬cmd���Ҳ�������
&& ��������� save ����, ��������������޷���ȡ��Ӧ�ı������� (�ݲ�ȷ���Ƿ�Ϊ��)
modi form grade Nowait
&& Create Form lcFormPath + [frmMain.scx] As Form Nowait
ASelObj(laForm,1)
&& loForm.AddObject("cmd", "CommandButton")


&& �ɼ� Form1
loForm1 = laForm[1]
with loForm1

    .AddProperty("SysInfo", NewObject("SysInfo", "SysInfo.prg")) && ��ӱ�ϵͳ��Ϣ

    .Height = loForm1.SysInfo.FormH()
    .Left = 0
    .Width = loForm1.SysInfo.FormW()
    .Top = 0

    .AutoCenter = .T.
    .BackColor = RGB(237, 234, 216)
    .BorderStyle = 1 && �ɵ��߿�(Ĭ��)
    .Caption = "�ɼ�"
    .Closable = .T.
    .ControlBox = .T.
    .Enabled = .T.
    .FontSize = 9
    .MaxButton = .F.
    .MinButton = .T.
    .Movable = .T.
    .ScrollBars = 0 && ��
    .ShowWindow = 2 && ��Ϊ�����
    .SizeBox = .F.
    .Themes = .T.
    .TitleBar = 1 && ��
    .Visible = .F.
    .WindowState = 0 && ��ͨ
    .WindowType = 1 && ģʽ
    .ZoomBox = .F.

endwith

&& ��ҳ�� PageFrame1
loPageFrame1 = loForm1.PageFrame1
With loPageFrame1

    .ActivePage = 1
    .Height = 528
    .Left = 1
    .Name = "PageFrame1"
    .PageCount = 1
    .TabIndex = 1
    .TabOrientation = 0 && ��(Ĭ��)
    .TabStretch = 0 && ������
    .TabStyle = 1 && ������
    .Themes = .F.
    .Top = 0
    .Width = loForm1.SysInfo.FormW()
    .Height = loForm1.SysInfo.FormH()

EndWith

&& Ͷ����Ϣҳ Page1
loPage1 = loPageFrame1.Page1
With loPage1

    .BackColor = RGB(192, 216, 243)

EndWith

&& ���� Shape1
loShape1 = loPage1.Shape1
With loShape1

    .BackStyle = 0 && ͸��
    .BorderColor = RGB(87, 121, 215)
    .Curvature = 5 && ָ����״�ؼ��Ľǵ�����
    .FillStyle = 1 && ͸��
    .Height = 86
    .Left = 3
    .SpecialEffect = 0 && 3ά
    .Top = 4
    .ZOrder(1) && ���ڵײ�

EndWith

&& ����ͼ�� Shape2
loShape2 = loPage1.Shape2
With loShape2

    .BackColor = RGB(156, 181, 232)
    .BorderStyle = 0 && ͸��
    .Height = 18
    .Left = 4
    .Top = 71
    .Width = 487

EndWith

&& �ɼ��� Grid1
loGrid1 = loPage1.Grid1
with loGrid1
    .RecordSource = "file_info"
    .RecordSourceType = 1

    .Left = 0
    .Top = loForm1.SysInfo.PFGridT()
    .Width = loForm1.SysInfo.PFGridW()
    .Height = loForm1.SysInfo.PFGridH()

    && --------------------- Grid �������� ---------------------
    .AllowCellSelection = .F.
    .AllowHeaderSizing = .F.
    .AllowRowSizing = .F.
    .BackColor = RGB(248, 248, 248)
    .ColumnCount = 13
    .DeleteMark = .F.
    .FontName = "΢���ź�"
    .FontSize = 11
    .GridLineColor = RGB(147, 147, 147)
    .HeaderHeight = 30
    .RowHeight = 27
    .Height = 612
    .HighlightBackColor = RGB(165, 207, 240)
    .HighlightForeColor = RGB(0, 0, 0)
    .HighlightStyle = 2 && ������������ָ����ɼ�
    .Panel = 1 && ��
    .ReadOnly = .T.
    .RecordMark = .F.
    .RowHeight = 22
    .ScrollBars = 3 && ��ˮƽ�ִ�ֱ(Ĭ��)
    .SplitBar = .F.
    .TabIndex = 1
    .Visible = .T.

    && --------------------- Grid ���������� ---------------------
	.SetAll("Alignment", 2, "Header")
	.SetAll("backColor", RGB(210, 210, 210), "Header")
	.SetAll("FontName", "΢���ź�", "Header")
	.SetAll("FontSize", 11, "Header")

	.SetAll("Alignment", 2, "Column")
	.SetAll("FontName", "΢���ź�", "Column")
	.SetAll("FontSize", 10, "Column")
	.SetAll("Format", "Z", "Column")

    .Columns(1).ControlSource = "file_info.pass_num"
    .Columns(1).Width = 8 * 10
    .Columns(1).Header1.Caption = "׼��֤��"

    .Columns(2).ControlSource = "file_info.id_card"
    .Columns(2).Width = 8 * 20
    .Columns(2).Header1.Caption = "���֤��"

    .Columns(3).ControlSource = "file_info.stu_name"
    .Columns(3).Width = 8 * 8
    .Columns(3).Header1.Caption = "ѧ������"

    .Columns(4).ControlSource = "file_info.high_name"
    .Columns(4).Width = 8 * 24
    .Columns(4).Header1.Caption = "��������"

    .Columns(5).ControlSource = "file_info.all_score"
    .Columns(5).Header1.Caption = "�ܷ�"
    .Columns(5).Width = 8 * 6

    .Columns(6).ControlSource = "file_info.chinese"
    .Columns(6).Header1.Caption = "����"
    .Columns(6).Width = 8 * 6

    .Columns(7).ControlSource = "file_info.math"
    .Columns(7).Header1.Caption = "��ѧ"
    .Columns(7).Width = 8 * 6

    .Columns(8).ControlSource = "file_info.english"
    .Columns(8).Header1.Caption = "Ӣ��"
    .Columns(8).Width = 8 * 6

    .Columns(9).ControlSource = "file_info.composite"
    .Columns(9).Header1.Caption = "�ۺ�"
    .Columns(9).Width = 8 * 6

    .Columns(10).ControlSource = "file_info.rank"
    .Columns(10).Header1.Caption = "����"
    .Columns(10).Width = 8 * 6

    .Columns(11).ControlSource = "file_info.volu_name1"
    .Columns(11).Header1.Caption = "��һ־Ը"
    .Columns(11).Width = 8 * 22

    .Columns(12).ControlSource = "file_info.volu_name2"
    .Columns(12).Header1.Caption = "�ڶ�־Ը"
    .Columns(12).Width = 8 * 22

    .Columns(13).ControlSource = "file_info.volu_name3"
    .Columns(13).Header1.Caption = "����־Ը"
    .Columns(13).Width = 8 * 22

endwith

&& �ɼ��ֲ������� Funcctn1
loFuncctn1 = loPage1.Funcctn1
With loFuncctn1
    .BackColor = RGB(192, 216, 243)
    .BorderColor = RGB(100, 100, 100)
    .BorderWidth = 1
    .Image1.BorderColor = RGB(100, 100, 100)
    .Label1.BackColor = RGB(240, 240, 240)
    .Label1.BackStyle = 0 && ͸��
    .Label1.ForeColor = RGB(4, 26, 188)
EndWith

&& �ֶ�¼������ Funcctn2
loFuncctn2 = loPage1.Funcctn2
With loFuncctn2
    .BackColor = RGB(192, 216, 243)
    .BorderColor = RGB(100, 100, 100)
    .BorderWidth = 1
    .Image1.BorderColor = RGB(100, 100, 100)
    .Label1.BackColor = RGB(240, 240, 240)
    .Label1.BackStyle = 0 && ͸��
    .Label1.ForeColor = RGB(4, 26, 188)
EndWith

&& ��������

&& ��һ���·�����״ Shape2
loShape2.Width = loShape1.Width - 2

&& Funcctn1
loFuncctn1.Top = loShape1.Top
loFuncctn1.Height = loShape1.Height - loShape2.Height - 1

&& Funcctn2
loFuncctn2.Top = loShape1.Top
loFuncctn2.Height = loShape1.Height - loShape2.Height - 1


do cp2grade