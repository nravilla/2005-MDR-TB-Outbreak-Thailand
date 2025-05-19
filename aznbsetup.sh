#!/bin/bash

# Initialize conda (this sets up the 'conda' command)
source /opt/conda/etc/profile.d/conda.sh

# Activate base environment
conda activate base

# Update Conda (optional, can be skipped to avoid slowing builds)
# mamba install -n base -c conda-forge conda

# Use mamba for fast installs
mamba install -y -c conda-forge \
    folium=0.14.0 \
    jinja2=3.1.2 \
    xlrd \
    networkx=3.2 \
    missingno=0.5.2 \
    bokeh=3.3 \
    pandas=2.2

# Upgrade pip and install extra Python packages
pip install --upgrade pip
pip install pyviz plotly==5.20.0

# Deactivate environment
conda deactivate
