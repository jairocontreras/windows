set fso = createobject("scripting.filesystemobject")
set file = fso.getfile(wscript.arguments(0))
createobject("shell.application").shellexecute "schtasks", "/create /tn """ & fso.getbasename(file) & """ /tr """ & wscript.arguments(0) & """ /sc onlogon /rl highest",, "runas", 0