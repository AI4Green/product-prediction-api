#!/bin/bash

export ASKCOS_REGISTRY=registry.gitlab.com/mlpds_mit/askcosv2

export DATA_NAME="USPTO_480k_mix"
export TRAIN_FILE=$PWD/data/USPTO_480k_mix/raw/raw_train.csv
export VAL_FILE=$PWD/data/USPTO_480k_mix/raw/raw_val.csv
export TEST_FILE=$PWD/data/USPTO_480k_mix/raw/raw_test.csv
export NUM_CORES=32

export PROCESSED_DATA_PATH=$PWD/data/$DATA_NAME/processed
export MODEL_PATH=$PWD/checkpoints/$DATA_NAME
export TEST_OUTPUT_PATH=$PWD/results/$DATA_NAME

[ -f $TRAIN_FILE ] || { echo $TRAIN_FILE does not exist; exit; }
[ -f $VAL_FILE ] || { echo $VAL_FILE does not exist; exit; }
[ -f $TEST_FILE ] || { echo $TEST_FILE does not exist; exit; }

bash scripts/preprocess_in_docker.sh
bash scripts/train_in_docker.sh
# bash scripts/train_mGPU_in_docker.sh
bash scripts/predict_in_docker.sh
