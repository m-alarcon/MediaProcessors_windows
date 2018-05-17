LIBNAME=cjson
BUILD_DIR := build_dir
SOURCE_DIR := $(shell pwd)/../../3rdplibs/cJSON
PREFIX:= $(INSTALL_DIR)$(CROSS_ARCH)
INCLUDE_DIR := "$(PREFIX)"/include
LIB_DIR := "$(PREFIX)"/lib
BIN_DIR := "$(PREFIX)"/bin

CFLAGS+=-I$(INCLUDE_DIR)

LIBS=-lm -ldl

_OBJ = $(wildcard $(SOURCE_DIR)/*.c*)
OBJ = $(patsubst $(SOURCE_DIR)/%.c*,$(BUILD_DIR)/%.o,$(_OBJ))

.PHONY : $(SOURCE_DIR)

all: install

config:
	mkdir -p $(PREFIX)
	mkdir -p $(INCLUDE_DIR)
	mkdir -p $(INCLUDE_DIR)/lib$(LIBNAME)
	mkdir -p $(LIB_DIR)
	mkdir -p $(BUILD_DIR)

build: config
	if [ ! -f $(LIB_DIR)/lib$(LIBNAME).a ] ; then \
	$(MAKE) $(BUILD_DIR)/lib$(LIBNAME); \
	fi

$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.c*
	$(CC) -c -o $@ $< $(CFLAGS)

$(BUILD_DIR)/lib$(LIBNAME): $(OBJ)
	$(CC) -o $@.dll $^ -shared -Bdynamic $(CFLAGS) $(LIBS) -Wl,--out-implib,$@.a

install: build
	cp $(BUILD_DIR)/*.a $(LIB_DIR)/;
	cp $(BUILD_DIR)/*.dll $(BIN_DIR)/;
	cp -a $(SOURCE_DIR)/*.h $(INCLUDE_DIR)/lib$(LIBNAME)/;

clean:
	rm -rf *~ *.log *.log* $(SOURCE_DIR)/*~ $(BUILD_DIR) \
	$(LIB_DIR)/lib$(LIBNAME)* $(INCLUDE_DIR)/lib$(LIBNAME) $(PREFIX)/bin/lib$(LIBNAME)*
