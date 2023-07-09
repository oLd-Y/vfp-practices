


m.excelFile = GETFILE("xls", "EXCEL 名称", "导出", 0)
IF !EMPTY(m.excelFile)
    SELECT tb_score_distr
    COPY TO (m.excelFile) TYPE XL5 FIELDS EXCEPT all_score && 将表格导出为 Excel ..
ENDIF

MESSAGEBOX("导出成功！", 64, "提示")
