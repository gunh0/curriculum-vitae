.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

# TO DO: split directory
MAIN_DIR = main
MAIN_CV_SRCS = $(shell find $(MAIN_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

ex-resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

ex-cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf : $(MAIN_DIR)/cv.tex $(MAIN_CV_SRCS)
	$(CC) -output-directory=$(MAIN_DIR) $<

ex-coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
