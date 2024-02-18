FROM ubuntu:latest

    && apt install -y python3-pip
RUN apt-get update && \
    apt-get upgrade -y

RUN pip install ansible

# RUN echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc 

WORKDIR /root/dotfiles

CMD ["/bin/bash"]
