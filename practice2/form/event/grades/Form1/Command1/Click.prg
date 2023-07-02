*!*	 LOCAL form2
*!*	 form2 = CREATEOBJECT("Form")
*!*	 form2.Caption = "Form2"
*!*	 form2.Visible = .T.
*!*	 form2.Top = THIS.Top   && 设置Form2在顶层Form1的位置
*!*	 form2.Left = THIS.Left + THIS.Width   && 设置Form2在顶层Form1的位置

*!*	 GRID2 = CREATEOBJECT("Grid")
*!*	 GRID2.Name = "Grid2"
*!*	 GRID2.Visible = .T.
*!*	 GRID2.Top = 50   && 设置Grid2在Form2中的位置
*!*	 GRID2.Left = 50   && 设置Grid2在Form2中的位置
*!*	 GRID2.Width = 300   && 设置Grid2的宽度
*!*	 GRID2.Height = 200   && 设置Grid2的高度
*!*	 GRID2.ColumnCount = 3   && 设置Grid2的列数
*!*	 GRID2.Column1.Header1.Caption = "总分"   && 设置Grid2的第一列标题
*!*	 GRID2.Column2.Header1.Caption = "人数"   && 设置Grid2的第二列标题
*!*	 GRID2.Column3.Header1.Caption = "累计人数"   && 设置Grid2的第三列标题
*!*	 GRID2.RecordSource = "t_distr"   && 设置Grid2的数据源为分布表t_distr

*!*	 command2 = CREATEOBJECT("CommandButton")
*!*	 command2.Name = "command2"
*!*	 command2.Caption = "导出为EXCEL"
*!*	 command2.Top = 260   && 设置command2在Form2中的位置
*!*	 command2.Left = 50   && 设置command2在Form2中的位置
*!*	 command2.Width = 100   && 设置command2的宽度
*!*	 command2.Height = 30   && 设置command2的高度
*!*	 command2.Visible = .T.
*!*	 command2.ParentForm = form2   && 设置command2的父控件为Form2


*!*	 Form2 = CREATEOBJECT("Form")
*!*	 Form2.Parent = THISFORM
*!*	 Form2.Caption = "成绩分布表"

*!*	 WITH Form2
*!*	     .AddObject("Grid2", "Grid")
*!*	     WITH .Grid2
*!*	         .Left = 0
*!*	         .Top = 0
*!*	         .Width = .Parent.Width
*!*	         .Height = .Parent.Height
*!*	         .ColumnCount = 3
*!*	         .Columns(1).Header1.Caption = "总分"
*!*	         .Columns(2).Header1.Caption = "人数"
*!*	         .Columns(3).Header1.Caption = "累计人数"
*!*	         * 可根据需要设置其他Grid2的属性
*!*	     ENDWITH
*!*	 ENDWITH

*!*	 * 设置Form2的其他属性和行为
*!*	 * 例如，可以设置Form2的Left、Top、Width、Height等属性

*!*	 * 显示Form2
*!*	 Form2.Show(1)

*!*	 Form2 = CREATEOBJECT("Form")
*!*	 Form2.Name = "Form2"
*!*	 Form2.AddObject("Grid2", "Grid")
*!*	 Form2.Grid2.Name = "Grid2"
*!*	 Form2.Grid2.Width = 400 && 设置 Grid2 的宽度
*!*	 Form2.Grid2.Height = 300 && 设置 Grid2 的高度
*!*	 Form2.Show(1)  && 以模态方式显示 Form2

do form "D:\Desktop\vfp-practices\practice2\form\scx\score_distr.scx"