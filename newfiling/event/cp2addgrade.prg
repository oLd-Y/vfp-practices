Local Array laForm[1]
Local loForm1
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcEventPath = lcRootPath + "event\"
lcAddGradePath = lcEventPath + "addgrade\"

modi form addgrade Nowait
ASelObj(laForm,1)


&& Form1
loForm1 = laForm[1]
&& Load
If File(lcAddGradePath + "Form1/Load.prg")
    m.readFile = fileToStr(lcAddGradePath + "Form1/Load.prg")
    loForm1.writeMethod("Load", m.readFile)
EndIf

&& QueryUnload
If File(lcAddGradePath + "Form1\QueryUnload.prg")
    m.readFile = fileToStr(lcAddGradePath + "Form1\QueryUnload.prg")
    loForm1.writeMethod("QueryUnload", m.readFile)
EndIf

&& Init
If File(lcAddGradePath + "Form1\Init.prg")
    m.readFile = fileToStr(lcAddGradePath + "Form1\Init.prg")
    loForm1.writeMethod("Init", m.readFile)
EndIf

&& Unload
If File(lcAddGradePath + "Form1\Unload.prg")
    m.readFile = fileToStr(lcAddGradePath + "Form1\Unload.prg")
    loForm1.writeMethod("Unload", m.readFile)
EndIf



&& Form1.Command1
loCommand1 = loForm1.Command1
&& Click
If File(lcAddGradePath + "Form1/Command1/Click.prg")
    m.readFile = fileToStr(lcAddGradePath + "Form1/Command1/Click.prg")
    loCommand1.writeMethod("Click", m.readFile)
EndIf




Release loForm1

