clos data
Use file_info In 1 Exclusive Order pass_num
zap in file_info

USE "highschool" alias highschool exclusive IN 100 order high_code

USE "university" alias university exclusive IN 200 order univ_code
USE "university" alias university1 exclusive IN 201 order univ_code again
USE "university" alias university2 exclusive IN 202 order univ_code again
USE "university" alias university3 exclusive IN 203 order univ_code again

USE "student" alias student exclusive IN 300 order pass_num

USE "score" alias score exclusive IN 400 order sort_score

use "rank" alias rank in 500 excl order pass_num

&& select score
&& set relation to pass_num into student, ;
&&                 pass_num into rank
&&
&& select student
&& set relation to high_code into highschool, ;
&&                 volu_code1 into university1, ;
&&                 volu_code2 into university2, ;
&&                 volu_code3 into university3

Select score
Set Relation To pass_num Into rank
Scan

    Select student
    Seek score.pass_num

    Select highschool
    Seek student.high_code

    Select university1
    Seek student.volu_code1

    Select university2
    Seek student.volu_code2

    Select university3
    Seek student.volu_code3

    Select file_info
    Append Blank
    Replace pass_num With student.pass_num, ;
            id_card With student.id_card, ;
            stu_name With student.stu_name, ;
            high_name With highschool.high_name, ;
            all_score With score.all_score, ;
            chinese With score.chinese, ;
            math With score.math, ;
            english With score.english, ;
            composite With score.composite, ;
            rank With rank.rank, ;
            volu_name1 With university1.univ_name, ;
            volu_name2 With university2.univ_name, ;
            volu_name3 With university3.univ_name
EndScan