Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
&& 换行符
br = chr(13)

&& 不加 nowait 则会在关闭表单之后才执行后面的语句，cmd就找不到表单了
modi form score_distr.scx Nowait
&& Create Form lcFormPath + [frmMain.scx] As Form Nowait
ASelObj(laForm,1)
loForm = laForm[1]
&& loForm.AddObject("cmd", "CommandButton")

&& cmd = loForm.cmd

&& with cmd
&&     .caption = "Save2"
&&     .width = 100
&&     .height = 100
&&     .top = 100
&&     .left = 30
&&
&& endwith
&&
&& with loForm
&&     .width = 500
&&     .height = 200
&&     .ShowWindow = 2 && as top level form
&&     .Autocenter=.T.
&&     .Caption="Main Form Test2"
&& endwith