set shell = createobject("wscript.shell")
set fso = createobject("scripting.filesystemobject")
file = wscript.arguments(0)
set lnk = shell.createshortcut(shell.expandenvironmentstrings("%appdata%") & "\Microsoft\Windows\Start Menu\Programs\Startup\" & fso.getbasename(fso.getfile(file)) & ".lnk")
lnk.targetpath = file
lnk.workingdirectory = fso.getparentfoldername(file)
lnk.save