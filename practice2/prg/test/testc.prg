cd D:\Desktop\vfp-practices\practice2\db\
* create table c
CREATE TABLE  C (pass_num C(8), name C(8), id_card C(18), high_code C(3), volu1 C(3), volu2 C(3), volu3 C(3))
INDEX ON pass_num TAG pass_num
INDEX ON id_card TAG id_card

USE A IN 1
USE B IN 2

RAND(-1)
FOR i = 1 TO 20
    * get a random high school code from table A
    SELECT 1
    *!*	 USE A
    *!*	 ?"RECN A = " + STR(RECN())
    m.rand1 = INT(RAND() * RECC()) + 1
    LOCATE FOR RECN() == m.rand1
    *!*	 * notice: judge without variable would be out of record range
    *!*	 LOCATE FOR RECN() == INT(RAND() * RECC()) + 1
    m.high_code = high_code
    * get 3 random university codes from table B
    SELECT 2
    *!*	 USE B
    *!*	 ?"RECN B 1= " + STR(RECN())
    *!*	 STORE INT(RAND() * RECC()) + 1 TO m.rand_rec1
    *!*	 GO TOP
    *!*	 ?RECC()
    m.rand2 = INT(RAND() * RECC()) + 1
    *!*	 LOCATE FOR RECN() = INT(RAND() * RECC()) + 1
    LOCATE FOR RECN() = m.rand2
    *!*	 ? m.rand_rec
    *!*	 STORE INT(RAND() * RECC()) + 1 TO m.rand_rec2 
    m.volu1 = univ_code
    *!*	 ?"RECN B 2= " + STR(RECN())
    *!*	 LOCATE FOR RECN() = MOD(INT(RAND() * RECC()) + 1, RECC()) + 1
    m.rand3 = MOD(INT(RAND() * RECC()) + 1, RECC()) + 1
    m.volu2 = univ_code
    *!*	 STORE INT(RAND() * RECC()) + 1 TO m.rand_rec3
    *!*	 ?"RECN B 3= " + STR(RECN())
    *!*	 LOCATE FOR RECN() = MOD(INT(RAND() * RECC()) + 1, RECC()) + 2
    m.rand3 = MOD(INT(RAND() * RECC()) + 1, RECC()) + 2
    m.volu3 = univ_code

    *!*	 ?

	SELECT C
	USE C
    m.pass_num = ""
    m.id_card = ""
    DO WHILE .T.
        chars = "0123456789"
        FOR j = 1 TO 8
            m.pass_num = m.pass_num + SUBSTR(chars, INT(RAND()*10)+1, 1)
        ENDFOR
        FOR k = 1 TO 18
            m.id_card = m.id_card + SUBSTR(chars, INT(RAND()*10)+1, 1)
        ENDFOR

        IF SEEK(m.pass_num, "C", "pass_num") .OR. SEEK(m.id_card, "C", "id_card")
            LOOP
        ENDIF
        SET ORDER TO
        EXIT
    ENDDO

	SELECT C
    APPEND BLANK

    REPLACE pass_num WITH m.pass_num, ;
        name WITH "Student" + LTRIM(STR(i)), ;
        id_card WITH m.id_card, ;
        high_code WITH m.high_code, ;
        volu1 WITH m.volu1, ;
        volu2 WITH m.volu2, ;
        volu3 WITH m.volu3
ENDFOR

USE IN select("A")
USE IN select("B")
USE IN select("C")
*!*	 CLEAR
*!*	 LIST

