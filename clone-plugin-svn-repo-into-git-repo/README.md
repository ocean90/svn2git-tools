#Clone your WordPress plugin SVN repo into a Git repo

```
# Create an empty dir
$ mkdir public-post-preview

# Get revision number
$ svn log -r 1:HEAD --limit 1 http://plugins.svn.wordpress.org/public-post-preview

# Clone it
$ git svn clone -t tags -b branches -T trunk -r93485 --no-minimize-url --no-metadata http://plugins.svn.wordpress.org/public-post-preview public-post-preview

# Get commits and files, can take hours...
$ cd public-post-preview/
$ GIT_TRACE=2 git svn fetch 

# Clean up, build the git log
$ git svn rebase 

# Add GitHub remote as origin
$ git remote add origin git@github.com:ocean90/public-post-preview.git

# Push it
$ git push origin master 

# Tags
$ git tag -f "0.1" e1e6fe356d45c975902621cbba58255b8751420a
$ git push --tags
```