#! /bin/bash
export PATH=/usr/bin/convert:$PATH

cd /../imagens-livros

for imagem in $@
do
    convert $FOLDERPATH/$imagem.jpg $FOLDERPATH/convertido/$imagem.png
done