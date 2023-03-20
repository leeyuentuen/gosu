#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

set -x
rm -f gosu*.asc SHA256SUMS.asc
ls -la gosu*
gpg --batch --generate-key
ls -la gosu*
for f in gosu*; do
	gpg --output "$f.asc" --detach-sign "$f"
done
sha256sum gosu* > SHA256SUMS
gpg --output SHA256SUMS.asc --detach-sign SHA256SUMS
ls -lFh gosu* SHA256SUMS*
