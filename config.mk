GHC = ghc
GHCI = ghci

# only used by warn-% targets
GHC_VERBOSE_WARNINGS += -W # -fwarn-missing-signatures

GHCFLAGS += -fglasgow-exts -fallow-overlapping-instances $(GHCFLAGS_WARN)

HUGS = hugs
RUNHUGS = runhugs
HUGSFLAGS = -98 +o

HADDOCK = haddock

SRC_DIR = $(TOP_DIR)/src

HSQL_DIR = $(TOP_DIR)/../HSQL-cvs
UNIXODBC_PREFIX = /usr

HOST = $(shell hostname)
ifeq ("$(HOST)", "jackass.tekno.chalmers.se")
HSQL_DIR = /usr/local/dp03-7/HSQL-cvs
UNIXODBC_PREFIX = /usr/local/dp03-7/unixODBC-2.2.6
endif

UNIXODBC_LIBDIR = $(UNIXODBC_PREFIX)/lib

GHCFLAGS += -i$(SRC_DIR) -i$(HSQL_DIR)
LDFLAGS += -L$(SRC_DIR) -L$(HSQL_DIR)/Database -L$(UNIXODBC_LIBDIR)

HUGSFLAGS += -P:$(SRC_DIR):$(HSQL_DIR)