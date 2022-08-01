FROM ubuntu:22.10
#FROM ubuntu:focal-20220113

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
    python3 \
    python3-pip \
    vim

RUN pip3 install --upgrade pip
RUN pip3 install --upgrade pwntools

# install pwndbg
WORKDIR /root
RUN mkdir git
WORKDIR /root/git
RUN git clone https://github.com/pwndbg/pwndbg
WORKDIR /root/git/pwndbg
RUN ./setup.sh

# set .vimrc
WORKDIR /root
RUN echo "set ruler"                                    > .vimrc
RUN echo "\"set nu"                                     >> .vimrc
RUN echo "set sw=4"                                     >> .vimrc
RUN echo "set ts=4"                                     >> .vimrc
RUN echo "set expandtab"                                >> .vimrc
RUN echo "set hlsearch"                                 >> .vimrc
RUN echo "if has(\"syntax\")"                           >> .vimrc
RUN echo "    syntax on"                                >> .vimrc
RUN echo "endif"                                        >> .vimrc
RUN echo "autocmd filetype make set noexpandtab"        >> .vimrc
RUN echo "autocmd filetype cpp set ts=2 sw=2"           >> .vimrc
RUN echo "set colorcolumn=80"                           >> .vimrc
RUN echo "highlight colorcolumn ctermbg=1"              >> .vimrc
RUN echo "autocmd filetype tex set spell"               >> .vimrc
