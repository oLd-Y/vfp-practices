Local Array laForm[1]
Local loForm
lcFormPath = addBs(justPath(_vfp.activeProject.name)) + "frm\"
&& ���з�
br = chr(13)

&& ���� nowait ����ڹرձ�֮���ִ�к������䣬cmd���Ҳ�������
modi form lcFormPath + [frmMain.scx] Nowait
&& Create Form lcFormPath + [frmMain.scx] As Form Nowait
ASelObj(laForm,1)
loForm = laForm[1]
&& loForm.AddObject("cmd", "CommandButton")

cmd = loForm.cmd

with cmd
    .caption = "Save"
    .width = 100
    .height = 100
    .top = 100
    .left = 30
endwith

with loForm
    .width = 500
    .height = 200
    .ShowWindow = 2 && as top level form
    .Autocenter=.T.
    .Caption="Main Form"
endwith

&& m.FormUnload =     ";
&& Clear Events \;
&& thisForm.width = 1 ;
&& "

m.FormUnload = ;
+br+    "Clear Events ";

loForm.WriteMethod( ;
    "Unload", ;
    m.FormUnload ;
)

