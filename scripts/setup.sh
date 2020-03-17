#!/usr/bin/env bash
pip install unidecode
pip install "git+https://github.com/NVIDIA/dllogger"
export CUDA_HOME=/usr/local/cuda-10.1
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" "git+https://github.com/NVIDIA/apex"