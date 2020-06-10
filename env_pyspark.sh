#!/bin/bash

env=${1:-pyspark}

if [[ "$(conda env list | grep $env)" != "" ]]; then
    conda remove -n $env
fi

conda create -y -n $env \
    python=3.7 ipython \
    loguru \
    findspark \

conda pack -n $env -o env_$env.tar.gz 
