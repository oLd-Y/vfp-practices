Local Array laForm[1]
Local loForm1

modi form addgrade Nowait
&& Create Form lcFormPath + [frmMain.scx] As Form Nowait
ASelObj(laForm,1)

true = .T.
false = .F.

&&  Form1
loForm1 = laForm[1]

with loForm1

	.AutoCenter = .T.
	.BorderStyle = 2
    .Caption = "补录成绩："


endwith

&& 准考证号 Label1
loLabel1 = loForm1.Label1
With loLabel1
    .Caption = "准考证号："
EndWith

&& 身份证号 Label2
loLabel2 = loForm1.Label2
With loLabel2
    .Caption = "身份证号："
EndWith

&& 学生姓名 Label3
loLabel3 = loForm1.Label3
With loLabel3
    .Caption = "学生姓名："
EndWith

&& 高中名称 Label4
loLabel4 = loForm1.Label4
With loLabel4
    .Caption = "高中名称："
EndWith

&& 语文 Label5
loLabel5 = loForm1.Label5
With loLabel5
    .Caption = "语文："
EndWith

&& 数学 Label6
loLabel6 = loForm1.Label6
With loLabel6
    .Caption = "数学："
EndWith

&& 英语 Label7
loLabel7 = loForm1.Label7
With loLabel7
    .Caption = "英语："
EndWith

&& 综合 Label8
loLabel8 = loForm1.Label8
With loLabel8
    .Caption = "综合："
EndWith

&& 综合 Label9
loLabel9 = loForm1.Label9
With loLabel9
    .Caption = "第一志愿："
EndWith

&& 排名 Label10
loLabel10 = loForm1.Label10
With loLabel10
    .Caption = "第二志愿："
EndWith

&& 第一志愿 Label11
loLabel11 = loForm1.Label11
With loLabel11
    .Caption = "第三志愿："
EndWith

&& 准考证号 Text1
loText1 = loForm1.Text1
With loText1
    .Alignment = 0 && 靠左
    .Enabled = .T.
    .ReadOnly = .F.

EndWith

&& 身份证号 Text2
loText2 = loForm1.Text2
With loText2
    .Alignment = 0
    .Enabled = .T.
    .ReadOnly = .F.
EndWith

&& 学生姓名 Text3
loText3 = loForm1.Text3
With loText3
    .Alignment = 0
    .Enabled = .T.
    .ReadOnly = .F.
EndWith

&& 高中名称 Text4
loText4 = loForm1.Text4
With loText4
    .Alignment = 0
    .Enabled = .T.
    .ReadOnly = .F.
EndWith

&& 语文 Text5
loText5 = loForm1.Text5
With loText5
    .Alignment = 0
    .Enabled = .T.
    .ReadOnly = .F.
EndWith

&& 数学 Text6
loText6 = loForm1.Text6
With loText6
    .Alignment = 0
    .Enabled = .T.
    .ReadOnly = .F.
EndWith

&& 英语 Text7
loText7 = loForm1.Text7
With loText7
    .Alignment = 0
    .Enabled = .T.
    .ReadOnly = .F.
EndWith

&& 综合 Text8
loText8 = loForm1.Text8
With loText8
    .Alignment = 0
    .Enabled = .T.
    .ReadOnly = .F.
EndWith

&& 第一志愿 Combo1
loCombo1 = loForm1.Combo1
With loCombo1
    .RowSource = "file_info.volu_name1"
    .RowSourceType = 2
EndWith

&& 第二志愿 Combo2
loCombo2 = loForm1.Combo2
With loCombo2
    .RowSource = "file_info.volu_name2"
    .RowSourceType = 2
EndWith

&& 第三志愿 Combo3
loCombo3 = loForm1.Combo3
With loCombo3
    .RowSource = "file_info.volu_name3"
    .RowSourceType = 2
EndWith


&& 跟随设置


do cp2addgrade