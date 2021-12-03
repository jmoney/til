#!/usr/bin/env bash

set -x 

usage() { echo "Usage: $0 -u github username [-i private key file] [-p public key file]" 1>&2; exit 1; }

validate_identify_key_file() {
    curl -s "https://github.com/$1.keys" | while read key; do
        echo "Validating private key with github public key"
        diff -q <(ssh-keygen -y -e -f $2) <(ssh-keygen -y -e -f /dev/stdin <<< ${key}) > /dev/null
        if [[ $? -eq 0 ]]; then
            echo "Matched ${key}"
        fi
    done
}

validate_public_key_file() {
    curl -s "https://github.com/$1.keys" | while read key; do
        echo "Validating private key with github public key"
        diff -q <(ssh-keygen -l -f $2) <(ssh-keygen -y -e -f /dev/stdin <<< ${key}) > /dev/null
        if [[ $? -eq 0 ]]; then
            echo "Matched ${key}"
        fi
    done
}

options=$(getopt -o u:)

while true; do
    echo $1
    case "$1" in
        -u )
            u=$2
            shift 2
            ;;
        i )
            i=$2
            shift 2
            ;;
        p )
            p=$2
            shift 2
            ;;
        h | * )
            usage
            ;;
        -- )
            shift
            break
            ;;
    esac
done

if [[ ! -z "${i}" ]]; then
    validate_identify_key_file $u $i
fi

if [[ ! -z "${p}" ]]; then
    validate_public_key_file $u $p
fi


# merge_training=false
# reset_database=false

# while getopts ":tr" opt; do
#   case "${opt}" in
#     t ) # process option t
#        echo "one"
#        merge_training=true
#        ;;
#     r ) # process option r
#        echo "two"
#        reset_database=true
#        ;;
#    esac
# done

# echo $reset_database
# echo $merge_training
