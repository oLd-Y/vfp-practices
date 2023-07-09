SET MARK TO "-"
SET DATE TO ANSI
SET HOUR TO 24
SET DELE ON
SET CENT ON
SET TALK OFF
SET STATUS OFF
*!* SET STAT BAR OFF
SET SAFETY OFF
SET EXCL OFF

close data


public m.pub_path
m.pub_path = "D:\Desktop\vfp-practices\grade\dbf\"
* use 4 tables
USE m.pub_path + "highschool" alias highschool exclusive IN 100 order high_code

USE m.pub_path + "university" alias university1 exclusive IN 200 order univ_code
USE m.pub_path + "university" alias university2 exclusive IN 201 order univ_code again
USE m.pub_path + "university" alias university3 exclusive IN 202 order univ_code again

USE m.pub_path + "student" alias student exclusive IN 300 order pass_num

USE m.pub_path + "score" alias score exclusive IN 400 order sort_score

use m.pub_path + "rank" alias rank in 500 excl order pass_num

select score
set relation to pass_num into student, ;
                pass_num into rank

select student
set relation to high_code into highschool, ;
                volu_code1 into university1, ;
                volu_code2 into university2, ;
                volu_code3 into university3








