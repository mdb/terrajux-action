#!/bin/sh

set -o nounset -e

/entrypoint.sh \
  "terraform-aws-modules/terraform-aws-iam" \
  "v3.15.0" \
  "v3.14.0" \
  "."

rm -rf /root/.terrajux/cache/github.com/
