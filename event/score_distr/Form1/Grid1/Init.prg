with this
    .columnCount = 3
    .recordSource = "score_distr"
    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    .highLightRowLineWidth = 0 && ���������ܵĿ�� ..
    .highLightStyle = 2 && ͻ����ʾ��ǰ�в����ֿɼ����л�����Ŀؼ����Ǹ����� ..

    for i = 1 to .columnCount
        .columns(i).controlSource = field(i)
    endfor
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
