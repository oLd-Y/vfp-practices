with this


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
