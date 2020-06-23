#!/usr/bin/env bash

#env=${1:-pyspark_ai}
env=pyspark_ai
PATH=/opt/conda/bin:$PATH

if [[ "$(conda env list | grep $env)" != "" ]]; then
    conda remove -n $env
fi

conda create -y -n $env -c conda-forge -c pytorch \
    python=3.7 ipython \
    loguru \
    findspark \
    pytorch torchvision cpuonly transformers

conda pack -n $env -o env_$env.tar.gz 
