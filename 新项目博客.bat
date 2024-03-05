
   cd %~dp0
   hugo new content --kind  program posts/program.md
   start "" ".\content\posts"
   start "" ".\content\posts\program.md"
   cd ..
