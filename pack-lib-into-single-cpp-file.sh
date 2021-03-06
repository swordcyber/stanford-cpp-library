#!/bin/bash
if [ $# -le 0 ]; then
	echo "Usage: $0 DIRECTORY"
	echo "e.g. : $0 empty-project"
	exit 1
fi

INDIR="StanfordCPPLib"
OUTDIR="$1/lib/StanfordCPPLib"
OUTFILE="spl.cpp"
echo "Merging library .cpp source into $OUTDIR/$OUTFILE ..."
FILES=`cd $INDIR/ && find . -name "*.cpp"`
echo '' > $OUTDIR/$OUTFILE
for file in $FILES; do
	# echo $file
	cat $INDIR/$file >> $OUTDIR/$OUTFILE
	if [ -e $OUTDIR/$file ]; then
		rm $OUTDIR/$file
	fi
done
# echo "Done."
