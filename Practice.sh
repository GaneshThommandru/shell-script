#/bin/bash

while IFS= read -r line
do 
    echo "$line"
done <<< $(find /tmp/shellscript-logs -type f)