&& ��ʼ�� Grid1
with thisForm.grid1
    .columnCount = 2
    .recordSource = "university"
    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    && ���������ܵĿ��
    .highLightRowLineWidth = 0
    && ͻ����ʾ��ǰ�в����ֿɼ����л�����Ŀؼ����Ǹ�����
    .highLightStyle = 2

    && ��ʼ�����б���
    .column1.Header1.caption = "��ѧ����"
    .column2.Header1.caption = "��ѧ����"

    && ��ʼ����������Դ
    .column1.controlSource = "university.univ_code"
    .column2.controlSource = "university.univ_name"

endwith


&& ��ʼ�� Grid2
with thisForm.grid2
    .recordSource = "score"
    .columnCount = 13
    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .LockColumns = 3
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    .highLightRowLineWidth = 0
    .highLightStyle = 2

    && ͳһ���ø��е�����
    for i = 1 to 13
        .columns(i).movable = .F.

        && ���о���
        .columns(i).alignment = 2
        && ���������
        .columns(i).Header1.alignment = 2
        .columns(i).Header1.fontBold = .T.
        .columns(i).Header1.fontSize = 8
        .columns(i).Header1.fontName = "����"
        if i < 4
            .Columns(i).backColor = RGB(255, 255, 0)
        endi
    endfor

    && ����Ϊ���еĸ��Ի�����
    && ��ʼ�����еı���
    .columns(1).Header1.caption = "׼��֤��"
    .columns(2).Header1.caption = "���֤��"
    .columns(3).Header1.caption = "����"
    .columns(4).Header1.caption = "��������"
    .columns(5).Header1.caption = "�ܷ�"
    .columns(6).Header1.caption = "����"
    .columns(7).Header1.caption = "��ѧ"
    .columns(8).Header1.caption = "Ӣ��"
    .columns(9).Header1.caption = "�ۺ�"
    .columns(10).Header1.caption = "����"
    .columns(11).Header1.caption = "��һ־Ը"
    .columns(12).Header1.caption = "�ڶ�־Ը"
    .columns(13).Header1.caption = "����־Ը"



    && ��ʼ�����е�����Դ
    .columns(1).controlSource = "student.pass_num"
    .columns(2).controlSource = "student.id_card"
    .columns(3).controlSource = "student.stu_name"
    .columns(4).controlSource = "highSchool.high_name"
    .columns(5).controlSource = "score.all_score"
    .columns(6).controlSource = "score.chinese"
    .columns(7).controlSource = "score.math"
    .columns(8).controlSource = "score.english"
    .columns(9).controlSource = "score.composite"
    .columns(10).controlSource = "rank.rank"
    .columns(11).controlSource = "university1.univ_name"
    .columns(12).controlSource = "university2.univ_name"
    .columns(13).controlSource = "university3.univ_name"

endwith

with thisForm.text1
    .value = thisForm.grid1.column1.text1.value
    .alignment = 2
endwith

with thisForm.text2
    .value = thisForm.grid1.column1.text1.value
    .alignment = 2
endwith

with thisForm.label1
    .caption = "���Ͷ������"
    .alignment = 2
endwith

with thisForm.label2
    .caption = "���Ͷ������"
    .alignment = 2
endwith
