Set Century Off				&& 指定日期的年份为四位数
Set Collate To "MACHINE"
Set Color To				&& 设置颜色为默认状态
Set Console On				&& 将所有结果输出到VFP主窗口或活动的用户自定义窗口
Set Date Ansi				&& 指定日期显示格式为yy.mm.dd
Set Decimals To 2
Set Deleted On
Set Escape Off				&& 禁止ESC中断运行的程序
Set Exclusive Off			&& 允许网络上的用户共享和修改网络上打开的表
Set Mark To "-"
Set MemoWidth To 200
Set Notify Off
Set Notify Cursor Off		&& 不在状态栏显示数据信息
*Set Help Off				&& 按下F1或执行HELP命令时显示帮助窗口
*Set Help To Help.chm		&& 指定帮助文件
Set Hours To 24
Set Safety Off				&& 指定在改写已有文件时不显示确认对话框
Set Status Off
Set Status Bar Off			&& 关闭VFP状态栏
Set SysMenu Off				&& 关闭系统菜单
Set Talk Off				&& 关闭命令显示
Clear						&& 清除主窗口
*Clear All					&& 清除变量
Close Databases				&& 关闭数据库

If _VFP.StartMode = 0
	_Screen.Visible = .T.
	Activate Screen
Else
	_Screen.Visible = .F.
	On Error Do ErrorHandler With Error(), Message(), Message(1), Program(), LineNo()
EndIf
SqlSetProp(0, "DispLogin", 3)  && 不显示SQL登录提示

* 库设置
Set Library To FoxJson.fll  Additive
Set Library To MyFll.fll Additive

Set Procedure To foxjson, foxjson_parse Additive
Set Procedure To MyFunc Additive

* 屏幕尺寸
Public gnFormW, gnFormH
gnFormW = SysMetric(21) - 6
gnFormH = SysMetric(22) - 5
* 网络日期、时间
Public gcNetDate, gcNetTime
* 记账日期
Public gcActDate, gcNetStat
* 通用信息
Public gcLeadStr, gcDeptStr
* 本机信息
Public gcLocMac
* 用户信息
Public gcUserLog, gcUserNo, gcUserDept, gcUserName, gcUserAuth, gcUserKey
* 一级子表单、二级子表单、三级子表单动作关闭标志
Public glSub1Exit, glSub2Exit, glSub3Exit