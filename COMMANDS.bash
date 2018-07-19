if [ ! -f NanumFont_OTF_ALL.zip ]; then
   curl -O http://cdn.naver.com/naver/NanumFont/fontfiles/NanumFont_OTF_ALL.zip
fi
unzip NanumFont_OTF_ALL.zip
f="$(unzip -Z1 NanumFont_OTF_ALL.zip)"
b=""
for a in $f
do
   ttx $a
   c="${a%%.*}_otf_removed"
   sed 's/OTF//' ${a%%.*}.ttx>${c}.ttx
   ttx ${c}.ttx
   b="$b ${c}.otf"
   rm ${a%%.*}.ttx
   rm ${c}.ttx
   rm $a
done
otf2otc -o Nanum.otc $b
rm $b