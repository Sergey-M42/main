#!/bin/bash
unction createsshuser()
{
  USER="$1"
  shift 
  SSH_PUBLIC_KEY="$*"
  adduser ${USER} --gecos "" --disabled-password
  usermod -a -G sudo ${USER}
  usermod -a -G sshusers ${USER}
  usermod -a -G sshers ${USER}
  echo "${USER} ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers.d/${USER}
  su - ${USER} -c "umask 022 ; mkdir .ssh ; echo $SSH_PUBLIC_KEY >> .ssh/authorized_keys"
}