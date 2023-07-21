&& With This
&& 	.Text1.value = file_info.pass_num
&& 	.Text2.value = file_info.id_card
&& 	.Text3.value = file_info.stu_name
&& 	.Text4.value = file_info.high_name
&& 	.Text5.value = file_info.chinese
&& 	.Text6.value = file_info.math
&& 	.Text7.value = file_info.composite
&& 	.Text8.value = file_info.english
&& 	.Text9.value = file_info.volu_name1
&& 	.Text10.value = file_info.volu_name2
&& 	.Text11.value = file_info.volu_name3
&& EndWith

Do Case
    Case Len(ThisForm.Text1.Value) # 8
        MessageBox("   准考证号长度有误", 64, "信息")
        ThisForm.Text1.SetFocus
        Return
    Case Len(ThisForm.Text2.Value) # 18
        MessageBox("   身份证号长度有误", 64, "信息")
        ThisForm.Text2.SetFocus
        Return
    Case ThisForm.Text5.Value > 100 .OR. ThisForm.Text5.Value < 0
        MessageBox("   语文成绩有误", 64, "信息")
        ThisForm.Text5.SetFocus
        Return
    Case ThisForm.Text6.Value > 100 .OR. ThisForm.Text6.Value < 0
        MessageBox("   数学成绩有误", 64, "信息")
        ThisForm.Text6.SetFocus
        Return
    Case ThisForm.Text7.Value > 100 .OR. ThisForm.Text7.Value < 0
        MessageBox("   英语成绩有误", 64, "信息")
        ThisForm.Text7.SetFocus
        Return
    Case ThisForm.Text8.Value > 100 .OR. ThisForm.Text8.Value < 0
        MessageBox("   综合成绩有误", 64, "信息")
        ThisForm.Text8.SetFocus
        Return
EndCase


&& do case
&& 	case thisForm.text7.value > thisForm.text4.value
&& 		MessageBox("   出库托盘数不应大于当前托盘数", 64, "信息")
&& 		thisForm.text7.setFocus
&& 		return
&&
&& 	case thisForm.text8.value > thisForm.text5.value
&& 		MessageBox("   出库件数不应大于当前件数", 64, "信息")
&& 		thisForm.text8.setFocus
&& 		return
&&
&& 	case thisForm.text9.value > thisForm.text6.value
&& 		MessageBox("   出库重量不应大于当前重量", 64, "信息")
&& 		thisForm.text9.setFocus
&& 		return
&&
&& 	case thisForm.text7.value < 0
&& 		MessageBox("   出库托盘数不应小于0", 64, "信息")
&& 		thisForm.text7.setFocus
&& 		return
&&
&& 	case thisForm.text8.value < 0
&& 		MessageBox("   出库件数不应小于0", 64, "信息")
&& 		thisForm.text8.setFocus
&& 		return
&&
&& 	case thisForm.text9.value < 0
&& 		MessageBox("   出库重量不应小于0", 64, "信息")
&& 		thisForm.text9.setFocus
&& 		return
&&
&& 	case thisForm.text7.value + thisForm.text8.value + thisForm.text9.value = 0
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
&& replace next 1	DQTP with thisform.text4.value - thisform.text7.value,;
&& 				DQJS with thisform.text5.value - thisform.text8.value,;
&& 				DQZL with thisform.text6.value - thisform.text9.value,;
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
&& 				TP   with -1 * thisForm.text7.value,;
&& 				JS   with -1 * thisForm.text8.value,;
&& 				ZL   with -1 * thisForm.text9.value,;
&& 				CKMC with CK.CKMC,;
&& 				EMP  with thisForm.emp
&& use in 21
&&
&& thisForm.isOut = true
&& thisForm.release