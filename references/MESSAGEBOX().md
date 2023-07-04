显示一个用户自定义对话框。


MESSAGEBOX(eMessageText [, nDialogBoxType ][, cTitleBarText][, nTimeout])


参数
eMessageText
指定在对话框中显示的文本。还可以指定任何有效的 Visual FoxPro 函数、对象或数据类型来取代 eMessageText。指定的文本最多可以有 1024 个字符。 注意：
Visual FoxPro 将对象的引用转换为字符串"(Object)"。如果指定的函数返回返回的是非字符值，Visual FoxPro 自动使用 TRANSFORM( ) 函数来提供与之等同的字符。在下面的例子中，返回了一个字符型日期并传递给 MESSAGEBOX( ):  
　 复制代码
MESSAGEBOX(DATE())

提示：
在 eMessageText 中包含回车符 CHR(13) 可以使信息移到下一行显示。对话框的高度和宽度根据 eMessageText 适当增大，以包含全部信息。 
　 

nDialogBoxType
指定对话框中的按钮和图标、显示对话框时的默认按钮以及对话框的行为。在下面的表中，对话框按钮值从 0 到 5 指定了对话框中显示的按钮。图标值 16、32、48 和 64 指定了对话框中的图标。默认值 0、256 和 512 指定对话框中哪个按钮为默认按钮。当显示对话框时选中此默认按钮。当省略 nDialogBoxType 时，等同于指定 nDialogBoxType 值为 0。 数值 对话框按钮
0
仅有“确定”按钮

1
“确定”和“取消”按钮

2
“放弃”、“重试”和“忽略”按钮

3
“是”、“否”和“取消”按钮

4
“是”、“否”按钮

5
“重试”和“取消”按钮

数值 图标
16
“停止”图标

32
问号

48
惊叹号

64
信息 (i) 图标

数值 默认按钮
0
第一个按钮

256
第二个按钮

512
第三个按钮

nDialogBoxType 可以是三个值的和，从上面每个表中选一个值。例如，若 nDialogBoxType is 290 (2+32+256), 则指定的对话框含有如下特征:
“放弃”、“重试”或“忽略”按钮。
消息框显示问号图标。
第二个按钮，“重试”为默认按钮。
关于可用的常量的额外信息是在 Visual FoxPro 主目录中的 FoxPro.h 文件中。 使用象 MB_ABORTRETRYIGNORE + MB_ICONQUESTION + MB_DEFBUTTON2 这样的已定义常数比 2 + 32 + 256 更具可读性。 注意：
问号图标已不再推荐使用，因为它不能明确的表示信息的指定类型，用问号表示的信息可能是任何类型的信息。另外，用户可能会将问号表示的信息与帮助信息相混淆。因此，不推荐在信息框中使用问号。系统继续支持包含问号图标主要是为了向后兼容。 
　 

cTitleBarText
指定对话框标题栏中的文本。若省略 cTitleBarText，标题栏中将显示 "Microsoft Visual FoxPro" 。
nTimeout
指定在清除 eMessageText 前, 没有键盘或鼠标输入时的 Visual FoxPro 显示 eMessageText 的毫秒数。可以指定任何可用的超时。小于 1 的值在用户输入前不会产生超时 (与没有指定 nTimeout 参数相同)。
返回值
数值型数据类型。MESSAGEBOX( ) 的返回值标明选取了对话框中的哪个按钮。下表中列出了每一个按钮在 MESSAGEBOX( ) 中的返回值。

返回值 按钮
1
确定

2
取消

3
放弃

4
重试

5
忽略

6
是

7
否


在含有取消按钮的对话框中，如果按下 ESC 键退出对话框，则与选取“取消”按钮一样，返回值 (2)。

当超时发生时 MESSAGEBOX( ) 返回 –1。

说明
MESSAGEBOX( ) 函数的最短缩写为 MESSAGEB( )。

MESSAGEBOX( ) 函数采用了智能参数，通过参数的类型来判断使用的是哪一个参数。第一个参数是必须的并且总是 eMessageText。但是，可选的第二个参数如果是数值型类型，它就代表 nDialogBoxType，如果是字符型类型则表示 cTitleBarText。nTimeout 参数总是假定传递了可选的第二个数值型参数。可用的例子包括:

复制代码
MESSAGEBOX("HELLO","MyTitle",68,6000)
MESSAGEBOX("HELLO",68,"MyTitle",6000)
MESSAGEBOX("HELLO",68,6000)
MESSAGEBOX("HELLO",68,6000,"MyTitle")


示例
下面的示例中显示了一个用户自定义对话框。标题 "Record not found. Would you like to search again?" 显示在用户自定义对话框中，标题栏中显示 "My Application" 。

用户自定义对话框含有“是”和“否”按钮以及问号图标。第二个按钮 (No) 为默认按钮。当选取一个按钮时，显示所选的内容。

复制代码
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




