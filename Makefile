#CC
compiler = pdflatex

# out 
output = GWslides

#Comp. flags
cflags = -output-directory=./build -8bit 

all:
	$(compiler) $(cflags) -jobname=$(output) slides
	bibtex ./build/$(output)
	$(compiler) $(cflags) -jobname=$(output) slides
	$(compiler) $(cflags) -jobname=$(output) slides
