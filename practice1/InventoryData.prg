* 创建数据库
CREATE TABLE "D:\Desktop\practice1\InventoryData.dbf" ;
  (Type C(4), ;
   Name C(8), ;
   Quantity N(8,2), ;
   DateTime D)

* 往库中加30条记录
FOR i = 1 TO 30
  * 随机生成类型
  types = IIF(RAND() < 0.2, "蔬菜", ;
           IIF(RAND() < 0.4, "果品", ;
           IIF(RAND() < 0.6, "肉类", ;
           IIF(RAND() < 0.8, "冻品", "干货"))))

  * 随机生成品名长度和字符
  nameLength = INT(RAND()*8) + 1
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  name = ""
  FOR j = 1 TO nameLength
    name = name + SUBSTR(chars, INT(RAND()*26)+1, 1)
  ENDFOR

  * 随机生成入库数量
  quantity = RAND()*(7005.77-1.01) + 1.01

  * 随机生成日期
  startDate = CTOD("2023/05/01")
  endDate = DATE() + 60
  randomDate = DATE() + INT(RAND()*(endDate-startDate+1))

  * 插入记录
  INSERT INTO "D:\Desktop\practice1\InventoryData.dbf" ;
    (Type, Name, Quantity, DateTime) ;
    VALUES (types, name, quantity, randomDate)
NEXT

* 按入库数量由高到低排序
SELECT * FROM "D:\Desktop\practice1\InventoryData.dbf" ;
  ORDER BY Quantity DESC ;
  INTO CURSOR SortedData

* 列表显示数量4000以下的记录的品名和入库数量
SET FILTER TO Quantity <= 4000
SET CONSOLE ON
SET TALK OFF
SET SAFETY OFF

FOR i = 1 TO RECCOUNT("SortedData")
  RECNO(i)
  IF (MOD(i, 3) = 1)
    @ 2, 7 SAY CHR(12)
  ENDIF
  @ 2 + INT((i-1)/3)*2, 7 SAY Name + " " + ALLTRIM(STR(Quantity))
NEXT

* 关闭所有打开的数据库
USE IN SELECT("SortedData")
USE IN SELECT()
