CREATE CLASSLIB myclslib     && 创建新的 .VCX 可视类库
CREATE CLASS Myform OF myclslib AS "Form"  && 创建新类
SET CLASSLIB TO myclslib ADDITIVE     && 打开 MyClsLib.VCX

myform = CREATEOBJECT("Myform")  && 创建 myform 对象





myform.saveAs("D:\Desktop\vfp-practices\prg\myform.scx")  && 保存为 myform.scx

do form myform


