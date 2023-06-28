*!*	 CREATE TABLE "D:\Desktop\vfp-practices\practice2\A" (high_code C(3), high_name C(30))

*!*	 *!*	 CREATE TABLE  B (univ_code C(3), univ_name C(30), univ_type C(4), adm_plan N(4))
*!*	 *!*	 SELECT university
*!*	 *!*	 * add 200 records to B
*!*	 *!*	 FOR i = 1 TO 20
*!*	 *!*	     m.univ_code = RIGHT("000" + LTRIM(STR(i)), 3)
*!*	 *!*	     m.univ_name = "Shanghai " + m.t_univ_code + " th University" 
*!*	 *!*	     m.univ_type = "985"
*!*	 *!*	     m.admin_plan = 2000
*!*	 *!*	     APPEND BLANK 
*!*	 *!*	     REPLACE NEXT 1 ;
*!*	 *!*	         univ_code WITH m.univ_code, ;
*!*	 *!*	         univ_name WITH m.univ_name, ;
*!*	 *!*	         univ_type WITH m.univ_type, ;
*!*	 *!*	         adm_plan WITH m.admin_plan
*!*	 *!*	 ENDFOR

*!*	 CREATE TABLE  "D:\Desktop\vfp-practices\practice2\C" (pass_num C(8), name C(8), id_card C(18), high_code C(3), volu1 C(3), volu2 C(3), volu3 C(3))
*!*	 INDEX ON pass_num TAG pass_num
*!*	 INDEX ON id_card TAG id_card

*!*	 * Create table D
*!*	 CREATE TABLE  "D:\Desktop\vfp-practices\practice2\D" (pass_num C(8), id_card C(18), chinese N(3), ;
*!*	                 math N(3), english N(3), composite N(3), all_score N(3))



for i = 1 to 13
	this.Columns(i).movable = .F.
endfor

for i = 1 to 13
	this.Columns(i).Header1.Alignment = 2
endfor


this.column1.controlsource = "students.pass_num"
this.column2.controlsource = "students.id_card"
this.column3.controlsource = "students.name"
this.column4.controlsource = "highschool.high_name"
this.column5.controlsource = "volunteer.all_score"
this.column6.controlsource = "volunteer.chinese"
this.column7.controlsource = "volunteer.math"
this.column8.controlsource = "volunteer.english"
this.column9.controlsource = "volunteer.composite"
this.column11.controlsource = "students.volu1"
this.column12.controlsource = "students.volu2"
this.column13.controlsource = "students.volu3"


