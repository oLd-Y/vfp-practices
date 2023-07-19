with this
    .columnCount = 3
    .recordSource = "score_distr"
    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    .highLightRowLineWidth = 0 && 高亮行四周的宽度 ..
    .highLightStyle = 2 && 突出显示当前行并保持可见（切换到别的控件还是高亮） ..

    for i = 1 to .columnCount
        .columns(i).controlSource = field(i)
    endfor
	for i = 1 to 3
	    .columns(i).Header1.alignment = 2
		.columns(i).Movable = .F.
		.columns(i).Header1.Alignment = 2
		.columns(i).Header1.FontBold = .T.
		.columns(i).Header1.FontSize = 10
		.columns(i).Header1.FontName = "宋体"
        
		.columns(i).controlSource = field(i)
	endf


    .columns(1).Header1.Caption = "总分"
    .columns(2).Header1.Caption = "人数比例"
    .columns(3).Header1.Caption = "累计人数"
endwith
