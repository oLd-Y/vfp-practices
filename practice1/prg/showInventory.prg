* ������������������
SELECT * FROM "InventoryData.dbf" ;
  ORDER BY ivt_quan DESC ;
  INTO CURSOR SortedData

* ɸѡ������������4000�ļ�¼
SET FILTER TO ivt_quan <= 4000

FOR i = 1 TO RECCOUNT("SortedData")
  RECNO(i)
  IF (MOD(i, 3) = 1)
    @ 2, 7 SAY CHR(12)
  ENDIF
  ?RECNO(i)
  @ 2 + INT((i-1)/3)*2, 7 SAY ivt_name + " " + ALLTRIM(STR(ivt_quan))
NEXT

USE IN SELECT("SortedData")
USE IN SELECT()