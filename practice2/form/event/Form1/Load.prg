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
USE m.path + "A" exclusive IN 1 ALIAS highSchool
USE m.path + "C" exclusive IN 3 ALIAS student
USE m.path + "D" exclusive IN 4 ALIAS score

SELECT highSchool
INDEX ON high_code TAG high_code
GO TOP

SELECT score
INDEX ON all_score + math + english + composite DESC TAG scores
GO TOP

create cursor t_rank (m.rank N(5), pass_num C(8))
INDEX ON pass_num TAG pass_num

SELECT student
INDEX ON pass_num TAG pass_num
GO TOP
SET RELATION TO high_code INTO highSchool, ;
                pass_num INTO score, ;
                pass_num INTO t_rank

m.rank = 0

SCAN
    m.rank = m.rank + 1

    SELECT t_rank
    APPEND BLANK
    REPLACE rank WITH m.rank, ;
            pass_num WITH pass_num ;
ENDSCAN

* The ranking is based on the all_score from the highest to the lowest, 
* and the same all_score will be ranked according to the value of 
* mathematics, english and composite score from the highest to the lowest.
create cursor t_score ;
(pass_num C(8), id_card C(18), name C(8), high_name C(30), ;
    rank N(3), all_score N(3), chinese N(3), math N(3), ;
    english N(3), composite N(3), volu1_name C(8), volu2_name C(8), ;
    volu3_name C(8))

m.rank = 0
select score
index on str(all_score, 3) + str(math, 3) + str(english, 3) + str(composite, 3) TAG scores desc
SCAN
select
    seek(pass_num, "student")
    seek(student.high_code, "highSchool")

    select t_score
    APPEND BLANK
    REPLACE rank WITH recno(), ;
            pass_num WITH pass_num, ;
            id_card WITH id_card, ;
            name WITH name, ;
            high_name WITH high_name, ;
            all_score WITH all_score, ;
            chinese WITH chinese, ;
            math WITH math, ;
            english WITH english, ;
            composite WITH composite, ;
            volu1_name WITH volu1_name, ;
            volu2_name WITH volu2_name, ;
            volu3_name WITH volu3_name ;
            IN t_score


    select score
ENDSCAN

SELECT student
SCAN
    select highschool
    seek student.high_code

    select score
    inde on all_score
    inde on math
    inde on english
    inde on composite
    seek student.pass_num

    select university
    seek student.volu1_code




    m.rank = m.rank + 1

    m.pass_num = pass_num
    m.id_card = id_card
    m.name = name

    m.volu1_code = volu1 
    m.volu2_code = volu2
    m.volu3_code = volu3

    m.high_code = high_code

    SKIP

    * search for the name of university
    SELECT university
    Locate for univ_code = m.volu1_code
    m.volu1_name = univ_name
    Locate for univ_code = m.volu2_code
    m.volu2_name = univ_name
    Locate for univ_code = m.volu3_code
    m.volu3_name = univ_name

    * search for the name of high school
    SELECT highSchool
    Locate for high_code = m.high_code
    m.high_name = high_name

    SELECT score
    Locate for pass_num = m.pass_num
    m.all_score = all_score
    m.chinese = chinese
    m.math = math
    m.english = english
    m.composite = composite

    APPEND BLANK
    REPLACE rank WITH m.rank, ;
        volu1_name WITH m.volu1_name, ;
        volu2_name WITH m.volu2_name, ;
        volu3_name WITH m.volu3_name, ;
        high_name WITH m.high_name, ;
        all_score WITH m.all_score, ;
        chinese WITH m.chinese, ;
        math WITH m.math, ;
        english WITH m.english, ;
        composite WITH m.composite ;
        IN t_score
ENDSCAN

