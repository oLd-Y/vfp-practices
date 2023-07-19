Define Class MainFormInfo As Session
	_FormW = 0	&& 主Form宽
	_FormH = 0	&& 主Form高
	
	_PFGridL = 0	&& PageFrame的Grid的Left
	_PFGridT = 0	&& PageFrame的Grid的Top
	_PFGridW = 0	&& PageFrame的Grid的Width
	_PFGridH = 0	&& PageFrame的Grid的Height
	
	Procedure Init
		LParameters lnTitleBar
		
		lnTitleBar = ABS(lnTitleBar - 1) * 20
		
		This._FormW = SysMetric(21) - 6
		This._FormH = SysMetric(22) - 5 + lnTitleBar
		
		This._PFGridL = 0
		This._PFGridT = 99
		This._PFGridW = SysMetric(21) - 10
		This._PFGridH = SysMetric(22) - This.TaskbarH() - This._PFGridT + 3
	EndProc
	
	* Get
	Function FormW
		Return This._FormW
	EndFunc
	
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
	
	* 获取底部任务栏高度
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
		
		* ICase(0=nPos,'左', 1=nPos,'顶', 2=nPos,'右', 3=nPos,'下', '浮动')
		If lnPos = 3
			lcTaskbarH = lnBottom - lnTop
		EndIf
		
		Return lcTaskbarH
	EndFunc
EndDefine