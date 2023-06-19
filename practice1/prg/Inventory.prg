* 创建数据库
CREATE TABLE "../db/Inventory.dbf" ;
  (ivt_type C(4), ;
   ivt_name C(8), ;
   ivt_quan N(8,2), ;
   ivt_date D)


* 打开数据库
*!*	 USE "../db/Inventory.dbf" IN 0

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
  *!*	 INSERT INTO "../db/Inventory.dbf" ;
  *!*	   (ivt_type, ivt_name, ivt_quan, ivt_date) ;
  *!*	   VALUES (tmp_type, tmp_name, tmp_quan, tmp_date)
  APPEND BLANK
  REPLACE NEXT 1 ivt_type WITH tmp_type, ivt_name WITH tmp_name, ;
          ivt_quan WITH tmp_quan, ivt_date WITH tmp_date
NEXT

SET MARK TO "-"
SET DATE TO ANSI
SET HOUR TO 24
*!*	 SET DELE ON
*!*	 SET CENT ON
*!*	 SET TALK OFF
*!*	 SET STATUS OFF
*!*	 SET STAT BAR OFF
*!*	 SET SAFETY OFF



CLOSE DATABASES

CREATE CURSOR tmpCursor (ivt_name C(50), ivt_quan N(10,2))
INDEX ON ivt_quan TAG ivt_quan
SET ORDER TO ivt_quan DESCENDING

APPEND FROM "..\db\Inventory.dbf" FOR ivt_quan <= 4000


@ 2,7 SAY "品名     入库数量"

* 设置输出位置
LOCAL nRow, nCol
nRow = 3
nCol = 7

* 输出记录
SCAN 
  @ nRow, nCol SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
  nRow = nRow + 1
  IF MOD(nRow - 2, 4) = 0
    nRow = nRow + 1
  ENDIF
ENDSCAN


* 以入库数量由高到低排序，选择数量在4000以下的记录
*!*	 SELECT ivt_name, ivt_quan ;
*!*	   FROM "../db/Inventory.dbf" ;
*!*	   WHERE ivt_quan <= 4000 ;
*!*	   ORDER BY ivt_quan DESC INTO CURSOR tmpCursor

*!*	 * 设置输出位置
*!*	 @ 2,7 SAY "品名     入库数量"

*!*	 * 输出记录
*!*	 SCAN 
*!*	   @ (RECNO()  + 2), 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	 ENDSCAN

*!*	 * 创建临时表并排序
*!*	 CREATE CURSOR tmpCursor (ivt_name C(50), ivt_quan N(10,2))
*!*	 INDEX ON ivt_quan TAG ivt_quan
*!*	 SET ORDER TO ivt_quan DESCENDING

*!*	 DO WHILE RECNO() < RECCOUNT("Inventory")
*!*	   LOCATE FOR ivt_quan <= 4000
*!*	   IF FOUND()
*!*	     COPY TO tmpCursor
*!*	   ENDIF
*!*	 ENDDO

*!*	 * 设置输出位置
*!*	 @ 2,7 SAY "品名     入库数量"
*!*	 * 输出记录
*!*	 SCAN 
*!*	   @ (RECNO()  + 2), 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	 ENDSCAN

*!*	 LOCATE FOR ivt_quan <= 4000
*!*	 IF FOUND()
*!*	   * 创建临时表并排序
*!*	   CREATE CURSOR tmpCursor (ivt_name C(50), ivt_quan N(10,2))
*!*	   COPY TO tmpCursor
*!*	   INDEX ON ivt_quan TAG ivt_quan
*!*	   SET ORDER TO ivt_quan DESCENDING
*!*	   * 设置输出位置
*!*	   @ 2,7 SAY "品名     入库数量"
*!*	   * 输出记录
*!*	   SCAN 
*!*	     @ (RECNO()  + 2), 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	   ENDSCAN
*!*	 ELSE
*!*	   * 没有符合条件的记录
*!*	   @ 2,7 SAY "没有符合条件的记录"
*!*	 ENDIF

*!*	 CREATE CURSOR tmpCursor (ivt_name C(50), ivt_quan N(10,2))
*!*	 INDEX ON ivt_quan TAG ivt_quan
*!*	 SET ORDER TO ivt_quan DESCENDING

*!*	 APPEND FROM "..\db\Inventory.dbf" FOR ivt_quan <= 4000

*!*	 * 设置输出位置
*!*	 @ 2,7 SAY "品名     入库数量"

*!*	 * 输出记录
*!*	 SCAN 
*!*	   @ (RECNO()  + 2), 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	 ENDSCAN





* 关闭数据库
USE IN SELECT("tmpCursor")
USE IN SELECT("Inventory")