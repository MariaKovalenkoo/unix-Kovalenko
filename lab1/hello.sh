#!/bin/bash -e

file=$1
temp=$(mktemp -d)

if [ -z "$file" ]; then
  echo "write: $0 filename"
  exit 1
fi

outputstring="$(grep -i "Output:" "$file")"
outputfullstring=${outputstring#//Output:}
output=$(echo "$outputfullstring"| tr -d '[:space:]/')

if [ -z "$output" ]; then
  echo "Name for file is empty"
  exit 1
fi

fun_delete(){
echo "Temporary directory was deleted"
rm -rf $temp
}

trap fun_delete EXIT HUP INT QUIT PIPE TERM\

cp "$file" "$temp"/
directory=$(pwd)
cd "$temp"

g++ "$file" -o "$output"

mv "$output" "$directory"
cd "$directory"
./$output
echo "Successfully compiled: $output"
exit 0
