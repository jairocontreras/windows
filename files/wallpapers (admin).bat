set web=%windir%\Web
setacl -on %web% -ot file -actn setowner -ownr "n:administrators" -rec yes
setacl -on %web% -ot file -actn ace -ace "n:administrators;p:full" -rec yes
rd /s /q %web%\Screen
rd /s /q %web%\Wallpaper