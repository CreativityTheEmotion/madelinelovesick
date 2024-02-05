#!/bin/bash
if [ ! -d ./temp ]; then 
  mkdir ./temp
fi
if [ ! -d ./out ]; then 
  mkdir ./out
fi
if [ ! -d ./out/pages ]; then 
  mkdir ./out/pages
fi
latex -output-directory=./temp ./in/document_chrono.tex
dvipdfm -p b5 -o ./out/document_chrono.pdf ./temp/document_chrono.dvi
latex -output-directory=./temp ./in/document_struct.tex
dvipdfm -p b5 -o ./out/document_struct.pdf ./temp/document_struct.dvi
lastPageNumber=$(grep "Output written on" ./temp/document_chrono.log | grep -oP "\d+" | sed -n '1 p')
pdftoppm -f $lastPageNumber -l $lastPageNumber -png ./out/document_chrono.pdf ./out/pages/page
