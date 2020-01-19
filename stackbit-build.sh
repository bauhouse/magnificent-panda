#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e220f50a39b6c001a527e2b/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e220f50a39b6c001a527e2b
curl -s -X POST https://api.stackbit.com/project/5e220f50a39b6c001a527e2b/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e220f50a39b6c001a527e2b/webhook/build/publish > /dev/null
