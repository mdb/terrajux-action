#!/bin/sh

set -o nounset -e

diff_tool_template="git \
  --no-pager \
  -c advice.detachedHead= \
  diff \
    --color \
    --no-ext-diff \
    --no-index \
    --ignore-all-space \
    {{ .V1 }} {{ .V2 }}"

giturl="${1:=${INPUT_REPO}}"
v1ref="${2:=${INPUT_V1REF}}"
v2ref="${3:=${INPUT_V2REF}}"
subpath="${4:=${INPUT_SUBPATH}}"

terrajux \
  -difftool "${diff_tool_template}" \
  "https://github.com/${giturl}.git" \
  "${v1ref}" \
  "${v2ref}" \
  "${subpath}"
