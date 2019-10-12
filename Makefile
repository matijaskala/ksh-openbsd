DEFS = -DEMACS -DVI
CFLAGS += $(DEFS) -Dsys_signame=sys_sigabbrev $(shell pkg-config --cflags --libs libbsd-overlay ncurses) -D_GNU_SOURCE -DCHILD_MAX=80 -D_PW_NAME_LEN=31

SRCS=	alloc.c c_ksh.c c_sh.c c_test.c c_ulimit.c edit.c emacs.c eval.c \
	exec.c expr.c history.c io.c jobs.c lex.c mail.c main.c \
	misc.c path.c shf.c syn.c table.c trap.c tree.c tty.c var.c \
	version.c vi.c

all: ksh

ksh: $(SRCS)
	$(CC) $(CFLAGS) -o $@ $^

install: all
	install -d $(DESTDIR)/bin
	install ksh $(DESTDIR)/bin
	ln -sf ksh $(DESTDIR)/bin/rksh
	ln -sf ksh $(DESTDIR)/bin/sh
	install -d $(DESTDIR)/usr/share/man/man1
	install -m644 ksh.1 $(DESTDIR)/usr/share/man/man1
	install -m644 sh.1 $(DESTDIR)/usr/share/man/man1
