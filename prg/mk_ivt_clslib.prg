create classlib ivt_clslib

DEFINE CLASS CmdSave AS CommandButton
    caption = 'Save'
    left = 10
    top = 10
    height = 25
    width = 50
    visible = .T.
    procedure Click
        txt = LTRIM(Inventory.ivt_name)

        if EMPTY(ALLTRIM(thisForm.txtProductName.value))
            messagebox("请重新输入品名！", 16, "提示")
            thisForm.txtProductName.setFocus()
        else
            replace next 1 Inventory.ivt_name with LTRIM(Inventory.ivt_name)
            thisForm.gridInventory.refresh
            thisForm.gridInventory.setFocus()
        endif
ENDDEFINE

ADD CLASS CmdSave TO ivt_clslib
