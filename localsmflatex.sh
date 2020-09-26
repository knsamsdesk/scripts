#!/bin/bash
#
# CAVEAT EMPTOR
# 
# By using this script, you accept any and all responsibility for the damages
# you incur.
#
# 
# Assuming that you have a working TeXLive installation,
# this script installs the package smflatex only for you.
# The script connects to the internet to download the necessary files.

localdir=$(kpsewhich -var-value TEXMFHOME) 

if [[ ! -d $localdir ]]; then
    mkdir -p $localdir;
fi

cd $localdir;

wget http://mirrors.ctan.org/macros/latex/contrib/smflatex.zip -O \
     smflatex.zip;

unzip smflatex.zip;

rm smflatex.zip;

cd ./smflatex/;

latex smflatex.ins;

cd ..;

if [[ ! -d ./tex/latex/smflatex ]]; then
    mkdir -p ./tex/latex/smflatex/;
    mv ./smflatex/*.cls ./smflatex/*.sty ./tex/latex/smflatex/;
fi

if [[ ! -d ./bibtex/bst/smflatex ]]; then
    mkdir -p ./bibtex/bst/smflatex/;
    mv ./smflatex/*.bst ./bibtex/bst/smflatex/;
fi


if [[ ! -d ./doc/latex/smflatex ]]; then
    mkdir -p ./doc/latex/smflatex/;
    mv ./smflatex/*.tex ./smflatex/*.pdf ./doc/latex/smflatex/;
fi
   
rm -r ./smflatex/;

echo 
echo "SMFLaTeX has been added to TEXMFHOME!"
echo "Good luck TeXing and good bye!"







