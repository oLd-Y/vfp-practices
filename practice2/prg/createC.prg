* create table c
CREATE TABLE ..\db\C (pass_num C(8), name C(8), id_card C(18), high_code C(3), volu1 C(3), volu2 C(3), volu3 C(3))
INDEX ON pass_num TAG pass_num
INDEX ON id_card TAG id_card

FOR i = 1 TO 10
    *!*	 m.pass_num = ""
    *!*	 m.id_card = ""
    *!*	 m.high_code = ""
    *!*	 m.volu1 = ""
    *!*	 m.volu2 = ""
    *!*	 m.volu3 = ""
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

* Close the table
USE

