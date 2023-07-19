*getRepsonseHeader(key) 方法获取返回头
*filename 如果是返回文件,里面有文件名
*content-type的值有 application/x-www-form-urlencoded,application/json
* 这个用于文件上传，还没有整合 multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW
*-- 调用
cUrl="http://192.168.0.99:801/a1send.fsp?proc=send"
Qiyu_HttpClient =Newobject("Qiyu_HttpClient","Qiyu_HttpClient.prg")
Qiyu_HttpClient.setHeader("content-type","application/json")    &&  content-type 默认为 application/json
*Qiyu_HttpClient.method="GET"	 &&GET	POST HTTP 请求方法
*Qiyu_HttpClient.DataType="STRING"    &&数据类型 string 字符串  bin 二进制流
*Qiyu_HttpClient.receiveTimeout =6000 && 接收超时6秒
cReturn= Qiyu_HttpClient.Send(cUrl)
If Isnull(cReturn)
	?Qiyu_HttpClient.msg
Else
	?cReturn
Endif


Define Class Qiyu_HttpClient As Custom
	oHttp=""
	*Header="application/json"    &&  application/json
	method="get"	 &&GET POST HTTP 请求方法
	DataType="STRING"    &&数据类型 string 字符串  bin 二进制流
	resolveTimeout=60000 &&解析响应时间
	ConnectTimeOut=60000 &&连接响应时间
	sendTimeout=60000   &&发送请求数据响应时间
	receiveTimeout =60000  &&接受数据响应时间
	msg=""
	oHeader=""
	Filename=""  &&如果有文件名返回填入
    oResponseHeader=""
    ResponseHeadertext=""
    
	Procedure Init
		This.oHeader=Createobject("collection")		
		This.oHeader.Add("application/json","content-type")		
	Endproc

    *--获取返回的HTTPHEADER
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
			Error "请传入正确的参数"
		ENDIF		
		FOR lni=1 TO this.oHeader.count
		   lcKey=this.oHeader.GetKey(lni) 
		   IF lcKey==ALLTRIM(lower(cKey))
		    *llexist=.t. 		     
             This.oHeader.Remove(lni)
		     EXIT 
		   ENDIF 
		ENDFOR 
	 
		This.oHeader.Add(cValue,ALLTRIM(lower(cKey)))  &&全部转小写		
	Endproc

	Procedure Send
		Lparameters cGoUrl,cPostData
		Local lcReturn,lni,lcKey
		lcReturn=.Null.
		Try
			If !Inlist(Upper(This.method),"OPTIONS","GET","HEAD","POST","PUT","DELETE","TRACE","CONNECT")
				Error "不支持的协议"
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
			
			ALINES(laResponseHeader,lcHeader,4,0h0D0A) &&不包含空元素
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
					      *?"发现并移除",i,cKey,cValue
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


