#Define ccPropjectpath [D:\desktop\singleformSCX\]
MkDir (ccPropjectpath)
Cd (ccPropjectpath)

MkDir [forms]
MkDir [others]
MkDir [prgs]

Create Project singleformSCX.pjx Nowait Save

Local lcFile
Text To lcFile Noshow
On Shutdown Quit
Do Form frmMain
Read Events
EndText
StrToFile(lcFile,"prgs\main.prg")
_vfp.ActiveProject.Files.Add("prgs\main.prg")

Text To lcFile Noshow
SCREEN=OFF
RESOURCE=OFF
ALLOWEXTERNAL=ON
EndText
StrToFile(lcFile,"others\config.fpw")
_vfp.ActiveProject.Files.Add("others\config.fpw")

Local Array laForm[1]
Local loForm
Create Form [forms\frmMain.scx] As Form Nowait
ASelObj(laForm,1)
loForm = laForm[1]
loForm.ShowWindow = 2 && as top level form
loForm.Autocenter=.T.
loForm.Caption="Main Form"
loForm.WriteMethod("Unload","Clear Events")
Activate Window "Form Designer" && change in localized VFP versions
Keyboard '{CTRL+S}'
Keyboard '{CTRL+F4}'
Doevents
_vfp.ActiveProject.Files.Add("forms\frmMain.scx")
_vfp.ActiveProject.Build("singleformSCX.exe",3,.t.,.t.,.t.)