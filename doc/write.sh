rm -f *.pdf
rm -f *.tex

pandoc BOOK.md -s -o MPSoC-DV.pdf
pandoc BOOK.md -s -o MPSoC-DV.tex
