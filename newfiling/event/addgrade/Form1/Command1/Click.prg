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
        MessageBox("   ׼��֤�ų�������", 64, "��Ϣ")
        ThisForm.Text1.SetFocus
        Return
    Case Len(ThisForm.Text2.Value) # 18
        MessageBox("   ���֤�ų�������", 64, "��Ϣ")
        ThisForm.Text2.SetFocus
        Return
    Case ThisForm.Text5.Value > 100 .OR. ThisForm.Text5.Value < 0
        MessageBox("   ���ĳɼ�����", 64, "��Ϣ")
        ThisForm.Text5.SetFocus
        Return
    Case ThisForm.Text6.Value > 100 .OR. ThisForm.Text6.Value < 0
        MessageBox("   ��ѧ�ɼ�����", 64, "��Ϣ")
        ThisForm.Text6.SetFocus
        Return
    Case ThisForm.Text7.Value > 100 .OR. ThisForm.Text7.Value < 0
        MessageBox("   Ӣ��ɼ�����", 64, "��Ϣ")
        ThisForm.Text7.SetFocus
        Return
    Case ThisForm.Text8.Value > 100 .OR. ThisForm.Text8.Value < 0
        MessageBox("   �ۺϳɼ�����", 64, "��Ϣ")
        ThisForm.Text8.SetFocus
        Return
EndCase


&& do case
&& 	case thisForm.text7.value > thisForm.text4.value
&& 		MessageBox("   ������������Ӧ���ڵ�ǰ������", 64, "��Ϣ")
&& 		thisForm.text7.setFocus
&& 		return
&&
&& 	case thisForm.text8.value > thisForm.text5.value
&& 		MessageBox("   ���������Ӧ���ڵ�ǰ����", 64, "��Ϣ")
&& 		thisForm.text8.setFocus
&& 		return
&&
&& 	case thisForm.text9.value > thisForm.text6.value
&& 		MessageBox("   ����������Ӧ���ڵ�ǰ����", 64, "��Ϣ")
&& 		thisForm.text9.setFocus
&& 		return
&&
&& 	case thisForm.text7.value < 0
&& 		MessageBox("   ������������ӦС��0", 64, "��Ϣ")
&& 		thisForm.text7.setFocus
&& 		return
&&
&& 	case thisForm.text8.value < 0
&& 		MessageBox("   ���������ӦС��0", 64, "��Ϣ")
&& 		thisForm.text8.setFocus
&& 		return
&&
&& 	case thisForm.text9.value < 0
&& 		MessageBox("   ����������ӦС��0", 64, "��Ϣ")
&& 		thisForm.text9.setFocus
&& 		return
&&
&& 	case thisForm.text7.value + thisForm.text8.value + thisForm.text9.value = 0
&& 		return
&& endCase
&&
&&
&& select 21
&& * ��ȡ������ʱ��
&& lcDateTime = SubStr(TtoC(DateTime() ), 3)
&& if _vfp.startMode # 0
&& 	use StrTran(thisForm.net_path, thisForm.dir_name, "\pt\ptsys.cfg") again alias DT22 share
&& 	lcDateTime = Left(SYS_CD, 17)
&& endIf
&&
&& * ����
&& select CK
&& replace next 1	DQTP with thisform.text4.value - thisform.text7.value,;
&& 				DQJS with thisform.text5.value - thisform.text8.value,;
&& 				DQZL with thisform.text6.value - thisform.text9.value,;
&& 				YSJE with YSJE + thisForm.text9.value * JFDJ * (CtoD(Left(lcDateTime, 8) ) - JFRQ + 1)
&& flush
&&
&& select 21
&& * ׷�Ӳ�����¼
&& use (thisForm.net_path + [ckls]) again share
&& append blank
&& replace next 1	PH   with thisForm.text1.value,;
&& 				DT   with CtoT(lcDateTime),;
&& 				LX   with "����",;
&& 				TP   with -1 * thisForm.text7.value,;
&& 				JS   with -1 * thisForm.text8.value,;
&& 				ZL   with -1 * thisForm.text9.value,;
&& 				CKMC with CK.CKMC,;
&& 				EMP  with thisForm.emp
&& use in 21
&&
&& thisForm.isOut = true
&& thisForm.release