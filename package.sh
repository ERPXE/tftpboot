git archive --format=tar HEAD | gzip > erpxe${VERSION}.tar.gz
#git archive --format=tar --prefix=mahara-${VERSION}/ ${RELEASETAG} | bzip2 -9 > ${CURRENTDIR}/mahara-${RELEASE}.tar.bz2