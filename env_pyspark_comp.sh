#!/usr/bin/env bash

#env=${1:-pyspark}
env=pyspark_comp
PATH=/opt/conda/bin:$PATH

if [[ "$(conda env list | grep $env)" != "" ]]; then
    conda remove -n $env
fi

conda create -y -n $env -c conda-forge \
    python=3.7 ipython \
    loguru \
    findspark \
    datacompy

conda pack -n $env -o /workdir/env_$env.tar.gz
