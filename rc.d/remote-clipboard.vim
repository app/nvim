" check remote sission
if exists("$SSH_TTY")
" remote clipboard access
" xclip have to be installed and X11 forwarding in sshd_conf switched on
" don't forget -X key for ssh
  vmap "+y :!xclip -f -sel clip
  map "+p :r!xclip -o -sel clip
endif
