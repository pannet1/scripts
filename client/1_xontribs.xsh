#!/bin/env xonsh

xontribs =  ['argcomplete', 'abbrevs', 'back2dir', 'broot', 'clp', 'debug-tools', 'distributed', 'cmd_done', 'gitinfo', 'gruvbox', 'hist_navigator', 'histcpy', 'kitty', 'mpl', 'onepath', 'output_search', 'powerline3', 'prompt_vi_mode', 'readable-traceback', 'sh', 'ssh_agent', 'up', 'xlsd','vox', 'z']
xonshes = ['autoxsh', 'autovox', 'vox_tabcomplete']

pip install onefetch pyperclip repassh --user --break-system-packages

for item in xontribs:
  item = "xontrib-"+item
  pip install @(item) --user --break-system-packages

for xs in xonshes:
  xs = "xonsh-"+xs
  pip install @(xs)  --user --break-system-packages


