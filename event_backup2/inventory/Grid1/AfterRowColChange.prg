LPARAMETERS nColIndex

&& university 变了，将student、score、highschool都改变了之后重新渲染到Grid2上
&& Grid2：score -> student & rank; student -> highschool & university
&& 点击Grid1的不同行，其数据源的记录号也会相应改变

select student
set filter to volu_code1 = university.univ_code .OR. volu_code2 = university.univ_code .OR. volu_code3 = university.univ_code
count to m.filing_num
thisForm.text3.value = m.filing_num

set filter to pass_num = student.pass_num in score


set filter to high_code = student.high_code in highschool

