# oclint in a docker container

FROM ubuntu:16.04

# don't add the v in front here
ENV OCLINT_VERSION 0.13

LABEL org.label-schema.name="oclint" \
    org.label-schema.description="A static source code analysis tool to improve quality and reduce defects for C, C++ and Objective-C" \
    org.label-schema.url="http://oclint.org/" \
    org.label-schema.vcs-url="https://github.com/oclint/oclint" \
    org.label-schema.version=$OCLINT_VERSION \
    org.label-schema.maintainer="labs+contact@ryuichi.co" \
    org.label-schema.schema-version="1.0"

# install build dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    cmake \
    git \
    libssl-dev \
    ninja-build \
    python \
    subversion && \
    rm -rf /var/lib/apt/lists/*

# clone and build
RUN git clone -b v$OCLINT_VERSION https://github.com/oclint/oclint /app && \
    cd /app/oclint-scripts && ./make

RUN ln -sf /app/build/oclint-$OCLINT_VERSION/bin/oclint /usr/bin/oclint

CMD ["/usr/bin/oclint"]
