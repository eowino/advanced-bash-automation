# exec makes sense in this scenario, because the script won't be executed directly by our user
# It'll be executed by Git. If we're using a Git UI client, we may have different environment variables, which can lead to unusual errors. 
# We may not have easy access to view its output. 
# It can be helpful to send it to a .log file to debug it, or just make sure it's working

# append standard out to log/hooks-out.log
exec >> log/hooks-out.log

# send standard error to the same .log file
exec >> log/hooks-out.log 2>&1

# check if package.json has changed
# git diff-tree command compares two subtrees of Git. The previous commit to the current commit 
# return just a bare list of files that have changed between the two commits, or between the two working trees
if git diff-tree --name-only --no-commit-id ORIG_HEAD HEAD | grep --quiet 'package.json'; then
 echo "$(date): Running npm install because package.json changed"
 # redirect standard out to dev/null i.e. discard any of the output.
 npm install >  /dev/null
else
 echo "$(date): No changes in package.json found"
fi