.PHONY: pdf
.PHONY: clean

TARGET = main
PROJECT = $(shell basename $(shell pwd))
BUILD_DIR = /tmp/$(PROJECT)-build

LATEXMK = latexmk
LATEXMK_OPTIONS = -bibtex -use-make -output-directory=build
LATEXMK_PDF_OPTIONS = -pdf -pdflatex="pdflatex -shell-escape -interaction=batchmode -halt-on-error"

RM = rm -rf
CP = cp
MKDIR = mkdir -p
SYMLINK = ln -s
VIEWER_PDF = evince

all: pdf

pdf: $(TARGET).pdf
	
$(TARGET).pdf: $(BUILD_DIR)/$(TARGET).pdf
	$(CP) $< $@
	
.PHONY: $(BUILD_DIR)/$(TARGET).pdf
$(BUILD_DIR)/$(TARGET).pdf: $(BUILD_DIR) build
	$(LATEXMK) $(LATEXMK_OPTIONS) $(LATEXMK_PDF_OPTIONS) $(TARGET).tex

$(BUILD_DIR):
	$(MKDIR) $(BUILD_DIR)

build:
	$(SYMLINK) $(BUILD_DIR) $@

clean:
	$(RM) $(BUILD_DIR)

view: pdf
	$(VIEWER_PDF) $(BUILD_DIR)/$(TARGET).pdf &
