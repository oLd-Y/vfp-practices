with this
	for i = 1 to 13
		.Columns(i).movable = .F.
		.Columns(i).Header1.Alignment = 2
		.Columns(i).Header1.FontBold = .T.
		.Columns(i).Header1.FontSize = 10
		.Columns(i).Header1.FontName = "宋体"
		if i < 4
			.Columns(i).BackColor = RGB(255, 255, 0)
		endi
	endf
	.LockColumns = 3

	.column1.controlsource = "student.pass_num"
	.column2.controlsource = "student.id_card"
	.column3.controlsource = "student.name"
	.column4.controlsource = "highschool.high_name"
	.column5.controlsource = "score.all_score"
	.column6.controlsource = "score.chinese"
	.column7.controlsource = "score.math"
	.column8.controlsource = "score.english"
	.column9.controlsource = "score.composite"
	.column11.controlsource = "student.volu1"
	.column12.controlsource = "student.volu2"
	.column13.controlsource = "student.volu3"
endw
