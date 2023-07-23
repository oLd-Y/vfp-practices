Local Array laForm[1]
Local loForm1
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
lcFilingInfoPath = lcEventPath + "filing_info\"

modi form filing_info Nowait
ASelObj(laForm,1)



&& Form1
loForm1 = laForm[1]
&& Load
If File(lcFilingInfoPath + "Form1/Load.prg")
    m.readFile = fileToStr(lcFilingInfoPath + "Form1/Load.prg")
    loForm1.writeMethod("Load", m.readFile)
EndIf

&& QueryUnload
If File(lcFilingInfoPath + "Form1\QueryUnload.prg")
    m.readFile = fileToStr(lcFilingInfoPath + "Form1\QueryUnload.prg")
    loForm1.writeMethod("QueryUnload", m.readFile)
EndIf

&& filter
If File(lcFilingInfoPath + "Form1/filter.prg")
    m.readFile = fileToStr(lcFilingInfoPath + "Form1/filter.prg")
    loForm1.writeMethod("filter", m.readFile)
EndIf



loPageFrame1 = loForm1.PageFrame1



loPage1 = loPageFrame1.Page1



&& Form1.PageFrame1.Page1.Grid1
loGrid1 = loPage1.Grid1
&& AfterRowColChange
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/AfterRowColChange.prg")
    m.readFile = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/AfterRowColChange.prg")
    loGrid1.writeMethod("AfterRowColChange", m.readFile)
EndIf

&& Init
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/Init.prg")
    m.readFile = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Grid1/Init.prg")
    loGrid1.writeMethod("Init", m.readFile)
EndIf



&& Form1.PageFrame1.Page1.Command1
loCommand1 = loPage1.Command1
&& Click
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    m.readFile = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Command1/Click.prg")
    loCommand1.writeMethod("Click", m.readFile)
EndIf



&& Form1.PageFrame1.Page1.Text3
loText3 = loPage1.Text3
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text3/InteractiveChange.prg")
    m.readFile = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text3/InteractiveChange.prg")
    loText3.writeMethod("InteractiveChange", m.readFile)
EndIf



&& Form1.PageFrame1.Page1.Text4
loText4 = loPage1.Text4
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text4/InteractiveChange.prg")
    m.readFile = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text4/InteractiveChange.prg")
    loText4.writeMethod("InteractiveChange", m.readFile)
EndIf



&& Form1.PageFrame1.Page1.Text5
loText5 = loPage1.Text5
If File(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text5/InteractiveChange.prg")
    m.readFile = fileToStr(lcFilingInfoPath + "Form1/PageFrame1/Page1/Text5/InteractiveChange.prg")
    loText5.writeMethod("InteractiveChange", m.readFile)
EndIf



Release l0Form1

