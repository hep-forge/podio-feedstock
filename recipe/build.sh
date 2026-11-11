#!/usr/bin/env bash

# Install conda activate/deactivate scripts
mkdir -p build-scripts
cd build-scripts
cmake "$RECIPE_DIR/scripts"
cd ..

# No exact match with the python conda-forge's ROOT was built with (its
# ROOTConfig records e.g. 3.12.14; the host has some 3.12.x): podio only
# needs the same minor, which root_base's own python_abi pin guarantees.
# The host's python, the one root_base was built for, for both FindPython
# flavours: otherwise they pick another one (macOS: the runner's
# /Library/Frameworks python; linux-aarch64: the build env's 3.14).
EXTRA_ARGS=(-DPODIO_RELAX_PYVER=ON
            -DPython_EXECUTABLE="${PREFIX}/bin/python" -DPython_FIND_STRATEGY=LOCATION
            -DPython3_EXECUTABLE="${PREFIX}/bin/python" -DPython3_FIND_STRATEGY=LOCATION)
if [[ "$(uname)" == "Darwin" ]]; then
    EXTRA_ARGS+=(-DPython3_FIND_FRAMEWORK=NEVER)
fi

cmake -S . -B build "${EXTRA_ARGS[@]}" \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_SIO=OFF \
    -DENABLE_JULIA=OFF \
    -DBUILD_TESTING=OFF \
    -DENABLE_TESTING=OFF

cmake --build build --parallel "${CPU_COUNT}"
cmake --install build
