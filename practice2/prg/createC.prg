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

        INDEX ON exam_id TAG exam_id
        INDEX ON id_card TAG id_card
        IF NOT USED("C") AND NOT SEEK(tmp_exam_id, C, exam_id) AND NOT SEEK(tmp_id_card, C, id_card)
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

*!*	 CD ..\db
*!*	 * Load secondary school name codes from Table A
*!*	 USE A IN 0
*!*	 LOCAL laSchoolCodes[1]
*!*	 DIMENSION laSchoolCodes[RECCOUNT("A")]
*!*	 SCAN
*!*	     laSchoolCodes[RECNO()] = A.high_code
*!*	 ENDSCAN
*!*	  * Load university codes from Table B
*!*	 USE B IN 0
*!*	 LOCAL laUniCodes[1]
*!*	 DIMENSION laUniCodes[RECCOUNT("B")]
*!*	 SCAN
*!*	     laUniCodes[RECNO()] = B.uni_code
*!*	 ENDSCAN
*!*	  * Set up variables
*!*	 LOCAL lcPassNo, lcName, lcID, lcSchoolCode, lcFirstChoice, lcSecondChoice, lcThirdChoice
*!*	  * Create table C
*!*	 CREATE TABLE C (pass_no C(8), name C(8), ID C(18), high_code C(3), first_choice C(3), second_choice C(3), third_choice C(3))
*!*	  * Loop through 80,000 students
*!*	 FOR lnCount = 1 TO 80000
*!*	     * Generate unique pass number and ID number
*!*	     DO WHILE .T.
*!*	         lcPassNo = STR(RAND(1) * 100000000, 8)
*!*	         lcID = STR(RAND(1) * 100000000000000000, 18)
*!*	         IF NOT USED("C", "pass_no='" + lcPassNo + "' OR ID='" + lcID + "'")
*!*	             EXIT
*!*	         ENDIF
*!*	     ENDDO
*!*	      * Select a random secondary school name code
*!*	     lcSchoolCode = laSchoolCodes[INT(RAND(1) * A.RECCOUNT()) + 1]
*!*	      * Select a random number of universities between 1 and 3
*!*	     lnNumUnis = INT(RAND(1) * 3) + 1
*!*	      * Select random university codes
*!*	     lcFirstChoice = laUniCodes[INT(RAND(1) * B.RECCOUNT()) + 1]
*!*	     lcSecondChoice = IIF(lnNumUnis > 1, laUniCodes[INT(RAND(1) * B.RECCOUNT()) + 1], "")
*!*	     lcThirdChoice = IIF(lnNumUnis > 2, laUniCodes[INT(RAND(1) * B.RECCOUNT()) + 1], "")
*!*	      * Append record to table C
*!*	     APPEND BLANK
*!*	     REPLACE pass_no WITH lcPassNo, name WITH "Name" + LTRIM(STR(lnCount)), ID WITH lcID, high_code WITH lcSchoolCode, first_choice WITH lcFirstChoice, second_choice WITH lcSecondChoice, third_choice WITH lcThirdChoice
*!*	 NEXT lnCount
*!*	  * Close tables
*!*	 USE IN C
*!*	 USE IN A
*!*	 USE IN B