file = wscript.arguments(0)
set fso = createobject("scripting.filesystemobject")
set lnk = createobject("wscript.shell").createshortcut(fso.getparentfoldername(file) & "\" & fso.getbasename(file) & ".lnk")
lnk.targetpath = file
lnk.workingdirectory = fso.getparentfoldername(file)
icon = inputbox("Enter absolute or environment variable path", "Icon Shortcut")
if not isempty(icon) then
  lnk.iconlocation = icon
  lnk.save
end if