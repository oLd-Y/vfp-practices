&& lParameters cEmp, cNetPath, cDirName
&&
&& AddProperty(this, "emp", cEmp)
&& AddProperty(this, "net_path", cNetPath)
&& AddProperty(this, "dir_name", cDirName)
&& AddProperty(this, "isOut", false)

With This
	.Text1.value = file_info.pass_num
	.Text2.value = file_info.id_card
	.Text3.value = file_info.stu_name
	.Text4.value = file_info.high_name
	.Text5.value = file_info.chinese
	.Text6.value = file_info.math
	.Text7.value = file_info.composite
	.Text8.value = file_info.english
	.Text9.value = file_info.volu_name1
	.Text10.value = file_info.volu_name2
	.Text11.value = file_info.volu_name3
EndWith