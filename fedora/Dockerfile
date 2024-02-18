FROM fedora:latest

RUN \
    grep -q "max_parallel_downloads=" /etc/dnf/dnf.conf || echo "max_parallel_downloads=5" >> /etc/dnf/dnf.conf && \
    grep -q "fastestmirror=True" /etc/dnf/dnf.conf || echo "fastestmirror=True" >> /etc/dnf/dnf.conf && \
    grep -q "deltarpm=True" /etc/dnf/dnf.conf || echo "deltarpm=True" >> /etc/dnf/dnf.conf && \
    dnf -y update && \
    dnf clean all

RUN dnf -y install ansible

RUN echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc

WORKDIR /root/dotfiles

CMD ["/bin/bash"]
