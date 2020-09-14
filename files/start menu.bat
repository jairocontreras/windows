set programs=Microsoft\Windows\Start Menu\Programs
for /f "tokens=*" %%g in (items\start.txt) do copy "%programdata%\%programs%\%%g" "%appdata%\%programs%\Windows %%g"
for /f "tokens=*" %%g in (items\start.txt) do rd /s /q "%programdata%\%programs%\Windows %%g"
cd %appdata%\%programs%\Windows Powershell
del "Windows PowerShell (x86).lnk"
del "Windows PowerShell ISE (x86).lnk"
cd %appdata%\%programs%\Windows System
del "This PC.lnk"
del "Windows Administrative Tools.lnk"