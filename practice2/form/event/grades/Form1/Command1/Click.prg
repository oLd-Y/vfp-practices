*!*	 LOCAL form2
*!*	 form2 = CREATEOBJECT("Form")
*!*	 form2.Caption = "Form2"
*!*	 form2.Visible = .T.
*!*	 form2.Top = THIS.Top   && ����Form2�ڶ���Form1��λ��
*!*	 form2.Left = THIS.Left + THIS.Width   && ����Form2�ڶ���Form1��λ��

*!*	 GRID2 = CREATEOBJECT("Grid")
*!*	 GRID2.Name = "Grid2"
*!*	 GRID2.Visible = .T.
*!*	 GRID2.Top = 50   && ����Grid2��Form2�е�λ��
*!*	 GRID2.Left = 50   && ����Grid2��Form2�е�λ��
*!*	 GRID2.Width = 300   && ����Grid2�Ŀ��
*!*	 GRID2.Height = 200   && ����Grid2�ĸ߶�
*!*	 GRID2.ColumnCount = 3   && ����Grid2������
*!*	 GRID2.Column1.Header1.Caption = "�ܷ�"   && ����Grid2�ĵ�һ�б���
*!*	 GRID2.Column2.Header1.Caption = "����"   && ����Grid2�ĵڶ��б���
*!*	 GRID2.Column3.Header1.Caption = "�ۼ�����"   && ����Grid2�ĵ����б���
*!*	 GRID2.RecordSource = "t_distr"   && ����Grid2������ԴΪ�ֲ���t_distr

*!*	 command2 = CREATEOBJECT("CommandButton")
*!*	 command2.Name = "command2"
*!*	 command2.Caption = "����ΪEXCEL"
*!*	 command2.Top = 260   && ����command2��Form2�е�λ��
*!*	 command2.Left = 50   && ����command2��Form2�е�λ��
*!*	 command2.Width = 100   && ����command2�Ŀ��
*!*	 command2.Height = 30   && ����command2�ĸ߶�
*!*	 command2.Visible = .T.
*!*	 command2.ParentForm = form2   && ����command2�ĸ��ؼ�ΪForm2


*!*	 Form2 = CREATEOBJECT("Form")
*!*	 Form2.Parent = THISFORM
*!*	 Form2.Caption = "�ɼ��ֲ���"

*!*	 WITH Form2
*!*	     .AddObject("Grid2", "Grid")
*!*	     WITH .Grid2
*!*	         .Left = 0
*!*	         .Top = 0
*!*	         .Width = .Parent.Width
*!*	         .Height = .Parent.Height
*!*	         .ColumnCount = 3
*!*	         .Columns(1).Header1.Caption = "�ܷ�"
*!*	         .Columns(2).Header1.Caption = "����"
*!*	         .Columns(3).Header1.Caption = "�ۼ�����"
*!*	         * �ɸ�����Ҫ��������Grid2������
*!*	     ENDWITH
*!*	 ENDWITH

*!*	 * ����Form2���������Ժ���Ϊ
*!*	 * ���磬��������Form2��Left��Top��Width��Height������

*!*	 * ��ʾForm2
*!*	 Form2.Show(1)

*!*	 Form2 = CREATEOBJECT("Form")
*!*	 Form2.Name = "Form2"
*!*	 Form2.AddObject("Grid2", "Grid")
*!*	 Form2.Grid2.Name = "Grid2"
*!*	 Form2.Grid2.Width = 400 && ���� Grid2 �Ŀ��
*!*	 Form2.Grid2.Height = 300 && ���� Grid2 �ĸ߶�
*!*	 Form2.Show(1)  && ��ģ̬��ʽ��ʾ Form2

do form "D:\Desktop\vfp-practices\practice2\form\scx\score_distr.scx"