with this


	for i = 1 to 3
	    .columns(i).Header1.alignment = 2
		.columns(i).Movable = .F.
		.columns(i).Header1.Alignment = 2
		.columns(i).Header1.FontBold = .T.
		.columns(i).Header1.FontSize = 10
		.columns(i).Header1.FontName = "����"
        
		.columns(i).controlSource = field(i)
	endf


    .columns(1).Header1.Caption = "�ܷ�"
    .columns(2).Header1.Caption = "��������"
    .columns(3).Header1.Caption = "�ۼ�����"
endwith
