#!/usr/bin/env bash

usage() { echo "Usage: $0 -u github username [-i private key file] [-p public key file]" 1>&2; exit 1; }

validate_identify_key_file() {
    curl -s "https://github.com/$1.keys" | while read key; do
        # echo "Validating local private key \"$2\" with github public key"
        diff -q <(ssh-keygen -y -e -f $2) <(ssh-keygen -y -e -f /dev/stdin <<< ${key}) > /dev/null
        if [[ $? -eq 0 ]]; then
            echo "Matched ${key}"
            return 0
        fi

        return 1
    done
}

validate_public_key_file() {
    curl -s "https://github.com/$1.keys" | while read key; do
        # echo "Validating local public key \"$2\" with github public key"
        diff -q <(ssh-keygen -l -f $2) <(ssh-keygen -y -e -f /dev/stdin <<< ${key}) > /dev/null
        if [[ $? -eq 0 ]]; then
            echo "Matched ${key}"
            return 0
        fi

        return 1
    done
}

while getopts "u:i:p:" arg; do
    case "$arg" in
        u )
            u=$OPTARG
            ;;
        i )
            i=$OPTARG
            ;;
        p )
            p=$OPTARG
            ;;
        h | * )
            usage
            ;;
    esac
done

if [[ ! -z "${i}" ]]; then
    validate_identify_key_file $u $i
    if [[ $? -eq 1 ]]; then
        echo "No private key match with github for $u"
    fi
fi

if [[ ! -z "${p}" ]]; then
    validate_public_key_file $u $p
    if [[ $? -eq 1 ]]; then
        echo "No public key match with github for $u"
    fi
fi