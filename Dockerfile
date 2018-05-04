FROM base/archlinux

RUN pacman --noconfirm -Sy && \
        pacman --noconfirm -S jdk8-openjdk maven apache-ant nodejs npm yarn && \
        (echo -e "y\ny\n" | pacman -Scc)

RUN npm install -g --unsafe-perm phantomjs
