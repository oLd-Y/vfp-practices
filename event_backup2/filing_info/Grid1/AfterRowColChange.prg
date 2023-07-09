LPARAMETERS nColIndex

select university
public m.cur_univ_code, m.adm_plan, m.filing_num
m.cur_univ_code = university.univ_code
m.adm_plan = university.adm_plan

select student
set filter to (score.chinese + score.math + score.english) >= 280 ;
        .AND. volu_code1 = m.cur_univ_code ;
&& set filter to (score.chinese + score.math + score.english) >= 280 ;
&&         .AND. volu_code1 = university.univ_code ;
&&             .OR. volu_code2 = university.univ_code ;
&&             .OR. volu_code3 = university.univ_code

count to m.filing_num

if m.filing_num <= m.adm_plan * 1.3
    set filter to (score.chinese + score.math + score.english) >= 280 ;
                .AND. ( volu_code1 = m.cur_univ_code ;
                .OR. volu_code2 = m.cur_univ_code)
endif

count to m.filing_num

if m.filing_num <= m.adm_plan * 1.3
    set filter to (score.chinese + score.math + score.english) >= 280 ;
                .AND. ( volu_code1 = m.cur_univ_code ;
                .OR. volu_code2 = m.cur_univ_code ;
                .OR. volu_code3 = m.cur_univ_code)
endif



set filter to pass_num = student.pass_num ;
            .AND. recn() < m.adm_plan * 1.3;
            in score
set filter to high_code = student.high_code in highschool


&& && 修改最低投档分数
&& thisForm.text1.value = m.min_score
&& && 修改最低投档名次
&& thisForm.text2.value = m.min_rank
thisForm.text3.value = str(m.filing_num)

thisForm.grid2.refresh()

