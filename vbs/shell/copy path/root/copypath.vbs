' |set /p= removes new line
createobject("wscript.shell").run "cmd /c echo|set /p=" & wscript.arguments(0) & "|clip", 0