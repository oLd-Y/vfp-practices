Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
lcScoreDistrPath = lcEventPath + "score_distr\"


&& 修改 score_distr
ASelObj(laForm,1)
loForm = laForm[1]
loPageFrame = loForm.PageFrame1
loPage = loPageFrame.Page1
loGrid1 = loPage.Grid1
loCommand1 = loPage.Command1
loCommand2 = loPage.Command2

&& Form1
If File(lcScoreDistrPath + "Form1/Load.prg")
    m.Form1_Load = fileToStr(lcScoreDistrPath + "Form1/Load.prg")
    loForm.writeMethod("Load", m.Form1_Load)
EndIf


&& 导出为Excel按钮
If File(lcScoreDistrPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    m.Command1_Click = fileToStr(lcScoreDistrPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    loCommand1.writeMethod("Click", m.Command1_Click)
EndIf

&& 查看详情按钮
If File(lcScoreDistrPath + "Form1/PageFrame1/Page1/Command2/Click.prg")
    m.Command2_Click = fileToStr(lcScoreDistrPath + "Form1/PageFrame1/Page1/Command2/Click.prg")
    loCommand2.writeMethod("Click", m.Command2_Click)
EndIf


