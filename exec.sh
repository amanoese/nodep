#!/usr/bin/env bash

n_script=$(mktemp)
stdin=$(mktemp)

readFile="require('fs').readFileSync '/dev/stdin','UTF-8' @ "

if [ -p /dev/stdin ];then
  cat - > ${stdin}
fi

echo "${readFile}" "${*}" '@ console.log' |\
sed 's/.*/ & /' |\
sed -r ':l s/([^@]+)@([^@]+)/\2$\1/; /@/bl' |\
tr '$' '\n' |\
awk 'END{system("echo \\)|shuf -rn" NR "| xargs")}$1=$1" ( "' |\
cat > ${n_script}

cat ${stdin} | node ${n_script}
