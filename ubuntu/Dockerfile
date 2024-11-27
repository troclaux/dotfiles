FROM ubuntu:latest

RUN apt-get update && \
  apt-get upgrade -y

RUN apt install -y ansible

WORKDIR /root/dotfiles

ENTRYPOINT ["/bin/bash"]

CMD ["ansible-playbook", "local.yml", "-K"]
