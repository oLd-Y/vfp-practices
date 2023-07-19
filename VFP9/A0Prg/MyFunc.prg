* 提示窗口
Function Tip
	lParameter msg, way
	* 1 - info; 2 - warn; 3 - ask
	lcResult = 0
	Do Form Tip With msg, way To lcResult
	
	Return lcResult
EndFunc

* 获取时间
Function GetServerDT
	lParameters cPath, cName
	dt = ""
	Use StrTran(cPath, cName, "\PT\PTSYS.CFG") In 32767 Again Alias MY_GET_DT Share
	dt = Left(MY_GET_DT.SYS_CD, 17)
	Use In 32767
	
	Return dt
EndFunc