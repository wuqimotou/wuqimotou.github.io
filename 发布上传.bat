@echo on

   cd %~dp0
   hugo -F --cleanDestinationDir
   git status
   git add -A
   git commit -m "�ű����²���"
   git push -u MotouHut main
   cd ..

 pause