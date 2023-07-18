
public m.cur_stu_name
m.cur_stu_name = student.stu_name
set filter to stu_name = m.cur_stu_name in student

&& set filter to pass_num = student.pass_num in score
&& set filter to high_code = student.high_code in highschool

thisForm.grid2.refresh()