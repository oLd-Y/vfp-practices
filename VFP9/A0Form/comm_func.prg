** ���ܺ�����(try)
DEFINE CLASS Comm_Func AS CUSTOM
  ** ����Form�ؼ����㲻��Backspace�仯
  FUNCTION Fixed_Focus(NKEY, TPOS)
    M.RES1 = ""
    IF TPOS = 0
      IF NKEY = 127 .OR. NKEY = 19
        M.RES1 = "NODE"
      ENDI
    ENDI
    RETU M.RES1
  ENDFUNC
  
  ** List����
  FUNCTION List_Control(M.TLIST, M.TKEY)
    M.A1 = M.TLIST + ".LISTCOUNT"
    M.A2 = M.TLIST + ".DBLCLICK"
    M.A3 = M.TLIST + ".SELECTED[" + ALLT(STR(PUB_LT1ID)) + "] = .T."
    M.A4 = M.TLIST + ".LISTCOUNT > 0"
    M.tResult = ""
    IF &A4.
      DO CASE
        CASE M.TKEY = 5
          M.PUB_LT1ID = IIF(M.PUB_LT1ID > 1, M.PUB_LT1ID - 1, &A1.)
          &A3.
        CASE M.TKEY = 24
          M.PUB_LT1ID = IIF(M.PUB_LT1ID < &A1., M.PUB_LT1ID + 1, 1)
          &A3.
        CASE M.TKEY = 13
          &A2.
      ENDC
      IF INLI(M.TKEY, 5, 13, 24)
        M.tResult = "NODEFA"
      ENDI
    ENDI
    RETU M.tResult
  ENDFUNC
  
  ** ��ֹSQLע��
  FUNCTION Avoid_Inject(M.TSTR)
      M.TRES = ""
      M.TRES = M.TSTR
      M.TRES = CHRT(M.TRES, "'", "")
      M.TRES = CHRT(M.TRES, "(", "")
      M.TRES = CHRT(M.TRES, ")", "")
      M.TRES = CHRT(M.TRES, '"', "")
      M.TRES = CHRT(M.TRES, "[", "")
      M.TRES = CHRT(M.TRES, "]", "")
      *M.TRES = CHRT(M.TRES, "]", "")
      M.TRES = STRT(M.TRES, ".OR.", "")
      RETU M.TRES
  ENDFUNC
  
  ** ��ȡ������λ�úʹ�С
  Function TaskbarSize()
    M.tbH = ""   && ��������
    M.tbW = ""   && ��������
    Declare Integer GetWindowRect In user32 Integer hWindow,String @lpRect
    Declare Integer FindWindow In user32 String lpClassName,String lpWindowName
    lnHWnd = FindWindow("Shell_traywnd", "")
    If lnHWnd > 0
	  lcRect = Replicate(Chr(0), 16)
	  If GetWindowRect(lnHWnd, @lcRect) # 0
	    ** VFP9
		*lnLeftUpX = CToBin(Substr(lcRect, 1, 4), "4rs")		&& ���Ͻ� X ����
		*lnLeftUpY = CToBin(Substr(lcRect, 5, 4), "4rs")		&& ���Ͻ� Y ����
		*lnRighDnX = CToBin(Substr(lcRect, 9, 4), "4rs")	&& ���½� X ����
		*lnRighDnY = CToBin(Substr(lcRect, 13, 4), "4rs")	&& ���½� Y ����
		** VFP8
		lnLeftUpX = ASC(SUBS(lcRect,  1, 1)) +;
	                ASC(SUBS(lcRect,  2, 1)) * 0x100 +;
	                ASC(SUBS(lcRect,  3, 1)) * 0x10000 +;
	                ASC(SUBS(lcRect,  4, 1)) * 0x1000000   && ���Ͻ� X ����
	    lnLeftUpY = ASC(SUBS(lcRect,  5, 1)) +;
	                ASC(SUBS(lcRect,  6, 1)) * 0x100 +;
	                ASC(SUBS(lcRect,  7, 1)) * 0x10000 +;
	                ASC(SUBS(lcRect,  8, 1)) * 0x1000000   && ���Ͻ� Y ����
	    lnRighDnX = ASC(SUBS(lcRect,  9, 1)) +;
	                ASC(SUBS(lcRect, 10, 1)) * 0x100 +;
	                ASC(SUBS(lcRect, 11, 1)) * 0x10000 +;
	                ASC(SUBS(lcRect, 12, 1)) * 0x1000000   && ���½� X ����
	    lnRighDnY = ASC(SUBS(lcRect, 13, 1)) +;
	                ASC(SUBS(lcRect, 14, 1)) * 0x100 +;
	                ASC(SUBS(lcRect, 15, 1)) * 0x10000 +;
	                ASC(SUBS(lcRect, 16, 1)) * 0x1000000   && ���½� Y ����
      Endif
	Endif
	clear dlls
	
	
	M.tbH = ALLT(STR(ABS(lnLeftUpY - lnRighDnY)))
	M.tbW = ALLT(STR(ABS(lnLeftUpX - lnRighDnX)))
	
	Retu (M.tbH + "|" + M.tbW)
	*Retu "(" + ALLT(STR(lnLeftUpX)) + "," + ALLT(STR(lnLeftUpY)) + ") | (" + ALLT(STR(lnRightDownX)) + "," + ALLT(STR(lnRightDownY)) + ")"
   EndFunc
   
   ** ����д
   Function NToC(money)
     *�㡢Ҽ���������������顢½���⡢�ơ�����ʰ���ۡ�Ǫ���ǡ���
     
   EndFunc
   
	** �ļ�����
	Function encFile(fileName)
		M.fHandle = FOPEN(fileName, 12)
		M.res = "233"
		IF M.fHandle >= 0
			=FSEEK(M.fHandle, 0)
			M.T_STR = FREAD(M.fHandle, 256)
			M.T_TAG = ""
			FOR I = 1 TO 256
				M.T_CSTR = ASC(SUBS(M.T_STR, I, 1)) + 7
				M.T_CSTR = IIF(M.T_CSTR > 255, M.T_CSTR - 256, M.T_CSTR)
				M.T_TAG = M.T_TAG + CHR(M.T_CSTR)
			ENDF
			=FSEEK(M.fHandle, 0)
			=FWRITE(M.fHandle, M.T_TAG, 256)
			=FCLOSE(M.fHandle)
			M.res = M.fHandle
		ENDI
		RETU M.res
	EndFunc
   
	** �ļ�����
	Function decFile(fileName)
		M.fHandle = FOPEN(fileName, 12)
		M.res = "233"
		IF M.fHandle >= 0
			=FSEEK(M.fHandle, 0)
			M.T_STR = FREAD(M.fHandle, 256)
			M.T_TAG = ""
			FOR I = 1 TO 256
				M.T_CSTR = ASC(SUBS(M.T_STR, I, 1)) - 7
				M.T_CSTR = IIF(M.T_CSTR < 0, M.T_CSTR + 256, M.T_CSTR)
				M.T_TAG = M.T_TAG + CHR(M.T_CSTR)
			ENDF
			=FSEEK(M.fHandle, 0)
			=FWRITE(M.fHandle, M.T_TAG, 256)
			=FCLOSE(M.fHandle)
			M.res = M.fHandle
		ENDI
		RETU M.res
	EndFunc
	
	** ��ȡ�������ڡ�ʱ��
	Function getDateTime(tWorkArea)
		m.tDateTime = ""
		m.tG1 = "SELE " +  tWorkArea
		&tG1.
		
		USE STRCONV(FILETOSTR(SYS(5) + "\IPLOCAL\PT\PATH.INI"), 14) + "\PT\PTSYS.CFG" AGAI ALIA GET_DTM SHAR
		m.tDateTime = LEFT(SYS_CD, 17)
		m.tG2 = "USE IN " +  tWorkArea
		&tG2.
		M.PUB_NDATE = LEFT(m.tDateTime, 8)
		M.PUB_NTIME = RIGH(m.tDateTime, 8)
		RETU m.tDateTime
	ENDFUNC

	** ��ȡ����ʱ��
	Function get_datetime1(pArea)
		** ������ǰ������
		m_cur_area = select()
		
		** ȡʱ��
		m_temp = "select " + pArea
		&m_temp.
		use strconv(filetostr(sys(5) + "\iplocal\pt\path.ini"), 14) + "\pt\ptsys.cfg" again alias get_dtm share
		m_datetime = left(sys_cd, 17)
		m_temp = "use in " + pArea
		&m_temp.
		
		** �ָ���ǰ������
		m_temp = "select " + alltrim(str(m_cur_area))
		&m_temp.
		
		return m_datetime
	EndFunc
	
	** ������Ӫ��Χ
	Function getBusiScop(tBusSco)
		M.tRes = ""
		
		FOR I = 1 TO LEN(ALLTRIM(tBusSco)) / 2
			M.tRes = M.tRes + "��" + gYts(VAL(SUBSTR(tBusSco, (I - 1) * 2 + 1, 2)))
		ENDFOR
		
		RETU SUBSTR(M.tRes, 3)
	EndFunc
	
	Function SHOWMESSAGE(MESS, METHOD)
		M.RETU_V = 0
		DO FORM SHOWMESSAGE WITH MESS,METHOD TO M.RETU_V
		RETU M.RETU_V
	EndFunc
ENDDEFINE