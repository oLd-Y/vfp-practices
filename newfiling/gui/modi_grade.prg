Local Array laForm[1]
Local loForm
lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcFormPath = lcRootPath + "frm\"
lcEventPath = lcRootPath + "event\"
&& ���з�
br = chr(13)

&& ���� nowait ����ڹرձ�֮���ִ�к������䣬cmd���Ҳ�������
&& ��������� save ����, ��������������޷���ȡ��Ӧ�ı������� (�ݲ�ȷ���Ƿ�Ϊ��)
modi form grade Nowait
&& Create Form lcFormPath + [frmMain.scx] As Form Nowait
ASelObj(laForm,1)
loForm = laForm[1]
&& loForm.AddObject("cmd", "CommandButton")

grid1 = loForm.grid1

with grid1
    .recordSource = "score"

    .readOnly = .T.
    .deleteMark = .F.
    .recordMark = .F.
    .setFocus()
    .LockColumns = 3
    .highLightBackColor = RGB(0, 128, 255)
    .highLightRow = .T.
    .highLightRowLineWidth = 0 && ���������ܵĿ�� ..
    .highLightStyle = 2 && ͻ����ʾ��ǰ�в����ֿɼ����л�����Ŀؼ����Ǹ����� ..

	.fontSize = 10
	.headerHeight = 30
	.rowHeight = 27
	.readOnly = .T.

	.SetAll("Alignment", 2, "Header")
	.SetAll("FontName", "΢���ź�", "Header")
	.SetAll("FontSize", 12, "Header")

	.SetAll("Alignment", 2, "Column")
	.SetAll("FontName", "΢���ź�", "Column")
	.SetAll("FontSize", 10, "Column")
	.setAll("fontBold", .F., "Column")
	.SetAll("Format", "Z", "Column")
	.SetAll("Width", 90, "Column")
	.setAll("movable", .F., "Column")

    for i = 1 to 3
        .Columns(i).backColor = RGB(255, 255, 0)
    endfor

    .columns(1).controlSource = "student.pass_num"
    .columns(2).controlSource = "student.id_card"
    .columns(3).controlSource = "student.stu_name"
    .columns(4).controlSource = "highSchool.high_name"
    .columns(5).controlSource = "score.all_score"
    .columns(6).controlSource = "score.chinese"
    .columns(7).controlSource = "score.math"
    .columns(8).controlSource = "score.english"
    .columns(9).controlSource = "score.composite"
    .columns(10).controlSource = "rank.rank"
    .columns(11).controlSource = "university1.univ_name"
    .columns(12).controlSource = "university2.univ_name"
    .columns(13).controlSource = "university3.univ_name"

endwith
&&
&& with loForm
&&     .width = 500
&&     .height = 200
&&     .ShowWindow = 2 && as top level form
&&     .Autocenter=.T.
&&     .Caption="Main Form Test2"
&& endwith