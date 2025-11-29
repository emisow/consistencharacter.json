# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui_ipadapter_plus@2.0.0

# download models into comfyui
RUN comfy model download --url https://huggingface.co/sf3q5ws/duc/blob/main/bigasp_v20.safetensors --relative-path models/checkpoints --filename bigasp_v20.safetensors
RUN comfy model download --url https://huggingface.co/h94/IP-Adapter/resolve/main/sdxl_models/ip-adapter-plus_sdxl_vit-h.safetensors --relative-path models/ipadapter --filename ip-adapter-plus_sdxl_vit-h.safetensors
RUN comfy model download --url https://huggingface.co/ezioruan/inswapper_128.onnx --relative-path models/checkpoints --filename inswapper_128.onnx
RUN comfy model download --url https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.4.pth --relative-path models/face_restore --filename GFPGANv1.4.pth
# RUN # Could not find URL for SD1.5\pytorch_model.bin

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
