#FROM ubuntu:22.10
#FROM ubuntu:focal-20220113
#FROM ubuntu:20.04@sha256:fd92c36d3cb9b1d027c4d2a72c6bf0125da82425fc2ca37c414d4f010180dc19
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i s/archive.ubuntu.com/mirror.kakao.com/g /etc/apt/sources.list
RUN sed -i s/security.ubuntu.com/mirror.kakao.com/g /etc/apt/sources.list

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y \
    checksec \
    g++ \
    g++-multilib \
    gcc \
    gcc-multilib \
    gdb \
    git \
    htop \
    netcat \
    python3 \
    python3-pip \
    ruby \
    tmux \
    vim

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade pwntools
RUN pip3 install --upgrade ROPgadget

RUN gem install one_gadget

# install pwndbg
WORKDIR /root
RUN mkdir git
WORKDIR /root/git
RUN git clone https://github.com/pwndbg/pwndbg
WORKDIR /root/git/pwndbg
RUN ./setup.sh

# create ctf directory
WORKDIR /root
RUN mkdir ctf

# set .vimrc
COPY ./vimrc/vimrc .vimrc
COPY ./vimrc/vimtxt .vimtxt
