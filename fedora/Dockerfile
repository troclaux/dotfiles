FROM fedora:latest

RUN \
    grep -q "max_parallel_downloads=" /etc/dnf/dnf.conf || echo "max_parallel_downloads=5" >> /etc/dnf/dnf.conf && \
    dnf -y update && \
    dnf clean all
    # && dnf -y install python3-pip

RUN dnf -y install ansible

WORKDIR /root/dotfiles

CMD ["/bin/bash"]
