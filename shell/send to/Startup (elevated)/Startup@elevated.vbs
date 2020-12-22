file = wscript.arguments(0)
set fso = createobject("scripting.filesystemobject")
extension = fso.getextensionname(file)
set shell = createobject("wscript.shell")
if extension = "lnk" then
  file = shell.createshortcut(file).targetpath
  extension = fso.getextensionname(file)
end if
taskname = fso.getfilename(file)
set xml = createobject("microsoft.xmldom")
path = fso.getparentfoldername(wscript.scriptfullname) & "\folder\"
xml.load(path & "task.xml")
set network = createobject("wscript.network")
set user = getobject("winmgmts:{impersonationlevel=impersonate}!" & "/root/cimv2:win32_useraccount.domain='" & network.userdomain & "'" & ",name='" & network.username & "'")
xml.documentelement.selectsinglenode("//UserId").text = user.sid
set f = createobject("scripting.filesystemobject").opentextfile(path & "programs.txt")
do until f.atendofstream
  line = f.readline
  if extension = line then
    program = true
    exit do
  end if
loop
f.close
if program then
  program = file
else
  input = inputbox("Enter program or script path | delay in seconds" & vbcrlf & "C:\example.exe|1", "Schedule Task")
  if isempty(input) then
    wscript.quit
  end if
  arr = split(input, "|")
  if ubound(arr) = 1 then
    xml.documentelement.selectsinglenode("//Delay").text = "PT" & arr(1) & "S"
  end if
  program = arr(0)
  xml.documentelement.selectsinglenode("//Arguments").text = chr(34) & file & chr(34)
end if
xml.documentelement.selectsinglenode("//Command").text = program
xml.documentelement.selectsinglenode("//WorkingDirectory").text = fso.getparentfoldername(wscript.arguments(0))
temp = shell.expandenvironmentstrings("%temp%") & "\temp.xml"
xml.save(temp)
' async means cannot delete temp
createobject("shell.application").shellexecute "schtasks", "/create /tn " & chr(34) & taskname & chr(34) & " /xml " & temp,, "runas", 0