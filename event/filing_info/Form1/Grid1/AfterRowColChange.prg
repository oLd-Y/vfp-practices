LPARAMETERS nColIndex


public m.cur_univ_code, m.adm_plan, m.filing_num
m.cur_univ_code = university.univ_code
m.adm_plan = university.adm_plan


select student
set filter to volu_code1 = m.cur_univ_code ;

count to m.filing_num

if m.filing_num <= m.adm_plan * 1.3
    set filter to volu_code1 = m.cur_univ_code .OR. volu_code2 = m.cur_univ_code
endif
count to m.filing_num

if m.filing_num <= m.adm_plan * 1.3
    set filter to volu_code1 = m.cur_univ_code ;
                .OR. volu_code2 = m.cur_univ_code ;
                .OR. volu_code3 = m.cur_univ_code
endif

select score
set filter to (chinese + english + math) >= 280 ;
            .AND. pass_num = student.pass_num ;

&& 定位最低投档分数
&& if m.filing_num <= m.adm_plan * 1.3
    go bott
&& else
&&     go m.adm_plan * 1.3
&& endif
m.min_score = score.all_score
m.min_rank = rank.rank

set filter to high_code = student.high_code in highschool

go top
select university

&& && 修改最低投档分数
thisForm.text1.value = m.min_score
thisForm.text2.refresh()
&& && 修改最低投档名次
thisForm.text2.value = m.min_rank
thisForm.text3.value = str(m.filing_num)

thisForm.grid2.refresh()

