SET MARK TO "-"
SET DATE TO ANSI
SET HOUR TO 24
SET DELE ON
SET CENT ON
SET TALK OFF
SET STATUS OFF
*!*	 SET STAT BAR OFF
SET SAFETY OFF
SET EXCL OFF

m.path = "D:\Desktop\vfp-practices\practice2\dbf\"
* use 4 tables
USE m.path + "A" exclusive IN 1 ALIAS highchools
USE m.path + "C" exclusive IN 3 ALIAS students
USE m.path + "D" exclusive IN 4 ALIAS scores

SELECT highchools
GO TOP

SELECT scores
GO TOP

SELECT students
GO TOP
*!*	 SET RELATION TO high_code INTO highchools, ;
*!*	                 pass_num INTO scores, ;
*!*	                 pass_num INTO t_rank

*!*	 m.rank = 0

*!*	 SCAN
*!*	     m.rank = m.rank + 1

*!*	     SELECT t_rank
*!*	     APPEND BLANK
*!*	     REPLACE rank WITH m.rank, ;
*!*	             pass_num WITH pass_num ;
*!*	 ENDSCAN

* The ranking is based on the all_score from the highest to the lowest, 
* and the same all_score will be ranked according to the value of 
* mathematics, english and composite scores from the highest to the lowest.
create cursor t_score ;
(pass_num C(8), id_card C(18), stu_name C(8), high_name C(30), ;
    rank N(3), all_score N(3), chinese N(3), math N(3), ;
    english N(3), composite N(3), volu1_name C(8), volu2_name C(8), ;
    volu3_name C(8))
index on str(all_score, 3) + str(math, 3) + str(english, 3) + str(composite, 3) TAG scores desc

select scores
SCAN
    select students
    seek scores.pass_num

    select highchools
    seek students.high_code

    select university
    seek students.volu1
    m.volu1_name = univ_name
    seek students.volu2
    m.volu2_name = univ_name
    seek students.volu3
    m.volu3_name = univ_name

    select t_score
    APPEND BLANK
    REPLACE rank WITH recn(), ;
            pass_num WITH students.pass_num, ;
            id_card WITH students.id_card, ;
            stu_name WITH students.stu_name, ;
            high_name WITH highchools.high_name, ;
            all_score WITH scores.all_score, ;
            chinese WITH scores.chinese, ;
            math WITH scores.math, ;
            english WITH scores.english, ;
            composite WITH scores.composite, ;
            volu1_name WITH m.volu1_name, ;
            volu2_name WITH m.volu2_name, ;
            volu3_name WITH m.volu3_name ;
ENDSCAN

*!*	 SELECT students
*!*	 SCAN
*!*	     select highchools
*!*	     seek students.high_code

*!*	     select scores
*!*	     inde on all_score
*!*	     inde on math
*!*	     inde on english
*!*	     inde on composite
*!*	     seek students.pass_num

*!*	     select university
*!*	     seek students.volu1_code




*!*	     m.rank = m.rank + 1

*!*	     m.pass_num = pass_num
*!*	     m.id_card = id_card
*!*	     m.stu_name = stu_name

*!*	     m.volu1_code = volu1 
*!*	     m.volu2_code = volu2
*!*	     m.volu3_code = volu3

*!*	     m.high_code = high_code

*!*	     SKIP

*!*	     * search for the name of university
*!*	     SELECT university
*!*	     Locate for univ_code = m.volu1_code
*!*	     m.volu1_name = univ_name
*!*	     Locate for univ_code = m.volu2_code
*!*	     m.volu2_name = univ_name
*!*	     Locate for univ_code = m.volu3_code
*!*	     m.volu3_name = univ_name

*!*	     * search for the name of high school
*!*	     SELECT highchools
*!*	     Locate for high_code = m.high_code
*!*	     m.high_name = high_name

*!*	     SELECT scores
*!*	     Locate for pass_num = m.pass_num
*!*	     m.all_score = all_score
*!*	     m.chinese = chinese
*!*	     m.math = math
*!*	     m.english = english
*!*	     m.composite = composite

*!*	     APPEND BLANK
*!*	     REPLACE rank WITH m.rank, ;
*!*	         volu1_name WITH m.volu1_name, ;
*!*	         volu2_name WITH m.volu2_name, ;
*!*	         volu3_name WITH m.volu3_name, ;
*!*	         high_name WITH m.high_name, ;
*!*	         all_score WITH m.all_score, ;
*!*	         chinese WITH m.chinese, ;
*!*	         math WITH m.math, ;
*!*	         english WITH m.english, ;
*!*	         composite WITH m.composite ;
*!*	         IN t_score
*!*	 ENDSCAN

