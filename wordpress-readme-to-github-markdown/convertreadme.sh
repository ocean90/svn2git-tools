#!/bin/bash

CURRENTDIR=`pwd`
READMETXT="$CURRENTDIR/readme.txt"
READMEMD="$CURRENTDIR/README.md"

echo "Starting..."

if [ ! -f "$READMETXT" ]
	then
		echo "readme.txt doesn't exists!"
		exit 1
fi

echo -n "Creating README.md..."
cp -f $READMETXT $READMEMD
echo "Done."

_sed() {
	sed "$1" $READMEMD > $READMEMD.tmp && mv $READMEMD.tmp $READMEMD
}

echo -n "Formating plugin meta..."
PLUGINMETA=("Contributors" "Donate link" "Tags" "Requires at least" "Tested up to" "Stable tag" "License" "License URI")
for m in "${PLUGINMETA[@]}"
do
	_sed 's/^'"$m"':/**'"$m"':**/g'
done
echo "Done."

echo -n "Formating headings..."
_sed 's/ =*$//g' # Remove trailing =
_sed 's/^=\{3\}/#/g'
_sed 's/^=\{2\}/##/g'
_sed 's/^=\{1\}/####/g'
echo "Done."

echo -n "Formating links..."
_sed "s/ \(http[s]*:\/\/[^ ]*\)/ <\1>/g"
echo "Done."

echo -n "Formating newlines..."
sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/  \'$'\n/g' $READMEMD > $READMEMD.tmp && mv $READMEMD.tmp $READMEMD
echo "Done."

echo "Finished!"
