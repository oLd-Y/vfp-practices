SET CLASSLIB TO ivt_clslib

frmMyForm = CREATEOBJECT("Form")
cmdSave = CREATEOBJECT("cmdSave")

with frmMyForm
    .AddObject("cmdSave", "cmdSave")
    .Show()
endwith