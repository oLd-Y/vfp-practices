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

CLEA
CLOSE ALL
CLOSE DATABASES

m.pub_path = "D:\Desktop\vfp-practices\grade\dbf\"
USE m.pub_path + "tb_score_distr" alias score_distr exclusive IN 600
select score_distr
