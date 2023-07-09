with thisForm
    .height = sysmetric(22) - 18
    .width = sysmetric(21)
endwith

&& 初始化 Grid1
with thisForm.grid1

    .setFocus()


endwith


&& 初始化 Grid2
with thisForm.grid2





endwith

with thisForm.text1
    .value = thisForm.grid1.column1.text1.value
endwith

with thisForm.text2
    .value = thisForm.grid1.column1.text1.value
endwith


