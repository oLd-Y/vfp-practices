close data


&& use 4 tables
&& USE "highschool" alias highschool exclusive IN 100 order high_code
&&
&& USE "university" alias university exclusive IN 200 order univ_code
&& USE "university" alias university1 exclusive IN 201 order univ_code again
&& USE "university" alias university2 exclusive IN 202 order univ_code again
&& USE "university" alias university3 exclusive IN 203 order univ_code again
&&
&& USE "student" alias student exclusive IN 300 order pass_num
&&
&& USE "score" alias score exclusive IN 400 order sort_score
&&
&& use "rank" alias rank in 500 excl order pass_num
&&
&& select score
&& set relation to pass_num into student, ;
&&                 pass_num into rank
&&
&& select student
&& set relation to high_code into highschool, ;
&&                 volu_code1 into university1, ;
&&                 volu_code2 into university2, ;
&&                 volu_code3 into university3

Public true, false
true = .T.
false = .F.

use file_info in 8



