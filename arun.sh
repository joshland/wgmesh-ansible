#!/bin/bash

if [ -z "$1" ]; then
    echo "usage: $0 <target.yml> <inventory> [extra vars]"
    exit
fi
if [ -e '.vault.pwd' ]; then
    VAULTVARS='--vault-password-file .vault.pwd'
else
    VAULTVARS='--ask-vault-pass'
fi
TGT=$1
INV=$2
shift
shift
ansible-playbook --diff --extra-vars '@passwd.yml' ${VAULTVARS} ${TGT} -i ${INV} $*
