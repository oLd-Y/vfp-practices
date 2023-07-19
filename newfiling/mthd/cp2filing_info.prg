Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
lcGradePath = lcEventPath + "grade\"
lcScoreDistrPath = lcEventPath + "score_distr\"
lcFilingInfoPath = lcEventPath + "filing_info\"
&& 换行符
br = chr(13)

&& && 不加 nowait 则会在关闭表单之后才执行后面的语句，cmd就找不到表单了
&& modi form grade Nowait
&& && Create Form lcFormPath + [frmMain.scx] As Form Nowait
&& ASelObj(laForm,1)
&& loForm = laForm[1]



&& && 将修改同步至相应的prg中
&& m.gradeForm1Load = loForm.readMethod("Load")
&& strToFile(m.gradeForm1Load, lcGradePath + "Form1/Load.prg")


&& m.readFile = fileToStr(lcGradePath + "Form1/Load.prg")
&& loForm.writeMethod("Load", m.readFile)


modi form filing_info Nowait
ASelObj(laForm,1)
loForm = laForm[1]
loPageFrame = loForm.PageFrame1
loPage = loPageFrame.Page1
loGrid1 = loPage.Grid1
loGrid2 = loPage.Grid2

&& Form1
If File(lcFilingInfoPath + "Form1/Load.prg")
    m.Form1_Load = fileToStr(lcFilingInfoPath + "Form1/Load.prg")
    loForm.writeMethod("Load", m.Form1_Load)
EndIf

&& Grid1
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/AfterRowColChange.prg")
    m.Grid1_AfterRowColChange = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/AfterRowColChange.prg")
    loGrid1.writeMethod("AfterRowColChange", m.Grid1_AfterRowColChange)
EndIf

If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    m.Command1_Click = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    loPage.Command1.writeMethod("Click", m.Command1_Click)
EndIf

RELEASE filing_info





