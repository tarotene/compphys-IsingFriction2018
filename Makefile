# 分割コンパイル

FC=gfortran
FCFLAGS=-O2

.SUFFIXES: .f90

TARGET=./bin/fSpinMC
SRCDIR=./src
SRCS=$(wildcard $(SRCDIR)/*.f90)
LIBDIR=./lib
LIBS=$(wildcard $(LIBDIR)/*.f90)
OBJDIR=./obj
OBJS=$(addprefix $(OBJDIR)/, $(notdir $(SRCS:.f90=.o)))
LIBOBJS=$(addprefix $(OBJDIR)/, $(notdir $(LIBS:.f90=.o)))
MODDIR=./mod

$(TARGET): $(OBJS) $(LIBOBJS)
	$(FC) $(FCFLAGS) $^ -o $@

$(OBJDIR)/%.o: $(LIBDIR)/%.f90
	$(FC) $(FCFLAGS) -c $< -o $@ -J$(MODDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.f90 $(LIBOBJS)
	$(FC) $(FCFLAGS) -c $< -o $@ -I$(MODDIR)

$(MODDIR)/%.mod: $(LIBDIR)/%.f90 $(OBJDIR)/%.o
	@:

.PHONY: all clean

all: clean $(TARGET)

clean:
	rm -f $(OBJDIR)/* $(MODDIR)/* $(TARGET)