FROM ubuntu:xenial

RUN apt-get update \
    && apt-get install -y python-pip wget nasm git \
    && pip install --upgrade pip \
    && pip install awscli \
    && wget https://github.com/mozilla/mozjpeg/releases/download/v3.2/mozjpeg-3.2-release-source.tar.gz \
    && tar -zxf mozjpeg-3.2-release-source.tar.gz \
    && rm -f mozjpeg-3.2-release-source.tar.gz \
    && cd mozjpeg \
    && ./configure \
    && make \
    && make install \
    && ln -s /opt/mozjpeg/bin/* /usr/local/bin \
    && cd ../ \
    && wget https://github.com/google/zopfli/archive/zopfli-1.0.1.tar.gz \
    && tar -zxf zopfli-1.0.1.tar.gz \
    && rm -f zopfli-1.0.1.tar.gz \
    && cd zopfli-zopfli-1.0.1 \
    && make \
    && ln -s /zopfli-zopfli-1.0.1/zopfli /usr/local/bin/