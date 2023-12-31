

CLEA
CLOSE ALL
CLOSE DATABASES
CLEAR ALL && clear variables ..

rand(-1)

public m.pub_path
m.pub_path = "D:\Desktop\vfp-practices\filing\dbf\"
CREATE TABLE m.pub_path + "highschool" ( ;
    high_code C(3), ;
    high_name C(30) ;
)
INDEX ON high_code TAG high_code
use in highschool

CREATE TABLE m.pub_path + "university" ( ;
    univ_code C(3), ;
    univ_name C(30), ;
    univ_type C(4), ;
    adm_plan N(4) ;
)
index on univ_code TAG univ_code
use in university
&& *!* add 200 records to B
&& FOR i = 1 TO 20
&&     m.univ_code = RIGHT("000" + LTRIM(STR(i)), 3)
&&     m.univ_name = "Shanghai " + m.univ_code + " th University"
&&     m.univ_type = "985"
&&     m.admin_plan = 2000
&&     APPEND BLANK
&&     REPLACE NEXT 1 ;
&&         univ_code WITH m.univ_code, ;
&&         univ_name WITH m.univ_name, ;
&&         univ_type WITH m.univ_type, ;
&&         adm_plan WITH m.admin_plan
&& ENDFOR

CREATE TABLE m.pub_path + "student" ( ;
    pass_num C(8), ;
    stu_name C(8), ;
    id_card C(18), ;
    high_code C(3), ;
    volu_code1 C(3), ;
    volu_code2 C(3), ;
    volu_code3 C(3) ;
)
INDEX ON pass_num TAG pass_num
INDEX ON id_card TAG id_card
use in student

CREATE TABLE  m.pub_path + "score" ( ;
    pass_num C(8), ;
    id_card C(18), ;
    chinese N(3), ;
    math N(3), ;
    english N(3), ;
    composite N(3), ;
    all_score N(3) ;
)
index on pass_num TAG pass_num
index on str(all_score, 3) + str(math, 3) + str(english, 3) + str(composite, 3) TAG sort_score desc
use in score

create table m.pub_path + "rank" ( ;
    pass_num C(10), ;
    rank N(6) ;
)
index on pass_num tag pass_num
use in rank

CLEA
CLOSE ALL
CLOSE DATABASES
CLEAR ALL && clear 