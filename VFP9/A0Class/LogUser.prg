Define Class LogUser As Session
	mcLog = ""	&& �û���¼ptʱ�洢�û���Ϣ�ļ��ľ���·��
	mcNo = ""	&& �û�����
	mcName = ""	&& �û�����
	mcDept = ""	&& �û�����
	mcAuth = Replicate("0", 20)	&& �û�Ȩ��
	mcKey = ""	&& �û�key
	
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