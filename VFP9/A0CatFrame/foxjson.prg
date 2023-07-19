* class foxJson 
* ��foxjson.fll�ķ�װ�࣬�̳���vfp��Collection�࣬�����񼯺�һ������json����
* by ľ��,2013

Define Class foxJson as Collection 
	*Jsonֵ
	Value=""
	*ֵ�ļ�
	Key=""
	*ֵ������
	Type=0
	*�Ӷ������
	Count=0
	
	*======================================================================
	*���캯�� 
	Procedure Init(value)
		If Pcount()=0
			this._Object=json_Create()
			Return 
		EndIf 
		
		If Vartype(m.value) $"INLCXD"  &&��ֵ��С�����߼����ַ���null,array
			this._Object=json_Create(m.value)
			Return 
		EndIf 
		
		If Vartype(m.value)="O" and value.Class==this.Class 
			this._Object=json_Parse( m.value.ToString())
			Return 
		EndIf 
		
		*��������
		Error(11)
	EndProc 
	*
	Procedure Destroy()
 		json_Delete(this._Object)
	EndProc 
	*======================================================================
	*������
	Procedure Item(m.name) as Object 
		NoDefault 
		If not InList(json_type(this._Object),4,5)
			*ֻ�е�ǰΪ����������֧������
 			Error(2061)
		EndIf 
		If not Vartype(m.name) $ "CIN"
			Error(2061)
		EndIf 
		
		If this.isArray() and Vartype(m.name)="C"
			Error(2061)
		EndIf 
		*��ǰΪOBJECT���Ҳ���Ϊ�ַ��ͣ�����ARRAY����Ϊ���֣�Ҫ��ȡ���Ӷ���Ϊֵ����ʱ��ֱ��ȡֵ
		If this.isObject() and Vartype(m.name)="C"  
			If not InList(json_Type(this._Object,m.name) ,4,5)
				Return Json_Value(this._Object,m.name)
			EndIf 
		EndIf 
		If this.isArray() and Vartype(name)$"IN"
			If not InList(json_Type(this._Object,m.name) ,4,5)
				Return Json_Value(this._Object,m.name)
			EndIf 
		EndIf 
		


		*��Ϊ����ʱ���������		
		Private  oJson	
		oJson=NewObject(this.Class)
		json_Delete(oJson._Object)
		If  InList(json_Type(this._Object,m.name) ,4,5)
			*�Ӷ���Ϊ��������
			oJson._Object=json_Value(this._Object,m.name)
			If  this.isObject() and Vartype(m.name)$"INY"
				oJson._ObjectThisKey=json_Key(this._Object,m.name)
			EndIf 
		Else
			*�Ӷ���Ϊֵ
			oJson._Object=this._Object
			oJson._ObjectIndex=m.name
			oJson._ObjectThisKey=json_Key(this._Object,m.name)
		EndIf 
		json_addref(oJson._Object)
		Return oJson
	EndProc 
	*======================================================================
	*������
	Procedure Parse(cJson)
		json_Delete(this._Object)
		this._Object=json_Parse(m.cJson)
		RETURN !this._Object==""
	EndProc 
	*======================================================================
	*ToString
	Procedure ToString()
		Return json_ToString(this._object)
	EndProc 
	*======================================================================
	*׷��
	Procedure Append(cKey,vValue)  && cKey|vValue,vValue
		*?ckey
		*����
		If Pcount()=1 and this.isArray()
		
			If Vartype(cKey) $"INLCXDT"  &&��ֵ��С�����߼����ַ���null,array
				json_Append(this._Object,json_Create(m.cKey))
				Return 
			EndIf 
			
			If Vartype(cKey)="O" and m.cKey.Class==this.Class 
				json_Append(this._Object,json_Parse( m.cKey.ToString()))
				Return 
			EndIf 
 

			Error(11)
			Return 
		EndIf 
		
		*����
		If Pcount()=2 and this.isObject() and Vartype(m.cKey)="C"
			If Vartype(m.vValue) $"INLCXD"  &&��ֵ��С�����߼����ַ���null,array
				json_Append(this._Object,json_Create(vValue),cKey)
				Return 
			EndIf 
			
			If Vartype(m.vValue)="O" and vValue.Class==this.Class 
				json_Append(this._Object,json_Parse( m.vValue.ToString()),m.cKey)
				Return 
			EndIf 
		
			Error(11)
			Return 
		EndIf 
		
		Error(11)  
	EndProc 
	*======================================================================
	*�Ƴ�
	Procedure Remove(cKey)  &&cKey|vIdx
		NoDefault 
		If this.IsObject() and Vartype(m.cKey)$"CINY"
			json_Remove(this._Object,m.cKey)
			Return 
		EndIf 
		
		If this.IsArray() and Vartype(m.cKey) $"INY"
			json_Remove(this._Object,m.cKey)
			Return 
		EndIf 
		
		Error(11)  
	EndProc 
	*======================================================================
	Procedure Value_Access
		If not Empty(this._ObjectIndex)
			Return json_Value(this._Object,this._ObjectIndex)			
		EndIf 
		If this.isObject() or this.isArray()
			Local oTmp
			oTmp =NewObject(this.Class)
			json_Delete(oTmp._Object)
			oTmp._Object=this._Object
			json_AddRef(oTmp._Object)  &&��Destroy���ͷ�
			Return oTmp
		EndIf 
		Return json_Value(this._Object)
	EndProc 
	*======================================================================
	Procedure Key_Access
		If this.isObject() or this.isArray()
			Return this._ObjectThisKey
		Else 
			Return json_Key(this._Object,this._ObjectIndex)
		EndIf 

	EndProc 
	*======================================================================
	Procedure Count_Access
		If this.isObject() or this.isArray()
			Return json_Childs(this._Object)
		EndIf 
		Error(2061)
	EndProc 
	*======================================================================
	Procedure Type_Access
		If not Empty(this._ObjectIndex)
			Return json_Type(this._Object,this._ObjectIndex)
		Else 
			Return json_Type(this._Object)
		EndIf 
		
	EndProc 
	*======================================================================
	Procedure isNull()
		Return json_Type(this._Object)==0
	EndProc 
	
	Procedure isBool()
		Return json_Type(this._Object)==1
	EndProc 
	
	Procedure isDouble()
		Return json_Type(this._Object)==2
	EndProc 
	
	Procedure isInt()
		Return json_Type(this._Object)==3
	EndProc 
	
	Procedure isObject()
		Return json_Type(this._Object)==4
	EndProc 
	
	Procedure isArray()
		Return json_Type(this._Object)==5
	EndProc 
	
	Procedure isString()
		Return json_Type(this._Object)==6
	EndProc 
	*======================================================================
	*json object 
	*Protected _Object  	
	_Object="" 
	_ObjectIndex=""
	_ObjectThisKey=""
EndDefine 

*-------------------------------------------------------------------------------
*�� �� ����JsonToObject
*�������ܣ���JSONת��ΪVFP��������JSON����ת��ΪVFP�ļ���
*�Ρ�������JSON�ַ���
*�� �� ֵ��object
*�������ߣ�ľ��
*�������ڣ�2018-10-16
*������ע��json�ļ�����ո����ֵȣ�ת���ɹ���ǰ����JSON���ܷ���VFP������������
*-------------------------------------------------------------------------------
Procedure JsonToObject(cJson)
	If Vartype(cJson)<>"C"
		Error(11)
	EndIf 
	
	Local jsonObj,vRetValue
	jsonObj=json_Parse(cJson)
	If not InList(json_Type(jsonObj),4,5)
		vRetValue=json_value(jsonObj)
	Else
		vRetValue=JsonToObject_Value(jsonObj)
	EndIf 
	
	json_Delete(jsonObj)
	Return vRetValue
EndProc 
Procedure JsonToObject_Value(jsonObj)
	Local nType,vRet,nCount ,x
	nType=json_Type(jsonObj)
	DO CASE
	Case nType=4
	*object
		vRet=CreateObject("empty")
		nCount=json_Childs(jsonObj)
		For x=1 to nCount
			If InList(json_Type(jsonObj,x),4,5)
				AddProperty(vRet,json_Key(jsonObj,x), JsonToObject_Value(json_Value(jsonObj,x)))
			Else
				AddProperty(vRet,json_Key(jsonObj,x), json_Value(jsonObj,x))
			EndIf 
		EndFor 
	Case nType=5
	*Array
		vRet=CreateObject("Collection")
		nCount=json_Childs(jsonObj)
		For x=1 to nCount
			If InList(json_Type(jsonObj,x),4,5)
				vRet.Add(JsonToObject_Value(json_Value(jsonObj,x)))
			Else
				vRet.Add(json_Value(jsonObj,x))
			EndIf 
		EndFor 
	Otherwise
	*basic value
		vRet=json_value(jsonObj)
	EndCase

	Return vRet
EndProc 
*-------------------------------------------------------------------------------
*�� �� ����ObjectToJson
*�������ܣ���һ��VFP����ת��Ϊjson�ַ���
*�Ρ�������object
*�� �� ֵ��
*�������ߣ�ľ��
*�������ڣ�2018-10-15
*������ע��ֻת�����ԣ����������飬���϶���ӳ��Ϊjson������
*-------------------------------------------------------------------------------
PROCEDURE ObjectToJson(obj,mode)
	Local jsonObj,vValue
	Do case
	Case  Vartype(obj)=="C"
	*�ַ���ȥ��ǰ��ո�
		jsonObj=json_Create(Alltrim(obj))
	Case Vartype(obj) $ "INLCX"  
	*���飬�߼���NULL ����ֱ��ʶ��
		jsonObj=json_Create(obj)
	Case Vartype(obj)= "Y"  
	*����ȥ������
		jsonObj=json_Create(Alltrim(Transform(obj,"@Z")))
	Case Vartype(obj)=="O"
		If PemStatus(obj,"baseclass",5) and obj.baseClass=="Collection"
		*����
			jsonObj=json_Create({})
			Local x 
			*vfp bug:ʹ�� for each in obj �ᵼ��AMembers()��ȡ��������
			For x=1 to obj.Count
				json_Append(jsonObj ,ObjectToJson(obj.item(x) ,.T.))
			EndFor 
		Else
		*����
			Local aProps[1],cName
			jsonObj=json_Create()
			If AMembers(aProps,obj,0,"U")>0  &&�����Ҫȫ������Ӧ��ΪAMembers(aProps,obj��
				FOR EACH cName in aProps
					If Type("obj."+cName)="U"
						*�����޷����ʵ����ԣ�����_screen.ActiveForm
						Loop 
					EndIf 
					json_Append(jsonObj ,ObjectToJson(obj.&cName,.T.),Lower(cName))  &&ȫ��Сд
				EndFor 
			EndIf 
		EndIf 
	Otherwise 
	*��������תΪ�ַ�
		jsonObj=json_Create(Transform(obj,"@T"))
	EndCase 	
	
	If mode
		Return jsonObj  &&�ݹ�ʱ�����ڲ�ָ��
	EndIf 
	
	*����Json�ַ���
	Local cRetData
	cRetData=json_ToString(jsonObj)
	json_Delete(jsonObj)
	Return cRetData	
EndProc