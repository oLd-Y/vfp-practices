Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
&& 换行符
br = chr(13)

&& 不加 nowait 则会在关闭表单之后才执行后面的语句，cmd就找不到表单了
&& (假）不可以添加 save 参数, 否则打开其他表单就无法获取相应的表单对象了 (暂不确定是否为真)
modi form filing_info NOWAIT Save
IF !IsNull(_Screen.ActiveForm)
    _Screen.ActiveForm.SetFocus()
ENDIF
ASelObj(laForm,1)
loForm = laForm[1]
&& PageFrames
loPageFrame = loForm.PageFrame1

&& Pages
loPage = loPageFrame.Page1

&& Grids
loGrid1 = loPage.Grid1
loGrid2 = loPage.Grid2

&& TextBoxes
loText1 = loPage.Text1
loText2 = loPage.Text2
loText3 = loPage.Text3

&& Shapes
loShape1 = loPage.Shape1
loShape2 = loPage.Shape2

&& ComboBoxes
loCombo1 = loPage.Combo1

&& CommandButtons
loCommand1 = loPage.Command1
loCommand2 = loPage.Command2
loCommand3 = loPage.Command3

&& Labels
loLabel1 = loPage.Label1
loLabel2 = loPage.Label2





with loForm
    .AddProperty("SysInfo", NewObject("SysInfo", "SysInfo.prg")) && 添加表单系统信息

    .Autocenter = .T.
    .BackColor = RGB(237, 234, 216)
    .BorderStyle = 1 && 可调边框(默认)
    .Caption = "投档信息"
    .Closable = .T.
    .ControlBox = .T.
    .Enabled = .T.
    .FontSize = 9
    .Height = loForm.SysInfo.FormH()
    .Left = 0
    .MaxButton = .F.
    .MinButton = .T.
    .Movable = .T.
    .ScrollBars = 0 && 无
    .ShowWindow = 2 && 作为顶层表单
    .SizeBox = .F.
    .Themes = .T.
    .TitleBar = 1 && 打开
    .Top = 0
    .Visible = .F.
    .Width = loForm.SysInfo.FormW()
    .WindowState = 0 && 普通
    .WindowType = 1 && 模式
    .ZoomBox = .F.
endwith

With loPageFrame
    .ActivePage = 1
    .Height = 528
    .Left = 1
    .Name = "PageFrame1"
    .PageCount = 1
    .TabIndex = 1
    .TabOrientation = 0 && 上(默认)
    .TabStretch = 0 && 多重行
    .TabStyle = 1 && 非两端
    .Themes = .F.
    .Top = 0
    .Width = loForm.SysInfo.FormW()
    .Height = loForm.SysInfo.FormH()

EndWith


With loPage
    .BackColor = RGB(192, 216, 243)

EndWith

&& Grids
with loGrid1

    .AllowCellSelection = .F.
    .AllowHeaderSizing = .F.
    .AllowRowSizing = .F.
    .BackColor = RGB(248, 248, 248)
    .ColumnCount = 2
    .DeleteMark = .F.
    .FontName = "微软雅黑"
    .FontSize = 11
    .GridLineColor = RGB(147, 147, 147)
    .HeaderHeight = 30
    .RowHeight = 27
    .Height = 612
    .HighlightForeColor = RGB(0, 0, 0)
    .HighlightStyle = 2 && 允许高亮并保持高亮可见
    .Left = 0
    .Panel = 1 && 右
    .ReadOnly = .T.
    .RecordMark = .F.
    .RecordSource = "university"
    .RecordSourceType = 1
    .RowHeight = 22
    .ScrollBars = 3 && 既水平又垂直(默认)
    .SplitBar = .F.
    .TabIndex = 1
    && 没法获取在Form1.Load方法中运行时添加的表单
    .Top = loForm.SysInfo.PFGridT()
    .Width = loForm.SysInfo.PFGridW()
    .Height = loForm.SysInfo.PFGridH()

	.SetAll("Alignment", 2, "Header")
	.SetAll("backColor", RGB(210, 210, 210), "Header")
	.SetAll("FontName", "微软雅黑", "Header")
	.SetAll("FontSize", 11, "Header")

	.SetAll("Alignment", 2, "Column")
	.SetAll("FontName", "微软雅黑", "Column")
	.SetAll("FontSize", 10, "Column")
	.SetAll("Format", "Z", "Column")
    .Visible = .T.

    .Columns(1).ControlSource = "university.univ_name"
    .Columns(1).FontName = "Calibri"
    .Columns(1).FontSize = 12
    .Columns(1).Header1.Caption = "大学名称"
    .Columns(1).Width = 10 * 20

    .Columns(2).ControlSource = "university.univ_code"
    .Columns(2).Header1.Caption = "大学代码"
    .Columns(2).Width = 10 * 8

    For i = 1 To loGrid1.ColumnCount
        loGrid1.Width = loGrid1.Width * IIF(i = 1, 0, 1) + loGrid1.Columns(i).Width
    EndFor
    loGrid1.Width = loGrid1.Width + 22

endwith

with loGrid2

    && --------------------- Grid 属性设置 ---------------------
    .AllowCellSelection = .F.
    .AllowHeaderSizing = .F.
    .AllowRowSizing = .F.
    .BackColor = RGB(248, 248, 248)
    .ColumnCount = 13
    .DeleteMark = .F.
    .FontName = "微软雅黑"
    .FontSize = 11
    .GridLineColor = RGB(147, 147, 147)
    .HeaderHeight = 30
    .RowHeight = 27
    .Height = 612
    .HighlightForeColor = RGB(0, 0, 0)
    .HighlightStyle = 2 && 允许高亮并保持高亮可见
    .Left = loGrid1.Left + loGrid1.Width
    .Panel = 1 && 右
    .ReadOnly = .T.
    .RecordMark = .F.
    .RecordSource = "score"
    .RecordSourceType = 1
    .RowHeight = 22
    .ScrollBars = 3 && 既水平又垂直(默认)
    .SplitBar = .F.
    .TabIndex = 1
    .Top = loForm.SysInfo.PFGridT()
    .Width = loForm.SysInfo.PFGridW() - loGrid2.Left
    .Height = loForm.SysInfo.PFGridH()
    .Visible = .T.

    && --------------------- Grid 子属性设置 ---------------------
	.SetAll("Alignment", 2, "Header")
	.SetAll("backColor", RGB(210, 210, 210), "Header")
	.SetAll("FontName", "微软雅黑", "Header")
	.SetAll("FontSize", 11, "Header")

	.SetAll("Alignment", 2, "Column")
	.SetAll("FontName", "微软雅黑", "Column")
	.SetAll("FontSize", 10, "Column")
	.SetAll("Format", "Z", "Column")

    .Columns(1).ControlSource = "student.pass_num"
    .Columns(1).Width = 8 * 10
    .Columns(1).Header1.Caption = "准考证号"

    .Columns(2).ControlSource = "student.id_card"
    .Columns(2).Width = 8 * 20
    .Columns(2).Header1.Caption = "身份证号"

    .Columns(3).ControlSource = "student.stu_name"
    .Columns(3).Width = 8 * 8
    .Columns(3).Header1.Caption = "学生姓名"

    .Columns(4).ControlSource = "highSchool.high_name"
    .Columns(4).Width = 8 * 24
    .Columns(4).Header1.Caption = "高中名称"

    .Columns(5).ControlSource = "score.all_score"
    .Columns(5).Header1.Caption = "总分"
    .Columns(5).Width = 8 * 6

    .Columns(6).ControlSource = "score.chinese"
    .Columns(6).Header1.Caption = "语文"
    .Columns(6).Width = 8 * 6

    .Columns(7).ControlSource = "score.math"
    .Columns(7).Header1.Caption = "数学"
    .Columns(7).Width = 8 * 6

    .Columns(8).ControlSource = "score.english"
    .Columns(8).Header1.Caption = "英语"
    .Columns(8).Width = 8 * 6

    .Columns(9).ControlSource = "score.composite"
    .Columns(9).Header1.Caption = "综合"
    .Columns(9).Width = 8 * 6

    .Columns(10).ControlSource = "rank.rank"
    .Columns(10).Header1.Caption = "排名"
    .Columns(10).Width = 8 * 6

    .Columns(11).ControlSource = "university1.univ_name"
    .Columns(11).Header1.Caption = "第一志愿"
    .Columns(11).Width = 8 * 22

    .Columns(12).ControlSource = "university2.univ_name"
    .Columns(12).Header1.Caption = "第二志愿"
    .Columns(12).Width = 8 * 22

    .Columns(13).ControlSource = "university3.univ_name"
    .Columns(13).Header1.Caption = "第三志愿"
    .Columns(13).Width = 8 * 22

endwith

&& TextBoxes
With loText1

    .Alignment = 2 && 居中
    .BackColor = RGB(222, 234, 250)
    .BackStyle = 1 && 不透明
    .BorderColor = RGB(63, 123, 200)
    .BorderStyle = 1 && 固定单线
    .FontName = "微软雅黑"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Format = "K"
    .Height = 25
    .Left = 41
    .Margin = 1
    .MaxLength = 6
    .Themes = .F.
    .Top = 11
    .Width = 64

EndWith

With loText2



EndWith

With loText3

    .BackColor = RGB(222, 234, 250)
    .BackStyle = 1 && 不透明
    .BorderColor = RGB(63, 123, 200)
    .BorderStyle = 1 && 固定单线
    .FontName = "微软雅黑"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Format = "K"
    .Height = 25
&&     .Left = 0
    .Margin = 1
    .MaxLength = 6
    .Themes = .F.
&&     .Top = 40
    .Width = 100

EndWith

&& Shapes
With loShape1

    .BackStyle = 0 && 透明
    .BorderColor = RGB(87, 121, 215)
    .Curvature = 5 && 指定形状控件的角的曲率
    .FillStyle = 1 && 透明
    .Height = 86
    .Left = 3
    .SpecialEffect = 0 && 3维
    .Top = 4
    .Visible = .T.
    .Width = 489

EndWith

With loShape2

    .BackColor = RGB(156, 181, 232)
    .BorderStyle = 0 && 透明
    .Height = 18
    .Left = 4
    .Top = 71
    .Width = 487

EndWith

&& ComboBoxes
With loCombo1

    .Alignment = 0 && 左（默认）
    .BackColor = RGB(222, 234, 250)
    .BorderColor = RGB(63, 123, 200)
    .DisplayCount = 3 && 下拉框中的行的个数
    .FontName = "微软雅黑"
    .FontSize = 11
    .ForeColor = RGB(16, 48, 96)
    .Height = 23
    .ItemForeColor = RGB(16, 48, 96)
    .Left = 41
    .Margin = 0
    .RowSource = "全部," + "学生姓名, 高中名称, 身份证号"
    .RowSourceType = 1
    .SpecialEffect = 1 && 平面
    .Style = 2 && 下拉列表框
    .TabIndex = 3
    .Top = 40
    .Width = 99
    .Value = "全部"

EndWith

&& CommandButtons
With loCommand1

    .AutoSize = .F.
    .BackColor = RGB(192, 216, 243)
    .Caption = "打印报表"
    .FontName = "微软雅黑"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Height = 29
&&     .Left = 104
    .TabIndex = 27
&&     .Top = 38
    .Width = 35

EndWith

With loCommand2

    .AutoSize = .F.
    .BackColor = RGB(192, 216, 243)
    .Caption = "查询"
    .FontName = "微软雅黑"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Height = 29
&&     .Left = 104
    .TabIndex = 27
&&     .Top = 38
    .Width = 35

EndWith

With loLabel1

    .Alignment = 1 && 左（默认）
    .AutoSize = .T.
    .BackStyle = 0 && 透明
    .BorderStyle = 8 && 无（默认）
    .Caption = "最低投档分数"
    .FontName = "微软雅黑"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Height = 21
    .TabIndex = 36
    .Width = 28


EndWith

With loLabel2

    .Alignment = 1 && 左（默认）
    .AutoSize = .T.
    .BackStyle = 0 && 透明
    .BorderStyle = 8 && 无（默认）
    .Caption = "最低投档名次"
    .FontName = "微软雅黑"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Height = 21
    .TabIndex = 36
    .Width = 28

EndWith

&& 跟随设置，设置关联的属性
loText3.Height = loCombo1.Height
loText3.Top = loCombo1.Top
loText3.Left = loCombo1.Width + 50

loCommand2.Top = loText3.Top
loCommand2.Left = loText3.Left + loText3.Width + 5

loLabel1.Top = loCombo1.Top - loLabel1.Height -3
loLabel1.Left = loCombo1.Left


do prgSyncForm


&&
&& 下表列示了命令按钮CommandButton对象的属性、方法和事件涉及的主题。
&&
&& 属性
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
&& OLEDropHasData 属性
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
&& 方法
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
&& 事件
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
&& 下表列示了标签Label对象的属性、方法和事件涉及的主题。
&&
&& 属性
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
&& 事件
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
&& 方法
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
&& 下表列示了组合框ComboBox对象的属性、方法和事件涉及的主题。
&&
&& 属性
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
&&  　
&&  　
&&
&&
&& 方法
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
&& 事件
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
