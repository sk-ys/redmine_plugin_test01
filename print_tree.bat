if exist tree.txt del tree.txt
for /f "usebackq skip=3 tokens=* delims=" %%i in (`tree /a`) do @echo %%i >> tree.txt