#!/bin/sh

PROGNAME=recordserver
CONSPROGNAME=rsprog
CONSCMD=rs
RSBINDIR=/usr/sbin
PWD=`pwd`

# Where to install record server after compiling
# Default -> leave empty
INSTALL_PREFIX=

# Staging directory
DESTDIR=/etc/recordserver
RSCFGDIR=/etc/recordserver
RSCONFFILE=recordServerCfg.xml
RSBINDIR=/usr/sbin
RSVARRUNDIR=/var/run
RSLOGDIR=/var/log/recordserver
 
dos2unix -q ${CONSCMD}
cp -f ${PROGNAME} ${RSBINDIR}
cp -f ${CONSPROGNAME} ${RSBINDIR}
cp -f ${CONSCMD} ${RSBINDIR}
chmod +x ${RSBINDIR}/${CONSCMD}
chmod +x ${RSBINDIR}/${PROGNAME}
chmod +x ${RSBINDIR}/${CONSPROGNAME}
[ -d ${RSLOGDIR} ] || mkdir -p ${RSLOGDIR}
[ -d ${RSCFGDIR} ] || mkdir -p ${RSCFGDIR}
cp -f ${RSCONFFILE} ${RSCFGDIR}
cp *.pem ${RSCFGDIR}