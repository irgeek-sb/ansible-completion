#!/bin/env bash

_ansible-playbook() {
    local current_word=${COMP_WORDS[COMP_CWORD]}
    local options="--ask-become-pass --ask-pass --ask-su-pass
                   --ask-sudo-pass --ask-vault-pass --become
                   --become-method --become-user --check --connection
                   --diff --extra-vars --flush-cache --force-handlers
                   --forks --help --inventory-file --key-file
                   --limit --list-hosts --list-tags --list-tasks
                   --module-path --new-vault-password-file --output
                   --private-key --scp-extra-args --sftp-extra-args
                   --skip-tags --ssh-common-args --ssh-extra-args
                   --start-at-task --step --su --su-user --sudo
                   --sudo-user --syntax-check --tags --timeout --user
                   --vault-password-file --verbose --version -b -c -e
                   -f -h -i -k -l -s -t -u -v"

    if [[ "$current_word" == -* ]]; then
        COMPREPLY=( $( compgen -W "$options" -- "$current_word" ) )
    fi
}

complete -o default -F _ansible-playbook ansible-playbook
