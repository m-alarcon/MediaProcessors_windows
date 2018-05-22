#! /usr/bin/env bash
(
cd $(dirname $(which "$0")) || exit 1

distdir="uriparser-0.8.4-doc"
[ -z $MAKE ] && MAKE=make

# Clean up
rm -Rf "${distdir}" "${distdir}.zip"

# Generate
"${MAKE}" || exit 1

# Copy
mkdir -p "${distdir}/html/search"
cp \
	html/*.css \
	html/*.html \
	html/*.js \
	html/*.map \
	html/*.md5 \
	html/*.png \
	\
	"${distdir}/html/" || exit 1
cp -R html/search/ "${distdir}/html/" || exit 1

# Package
zip -r "${distdir}.zip" "${distdir}" || exit 1

cat <<INFO
=================================================
${distdir} archives ready for distribution:
${distdir}.zip
=================================================

INFO

# Clean up
rm -Rf "${distdir}"

)
exit $?
