&& highschools
CREATE TABLE ;
"D:\Desktop\vfp-practices\practice2\dbf\A" ;
(high_code C(3), high_name C(30))
INDEX ON high_code TAG high_code


&& universities
*!*	 CREATE TABLE  '
*!*	 "D:\Desktop\vfp-practices\practice2\dbf\B" '
*!*	 (univ_code C(3), univ_name C(30), univ_type C(4), adm_plan N(4))
*!*	 SELECT university
*!*	 * add 200 records to B
*!*	 FOR i = 1 TO 20
*!*	     m.univ_code = RIGHT("000" + LTRIM(STR(i)), 3)
*!*	     m.univ_name = "Shanghai " + m.t_univ_code + " th University" 
*!*	     m.univ_type = "985"
*!*	     m.admin_plan = 2000
*!*	     APPEND BLANK 
*!*	     REPLACE NEXT 1 ;
*!*	         univ_code WITH m.univ_code, ;
*!*	         univ_name WITH m.univ_name, ;
*!*	         univ_type WITH m.univ_type, ;
*!*	         adm_plan WITH m.admin_plan
*!*	 ENDFOR
*!*	 index on univ_code TAG univ_code

&& students
CREATE TABLE  ;
"D:\Desktop\vfp-practices\practice2\dbf\C" ;
    (pass_num C(8), stu_name C(8), id_card C(18), high_code C(3), ;
        volu1_code C(3), volu2_code C(3), volu3_code C(3))
INDEX ON pass_num TAG pass_num




&& scores
* Create table D
CREATE TABLE  "D:\Desktop\vfp-practices\practice2\dbf\D" ;
    (pass_num C(8), id_card C(18), chinese N(3), ;
                math N(3), english N(3), composite N(3), all_score N(3))
index on pass_num TAG pass_num
index on str(all_score, 3) + str(math, 3) + str(english, 3) + str(composite, 3) TAG sort_score desc
                
close all