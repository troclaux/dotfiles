FROM ubuntu:latest

RUN apt-get update \
    && apt-get upgrade -y \
    && apt install -y python3-pip \
    && python3 -m pip install --user ansible \
    && export PATH=$PATH:/root/.local/bin

VOLUME /home/dotfiles

WORKDIR /home

CMD ["/bin/bash"]
