FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

#get deps
RUN apt-get update --fix-missing && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends gcc \
python3-dev python3-pip python3-setuptools git g++ wget make libtiff-dev \
libprotobuf-dev protobuf-compiler libopencv-dev libyaml-dev \
libgoogle-glog-dev libboost-all-dev libhdf5-dev libatlas-base-dev \
libfreetype-dev libfreetype6 libfreetype6-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

#for python api
RUN pip3 install --upgrade pip
RUN pip3 install cython==0.29.37
RUN pip3 install scipy==1.7.1 matplotlib==3.5.1 numpy cython-bbox
RUN git clone https://github.com/ppwwyyxx/cocoapi.git && \
    cd cocoapi/PythonAPI && \
    python3 setup.py install
RUN pip3 install torch==1.12.0+cu113 torchvision --extra-index-url https://download.pytorch.org/whl/cu113

# Get AlphaPose
WORKDIR /workspace
RUN export PATH=/usr/local/cuda/bin/:$PATH
RUN export LD_LIBRARY_PATH=/usr/local/cuda/lib64/:$LD_LIBRARY_PATH
RUN python3 -m pip install git+https://github.com/yanfengliu/cython_bbox.git
RUN git clone https://github.com/braca51e/AlphaPose.git
WORKDIR AlphaPose
RUN export TORCH_CUDA_ARCH_LIST="7.5" && python3 setup.py build develop --user

#get openpose
WORKDIR /workspace
COPY ../models ./AlphaPose/models

