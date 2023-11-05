# The files here will be activated when the `FileType` changes and it will match the file type.
e.g. `go.lua` will be executed all the time a file `.go` is opened.

It's just more organized than autocmds for FileType.

Just make sure to use the local (or buffer) options if you change any config. Like:
```local opt = vim.opt_local```
instead of
``` local opt = vim.opt```
