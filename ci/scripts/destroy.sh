#!/bin/bash

exec >&2
set -e

source pipeline/ci/scripts/common.sh

function unstage_product() {
  log "Unstaging product: $PRODUCT_NAME"

  om -t $OM_TARGET \
    $om_options \
    unstage-product \
    -p $PRODUCT_NAME
}

unstage_product
if [[ "${DRY_RUN,,}" != "true" ]] ; then
  apply_changes
else
  log "Dry run ... Skipping apply changes"
fi
