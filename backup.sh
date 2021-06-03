#!/bin/sh

exec 1>>/dev/null
exec 2>>error.log
pushd $1 
temp_file=$(mktemp) 
tar -cf ${temp_file}  --$2 .
popd
openssl enc -in ${temp_file} -out $3 -e -aes256 -pbkdf2 -pass pass:1234
rm ${temp_file}

