with this
    .recordSource = "score"

    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .LockColumns = 3
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    .highLightRowLineWidth = 0 && 高亮行四周的宽度 ..
    .highLightStyle = 2 && 突出显示当前行并保持可见（切换到别的控件还是高亮） ..

	.fontSize = 11
	.headerHeight = 30
	.rowHeight = 27
	.readOnly = .T.

	.SetAll("Alignment", 2, "Header")
	.SetAll("FontName", "微软雅黑", "Header")
	.SetAll("FontSize", 12, "Header")

	.SetAll("Alignment", 2, "Column")
	.SetAll("FontName", "微软雅黑", "Column")
	.SetAll("FontSize", 10, "Column")
	.setAll("fontBold", .F., "Column")
	.SetAll("Format", "Z", "Column")
	.SetAll("Width", 90, "Column")
	.setAll("movable", .F., "Column")

    for i = 1 to 3
        .columns(i).backColor = RGB(255, 255, 0)
    endfor

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
