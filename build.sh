#!/bin/bash

/opt/homebrew/Cellar/llvm/19.1.7/bin/clang \
    -Wall \
    -Werror \
    -Os \
    -DCLAY_WASM \
    -mbulk-memory \
    --target=wasm32 \
    -nostdlib \
    -Wl,--strip-all \
    -Wl,--export-dynamic \
    -Wl,--no-entry \
    -Wl,--export=__heap_base \
    -Wl,--export=ACTIVE_RENDERER_INDEX \
    -Wl,--initial-memory=6553600 \
    -o build/index.wasm \
    main.c && \
cp index.html build/index.html && \
cp -r fonts/ build/fonts && \
cp -r images/ build/images
