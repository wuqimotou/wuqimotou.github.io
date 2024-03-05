@echo on

   cd %~dp0
   hugo -F --cleanDestinationDir
   git status
   git add -A
   git commit -m "脚本更新博客"
   git push MotouHut main
   cd ..

 pause