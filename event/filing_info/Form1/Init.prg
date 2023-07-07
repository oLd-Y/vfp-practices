&& 初始化 Grid1
with thisForm.grid1
    .columnCount = 2
    .recordSource = "university"
    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    && 高亮行四周的宽度
    .highLightRowLineWidth = 0
    && 突出显示当前行并保持可见（切换到别的控件还是高亮）
    .highLightStyle = 2

    && 初始化各列标题
    .column1.Header1.caption = "大学代码"
    .column2.Header1.caption = "大学名称"

    && 初始化各行数据源
    .column1.controlSource = "university.univ_code"
    .column2.controlSource = "university.univ_name"

endwith


&& 初始化 Grid2
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

    && 统一设置各列的属性
    for i = 1 to 13
        .columns(i).movable = .F.

        && 各列居中
        .columns(i).alignment = 2
        && 各标题居中
        .columns(i).Header1.alignment = 2
        .columns(i).Header1.fontBold = .T.
        .columns(i).Header1.fontSize = 8
        .columns(i).Header1.fontName = "宋体"
        if i < 4
            .Columns(i).backColor = RGB(255, 255, 0)
        endi
    endfor

    && 以下为各列的个性化设置
    && 初始化各列的标题
    .columns(1).Header1.caption = "准考证号"
    .columns(2).Header1.caption = "身份证号"
    .columns(3).Header1.caption = "姓名"
    .columns(4).Header1.caption = "高中名称"
    .columns(5).Header1.caption = "总分"
    .columns(6).Header1.caption = "语文"
    .columns(7).Header1.caption = "数学"
    .columns(8).Header1.caption = "英语"
    .columns(9).Header1.caption = "综合"
    .columns(10).Header1.caption = "排名"
    .columns(11).Header1.caption = "第一志愿"
    .columns(12).Header1.caption = "第二志愿"
    .columns(13).Header1.caption = "第三志愿"



    && 初始化各列的数据源
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
    .caption = "最低投档分数"
    .alignment = 2
endwith

with thisForm.label2
    .caption = "最低投档名次"
    .alignment = 2
endwith
