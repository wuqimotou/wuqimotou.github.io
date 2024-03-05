   cd %~dp0
   hugo new content --kind  findjobs posts/findjobs.md
   start "" ".\content\posts"
   start "" ".\content\posts\findjobs.md"
   cd ..