public m.opt_value, m.cur_stu_name, m.cur_high_name, m.cur_pass_num
m.opt_value = thisForm.optionGroup1.value

if m.opt_value = 1 .AND. !empty(thisForm.text4.value)
    m.cur_stu_name = thisForm.text4.value
    set filter to stu_name = m.cur_stu_name in student
&&     set filter to high_name = m.cur_high_name in highschool
&&     set filter to score.pass_num = student.pass_num in score
&&     set filter to rank.pass_num = student.pass_num in rank
endif

if m.opt_value = 2 .AND. !empty(thisForm.text4.value)
    m.cur_high_name = thisForm.text4.value
    set filter to high_name = m.cur_high_name in highschool
&&     set filter to student.high_code = highschool.high_code in student
&&     set filter to score.pass_num = student.pass_num in score
&&     set filter to rank.pass_num = student.pass_num in rank
endif

if m.opt_value = 3 .AND. !empty(thisForm.text4.value)
    m.cur_pass_num = thisForm.text4.value
    set filter to pass_num = m.cur_pass_num in student
&&     set filter to high_name = m.cur_high_name in highschool
&&     set filter to score.pass_num = student.pass_num in score
&&     set filter to rank.pass_num = student.pass_num in rank
endif

thisForm.grid2.refresh()
