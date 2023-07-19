Define Class AppInfo As Session
	mcDirName = ""	&& 应用名称
	mcLocPath = ""	&& 本地路径
	mcNetPath = ""	&& 服务器路径
	mcNetDate = ""	&& 服务器日期
	mcNetTime = ""	&& 服务器时间
	mcActDate = ""	&& 记账日期
	mcNetStat = ""	&& 服务器状态
	
	* set
	Function setDirName
		lParameters cDirName
		
		This.mcDirName = cDirName
	EndFunc
	Function setLocPath
		lParameters cLocPath
		
		This.mcLocPath = cLocPath
	EndFunc
	Function setNetPath
		lParameters cNetPath
		
		This.mcNetPath = cNetPath
	EndFunc
	Function setNetDate
		lParameters cNetDate
		
		This.mcNetDate = cNetDate
	EndFunc
	Function setNetTime
		lParameters cNetTime
		
		This.mcNetTime = cNetTime
	EndFunc
	Function setActDate
		lParameters cActDate
		
		This.mcActDate = cActDate
	EndFunc
	Function setNetStat
		lParameters cNetStat
		
		This.mcNetStat = cNetStat
	EndFunc
	
	* get
	Function getDirName
		Return This.mcDirName
	EndFunc
	Function getLocPath
		Return This.mcLocPath
	EndFunc
	Function getNetPath
		Return This.mcNetPath
	EndFunc
	Function getNetDate
		Return This.mcNetDate
	EndFunc
	Function getNetTime
		Return This.mcNetTime
	EndFunc
	Function getActDate
		Return This.mcActDate
	EndFunc
	Function getNetStat
		Return This.mcNetStat
	EndFunc
EndDefine