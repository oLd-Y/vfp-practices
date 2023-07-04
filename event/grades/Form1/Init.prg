with this.grid1
    .recordSource = "t_score"
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
        .columns(i).Header1.fontSize = 10
        .columns(i).Header1.fontName = "宋体"
        if i < 4
            .Columns(i).backColor = RGB(255, 255, 0)
        endi

        .Columns(i).controlSource = field(i)
    endf
endwith

