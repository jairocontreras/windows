set sendto=%appdata%\Microsoft\Windows\SendTo
for /f "tokens=*" %%g in (items\sendto.txt) do del "%sendto%\%%g"
cd %sendto%
ren "compressed (zipped) folder.zfsendtotarget" "Compressed folder.zfsendtotarget"
ren "desktop (create shortcut).desklink" "Desktop.desklink"