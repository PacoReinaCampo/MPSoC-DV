###################################################################################
##                                            __ _      _     _                  ##
##                                           / _(_)    | |   | |                 ##
##                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |                 ##
##               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |                 ##
##              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |                 ##
##               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|                 ##
##                  | |                                                          ##
##                  |_|                                                          ##
##                                                                               ##
##                                                                               ##
##              Open Source VHDL Verification Methodology                        ##
##              QueenField                                                       ##
##                                                                               ##
###################################################################################

###################################################################################
##                                                                               ##
## Copyright (c) 2022-2023 by the author(s)                                      ##
##                                                                               ##
## Permission is hereby granted, free of charge, to any person obtaining a copy  ##
## of this software and associated documentation files (the "Software"), to deal ##
## in the Software without restriction, including without limitation the rights  ##
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     ##
## copies of the Software, and to permit persons to whom the Software is         ##
## furnished to do so, subject to the following conditions:                      ##
##                                                                               ##
## The above copyright notice and this permission notice shall be included in    ##
## all copies or substantial portions of the Software.                           ##
##                                                                               ##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    ##
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      ##
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   ##
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        ##
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, ##
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     ##
## THE SOFTWARE.                                                                 ##
##                                                                               ##
## ============================================================================= ##
## Author(s):                                                                    ##
##   Paco Reina Campo <pacoreinacampo@queenfield.tech>                           ##
##                                                                               ##
###################################################################################

SOURCE_DOCS := $(wildcard *.md)
SOURCE_DOCS := $(filter-out metadata.md, $(SOURCE_DOCS))

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.pdf)  \
 $(SOURCE_DOCS:.md=.docx) \
 $(SOURCE_DOCS:.md=.odt)  \
 $(SOURCE_DOCS:.md=.epub)

PANDOC_OPTIONS=-f markdown       \
    --table-of-contents          \
    --number-sections            \
    --pdf-engine=xelatex         \
    -V lof=yes                   \
    -V lot=yes                   \
    -V fontsize="10pt"           \
    -V documentclass=report      \
    -V papersize=A4              \
    -V linestretch='1'           \
    -V geometry:margin=2cm       \
    -V links-as-notes=true       \
    --metadata-file=metadata.md

PANDOC_PDF_OPTIONS=
PANDOC_DOCX_OPTIONS=
PANDOC_ODT_OPTIONS=
PANDOC_EPUB_OPTIONS=--to epub3

# Pattern-Matching Rules

%.pdf : %.md
	pandoc -s $(shell cat $<) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $@

%.docx : %.md
	pandoc -s $(shell cat $<) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $@

%.odt : %.md
	pandoc -s $(shell cat $<) $(PANDOC_OPTIONS) $(PANDOC_ODT_OPTIONS) -o $@

%.epub : %.md
	pandoc -s $(shell cat $<) $(PANDOC_OPTIONS) $(PANDOC_EPUB_OPTIONS) -o $@

all : $(EXPORTED_DOCS)

clean:
	-rm -f $(EXPORTED_DOCS)

.PHONY: clean
