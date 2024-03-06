FROM ubuntu:latest

RUN apt-get update && \
  apt-get upgrade -y

RUN apt install -y ansible

WORKDIR /root/dotfiles

CMD ["/bin/bash"]
