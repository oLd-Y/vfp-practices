LPARAMETERS nColIndex


public m.cur_univ_code, m.adm_plan
m.cur_univ_code = university.univ_code
m.adm_plan = university.adm_plan


select file_info
cond = "volu_name1 = university.univ_name"

count to lnFilingNum

if lnFilingNum <= m.adm_plan * 1.3
    cond = cond + ".OR. volu_code2 = university.univ_code"
endif

count to lnFilingNum

if lnFilingNum <= m.adm_plan * 1.3
    cond = cond + ".OR. volu_code3 = university.univ_code"
endif

if lnFilingNum <= m.adm_plan * 1.3
    cond = cond + "(chinese + english + math) >= 280"
endif

set filter to &cond
go bott

&& 定位最低投档分数和名次
m.min_score = all_score
m.min_rank = rank

&& select student
&& set filter to volu_code1 = m.cur_univ_code ;
&&
&& count to lnFilingNum
&&
&& if lnFilingNum <= m.adm_plan * 1.3
&&     set filter to volu_code1 = m.cur_univ_code .OR. volu_code2 = m.cur_univ_code
&& endif
&& count to lnFilingNum
&&
&& if lnFilingNum <= m.adm_plan * 1.3
&&     set filter to volu_code1 = m.cur_univ_code ;
&&                 .OR. volu_code2 = m.cur_univ_code ;
&&                 .OR. volu_code3 = m.cur_univ_code
&& endif
&&
&& select score
&& set filter to (chinese + english + math) >= 280 ;
&&             .AND. pass_num = student.pass_num ;
&&
&& && 定位最低投档分数
&& && if lnFilingNum <= m.adm_plan * 1.3
&&     go bott
&& && else
&& &&     go m.adm_plan * 1.3
&& && endif
&& m.min_score = score.all_score
&& m.min_rank = rank.rank
&&
&& set filter to high_code = student.high_code in highschool
&&
&& go top
&& select university

go top
&& 修改最低投档分数
this.Parent.text1.value = m.min_score
&& this.Parent.text2.refresh()
&& 修改最低投档名次
this.Parent.text2.value = m.min_rank
&& this.Parent.text4.value = lnFilingNum

this.Parent.grid2.refresh()

