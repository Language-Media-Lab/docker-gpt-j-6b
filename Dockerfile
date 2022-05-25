FROM nvidia/cuda:11.1-base
RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt update\
  && apt install -y python3 python3-pip wget git  curl\
  && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y nvidia-cuda-toolkit

COPY requirements.txt ${PWD}

# pythonのパッケージをインストール
RUN pip install -r requirements.txt