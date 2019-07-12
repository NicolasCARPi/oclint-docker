# oclint-docker

## Description

This is the repo hosting the Dockerfile for building the oclint-docker image.

If you want to use oclint but don't want to install it on your computer, use the docker image!

## Build

~~~bash
git clone https://github.com/NicolasCARPi/oclint-docker
cd oclint-docker
docker build -t oclint/oclint .
~~~

## Usage

~~~bash
docker run --rm oclint/oclint --help
~~~

You can even make an alias to use it like you would normally do:

~~~bash
alias oclint="docker run --rm oclint/oclint"
# you can then do this directly
oclint --help
~~~
