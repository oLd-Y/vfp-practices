Define Class LogUser As Session
	mcLog = ""	&& 用户登录pt时存储用户信息文件的绝对路径
	mcNo = ""	&& 用户工号
	mcName = ""	&& 用户姓名
	mcDept = ""	&& 用户部门
	mcAuth = Replicate("0", 20)	&& 用户权限
	mcKey = ""	&& 用户key
	
	* set
	Function setLog
		lParameters cLog
		
		This.mcLog = cLog
	EndFunc
	Function setNo
		lParameters cNo
		
		This.mcNo = cNo
	EndFunc
	Function setName
		lParameters cName
	
		This.mcName = cName
	EndFunc
	Function setDept
		lParameters cDept
	
		This.mcDept = cDept
	EndFunc
	Function setAuth
		lParameters cAuth
	
		This.mcAuth = cAuth
	EndFunc
	Function setKey
		lParameters cKey
	
		This.mcKey = cKey
	EndFunc
	* get
	Function getLog
		Return This.mcLog
	EndFunc
	Function getNo
		Return This.mcNo
	EndFunc
	Function getName
		Return This.mcName
	EndFunc
	Function getDept
		Return This.mcDept
	EndFunc
	Function getAuth
		Return This.mcAuth
	EndFunc
	Function getKey
		Return This.mcKey
	EndFunc
EndDefine