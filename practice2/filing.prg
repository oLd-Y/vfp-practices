SET MARK TO "-"
SET DATE TO ANSI
SET HOUR TO 24
SET DELE ON
SET CENT ON
SET TALK OFF
SET STATUS OFF
*!*	 SET STAT BAR OFF
SET SAFETY OFF


lcStartTime = SECONDS()



* create 200 records
FOR i = 1 TO 200 
    tmp_code = PADL(i, 3, "0") 
    tmp_name = "Shanghai " + tmp_code + " th High School" 
    APPEND BLANK 
    REPLACE NEXT 1 high_code WITH tmp_code
    REPLACE NEXT 1 high_name WITH tmp_name
ENDFOR


*!*	 FOR i = 1 TO 20
*!*	     APPEND BLANK
*!*	     REPLACE univ_code WITH STRT(STR(i, 3), ' ', '0'), ;
*!*	             univ_name WITH "University " + STR(i, 1), ;
*!*	             sch_type WITH "PU", ;
*!*	             adm_plan WITH RAND()*1200+801
*!*	 ENDFOR

* create table c


*!*	 USE A IN 1
*!*	 USE B IN 2
*!*	 USE C IN 3

RAND(-1)
FOR i = 1 TO 80000
*!*	 FUNCTION CreateAccount

*!*	 endFunc
    * get a random high school code from table A
    SELECT A
    *!*	 USE A
    *!*	 ?"RECN A = " + STR(RECN())
    m.rand1 = INT(RAND() * RECC()) + 1
    IF !BETWEEN(m.rand1, 1, RECC())
        GO TOP
    ELSE
        GO m.rand1
    ENDIF

    *!*	 * notice: judge without variable would be out of record range
    *!*	 LOCATE FOR RECN() == INT(RAND() * RECC()) + 1
    m.high_code = high_code
    * get 3 random university codes from table B
    SELECT B
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

*!*	 CLEAR
*!*	 LIST


*!*	 * Generate scores for each student based on probability distribution
*!*	 m.c_probs = [0.3, 1, 4, 10.7, 18, 27, 19, 10, 6, 3, 1]
*!*	 m.m_probs = [0.5, 3, 6, 15, 19, 18, 17, 12, 5, 4, 0.5]
*!*	 m.e_probs = [0.5, 1, 5, 19, 20, 25, 15, 7.5, 4, 2.5, 0.5]
*!*	 m.g_probs = [3, 6, 12, 15, 13, 15, 11, 8, 6, 4, 3, 2, 1, 0.5, 0.3, 0.1, 0.1]

RAND(-1)


SELECT C

SCAN
    m.pass_num = C.pass_num
    m.id_card = C.id_card

    SELECT D
    * get all scores according to the probability
    m.chinese_score = getChinese(ROUND(RAND() * 100, 1))
    m.math_score = getMath(ROUND(RAND() * 100, 1))
    m.english_score = getEnglish(ROUND(RAND() * 100, 1))
    m.composite_score = getComposite(ROUND(RAND() * 100, 1))
    m.all_score = m.chinese_score + m.math_score + m.english_score + m.composite_score
    APPEND BLANK
    REPLACE pass_num WITH m.pass_num, ;
            id_card WITH m.id_card, ;
            chinese WITH m.chinese_score, ;
            math WITH m.math_score, ;
            english WITH m.english_score, ;
            composite WITH m.composite_score, ;
            all_score WITH m.all_score
ENDSCAN

SELECT D

lcEndTime = SECONDS()
CLEAR
@ 3, 10 SAY TRANSFORM(lcEndTime - lcStartTime, "@R 999999.999") + " seconds"

FUNCTION getChinese(prob)
    DO CASE 
        CASE prob < 0.3
            RETURN INT(RAND() * 10) + 140
        CASE prob < 1.3
            RETURN INT(RAND() * 10) + 130
        CASE prob < 5.3
            RETURN INT(RAND() * 10) + 120
        CASE prob < 16
            RETURN INT(RAND() * 10) + 110
        CASE prob < 34
            RETURN INT(RAND() * 10) + 100
        CASE prob < 61
            RETURN INT(RAND() * 10) + 90
        CASE prob < 80
            RETURN INT(RAND() * 10) + 80
        CASE prob < 90
            RETURN INT(RAND() * 10) + 70
        CASE prob < 96
            RETURN INT(RAND() * 10) + 60
        CASE prob < 99
            RETURN INT(RAND() * 10) + 50
        OTHERWISE
            RETURN INT(RAND() * 10) + 40
    ENDCASE
ENDFUNC

FUNCTION getMath(prob)
    DO CASE 
        CASE prob < 0.5
            RETURN INT(RAND() * 10) + 140
        CASE prob < 3.5
            RETURN INT(RAND() * 10) + 130
        CASE prob < 9.5
            RETURN INT(RAND() * 10) + 120
        CASE prob < 24.5
            RETURN INT(RAND() * 10) + 110
        CASE prob < 43.5
            RETURN INT(RAND() * 10) + 100
        CASE prob < 61.5
            RETURN INT(RAND() * 10) + 90
        CASE prob < 78.5
            RETURN INT(RAND() * 10) + 80
        CASE prob < 90.5
            RETURN INT(RAND() * 10) + 70
        CASE prob < 95.5
            RETURN INT(RAND() * 10) + 60
        CASE prob < 99.5
            RETURN INT(RAND() * 10) + 50
        OTHERWISE
            RETURN INT(RAND() * 10) + 40    
    ENDCASE
ENDFUNC

FUNCTION getEnglish(prob)
    DO CASE 
        CASE prob < 0.5
            RETURN INT(RAND() * 10) + 140
        CASE prob < 1.5
            RETURN INT(RAND() * 10) + 130
        CASE prob < 6.5
            RETURN INT(RAND() * 10) + 120
        CASE prob < 25.5
            RETURN INT(RAND() * 10) + 110
        CASE prob < 45.5
            RETURN INT(RAND() * 10) + 100
        CASE prob < 65.5
            RETURN INT(RAND() * 10) + 90
        CASE prob < 80.5
            RETURN INT(RAND() * 10) + 80
        CASE prob < 90.5
            RETURN INT(RAND() * 10) + 70
        CASE prob < 95.5
            RETURN INT(RAND() * 10) + 60
        CASE prob < 99.5
            RETURN INT(RAND() * 10) + 50
        OTHERWISE
            RETURN INT(RAND() * 10) + 40    
    ENDCASE
ENDFUNC

FUNCTION getComposite(prob)
    DO CASE
        CASE prob < 3
            RETURN INT(RAND() * 10) + 201
        CASE prob < 9
            RETURN INT(RAND() * 11) + 190
        CASE prob < 21
            RETURN INT(RAND() * 10) + 180
        CASE prob < 36
            RETURN INT(RAND() * 10) + 170
        CASE prob < 49
            RETURN INT(RAND() * 10) + 160
        CASE prob < 64
            RETURN INT(RAND() * 10) + 150
        CASE prob < 75
            RETURN INT(RAND() * 10) + 140
        CASE prob < 83
            RETURN INT(RAND() * 10) + 130
        CASE prob < 89
            RETURN INT(RAND() * 10) + 120
        CASE prob < 93
            RETURN INT(RAND() * 10) + 110
        CASE prob < 96
            RETURN INT(RAND() * 10) + 100
        CASE prob < 98
            RETURN INT(RAND() * 10) + 90
        CASE prob < 99
            RETURN INT(RAND() * 10) + 80
        CASE prob < 99.5
            RETURN INT(RAND() * 10) + 70
        CASE prob < 99.8
            RETURN INT(RAND() * 10) + 60
        CASE prob < 99.9
            RETURN INT(RAND() * 10) + 50
        OTHERWISE
            RETURN INT(RAND() * 10) + 40    
        ENDCASE
ENDFUNC

USE IN A
USE IN B
USE IN C
USE IN D

CLOSE DATABASES

cd ..\prg