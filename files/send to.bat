set sendto=%appdata%\Microsoft\Windows\SendTo
ren "%sendto%\Compressed (zipped) Folder.ZFSendToTarget" "Compressed folder.zfsendtotarget"
ren "%sendto%\Desktop (create shortcut).DeskLink" "Desktop.desklink"
for /f "tokens=*" %%g in (items\sendto.txt) do del "%sendto%\%%g"