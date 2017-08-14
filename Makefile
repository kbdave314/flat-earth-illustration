TEX=latex
TEMPLATE=/home/k/Documents/typesetting/mystyle/mystyle.thtml

%.tikz.dvi : %.tikz.tex
	$(TEX) -shell-escape $< -o $@ 1>/dev/null
	rm $*.tikz.aux  $*.tikz.log
%.svg : %.tikz.dvi
	dvisvgm -n $< -o $@
	rm $<

# $(patsubst %.tikz.tex,%.svg,$(wildcard *.tikz.tex)) 
images :=  $(patsubst %.gnu,%.svg,$(wildcard *.gnu))

all: $(images)
clean:
	rm $(images)
