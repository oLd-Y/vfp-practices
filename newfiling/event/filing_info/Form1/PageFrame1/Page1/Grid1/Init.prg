with this
    .allowCellSelection = .F.
    .allowHeaderSizing = .F.
    .allowRowSizing = .F.
    .backColor = RGB(248, 248, 248)
    .columnCount = 2
    .deleteMark = .F.
    .fontName = "΢���ź�"
    .FontSize = 11
    .gridLineColor = RGB(147, 147, 147)
    .HeaderHeight = 30
    .RowHeight = 27
    .height = 612
    .highlightForeColor = RGB(0, 0, 0)
    .HighlightStyle = 2 && ������������ָ����ɼ�
    .Left = 0
    .Panel = 1 && ��
    .ReadOnly = .T.
    .RecordMark = .F.
    .RecordSource = "university"
    .RecordSourceType = 1
    .RowHeight = 22
    .ScrollBars = 3 && ��ˮƽ�ִ�ֱ(Ĭ��)
    .SplitBar = .F.
    .TabIndex = 1
    && û����ȡ��Form1.Load����������ʱ��ӵı�
    .Top = loForm.SysInfo.PFGridT()
    .Width = loForm.SysInfo.PFGridW()
    .Height = loForm.SysInfo.PFGridH()

	.SetAll("Alignment", 2, "Header")
	.SetAll("backColor", RGB(210, 210, 210), "Header")
	.SetAll("FontName", "΢���ź�", "Header")
	.SetAll("FontSize", 11, "Header")

	.SetAll("Alignment", 1, "Column")
	.SetAll("FontName", "΢���ź�", "Column")
	.SetAll("FontSize", 10, "Column")
	.SetAll("Format", "Z", "Column")
    .Visible = .T.



    .setFocus()
endwith