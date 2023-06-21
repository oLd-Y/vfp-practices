* ???D
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