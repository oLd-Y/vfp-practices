set safety on

Local Array laForm[1]
Local loForm
lcFormPath = addBs(justPath(_vfp.activeProject.name)) + "frm\"
br = chr(13)

&& delete file lcFormPath + [filing_info.scx] ? recycle
&& Create Form lcFormPath + [filing_info.scx] As Form Nowait
modi form filing_info Nowait
ASelObj(laForm,1)
loForm = laForm[1]
&& loForm.AddObject("PageFrame1", "PageFrame")

loPageFrame = loForm.PageFrame1
&& loPageFrame.AddObject("Page1", "Page")

loPage = loPageFrame.Page1
&& loPage.AddObject("Grid1", "Grid")
&& loPage.AddObject("Grid2", "Grid")
&& loPage.addObject("Text1", "TextBox")
&& loPage.addObject("Text2", "TextBox")
&& loPage.AddObject("Shape1", "Shape")
&& loPage.AddObject("Shape2", "Shape")


set safety off



