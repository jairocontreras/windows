set shell = createobject("wscript.shell")
set fso = createobject("scripting.filesystemobject")
set lnk = shell.createshortcut(shell.expandenvironmentstrings("%appdata%") & "\Microsoft\Windows\Start Menu\Programs\Startup\" & fso.getbasename(fso.getfile(wscript.arguments(0))) & ".lnk")
lnk.targetpath = wscript.arguments(0)
lnk.save