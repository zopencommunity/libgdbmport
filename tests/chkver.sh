#!/bin/sh

mydir=$(cd $(dirname $0) && echo $PWD)
LIBGDBM_HOME=${mydir}/../gdbm-*/src
LIB=$LIBGDBM_HOME/.libs
INC=$LIBGDBM_HOME

cd "${mydir}"
rm -f chkver chkver.o

set -x
if ! ${CC} ${CFLAGS} ${CPPFLAGS} -I $INC -L $LIB -ochkver chkver.c $LDFLAGS -lgdbm $LIBS ; then
  echo "Unable to build basic version test for libgdbm" >&2
  exit 8
fi

if ! ./chkver ; then
  echo "Unable to run basic version test for libgdbm" >&2
  rc=8
else
  rc=0
fi
rm -f chkver chkver.o
exit $rc
