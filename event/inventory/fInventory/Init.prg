WITH THISFORM.gridInventory
	.Left = 10
	.Top = 10
	.Width = 600
	.Height = 500
	.Column1.ControlSource = "ivt_date"
	.Column2.ControlSource = "ivt_type"
	.Column3.ControlSource = "ivt_name"
	.Column4.ControlSource = "ivt_quan"
ENDWITH

WITH THISFORM.txtProductName
    .Left = THISFORM.gridInventory.Left
    .Top = THISFORM.gridInventory.Height + 20
    .Width = 200
    .ControlSource = "Inventory.ivt_name"
ENDWITH

WITH THISFORM.cmdSave
    .Left = THISFORM.txtProductName.Width + 20
    .Top = THISFORM.gridInventory.Height + 20
    .Width = 70
    .Height = 50
ENDWITH

THISFORM.gridInventory.SETFOCUS