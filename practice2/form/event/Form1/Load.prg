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
USE m.path + "A" exclusive IN 1 ALIAS highschools order high_code

USE m.path + "B" exclusive IN 2 ALIAS universities order univ_code

USE m.path + "C" exclusive IN 3 ALIAS students order pass_num

USE m.path + "D" exclusive IN 4 ALIAS scores order pass_num



*!*	 SET RELATION TO high_code INTO highschools, ;
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
create table m.path + "t_score" ;
(pass_num C(8), id_card C(18), stu_name C(8), high_name C(30), ;
    all_score N(3), chinese N(3), math N(3), ;
    english N(3), composite N(3), rank N(6), ;
    volu1_name C(30), volu2_name C(30), volu3_name C(30))
use in t_score
use m.path + "t_score" excl in 5

sele t_score
inde on rank tag rank

select scores
set order to sort_score
SCAN
    *!*	 set order to pass_num
    
    select students
    set order to pass_num
    seek scores.pass_num

    select highschools
    seek students.high_code

    select universities
    seek students.volu1_code
    m.volu1_name = univ_name
    seek students.volu2_code
    m.volu2_name = univ_name
    seek students.volu3_code
    m.volu3_name = univ_name

    select t_score
    APPEND BLANK
    REPLACE rank WITH recn(), ;
            pass_num WITH students.pass_num, ;
            id_card WITH students.id_card, ;
            stu_name WITH students.stu_name, ;
            high_name WITH highschools.high_name, ;
            all_score WITH scores.all_score, ;
            chinese WITH scores.chinese, ;
            math WITH scores.math, ;
            english WITH scores.english, ;
            composite WITH scores.composite, ;
            volu1_name WITH m.volu1_name, ;
            volu2_name WITH m.volu2_name, ;
            volu3_name WITH m.volu3_name 
ENDSCAN