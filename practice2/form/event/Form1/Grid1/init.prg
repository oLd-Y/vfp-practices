with this
    
	for i = 1 to 13
		.Columns(i).Movable = .F.
		.Columns(i).Header1.Alignment = 2
		.Columns(i).Header1.FontBold = .T.
		.Columns(i).Header1.FontSize = 10
		.Columns(i).Header1.FontName = "宋体"
		if i < 4
			.Columns(i).BackColor = RGB(255, 255, 0)
		endi

		.Columns(i).ControlSource = field(i)
	endf
	.LockColumns = 3

	*!*	 .column1.controlsource = "t_score.pass_num"
	*!*	 .column2.controlsource = "t_score.id_card"
	*!*	 .column3.controlsource = "t_score.stu_name"
	*!*	 .column4.controlsource = "t_score.high_name"
	*!*	 .column5.controlsource = "t_score.all_score"
	*!*	 .column6.controlsource = "t_score.chinese"
	*!*	 .column7.controlsource = "t_score.math"
	*!*	 .column8.controlsource = "t_score.english"
	*!*	 .column9.controlsource = "t_score.composite"
	*!*	 .column11.controlsource = "t_score.volu1_name"
	*!*	 .column12.controlsource = "t_score.volu2_name"
	*!*	 .column13.controlsource = "t_score.volu3_name"
endw
