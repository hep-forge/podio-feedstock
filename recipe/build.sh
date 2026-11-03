#!/usr/bin/env bash

# Install conda activate/deactivate scripts
mkdir -p build-scripts
cd build-scripts
cmake "$RECIPE_DIR/scripts"
cd ..

EXTRA_ARGS=()
if [[ "$(uname)" == "Darwin" ]]; then
    EXTRA_ARGS+=(-DPython_EXECUTABLE="${PREFIX}/bin/python" -DPython_FIND_STRATEGY=LOCATION)
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
