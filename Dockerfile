FROM base/archlinux

RUN sed -i '/\[options\]/a IgnorePkg = nodejs' /etc/pacman.conf

RUN pacman --noconfirm -Sy && \
        pacman --noconfirm -S unzip git vim jdk8-openjdk maven apache-ant nodejs && \
        pacman --noconfirm -U https://archive.archlinux.org/packages/n/nodejs/nodejs-9.11.1-1-x86_64.pkg.tar.xz && \
	pacman --noconfirm -S npm yarn && \
        (echo -e "y\ny\n" | pacman -Scc)

RUN npm install -g --unsafe-perm phantomjs webpack

# setup default locale = en_US.UTF-8
RUN sed -i '/#\(ru_RU.UTF\|en_US.UTF\)/s/^#//' /etc/locale.gen
RUN locale-gen
ENV LANG="en_US.UTF-8"
