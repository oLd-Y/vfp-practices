txt = lTrim(Inventory.ivt_name)

if empty(allTrim(thisForm.txtProductName.value))
	messagebox("请重新输入品名！", 16, "提示")
    thisForm.txtProductName.setFocus()
else
	replace next 1 Inventory.ivt_name with lTrim(Inventory.ivt_name)
	thisForm.gridInventory.refresh
	thisForm.gridInventory.setFocus()
endif

