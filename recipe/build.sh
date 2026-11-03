#!/usr/bin/env bash

# Install conda activate/deactivate scripts
mkdir -p build-scripts
cd build-scripts
cmake "$RECIPE_DIR/scripts"
cd ..

EXTRA_ARGS=()
if [[ "$(uname)" == "Darwin" ]]; then
    # conda's python for both FindPython flavours (Python3 otherwise picks the
    # runner's /Library/Frameworks one), and no exact match with the python
    # conda-forge's ROOT was built with (3.12.14 vs the host's 3.12.x)
    EXTRA_ARGS+=(-DPython_EXECUTABLE="${PREFIX}/bin/python" -DPython_FIND_STRATEGY=LOCATION
                 -DPython3_EXECUTABLE="${PREFIX}/bin/python" -DPython3_FIND_STRATEGY=LOCATION
                 -DPython3_FIND_FRAMEWORK=NEVER -DPODIO_RELAX_PYVER=ON)
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
