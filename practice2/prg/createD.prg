* Create table D
CREATE TABLE ..\db\D (pass_num C(8), id_card C(18), chinese N(3), ;
                math N(3), english N(3), composite N(3), all_score N(3))
* Generate scores for each student based on probability distribution
m.c_probs = [0.3, 1, 4, 10.7, 18, 27, 19, 10, 6, 3, 1]
m.m_probs = [0.5, 3, 6, 15, 19, 18, 17, 12, 5, 4, 0.5]
m.e_probs = [0.5, 1, 5, 19, 20, 25, 15, 7.5, 4, 2.5, 0.5]
m.g_probs = [3, 6, 12, 15, 13, 15, 11, 8, 6, 4, 3, 2, 1, 0.5, 0.3, 0.1, 0.1]

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

*!*	 FOR i = 1 TO LEN(m.c_probs)
*!*	     m.chinese_score = IIF(RAND() )
*!*	 ENDFOR

*!*	 FOR i = 1 TO LEN(m.c_probs)
*!*	     FOR j = 1 TO INT(RECCOUNT("B") * m.c_probs[i] / 100)
*!*	         m.chinese_score = RAND() * max_score + min_score
*!*	     ENDFOR
*!*	 ENDFOR
*!*	 FUNCTION addRecord(probs)
*!*	     SELECT B
*!*	     m.pass_num = B.pass_num
*!*	     m.id_card = B.id_card

*!*	     SELECT D
*!*	     LOCAL base1 = 140, base2 = 200
*!*	     m.chinese_score = generateOne(base1)
*!*	     m.math_score = generateOne(base1)
*!*	     m.english_score = generateOne(base1)
*!*	     m.composite_score = generateOne(base2)
*!*	     m.all_score = m.chinese_score + m.math_score + m.english_score + m.composite_score

*!*	     APPEND BLANK
*!*	     REPLACE pass_num WITH m.pass_num ;
*!*	             id_card WITH m.id_card ;
*!*	             chinese WITH m.chinese_score ;
*!*	             math WITH m.math_score ;
*!*	             english WITH m.english_score ;
*!*	             composite_score WITH m.composite_score
*!*	 ENDFUNC



*!*	 FUNCTION generateOne(base)
*!*	     RETURN INT(RAND() * 10) + base
*!*	 ENDFUNC


*!*	 LOCAL c_probs[11], m_probs[11], e_probs[11], g_probs[17]
*!*	 c_probs = [0.3, 1, 4, 10.7, 18, 27, 19, 10, 6, 3, 1]
*!*	 m_probs = [0.5, 3, 6, 15, 19, 18, 17, 12, 5, 4, 0.5]
*!*	 e_probs = [0.5, 1, 5, 19, 20, 25, 15, 7.5, 4, 2.5, 0.5]
*!*	 g_probs = [3, 6, 12, 15, 13, 15, 11, 8, 6, 4, 3, 2, 1, 0.5, 0.3, 0.1, 0.1]

*!*	 * Define function to generate scores for one subject
*!*	 FUNCTION generateScore(probs)
*!*	     LOCAL allProbs, i
*!*	     allProbs = ALEN(probs)
*!*	     FOR i = 1 TO totalProbs
*!*	         IF RAND() < probs[i] / 100
*!*	             RETURN i * 10 + 90
*!*	         ENDIF
*!*	     ENDFOR
*!*	     RETURN 100
*!*	 ENDFUNC

*!*	 * Define function to generate scores for each student
*!*	 FUNCTION generateScores()
*!*	     SELECT B
*!*	     SCAN
*!*	         SELECT D
*!*	         APPEND BLANK
*!*	         REPLACE pass_num WITH B.pass_num, ;
*!*	                 id_card WITH B.id_card, ;
*!*	                 chinese WITH generateScore(c_probs), ;
*!*	                 math WITH generateScore(m_probs), ;
*!*	                 english WITH generateScore(e_probs), ;
*!*	                 composite WITH generateScore(g_probs), ;
*!*	                 all WITH chinese + math + english + composite
*!*	     ENDSCAN
*!*	 ENDFUNC

*!*	 * Call the function to generate scores
*!*	 generateScores()

*!*	 FUNCTION GENERATE_SCORE (min_score, max_score, probabilities)
*!*	     * Iterate through an array of proportions of a certain type, 
*!*	     *   generating the type in the number of "total * proportion"
*!*	     FOR i = 1 TO LEN(m.c_probs)
*!*	         FOR j = 1 TO INT(RECCOUNT("B") * m.c_probs[i] / 100)
*!*	             m.chinese_score = RAND() * max_score + min_score
*!*	         ENDFOR
*!*	     ENDFOR

*!*	     FOR i = 1 TO LEN(m.m_probs)
*!*	         FOR j = 1 TO INT(RECCOUNT("B") * m.m_probs[i] / 100)
*!*	             m.math_score = RAND() * 150
*!*	         ENDFOR
*!*	     ENDFOR
*!*	 ENDFUNC


*!*	 FOR i = 1 TO RECCOUNT("B")
*!*	     * Get exam ID and ID card number from table C
*!*	     SELECT C
*!*	     pass_num = C.pass_num[i]
*!*	     id_card = C.id_card[i]
*!*	     chinese = GENERATE_SCORE(0, 150, m.c_probs)
*!*	     math = GENERATE_SCORE(0, 150, m.m_probs)
*!*	     english = GENERATE_SCORE(0, 150, m.e_probs)
*!*	     comprehensive = GENERATE_SCORE(0, 210, m.g_probs)
    
    

*!*	     * Calculate all score
*!*	     all = chinese + math + english + comprehensive
*!*	     * Insert record into table D
*!*	     INSERT INTO D (pass_num, id_card, chinese, math, english, comprehensive, all) ;
*!*	         VALUES (pass_num, id_card, chinese, math, english, comprehensive, all)
*!*	 ENDFOR
*!*	  * Close the table
*!*	 USE

*!*	 * Function to generate a score based on probability distribution
*!*	 FUNCTION GET_SCORE(prob_num, probabilities)
*!*	     LOCAL score, cumulative_prob, rand_num
*!*	     score = 0
*!*	     cumulative_prob = 0
*!*	     rand_num = RAND()
*!*	     FOR i = 1 TO LEN(probabilities)
*!*	         cumulative_prob = cumulative_prob + probabilities[i] / 100
*!*	         IF rand_num <= cumulative_prob
*!*	             EXIT
*!*	         ENDIF
*!*	         score = score + 10
*!*	     ENDFOR
*!*	     RETURN IIF(score > prob_num * 10, prob_num * 10, score)
*!*	 ENDFUNC

*!*	  * Function to generate a score based on probability distribution
*!*	 FUNCTION GENERATE_SCORE (min_score, max_score, probabilities)
*!*	     LOCAL score, cumulative_prob, rand_num
*!*	     score = min_score
*!*	     cumulative_prob = 0
*!*	     rand_num = RAND()
*!*	     FOR i = 1 TO LEN(probabilities)
*!*	         cumulative_prob = cumulative_prob + probabilities[i] / 100
*!*	         IF rand_num <= cumulative_prob
*!*	             EXIT
*!*	         ENDIF
*!*	         score = score + 10
*!*	     ENDFOR
*!*	     RETURN IIF(score > max_score, max_score, score)
*!*	 ENDFUNC