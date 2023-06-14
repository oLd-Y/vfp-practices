* �������ݿ�
CREATE TABLE "InventoryData.dbf" ;
  (ivt_type C(4), ;
   ivt_name C(8), ;
   ivt_quan N(8,2), ;
   ivt_date D)

* �����м�30����¼
FOR i = 1 TO 30
  * �����������
  tmp_type = IIF(RAND() < 0.2, "�߲�", ;
           IIF(RAND() < 0.4, "��Ʒ", ;
           IIF(RAND() < 0.6, "����", ;
           IIF(RAND() < 0.8, "��Ʒ", "�ɻ�"))))

  * �������Ʒ�����Ⱥ��ַ�
  nameLength = INT(RAND()*8) + 1
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  tmp_name = ""
  FOR j = 1 TO nameLength
    tmp_name = tmp_name + SUBSTR(chars, INT(RAND()*26)+1, 1)
  ENDFOR

  * ��������������
  tmp_quan = RAND()*(7005.77-1.01) + 1.01

  * �����������
  set date ymd
  startDate = CTOD("23/05/01")
  * endDate = DATE() + 60
  * tmp_date = DATE() + INT(RAND()*(endDate-startDate+1))
  tmp_date = startDate + INT(RAND()*61)

  * �����¼
  INSERT INTO "InventoryData.dbf" ;
    (ivt_type, ivt_name, ivt_quan, ivt_date) ;
    VALUES (tmp_type, tmp_name, tmp_quan, tmp_date)
NEXT

* ����������ɸߵ�������
SELECT * FROM "InventoryData.dbf" ;
  ORDER BY ivt_quan DESC ;
  INTO CURSOR SortedData

* �б���ʾ����4000���µļ�¼��Ʒ�����������
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

* �ر����д򿪵����ݿ�
USE IN SELECT("SortedData")
USE IN SELECT()

