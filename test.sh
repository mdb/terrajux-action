#!/bin/sh

set -o nounset -e

git_url="https://github.com/terraform-aws-modules/terraform-aws-iam.git"
v1_ref="v3.15.0"
v2_ref="v3.16.0"
subpath="."

/entrypoint.sh \
  "${git_url}" \
  "${v1_ref}" \
  "${v2_ref}" \
  "${subpath}"

INPUT_GIT_URL="${git_url}" \
INPUT_V1_REF="${v1_ref}" \
INPUT_V2_REF="${v2_ref}" \
INPUT_SUBPATH="${subpath}" \
/entrypoint.sh

rm -rf /root/.terrajux/cache/github.com/
