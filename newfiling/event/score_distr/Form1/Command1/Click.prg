

cd D:\Desktop\
m.excelFile = GETFILE("xls", "EXCEL ����", "����", 0)
IF !EMPTY(m.excelFile)
    SELECT score_distr
    COPY TO (m.excelFile) TYPE XL5 FIELDS EXCEPT all_score && ����񵼳�Ϊ Excel ..
ENDIF

if file(m.excelFile)
    MESSAGEBOX("�����ɹ���", 64, "��ʾ")
else
    MESSAGEBOX("����ʧ�ܣ������¼��", 48, "����")
endif
cd D:\Desktop\vfp-practices\grade\cpn\