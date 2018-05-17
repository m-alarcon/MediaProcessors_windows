LIBNAME:= mongoose
BUILD_DIR:= $(shell pwd)/build_dir
SOURCE_DIR:= $(shell pwd)/../../3rdplibs/$(LIBNAME)
PREFIX:= $(INSTALL_DIR)$(CROSS_ARCH)

all: install

config:
	mkdir -p $(PREFIX)
	mkdir -p $(PREFIX)/lib
	mkdir -p $(PREFIX)/include
	mkdir -p $(BUILD_DIR)

build: config
	if [ ! -f $(PREFIX)/lib/libmongoose.so ] ; then \
		cp -a $(SOURCE_DIR)/* $(BUILD_DIR)/; \
		cd $(BUILD_DIR)/examples; \
		$(CC) $(CFLAGS) -Wl,--subsystem,console -DNDEBUG -Os -DHAVE_STDINT $(BUILD_DIR)/mongoose.c -lws2_32 -shared -Bdynamic -Wl,--out-implib=libmongoose.dll.a -o libmongoose.dll; \
		#$(CC) -c $(CFLAGS) -L$(PREFIX)/lib -I$(PREFIX)/include -Werror -fpic $(BUILD_DIR)/mongoose.c; \
		#$(CC) -shared -Bdynamic $(CFLAGS) -o libmongoose.so mongoose.o; \
	fi

install: build
	cp $(BUILD_DIR)/examples/libmongoose.dll.a $(PREFIX)/lib/;
	cp $(BUILD_DIR)/examples/libmongoose.dll   $(PREFIX)/bin/;
	cp $(BUILD_DIR)/mongoose.h $(PREFIX)/include/;

clean:
	@rm -fr $(BUILD_DIR)
	@rm -f $(PREFIX)/lib/libmongoose.dll.a
	@rm -f $(PREFIX)/include/mongoose.h
