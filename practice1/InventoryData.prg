* 创建数据库
CREATE TABLE "InventoryData.dbf" ;
  (ivt_type C(4), ;
   ivt_name C(8), ;
   ivt_quan N(8,2), ;
   ivt_date D)

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
  set date ymd
  startDate = CTOD("23/05/01")
  * endDate = DATE() + 60
  * tmp_date = DATE() + INT(RAND()*(endDate-startDate+1))
  tmp_date = startDate + INT(RAND()*61)

  * 插入记录
  INSERT INTO "InventoryData.dbf" ;
    (ivt_type, ivt_name, ivt_quan, ivt_date) ;
    VALUES (tmp_type, tmp_name, tmp_quan, tmp_date)
NEXT

* 按入库数量由高到低排序
SELECT * FROM "InventoryData.dbf" ;
  ORDER BY ivt_quan DESC ;
  INTO CURSOR SortedData

* 列表显示数量4000以下的记录的品名和入库数量
SET FILTER TO ivt_quan <= 4000
SET CONSOLE ON
SET TALK OFF
SET SAFETY OFF

FOR i = 1 TO RECCOUNT("SortedData")
  RECNO(i)
  IF (MOD(i, 3) = 1)
    @ 2, 7 SAY CHR(12)
  ENDIF
  @ 2 + INT((i-1)/3)*2, 7 SAY ivt_name + " " + ALLTRIM(STR(ivt_quan))
NEXT

* 关闭所有打开的数据库
USE IN SELECT("SortedData")
USE IN SELECT()

