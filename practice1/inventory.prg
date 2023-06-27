SET MARK TO "-"
SET DATE TO ANSI
SET HOUR TO 24
SET DELE ON
SET CENT ON
SET TALK OFF
SET STATUS OFF
*!*	 SET STAT BAR OFF
SET SAFETY OFF
SET EXCL OFF

CLEA
CLOSE DATABASES
CLEAR ALL && clear variables

m.path = "D:\Desktop\vfp-practices\practice1"
USE m.path + "\Inventory" exclusive

zap


m.t_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
startDate = CTOD("23/05/01")
* 往库中加30条记录
FOR i = 1 TO 30
  * 随机生成类型
    m.t_type = IIF(RAND() < 0.2, "蔬菜", ;
            IIF(RAND() < 0.4, "果品", ;
            IIF(RAND() < 0.6, "肉类", ;
            IIF(RAND() < 0.8, "冻品", "干货"))))

  * 随机生成品名长度和字符
    DO WHILE .T.
    m.nameLen = INT(RAND()*8) + 1
    IF BETWEEN(m.nameLen, 1, 8) 
        EXIT
    ENDIF
    ENDDO


    m.t_name = ""
    FOR j = 1 TO m.nameLen
    m.t_name = m.t_name + SUBSTR(m.t_chars, INT(RAND()*26)+1, 1)
    ENDFOR

  * 随机生成入库数量
    m.t_quan = RAND()*(7005.77-1.01) + 1.01

  * 随机生成日期
    m.t_date = startDate + INT(RAND()*61)

  * 插入记录
    APPEND BLANK
    REPLACE NEXT 1 ivt_type WITH m.t_type, ivt_name WITH m.t_name, ;
            ivt_quan WITH m.t_quan, ivt_date WITH m.t_date
NEXT

INDEX ON ivt_quan TAG ivt_quan DESC

SET FILTER TO ivt_quan <= 4000
GO TOP

*!*	 * 设置输出位置
*!*	 nRow = 1
*!*	 nCol = 7

*!*	 offset = 1
*!*	 * 输出记录
*!*	 * 第一行为空，所以不显示记录
*!*	 SCAN FOR ivt_quan <= 4000
*!*	 	@ nRow + offset, nCol SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	     nRow = nRow + 1
*!*	     IF MOD(nRow, 3) = 0
*!*	     offset = offset + 1
*!*	     ENDIF
*!*	 ENDSCAN


*!*	 nROw = 2
*!*	 m.cnt = 0
*!*	 SCAN FOR ivt_quan <= 4000
*!*	   * @ nRow + offset, 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	 	@ nRow, 16 SAY ivt_quan picture "9999.99"
*!*	 	nRow = nRow + 1
*!*	 	m.cnt = m.cnt + 1

*!*	 	IF MOD(m.cnt, 3) = 0
*!*	     nRow = nRow + 1
*!*	     m.cnt = 0
*!*	     ENDIF
*!*	 ENDSCAN

nROw = 2
m.cnt = 0
SCAN FOR ivt_quan <= 4000
  * @ nRow + offset, 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
    @ nRow, 16 SAY ivt_quan picture "9999.99"
    nRow = nRow + 1
    m.cnt = m.cnt + 1

    IF MOD(m.cnt, 3) = 0
        nRow = nRow + 1
        m.cnt = 0
    ENDIF
ENDSCAN

DO WHILE !EOF()
	
	SKIP
ENDDO


SCAN REST WHILE ivt_quan >=3000
	
ENDSCAN

LOCATE FOR ivt_quan <= 4000
DO WHILE !EOF()
	
	CONTINUE
ENDDO

*!*	 CLOSE DATABASES
*!*	 CD ..\db
*!*	 CREATE CURSOR tmpCursor (ivt_name C(50), ivt_quan N(10,2))
*!*	 INDEX ON ivt_quan TAG ivt_quan
*!*	 SET ORDER TO ivt_quan DESCENDING

*!*	 APPEND FROM Inventory.dbf FOR ivt_quan  <= 4000


*!*	 @ 2,7 SAY "品名     入库数量"

*!*	 * 设置输出位置
*!*	 LOCAL nRow, nCol
*!*	 nRow = 3
*!*	 nCol = 7

*!*	 * 输出记录
*!*	 SCAN 
*!*	   @ nRow, nCol SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	   nRow = nRow + 1
*!*	   IF MOD(nRow - 2, 4) = 0
*!*	     nRow = nRow + 1
*!*	   ENDIF
*!*	 ENDSCAN



* 关闭数据库
USE IN SELECT("Inventory")