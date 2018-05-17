LIBNAME:= mediaprocscrc
BUILD_DIR:= $(shell pwd)/build_dir
SOURCE_DIR:= $(shell pwd)/../../3rdplibs/crc
PREFIX:= $(INSTALL_DIR)$(CROSS_ARCH)

CFLAGS+=-I$(PREFIX)/include

LIBS=-lm -ldl

_OBJ = $(wildcard $(SOURCE_DIR)/*.c*)
OBJ = $(patsubst $(SOURCE_DIR)/%.c*,$(BUILD_DIR)/%.o,$(_OBJ))

.PHONY : $(SOURCE_DIR)

all: install

config:
	@mkdir -p $(PREFIX)
	@mkdir -p $(PREFIX)/lib
	@mkdir -p $(PREFIX)/include
	@mkdir -p $(PREFIX)/include/lib$(LIBNAME)
	@mkdir -p $(BUILD_DIR)

build: config
	if [ ! -f $(PREFIX)/lib/lib$(LIBNAME).a ] ; then \
		$(MAKE) $(BUILD_DIR)/lib$(LIBNAME); \
	fi

$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.c*
	$(CC) -c -o $@ $< $(CFLAGS)

$(BUILD_DIR)/lib$(LIBNAME): $(OBJ)
	$(CC) -o $@.dll $^ -shared -Bdynamic $(CFLAGS) $(LIBS) -Wl,--out-implib,$@.a

install: build
	cp $(BUILD_DIR)/*.a $(PREFIX)/lib/;
	cp $(BUILD_DIR)/*.dll $(PREFIX)/bin/;
	cp -a $(SOURCE_DIR)/*.h $(PREFIX)/include/lib$(LIBNAME)/;

clean:
	rm -rf *~ *.log *.log* $(SOURCE_DIR)/*~ $(BUILD_DIR) \
	$(PREFIX)/lib/lib$(LIBNAME)* $(PREFIX)/include/lib$(LIBNAME) $(PREFIX)/bin/lib$(LIBNAME)*
