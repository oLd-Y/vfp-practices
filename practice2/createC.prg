* create table c
CREATE TABLE C (pass_num C(8), name C(8), id_card C(18), high_code C(3), volu1 C(3), volu2 C(3), volu3 C(3))
INDEX ON pass_num TAG pass_num
INDEX ON id_card TAG id_card

*!*	 USE C IN 0
FOR i = 1 TO 200
    m.pass_num = ""
    m.id_card = ""
    m.high_code = ""
    m.volu1 = ""
    m.volu2 = ""
    m.volu3 = ""
    * get a random high school code from table A
    USE A IN 1
    SELECT 1
    LOCATE FOR RECN() = (RAND() * RECC()) + 1 
    m.high_code = high_code
    * get 3 random university codes from table B
    USE B IN 2
    SELECT 2
    STORE (RAND() * RECC()) + 1 TO m.rand_rec
    LOCATE FOR RECN() = m.rand_rec
    m.volu1 = univ_code
    GO TOP
    LOCATE FOR RECN() = MOD(m.rand_rec + 1, RECC())
    m.volu2 = univ_code
    GO TOP
    LOCATE FOR RECN() = MOD(m.rand_rec + 2, RECC())
    m.volu3 = univ_code

    * unique mark
    m.unique = .F.
    DO WHILE !m.unique
        * randomly generate exam ID and ID card number
        chars = "0123456789"
        FOR i = 1 TO 8
            m.pass_num = m.pass_num + SUBSTR(chars, INT(RAND()*10)+1, 1)
        ENDFOR
        FOR i = 1 TO 18
            m.id_card = m.id_card + SUBSTR(chars, INT(RAND()*10)+1, 1)
        ENDFOR
        SELECT C
        * check if the pass number and ID card number are unique
        SET ORDER TO pass_num
        SEEK m.pass_num
        IF FOUND()
            LOOP
        ENDIF
        SET ORDER TO id_card
        SEEK m.id_card
        IF FOUND()
            LOOP
        ENDIF

        *!*	 SET ORDER TO pass_num
        *!*	 IF SEEK(tmp_pass_num, "C")
        *!*	     LOOP
        *!*	 ENDIF
        *!*	 SET ORDER TO id_card
        *!*	 IF SEEK(tmp_id_card, "C")
        *!*	     LOOP
        *!*	 ENDIF
        m.unique = .T.
    ENDDO

    *!*	 SELECT C 
    APPEND BLANK
    * RAND(RECCOUNT("B")) + 1
    REPLACE pass_num WITH m.pass_num, ;
        name WITH "Student" + LTRIM(STR(i)), ;
        id_card WITH m.id_card, ;
        high_code WITH m.high_code, ;
        volu1 WITH m.volu1, ;
        volu2 WITH m.volu2, ;
        volu3 WITH m.volu3
    *!*	 * Generate unique exam ID and ID card number
    *!*	 DO WHILE .T.
    *!*	     chars = "0123456789"
    *!*	     tmp_pass_num = ""
    *!*	     tmp_id_card =""
    *!*	     FOR i = 1 TO 8
    *!*	         tmp_exam_id = tmp_exam_id + SUBSTR(chars, INT(RAND()*10)+1, 1)
    *!*	     ENDFOR
    *!*	     FOR i = 1 TO 18
    *!*	         tmp_id_card = tmp_id_card + SUBSTR(chars, INT(RAND()*10)+1, 1)
    *!*	     ENDFOR

    *!*	     *!*	 IF NOT USED("C") AND NOT SEEK(tmp_exam_id, "C", pass_num) AND NOT SEEK(tmp_id_card, "C", id_card)
    *!*	     IF  !SEEK(tmp_pass_num, "C", "pass_num") AND !SEEK(tmp_id_card, "C", "id_card")
    *!*	         EXIT
    *!*	     ENDIF
    *!*	 ENDDO

    *!*	 APPEND FROM A FIELDS high_code

    *!*	 SELECT B

    *!*	 total = RECCOUNT()
    *!*	 rand_idx = INT(RAND()*total) + 1
    *!*	 GO rand_idx
    *!*	 volu1 = univ_code
    *!*	 SKIP
    *!*	 volu2 = univ_code
    *!*	 SKIP
    *!*	 volu3 = univ_code
    *!*	 APPEND BLANK
    *!*	 REPLACE NEXT 1 ;
    *!*	     pass_num WITH tmp_exam_id, ;
    *!*	     name WITH "Student" + LTRIM(STR(i)), ;
    *!*	     id_card WITH tmp_id_card, ;
    *!*	     volu1 WITH volu1, ;
    *!*	     volu2 WITH volu2, ;
    *!*	     volu3 WITH volu3

    *!*	 * Randomly select high school code from table A
    *!*	 SELECT A
    *!*	 tmp_code = A.high_code[RAND(RECCOUNT("A")) + 1]
    *!*	 * Randomly select up to three university choices from table B
    *!*	 SELECT B
    *!*	 volu1 = B.univ_code[RAND(RECCOUNT("B")) + 1]
    *!*	 volu2 = IIF(RAND() > 0.5, B.univ_code[RAND(RECCOUNT("B")) + 1], "")
    *!*	 volu3 = IIF(RAND() > 0.7, B.univ_code[RAND(RECCOUNT("B")) + 1], "")
    *!*	 * Insert record into table C
    *!*	 INSERT INTO C (pass_num, name, id_card, high_sch_code, volu1, volu2, volu3) 
    *!*	 VALUES (pass_num, "Student" + LTRIM(STR(i)), id_card, high_sch_code, volu1, volu2, volu3)
ENDFOR
 * Close the table
USE