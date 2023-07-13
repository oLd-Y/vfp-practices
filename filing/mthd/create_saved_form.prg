set classLib to mylib addictive


test_form = createObject("Form")
test_form.addObject("cmd", "Save")
&& addProperty(test_form, "save", newObject("save", "Save.prg"))

&& test_form.show()
add class test_form to mylib

&& lcFormPath = addBs(justPath(_vfp.activeProject.name)) + "frm\"
&& test_form.saveAs(lcFormPath + "test_form.scx")