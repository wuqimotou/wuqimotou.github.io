
   cd %~dp0
   hugo new content --kind  essays posts/essay.md
   start "" ".\content\posts"
   start "" ".\content\posts\essay.md"
   cd ..
