
&& ��ǰĿ¼
lcCurDir = AddBS(Sys(5) + CurDir())             && addBs ��ĩ�˼� \  ;�������򲻼�
&& _VFP.ActiveProject.Name Ϊ ��ǰProject����·�� + Project�ļ���.pjx
&& Project�ļ���
lcPjxName = JustStem(_VFP.ActiveProject.Name)
&& Project����·��
lcDevPath = JustPath(_VFP.ActiveProject.Name)   && ����� \
lcDevPath = AddBS(lcDevPath)        		&& ��ĩ�˼� \  ;�������򲻼�

&& ���ͨ������Ŀ¼
lcSearchDirs = "frm;mthd;rpt;db;clslib;"
lcSearchPath = lcDevPath + lcSearchDirs

&& ���ÿ���·��
&& lcDevPath = Sys(5) + Sys(2003) + "\"
&& lcDevPath = lcDevPath + AddBS(lcPjxName)
Set Default To (lcDevPath)
&& ���VFP����·��
Set Path To (lcSearchPath)

&& -- Show Tips
Activate Screen
&& Clear
? ""
? "Active Project " + _vfp.ActiveProject.Name
? "Set Default To " + lcDevPath
? "Set Path To " + lcSearchPath



&& Local lcCurrentDir, lcProjectName, lcDevelopPath, lcSerchPath
&& Local laArray[1], lnIndex, lnDirCount

&& && ��ǰĿ¼
&& lcCurrentDir = AddBS(Sys(5) + CurDir())
&& && Project����·�� + Project�ļ���.pjx
&& _VFP.ActiveProject.Name
&& && Project�ļ���
&& lcProjectName = JustStem(_VFP.ActiveProject.Name)
&& && Project����·��
&& lcDevelopPath = JustPath(_VFP.ActiveProject.Name)	&& ����� \
&& lcDevelopPath = AddBS(lcDevelopPath)				&& ��ĩ�˼� \  ;�������򲻼�
&&
&& && ���ͨ������Ŀ¼
&& lcSerchPath = ""
&& Set Default To (lcDevelopPath)
&& lnDirCount = ADir(laArray, "",  "D")
&& For lnIndex = 3 To lnDirCount
&&     If laArray[lnIndex, 1] # "A0"
&&         Loop
&&     EndIf
&&     lcSerchPath = lcSerchPath + lcDevelopPath + laArray[lnIndex, 1] + ";"
&& EndFor
&&
&& && ���ÿ���·��
&& &&lcDevPath = Sys(5) + Sys(2003) + "\"
&& lcDevelopPath = lcDevelopPath + AddBS(lcProjectName)
&& Set Default To (lcDevelopPath)
&& && �����Ŀ����Ŀ¼
&& lnDirCount = ADir(laArray, "",  "D")
&& For lnIndex = 3 To lnDirCount
&& 	lcSerchPath = lcSerchPath + laArray[lnIndex, 1] + ";"
&& EndFor
&&
&& && ���VFP����·��
&& Set Path To (lcSerchPath)
&&
&& && Show Tips
&& Activate Screen
&& && Clear
&& ? ""
&& ? "Active Project " + _Vfp.ActiveProject.Name
&& ? "Set Default To " + lcDevelopPath
&& ? "Set Path To " + lcSerchPath
&&
&&
&& If File("Initialize.prg") Or File("Initialize.fxp")
&& 	? "ִ����Ŀ��ʼ���ļ� Initialize"
&& 	Do Initialize
&& EndIf