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

m.path = "D:\Desktop\vfp-practices\inventory\dbf\"
CREATE TABLE m.path + "inventory" ( ;
    ivt_type C(4), ;
    ivt_name C(8), ;
    ivt_quan N(8,2), ;
    ivt_date D ;
)
use in inventory

CLEA
CLOSE ALL
CLOSE DATABASES
CLEAR ALL && clear variables ..