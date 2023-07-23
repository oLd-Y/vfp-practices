
Do Case
    Case Len(AllTrim(ThisForm.Text1.Value)) # 8
        MessageBox("   准考证号长度有误", 16, "错误")
        ThisForm.Text1.SetFocus
        Return
    Case Len(AllTrim(ThisForm.Text2.Value)) # 18
        MessageBox("   身份证号长度有误", 16, "错误")
        ThisForm.Text2.SetFocus
        Return
    Case ThisForm.Text5.Value > 150 .OR. ThisForm.Text5.Value < 0
        MessageBox("   语文成绩有误", 16, "错误")
        ThisForm.Text5.SetFocus
        Return
    Case ThisForm.Text6.Value > 150 .OR. ThisForm.Text6.Value < 0
        MessageBox("   数学成绩有误", 16, "错误")
        ThisForm.Text6.SetFocus
        Return
    Case ThisForm.Text7.Value > 150 .OR. ThisForm.Text7.Value < 0
        MessageBox("   英语成绩有误", 16, "错误")
        ThisForm.Text7.SetFocus
        Return
    Case ThisForm.Text8.Value > 210 .OR. ThisForm.Text8.Value < 0
        MessageBox("   综合成绩有误", 16, "错误")
        ThisForm.Text8.SetFocus
        Return
EndCase


m.all_score = ThisForm.Text5.Value + ThisForm.Text6.Value + ThisForm.Text7.Value + ThisForm.Text8.Value
Select file_info
Go Top
Locate For all_score < m.all_score
m.rank = file_info.rank

Append Blank
Replace pass_num with ThisForm.Text1.Value,;
        id_card with ThisForm.Text2.Value,;
        stu_name with ThisForm.Text3.Value,;
        high_name with ThisForm.Text4.Value,;
        chinese with ThisForm.Text5.Value,;
        math with ThisForm.Text6.Value,;
        english with ThisForm.Text7.Value,;
        composite with ThisForm.Text8.Value,;
        volu_name1 with ThisForm.Combo1.Value,;
        volu_name2 with ThisForm.Combo2.Value,;
        volu_name3 with ThisForm.Combo3.Value,;
        all_score with m.all_score,;
        rank with m.rank

Scan Rest
    Replace rank with rank + 1
EndScan

Flush

ThisForm.isAdd = true
ThisForm.Release()

&& do case
&& 	case (AllTrim(ThisForm.Text7.Value)) > thisForm.text4.value
&& 		MessageBox("   出库托盘数不应大于当前托盘数", 64, "信息")
&& 		thisForm.text7.setFocus
&& 		return
&&
&& 	case (AllTrim(ThisForm.Text8.Value)) > (AllTrim(ThisForm.Text5.Value))
&& 		MessageBox("   出库件数不应大于当前件数", 64, "信息")
&& 		thisForm.text8.setFocus
&& 		return
&&
&& 	case thisForm.text9.value > (AllTrim(ThisForm.Text6.Value))
&& 		MessageBox("   出库重量不应大于当前重量", 64, "信息")
&& 		thisForm.text9.setFocus
&& 		return
&&
&& 	case (AllTrim(ThisForm.Text7.Value)) < 0
&& 		MessageBox("   出库托盘数不应小于0", 64, "信息")
&& 		thisForm.text7.setFocus
&& 		return
&&
&& 	case (AllTrim(ThisForm.Text8.Value)) < 0
&& 		MessageBox("   出库件数不应小于0", 64, "信息")
&& 		thisForm.text8.setFocus
&& 		return
&&
&& 	case thisForm.text9.value < 0
&& 		MessageBox("   出库重量不应小于0", 64, "信息")
&& 		thisForm.text9.setFocus
&& 		return
&&
&& 	case (AllTrim(ThisForm.Text7.Value)) + (AllTrim(ThisForm.Text8.Value)) + thisForm.text9.value = 0
&& 		return
&& endCase
&&
&&
&& select 21
&& * 获取服务器时间
&& lcDateTime = SubStr(TtoC(DateTime() ), 3)
&& if _vfp.startMode # 0
&& 	use StrTran(thisForm.net_path, thisForm.dir_name, "\pt\ptsys.cfg") again alias DT22 share
&& 	lcDateTime = Left(SYS_CD, 17)
&& endIf
&&
&& * 出库
&& select CK
&& replace next 1	DQTP with thisform.text4.value - (AllTrim(ThisForm.Text7.Value)),;
&& 				DQJS with (AllTrim(ThisForm.Text5.Value)) - (AllTrim(ThisForm.Text8.Value)),;
&& 				DQZL with (AllTrim(ThisForm.Text6.Value)) - thisform.text9.value,;
&& 				YSJE with YSJE + thisForm.text9.value * JFDJ * (CtoD(Left(lcDateTime, 8) ) - JFRQ + 1)
&& flush
&&
&& select 21
&& * 追加操作记录
&& use (thisForm.net_path + [ckls]) again share
&& append blank
&& replace next 1	PH   with thisForm.text1.value,;
&& 				DT   with CtoT(lcDateTime),;
&& 				LX   with "出库",;
&& 				TP   with -1 * (AllTrim(ThisForm.Text7.Value)),;
&& 				JS   with -1 * (AllTrim(ThisForm.Text8.Value)),;
&& 				ZL   with -1 * thisForm.text9.value,;
&& 				CKMC with CK.CKMC,;
&& 				EMP  with thisForm.emp
&& use in 21
&&
&& thisForm.isOut = true
&& thisForm.release