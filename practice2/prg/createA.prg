CREATE TABLE ..\db\A (high_code C(3), high_name C(30))

* ���� 200 ����¼
FOR i = 1 TO 200 
    tmp_code = PADL(i, 3, "0") 
    tmp_name = "�Ϻ��� " + tmp_code + " ��ѧ" 
    APPEND BLANK 
    REPLACE NEXT 1 high_code WITH tmp_code
    REPLACE NEXT 1 high_name WITH tmp_name
ENDFOR
