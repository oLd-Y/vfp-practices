��ʾһ���û��Զ���Ի���


MESSAGEBOX(eMessageText [, nDialogBoxType ][, cTitleBarText][, nTimeout])


����
eMessageText
ָ���ڶԻ�������ʾ���ı���������ָ���κ���Ч�� Visual FoxPro ���������������������ȡ�� eMessageText��ָ�����ı��������� 1024 ���ַ��� ע�⣺
Visual FoxPro �����������ת��Ϊ�ַ���"(Object)"�����ָ���ĺ������ط��ص��Ƿ��ַ�ֵ��Visual FoxPro �Զ�ʹ�� TRANSFORM( ) �������ṩ��֮��ͬ���ַ���������������У�������һ���ַ������ڲ����ݸ� MESSAGEBOX( ):  
�� ���ƴ���
MESSAGEBOX(DATE())

��ʾ��
�� eMessageText �а����س��� CHR(13) ����ʹ��Ϣ�Ƶ���һ����ʾ���Ի���ĸ߶ȺͿ�ȸ��� eMessageText �ʵ������԰���ȫ����Ϣ�� 
�� 

nDialogBoxType
ָ���Ի����еİ�ť��ͼ�ꡢ��ʾ�Ի���ʱ��Ĭ�ϰ�ť�Լ��Ի������Ϊ��������ı��У��Ի���ťֵ�� 0 �� 5 ָ���˶Ի�������ʾ�İ�ť��ͼ��ֵ 16��32��48 �� 64 ָ���˶Ի����е�ͼ�ꡣĬ��ֵ 0��256 �� 512 ָ���Ի������ĸ���ťΪĬ�ϰ�ť������ʾ�Ի���ʱѡ�д�Ĭ�ϰ�ť����ʡ�� nDialogBoxType ʱ����ͬ��ָ�� nDialogBoxType ֵΪ 0�� ��ֵ �Ի���ť
0
���С�ȷ������ť

1
��ȷ�����͡�ȡ������ť

2
���������������ԡ��͡����ԡ���ť

3
���ǡ������񡱺͡�ȡ������ť

4
���ǡ������񡱰�ť

5
�����ԡ��͡�ȡ������ť

��ֵ ͼ��
16
��ֹͣ��ͼ��

32
�ʺ�

48
��̾��

64
��Ϣ (i) ͼ��

��ֵ Ĭ�ϰ�ť
0
��һ����ť

256
�ڶ�����ť

512
��������ť

nDialogBoxType ����������ֵ�ĺͣ�������ÿ������ѡһ��ֵ�����磬�� nDialogBoxType is 290 (2+32+256), ��ָ���ĶԻ�������������:
���������������ԡ��򡰺��ԡ���ť��
��Ϣ����ʾ�ʺ�ͼ�ꡣ
�ڶ�����ť�������ԡ�ΪĬ�ϰ�ť��
���ڿ��õĳ����Ķ�����Ϣ���� Visual FoxPro ��Ŀ¼�е� FoxPro.h �ļ��С� ʹ���� MB_ABORTRETRYIGNORE + MB_ICONQUESTION + MB_DEFBUTTON2 �������Ѷ��峣���� 2 + 32 + 256 ���߿ɶ��ԡ� ע�⣺
�ʺ�ͼ���Ѳ����Ƽ�ʹ�ã���Ϊ��������ȷ�ı�ʾ��Ϣ��ָ�����ͣ����ʺű�ʾ����Ϣ�������κ����͵���Ϣ�����⣬�û����ܻὫ�ʺű�ʾ����Ϣ�������Ϣ���������ˣ����Ƽ�����Ϣ����ʹ���ʺš�ϵͳ����֧�ְ����ʺ�ͼ����Ҫ��Ϊ�������ݡ� 
�� 

cTitleBarText
ָ���Ի���������е��ı�����ʡ�� cTitleBarText���������н���ʾ "Microsoft Visual FoxPro" ��
nTimeout
ָ������� eMessageText ǰ, û�м��̻��������ʱ�� Visual FoxPro ��ʾ eMessageText �ĺ�����������ָ���κο��õĳ�ʱ��С�� 1 ��ֵ���û�����ǰ���������ʱ (��û��ָ�� nTimeout ������ͬ)��
����ֵ
��ֵ���������͡�MESSAGEBOX( ) �ķ���ֵ����ѡȡ�˶Ի����е��ĸ���ť���±����г���ÿһ����ť�� MESSAGEBOX( ) �еķ���ֵ��

����ֵ ��ť
1
ȷ��

2
ȡ��

3
����

4
����

5
����

6
��

7
��


�ں���ȡ����ť�ĶԻ����У�������� ESC ���˳��Ի�������ѡȡ��ȡ������ťһ��������ֵ (2)��

����ʱ����ʱ MESSAGEBOX( ) ���� �C1��

˵��
MESSAGEBOX( ) �����������дΪ MESSAGEB( )��

MESSAGEBOX( ) �������������ܲ�����ͨ���������������ж�ʹ�õ�����һ����������һ�������Ǳ���Ĳ������� eMessageText�����ǣ���ѡ�ĵڶ��������������ֵ�����ͣ����ʹ��� nDialogBoxType��������ַ����������ʾ cTitleBarText��nTimeout �������Ǽٶ������˿�ѡ�ĵڶ�����ֵ�Ͳ��������õ����Ӱ���:

���ƴ���
MESSAGEBOX("HELLO","MyTitle",68,6000)
MESSAGEBOX("HELLO",68,"MyTitle",6000)
MESSAGEBOX("HELLO",68,6000)
MESSAGEBOX("HELLO",68,6000,"MyTitle")


ʾ��
�����ʾ������ʾ��һ���û��Զ���Ի��򡣱��� "Record not found. Would you like to search again?" ��ʾ���û��Զ���Ի����У�����������ʾ "My Application" ��

�û��Զ���Ի����С��ǡ��͡��񡱰�ť�Լ��ʺ�ͼ�ꡣ�ڶ�����ť (No) ΪĬ�ϰ�ť����ѡȡһ����ťʱ����ʾ��ѡ�����ݡ�

���ƴ���
eMessageTitle = 'My Application'
eMessageText = 'Record not found. Would you like to search again?'
nDialogType = 4 + 16 + 256
*  4 = Yes and No buttons
*  16 = Stop sign icon
*  256 = Second button is default

nAnswer = MESSAGEBOX(eMessageText, nDialogType, eMessageTitle)

DO CASE
CASE nAnswer = 6
WAIT WINDOW 'You chose Yes'
CASE nAnswer = 7
WAIT WINDOW 'You chose No'
ENDCASE




