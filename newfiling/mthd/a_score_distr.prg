&& SET MARK TO "-"
&& SET DATE TO ANSI
&& SET HOUR TO 24
&& SET DELE ON
&& SET CENT ON
&& SET TALK OFF
&& SET STATUS OFF
&& *!* SET STAT BAR OFF
&& SET SAFETY OFF
&& SET EXCL OFF

CLEA
CLOSE ALL
CLOSE DATABASES
CLEAR ALL && clear variables ..


use score_distr alias score_distr excl in 6
USE score alias score exclusive IN 400 order sort_score
zap in score_distr

select score_distr
&& calc max(all_score), min(all_score) to m.max_score, m.min_score
&&
&& FOR i = m.max_score TO m.min_score step -1
&&     append blank
&&     REPLACE all_score WITH i
&& ENDFOR
select score
lnAccCount = 0
DO WHILE !EOF()
    lnAllScore = all_score
 	COUNT REST TO lnStuCount WHILE all_score = lnAllScore
 	lnAccCount = lnAccCount + lnStuCount

 	SELECT score_distr
	APPEND BLANK
 	REPLACE all_score With lnAllScore, ;
 	        stu_count WITH lnStuCount, ;
 		    acc_count WITH lnAccCount

    select score
endd
go top
CLEA
*CLOSE events
CLOSE DATABASES
CLEAR ALL && clear variables ..