Local Array laForm[1]
Local loForm1
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
lcGradePath = lcEventPath + "grade\"
lcScoreDistrPath = lcEventPath + "score_distr\"
lcFilingInfoPath = lcEventPath + "filing_info\"


modi form filing_info Nowait
ASelObj(laForm,1)
loForm1 = laForm[1]
loPageFrame1 = loForm1.PageFrame1
loPage1 = loPageFrame1.Page1
loGrid1 = loPage1.Grid1
loGrid2 = loPage1.Grid2
loCommand1 = loPage1.Command1
loCommand2 = loPage1.Command2


&& Form1
&& Load
m.Form1_Load = loForm1.readMethod("Load")
strToFile(m.Form1_Load, lcFilingInfoPath + "Form1/Load.prg")


