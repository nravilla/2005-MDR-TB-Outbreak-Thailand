#!/bin/bash

# Initialize conda
source /opt/conda/etc/profile.d/conda.sh

# Activate base environment
conda activate base

# Use mamba to install packages quickly from conda-forge
mamba install -y -c conda-forge \
    folium=0.14.0 \
    branca=0.6.0 \
    ipywidgets \
    ipython \
    ipykernel \
    jupyterlab \
    nodejs \
    jinja2=3.1.2 \
    xlrd \
    networkx=3.2 \
    missingno=0.5.2 \
    bokeh=3.3 \
    pandas=2.2

# Upgrade pip and install PyPI packages
pip install --upgrade pip
pip install \
    pyviz \
    plotly==5.20.0

# Deactivate
conda deactivate

