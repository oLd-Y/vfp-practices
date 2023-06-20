* create table c
CREATE TABLE C (exam_id C(8), name C(8), id_card C(18), high_code C(3), volu1 C(3), volu2 C(3), volu3 C(3))

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
        INDEX ON exam_id TO C
        INDEX ON id_card TO C
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
        volu1 WITH first_choice, ;
        volu2 WITH second_choice, ;
        volu3 WITH third_choice

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