# advanced-bash-automation

My notes from [advanced-bash-automation](https://egghead.io/courses/advanced-bash-automation-for-web-developers).

1. shell parameter expansions

## Bash keyboard shortcuts

- `ctrl + a` - go to beginning of line
- `ctrl + e` - go to end of line
- `ctrl + l` - similar to running `clear` command
- `ctrl + k` - clear entire line upto the cursor
- `ctrl + w` - delete the last word

## Node

You can get data from a Node.js script using the `p` flag. Furthermore, you don't need to `require` a core
node module.

e.g. `node -p 'querystring.parse(process.argv[1])' time=1900` returns `[Object: null prototype] { time: '1900' }`
