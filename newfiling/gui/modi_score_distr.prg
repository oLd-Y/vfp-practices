Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
&& ���з�
br = chr(13)

&& ���� nowait ����ڹرձ�֮���ִ�к������䣬cmd���Ҳ�������
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