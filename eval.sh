#! /usr/bin/env bash

export MODEL_DIR=/var/folders/lm/4n4twcqj7s17bs9lz2_396100000gn/T/nmt_tutorial/
export PRED_DIR=${MODEL_DIR}/pred
export DEV_SOURCES=${HOME}/nmt_data/toy_reverse/dev/sources.txt
mkdir -p ${PRED_DIR}

python3 -m bin.infer \
  --tasks "
    - class: DecodeText" \
  --model_dir $MODEL_DIR \
  --input_pipeline "
    class: ParallelTextInputPipeline
    params:
      source_files:
        - $DEV_SOURCES" \
  tee /dev/tty > ${PRED_DIR}/predictions.txt