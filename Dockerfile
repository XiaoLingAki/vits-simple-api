FROM python:3.10.11-slim-bullseye

RUN mkdir -p /app
WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -yq build-essential espeak-ng cmake wget && \
    apt-get clean && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/* 

# Install jemalloc
RUN wget https://github.com/jemalloc/jemalloc/releases/download/5.3.0/jemalloc-5.3.0.tar.bz2 && \
    tar -xvf jemalloc-5.3.0.tar.bz2 && \
    cd jemalloc-5.3.0 && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf jemalloc-5.3.0* && \
    ldconfig 

ENV LD_PRELOAD=/usr/local/lib/libjemalloc.so

RUN pip install torch --index-url https://download.pytorch.org/whl/cpu --no-cache-dir

COPY requirements.txt /app/
RUN pip install --upgrade pip && \
    pip install pyopenjtalk==0.3.2 -i https://pypi.artrajz.cn/simple --no-cache-dir && \
    pip install gunicorn --no-cache-dir && \
    pip install -r requirements.txt --no-cache-dir&& \
    rm -rf /root/.cache/pip/*

COPY . /app

EXPOSE 23456

CMD ["gunicorn", "-c", "gunicorn_config.py", "app:app"]