SET MARK TO "-"
SET DATE TO ANSI
SET HOUR TO 24
SET DELE ON
SET CENT ON
SET TALK OFF
SET STATUS OFF
*!* SET STAT BAR OFF
SET SAFETY OFF
SET EXCL OFF

public m.pub_path
m.pub_path = "D:\Desktop\vfp-practices\dbf\"
* use 4 tables
USE m.pub_path + "highschool" exclusive IN 1 order high_code

USE m.pub_path + "university" exclusive IN 2 order univ_code

USE m.pub_path + "student" exclusive IN 3 order pass_num

USE m.pub_path + "score" exclusive IN 4 order sort_score

*!* The ranking is based on the all_score from the highest to the lowest,
*!* and the same all_score will be ranked according to the value of
*!* mathematics, english and composite score from the highest to the lowest.
create table m.pub_path + "t_score" ;
(pass_num C(8), id_card C(18), stu_name C(8), high_name C(30), ;
    all_score N(3), chinese N(3), math N(3), ;
    english N(3), composite N(3), rank N(6), ;
    volu_name1 C(30), volu_name2 C(30), volu_name3 C(30))
use in t_score
use m.pub_path + "t_score" excl in 5

select t_score
index on rank tag rank

select score
go top
SCAN
    select student
    set order to pass_num
    seek score.pass_num

    select highschool
    seek student.high_code

    select university
    seek student.volu_code1
    m.volu_name1 = univ_name

    m.volu_name2 = univ_name
    seek student.volu_code3
    m.volu_name3 = univ_name

    select t_score
    APPEND BLANK
    REPLACE rank WITH recn(), ;
            pass_num WITH student.pass_num, ;
            id_card WITH student.id_card, ;
            stu_name WITH student.stu_name, ;
            high_name WITH highschool.high_name, ;
            all_score WITH score.all_score, ;
            chinese WITH score.chinese, ;
            math WITH score.math, ;
            english WITH score.english, ;
            composite WITH score.composite, ;
            volu_name1 WITH m.volu_name1, ;
            volu_name2 WITH m.volu_name2, ;
            volu_name3 WITH m.volu_name3
ENDSCAN
go top
