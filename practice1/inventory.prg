SET MARK TO "-"
SET DATE TO ANSI
SET HOUR TO 24
SET DELE ON
SET CENT ON
SET TALK OFF
SET STATUS OFF
*!*	 SET STAT BAR OFF
SET SAFETY OFF

IF(!USED("Inventory"))
  USE Inventory in 0 ALIAS Inventory
ENDIF
SELECT Inventory


* 往库中加30条记录
FOR i = 1 TO 30
  * 随机生成类型
  tmp_type = IIF(RAND() < 0.2, "蔬菜", ;
           IIF(RAND() < 0.4, "果品", ;
           IIF(RAND() < 0.6, "肉类", ;
           IIF(RAND() < 0.8, "冻品", "干货"))))

  * 随机生成品名长度和字符
  nameLength = INT(RAND()*8) + 1
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  tmp_name = ""
  FOR j = 1 TO nameLength
    tmp_name = tmp_name + SUBSTR(chars, INT(RAND()*26)+1, 1)
  ENDFOR

  * 随机生成入库数量
  tmp_quan = RAND()*(7005.77-1.01) + 1.01

  * 随机生成日期
  startDate = CTOD("23/05/01")
  tmp_date = startDate + INT(RAND()*61)

  * 插入记录
  APPEND BLANK
  REPLACE NEXT 1 ivt_type WITH tmp_type, ivt_name WITH tmp_name, ;
          ivt_quan WITH tmp_quan, ivt_date WITH tmp_date
NEXT

SET ORDER TO ivt_quan DESC

* 设置输出位置
LOCAL nRow, nCol
nRow = 1
nCol = 7

offset = 1
* 输出记录
* 第一行空着所以无输出
SCAN 
  @ nRow + offset, nCol SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
  nRow = nRow + 1
  IF MOD(nRow , 3) = 0
    offset = offset + 1
  ENDIF
ENDSCAN

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


