FROM fedora:latest

RUN \
  grep -q "max_parallel_downloads=" /etc/dnf/dnf.conf || echo "max_parallel_downloads=5" >> /etc/dnf/dnf.conf && \
  dnf -y update && \
  dnf clean all

RUN dnf -y install ansible
RUN dnf -y install git
RUN dnf -y install gcc
RUN dnf -y install gcc-c++
RUN dnf -y install ripgrep
RUN dnf -y install fd-find
RUN dnf -y install neovim

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim
RUN rm -rf ~/.config/nvim/.git

WORKDIR /root

CMD ["/bin/bash"]
