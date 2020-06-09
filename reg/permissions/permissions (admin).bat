cd %~dp0/items
for /f "tokens=*" %%g in (normal.txt) do setacl -on %%g -ot reg -actn setowner -ownr "n:administrators"
for /f "tokens=*" %%g in (normal.txt) do setacl -on %%g -ot reg -actn ace -ace "n:administrators;p:full"
for /f "tokens=*" %%g in (recursive.txt) do setacl -on %%g -ot reg -actn setowner -ownr "n:administrators" -rec yes
for /f "tokens=*" %%g in (recursive.txt) do setacl -on %%g -ot reg -actn ace -ace "n:administrators;p:full" -rec yes