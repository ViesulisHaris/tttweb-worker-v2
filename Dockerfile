# Lightweight Dockerfile - extends pre-built base image.
# Base has: models, python deps, handler patch — all baked in.
# This just adds custom nodes and starts the worker.
FROM viesulishs/tttweb-base:latest

# Custom nodes
WORKDIR /comfyui/custom_nodes
RUN git clone --depth=1 https://github.com/kijai/ComfyUI-WanVideoWrapper && \
    git clone --depth=1 https://github.com/kijai/ComfyUI-KJNodes && \
    git clone --depth=1 https://github.com/rgthree/rgthree-comfy && \
    git clone --depth=1 https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite && \
    git clone --depth=1 https://github.com/kijai/ComfyUI-WanAnimatePreprocess && \
    git clone --depth=1 https://github.com/yolain/ComfyUI-Easy-Use && \
    git clone --depth=1 https://github.com/chflame163/ComfyUI_LayerStyle && \
    git clone --depth=1 https://github.com/cubiq/ComfyUI_essentials && \
    git clone --depth=1 https://github.com/fq393/ComfyUI-ZMG-Nodes && \
    git clone --depth=1 https://github.com/kijai/ComfyUI-segment-anything-2 && \
    git clone --depth=1 https://github.com/hanjangma41/NEW-UTILSs && \
    git clone --depth=1 https://github.com/plugcrypt/CRT-Nodes && \
    git clone --depth=1 https://github.com/evanspearman/ComfyMath && \
    git clone --depth=1 https://github.com/teskor-hub/comfyui-teskors-utils && \
    git clone --depth=1 https://github.com/jnxmx/ComfyUI_HuggingFace_Downloader && \
    git clone --depth=1 https://github.com/reasj2/comfyui-animator-nodes && \
    for req in /comfyui/custom_nodes/*/requirements.txt; do \
        pip install --no-cache-dir -r "$req" 2>/dev/null || true; \
    done && \
    find /comfyui/custom_nodes -name ".git" -type d -exec rm -rf {} + 2>/dev/null; \
    echo "All custom nodes installed"

WORKDIR /
