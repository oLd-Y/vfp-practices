Local Array laForm[1]
Local loForm1
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"

&& ���� nowait ����ڹرձ���֮���ִ�к������䣬cmd���Ҳ���������
&& (�٣����������� save ����, ����������������޷���ȡ��Ӧ�ı��������� (�ݲ�ȷ���Ƿ�Ϊ��)
modi form filing_info NOWAIT SAVE
ASelObj(laForm,1)


&& ������ Form1
loForm1 = laForm[1]
with loForm1

    .AddProperty("SysInfo", NewObject("SysInfo", "SysInfo.prg")) && ���ӱ���ϵͳ��Ϣ

    .Autocenter = .T.
    .BackColor = RGB(237, 234, 216)
    .BorderStyle = 1 && �ɵ��߿�(Ĭ��)
    .Caption = "Ͷ����Ϣ"
    .Closable = .T.
    .ControlBox = .T.
    .Enabled = .T.
    .FontSize = 9
    .Height = loForm1.SysInfo.FormH()
    .Left = 0
    .MaxButton = .F.
    .MinButton = .T.
    .Movable = .T.
    .ScrollBars = 0 && ��
    .ShowWindow = 1 && ��Ϊ�������
    .SizeBox = .F.
    .Themes = .T.
    .TitleBar = 1 && ��
    .Top = 0
    .Visible = .F.
    .Width = loForm1.SysInfo.FormW()
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

&& ��ѧ�� Grid1
loGrid1 = loPage1.Grid1
with loGrid1

    .RecordSource = "university"
    .RecordSourceType = 1

    .Left = 0
    && û����ȡ��Form1.Load����������ʱ���ӵı���
    .Top = loForm1.SysInfo.PFGridT()
    .Width = loForm1.SysInfo.PFGridW()
    .Height = loForm1.SysInfo.PFGridH()

    .AllowCellSelection = .F.
    .AllowHeaderSizing = .F.
    .AllowRowSizing = .F.
    .BackColor = RGB(248, 248, 248)
    .ColumnCount = 2
    .DeleteMark = .F.
    .FontName = "΢���ź�"
    .FontSize = 11
    .GridLineColor = RGB(147, 147, 147)
    .HeaderHeight = 30
    .RowHeight = 27
    .Height = 612
    .HighlightForeColor = RGB(0, 0, 0)
    .HighlightStyle = 2 && �������������ָ����ɼ�
    .Panel = 1 && ��
    .ReadOnly = .T.
    .RecordMark = .F.
    .RowHeight = 22
    .ScrollBars = 3 && ��ˮƽ�ִ�ֱ(Ĭ��)
    .SplitBar = .F.
    .TabIndex = 1

	.SetAll("Alignment", 2, "Header")
	.SetAll("backColor", RGB(210, 210, 210), "Header")
	.SetAll("FontName", "΢���ź�", "Header")
	.SetAll("FontSize", 11, "Header")

	.SetAll("Alignment", 2, "Column")
	.SetAll("FontName", "΢���ź�", "Column")
	.SetAll("FontSize", 10, "Column")
	.SetAll("Format", "Z", "Column")
    .Visible = .T.

    .Columns(1).ControlSource = "university.univ_name"
    .Columns(1).FontName = "Calibri"
    .Columns(1).FontSize = 12
    .Columns(1).Header1.Caption = "��ѧ����"
    .Columns(1).Width = 10 * 20

    .Columns(2).ControlSource = "university.univ_code"
    .Columns(2).Header1.Caption = "��ѧ����"
    .Columns(2).Width = 10 * 8

    For i = 1 To loGrid1.ColumnCount
        loGrid1.Width = loGrid1.Width * IIF(i = 1, 0, 1) + loGrid1.Columns(i).Width
    EndFor
    loGrid1.Width = loGrid1.Width + 22

endwith

&& Ͷ����Ϣ�� Grid2
loGrid2 = loPage1.Grid2
with loGrid2

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
    .HighlightForeColor = RGB(0, 0, 0)
    .HighlightStyle = 2 && �������������ָ����ɼ�
    .Left = loGrid1.Left + loGrid1.Width
    .Panel = 1 && ��
    .ReadOnly = .T.
    .RecordMark = .F.
    .RecordSource = "file_info"
    .RecordSourceType = 1
    .RowHeight = 22
    .ScrollBars = 3 && ��ˮƽ�ִ�ֱ(Ĭ��)
    .SplitBar = .F.
    .TabIndex = 1
    .Top = loForm1.SysInfo.PFGridT()
    .Width = loForm1.SysInfo.PFGridW() - loGrid2.Left
    .Height = loForm1.SysInfo.PFGridH()
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
    .Columns(2).Header1.Caption = "����֤��"

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

&& ���Ͷ������ Text1
loText1 = loPage1.Text1
With loText1

    .Alignment = 2 && ����
    .BackColor = RGB(222, 234, 250)
    .BackStyle = 1 && ��͸��
    .BorderColor = RGB(63, 123, 200)
    .BorderStyle = 1 && �̶�����
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Format = "K"
    .Height = 25
&&     .Left = 41
    .Margin = 1
    .MaxLength = 6
    .ReadOnly = .T.
    .Themes = .F.
&&     .Top = 11
    .Width = 64

EndWith

&& ���Ͷ������ Text2
loText2 = loPage1.Text2
With loText2

    .Alignment = 2 && ����
    .BackColor = RGB(222, 234, 250)
    .BackStyle = 1 && ��͸��
    .BorderColor = RGB(63, 123, 200)
    .BorderStyle = 1 && �̶�����
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Format = "K"
    .Height = 25
&&     .Left = 41
    .Margin = 1
    .MaxLength = 6
    .ReadOnly = .T.
    .Themes = .F.
&&     .Top = 11
    .Width = 64

EndWith

&& ��ѯѧ�������ı��� Text3
loText3 = loPage1.Text3
With loText3

    .Alignment = 0
    .BackColor = RGB(222, 234, 250)
    .BackStyle = 1 && ��͸��
    .BorderColor = RGB(63, 123, 200)
    .BorderStyle = 1 && �̶�����
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Format = "K"
    .Height = 25
&&     .Left = 0
    .Margin = 1
    .MaxLength = 18
    .Themes = .F.
&&     .Top = 40

EndWith

&& ��ѯ��ѧ�����ı��� Text4
loText4 = loPage1.Text4
With loText4

    .Alignment = 0
    .BackColor = RGB(222, 234, 250)
    .BackStyle = 1 && ��͸��
    .BorderColor = RGB(63, 123, 200)
    .BorderStyle = 1 && �̶�����
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Format = "K"
    .Height = 25
    .Margin = 1
    .MaxLength = 18
    .Themes = .F.
    .ReadOnly = .F.
EndWith

&& ��ѯ׼��֤���ı��� Text5
loText5 = loPage1.Text5
With loText5

    .Alignment = 0
    .BackColor = RGB(222, 234, 250)
    .BackStyle = 1 && ��͸��
    .BorderColor = RGB(63, 123, 200)
    .BorderStyle = 1 && �̶�����
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Format = "K"
    .Height = 25
&&     .Left = 0
    .Margin = 1
    .MaxLength = 18
    .Themes = .F.
&&     .Top = 40

EndWith


&& && ComboBoxes
&& With loCombo1
&&
&&     .Alignment = 0 && ��Ĭ�ϣ�
&&     .BackColor = RGB(222, 234, 250)
&&     .BorderColor = RGB(63, 123, 200)
&&     .DisplayCount = 3 && �������е��еĸ���
&&     .FontName = "΢���ź�"
&&     .FontSize = 11
&&     .ForeColor = RGB(16, 48, 96)
&&     .Height = 23
&&     .ItemForeColor = RGB(16, 48, 96)
&&     .Left = 41
&&     .Margin = 0
&&     .RowSource = "ȫ��," + "ѧ������, ��������, ����֤��"
&&     .RowSourceType = 1
&&     .SpecialEffect = 1 && ƽ��
&&     .Style = 2 && �����б���
&&     .TabIndex = 3
&&     .Top = 40
&&     .Width = 99
&&     .Value = "ȫ��"
&&
&& EndWith

&& ��ӡ������ť Command1
loCommand1 = loPage1.Command1
With loCommand1

    .AutoSize = .T.
    .BackColor = RGB(192, 216, 243)
    .Caption = "��ӡ�ɱ���"
    .FontName = "΢���ź�"
    .FontSize = 9
    .ForeColor = RGB(16, 48, 96)
&&     .Height = 20
&&     .Left = 104
    .TabIndex = 27
&&     .Top = 38
    .Width = 100

EndWith

&& ���Ͷ������ Label1
loLabel1 = loPage1.Label1
With loLabel1

    .Alignment = 1 && ��Ĭ�ϣ�
    .AutoSize = .T.
    .BackStyle = 0 && ͸��
    .BorderStyle = 0 && �ޣ�Ĭ�ϣ�
    .Caption = "���Ͷ������"
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .TabIndex = 36
    .Height = 21
    .Width = 28

EndWith

&& ���Ͷ������ Label2
loLabel2 = loPage1.Label2
With loLabel2

    .Alignment = 1 && ��Ĭ�ϣ�
    .AutoSize = .T.
    .BackStyle = 0 && ͸��
    .BorderStyle = 0 && �ޣ�Ĭ�ϣ�
    .Caption = "���Ͷ������"
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Height = 21
    .TabIndex = 36
    .Width = 28

EndWith

&& ��ָ����ѯ���� Label3
loLabel3 = loPage1.Label3
With loLabel3

    .Alignment = 1 && ��Ĭ�ϣ�
    .AutoSize = .T.
    .BackStyle = 0 && ͸��
    .BorderStyle = 0 && �ޣ�Ĭ�ϣ�
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Height = 21
    .TabIndex = 36
    .Width = 28

EndWith

&& Ͷ��������ǩ Label4
loLabel4 = loPage1.Label4
With loLabel4

    .Alignment = 1 && ��Ĭ�ϣ�
    .AutoSize = .T.
    .BackStyle = 0 && ͸��
    .BorderStyle = 0 && �ޣ�Ĭ�ϣ�
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Height = 21
    .TabIndex = 36

EndWith

&& �������ã����ù���������

&& ��һ���·�����״ Shape2
loShape2.Width = loShape1.Width - 2

&& && ���Ͷ������ Label1
&& loLabel1.Top = loShape1.Top + 10
&& loLabel1.Left = loShape1.Left + 2
&&
&& && ��ѯ���ͱ�ǩ Label3
&& loLabel3.Top = loLabel1.Top
&& loLabel3.Left = loText1.Left + loText1.Width + 10
&&
&& && ���Ͷ�������ı��� Text1
&& loText1.Top = loLabel1.Top
&& loText1.Left = loLabel1.Left + loLabel1.Width + 10
&&
&& && ���Ͷ�����α�ǩ Label2
&& loLabel2.Top = loLabel1.Top + loLabel1.Height + 10
&& loLabel2.Left = loLabel1.Left
&&
&& && ���Ͷ������ Text2
&& loText2.Top = loLabel2.Top
&& loText2.Left = loLabel2.Left + loLabel2.Width + 10
&&
&& && Ͷ��������ǩ Label4
&& loLabel4.Top = loLabel2.Top
&& loLabel4.Left = loText2.Left + loText2.Width + 10
&&
&& && Ͷ�������ı��� Text4
&& loText4.Top = loLabel4.Top
&& loText4.Left = loLabel4.Left + loLabel4.Width + 10
&&
&& && Ͷ������ Label3
&& loText3.Top = loText2.Top
&& loText3.Left = loText2.Left + loText2.Width + 10
&&
&& && ��ӡ������ť Command1
&& loCommand1.Left = loText4.Left + loText4.Width + 10
&& loCommand1.Top = loText4.Top - 5
&&
&& && ׼��֤�š��������ơ�����֤�ŵĶ�ѡ�� Combo1
&& loCombo1.Top = loLabel3.Top
&& loCombo1.Left = loLabel3.Left + loLabel3.Width + 10
&&
&& && ��ѯ�����ı��� Text3
&& loText3.Top = loCombo1.Top - 2
&& loText3.Left = loCombo1.Left + loCombo1.Width + 10
&&
&& && ��ѯ��ť Command2
&& loCommand2.Top = loText3.Top - 3
&& loCommand2.Left = loText3.Left + loText3.Width + 5



do cp2filing_info


























&&
&& �±���ʾ�����ťCommandButton��������ԡ��������¼��漰�����⡣
&&
&& ����
&& Alignment
&& Anchor
&& Application
&&
&& AutoSize
&& BackColor
&& BaseClass
&&
&& Cancel
&& Caption
&& ClassLibrary
&&
&& Class
&& ColorScheme
&& ColorSource
&&
&& Comment
&& Default
&& DisabledBackColor
&&
&& DisabledForeColor
&& DisabledPicture
&& DownPicture
&&
&& DragIcon
&& DragMode
&& Enabled
&&
&& FontBold
&& FontCharSet
&& FontCondense
&&
&& FontExtend
&& FontItalic
&& FontName
&&
&& FontOutline
&& FontShadow
&& FontSize
&&
&& FontStrikeThru
&& FontUnderline
&& ForeColor
&&
&& Height
&& HelpContextID
&& Left
&&
&& MouseIcon
&& MousePointer
&& Name
&&
&& OLEDragMode
&& OLEDragPicture
&& OLEDropEffects
&&
&& OLEDropHasData ����
&& OLEDropMode
&& ParentClass
&&
&& Parent
&& Picture
&& PictureMargin
&&
&& PicturePosition
&& PictureSpacing
&& RightToLeft
&&
&& SpecialEffect
&& StatusBarText
&& Style
&&
&& TabIndex
&& TabStop
&& Tag
&&
&& TerminateRead
&& Themes
&& ToolTipText
&&
&& Top
&& Visible
&& VisualEffect
&&
&& WhatsThisHelpID
&& Width
&& WordWrap
&&
&&
&& ����
&& AddProperty
&& CloneObject
&& Drag
&&
&& Move
&& OLEDrag
&& ReadExpression
&&
&& ReadMethod
&& Refresh
&& ResetToDefault
&&
&& SaveAsClass
&& SetFocus
&& ShowWhatsThis
&&
&& WriteExpression
&& WriteMethod
&& ZOrder
&&
&&
&& �¼�
&& Click
&& Destroy
&& DragDrop
&&
&& DragOver
&& Error
&& ErrorMessage
&&
&& GotFocus
&& Init
&& KeyPress
&&
&& LostFocus
&& Message
&& MiddleClick
&&
&& MouseDown
&& MouseEnter
&& MouseLeave
&&
&& MouseMove
&& MouseUp
&& MouseWheel
&&
&& OLECompleteDrag
&& OLEDragDrop
&& OLEDragOver
&&
&& OLEGiveFeedBack
&& OLESetData
&& OLEStartDrag
&&
&& RightClick
&& UIEnable
&& Valid
&&
&& When
&&
&&
&&
&&
&& �±���ʾ�˱�ǩLabel��������ԡ��������¼��漰�����⡣
&&
&& ����
&& Alignment
&& Anchor
&& Application
&&
&& AutoSize
&& BackColor
&& BackStyle
&&
&& BaseClass
&& BorderStyle
&& Caption
&&
&& Class
&& ClassLibrary
&& ColorScheme
&&
&& ColorSource
&& Comment
&& DisabledBackColor
&&
&& DisabledForeColor
&& DragIcon
&& DragMode
&&
&& Enabled
&& FontBold
&& FontCharSet
&&
&& FontCondense
&& FontExtend
&& FontItalic
&&
&& FontName
&& FontOutline
&& FontShadow
&&
&& FontSize
&& FontStrikeThru
&& FontUnderline
&&
&& ForeColor
&& Height
&& HelpContextID
&&
&& Left
&& MouseIcon
&& MousePointer
&&
&& Name
&& OLEDragMode
&& OLEDragPicture
&&
&& OLEDropEffects
&& OLEDropHasData
&& OLEDropMode
&&
&& Parent
&& ParentClass
&& RightToLeft
&&
&& Rotation
&& StatusBarText
&& Style
&&
&& TabIndex
&& Tag
&& ToolTipText
&&
&& Top
&& Visible
&& WhatsThisHelpID
&&
&& Width
&& WordWrap
&&
&&
&&
&& �¼�
&& Click
&& DblClick
&& Destroy
&&
&& DragDrop
&& DragOver
&& Error
&&
&& Init
&& MiddleClick
&& MouseDown
&&
&& MouseEnter
&& MouseLeave
&& MouseMove
&&
&& MouseUp
&& MouseWheel
&& OLECompleteDrag
&&
&& OLEDragDrop
&& OLEDragOver
&& OLEGiveFeedBack
&&
&& OLESetData
&& OLEStartDrag
&& RightClick
&&
&& UIEnable
&&
&&
&&
&&
&& ����
&& AddProperty
&& CloneObject
&& Drag
&&
&& Move
&& OLEDrag
&& ReadExpression
&&
&& ReadMethod
&& Refresh
&& ResetToDefault
&&
&& SaveAsClass
&& UIEnable
&& WriteExpression
&&
&& WriteMethod
&& ZOrder
&&
&&


&&
&& �±���ʾ����Ͽ�ComboBox��������ԡ��������¼��漰�����⡣
&&
&& ����
&& Alignment
&& Anchor
&& Application
&&
&& BackColor
&& BaseClass
&& BorderColor
&&
&& BorderStyle
&& BoundColumn
&& BoundTo
&&
&& Class
&& ClassLibrary
&& ColorScheme
&&
&& ColorSource
&& ColumnCount
&& ColumnLines
&&
&& ColumnWidths
&& Comment
&& ControlSource
&&
&& DisabledBackColor
&& DisabledForeColor
&& DisabledItemBackColor
&&
&& DisabledItemForeColor
&& DisplayCount
&& DisplayValue
&&
&& DragIcon
&& DragMode
&& Enabled
&&
&& FirstElement
&& FontBold
&& FontCharSet
&&
&& FontCondense
&& FontExtend
&& FontItalic
&&
&& FontName
&& FontOutline
&& FontShadow
&&
&& FontSize
&& FontStrikeThru
&& FontUnderline
&&
&& ForeColor
&& Format
&& Height
&&
&& HelpContextID
&& HideSelection
&& IMEMode
&&
&& IncrementalSearch
&& InputMask
&& ItemBackColor
&&
&& ItemData
&& ItemForeColor
&& ItemIDData
&&
&& ItemTips
&& Left
&& List
&&
&& ListCount
&& ListIndex
&& ListItem
&&
&& ListItemID
&& Margin
&& MaxLength
&&
&& MouseIcon
&& MousePointer
&& Name
&&
&& NewIndex
&& NewItemID
&& NullDisplay
&&
&& NumberOfElements
&& OLEDragMode
&& OLEDragPicture
&&
&& OLEDropEffects
&& OLEDropHasData
&& OLEDropMode
&&
&& OLEDropTextInsertion
&& Parent
&& ParentClass
&&
&& Picture
&& PictureSelectionDisplay
&& ReadOnly
&&
&& RightToLeft
&& RowSource
&& RowSourceType
&&
&& Selected
&& SelectedBackColor
&& SelectedForeColor
&&
&& SelectedID
&& SelectedItemBackColor
&& SelectedItemForeColor
&&
&& SelectOnEntry
&& SelLength
&& SelStart
&&
&& SelText
&& Sorted
&& SpecialEffect
&&
&& StatusBarText
&& Style
&& TabIndex
&&
&& TabStop
&& Tag
&& Text
&&
&& TerminateRead
&& Themes
&& ToolTipText
&&
&& Top
&& TopIndex
&& TopItemID
&&
&& Value
&& Visible
&& WhatsThisHelpID
&&
&& Width
&&  ��
&&  ��
&&
&&
&& ����
&& AddItem
&& AddListItem
&& AddProperty
&&
&& Clear
&& CloneObject
&& Drag
&&
&& IndexToItemID
&& ItemIDToIndex
&& Move
&&
&& OLEDrag
&& ReadExpression
&& ReadMethod
&&
&& Refresh
&& RemoveItem
&& RemoveListItem
&&
&& Requery
&& ResetToDefault
&& SaveAsClass
&&
&& SetFocus
&& SetViewPort
&& ShowWhatsThis
&&
&& WriteExpression
&& WriteMethod
&& ZOrder
&&
&&
&& �¼�
&& Click
&& DblClick
&& Destroy
&&
&& DownClick
&& DragDrop
&& DragOver
&&
&& DropDown
&& Error
&& ErrorMessage
&&
&& GotFocus
&& Init
&& InteractiveChange
&&
&& KeyPress
&& LostFocus
&& Message
&&
&& MiddleClick
&& MouseDown
&& MouseEnter
&&
&& MouseLeave
&& MouseMove
&& MouseUp
&&
&& MouseWheel
&& OLECompleteDrag
&& OLEDragDrop
&&
&& OLEDragOver
&& OLEGiveFeedBack
&& OLESetData
&&
&& OLEStartDrag
&& ProgrammaticChange
&& RangeHigh
&&
&& RangeLow
&& RightClick
&& UIEnable
&&
&& UpClick
&& Valid
&& When
&&