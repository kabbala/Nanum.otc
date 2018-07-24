if [ ! -f NanumFontSetup_OTF_GOTHIC_hangeulcamp.exe ]; then
   curl -O http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_OTF_GOTHIC_hangeulcamp.exe
fi
7z x -y NanumFontSetup_OTF_GOTHIC_hangeulcamp.exe "\$WINDIR/Fonts/*.otf"
if [ ! -f NanumFontSetup_OTF_MYUNGJO_hangeulcamp.exe ]; then
   curl -O http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_OTF_MYUNGJO_hangeulcamp.exe
fi
7z x -y NanumFontSetup_OTF_MYUNGJO_hangeulcamp.exe "\$WINDIR/Fonts/*.otf"
if [ ! -f NanumFontSetup_OTF_SONGEULSSI_hangeulcamp.exe ]; then
   curl -O http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_OTF_SONGEULSSI_hangeulcamp.exe
fi
7z x -y NanumFontSetup_OTF_SONGEULSSI_hangeulcamp.exe "\$WINDIR/Fonts/*.otf"
if [ ! -f NanumFontSetup_OTF_BARUNGOTHIC_hangeulcamp.exe ]; then
   curl -O http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_OTF_BARUNGOTHIC_hangeulcamp.exe
fi
7z x -y NanumFontSetup_OTF_BARUNGOTHIC_hangeulcamp.exe "\$WINDIR/Fonts/*.otf"
if [ ! -f NanumFontSetup_OTF_SQUARE_hangeulcamp.exe ]; then
   curl -O http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_OTF_SQUARE_hangeulcamp.exe
fi
7z x -y NanumFontSetup_OTF_SQUARE_hangeulcamp.exe "\$WINDIR/Fonts/*.otf"
if [ ! -f NanumFontSetup_OTF_SQUARE_ROUND_hangeulcamp.exe ]; then
   curl -O http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_OTF_SQUARE_ROUND_hangeulcamp.exe
fi
7z x -y NanumFontSetup_OTF_SQUARE_ROUND_hangeulcamp.exe "\$WINDIR/Fonts/*.otf"
if [ ! -f NanumFontSetup_OTF_BARUNPEN_hangeulcamp.exe ]; then
   curl -O http://appdown.naver.com/naver/font/NanumFont/setup/NanumFontSetup_OTF_BARUNPEN_hangeulcamp.exe
fi
7z x -y -o. NanumFontSetup_OTF_BARUNPEN_hangeulcamp.exe "\$WINDIR/Fonts/*.otf"
filename="$(ls \$WINDIR/Fonts/*.otf)"
filename_otf_removed=""
for a in $filename
do
    c="${a%%.*}_otf_removed"
    ttx $a
    sed 's/OTF//' ${a%%.*}.ttx>${c}.ttx
    ttx ${c}.ttx
    filename_otf_removed="$filename_otf_removed ${c}.otf"
    rm ${a%%.*}.ttx
    rm ${c}.ttx
    rm $a
done
otf2otc -o Nanum.otc $filename_otf_removed
rm -rf "\$WINDIR"