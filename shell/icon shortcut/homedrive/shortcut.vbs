set fso = createobject("scripting.filesystemobject")
file = fso.getfile(wscript.arguments(0))
set lnk = createobject("wscript.shell").createshortcut(fso.getparentfoldername(file) & "\" & fso.getbasename(file) & ".lnk")
lnk.targetpath = wscript.arguments(0)
icon = inputbox("Enter absolute or environment path (index optional)", "Icon Shortcut")
if not isempty(icon) and not icon = "" then
  lnk.iconlocation = icon
  lnk.save
end if