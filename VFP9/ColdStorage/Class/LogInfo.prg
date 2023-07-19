Define Class LogInfo As Session
	Hidden _no, _dept, _name, _auth, _key
	
	Procedure Init
		this._no = ""
		this._dept = ""
		this._name = ""
		this._auth = ""
		this._key = ""
	EndProc
	
	Procedure SetNo(cNo)
		this._no = cNo
	EndProc
	Procedure GetNo()
		Return this._no
	EndProc
	
	Procedure SetDept(cDept)
		this._dept = cDept
	EndProc
	Procedure GetDept()
		Return this._dept
	EndProc
	
	Procedure SetName(cName)
		this._name = cName
	EndProc
	Procedure GetName()
		Return this._name
	EndProc
	
	Procedure SetAuth(cAuth)
		this._auth = cAuth
	EndProc
	Procedure GetAuth()
		Return this._auth
	EndProc
	
	Procedure SetKey(cKey)
		this._key = cKey
	EndProc
	Procedure GetKey()
		Return this._key
	EndProc
EndDefine