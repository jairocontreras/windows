set shell = createobject("wscript.shell")
appdata = shell.expandenvironmentstrings("%appdata%")
set fso = createobject("scripting.filesystemobject")
file = fso.getfile(wscript.arguments(0))
set lnk = shell.createshortcut(appdata & "\Microsoft\Windows\Start Menu\Programs\Startup\" & fso.getbasename(file) & ".lnk")
lnk.targetpath = wscript.arguments(0)
lnk.save