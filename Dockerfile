FROM nvidia/cuda:11.3.1-base
RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt update\
  && apt install -y python3 python3-pip wget git  curl\
  && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y nvidia-cuda-toolkit

RUN pip3 install --upgrade pip

COPY requirements.txt ${PWD}

# pythonのパッケージをインストール
RUN pip3 install torch==1.11.0+cu113 -f https://download.pytorch.org/whl/torch_stable.html
RUN pip install -r requirements.txt