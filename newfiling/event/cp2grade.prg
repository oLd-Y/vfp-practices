Local Array laForm[1]
Local loForm1
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
lcGradePath = lcEventPath + "grade\"



modi form grade Nowait
ASelObj(laForm,1)



&& Form1
loForm1 = laForm[1]
&& Load
If File(lcGradePath + "Form1/Load.prg")
    m.readFile = fileToStr(lcGradePath + "Form1/Load.prg")
    loForm1.writeMethod("Load", m.readFile)
EndIf

&& QueryUnload
If File(lcGradePath + "Form1\QueryUnload.prg")
    m.readFile = fileToStr(lcGradePath + "Form1\QueryUnload.prg")
    loForm1.writeMethod("QueryUnload", m.readFile)
EndIf

&& Unload
If File(lcGradePath + "Form1/Unload.prg")
    m.readFile = fileToStr(lcGradePath + "Form1/Unload.prg")
    loForm1.writeMethod("Unload", m.readFile)
EndIf

&& filter
If File(lcGradePath + "Form1/filter.prg")
    m.readFile = fileToStr(lcGradePath + "Form1/filter.prg")
    loForm1.writeMethod("filter", m.readFile)
EndIf



&& Form1.PageFrame1
loPageFrame1 = loForm1.PageFrame1



&& Form1.PageFrame1.Page1
loPage1 = loPageFrame1.Page1



&& Form1.PageFrame1.Page1.Grid1
loGrid1 = loPage1.Grid1
&& AfterRowColChange
If File(lcGradePath + "Form1/PageFrame1/Page1/Grid1/AfterRowColChange.prg")
    m.readFile = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Grid1/AfterRowColChange.prg")
    loGrid1.writeMethod("AfterRowColChange", m.readFile)
EndIf

&& Init
If File(lcGradePath + "Form1/PageFrame1/Page1/Grid1/Init.prg")
    m.readFile = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Grid1/Init.prg")
    loGrid1.writeMethod("Init", m.readFile)
EndIf



&& Form1.PageFrame1.Page1.Funcctn1
loFuncctn1 = loPage1.Funcctn1
&& Click
If File(lcGradePath + "Form1/PageFrame1/Page1/Funcctn1/Click.prg")
    m.readFile = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Funcctn1/Click.prg")
    loFuncctn1.writeMethod("Click", m.readFile)
EndIf



&& Form1.PageFrame1.Page1.Funcctn2
loFuncctn2 = loPage1.Funcctn2
&& Click
If File(lcGradePath + "Form1/PageFrame1/Page1/Funcctn2/Click.prg")
    m.readFile = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Funcctn2/Click.prg")
    loFuncctn2.writeMethod("Click", m.readFile)
EndIf

&& && -------------------------- Command1------------------------
&& loCommand1 = loPage1.Command1
&&
&& && Click
&& If File(lcGradePath + "Form1/PageFrame1/Page1/Command1/Click.prg")
&&     m.Command1_Click = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Command1/Click.prg")
&&     loCommand1.writeMethod("Click", m.Command1_Click)
&& EndIf

&& && --------------------------- Command2 ----------------------------
&& loCommand2 = loPage1.Command2
&&
&& && Click
&& If File(lcGradePath + "Form1/PageFrame1/Page1/Command2/Click.prg")
&&     m.Command2_Click = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Command2/Click.prg")
&&     loCommand2.writeMethod("Click", m.Command2_Click)
&& EndIf
&&
&&
&& && ------------------------------- Combo1 -----------------------------
&& loCombo1 = loPage1.Combo1
&&
&& && InteractiveChange
&& If File(lcGradePath + "Form1/PageFrame1/Page1/Combo1/InteractiveChange.prg")
&&     m.Combo1_InteractiveChange = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Combo1/InteractiveChange.prg")
&&     loCombo1.writeMethod("InteractiveChange", m.Combo1_InteractiveChange)
&& EndIf
&&
&&
&& && ------------------------------- Text3 --------------------------------
&& loText3 = loPage1.Text3
&&
&& If !IsNull(loText3) .AND. File(lcGradePath + "Form1/PageFrame1/Page1/Text3/InteractiveChange.prg")
&&     m.Text3_InteractiveChange = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Text3/InteractiveChange.prg")
&&     loText3.writeMethod("InteractiveChange", m.Text3_InteractiveChange)
&& EndIf
&&
&& && ------------------------------- Text4 --------------------------------
&& loText4 = loPage1.Text4
&&
&& If !IsNull(loText4) .AND. File(lcGradePath + "Form1/PageFrame1/Page1/Text4/InteractiveChange.prg")
&&     m.Text4_InteractiveChange = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Text4/InteractiveChange.prg")
&&     loText4.writeMethod("InteractiveChange", m.Text4_InteractiveChange)
&& EndIf
&&
&& && ------------------------------- Text5 --------------------------------
&& loText5 = loPage1.Text5
&&
&& If !IsNull(loText5) .AND. File(lcGradePath + "Form1/PageFrame1/Page1/Text5/InteractiveChange.prg")
&&     m.Text5_InteractiveChange = fileToStr(lcGradePath + "Form1/PageFrame1/Page1/Text5/InteractiveChange.prg")
&&     loText5.writeMethod("InteractiveChange", m.Text5_InteractiveChange)
&& EndIf



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

Release l0Form1

