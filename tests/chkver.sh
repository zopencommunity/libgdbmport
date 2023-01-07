#!/bin/sh

mydir=$(cd $(dirname $0) && echo $PWD)
LIBGDBM_HOME=${mydir}/../libgdbm 
LIB=$LIBGDBM_HOME/.libs
INC=$LIBGDBM_HOME
#LIBGDBM_HOME=$HOME/zopen/prod/libgdbm
#LIB=$LIBGDBM_HOME/lib
#INC=$LIBGDBM_HOME/include
CC=xlclang

cd "${mydir}"
rm -f chkver chkver.o

if ! ${CC} -I$INC -L$LIB -ochkver chkver.c -lgdbm ; then
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
