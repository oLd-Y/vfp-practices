with this.grid1
    .recordSource = "t_distr"
    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    .highLightRowLineWidth = 0 && 高亮行四周的宽度 ..
    .highLightStyle = 2 && 突出显示当前行并保持可见（切换到别的控件还是高亮） ..
endwith

with this.command1
    .caption = "导出为excel"
endwith