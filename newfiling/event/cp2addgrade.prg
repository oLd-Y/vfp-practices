Local Array laForm[1]
Local loForm1
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcEventPath = lcRootPath + "event\"
lcAddGradePath = lcEventPath + "addgrade\"

modi form addgrade Nowait
ASelObj(laForm,1)


&& -------------------------- Form1 --------------------------------
loForm1 = laForm[1]
&& Load
If File(lcAddGradePath + "Form1/Load.prg")
    m.Form1_Load = fileToStr(lcAddGradePath + "Form1/Load.prg")
    loForm1.writeMethod("Load", m.Form1_Load)
EndIf

&& QueryUnload
If File(lcAddGradePath + "Form1\QueryUnload.prg")
    m.Form1_QueryUnload = fileToStr(lcAddGradePath + "Form1\QueryUnload.prg")
    loForm1.writeMethod("QueryUnload", m.Form1_QueryUnload)
EndIf

&& Init
If File(lcAddGradePath + "Form1\Init.prg")
    m.Form1_Init = fileToStr(lcAddGradePath + "Form1\Init.prg")
    loForm1.writeMethod("Init", m.Form1_Init)
EndIf

&& -------------------------- Command1 --------------------------------
loCommand1 = loForm1.Command1
&& Click
If File(lcAddGradePath + "Command1\Click.prg")
    m.Command1_Click = fileToStr(lcAddGradePath + "Form1\Command1\Click.prg")
    loCommand1.writeMethod("Click", m.Command1_Click)
EndIf

Release l0Form1

