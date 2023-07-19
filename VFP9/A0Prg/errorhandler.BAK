LParameters lnErrNo, lcErrMsg, lcErrLine, lcErrProg, lnErrLineNo
lcLocPath = Sys(5) + "\IPLOCAL\"

lcErrInfo = Replicate("*", 30) + Chr(13)
lcErrInfo = lcErrInfo + Chr(9) + "时间：" + TtoC(Datetime() ) + Chr(13)
lcErrInfo = lcErrInfo + Chr(9) + "错误编号：" + LTrim(Str(lnErrNo) ) + Chr(13)
lcErrInfo = lcErrInfo + Chr(9) + "错误信息：" + lcErrMsg + Chr(13)
lcErrInfo = lcErrInfo + Chr(9) + "错误行号：" + LTrim(Str(lnErrLineNo) ) + Chr(13)
lcErrInfo = lcErrInfo + Chr(9) + "错误行：" + lcErrLine + Chr(13)
lcErrInfo = lcErrInfo + Chr(9) + "错误代码：" + lcErrProg + Chr(13)
lcErrInfo = lcErrInfo + Replicate("*", 30)

StrToFile(lcErrInfo, lcLocPath + "ColdStorageErrLog.txt", 1)

Clos Databases
Clear Dlls
Quit