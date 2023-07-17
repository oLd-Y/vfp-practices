






Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
&& 换行符
br = chr(13)

&& 不加 nowait 则会在关闭表单之后才执行后面的语句，cmd就找不到表单了
&& 不可以添加 save 参数, 否则打开其他表单就无法获取相应的表单对象了 (暂不确定是否为真)
modi form filing_info Nowait
ASelObj(laForm,1)
loForm = laForm[1]
loForm.AddObject("PageFrame1", "PageFrame")
loPageFrame = loForm.PageFrame1
loPage = loForm.AddObject("Page1", "Page")
loPage = PageFrame1.Page1
loPage.AddObject("Grid1", "Grid")
loPage.AddObject("Grid2", "Grid")
Grid1 = loPage.Grid1
Grid2 = loPage.Grid2




with loForm
    .width = 500
    .height = 200
    .ShowWindow = 2 && as top level form
    .Autocenter = .T.
    .Caption = "Main Form Test2"

    .AddProperty("SysInfo", NewObject("SysInfo", "SysInfo.prg")) && 添加系统属性
endwith

with Grid1
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

endwith

with Grid2
    .allowCellSelection = .F.
    .allowHeaderSizing = .F.
    .allowRowSizing = .F.
    .backColor = RGB(248, 248, 248)
    .columnCount = 13
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

endwith


With Page1
    .ActivePage = 1
    .Height = 528
    .Left = 1
    .Name = PageFrame1
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





