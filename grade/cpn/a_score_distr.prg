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

CLEA
CLOSE ALL
CLOSE DATABASES
CLEAR ALL && clear variables ..

m.pub_path = "D:\Desktop\vfp-practices\grade\dbf\"
use m.pub_path + "tb_score_distr" alias score_distr excl in 6
USE m.pub_path + "score" alias score exclusive IN 400 order sort_score
zap in score_distr

select score
calc max(all_score), min(all_score) to m.max_score, m.min_score

select score_distr
FOR i = m.max_score TO m.min_score step -1
    append blank
    REPLACE all_score WITH i
ENDFOR

go top

m.acc_count = 0
SCAN
    select score
    count for score.all_score = score_distr.all_score to m.stu_count
    m.acc_count = m.acc_count + m.stu_count

    select score_distr
    replace ;
        stu_count with m.stu_count, ;
        acc_count with m.acc_count
ENDSCAN
go top

CLEA
CLOSE ALL
CLOSE DATABASES
CLEAR ALL && clear variables ..