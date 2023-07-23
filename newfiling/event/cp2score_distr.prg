Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
lcScoreDistrPath = lcEventPath + "score_distr\"


&& ÐÞ¸Ä score_distr
ASelObj(laForm,1)
loForm = laForm[1]
loPageFrame1 = loForm.PageFrame1
loPage1 = loPageFrame1.Page1
loGrid1 = loPage1.Grid1

&& Form1
If File(lcScoreDistrPath + "Form1/Load.prg")
    m.readFile = fileToStr(lcScoreDistrPath + "Form1/Load.prg")
    loForm.writeMethod("Load", m.readFile)
EndIf



&& Form1.PageFrame1.Page1.Command1
loCommand1 = loPage1.Command1
&& Click
If File(lcScoreDistrPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    m.readFile = fileToStr(lcScoreDistrPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    loCommand1.writeMethod("Click", m.readFile)
EndIf



&& Form1.PageFrame1.Page1.Command2
loCommand2 = loPage1.Command2
&& Click
If File(lcScoreDistrPath + "Form1/PageFrame1/Page1/Command2/Click.prg")
    m.readFile = fileToStr(lcScoreDistrPath + "Form1/PageFrame1/Page1/Command2/Click.prg")
    loCommand2.writeMethod("Click", m.readFile)
EndIf


