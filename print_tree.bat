if exist tree.txt del tree.txt
tree %1 /a > tree.tmp
for /f "skip=2 tokens=* usebackq" %%i in (tree.tmp) do @echo %%i >> tree.txt
if exist tree.tmp del tree.tmp
