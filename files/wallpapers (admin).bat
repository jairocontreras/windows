set web=%windir%\Web
setacl -on %web% -ot file -actn setowner -ownr "n:administrators" -rec yes
setacl -on %web% -ot file -actn ace -ace "n:administrators;p:full" -rec yes
for /f "tokens=*" %%g in (items\wallpapers.txt) do rd /s /q %web%\%%g