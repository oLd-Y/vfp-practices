Local Array laForm[1]
Local loForm1
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"

&& 不加 nowait 则会在关闭表单之后才执行后面的语句，cmd就找不到表单了
&& (假）不可以添加 save 参数, 否则打开其他表单就无法获取相应的表单对象了 (暂不确定是否为真)
modi form score_distr NOWAIT SAVE in screen
&& WAIT WINDOW "Loading form..." TIMEOUT 3
ASelObj(laForm,1)


&& 成绩分布表单 Form1
loForm1 = laForm[1]
with loForm1
    .AddProperty("SysInfo", NewObject("SysInfo", "SysInfo.prg")) && 添加表单系统信息

    .Left = 0
    .Top = 0
    .Width = loForm1.SysInfo.FormW()
    .Height = loForm1.SysInfo.FormH()

    .Autocenter = .T.
    .BackColor = RGB(237, 234, 216)
    .BorderStyle = 1 && 可调边框(默认)
    .Caption = "成绩分布"
    .Closable = .T.
    .ControlBox = .T.
    .Enabled = .T.
    .FontSize = 9
    .MaxButton = .F.
    .MinButton = .T.
    .Movable = .T.
    .ScrollBars = 0 && 无
    .ShowWindow = 1 && 在顶层表单中
    .SizeBox = .F.
    .Themes = .T.
    .TitleBar = 1 && 打开
    .Visible = .F.
    .WindowState = 0 && 普通
    .WindowType = 1 && 模式
    .ZoomBox = .F.

endwith

&& 页框 PageFrame1
loPageFrame = loForm1.PageFrame1
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
    .Width = loForm1.SysInfo.FormW()
    .Height = loForm1.SysInfo.FormH()

EndWith

&& 第一页 Page1
loPage1 = loPageFrame.Page1
With loPage1

    .BackColor = RGB(192, 216, 243)

EndWith

&& 成绩分布表格 Grid1
loGrid1 = loPage1.Grid1
with loGrid1

    .AllowCellSelection = .F.
    .AllowHeaderSizing = .F.
    .AllowRowSizing = .F.
    .BackColor = RGB(248, 248, 248)
    .ColumnCount = 3
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
    .RecordSource = "score_distr"
    .RecordSourceType = 1
    .RowHeight = 22
    .ScrollBars = 3 && 既水平又垂直(默认)
    .SplitBar = .F.
    .TabIndex = 1
    && 没法获取在Form1.Load方法中运行时添加的表单
    .Top = loForm1.SysInfo.PFGridT()
    .Width = loForm1.SysInfo.PFGridW()
    .Height = loForm1.SysInfo.PFGridH()

	.SetAll("Alignment", 2, "Header")
	.SetAll("backColor", RGB(210, 210, 210), "Header")
	.SetAll("FontName", "微软雅黑", "Header")
	.SetAll("FontSize", 11, "Header")

	.SetAll("Alignment", 2, "Column")
	.SetAll("FontName", "微软雅黑", "Column")
	.SetAll("FontSize", 10, "Column")
	.SetAll("Format", "Z", "Column")
    .Visible = .T.

    .Columns(1).FontName = "Calibri"
    .Columns(1).FontSize = 12
    .Columns(1).Header1.Caption = "总分"
    .Columns(1).Width = 10 * 10

    .Columns(2).Header1.Caption = "人数"
    .Columns(2).Width = 10 * 8

    .Columns(3).Header1.Caption = "累计人数"
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

&& 外层框 Shape1
loShape1 = loPage1.Shape1
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
    .Width = 200


EndWith

&& 标识框 Shape2
loShape2 = loPage1.Shape2
With loShape2

    .BackColor = RGB(156, 181, 232)
    .BorderStyle = 0 && 透明
    .Height = 18
    .Left = 4
    .Top = 71
    .Width = 487
EndWith


&& 导出为Excel按钮 Command1
loCommand1 = loPage1.Command1
With loCommand1

    .AutoSize = .T.
    .BackColor = RGB(192, 216, 243)
    .Caption = "导出为Excel"
    .FontName = "微软雅黑"
    .FontSize = 9
    .ForeColor = RGB(16, 48, 96)
    .TabIndex = 27
    .Width = 120

EndWith

&& 查看详情按钮 Command2
loCommand2 = loPage1.Command2
With loCommand2

    .AutoSize = .F.
    .BackColor = RGB(192, 216, 243)
    .Caption = "查看详情"
    .FontName = "微软雅黑"
    .FontSize = 10
    .ForeColor = RGB(16, 48, 96)
    .Height = 29
&&     .Left = 104
    .TabIndex = 27
&&     .Top = 38
    .Width = 80

EndWith

&& 跟随设置，设置关联的属性

&& 第一个下方的形状
loShape2.Width = loShape1.Width - 2

&& 导出为Excel按钮
loCommand1.Left = loShape1.Left + 10
loCommand1.Top = loShape1.Top + 25

&& 查看详情按钮
loCommand2.Left = loCommand1.Left + loCommand1.Width + 10
loCommand2.Top = loCommand1.Top

do cp2score_distr


























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
