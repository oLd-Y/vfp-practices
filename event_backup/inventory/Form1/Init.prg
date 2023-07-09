WITH THISFORM.Grid1
	.Left = 10
	.Top = 10
	.Width = 600
	.Height = 500
	.highlightStyle = 2
	.Column1.ControlSource = "ivt_date"
	.Column2.ControlSource = "ivt_type"
	.Column3.ControlSource = "ivt_name"
	.Column4.ControlSource = "ivt_quan"

ENDWITH

WITH THISFORM.Text1
    .Left = THISFORM.Grid1.Left
    .Top = THISFORM.Grid1.Height + 20
    .Width = 200
    .ControlSource = "Inventory.ivt_name"
ENDWITH

WITH THISFORM.Command1
    .Left = THISFORM.Text1.Width + 20
    .Top = THISFORM.Grid1.Height + 20
    .Width = 70
    .Height = 50
ENDWITH

THISFORM.Grid1.SETFOCUS