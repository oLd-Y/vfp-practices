��ʹ��WITH��������customerIDʱ�����Ը��ݾ���Ŀͻ�ID����ʾ��صĿͻ���Ϣ��

���磬����������һ���ͻ���Ϣ������а����ͻ�����������ַ����ϵ��ʽ����Ϣ�����ǿ��Դ���һ��������ʾ�ͻ�����ϸ��Ϣ����ͨ�����ݲ�ͬ��customerID��������ʾ��ͬ�ͻ�����Ϣ��

�������������±����룬��Ϊ"CustomerDetailsForm"��
```visualfoxpro
sql
Copy code
PROCEDURE Init
LPARAMETERS customerID
SELECT * FROM Customers WHERE CustomerID = customerID INTO CURSOR crsCustomer
ENDPROC

```

�ڱ���Init�����У�����ʹ��SELECT����Customers����ѡ�����ƥ��customerID�Ŀͻ���¼����������洢����ΪcrsCustomer���α��С�Ȼ�����ǿ����ڱ��еĿؼ�����ʾ�ÿͻ�����ϸ��Ϣ��

���ڣ�����������Ҫ��ʾIDΪ"1001"�Ŀͻ�����ϸ��Ϣ�����ǿ���ʹ��DO FORM�������customerID���������б�������ʾ�ÿͻ�����Ϣ��������һ����������ӣ�
```visualfoxpro
vbnet
Copy code
DO FORM CustomerDetailsForm WITH customerID = "1001"
```

����������У�����ʹ��DO FORM������������Ϊ"CustomerDetailsForm"�ı�����ʹ��WITH��������customerID����Ϊ"1001"
������Init���̽����ݸ�customerIDѡ����Ӧ�Ŀͻ���¼�����ڱ�����ʾ�ÿͻ�����ϸ��Ϣ��

ͨ��ʹ�ò�ͬ��customerID����ֵ�����ǿ�����ͬһ��������ʾ��ͬ�ͻ�����ϸ��Ϣ�������贴�������ͬ�ṹ�ı�������������ߴ���ĸ����ԺͿ�ά���ԡ�