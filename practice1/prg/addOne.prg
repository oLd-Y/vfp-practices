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
?RECNO()
REPLACE NEXT 1 ivt_type WITH tmp_type, ivt_name WITH tmp_name, ;
ivt_quan WITH tmp_quan, ivt_date WITH tmp_date
list