FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive \ 
    DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get -y update && \
    apt-get -y upgrade && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends pandoc && \
    apt-get -y install --no-install-recommends texlive && \
    apt-get -y install --no-install-recommends texlive-latex-recommended texlive-pictures texlive-latex-extra && \
    apt-get -y install --no-install-recommends texlive-fonts-recommended texlive-fonts-extra && \
    apt-get -y install --no-install-recommends lmodern && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

COPY eisvogel.latex /usr/share/pandoc/data/templates/

WORKDIR /mount
