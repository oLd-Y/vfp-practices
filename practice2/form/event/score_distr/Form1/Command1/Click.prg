m.excelFile = GETFILE("xls", "EXCEL 名称", "导出", 0)
IF !EMPTY(m.excelFile)
    SELECT t_distr
    COPY TO (m.excelFile) TYPE XL5 FIELDS EXCEPT all_score && 将表格导出为 Excel ..
ENDIF

