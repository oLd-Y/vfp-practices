set safety on

Local Array laForm[1]
Local loForm
lcFormPath = addBs(justPath(_vfp.activeProject.name)) + "frm\"
br = chr(13)

delete file lcFormPath + [frmMain.scx] ? recycle
Create Form lcFormPath + [frmMain.scx] As Form Nowait
ASelObj(laForm,1)
loForm = laForm[1]
loForm.AddObject("cmd", "CommandButton")

set safety off



