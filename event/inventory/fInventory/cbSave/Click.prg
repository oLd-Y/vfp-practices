txt = lTrim(Inventory.ivt_name)

if empty(allTrim(thisForm.txtProductName.value))
	messagebox("����������Ʒ����", 16, "��ʾ")
    thisForm.txtProductName.setFocus()
else
	replace next 1 Inventory.ivt_name with lTrim(Inventory.ivt_name)
	thisForm.gridInventory.refresh
	thisForm.gridInventory.setFocus()
endif

