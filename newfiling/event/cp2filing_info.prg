Local Array laForm[1]
Local loForm1
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
lcFilingInfoPath = lcEventPath + "filing_info\"


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
loForm1 = laForm[1]
loPageFrame1 = loForm1.PageFrame1
loPage1 = loPageFrame1.Page1
loGrid1 = loPage1.Grid1
loGrid2 = loPage1.Grid2
loCommand1 = loPage1.Command1
&& loCombo1 = loPage1.Combo1



&& -------------------------- Form1 --------------------------------
&& Load
If File(lcFilingInfoPath + "Form1/Load.prg")
    m.Form1_Load = fileToStr(lcFilingInfoPath + "Form1/Load.prg")
    loForm1.writeMethod("Load", m.Form1_Load)
EndIf

&& QueryUnload
If File(lcFilingInfoPath + "Form1\QueryUnload.prg")
    m.Form1_QueryUnload = fileToStr(lcFilingInfoPath + "Form1\QueryUnload.prg")
    loForm1.writeMethod("QueryUnload", m.Form1_QueryUnload)
EndIf

&& filter
If File(lcFilingInfoPath + "Form1/filter.prg")
    m.filter = fileToStr(lcFilingInfoPath + "Form1/filter.prg")
    loForm1.writeMethod("filter", m.filter)
EndIf

&& ------------------------------- 大学表 Grid1 --------------------------------
&& AfterRowColChange
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/AfterRowColChange.prg")
    m.Grid1_AfterRowColChange = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/AfterRowColChange.prg")
    loGrid1.writeMethod("AfterRowColChange", m.Grid1_AfterRowColChange)
EndIf

&& Init
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/Init.prg")
    m.Grid1_Init = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/Init.prg")
    loGrid1.writeMethod("Init", m.Grid1_Init)
EndIf

&& -------------------------- 打印成报表按钮 Command1------------------------
&& Click
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    m.Command1_Click = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    loCommand1.writeMethod("Click", m.Command1_Click)
EndIf

&& && --------------------------- 查询按钮 Command2 ----------------------------
&& && Click
&& If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Command2/Click.prg")
&&     m.Command2_Click = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Command2/Click.prg")
&&     loCommand2.writeMethod("Click", m.Command2_Click)
&& EndIf

&& && ------------------------------- 多选框 Combo1 -----------------------------
&& && InteractiveChange
&& If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Combo1/InteractiveChange.prg")
&&     m.Combo1_InteractiveChange = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Combo1/InteractiveChange.prg")
&&     loCombo1.writeMethod("InteractiveChange", m.Combo1_InteractiveChange)
&& EndIf

&& ------------------------------- 学生姓名 Text3 --------------------------------
loText3 = loPage1.Text3
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text3/InteractiveChange.prg")
    m.Text3_InteractiveChange = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text3/InteractiveChange.prg")
    loText3.writeMethod("InteractiveChange", m.Text3_InteractiveChange)
EndIf

&& ------------------------------- 准考证号 Text4 --------------------------------
loText4 = loPage1.Text4
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text4/InteractiveChange.prg")
    m.Text4_InteractiveChange = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text4/InteractiveChange.prg")
    loText4.writeMethod("InteractiveChange", m.Text4_InteractiveChange)
EndIf

&& ------------------------------- 中学名称 Text5 --------------------------------
loText5 = loPage1.Text5
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text5/InteractiveChange.prg")
    m.Text5_InteractiveChange = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text5/InteractiveChange.prg")
    loText5.writeMethod("InteractiveChange", m.Text5_InteractiveChange)
EndIf



Release l0Form1

