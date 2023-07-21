loPage1 = This.Parent

cond = "stu_name = '" + loPage1.Text3.Value + "'"

lcCombo1Value = this.Parent.Combo1.value
lcCurStuName = ""
lcCurHighName = ""
lcCurPassNum = ""

? lcCombo1Value
if lcCombo1Value = "学生姓名" .AND. !Empty(AllTrim(loPage1.text3.value))
    m.cur_stu_name = this.Parent.Text3.value
    set filter to stu_name = lcCurStuName in student

endif

if lcCombo1Value = "高中名称" .AND. !Empty(this.Parent.text3.value)
    m.cur_high_name = this.Parent.Text3.value
    set filter to high_name = lcCurHighName in highschool

endif

if lcCombo1Value = "准考证号" .AND. !Empty(this.Parent.text3.value)
    m.cur_pass_num = this.Parent.Text3.value
    set filter to pass_num = lcCurPassNum in student
endif

loPage1.Grid2.Refresh()


loPage1.Grid1.SetFocus()