#CC
compiler = pdflatex

# out 
output = GWtalk

#Comp. flags
cflags = -output-directory=./build -8bit 

all:
	$(compiler) $(cflags) -jobname=$(output) talk
	bibtex ./build/$(output)
	$(compiler) $(cflags) -jobname=$(output) talk
	$(compiler) $(cflags) -jobname=$(output) talk
