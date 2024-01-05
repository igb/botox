# botox
Project for running "autotune" experiments using a black-box experimentation engine. In this configuration this engine is based on BoTorch and Ax.

## Requirements

Python3, Ax, Botorch, Autotune Demos

## Installation

Run install.sh to install Botorch and Ax.

## Running

```
python3 botoxsvc 10
```

## Processing Reuslts
```
xsltproc scores.xslt results.xml > report.html