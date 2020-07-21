set fso = createobject("scripting.filesystemobject")
set file = fso.getfile(wscript.arguments(0))
tr = wscript.arguments(0)
if not fso.getextensionname(file) = "exe" then
  exe = inputbox("Enter executable path", "Task Scheduler")
  if isempty(exe) or exe = "" then
    wscript.quit
  else
    tr = exe & "\"" \""" & tr
  end if
end if
' /tr "\"file name\""
createobject("shell.application").shellexecute "schtasks", "/create /tn """ & fso.getbasename(file) & """ /tr ""\""" & tr & "\"""" /sc onlogon /rl highest",, "runas", 0