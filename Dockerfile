FROM alpine:3.12

#
MAINTAINER tomoyamkung <tsuyoshi.sugiyama@gmail.com>

#
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        bash \
        openjdk11-jre-headless curl bash
RUN curl -L -o sbt-1.3.13.tgz https://piccolo.link/sbt-1.3.13.tgz && \
    tar -xvzf sbt-1.3.13.tgz && \
    rm sbt-1.3.13.tgz

#
ENV USER dev
ENV HOME /home/${USER}
ENV WORK_PRODUCT_HOME ${HOME}
ENV SHELL /bin/bash
ENV PATH $PATH:/sbt/bin

#
RUN echo 'root:root' | chpasswd
RUN adduser -S dev \
    && echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && echo 'dev:12345678' | chpasswd

#
USER ${USER}
WORKDIR ${WORK_PRODUCT_HOME}

#
RUN sbt -V
# CMD ["bash"]
