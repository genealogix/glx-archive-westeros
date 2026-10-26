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
# Inspect the raw split before applying the vocabulary workaround. Joining with
# validation disabled is deliberate here: missing definitions can invalidate it.
"$GLX" join "$tmp/split" "$tmp/raw.glx" --no-validate
if cmp -s "$tmp/joined.glx" "$tmp/raw.glx"; then
  printf '%s\n' 'Raw roundtrip preserved the joined archive byte-for-byte.'
else
  printf '%s\n' 'WARNING: Raw roundtrip changed archive content; checking vocabulary repair.'
  if diff -qr "$root/vocabularies" "$tmp/split/vocabularies"; then
    printf '%s\n' 'Raw roundtrip changed content without a vocabulary-file difference.' >&2
    exit 1
  fi
  if "$GLX" validate "$tmp/split" > "$tmp/raw-validation.log" 2>&1; then
    printf '%s\n' 'Raw split validates, but does not preserve all joined content.'
  else
    printf '%s\n' 'Raw split validation failed before repair:'
    cat "$tmp/raw-validation.log"
  fi
  # beta.12 and main 54459106 replace archive vocabularies with standard ones.
  # This is a repaired roundtrip, not evidence that raw split is lossless.
  cp "$root"/vocabularies/*.glx "$tmp/split/vocabularies/"
fi
"$GLX" validate "$tmp/split"
"$GLX" join "$tmp/split" "$tmp/rejoined.glx"
cmp "$tmp/joined.glx" "$tmp/rejoined.glx"
printf '%s\n' 'Archive checks passed (with vocabulary repair if reported above).'
