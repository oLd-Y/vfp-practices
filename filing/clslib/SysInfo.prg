define class SysInfo as Session
	_FormW = 0	&& ��Form��
	_FormH = 0	&& ��Form��

	_PFGridL = 0	&& PageFrame��Grid��Left
	_PFGridT = 0	&& PageFrame��Grid��Top
	_PFGridW = 0	&& PageFrame��Grid��Width
	_PFGridH = 0	&& PageFrame��Grid��Height

	procedure init
		this._FormW = SysMetric(21) - 6
		this._FormH = SysMetric(22) - 5

		this._PFGridL = 0
		this._PFGridT = 99
		this._PFGridW = SysMetric(21) - 10
		this._PFGridH = SysMetric(22) - This.TaskbarH() - This._PFGridT + 3
	endProc

	* Get
	function FormW
		Return This._FormW
	endFunc

	Function FormH
		Return This._FormH
	EndFunc

	Function PFGridL
		Return This._PFGridL
	EndFunc

	Function PFGridT
		Return This._PFGridT
	EndFunc

	Function PFGridW
		Return This._PFGridW
	EndFunc

	Function PFGridH
		Return This._PFGridH
	EndFunc

	* ��ȡ�ײ��������߶�
	Function TaskbarH
		lcTaskbarH = 0
		Declare Long SHAppBarMessage In shell32 Long, String@
			cc = Replicate(Chr(0), 32)
			cc = BinToC(4 + Len(cc), 'rs') + cc
			SHAppBarMessage(0x00000005, @cc)
		Clear Dlls

		lnPos		= CToBin(SubStr(cc, 13 + 0, 4), 'rs')
		lnLeft		= CToBin(SubStr(cc, 13 + 4, 4), 'rs')
		lnTop		= CToBin(SubStr(cc, 13 + 8, 4), 'rs')
		lnRight		= CToBin(SubStr(cc, 13 + 12, 4), 'rs')
		lnBottom	= CToBin(SubStr(cc, 13 + 16, 4), 'rs')

		* ICase(0=nPos,'��', 1=nPos,'��', 2=nPos,'��', 3=nPos,'��', '����')
		If lnPos = 3
			lcTaskbarH = lnBottom - lnTop
		EndIf

		Return lcTaskbarH
	EndFunc
EndDefine