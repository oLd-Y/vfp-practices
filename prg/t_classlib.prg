CREATE CLASSLIB myclslib     && �����µ� .VCX �������
CREATE CLASS Myform OF myclslib AS "Form"  && ��������
SET CLASSLIB TO myclslib ADDITIVE     && �� MyClsLib.VCX

myform = CREATEOBJECT("Myform")  && ���� myform ����





myform.saveAs("D:\Desktop\vfp-practices\prg\myform.scx")  && ����Ϊ myform.scx

do form myform


