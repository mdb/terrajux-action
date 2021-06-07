#!/bin/sh

set -o nounset -e

/entrypoint.sh \
  "terraform-aws-modules/terraform-aws-iam" \
  "v3.15.0" \
  "v3.16.0" \
  "."

INPUT_REPO="terraform-aws-modules/terraform-aws-iam" \
INPUT_V1REF="v3.15.0" \
INPUT_V2REF="v3.14.0" \
INPUT_SUBPATH="." \
/entrypoint.sh

rm -rf /root/.terrajux/cache/github.com/
