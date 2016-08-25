#!/bin/env bash

_ansible-vault() {
    local current_word=${COMP_WORDS[COMP_CWORD]}
    local previous_word=${COMP_WORDS[COMP_CWORD - 1]}
    local options="create decrypt edit encrypt rekey view"

    case $previous_word in
        create|decrypt|edit|encrypt|rekey|view)
            options="--ask-vault-pass --help --new-vault-password-file --output --vault-password-file --verbose --version -h -v"
            if [[ "$current_word" == -* ]]; then
                COMPREPLY=( $( compgen -W "$options" -- "$current_word" ) )
            fi
            ;;
        *)
            COMPREPLY=( $( compgen -fdW "$options" -- "$current_word" ) )
            ;;
    esac
}

complete -o default -F _ansible-vault ansible-vault
