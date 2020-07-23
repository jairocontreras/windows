set fso = createobject("scripting.filesystemobject")
file = fso.getfile(wscript.arguments(0))
tr = """" & wscript.arguments(0) & """"
if not fso.getextensionname(file) = "exe" then
  exe = inputbox("Enter executable path", "Schedule Task")
  if isempty(exe) or exe = "" then
    wscript.quit
  else
    tr = """" & exe & """ " & tr
  end if
end if
createobject("shell.application").shellexecute "powershell", "-executionpolicy bypass -file " & createobject("wscript.shell").expandenvironmentstrings("%homedrive%") & "\startup.ps1 " & tr,, "runas", 0