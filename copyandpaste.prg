WITH THISFORM.txtProductName
    .Left = 10
    .Top = 10
    .Width = 200
    .ControlSource = "Inventory.ivt_name"
ENDWITH	

WITH THISFORM.cmdSave
    .Left = 220
    .Top = 10
    .Click = [DO THISFORM.SaveProduct()]
ENDWITH	