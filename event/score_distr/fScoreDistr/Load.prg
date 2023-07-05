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
*!* SET DECIMALS TO 10  && 设置小数点后的位数为10 ..

public m.pub_path
m.pub_path = "D:\Desktop\vfp-practices\dbf\"

create table m.pub_path + "t_distr" ;
(scr_range C(10), scale C(30), stu_count N(6), all_score N(3))
use in t_distr
use m.pub_path + "t_distr" excl in 6

FOR i = 599 TO 200 step -10
    m.scr_range = str(i - 10, 3) + " ~ " + str(i, 3)
    append blank
    REPLACE all_score WITH i, ;
        scr_range WITH m.scr_range
ENDFOR

select t_distr
go top
SCAN
    SELECT t_score
    count for t_score.all_score <= t_distr.all_score .AND. t_score.all_score > (t_distr.all_score - 10) to m.stu_count
    m.scale = str((m.stu_count / recc()) * 100, 10, 5) + "%"

    select t_distr
    replace ;
        scale with m.scale, ;
        stu_count with m.stu_count
ENDSCAN
go top