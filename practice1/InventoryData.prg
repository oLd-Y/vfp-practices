* �������ݿ�
CREATE TABLE "D:\Desktop\practice1\InventoryData.dbf" ;
  (Type C(4), ;
   Name C(8), ;
   Quantity N(8,2), ;
   DateTime D)

* �����м�30����¼
FOR i = 1 TO 30
  * �����������
  types = IIF(RAND() < 0.2, "�߲�", ;
           IIF(RAND() < 0.4, "��Ʒ", ;
           IIF(RAND() < 0.6, "����", ;
           IIF(RAND() < 0.8, "��Ʒ", "�ɻ�"))))

  * �������Ʒ�����Ⱥ��ַ�
  nameLength = INT(RAND()*8) + 1
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  name = ""
  FOR j = 1 TO nameLength
    name = name + SUBSTR(chars, INT(RAND()*26)+1, 1)
  ENDFOR

  * ��������������
  quantity = RAND()*(7005.77-1.01) + 1.01

  * �����������
  startDate = CTOD("2023/05/01")
  endDate = DATE() + 60
  randomDate = DATE() + INT(RAND()*(endDate-startDate+1))

  * �����¼
  INSERT INTO "D:\Desktop\practice1\InventoryData.dbf" ;
    (Type, Name, Quantity, DateTime) ;
    VALUES (types, name, quantity, randomDate)
NEXT

* ����������ɸߵ�������
SELECT * FROM "D:\Desktop\practice1\InventoryData.dbf" ;
  ORDER BY Quantity DESC ;
  INTO CURSOR SortedData

* �б���ʾ����4000���µļ�¼��Ʒ�����������
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

* �ر����д򿪵����ݿ�
USE IN SELECT("SortedData")
USE IN SELECT()
