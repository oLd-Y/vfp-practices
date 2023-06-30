Form2 = CREATEOBJECT("Form")
Form2.Caption = "?????"

WITH Form2
    .AddObject("Grid2", "Grid")
    WITH .Grid2
        .recordSource = "t_score"
        .ColumnCount = 3
        calc count()
        .Columns(1).Header1.Caption = "??"
        .Columns(2).Header1.Caption = "??"
        .Columns(3).Header1.Caption = "????"
    ENDWITH
ENDWITH



Form2.Show(1)