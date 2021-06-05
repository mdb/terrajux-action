#!/bin/sh

set -o nounset -e

diff_tool_template="git \
  --no-pager \
  -c advice.detachedHead= \
  diff \
    --color=auto \
    --no-ext-diff \
    --no-index \
    --ignore-all-space \
    {{ .V1 }} {{ .V2 }}"

giturl="${1}"
v1ref="${2}"
v2ref="${3}"
subpath="${4}"

terrajux \
  -difftool "${diff_tool_template}" \
  "https://github.com/${giturl}.git" \
  "${v1ref}" \
  "${v2ref}" \
  "${subpath}"
