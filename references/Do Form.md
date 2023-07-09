当使用WITH参数传递customerID时，可以根据具体的客户ID来显示相关的客户信息。

例如，假设我们有一个客户信息表格，其中包含客户的姓名、地址和联系方式等信息。我们可以创建一个表单来显示客户的详细信息，并通过传递不同的customerID参数来显示不同客户的信息。

假设我们有以下表单代码，名为"CustomerDetailsForm"：
```visualfoxpro
sql
Copy code
PROCEDURE Init
LPARAMETERS customerID
SELECT * FROM Customers WHERE CustomerID = customerID INTO CURSOR crsCustomer
ENDPROC

```

在表单的Init过程中，我们使用SELECT语句从Customers表中选择具有匹配customerID的客户记录，并将结果存储在名为crsCustomer的游标中。然后，我们可以在表单中的控件中显示该客户的详细信息。

现在，假设我们想要显示ID为"1001"的客户的详细信息。我们可以使用DO FORM命令并传递customerID参数来运行表单，并显示该客户的信息。下面是一个具体的例子：
```visualfoxpro
vbnet
Copy code
DO FORM CustomerDetailsForm WITH customerID = "1001"
```

在这个例子中，我们使用DO FORM命令来运行名为"CustomerDetailsForm"的表单，并使用WITH参数传递customerID参数为"1001"
。表单的Init过程将根据该customerID选择相应的客户记录，并在表单中显示该客户的详细信息。

通过使用不同的customerID参数值，我们可以在同一个表单中显示不同客户的详细信息，而无需创建多个相同结构的表单。这样可以提高代码的复用性和可维护性。