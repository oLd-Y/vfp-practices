Set Century Off				&& ָ�����ڵ����Ϊ��λ��
Set Collate To "MACHINE"
Set Color To				&& ������ɫΪĬ��״̬
Set Console On				&& �����н�������VFP�����ڻ����û��Զ��崰��
Set Date Ansi				&& ָ��������ʾ��ʽΪyy.mm.dd
Set Decimals To 2
Set Deleted On
Set Escape Off				&& ��ֹESC�ж����еĳ���
Set Exclusive Off			&& ���������ϵ��û�������޸������ϴ򿪵ı�
Set Mark To "-"
Set MemoWidth To 200
Set Notify Off
Set Notify Cursor Off		&& ����״̬����ʾ������Ϣ
*Set Help Off				&& ����F1��ִ��HELP����ʱ��ʾ��������
*Set Help To Help.chm		&& ָ�������ļ�
Set Hours To 24
Set Safety Off				&& ָ���ڸ�д�����ļ�ʱ����ʾȷ�϶Ի���
Set Status Off
Set Status Bar Off			&& �ر�VFP״̬��
Set SysMenu Off				&& �ر�ϵͳ�˵�
Set Talk Off				&& �ر�������ʾ
Clear						&& ���������
*Clear All					&& �������
Close Databases				&& �ر����ݿ�

If _VFP.StartMode = 0
	_Screen.Visible = .T.
	Activate Screen
Else
	_Screen.Visible = .F.
	On Error Do ErrorHandler With Error(), Message(), Message(1), Program(), LineNo()
EndIf
SqlSetProp(0, "DispLogin", 3)  && ����ʾSQL��¼��ʾ

* ������
Set Library To FoxJson.fll  Additive
Set Library To MyFll.fll Additive

Set Procedure To foxjson, foxjson_parse Additive
Set Procedure To MyFunc Additive

* ��Ļ�ߴ�
Public gnFormW, gnFormH
gnFormW = SysMetric(21) - 6
gnFormH = SysMetric(22) - 5
* �������ڡ�ʱ��
Public gcNetDate, gcNetTime
* ��������
Public gcActDate, gcNetStat
* ͨ����Ϣ
Public gcLeadStr, gcDeptStr
* ������Ϣ
Public gcLocMac
* �û���Ϣ
Public gcUserLog, gcUserNo, gcUserDept, gcUserName, gcUserAuth, gcUserKey
* һ���ӱ��������ӱ��������ӱ������رձ�־
Public glSub1Exit, glSub2Exit, glSub3Exit