Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
lcGradePath = lcEventPath + "grade\"
lcFilingInfoPath = lcEventPath + "filing_info\"
&& ���з�
br = chr(13)

&& && ���� nowait ����ڹرձ���֮���ִ�к������䣬cmd���Ҳ���������
&& modi form grade Nowait
&& && Create Form lcFormPath + [frmMain.scx] As Form Nowait
&& ASelObj(laForm,1)
&& loForm = laForm[1]



&& && ���޸�ͬ������Ӧ��prg��
&& m.gradeForm1Load = loForm.readMethod("Load")
&& strToFile(m.gradeForm1Load, lcGradePath + "Form1/Load.prg")


&& m.readFile = fileToStr(lcGradePath + "Form1/Load.prg")
&& loForm.writeMethod("Load", m.readFile)




modi form filing_info Nowait
ASelObj(laForm,1)
loForm = laForm[1]
m.readFile = fileToStr(lcFilingInfoPath + "Form1/Load.prg")
loForm.writeMethod("Load", m.readFile)