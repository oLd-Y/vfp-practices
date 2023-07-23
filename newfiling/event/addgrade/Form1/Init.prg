&& lParameters cEmp, cNetPath, cDirName
&&
&& AddProperty(this, "emp", cEmp)
&& AddProperty(this, "net_path", cNetPath)
&& AddProperty(this, "dir_name", cDirName)
AddProperty(this, "isAdd", false)


Select university
Go Top
With This
&& 	.Text1.Value = file_info.pass_num
&& 	.Text2.Value = file_info.id_card
&& 	.Text3.Value = file_info.stu_name
&& 	.Text4.Value = file_info.high_name
&& 	.Text5.Value = file_info.chinese
&& 	.Text6.Value = file_info.math
&& 	.Text7.Value = file_info.english
&& 	.Text8.Value = file_info.composite

    .Combo1.Value = "university.univ_name"
    .Combo2.Value = "university.univ_name"
    .Combo3.Value = "university.univ_name"
EndWith