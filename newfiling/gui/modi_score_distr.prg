Local Array laForm[1]
Local loForm1
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"

&& ���� nowait ����ڹرձ���֮���ִ�к������䣬cmd���Ҳ���������
&& (�٣����������� save ����, ����������������޷���ȡ��Ӧ�ı��������� (�ݲ�ȷ���Ƿ�Ϊ��)
modi form score_distr NOWAIT SAVE in screen
&& WAIT WINDOW "Loading form..." TIMEOUT 3
ASelObj(laForm,1)


&& �ɼ��ֲ����� Form1
loForm1 = laForm[1]
with loForm1
    .AddProperty("SysInfo", NewObject("SysInfo", "SysInfo.prg")) && ���ӱ���ϵͳ��Ϣ

    .Left = 0
    .Top = 0
    .Width = loForm1.SysInfo.FormW()
    .Height = loForm1.SysInfo.FormH()

    .Autocenter = .T.
    .BackColor = RGB(237, 234, 216)
    .BorderStyle = 1 && �ɵ��߿�(Ĭ��)
    .Caption = "�ɼ��ֲ�"
    .Closable = .T.
    .ControlBox = .T.
    .Enabled = .T.
    .FontSize = 9
    .MaxButton = .F.
    .MinButton = .T.
    .Movable = .T.
    .ScrollBars = 0 && ��
    .ShowWindow = 1 && �ڶ��������
    .SizeBox = .F.
    .Themes = .T.
    .TitleBar = 1 && ��
    .Visible = .F.
    .WindowState = 0 && ��ͨ
    .WindowType = 1 && ģʽ
    .ZoomBox = .F.

endwith

&& ҳ�� PageFrame1
loPageFrame = loForm1.PageFrame1
With loPageFrame

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

&& ��һҳ Page1
loPage1 = loPageFrame.Page1
With loPage1

    .BackColor = RGB(192, 216, 243)

EndWith

&& �ɼ��ֲ����� Grid1
loGrid1 = loPage1.Grid1
with loGrid1

    .AllowCellSelection = .F.
    .AllowHeaderSizing = .F.
    .AllowRowSizing = .F.
    .BackColor = RGB(248, 248, 248)
    .ColumnCount = 3
    .DeleteMark = .F.
    .FontName = "΢���ź�"
    .FontSize = 11
    .GridLineColor = RGB(147, 147, 147)
    .HeaderHeight = 30
    .RowHeight = 27
    .Height = 612
    .HighlightForeColor = RGB(0, 0, 0)
    .HighlightStyle = 2 && �������������ָ����ɼ�
    .Left = 0
    .Panel = 1 && ��
    .ReadOnly = .T.
    .RecordMark = .F.
    .RecordSource = "score_distr"
    .RecordSourceType = 1
    .RowHeight = 22
    .ScrollBars = 3 && ��ˮƽ�ִ�ֱ(Ĭ��)
    .SplitBar = .F.
    .TabIndex = 1
    && û����ȡ��Form1.Load����������ʱ���ӵı���
    .Top = loForm1.SysInfo.PFGridT()
    .Width = loForm1.SysInfo.PFGridW()
    .Height = loForm1.SysInfo.PFGridH()

	.SetAll("Alignment", 2, "Header")
	.SetAll("backColor", RGB(210, 210, 210), "Header")
	.SetAll("FontName", "΢���ź�", "Header")
	.SetAll("FontSize", 11, "Header")

	.SetAll("Alignment", 2, "Column")
	.SetAll("FontName", "΢���ź�", "Column")
	.SetAll("FontSize", 10, "Column")
	.SetAll("Format", "Z", "Column")
    .Visible = .T.

    .Columns(1).FontName = "Calibri"
    .Columns(1).FontSize = 12
    .Columns(1).Header1.Caption = "�ܷ�"
    .Columns(1).Width = 10 * 10

    .Columns(2).Header1.Caption = "����"
    .Columns(2).Width = 10 * 8

    .Columns(3).Header1.Caption = "�ۼ�����"
    .Columns(3).Width = 10 * 8

    for i = 1 to .ColumnCount
        .columns(i).controlSource = field(i)
    endfor


    .SetFocus()

&&     For i = 1 To loGrid1.ColumnCount
&&         loGrid1.Width = loGrid1.Width * IIF(i = 1, 0, 1) + loGrid1.Columns(i).Width
&&     EndFor
&&     loGrid1.Width = loGrid1.Width + 22

endwith

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
    .Visible = .T.
    .Width = 200


EndWith

&& ��ʶ�� Shape2
loShape2 = loPage1.Shape2
With loShape2

    .BackColor = RGB(156, 181, 232)
    .BorderStyle = 0 && ͸��
    .Height = 18
    .Left = 4
    .Top = 71
    .Width = 487
EndWith


&& ����ΪExcel��ť Command1
loCommand1 = loPage1.Command1
With loCommand1

    .AutoSize = .T.
    .BackColor = RGB(192, 216, 243)
    .Caption = "����ΪExcel"
    .FontName = "΢���ź�"
    .FontSize = 9
    .ForeColor = RGB(16, 48, 96)
    .TabIndex = 27
    .Width = 120

EndWith

&& �鿴���鰴ť Command2
loCommand2 = loPage1.Command2
With loCommand2

    .AutoSize = .F.
    .BackColor = RGB(192, 216, 243)
    .Caption = "�鿴����"
    .FontName = "΢���ź�"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Height = 29
&&     .Left = 104
    .TabIndex = 27
&&     .Top = 38
    .Width = 80

EndWith

&& �������ã����ù���������

&& ��һ���·�����״
loShape2.Width = loShape1.Width - 2

&& ����ΪExcel��ť
loCommand1.Left = loShape1.Left + 10
loCommand1.Top = loShape1.Top + 25

&& �鿴���鰴ť
loCommand2.Left = loCommand1.Left + loCommand1.Width + 10
loCommand2.Top = loCommand1.Top

do cp2score_distr


























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