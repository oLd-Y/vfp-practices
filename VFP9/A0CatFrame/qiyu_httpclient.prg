*getRepsonseHeader(key) ������ȡ����ͷ
*filename ����Ƿ����ļ�,�������ļ���
*content-type��ֵ�� application/x-www-form-urlencoded,application/json
* ��������ļ��ϴ�����û������ multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
*-- ����
cUrl="http://192.168.0.99:801/a1send.fsp?proc=send"
Qiyu_HttpClient =Newobject("Qiyu_HttpClient","Qiyu_HttpClient.prg")
Qiyu_HttpClient.setHeader("content-type","application/json")    &&  content-type Ĭ��Ϊ application/json
*Qiyu_HttpClient.method="GET"	 &&GET	POST HTTP ���󷽷�
*Qiyu_HttpClient.DataType="STRING"    &&�������� string �ַ���  bin ��������
*Qiyu_HttpClient.receiveTimeout =6000 && ���ճ�ʱ6��
cReturn= Qiyu_HttpClient.Send(cUrl)
If Isnull(cReturn)
	?Qiyu_HttpClient.msg
Else
	?cReturn
Endif


Define Class Qiyu_HttpClient As Custom
	oHttp=""
	*Header="application/json"    &&  application/json
	method="get"	 &&GET POST HTTP ���󷽷�
	DataType="STRING"    &&�������� string �ַ���  bin ��������
	resolveTimeout=60000 &&������Ӧʱ��
	ConnectTimeOut=60000 &&������Ӧʱ��
	sendTimeout=60000   &&��������������Ӧʱ��
	receiveTimeout =60000  &&����������Ӧʱ��
	msg=""
	oHeader=""
	Filename=""  &&������ļ�����������
    oResponseHeader=""
    ResponseHeadertext=""
    
	Procedure Init
		This.oHeader=Createobject("collection")		
		This.oHeader.Add("application/json","content-type")		
	Endproc

    *--��ȡ���ص�HTTPHEADER
    PROCEDURE getRepsonseHeader
      LPARAMETERS cKey
      LOCAL cReturn
      TRY 
       cReturn=oResponseheader.item(LOWER(cKey))
      CATCH 
       cReturn="" 
      ENDTRY  
      RETURN cReturn
    ENDPROC  
    

	Procedure setHeader
		Lparameters cKey,cValue
		LOCAL lni
		If Pcount()<2
			Error "�봫����ȷ�Ĳ���"
		ENDIF		
		FOR lni=1 TO this.oHeader.count
		   lcKey=this.oHeader.GetKey(lni) 
		   IF lcKey==ALLTRIM(lower(cKey))
		    *llexist=.t. 		     
             This.oHeader.Remove(lni)
		     EXIT 
		   ENDIF 
		ENDFOR 
	 
		This.oHeader.Add(cValue,ALLTRIM(lower(cKey)))  &&ȫ��תСд		
	Endproc

	Procedure Send
		Lparameters cGoUrl,cPostData
		Local lcReturn,lni,lcKey
		lcReturn=.Null.
		Try
			If !Inlist(Upper(This.method),"OPTIONS","GET","HEAD","POST","PUT","DELETE","TRACE","CONNECT")
				Error "��֧�ֵ�Э��"
			Endif
			oHttp = Createobject("WinHttp.WinHttpRequest.5.1")
			*oHttp = Createobject("Microsoft.XMLHTTP")
             
			oHttp.Open(This.method,Alltrim(cGoUrl),.F.)
			oHttp.SetTimeouts(This.resolveTimeout, This.ConnectTimeOut, This.sendTimeout, This.receiveTimeout)
			FOR lni=1 TO this.oHeader.count
			  lcKey=this.oHeader.GetKey(lni)  			  
			  oHttp.setRequestHeader(lcKey,this.oHeader.item(lcKey))			  	
			ENDFOR 
			
			*oHttp.setRequestHeader ("Content-Type",This.Header+";charset=utf-8")			
			*oHttp.setRequestHeader ("charset","UTF-8")
			*oHttp.setRequestHeader("If-Modified-Since", "0")
			oHttp.Option(12)=.t.
			oHttp.Option(4)=13056
			Do Case
				Case Upper(This.method)=="GET"
					oHttp.Send()
				Case  Upper(This.method)=="POST"
					oHttp.Send(cPostData)
				Otherwise
					oHttp.Send()
			ENDCASE
			LOCAL lcHeader,cKey,cValue,nStart,lcKey,lni
			This.oResponseHeader=Createobject("collection")
			lcHeader=oHttp.getAllResponseHeaders() 
			this.ResponseHeadertext=lcHeader
			
			ALINES(laResponseHeader,lcHeader,4,0h0D0A) &&��������Ԫ��
			FOR i=1 TO ALEN(laResponseHeader)			
			      nStart=AT(":",laResponseHeader[i])				  				  
				  IF nStart>0
				   cKey=LEFT(laResponseHeader[i],nStart-1)
				   cValue=right(laResponseHeader[i],LEN(laResponseHeader[i])-nStart)
				  *?i,cKey,cValue
				  
				  FOR lni=1 TO this.oResponseHeader.count
				   lcKey=this.oResponseHeader.GetKey(lni) 
				   *?lcKey,ALLTRIM(lower(cKey)) 
				   IF lcKey==ALLTRIM(lower(cKey))
					    *llexist=.t. 		      
					      *?"���ֲ��Ƴ�",i,cKey,cValue
			             This.oResponseHeader.Remove(lni)
					     EXIT 
					   ENDIF 
				  ENDFOR 
				  
				  This.oResponseHeader.add(cValue,LOWER(cKey))					  
				  IF LOWER(cKey)=="content-disposition"
					  nStart=AT("filename=",cValue)
					  IF nStart>0
					     this.filename=substr(cValue,nStart+10,LEN(cValue)-nStart-10)
					  ENDIF 
				  ENDIF 
			     ENDIF  	  
			ENDFOR 
			
			
			If Upper(This.DataType)!="BIN"
				lcReturn=Strconv(oHttp.responseBody,11)
			Else
				lcReturn=oHttp.responseBody
			Endif
		Catch To ex
		*?ex.message,ex.lineno
			This.msg=ex.Message
			lcReturn=.Null.
		Endtry
		Return lcReturn
	Endproc
Enddefine


