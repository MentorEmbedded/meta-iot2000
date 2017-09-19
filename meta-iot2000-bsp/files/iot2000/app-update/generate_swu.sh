CONTAINER_VER="1.0"
PRODUCT_NAME="app-update"

FILES="sw-description install-ipk.sh stress_*.ipk.enc"

SWU_FILE=$PWD/${PRODUCT_NAME}_${CONTAINER_VER}.swu

rm -f $SWU_FILE
TMPDIR=$(mktemp -d)

for i in $FILES
do
    i=$(readlink -f $i)
    j=$(basename $i)
    NEW_FILES="$NEW_FILES $j"
    cp $i $TMPDIR/
done
 
pushd $TMPDIR
for i in $NEW_FILES
do
    echo $i
done | cpio -ov -H crc >$SWU_FILE
popd
rm -rf $TMPDIR
