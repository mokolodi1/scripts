#/bin/bash

if [ -z "$1" ]; then
    echo "please specify file as first arg"
    exit 1
else
    echo "file to replace contents of" $1
fi

if [ -z "$2" ]; then
    echo "please specify headerline file as second arg"
    exit 1
else
    echo "headerline will be replaced with contents of" $2
fi

headerline=$(cat $2)

read -p "Do you want a backup of the file just in case? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Nn]$ ]]
then
    sed -i "" "1s/.*/$headerline/" $1
else
    echo "this part is untested"
    sed -i.bu "" "1s/.*/$headerline/" $1
fi




