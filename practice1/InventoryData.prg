* �������ݿ�
CREATE TABLE "InventoryData.dbf" ;
  (TYPE C(4), ;
   NAME C(8), ;
   QUANTITY N(8,2), ;
   DATETIME D)

* �����м�30����¼
FOR i = 1 TO 30
  * �����������
  TYPES = IIF(RAND() < 0.2, "�߲�", ;
           IIF(RAND() < 0.4, "��Ʒ", ;
           IIF(RAND() < 0.6, "����", ;
           IIF(RAND() < 0.8, "��Ʒ", "�ɻ�"))))

  * �������Ʒ�����Ⱥ��ַ�
  nameLength = INT(RAND()*8) + 1
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  NAME = ""
  FOR j = 1 TO nameLength
    NAME = NAME + SUBSTR(chars, INT(RAND()*26)+1, 1)
  ENDFOR

  * ��������������
  QUANTITY = RAND()*(7005.77-1.01) + 1.01

  * �����������
  startDate = CTOD("2023/05/01")
  endDate = DATE() + 60
  randomDate = DATE() + INT(RAND()*(endDate-startDate+1))

  * �����¼
  INSERT INTO "InventoryData.dbf" ;
    (TYPE, NAME, QUANTITY, DATETIME) ;
    VALUES (TYPES, NAME, QUANTITY, randomDate)
NEXT

* ����������ɸߵ�������
SELECT * FROM "InventoryData.dbf" ;
  ORDER BY QUANTITY DESC ;
  INTO CURSOR SortedData

* �б���ʾ����4000���µļ�¼��Ʒ�����������
SET FILTER TO QUANTITY <= 4000
SET CONSOLE ON
SET TALK OFF
SET SAFETY OFF

FOR i = 1 TO RECCOUNT("SortedData")
  RECNO(i)
  IF (MOD(i, 3) = 1)
    @ 2, 7 SAY CHR(12)
  ENDIF
  @ 2 + INT((i-1)/3)*2, 7 SAY NAME + " " + ALLTRIM(STR(QUANTITY))
NEXT

* �ر����д򿪵����ݿ�
USE IN SELECT("SortedData")
USE IN SELECT()
