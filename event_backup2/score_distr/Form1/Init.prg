with thisform

with this.grid1
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
endwith

with this.command1
    .caption = "����Ϊexcel"
endwith