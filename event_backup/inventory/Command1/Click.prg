txt = lTrim(Inventory.ivt_name)

if empty(allTrim(thisForm.Text1.value))
	messagebox("����������Ʒ����", 16, "��ʾ")
    thisForm.Text1.setFocus()
else
*!* 	replace next 1 Inventory.ivt_name with lTrim(Inventory.ivt_name)
	replace next 1 Inventory.ivt_name with LTRIM(THISFORM.Text1.VALUE)
	thisForm.Grid1.refresh
	thisForm.Grid1.setFocus()
endif

