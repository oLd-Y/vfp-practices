
&& 当前目录
lcCurDir = AddBS(Sys(5) + CurDir())             && addBs 在末端加 \  ;若存在则不加
&& _VFP.ActiveProject.Name 为 当前Project绝对路径 + Project文件名.pjx
&& Project文件名
lcPjxName = JustStem(_VFP.ActiveProject.Name)
&& Project绝对路径
lcDevPath = JustPath(_VFP.ActiveProject.Name)   && 最后无 \
lcDevPath = AddBS(lcDevPath)        		&& 在末端加 \  ;若存在则不加

&& 添加通用搜索目录
lcSearchDirs = "frm;mthd;rpt;db;clslib;"
lcSearchPath = lcDevPath + lcSearchDirs

&& 设置开发路径
&& lcDevPath = Sys(5) + Sys(2003) + "\"
&& lcDevPath = lcDevPath + AddBS(lcPjxName)
Set Default To (lcDevPath)
&& 添加VFP搜索路径
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

&& && 当前目录
&& lcCurrentDir = AddBS(Sys(5) + CurDir())
&& && Project绝对路径 + Project文件名.pjx
&& _VFP.ActiveProject.Name
&& && Project文件名
&& lcProjectName = JustStem(_VFP.ActiveProject.Name)
&& && Project绝对路径
&& lcDevelopPath = JustPath(_VFP.ActiveProject.Name)	&& 最后无 \
&& lcDevelopPath = AddBS(lcDevelopPath)				&& 在末端加 \  ;若存在则不加
&&
&& && 添加通用搜索目录
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
&& && 设置开发路径
&& &&lcDevPath = Sys(5) + Sys(2003) + "\"
&& lcDevelopPath = lcDevelopPath + AddBS(lcProjectName)
&& Set Default To (lcDevelopPath)
&& && 添加项目搜索目录
&& lnDirCount = ADir(laArray, "",  "D")
&& For lnIndex = 3 To lnDirCount
&& 	lcSerchPath = lcSerchPath + laArray[lnIndex, 1] + ";"
&& EndFor
&&
&& && 添加VFP搜索路径
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
&& 	? "执行项目初始化文件 Initialize"
&& 	Do Initialize
&& EndIf