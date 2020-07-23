set fso = createobject("scripting.filesystemobject")
set file = fso.getfile(wscript.arguments(0))
set lnk = createobject("wscript.shell").createshortcut(fso.getparentfoldername(file) & "\" & fso.getbasename(file) & ".lnk")
lnk.targetpath = wscript.arguments(0)
icon = inputbox("", "Icon Shortcut")
if not isempty(icon) and not icon = "" then
  lnk.iconlocation = icon
  lnk.save
end if