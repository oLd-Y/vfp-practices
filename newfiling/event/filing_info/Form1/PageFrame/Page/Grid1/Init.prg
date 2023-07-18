with this
    .allowCellSelection = .F.
    .allowHeaderSizing = .F.
    .allowRowSizing = .F.
    .backColor = RGB(248, 248, 248)
    .columnCount = 2
    .deleteMark = .F.
    .fontName = "微软雅黑"
    .FontSize = 11
    .gridLineColor = RGB(147, 147, 147)
    .HeaderHeight = 30
    .RowHeight = 27
    .height = 612
    .highlightForeColor = RGB(0, 0, 0)
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

	.SetAll("Alignment", 1, "Column")
	.SetAll("FontName", "微软雅黑", "Column")
	.SetAll("FontSize", 10, "Column")
	.SetAll("Format", "Z", "Column")
    .Visible = .T.



    .setFocus()
endwith