* Set path to database folder
cd "D:\Desktop\vfp-practices\practice2\db\"

* 创建表 A
CREATE TABLE A (high_code C(3), high_name C(30))

* 生成 200 条记录
FOR i = 1 TO 200 
    tmp_code = PADL(i, 3, "0") 
    tmp_name = "上海第 " + tmp_code + " 中学" 
    APPEND BLANK 
    REPLACE NEXT 1 high_code WITH tmp_code
    REPLACE NEXT 1 high_name WITH tmp_name
ENDFOR

* Close the table
USE

* Create table B with required fields
CREATE TABLE B (univ_code C(3), univ_name C(30), sch_type C(4), adm_plan N(4))

* Manually input 20 records with university names and other details
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("001", "Harvard University", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("002", "Massachusetts Institute of Technology", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("003", "Stanford University", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("004", "California Institute of Technology", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("005", "University of Oxford", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("006", "University of Cambridge", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("007", "Imperial College London", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("008", "University of Chicago", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("009", "Princeton University", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("010", "University of California, Berkeley", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("011", "Tsinghua University", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("012", "Peking University", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("013", "National University of Singapore", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("014", "University of Tokyo", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("015", "Kyoto University", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("016", "University of Melbourne", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("017", "University of Sydney", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("018", "University of New South Wales", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("019", "Monash University", "PU", RAND()*1200+801)
INSERT INTO B (univ_code, univ_name, sch_type, adm_plan) VALUES ("020", "University of Queensland", "PU", RAND()*1200+801)

* Close the table
USE

* 创建表 C
CREATE TABLE C (exam_id C(8), name C(8), id_card C(18), high_code C(3), first_choice C(3), second_choice C(3), third_choice C(3))

FOR i = 1 TO 80000
    * Generate unique exam ID and ID card number
    DO WHILE .T.
        chars = "0123456789"
        tmp_exam_id = ""
        tmp_id_card =""
        FOR i = 1 TO 8
            tmp_exam_id = tmp_exam_id + SUBSTR(chars, INT(RAND()*10)+1, 1)
        ENDFOR
        FOR i = 1 TO 18
            tmp_id_card = tmp_id_card + SUBSTR(chars, INT(RAND()*10)+1, 1)
        ENDFOR
        SET INDEX ON exam_id, id_card TAG tmp_exam_id
        IF NOT USED("C") AND NOT SEEK(tmp_exam_id, "C", "exam_id") AND NOT SEEK(tmp_id_card, "C", "id_card")
            EXIT
        ENDIF
    ENDDO
    * 使用Append From命令将表A中的`high_code`字段追加到表C中
    APPEND FROM A FIELDS high_code
    * 三个志愿大学的代码从表 B 中取，每个学生至少有一个志愿，最多三个志愿，依次填入相应字段，没有为空；
    SELECT B
    * 从表B中随机挑选一个大学代码并赋值给一个变量
    total = RECCOUNT()
    rand_idx = INT(RAND()*total) + 1
    GO rand_idx
    first_choice = univ_code
    SKIP
    second_choice = univ_code
    SKIP
    third_choice = univ_code
    APPEND BLANK
    REPLACE NEXT 1 ;
        exam_id WITH tmp_exam_id, ;
        name WITH "Student" + LTRIM(STR(i)), ;
        id_card WITH tmp_id_card, ;
        first_choice WITH first_choice, ;
        second_choice WITH second_choice, ;
        third_choice WITH third_choice

    *!*	 * Randomly select high school code from table A
    *!*	 SELECT A
    *!*	 tmp_code = A.high_code[RAND(RECCOUNT("A")) + 1]
    *!*	 * Randomly select up to three university choices from table B
    *!*	 SELECT B
    *!*	 first_choice = B.univ_code[RAND(RECCOUNT("B")) + 1]
    *!*	 second_choice = IIF(RAND() > 0.5, B.univ_code[RAND(RECCOUNT("B")) + 1], "")
    *!*	 third_choice = IIF(RAND() > 0.7, B.univ_code[RAND(RECCOUNT("B")) + 1], "")
    *!*	 * Insert record into table C
    *!*	 INSERT INTO C (exam_id, name, id_card, high_sch_code, first_choice, second_choice, third_choice) 
    *!*	 VALUES (exam_id, "Student" + LTRIM(STR(i)), id_card, high_sch_code, first_choice, second_choice, third_choice)
ENDFOR
 * Close the table
USE


 * Create table D with required fields
CREATE TABLE D (exam_id C(8), id_card C(18), chinese N(3), math N(3), english N(3), comprehensive N(3), total N(3))
 * Generate scores for each student based on probability distribution
SELECT B
FOR i = 1 TO RECCOUNT("B")
    * Get exam ID and ID card number from table C
    SELECT C
    exam_id = C.exam_id[i]
    id_card = C.id_card[i]
    * Generate scores for each subject based on probability distribution
    chinese = GENERATE_SCORE(0, 150, {3, 6, 12, 15, 13, 15, 0.3, 1, 4, 10.7, 18, 27, 19, 10, 6, 3, 1})
    math = GENERATE_SCORE(0, 150, {0.5, 3, 6, 15, 19, 18, 17, 12, 5, 0.5, 0.5, 0.5, 0.1, 0.3, 4, 0.5, 0.1})
    english = GENERATE_SCORE(0, 150, {0.5, 1, 5, 19, 20, 25, 15, 7.5, 4, 0.5, 0.5, 0.5, 0.1, 2.5, 0.5, 0.5, 0.1})
    comprehensive = GENERATE_SCORE(0, 210, {0, 0, 0, 0, 0, 0, 11, 8, 6, 4, 3, 2, 1, 0.3, 0.1, 0.1, 0})
    * Calculate total score
    total = chinese + math + english + comprehensive
    * Insert record into table D
    INSERT INTO D (exam_id, id_card, chinese, math, english, comprehensive, total) VALUES (exam_id, id_card, chinese, math, english, comprehensive, total)
ENDFOR
 * Close the table
USE
 * Function to generate a score based on probability distribution
FUNCTION GENERATE_SCORE (min_score, max_score, probabilities)
    LOCAL score, cumulative_prob, rand_num
    score = min_score
    cumulative_prob = 0
    rand_num = RAND()
    FOR i = 1 TO LEN(probabilities)
        cumulative_prob = cumulative_prob + probabilities[i] / 100
        IF rand_num <= cumulative_prob
            EXIT
        ENDIF
        score = score + 10
    ENDFOR
    RETURN IIF(score > max_score, max_score, score)
ENDFUNC