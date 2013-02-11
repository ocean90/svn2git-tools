#Clone your WordPress plugin SVN repo into a Git repo

Replace `plugin_slug` with the slug of your plugin.


### Get revision number
	$ svn log -r 1:HEAD --limit 1 http://plugins.svn.wordpress.org/plugin_slug
Copy the revision number (*rXXXXXXX*).

### Clone it
	$ git svn clone -t tags -b branches -T trunk -rev_num --no-minimize-url --no-metadata http://plugins.svn.wordpress.org/plugin_slug plugin_slug
Replace `rev_num` with the revision number from the previous step. Don't miss `-r` before the number.

### Get commits and files
	$ cd plugin_slug/
	$ GIT_TRACE=2 git svn fetch
This step can take hours. `GIT_TRACE=2` returns verbose output.

### Clean up, build the Git log
	$ git svn rebase 

### Add GitHub remote as origin
	$ git remote add origin git@github.com:user_name/plugin_slug.git
Replace `user_name` with your GitHub username.

### Push it
	$ git push origin master 

### Tags (optional)
	$ git tag -f "0.1" e1e6fe
	$ git push --tags
