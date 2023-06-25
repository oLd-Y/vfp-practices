SELECT A
CLEAR
FOR i = 1 TO 10
    m.rand = INT(RAND() * RECC()) + 1
    ?"m.rand = " + STR(m.rand)
    LOCATE FOR RECN() = m.rand
    m.high_code = high_code
	?"m.high_code = " + m.high_code
	?"A.high_code = " + A.high_code
	?
ENDFOR