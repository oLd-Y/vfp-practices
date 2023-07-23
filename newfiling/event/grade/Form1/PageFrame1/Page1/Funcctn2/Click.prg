do form addgrade To isAdd

if isAdd
	This.Parent.Grid1.Refresh
	This.Parent.Grid1.AfterRowColChange
endIf
This.Parent.Grid1.SetFocus