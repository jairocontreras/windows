set programs=Microsoft\Windows\Start Menu\Programs
for /f "tokens=*" %%g in (%~dp0items\start.txt) do for %%h in (%allusersprofile% %appdata%) do rd /s /q "%%h\%programs%\%%g"
rd /s /q "%appdata%\%programs%\Windows PowerShell"
del "%appdata%\%programs%\OneDrive.lnk"