with this.grid1
    .recordSource = "t_distr"
    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    .highLightRowLineWidth = 0 && ���������ܵĿ�� ..
    .highLightStyle = 2 && ͻ����ʾ��ǰ�в����ֿɼ����л�����Ŀؼ����Ǹ����� ..
endwith

with this.command1
    .caption = "����Ϊexcel"
endwith