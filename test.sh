#!/bin/sh

set -o nounset -e

repo="https://github.com/terraform-aws-modules/terraform-aws-iam.git"
v1ref="v3.15.0"
v2ref="v3.16.0"
subpath="."

/entrypoint.sh \
  "${repo}" \
  "${v1ref}" \
  "${v2ref}" \
  "${subpath}"

INPUT_REPO="${repo}" \
INPUT_V1REF="${v1ref}" \
INPUT_V2REF="${v2ref}" \
INPUT_SUBPATH="${subpath}" \
/entrypoint.sh

rm -rf /root/.terrajux/cache/github.com/
