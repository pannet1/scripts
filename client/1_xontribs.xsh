#!/bin/xonsh

xontribs =  ['argcomplete', 'abbrevs', 'avox', 'back2dir', 'broot', 'distributed', 'cmd_done', 'gitinfo', 'hist_navigator', 'histcpy', 'kitty', 'mpl', 'onepath', 'output_search', 'powerline3', 'prompt_vi_mode', 'readable-traceback', 'sh', 'ssh_agent', 'up', 'xlsd','vox', 'z']
xonshes = ['autoxsh', 'autovox', 'vox_tabcomplete']

xpip install pyperclip repassh

for item in xontribs:
  item = "xontrib-"+item
  xpip install @(item)

for xs in new_items:
  xs = "xonsh-"+xs
  pip install @(xs)


