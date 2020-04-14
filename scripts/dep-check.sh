#!/bin/bash

set -e

bundle-audit version && bundle-audit update

DOWNLOAD_URL="https://bintray.com/jeremy-long/owasp/download_file?file_path=dependency-check-5.3.2-release.zip"
ZIP=dependency-check.zip
REPORT_DIR=log/
PROJECT=kraken

_DEPCHECK=./dependency-check/bin/dependency-check.sh

install() {
  wget ${DOWNLOAD_URL} -q -O ${ZIP}
  unzip ${ZIP}
  rm ${ZIP}
}

[[ -f ${_DEPCHECK} ]] || install
mkdir -p ${REPORT_DIR}
${_DEPCHECK} --disableNodeJS --disableNodeAudit --format HTML \
  --suppression suppression.xml --failOnCVSS 0 --project ${PROJECT} --scan . \
  --exclude 'dependency-check/' --exclude 'vendor/' --exclude 'coverage/' \
  -out ${REPORT_DIR}