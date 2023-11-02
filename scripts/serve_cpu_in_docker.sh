#!/bin/bash

if [ -z "${ASKCOS_REGISTRY}" ]; then
  export ASKCOS_REGISTRY=registry.gitlab.com/mlpds_mit/askcosv2/askcos2_core
fi

docker run -d --rm \
  --name forward_augmented_transformer \
  -p 9510-9512:9510-9512 \
  -v "$PWD/mars":/app/augmented_transformer/mars \
  -t "${ASKCOS_REGISTRY}"/forward_predictor/augmented_transformer:1.0-cpu \
  torchserve \
  --start \
  --foreground \
  --ncs \
  --model-store=/app/augmented_transformer/mars \
  --models \
  pistachio_23Q3=pistachio_23Q3.mar \
  USPTO_STEREO=USPTO_STEREO.mar \
  cas=cas.mar \
  --ts-config ./config.properties
