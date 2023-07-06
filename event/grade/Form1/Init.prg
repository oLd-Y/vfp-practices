
with this.Grid1
    .recordSource = "student"
    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .LockColumns = 3
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    .highLightRowLineWidth = 0 && 高亮行四周的宽度 ..
    .highLightStyle = 2 && 突出显示当前行并保持可见（切换到别的控件还是高亮） ..

    for i = 1 to 13
        .columns(i).Header1.alignment = 2
        .columns(i).movable = .F.
        .columns(i).Header1.alignment = 2
        .columns(i).Header1.fontBold = .T.
        .columns(i).Header1.fontSize = 8
        .columns(i).Header1.fontName = "宋体"
        if i < 4
            .Columns(i).backColor = RGB(255, 255, 0)
        endi

&&         .Columns(i).controlSource = field(i)
    endfor

    && create table m.pub_path + "t_score" ( ;
    &&     pass_num C(8), ;
    &&     id_card C(18), ;
    &&     stu_name C(8), ;
    &&     high_name C(30), ;
    &&     all_score N(3), ;
    &&     chinese N(3), ;
    &&     math N(3), ;
    &&     english N(3), ;
    &&     composite N(3), ;
    &&     rank N(6), ;
    &&     volu_name1 C(30), ;
    &&     volu_name2 C(30), ;
    &&     volu_name3 C(30) ;
    && )

    .columns(1).controlSource = "student.pass_num"
    .columns(2).controlSource = "student.id_card"
    .columns(3).controlSource = "student.stu_name"
    .columns(4).controlSource = "highSchool.high_name"
    .columns(5).controlSource = "score.all_score"
    .columns(6).controlSource = "score.chinese"
    .columns(7).controlSource = "score.math"
    .columns(8).controlSource = "score.english"
    .columns(9).controlSource = "score.composite"
    .columns(10).controlSource = recn("score")
    .columns(11).controlSource = "university1.univ_name"
    .columns(12).controlSource = "university2.univ_name"
    .columns(13).controlSource = "university3.univ_name"

endwith

