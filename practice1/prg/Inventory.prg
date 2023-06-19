* �������ݿ�
CREATE TABLE "../db/Inventory.dbf" ;
  (ivt_type C(4), ;
   ivt_name C(8), ;
   ivt_quan N(8,2), ;
   ivt_date D)


* �����ݿ�
*!*	 USE "../db/Inventory.dbf" IN 0

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
  
  startDate = CTOD("23/05/01")
  tmp_date = startDate + INT(RAND()*61)

  * �����¼
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


@ 2,7 SAY "Ʒ��     �������"

* �������λ��
LOCAL nRow, nCol
nRow = 3
nCol = 7

* �����¼
SCAN 
  @ nRow, nCol SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
  nRow = nRow + 1
  IF MOD(nRow - 2, 4) = 0
    nRow = nRow + 1
  ENDIF
ENDSCAN


* ����������ɸߵ�������ѡ��������4000���µļ�¼
*!*	 SELECT ivt_name, ivt_quan ;
*!*	   FROM "../db/Inventory.dbf" ;
*!*	   WHERE ivt_quan <= 4000 ;
*!*	   ORDER BY ivt_quan DESC INTO CURSOR tmpCursor

*!*	 * �������λ��
*!*	 @ 2,7 SAY "Ʒ��     �������"

*!*	 * �����¼
*!*	 SCAN 
*!*	   @ (RECNO()  + 2), 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	 ENDSCAN

*!*	 * ������ʱ������
*!*	 CREATE CURSOR tmpCursor (ivt_name C(50), ivt_quan N(10,2))
*!*	 INDEX ON ivt_quan TAG ivt_quan
*!*	 SET ORDER TO ivt_quan DESCENDING

*!*	 DO WHILE RECNO() < RECCOUNT("Inventory")
*!*	   LOCATE FOR ivt_quan <= 4000
*!*	   IF FOUND()
*!*	     COPY TO tmpCursor
*!*	   ENDIF
*!*	 ENDDO

*!*	 * �������λ��
*!*	 @ 2,7 SAY "Ʒ��     �������"
*!*	 * �����¼
*!*	 SCAN 
*!*	   @ (RECNO()  + 2), 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	 ENDSCAN

*!*	 LOCATE FOR ivt_quan <= 4000
*!*	 IF FOUND()
*!*	   * ������ʱ������
*!*	   CREATE CURSOR tmpCursor (ivt_name C(50), ivt_quan N(10,2))
*!*	   COPY TO tmpCursor
*!*	   INDEX ON ivt_quan TAG ivt_quan
*!*	   SET ORDER TO ivt_quan DESCENDING
*!*	   * �������λ��
*!*	   @ 2,7 SAY "Ʒ��     �������"
*!*	   * �����¼
*!*	   SCAN 
*!*	     @ (RECNO()  + 2), 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	   ENDSCAN
*!*	 ELSE
*!*	   * û�з��������ļ�¼
*!*	   @ 2,7 SAY "û�з��������ļ�¼"
*!*	 ENDIF

*!*	 CREATE CURSOR tmpCursor (ivt_name C(50), ivt_quan N(10,2))
*!*	 INDEX ON ivt_quan TAG ivt_quan
*!*	 SET ORDER TO ivt_quan DESCENDING

*!*	 APPEND FROM "..\db\Inventory.dbf" FOR ivt_quan <= 4000

*!*	 * �������λ��
*!*	 @ 2,7 SAY "Ʒ��     �������"

*!*	 * �����¼
*!*	 SCAN 
*!*	   @ (RECNO()  + 2), 7 SAY ivt_name + " " + TRANS(ivt_quan, "@ 9999.99")
*!*	 ENDSCAN





* �ر����ݿ�
USE IN SELECT("tmpCursor")
USE IN SELECT("Inventory")