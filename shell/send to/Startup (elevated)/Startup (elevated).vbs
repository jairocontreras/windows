set fso = createobject("scripting.filesystemobject")
set xml = createobject("microsoft.xmldom")
set shell = createobject("wscript.shell")

file = wscript.arguments(0)
extension = fso.getextensionname(file)
exe = file
xml.load(fso.getparentfoldername(wscript.scriptfullname) & "\task.xml")

if not extension = "exe" then
  if extension = "lnk" then
    file = shell.createshortcut(file).targetpath
    if fso.getextensionname(file) = "exe" then
      exe = file
      quit = true
    end if
  end if
  if not quit then
    exe = inputbox("Enter executable path", "Schedule Task")
    if isempty(exe) then
      wscript.quit
    end if
    xml.documentelement.selectsinglenode("//Arguments").text = chr(34) & file & chr(34)
  end if
end if

taskname = fso.getfilename(file)
temp = shell.expandenvironmentstrings("%temp%") & "\temp.xml"

set network = createobject("wscript.network")
set user = getobject("winmgmts:{impersonationlevel=impersonate}!" & "/root/cimv2:win32_useraccount.domain='" & network.userdomain & "'" & ",name='" & network.username & "'")

xml.documentelement.selectsinglenode("//UserId").text = user.sid
xml.documentelement.selectsinglenode("//Command").text = exe
xml.documentelement.selectsinglenode("//WorkingDirectory").text = fso.getparentfoldername(wscript.arguments(0))

xml.save(temp)
' async means cannot delete temp
createobject("shell.application").shellexecute "schtasks", "/create /tn " & chr(34) & taskname & chr(34) & " /xml " & temp,, "runas", 0