CREATE TABLE B (univ_code C(3), univ_name C(30), sch_type C(4), adm_plan N(4))

FOR i = 1 TO 20
    APPEND BLANK
    REPLACE univ_code WITH STRT(STR(i, 3), ' ', '0'), ;
            univ_name WITH "University " + STR(i, 1), ;
            sch_type WITH "PU", ;
            adm_plan WITH RAND()*1200+801
ENDFOR
*!*	 * Manually input 20 records with university names and other details
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("001", "Harvard University", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("002", "Massachusetts Institute of Technology", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("003", "Stanford University", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("004", "California Institute of Technology", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("005", "University of Oxford", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("006", "University of Cambridge", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("007", "Imperial College London", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("008", "University of Chicago", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("009", "Princeton University", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("010", "University of California, Berkeley", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("011", "Tsinghua University", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("012", "Peking University", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("013", "National University of Singapore", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("014", "University of Tokyo", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("015", "Kyoto University", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("016", "University of Melbourne", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("017", "University of Sydney", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("018", "University of New South Wales", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("019", "Monash University", "PU", RAND()*1200+801)
*!*	 INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("020", "University of Queensland", "PU", RAND()*1200+801)