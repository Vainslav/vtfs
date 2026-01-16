obj-m := vtfs.o
vtfs-objs := source/vtfs.o

PWD := $(CURDIR)
KDIR = /lib/modules/6.8.0-90-generic/build
EXTRA_CFLAGS = -Wall -g

all:
	make -C $(KDIR) M=$(PWD) modules

clean:
	make -C $(KDIR) M=$(PWD) clean
	rm -rf .cache