# -*- makefile -*-
#
# Makefile for building NASM using Microsoft Visual C++ and NMAKE.
# Tested on Microsoft Visual C++ 2005 Express Edition.
#
# Make sure to put the appropriate directories in your PATH, in
# the case of MSVC++ 2005, they are ...\VC\bin and ...\Common7\IDE.
#
# This is typically done by opening the Visual Studio Command Prompt.
#

top_srcdir	= .
srcdir		= .
objdir          = .
VPATH		= .
prefix		= "C:\Program Files\NASM"
exec_prefix	= $(prefix)
bindir		= $(prefix)/bin
mandir		= $(prefix)/man

!IF "$(DEBUG)" == "1"
CFLAGS		= /Od /Zi
LDFLAGS		= /DEBUG
!ELSE
CFLAGS		= /O2 /Zi
LDFLAGS		= /DEBUG /OPT:REF /OPT:ICF # (latter two undoes /DEBUG harm)
!ENDIF

CC		= cl
AR		= lib
CFLAGS		= $(CFLAGS) /W2
BUILD_CFLAGS	= $(CFLAGS)
INTERNAL_CFLAGS = /I$(srcdir) /I. \
		  /I$(srcdir)/include /I./include \
		  /I$(srcdir)/x86 /I./x86 \
		  /I$(srcdir)/asm /I./asm \
		  /I$(srcdir)/disasm /I./disasm \
		  /I$(srcdir)/output /I./output
ALL_CFLAGS	= $(BUILD_CFLAGS) $(INTERNAL_CFLAGS)
LDFLAGS		= /link $(LINKFLAGS) /SUBSYSTEM:CONSOLE /RELEASE
LIBS		=

PERL		= perl
PERLFLAGS	= -I$(srcdir)/perllib -I$(srcdir)
RUNPERL         = $(PERL) $(PERLFLAGS)

MAKENSIS        = makensis

RM_F		= del /f
LN_S		= copy

# Binary suffixes
O               = obj
A		= lib
X               = .exe
.SUFFIXES: .c .i .s .$(O) .$(A) .exe .1 .man

.c.obj:
	$(CC) /c $(ALL_CFLAGS) /Fo$@ $<

# This rule is only used for rdoff
.obj.exe:
	$(CC) $(ALL_CFLAGS) /Fe$@ $< $(LDFLAGS) $(RDFLIB) $(NASMLIB) $(LIBS)

#-- Begin File Lists --#
# Edit in Makefile.in, not here!
NASM =	asm\nasm.$(O)
NDISASM = disasm\ndisasm.$(O)

LIBOBJ = stdlib\snprintf.$(O) stdlib\vsnprintf.$(O) stdlib\strlcpy.$(O) \
	stdlib\strnlen.$(O) \
	nasmlib\ver.$(O) \
	nasmlib\crc64.$(O) nasmlib\malloc.$(O) \
	nasmlib\md5c.$(O) nasmlib\string.$(O) \
	nasmlib\file.$(O) nasmlib\mmap.$(O) nasmlib\ilog2.$(O) \
	nasmlib\realpath.$(O) nasmlib\path.$(O) \
	nasmlib\filename.$(O) nasmlib\srcfile.$(O) \
	nasmlib\zerobuf.$(O) nasmlib\readnum.$(O) nasmlib\bsi.$(O) \
	nasmlib\rbtree.$(O) nasmlib\hashtbl.$(O) \
	nasmlib\raa.$(O) nasmlib\saa.$(O) \
	nasmlib\strlist.$(O) \
	nasmlib\perfhash.$(O) nasmlib\badenum.$(O) \
	common\common.$(O) \
	x86\insnsa.$(O) x86\insnsb.$(O) x86\insnsd.$(O) x86\insnsn.$(O) \
	x86\regs.$(O) x86\regvals.$(O) x86\regflags.$(O) x86\regdis.$(O) \
	x86\disp8.$(O) x86\iflag.$(O) \
	\
	asm\error.$(O) \
	asm\float.$(O) \
	asm\directiv.$(O) asm\directbl.$(O) \
	asm\pragma.$(O) \
	asm\assemble.$(O) asm\labels.$(O) asm\parser.$(O) \
	asm\preproc.$(O) asm\quote.$(O) asm\pptok.$(O) \
	asm\listing.$(O) asm\eval.$(O) asm\exprlib.$(O) asm\exprdump.$(O) \
	asm\stdscan.$(O) \
	asm\strfunc.$(O) asm\tokhash.$(O) \
	asm\segalloc.$(O) \
	asm\preproc-nop.$(O) \
	asm\rdstrnum.$(O) \
	\
	macros\macros.$(O) \
	\
	output\outform.$(O) output\outlib.$(O) output\legacy.$(O) \
	output\strtbl.$(O) \
	output\nulldbg.$(O) output\nullout.$(O) \
	output\outbin.$(O) output\outaout.$(O) output\outcoff.$(O) \
	output\outelf.$(O) \
	output\outobj.$(O) output\outas86.$(O) output\outrdf2.$(O) \
	output\outdbg.$(O) output\outieee.$(O) output\outmacho.$(O) \
	output\codeview.$(O) \
	\
	disasm\disasm.$(O) disasm\sync.$(O)

SUBDIRS  = stdlib nasmlib output asm disasm x86 common macros
XSUBDIRS = test doc nsis rdoff
#-- End File Lists --#

NASMLIB = libnasm.$(A)

all: nasm$(X) ndisasm$(X) rdf

nasm$(X): $(NASM) $(NASMLIB)
	$(CC) /Fe$@ $(NASM) $(LDFLAGS) $(NASMLIB) $(LIBS)

ndisasm$(X): $(NDISASM) $(NASMLIB)
	$(CC) /Fe$@ $(NDISASM) $(LDFLAGS) $(NASMLIB) $(LIBS)

$(NASMLIB): $(LIBOBJ)
	$(AR) $(ARFLAGS) /OUT:$@ $**

#-- Begin Generated File Rules --#
# Edit in Makefile.in, not here!

# These source files are automagically generated from data files using
# Perl scripts. They're distributed, though, so it isn't necessary to
# have Perl just to recompile NASM from the distribution.

# Perl-generated source files
PERLREQ = x86\insnsb.c x86\insnsa.c x86\insnsd.c x86\insnsi.h x86\insnsn.c \
	  x86\regs.c x86\regs.h x86\regflags.c x86\regdis.c x86\regdis.h \
	  x86\regvals.c asm\tokhash.c asm\tokens.h asm\pptok.h asm\pptok.c \
	  x86\iflag.c x86\iflaggen.h \
	  macros\macros.c \
	  asm\pptok.ph asm\directbl.c asm\directiv.h \
	  version.h version.mac version.mak nsis\version.nsh

INSDEP = x86\insns.dat x86\insns.pl x86\insns-iflags.ph

x86\iflag.c: $(INSDEP)
	$(RUNPERL) $(srcdir)\x86\insns.pl -fc \
		$(srcdir)\x86\insns.dat x86\iflag.c
x86\iflaggen.h: $(INSDEP)
	$(RUNPERL) $(srcdir)\x86\insns.pl -fh \
		$(srcdir)\x86\insns.dat x86\iflaggen.h
x86\insnsb.c: $(INSDEP)
	$(RUNPERL) $(srcdir)\x86\insns.pl -b \
		$(srcdir)\x86\insns.dat x86\insnsb.c
x86\insnsa.c: $(INSDEP)
	$(RUNPERL) $(srcdir)\x86\insns.pl -a \
		$(srcdir)\x86\insns.dat x86\insnsa.c
x86\insnsd.c: $(INSDEP)
	$(RUNPERL) $(srcdir)\x86\insns.pl -d \
		$(srcdir)\x86\insns.dat x86\insnsd.c
x86\insnsi.h: $(INSDEP)
	$(RUNPERL) $(srcdir)\x86\insns.pl -i \
		$(srcdir)\x86\insns.dat x86\insnsi.h
x86\insnsn.c: $(INSDEP)
	$(RUNPERL) $(srcdir)\x86\insns.pl -n \
		$(srcdir)\x86\insns.dat x86\insnsn.c

# These files contains all the standard macros that are derived from
# the version number.
version.h: version version.pl
	$(RUNPERL) $(srcdir)\version.pl h < $(srcdir)\version > version.h
version.mac: version version.pl
	$(RUNPERL) $(srcdir)\version.pl mac < $(srcdir)\version > version.mac
version.sed: version version.pl
	$(RUNPERL) $(srcdir)\version.pl sed < $(srcdir)\version > version.sed
version.mak: version version.pl
	$(RUNPERL) $(srcdir)\version.pl make < $(srcdir)\version > version.mak
nsis\version.nsh: version version.pl
	$(RUNPERL) $(srcdir)\version.pl nsis < $(srcdir)\version > nsis\version.nsh

# This source file is generated from the standard macros file
# `standard.mac' by another Perl script. Again, it's part of the
# standard distribution.
macros\macros.c: macros\macros.pl asm\pptok.ph version.mac \
	$(srcdir)\macros\*.mac $(srcdir)\output\*.mac
	$(RUNPERL) $(srcdir)\macros\macros.pl version.mac \
		$(srcdir)\macros\*.mac $(srcdir)\output\*.mac

# These source files are generated from regs.dat by yet another
# perl script.
x86\regs.c: x86\regs.dat x86\regs.pl
	$(RUNPERL) $(srcdir)\x86\regs.pl c \
		$(srcdir)\x86\regs.dat > x86\regs.c
x86\regflags.c: x86\regs.dat x86\regs.pl
	$(RUNPERL) $(srcdir)\x86\regs.pl fc \
		$(srcdir)\x86\regs.dat > x86\regflags.c
x86\regdis.c: x86\regs.dat x86\regs.pl
	$(RUNPERL) $(srcdir)\x86\regs.pl dc \
		$(srcdir)\x86\regs.dat > x86\regdis.c
x86\regdis.h: x86\regs.dat x86\regs.pl
	$(RUNPERL) $(srcdir)\x86\regs.pl dh \
		$(srcdir)\x86\regs.dat > x86\regdis.h
x86\regvals.c: x86\regs.dat x86\regs.pl
	$(RUNPERL) $(srcdir)\x86\regs.pl vc \
		$(srcdir)\x86\regs.dat > x86\regvals.c
x86\regs.h: x86\regs.dat x86\regs.pl
	$(RUNPERL) $(srcdir)\x86\regs.pl h \
		$(srcdir)\x86\regs.dat > x86\regs.h

# Assembler token hash
asm\tokhash.c: x86\insns.dat x86\regs.dat asm\tokens.dat asm\tokhash.pl \
	perllib\phash.ph
	$(RUNPERL) $(srcdir)\asm\tokhash.pl c \
		$(srcdir)\x86\insns.dat $(srcdir)\x86\regs.dat \
		$(srcdir)\asm\tokens.dat > asm\tokhash.c

# Assembler token metadata
asm\tokens.h: x86\insns.dat x86\regs.dat asm\tokens.dat asm\tokhash.pl \
	perllib\phash.ph
	$(RUNPERL) $(srcdir)\asm\tokhash.pl h \
		$(srcdir)\x86\insns.dat $(srcdir)\x86\regs.dat \
		$(srcdir)\asm\tokens.dat > asm\tokens.h

# Preprocessor token hash
asm\pptok.h: asm\pptok.dat asm\pptok.pl perllib\phash.ph
	$(RUNPERL) $(srcdir)\asm\pptok.pl h \
		$(srcdir)\asm\pptok.dat asm\pptok.h
asm\pptok.c: asm\pptok.dat asm\pptok.pl perllib\phash.ph
	$(RUNPERL) $(srcdir)\asm\pptok.pl c \
		$(srcdir)\asm\pptok.dat asm\pptok.c
asm\pptok.ph: asm\pptok.dat asm\pptok.pl perllib\phash.ph
	$(RUNPERL) $(srcdir)\asm\pptok.pl ph \
		$(srcdir)\asm\pptok.dat asm\pptok.ph

# Directives hash
asm\directiv.h: asm\directiv.dat nasmlib\perfhash.pl perllib\phash.ph
	$(RUNPERL) $(srcdir)\nasmlib\perfhash.pl h \
		$(srcdir)\asm\directiv.dat asm\directiv.h
asm\directbl.c: asm\directiv.dat nasmlib\perfhash.pl perllib\phash.ph
	$(RUNPERL) $(srcdir)\nasmlib\perfhash.pl c \
		$(srcdir)\asm\directiv.dat asm\directbl.c

#-- End Generated File Rules --#

perlreq: $(PERLREQ)

#-- Begin RDOFF Shared Rules --#
# Edit in Makefile.in, not here!

RDFLIBOBJ = rdoff\rdoff.$(O) rdoff\rdfload.$(O) rdoff\symtab.$(O) \
	    rdoff\collectn.$(O) rdoff\rdlib.$(O) rdoff\segtab.$(O) \
	    rdoff\hash.$(O)

RDFPROGS = rdoff\rdfdump$(X) rdoff\ldrdf$(X) rdoff\rdx$(X) rdoff\rdflib$(X) \
	   rdoff\rdf2bin$(X)
RDF2BINLINKS = rdoff\rdf2com$(X) rdoff\rdf2ith$(X) \
	    rdoff\rdf2ihx$(X) rdoff\rdf2srec$(X)

RDFLIB = rdoff\librdoff.$(A)
RDFLIBS = $(RDFLIB) $(NASMLIB)

rdoff\rdfdump$(X): rdoff\rdfdump.$(O) $(RDFLIBS)
rdoff\ldrdf$(X): rdoff\ldrdf.$(O) $(RDFLIBS)
rdoff\rdx$(X): rdoff\rdx.$(O) $(RDFLIBS)
rdoff\rdflib$(X): rdoff\rdflib.$(O) $(RDFLIBS)
rdoff\rdf2bin$(X): rdoff\rdf2bin.$(O) $(RDFLIBS)
rdoff\rdf2com$(X): rdoff\rdf2bin$(X)
	$(RM_F) rdoff\rdf2com$(X)
	cd rdoff && $(LN_S) rdf2bin$(X) rdf2com$(X)
rdoff\rdf2ith$(X): rdoff\rdf2bin$(X)
	$(RM_F) rdoff\rdf2ith$(X)
	cd rdoff && $(LN_S) rdf2bin$(X) rdf2ith$(X)
rdoff\rdf2ihx$(X): rdoff\rdf2bin$(X)
	$(RM_F) rdoff\rdf2ihx$(X)
	cd rdoff && $(LN_S) rdf2bin$(X) rdf2ihx$(X)
rdoff\rdf2srec$(X): rdoff\rdf2bin$(X)
	$(RM_F) rdoff\rdf2srec$(X)
	cd rdoff && $(LN_S) rdf2bin$(X) rdf2srec$(X)

#-- End RDOFF Shared Rules --#

rdf: $(RDFPROGS) $(RDF2BINLINKS)

$(RDFLIB): $(RDFLIBOBJ)
	$(AR) $(ARFLAGS) /OUT:$@ $**

#-- Begin NSIS Rules --#
# Edit in Makefile.in, not here!

# NSIS is not built except by explicit request, as it only applies to
# Windows platforms
nsis\arch.nsh: nsis\getpearch.pl nasm$(X)
	$(PERL) $(srcdir)\nsis\getpearch.pl nasm$(X) > nsis\arch.nsh

# Should only be done after "make everything".
# The use of redirection here keeps makensis from moving the cwd to the
# source directory.
nsis: nsis\nasm.nsi nsis\arch.nsh nsis\version.nsh
	$(MAKENSIS) -Dsrcdir="$(srcdir)" -Dobjdir="$(objdir)" - < nsis\nasm.nsi

#-- End NSIS Rules --#

clean:
	-del /f /s *.$(O)
	-del /f /s *.pdb
	-del /f /s *.s
	-del /f /s *.i
	-del /f $(NASMLIB) $(RDFLIB)
	-del /f nasm$(X)
	-del /f ndisasm$(X)
	-del /f rdoff\*$(X)

distclean: clean
	-del /f config.h
	-del /f config.log
	-del /f config.status
	-del /f Makefile
	-del /f /s *~
	-del /f /s *.bak
	-del /f /s *.lst
	-del /f /s *.bin
	-del /f output\*~
	-del /f output\*.bak
	-del /f test\*.lst
	-del /f test\*.bin
	-del /f test\*.$(O)
	-del /f test\*.bin
	-del /f/s autom4te*.cache
	rem cd rdoff && $(MAKE) distclean

cleaner: clean
	-del /f $(PERLREQ)
	-del /f *.man
	-del /f nasm.spec
	rem cd doc && $(MAKE) clean

spotless: distclean cleaner
	-del /f doc\Makefile
	-del doc\*~
	-del doc\*.bak

strip:

# Abuse doc/Makefile.in to build nasmdoc.pdf only
docs:
	cd doc && $(MAKE) /f Makefile.in srcdir=. top_srcdir=.. \
		PERL=$(PERL) PDFOPT= nasmdoc.pdf

everything: all docs nsis

#-- Magic hints to mkdep.pl --#
# @object-ending: ".$(O)"
# @path-separator: "\"
# @exclude: "config/config.h"
#-- Everything below is generated by mkdep.pl - do not edit --#
asm\assemble.$(O): asm\assemble.c asm\assemble.h asm\directiv.h \
 asm\listing.h asm\pptok.h asm\preproc.h asm\tokens.h config\msvc.h \
 config\unknown.h config\watcom.h include\bytesex.h include\compiler.h \
 include\disp8.h include\error.h include\iflag.h include\insns.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\strlist.h include\tables.h x86\iflaggen.h \
 x86\insnsi.h x86\regs.h
asm\directbl.$(O): asm\directbl.c asm\directiv.h config\msvc.h \
 config\unknown.h config\watcom.h include\bytesex.h include\compiler.h \
 include\nasmint.h include\nasmlib.h include\perfhash.h
asm\directiv.$(O): asm\directiv.c asm\assemble.h asm\directiv.h asm\eval.h \
 asm\float.h asm\listing.h asm\pptok.h asm\preproc.h asm\stdscan.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\error.h include\iflag.h include\labels.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\strlist.h include\tables.h output\outform.h \
 x86\iflaggen.h x86\insnsi.h x86\regs.h
asm\error.$(O): asm\error.c config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasmint.h \
 include\nasmlib.h
asm\eval.$(O): asm\eval.c asm\assemble.h asm\directiv.h asm\eval.h \
 asm\float.h asm\pptok.h asm\preproc.h config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\iflag.h include\labels.h include\nasm.h include\nasmint.h \
 include\nasmlib.h include\opflags.h include\perfhash.h include\strlist.h \
 include\tables.h x86\iflaggen.h x86\insnsi.h x86\regs.h
asm\exprdump.$(O): asm\exprdump.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\nasm.h include\nasmint.h include\nasmlib.h \
 include\opflags.h include\perfhash.h include\strlist.h include\tables.h \
 x86\insnsi.h x86\regs.h
asm\exprlib.$(O): asm\exprlib.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\nasm.h include\nasmint.h include\nasmlib.h \
 include\opflags.h include\perfhash.h include\strlist.h include\tables.h \
 x86\insnsi.h x86\regs.h
asm\float.$(O): asm\float.c asm\directiv.h asm\float.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h x86\insnsi.h x86\regs.h
asm\labels.$(O): asm\labels.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\error.h include\hashtbl.h include\labels.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\strlist.h include\tables.h x86\insnsi.h \
 x86\regs.h
asm\listing.$(O): asm\listing.c asm\directiv.h asm\listing.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h x86\insnsi.h x86\regs.h
asm\nasm.$(O): asm\nasm.c asm\assemble.h asm\directiv.h asm\eval.h \
 asm\float.h asm\listing.h asm\parser.h asm\pptok.h asm\preproc.h \
 asm\stdscan.h asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\iflag.h \
 include\insns.h include\labels.h include\nasm.h include\nasmint.h \
 include\nasmlib.h include\opflags.h include\perfhash.h include\raa.h \
 include\saa.h include\strlist.h include\tables.h include\ver.h \
 output\outform.h x86\iflaggen.h x86\insnsi.h x86\regs.h
asm\parser.$(O): asm\parser.c asm\assemble.h asm\directiv.h asm\eval.h \
 asm\float.h asm\parser.h asm\pptok.h asm\preproc.h asm\stdscan.h \
 asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\iflag.h \
 include\insns.h include\nasm.h include\nasmint.h include\nasmlib.h \
 include\opflags.h include\perfhash.h include\strlist.h include\tables.h \
 x86\iflaggen.h x86\insnsi.h x86\regs.h
asm\pptok.$(O): asm\pptok.c asm\pptok.h asm\preproc.h config\msvc.h \
 config\unknown.h config\watcom.h include\bytesex.h include\compiler.h \
 include\hashtbl.h include\nasmint.h include\nasmlib.h
asm\pragma.$(O): asm\pragma.c asm\assemble.h asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\iflag.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\strlist.h include\tables.h x86\iflaggen.h \
 x86\insnsi.h x86\regs.h
asm\preproc-nop.$(O): asm\preproc-nop.c asm\directiv.h asm\listing.h \
 asm\pptok.h asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h x86\insnsi.h x86\regs.h
asm\preproc.$(O): asm\preproc.c asm\directiv.h asm\eval.h asm\listing.h \
 asm\pptok.h asm\preproc.h asm\quote.h asm\stdscan.h asm\tokens.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\error.h include\hashtbl.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h x86\insnsi.h x86\regs.h
asm\quote.$(O): asm\quote.c asm\quote.h config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h
asm\rdstrnum.$(O): asm\rdstrnum.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\nasm.h include\nasmint.h include\nasmlib.h \
 include\opflags.h include\perfhash.h include\strlist.h include\tables.h \
 x86\insnsi.h x86\regs.h
asm\segalloc.$(O): asm\segalloc.c asm\directiv.h asm\pptok.h asm\preproc.h \
 asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\iflag.h include\insns.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\strlist.h include\tables.h x86\iflaggen.h \
 x86\insnsi.h x86\regs.h
asm\stdscan.$(O): asm\stdscan.c asm\directiv.h asm\pptok.h asm\preproc.h \
 asm\quote.h asm\stdscan.h asm\tokens.h config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\iflag.h include\insns.h include\nasm.h include\nasmint.h \
 include\nasmlib.h include\opflags.h include\perfhash.h include\strlist.h \
 include\tables.h x86\iflaggen.h x86\insnsi.h x86\regs.h
asm\strfunc.$(O): asm\strfunc.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\nasm.h include\nasmint.h include\nasmlib.h \
 include\opflags.h include\perfhash.h include\strlist.h include\tables.h \
 x86\insnsi.h x86\regs.h
asm\tokhash.$(O): asm\tokhash.c asm\directiv.h asm\pptok.h asm\preproc.h \
 asm\stdscan.h asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\hashtbl.h include\iflag.h \
 include\insns.h include\nasm.h include\nasmint.h include\nasmlib.h \
 include\opflags.h include\perfhash.h include\strlist.h include\tables.h \
 x86\iflaggen.h x86\insnsi.h x86\regs.h
common\common.$(O): common\common.c asm\directiv.h asm\pptok.h asm\preproc.h \
 asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\iflag.h include\insns.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\strlist.h include\tables.h x86\iflaggen.h \
 x86\insnsi.h x86\regs.h
disasm\disasm.$(O): disasm\disasm.c asm\directiv.h asm\pptok.h asm\preproc.h \
 asm\tokens.h config\msvc.h config\unknown.h config\watcom.h disasm\disasm.h \
 disasm\sync.h include\bytesex.h include\compiler.h include\disp8.h \
 include\iflag.h include\insns.h include\nasm.h include\nasmint.h \
 include\nasmlib.h include\opflags.h include\perfhash.h include\strlist.h \
 include\tables.h x86\iflaggen.h x86\insnsi.h x86\regdis.h x86\regs.h
disasm\ndisasm.$(O): disasm\ndisasm.c asm\directiv.h asm\pptok.h \
 asm\preproc.h asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 disasm\disasm.h disasm\sync.h include\bytesex.h include\compiler.h \
 include\error.h include\iflag.h include\insns.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h include\ver.h x86\iflaggen.h \
 x86\insnsi.h x86\regs.h
disasm\sync.$(O): disasm\sync.c config\msvc.h config\unknown.h \
 config\watcom.h disasm\sync.h include\bytesex.h include\compiler.h \
 include\nasmint.h include\nasmlib.h
macros\macros.$(O): macros\macros.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\hashtbl.h include\nasm.h include\nasmint.h \
 include\nasmlib.h include\opflags.h include\perfhash.h include\strlist.h \
 include\tables.h output\outform.h x86\insnsi.h x86\regs.h
nasmlib\badenum.$(O): nasmlib\badenum.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h
nasmlib\bsi.$(O): nasmlib\bsi.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h
nasmlib\crc64.$(O): nasmlib\crc64.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\hashtbl.h \
 include\nasmint.h include\nasmlib.h
nasmlib\file.$(O): nasmlib\file.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h nasmlib\file.h
nasmlib\filename.$(O): nasmlib\filename.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h
nasmlib\hashtbl.$(O): nasmlib\hashtbl.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\hashtbl.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h x86\insnsi.h x86\regs.h
nasmlib\ilog2.$(O): nasmlib\ilog2.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h
nasmlib\malloc.$(O): nasmlib\malloc.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h
nasmlib\md5c.$(O): nasmlib\md5c.c config\msvc.h config\unknown.h \
 config\watcom.h include\compiler.h include\md5.h include\nasmint.h
nasmlib\mmap.$(O): nasmlib\mmap.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h nasmlib\file.h
nasmlib\path.$(O): nasmlib\path.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h
nasmlib\perfhash.$(O): nasmlib\perfhash.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\hashtbl.h \
 include\nasmint.h include\nasmlib.h include\perfhash.h
nasmlib\raa.$(O): nasmlib\raa.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h include\raa.h
nasmlib\rbtree.$(O): nasmlib\rbtree.c config\msvc.h config\unknown.h \
 config\watcom.h include\compiler.h include\nasmint.h include\rbtree.h
nasmlib\readnum.$(O): nasmlib\readnum.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h x86\insnsi.h x86\regs.h
nasmlib\realpath.$(O): nasmlib\realpath.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h
nasmlib\saa.$(O): nasmlib\saa.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h include\saa.h
nasmlib\srcfile.$(O): nasmlib\srcfile.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\hashtbl.h \
 include\nasmint.h include\nasmlib.h
nasmlib\string.$(O): nasmlib\string.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h
nasmlib\strlist.$(O): nasmlib\strlist.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h include\strlist.h
nasmlib\ver.$(O): nasmlib\ver.c include\ver.h version.h
nasmlib\zerobuf.$(O): nasmlib\zerobuf.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h
output\codeview.$(O): output\codeview.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\hashtbl.h \
 include\md5.h include\nasm.h include\nasmint.h include\nasmlib.h \
 include\opflags.h include\perfhash.h include\saa.h include\strlist.h \
 include\tables.h output\outlib.h output\pecoff.h version.h x86\insnsi.h \
 x86\regs.h
output\legacy.$(O): output\legacy.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\error.h include\nasm.h include\nasmint.h \
 include\nasmlib.h include\opflags.h include\perfhash.h include\strlist.h \
 include\tables.h output\outlib.h x86\insnsi.h x86\regs.h
output\nulldbg.$(O): output\nulldbg.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h output\outlib.h x86\insnsi.h x86\regs.h
output\nullout.$(O): output\nullout.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h output\outlib.h x86\insnsi.h x86\regs.h
output\outaout.$(O): output\outaout.c asm\directiv.h asm\eval.h asm\pptok.h \
 asm\preproc.h asm\stdscan.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\raa.h include\saa.h include\strlist.h include\tables.h \
 output\outform.h output\outlib.h x86\insnsi.h x86\regs.h
output\outas86.$(O): output\outas86.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\raa.h include\saa.h include\strlist.h include\tables.h \
 output\outform.h output\outlib.h x86\insnsi.h x86\regs.h
output\outbin.$(O): output\outbin.c asm\directiv.h asm\eval.h asm\pptok.h \
 asm\preproc.h asm\stdscan.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\labels.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\saa.h include\strlist.h include\tables.h \
 output\outform.h output\outlib.h x86\insnsi.h x86\regs.h
output\outcoff.$(O): output\outcoff.c asm\directiv.h asm\eval.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\raa.h include\saa.h include\strlist.h include\tables.h \
 output\outform.h output\outlib.h output\pecoff.h x86\insnsi.h x86\regs.h
output\outdbg.$(O): output\outdbg.c asm\directiv.h asm\pptok.h asm\preproc.h \
 asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\iflag.h \
 include\insns.h include\nasm.h include\nasmint.h include\nasmlib.h \
 include\opflags.h include\perfhash.h include\strlist.h include\tables.h \
 output\outform.h output\outlib.h x86\iflaggen.h x86\insnsi.h x86\regs.h
output\outelf.$(O): output\outelf.c asm\directiv.h asm\eval.h asm\pptok.h \
 asm\preproc.h asm\stdscan.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\raa.h include\rbtree.h include\saa.h include\strlist.h \
 include\tables.h include\ver.h output\dwarf.h output\elf.h output\outelf.h \
 output\outform.h output\outlib.h output\stabs.h x86\insnsi.h x86\regs.h
output\outform.$(O): output\outform.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\nasm.h include\nasmint.h \
 include\nasmlib.h include\opflags.h include\perfhash.h include\strlist.h \
 include\tables.h output\outform.h x86\insnsi.h x86\regs.h
output\outieee.$(O): output\outieee.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h include\ver.h output\outform.h \
 output\outlib.h x86\insnsi.h x86\regs.h
output\outlib.$(O): output\outlib.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\error.h include\nasm.h include\nasmint.h \
 include\nasmlib.h include\opflags.h include\perfhash.h include\strlist.h \
 include\tables.h output\outlib.h x86\insnsi.h x86\regs.h
output\outmacho.$(O): output\outmacho.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\labels.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\raa.h include\rbtree.h include\saa.h \
 include\strlist.h include\tables.h include\ver.h output\dwarf.h \
 output\outform.h output\outlib.h x86\insnsi.h x86\regs.h
output\outobj.$(O): output\outobj.c asm\directiv.h asm\eval.h asm\pptok.h \
 asm\preproc.h asm\stdscan.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h include\ver.h output\outform.h \
 output\outlib.h x86\insnsi.h x86\regs.h
output\outrdf2.$(O): output\outrdf2.c asm\directiv.h asm\pptok.h \
 asm\preproc.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\rdoff.h include\saa.h include\strlist.h include\tables.h \
 output\outform.h output\outlib.h x86\insnsi.h x86\regs.h
output\strtbl.$(O): output\strtbl.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\error.h include\hashtbl.h include\nasm.h \
 include\nasmint.h include\nasmlib.h include\opflags.h include\perfhash.h \
 include\strlist.h include\tables.h output\strtbl.h x86\insnsi.h x86\regs.h
rdoff\collectn.$(O): rdoff\collectn.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\collectn.h \
 rdoff\rdfutils.h
rdoff\hash.$(O): rdoff\hash.c config\msvc.h config\unknown.h config\watcom.h \
 include\compiler.h include\nasmint.h rdoff\hash.h
rdoff\ldrdf.$(O): rdoff\ldrdf.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\collectn.h \
 rdoff\ldsegs.h rdoff\rdfutils.h rdoff\rdlib.h rdoff\segtab.h rdoff\symtab.h
rdoff\rdf2bin.$(O): rdoff\rdf2bin.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\rdfload.h \
 rdoff\rdfutils.h
rdoff\rdfdump.$(O): rdoff\rdfdump.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\rdfutils.h
rdoff\rdflib.$(O): rdoff\rdflib.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\rdfutils.h
rdoff\rdfload.$(O): rdoff\rdfload.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\collectn.h \
 rdoff\rdfload.h rdoff\rdfutils.h rdoff\symtab.h
rdoff\rdlar.$(O): rdoff\rdlar.c config\msvc.h config\unknown.h \
 config\watcom.h include\compiler.h include\nasmint.h rdoff\rdlar.h
rdoff\rdlib.$(O): rdoff\rdlib.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\rdfutils.h \
 rdoff\rdlar.h rdoff\rdlib.h
rdoff\rdoff.$(O): rdoff\rdoff.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\rdfutils.h
rdoff\rdx.$(O): rdoff\rdx.c config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\error.h include\nasmint.h \
 include\nasmlib.h include\rdoff.h rdoff\rdfload.h rdoff\rdfutils.h \
 rdoff\symtab.h
rdoff\segtab.$(O): rdoff\segtab.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\rdfutils.h \
 rdoff\segtab.h
rdoff\symtab.$(O): rdoff\symtab.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h include\rdoff.h rdoff\hash.h \
 rdoff\rdfutils.h rdoff\symtab.h
stdlib\snprintf.$(O): stdlib\snprintf.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\nasmint.h \
 include\nasmlib.h
stdlib\strlcpy.$(O): stdlib\strlcpy.c config\msvc.h config\unknown.h \
 config\watcom.h include\compiler.h include\nasmint.h
stdlib\strnlen.$(O): stdlib\strnlen.c config\msvc.h config\unknown.h \
 config\watcom.h include\compiler.h include\nasmint.h
stdlib\vsnprintf.$(O): stdlib\vsnprintf.c config\msvc.h config\unknown.h \
 config\watcom.h include\bytesex.h include\compiler.h include\error.h \
 include\nasmint.h include\nasmlib.h
x86\disp8.$(O): x86\disp8.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\disp8.h include\nasm.h include\nasmint.h \
 include\nasmlib.h include\opflags.h include\perfhash.h include\strlist.h \
 include\tables.h x86\insnsi.h x86\regs.h
x86\iflag.$(O): x86\iflag.c config\msvc.h config\unknown.h config\watcom.h \
 include\compiler.h include\iflag.h include\nasmint.h x86\iflaggen.h
x86\insnsa.$(O): x86\insnsa.c asm\directiv.h asm\pptok.h asm\preproc.h \
 asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\iflag.h include\insns.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\strlist.h include\tables.h x86\iflaggen.h \
 x86\insnsi.h x86\regs.h
x86\insnsb.$(O): x86\insnsb.c asm\directiv.h asm\pptok.h asm\preproc.h \
 asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\iflag.h include\insns.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\strlist.h include\tables.h x86\iflaggen.h \
 x86\insnsi.h x86\regs.h
x86\insnsd.$(O): x86\insnsd.c asm\directiv.h asm\pptok.h asm\preproc.h \
 asm\tokens.h config\msvc.h config\unknown.h config\watcom.h \
 include\bytesex.h include\compiler.h include\iflag.h include\insns.h \
 include\nasm.h include\nasmint.h include\nasmlib.h include\opflags.h \
 include\perfhash.h include\strlist.h include\tables.h x86\iflaggen.h \
 x86\insnsi.h x86\regs.h
x86\insnsn.$(O): x86\insnsn.c config\msvc.h config\unknown.h config\watcom.h \
 include\compiler.h include\nasmint.h include\tables.h x86\insnsi.h
x86\regdis.$(O): x86\regdis.c x86\regdis.h x86\regs.h
x86\regflags.$(O): x86\regflags.c asm\directiv.h asm\pptok.h asm\preproc.h \
 config\msvc.h config\unknown.h config\watcom.h include\bytesex.h \
 include\compiler.h include\nasm.h include\nasmint.h include\nasmlib.h \
 include\opflags.h include\perfhash.h include\strlist.h include\tables.h \
 x86\insnsi.h x86\regs.h
x86\regs.$(O): x86\regs.c config\msvc.h config\unknown.h config\watcom.h \
 include\compiler.h include\nasmint.h include\tables.h x86\insnsi.h
x86\regvals.$(O): x86\regvals.c config\msvc.h config\unknown.h \
 config\watcom.h include\compiler.h include\nasmint.h include\tables.h \
 x86\insnsi.h