FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

FILES_${PN}-staticdev += "ubi-utils/libubi.a ${libdir}/*.a"

SRC_URI += " \
	file://0001-libubigen-remove-unnecessary-include.patch \
	file://0002-libubi-remove-private-kernel-header-from-includes.patch \
"

do_install_append () {
	install -d ${D}${includedir}/mtd/
	install -d ${D}${libdir}/
	install -m 0644 ${S}/include/libubi.h ${D}${includedir}
	install -m 0644 ${S}/include/libmtd.h ${D}${includedir}
	install -m 0644 ${S}/include/libscan.h ${D}${includedir}
	install -m 0644 ${S}/include/libubigen.h ${D}${includedir}
	install -m 0644 ${S}/include/mtd/ubi-media.h ${D}${includedir}/mtd/
	ln -s ../libubi.h ${D}${includedir}/mtd/libubi.h
	ln -s ../libmtd.h ${D}${includedir}/mtd/libmtd.h
	ln -s ../libscan.h ${D}${includedir}/mtd/libscan.h
	ln -s ../libubigen.h ${D}${includedir}/mtd/libubigen.h
	oe_libinstall -a libubi ${D}${libdir}/
	oe_libinstall -a libmtd ${D}${libdir}/
}

BBCLASSEXTEND += "native"
