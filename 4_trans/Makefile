# Copyright (C) 2006-2010, The Perl Foundation.
# $Id$

PARROT_ARGS      =

# values from parrot_config
PARROT_BIN_DIR     = c:/Users/nmishin/Documents/rakudo/rakudo-star-2011.04/install/bin
PARROT_VERSION     = \parrot\3.3.0
PARROT_INCLUDE_DIR = c:/Users/nmishin/Documents/rakudo/rakudo-star-2011.04/install/include$(PARROT_VERSION)
PARROT_LIB_DIR     = c:/Users/nmishin/Documents/rakudo/rakudo-star-2011.04/install/lib$(PARROT_VERSION)
PARROT_SRC_DIR     = c:/Users/nmishin/Documents/rakudo/rakudo-star-2011.04/install/src$(PARROT_VERSION)
HAS_ICU            = 0

CC            = gcc
CFLAGS        = -DWIN32 -DWINVER=Windows2000  -DHASATTRIBUTE_CONST  -DHASATTRIBUTE_DEPRECATED  -DHASATTRIBUTE_MALLOC  -DHASATTRIBUTE_NONNULL  -DHASATTRIBUTE_NORETURN  -DHASATTRIBUTE_PURE  -DHASATTRIBUTE_UNUSED  -DHASATTRIBUTE_WARN_UNUSED_RESULT  -DHASATTRIBUTE_HOT  -DHASATTRIBUTE_COLD  -DHAS_GETTEXT   -g -falign-functions=16 -funit-at-a-time -maccumulate-outgoing-args -W -Wall -Waggregate-return -Wcast-align -Wcast-qual -Wchar-subscripts -Wcomment -Wdisabled-optimization -Wdiv-by-zero -Wendif-labels -Wextra -Wformat -Wformat-extra-args -Wformat-nonliteral -Wformat-security -Wformat-y2k -Wimplicit -Wimport -Winit-self -Winline -Winvalid-pch -Wlogical-op -Wmissing-braces -Wmissing-field-initializers -Wno-missing-format-attribute -Wmissing-include-dirs -Wmultichar -Wpacked -Wparentheses -Wpointer-arith -Wpointer-sign -Wreturn-type -Wsequence-point -Wsign-compare -Wstrict-aliasing -Wstrict-aliasing=2 -Wswitch -Wswitch-default -Wtrigraphs -Wundef -Wno-unused -Wunknown-pragmas -Wvariadic-macros -Wwrite-strings -Wc++-compat -Wdeclaration-after-statement -Werror=declaration-after-statement -Wimplicit-function-declaration -Wimplicit-int -Wmain -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wnonnull -Wold-style-definition -Wstrict-prototypes  
EXE           = .exe
LD            = g++
LDFLAGS       =  
LD_LOAD_FLAGS = -shared 
LIBPARROT     = "c:/Users/nmishin/Documents/rakudo/rakudo-star-2011.04/install/bin/libparrot.dll"
O             = .o
LOAD_EXT      = .dll
PERL          = c:/Strawberry/perl/bin/perl.exe
CP            = $(PERL) -MExtUtils::Command -e cp
MV            = $(PERL) -MExtUtils::Command -e mv
RM_F          = $(PERL) -MExtUtils::Command -e rm_f
MKPATH        = $(PERL) -MExtUtils::Command -e mkpath
CHMOD         = $(PERL) -MExtUtils::Command -e chmod
POD2MAN       = C:/strawberry/perl/bin/pod2man

# locations of parrot resources
PARROT           = $(PARROT_BIN_DIR)/parrot$(EXE)
NQP_EXE          = $(PARROT_BIN_DIR)/parrot-nqp$(EXE)
PBC_TO_EXE       = $(PARROT_BIN_DIR)/pbc_to_exe$(EXE)
PARROT_CONFIG    = $(PARROT_BIN_DIR)/parrot_config$(EXE)
PARROT_TOOLS_DIR = $(PARROT_LIB_DIR)/tools
PARROT_PERL_LIB  = $(PARROT_TOOLS_DIR)/lib
OPS2C            = $(PARROT_BIN_DIR)/ops2c$(EXE)
PMC2C            = $(PERL) $(PARROT_TOOLS_DIR)/build/pmc2c.pl
PMC2C_INCLUDES   = --include src/pmc --include $(PARROT_SRC_DIR) --include $(PARROT_SRC_DIR)/pmc
CINCLUDES        = -I$(PARROT_INCLUDE_DIR) -I$(PARROT_INCLUDE_DIR)/pmc
LINKARGS         = $(LDFLAGS) $(LD_LOAD_FLAGS) $(LIBPARROT) -lmoldname -lkernel32 -luser32 -lgdi32 -lwinspool -lcomdlg32 -ladvapi32 -lshell32 -lole32 -loleaut32 -lnetapi32 -luuid -lws2_32 -lmpr -lwinmm -lversion -lodbc32 -lodbccp32 -lcomctl32 -lgmp -lintl 

# rakudo directories
DYNEXT_DIR     = dynext
PMC_DIR        = src\pmc
OPS_DIR        = src\ops
PERL6_LANG_DIR = $(PARROT_LIB_DIR)\languages\perl6
MANDIR         = c:\Users\nmishin\Documents\rakudo\rakudo-star-2011.04\install\man
DOCDIR         = c:\Users\nmishin\Documents\rakudo\rakudo-star-2011.04\install\share\doc

PERL6_EXE      = perl6$(EXE)
PERL6_LANG_DIR = $(PARROT_LIB_DIR)\languages\perl6

MODULES = \
  modules\zavolaj \
  modules\xml-writer \
  modules\svg \
  modules\svg-plot \
  modules\Math-RungeKutta \
  modules\Math-Model \
  modules\perl6-Config-INI \
  modules\perl6-Term-ANSIColor \
  modules\Algorithm-Viterbi \
  modules\test-mock \
  modules\Perl6-MIME-Base64 \
  modules\perl6-lwp-simple \
  modules\json \
  modules\perl6-digest-md5 \
  modules\perl6-File-Tools \
  modules\Pies \
  modules\http-server-simple

all: rakudo

rakudo: rakudo\$(PERL6_EXE)
rakudo\$(PERL6_EXE):
	cd rakudo && $(PERL) Configure.pl --parrot-config=$(PARROT_CONFIG) && $(MAKE)
rakudo-test: rakudo\perl6
	cd rakudo && $(MAKE) test
rakudo-spectest: rakudo\perl6
	cd rakudo && $(MAKE) spectest
rakudo-install: rakudo
	cd rakudo && $(MAKE) install
	copy $(PARROT_BIN_DIR)\libparrot.dll .
	$(CP) $(DESTDIR)$(PARROT_BIN_DIR)\$(PERL6_EXE) .
	$(CHMOD) 755 $(PERL6_EXE)

modules-install: rakudo
	@echo "Installing 'ufo'"
	$(CP)    modules\ufo\bin\ufo $(DESTDIR)$(PARROT_BIN_DIR)\ufo
	$(CHMOD) 755                 $(DESTDIR)$(PARROT_BIN_DIR)\ufo
	$(PERL) build\module-install.pl $(DESTDIR)$(PARROT_BIN_DIR)\$(PERL6_EXE) $(DESTDIR)$(PERL6_LANG_DIR)\lib $(MODULES)
	@echo "Installing 'ufobuilder'"
	$(CP)    modules\Pies\bin\ufobuilder $(DESTDIR)$(PARROT_BIN_DIR)\ufobuilder
	$(CHMOD) 755                         $(DESTDIR)$(PARROT_BIN_DIR)\ufobuilder
	@echo "Installing 'panda'"
	$(CP)    modules\Pies\bin\panda $(DESTDIR)$(PARROT_BIN_DIR)\panda
	$(CHMOD) 755                    $(DESTDIR)$(PARROT_BIN_DIR)\panda

blizkost:
	cd modules\blizkost && $(PERL) Configure.pl --parrot-config=$(PARROT_CONFIG) && $(MAKE)
blizkost-install: blizkost
	cd modules\blizkost && $(MAKE) install

install: rakudo-install modules-install

test:
	@echo ""
	@echo "To run the Rakudo compiler tests, use 'make rakudo-test'"
	@echo "To run the Perl 6 spectests, use 'make rakudo-spectest'"
	@echo ""
	@echo "To run tests for individual modules, try:"
	@echo "  prove -e .\perl6 -r modules\<name>\t"
	@echo ""

##  cleaning
clean:
	$(RM_F) $(CLEANUPS)

distclean: realclean

realclean: clean
	$(RM_F) Makefile

testclean:


##  miscellaneous targets
# a listing of all targets meant to be called by users
help:
	@echo ""
	@echo "Following targets are available for the user:"
	@echo ""
	@echo "Maintenance:"
	@echo "  perlcritic:        Run Perl::Critic on all the Perl 5 code."
	@echo ""
	@echo "Cleaning:"
	@echo "  clean:             Basic cleaning up."
	@echo "  distclean:         Removes also anything built, in theory."
	@echo "  realclean:         Removes also files generated by 'Configure.pl'."
	@echo "  testclean:         Clean up test results."
	@echo ""
	@echo "Misc:"
	@echo "  help:              Print this help message."
	@echo ""

config:
	$(PERL) Configure.pl

$(PARROT):

CRITIC_FILES=Configure.pl build\

perlcritic:
	perlcritic -1 --profile tools\util\perlcritic.conf $(CRITIC_FILES)

release: MANIFEST
	[ -n "$(VERSION)" ] || ( echo "\nTry 'make release VERSION=yyyy.mm'\n\n"; exit 1 )
	[ -d rakudo-star-$(VERSION) ] || ln -s . rakudo-star-$(VERSION)
	$(PERL) -ne 'print "rakudo-star-$(VERSION)\$$_"' MANIFEST | \
	    tar -zcv -T - -f rakudo-star-$(VERSION).tar.gz
	rm rakudo-star-$(VERSION)
