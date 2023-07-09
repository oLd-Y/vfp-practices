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

m.pub_path = "D:\Desktop\vfp-practices\inventory\dbf\"
use m.pub_path + "inventory" alias inventory