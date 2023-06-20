* Set path to database folder
SET DEFAULT TO "..\db\"

* Create table A with required fields
CREATE TABLE A (school_code C(3), school_name C(30))

* Generate 200 records with school names
FOR i = 1 TO 200
    school_code = PADL(STR(i), 3, "0")
    school_name = "??? " + school_code + " ??"
    INSERT INTO A (school_code, school_name) VALUES (school_code, school_name)
ENDFOR

* Close the table
USE

* Create table B with required fields
CREATE TABLE B (university_code C(3), university_name C(30), school_type C(4), admission_plan N(4))

* Manually input 20 records with university names and other details
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("001", "Harvard University", "PU", RAND(1200, 1800))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("002", "Massachusetts Institute of Technology", "PU", RAND(800, 1500))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("003", "Stanford University", "PU", RAND(1000, 2000))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("004", "California Institute of Technology", "PU", RAND(900, 1700))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("005", "University of Oxford", "PU", RAND(1300, 1900))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("006", "University of Cambridge", "PU", RAND(1400, 2000))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("007", "Imperial College London", "PU", RAND(1000, 1500))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("008", "University of Chicago", "PU", RAND(1200, 1800))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("009", "Princeton University", "PU", RAND(1100, 1700))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("010", "University of California, Berkeley", "PU", RAND(1500, 2000))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("011", "Tsinghua University", "PU", RAND(1400, 1900))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("012", "Peking University", "PU", RAND(1300, 1800))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("013", "National University of Singapore", "PU", RAND(900, 1500))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("014", "University of Tokyo", "PU", RAND(1200, 1700))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("015", "Kyoto University", "PU", RAND(1000, 1500))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("016", "University of Melbourne", "PU", RAND(800, 1200))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("017", "University of Sydney", "PU", RAND(1000, 1500))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("018", "University of New South Wales", "PU", RAND(900, 1400))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("019", "Monash University", "PU", RAND(800, 1200))
INSERT INTO B (university_code, university_name, school_type, admission_plan) VALUES ("020", "University of Queensland", "PU", RAND(1100, 1700))

* Close the table
USE

 * Create table C with required fields
CREATE TABLE C (exam_id C(8), name C(8), id_card C(18), high_school_code C(3), first_choice C(3), second_choice C(3), third_choice C(3))
 * Generate 80,000 records with student information and their university choices
FOR i = 1 TO 80000
    * Generate unique exam ID and ID card number
    DO WHILE .T.
        exam_id = PADL(STR(RAND(10000000, 99999999)), 8, "0")
        id_card = PADL(STR(RAND(100000000000000000, 999999999999999999)), 18, "0")
        IF NOT USED("C") AND NOT SEEK(exam_id, "C", "exam_id") AND NOT SEEK(id_card, "C", "id_card")
            EXIT
        ENDIF
    ENDDO
    * Randomly select high school code from table A
    SELECT A
    high_school_code = A.high_school_code[RAND(RECCOUNT("A")) + 1]
    * Randomly select up to three university choices from table B
    SELECT B
    first_choice = B.university_code[RAND(RECCOUNT("B")) + 1]
    second_choice = IIF(RAND() > 0.5, B.university_code[RAND(RECCOUNT("B")) + 1], "")
    third_choice = IIF(RAND() > 0.7, B.university_code[RAND(RECCOUNT("B")) + 1], "")
    * Insert record into table C
    INSERT INTO C (exam_id, name, id_card, high_school_code, first_choice, second_choice, third_choice) VALUES (exam_id, "Student" + LTRIM(STR(i)), id_card, high_school_code, first_choice, second_choice, third_choice)
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