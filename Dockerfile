FROM nvidia/cuda:12.8.0-cudnn-devel-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update

RUN apt-get install -y \
        python3.11 \
        python3.11-dev \
        python3.11-venv \
        net-tools \
        wget \
        vim \
        lsof \
        git \
        iputils-ping

RUN apt-get install -yqq --no-install-recommends locales
RUN apt-get install -y python3-pip

RUN localedef -i en_US -f UTF-8 en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LC_MESSAGES=en_US.UTF-8

RUN apt-get update
RUN rm -rf /var/lib/apt/lists/*


# # Anaconda 설치
# WORKDIR /tmp
# COPY ./Anaconda3-2024.10-1-Linux-x86_64.sh /tmp
# RUN bash Anaconda3-2024.10-1-Linux-x86_64.sh -b -p /root/anaconda3 && \
#     rm Anaconda3-2024.10-1-Linux-x86_64.sh

# # PATH 환경 변수 설정
# ENV PATH="/root/anaconda3/bin:${PATH}"

# 작업 디렉토리 설정
WORKDIR /workspace

# # Conda 초기화 및 Jupyter 설치
# RUN /root/anaconda3/bin/conda init bash && \
#     /root/anaconda3/bin/conda install -y jupyterlab jupyter

# Python3 심볼릭 링크를 명확히 설정
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1 && \
    update-alternatives --config python3

    
# Huggingface 환경변수 설정
# Hugging Face 캐시 디렉토리 설정
ENV HF_HOME="/workspace/.cache/huggingface"

# Hugging Face 캐시 디렉토리 생성 및 권한 설정
RUN mkdir -p ${HF_HOME} && chmod -R 777 ${HF_HOME}
    

## venv 설정
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
ENV VIRTUAL_ENV="/opt/venv"

# venv 권한 문제 예방
RUN chmod -R 777 /opt/venv

COPY ./requirements.txt /requirements.txt

# venv 환경에서 pip 패키지 설치
RUN /opt/venv/bin/python -m pip install --upgrade pip && \
    /opt/venv/bin/python -m pip install jupyter ipykernel

RUN /opt/venv/bin/python -m pip install --no-cache -r /requirements.txt

# Jupyter 환경을 위한 커널 등록
RUN /opt/venv/bin/python -m ipykernel install --user --name=venv --display-name "My IPython"


CMD ["/bin/bash"]
