set shell = createobject("wscript.shell")
homedrive = shell.expandenvironmentstrings("%homedrive%")
createobject("shell.application").shellexecute homedrive & "\regjump", wscript.arguments(0),, "runas"