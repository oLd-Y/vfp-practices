LPARAMETERS nColIndex

&& university ���ˣ���student��score��highschool���ı���֮��������Ⱦ��Grid2��
&& Grid2��score -> student & rank; student -> highschool & university
&& ���Grid1�Ĳ�ͬ�У�������Դ�ļ�¼��Ҳ����Ӧ�ı�

select student
set filter to volu_code1 = university.univ_code .OR. volu_code2 = university.univ_code .OR. volu_code3 = university.univ_code
count to m.filing_num
thisForm.text3.value = m.filing_num

set filter to pass_num = student.pass_num in score


set filter to high_code = student.high_code in highschool

