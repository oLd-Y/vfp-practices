set safety on

Local Array laForm[1]
Local loForm
lcFormPath = addBs(justPath(_vfp.activeProject.name)) + "frm\"
br = chr(13)

delete file lcFormPath + [filing_info.scx] ? recycle
Create Form lcFormPath + [filing_info.scx] As Form Nowait
ASelObj(laForm,1)
loForm = laForm[1]
loForm.AddObject("Grid1", "Grid")
loForm.AddObject("Grid2", "Grid")
loForm.AddObject("PageFrame1", "PageFrame")

set safety off



