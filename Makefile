#CC
compiler = pdflatex

# out 
output = GWslides

#Comp. flags
cflags = -output-directory=./build -8bit 

all:
	$(compiler) $(cflags) -jobname=$(output) main
	bibtex ./build/$(output)
	$(compiler) $(cflags) -jobname=$(output) main
	$(compiler) $(cflags) -jobname=$(output) main
