#!/bin/bash

env=${1:-pyspark_ai}

if [[ "$(conda env list | grep $env)" != "" ]]; then
    conda remove -n $env
fi

conda create -y -n $env \
    python=3.7 ipython \
    loguru \
    findspark \
    pytorch torchvision cpuonly transformers \
    -c conda-forge -c pytorch

conda pack -n $env -o env_$env.tar.gz 
