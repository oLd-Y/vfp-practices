m.excelFile = GETFILE("xls", "EXCEL ����", "����", 0)
IF !EMPTY(m.excelFile)
    SELECT t_distr
    COPY TO (m.excelFile) TYPE XL5 FIELDS EXCEPT all_score && ����񵼳�Ϊ Excel ..
ENDIF

