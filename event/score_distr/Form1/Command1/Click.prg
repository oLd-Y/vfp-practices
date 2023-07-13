

cd D:\Desktop\
m.excelFile = GETFILE("xls", "EXCEL 名称", "导出", 0)
IF !EMPTY(m.excelFile)
    SELECT score_distr
    COPY TO (m.excelFile) TYPE XL5 FIELDS EXCEPT all_score && 将表格导出为 Excel ..
ENDIF

if file(m.excelFile)
    MESSAGEBOX("导出成功！", 64, "提示")
else
    MESSAGEBOX("导出失败，请重新检查", 48, "错误")
endif
cd D:\Desktop\vfp-practices\grade\cpn\