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
set shell = createobject("wscript.shell")
createobject("shell.application").shellexecute "powershell", "-executionpolicy bypass -file " & shell.expandenvironmentstrings("%homedrive%") & "\startup.ps1 " & tr,, "runas", 0