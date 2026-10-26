#!/bin/sh
# Validate with the published compatibility target, then check serialization.
set -eu
GLX=${GLX:-glx}
case "$GLX" in /*) ;; */*) GLX="$(pwd)/$GLX" ;; esac
root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT HUP INT TERM
"$GLX" --version
"$GLX" validate "$root"
"$GLX" join "$root" "$tmp/joined.glx"
"$GLX" validate "$tmp/joined.glx"
"$GLX" split "$tmp/joined.glx" "$tmp/split"
# beta.12 split writes standard vocabularies over custom definitions. Preserve
# the archive's definitions before loading its otherwise unchanged entities.
cp "$root"/vocabularies/*.glx "$tmp/split/vocabularies/"
"$GLX" validate "$tmp/split"
"$GLX" join "$tmp/split" "$tmp/rejoined.glx"
cmp "$tmp/joined.glx" "$tmp/rejoined.glx"
printf '%s\n' 'Archive validation and vocabulary-preserving roundtrip passed.'
