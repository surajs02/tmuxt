# tmuxt

tmuxt (tmux templates) is a simple script manager for tmux that provides options for 
managing scripts (e.g., add, edit, etc.) added to the tmuxt [templates](templates) directory.

Scripts are used as templates to create pre-defined tmux screens (e.g., panes, windows, etc.).

## Dependencies

- **bash** for tmuxt and associated files
- **tmux** for tmuxt's pre-defined [templates](templates)

tmuxt was created to manage scripts containing tmux commands but can be used to manage any bash scripts, however, the pre-defined [templates](templates) provided by tmuxt contain tmux commands that depend on on tmux.

## Install

Download and run the install file:
```bash
cd ~
git clone https://github.com/surajs02/tmuxt.git
cd tmuxt
. .install.sh
```

## Uninstall

tmuxt is portable so can easily be removed by removing its setup line from `~/.bashrc`:
```bash
# TODO johto Add command to remove tmuxt from .bashrc
```

## Usage

`tmuxt -dhlx | -a scriptPath | -derx scriptName]`

Show help:
```bash
tmuxt -h
```

Add script to templates:
```bash
tmuxt -a script.sh
```

List templates:
```bash
tmuxt -l
```

Set template as default:
```bash
tmuxt -d script
```

Show current default template:
```bash
tmuxt -d
```

Execute template:
```
tmuxt -x script
```

Execute default template:
```
tmuxt -x
```

Edit template:
```bash
tmuxt -e script
```

Remove template:
```bash
tmuxt -r script
```

## Future plans

- Replace `getopts` with custom options handling (e.g., optional option arguments)
- Add current directory autocomplete for add option (currently autocomplete lists template directory contents)