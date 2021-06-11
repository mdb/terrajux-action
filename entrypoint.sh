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

git_url="${1:-${INPUT_GIT_URL}}"
v1_ref="${2:-${INPUT_V1_REF}}"
v2_ref="${3:-${INPUT_V2_REF}}"
subpath="${4:-${INPUT_SUBPATH}}"

terrajux \
  -difftool "${diff_tool_template}" \
  "${git_url}" \
  "${v1_ref}" \
  "${v2_ref}" \
  "${subpath}"
