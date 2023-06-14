* 随机插入30条数据
FOR i = 1 TO 30
  * 类型
  tmp_type = IIF(RAND() < 0.2, "蔬菜", ;
           IIF(RAND() < 0.4, "果品", ;
           IIF(RAND() < 0.6, "肉类", ;
           IIF(RAND() < 0.8, "冻品", "干货"))))

  * 品名
  nameLength = INT(RAND()*8) + 1
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  tmp_name = ""
  FOR j = 1 TO nameLength
    tmp_name = tmp_name + SUBSTR(chars, INT(RAND()*26)+1, 1)
  ENDFOR

  * 出库数量
  tmp_quan = RAND()*(7005.77-1.01) + 1.01

  * 日期时间
  set date ymd
  startDate = CTOD("23/05/01")
  * endDate = DATE() + 60
  * tmp_date = DATE() + INT(RAND()*(endDate-startDate+1))
  tmp_date = startDate + INT(RAND()*61)

  * 插入数据
  INSERT INTO "InventoryData.dbf" ;
    (ivt_type, ivt_name, ivt_quan, ivt_date) ;
    VALUES (tmp_type, tmp_name, tmp_quan, tmp_date)
NEXT