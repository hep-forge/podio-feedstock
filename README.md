# podio-feedstock

[![hep-forge](https://img.shields.io/badge/package-hep--forge%2Fpodio-orange.svg)](https://anaconda.org/hep-forge/podio)
[![Build & Upload](https://github.com/hep-forge/podio-feedstock/actions/workflows/autoupload.yml/badge.svg)](https://github.com/hep-forge/podio-feedstock/actions/workflows/autoupload.yml)
[![Anaconda Version](https://anaconda.org/hep-forge/podio/badges/version.svg)](https://anaconda.org/hep-forge/podio)
[![Anaconda Platforms](https://anaconda.org/hep-forge/podio/badges/platforms.svg)](https://anaconda.org/hep-forge/podio)

Feedstock for [podio](https://github.com/AIDASoft/podio) — part of [hep-forge](https://anaconda.org/hep-forge).
Builds linux-amd64 + linux-arm64 in one matrix workflow and uploads to the
[hep-forge](https://anaconda.org/hep-forge) Anaconda channel.

PODIO is a C++ library to support the creation and handling of data models in particle physics.

## Architectures

| Architecture | Latest published |
|--------------|------------------|
| linux-amd64 (`linux-64`) | ✅ `1.7.0` |
| linux-arm64 (`linux-aarch64`) | ❌ not published |

_As of the last feedstock render; the badges above are live._


## Install

```bash
conda install -c hep-forge -c conda-forge podio
```

## Maintainers

* [@meiyasan](https://github.com/meiyasan/)

