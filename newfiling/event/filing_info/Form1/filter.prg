lParameters loPage1

&& public cond
&& cond = "CKZT = " + Str(loPage1.zt.value - 1, 1)
&&
&& if loPage1.ck.value # "ȫ��"
&& 	cond = cond + " and CKMC = '" + loPage1.ck.value + "'"
&& endIf
&&
&& if not AllTrim(loPage1.Text1.value) == ""
&& 	cond = cond + " and RKPH = '" + AllTrim(loPage1.ph.value) + "'"
&& endIf
&&
&& if not AllTrim(loPage1.dm.value) == ""
&& 	cond = cond + " and KHDM = '" + AllTrim(loPage1.dm.value) + "'"
&& endIf
&&
&& if not AllTrim(loPage1.hw.value) == ""
&& 	cond = cond + " and '" + AllTrim(loPage1.hw.value) + "' $ HWMC"
&& endIf
&&
&& if not AllTrim(loPage1.hz.value) == ""
&& 	cond = cond + " and '" + AllTrim(loPage1.hz.value) + "' $ KHMC"
&& endIf
&&
&& select CK
&& set filter to &cond.
&& go top
&&
&& loPage1.grid1.refresh
&& loPage1.grid1.AfterRowColChange
&&
&& release cond

cond = ".T."
&& ѧ�����Ʋ�Ϊ��
If !Empty(AllTrim(loPage1.Text3.Value))
    cond = cond + " and stu_name = '" + AllTrim(loPage1.Text3.Value) + "'"
EndIf

&& ׼��֤�Ų�Ϊ��
If !Empty(AllTrim(loPage1.Text4.Value))
    cond = cond + " and pass_num = '" + AllTrim(loPage1.Text4.Value) + "'"
EndIf

&& ��ѧ���Ʋ�Ϊ��
If !Empty(AllTrim(loPage1.Text5.Value))
    cond = cond + " and high_name = '" + AllTrim(loPage1.Text5.Value) + "'"
EndIf

select file_info
set filter to &cond



loPage1.Grid2.Refresh
