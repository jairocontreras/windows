if wscript.arguments.count = 0 then
  key = "-c"
else
  key = wscript.arguments(0)
end if
createobject("shell.application").shellexecute createobject("wscript.shell").expandenvironmentstrings("%homedrive%") & "\regjump", key,, "runas"