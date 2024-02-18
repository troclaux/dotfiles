FROM ubuntu:latest

RUN apt-get update && \
    apt-get upgrade -y

RUN apt install -y ansible

# RUN echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc 

WORKDIR /root/dotfiles

CMD ["/bin/bash"]
