FROM ubuntu:latest

RUN apt-get update \
    && apt-get upgrade -y \
    && apt install -y python3-pip

RUN pip install ansible

# RUN echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc 

WORKDIR .

CMD ["/bin/bash"]
