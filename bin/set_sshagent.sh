#!/bin/bash
xset -b
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa
SSHVARS="SSH_AGENT_PID SSH_AUTH_SOCK"
for x in ${SSHVARS} ; do
    (eval echo $x=\$$x) | sed  's/=/="/
                                s/$/"/
                                s/^/export /'
done 1>$HOME/.ssh/fixagent 
