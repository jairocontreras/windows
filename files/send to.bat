set sendto=%appdata%\Microsoft\Windows\SendTo
for /f "tokens=*" %%g in (items\sendto.txt) do del "%sendto%\%%g"
cd %sendto%
ren "Compressed (zipped) Folder.ZFSendToTarget" "Compressed folder.zfsendtotarget"
ren "Desktop (create shortcut).DeskLink" "Desktop.desklink"