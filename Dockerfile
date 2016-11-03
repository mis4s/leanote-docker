FROM alpine:3.3
RUN apk --update add curl && \
    curl -L http://sourceforge.net/projects/leanote-bin/files/2.1/leanote-linux-amd64-v2.1.bin.tar.gz/download >> \
    /usr/local/leanote-linux-amd64-v2.1.bin.tar.gz && \
    apk del --purge curl && \
    rm -rf /var/cache/apk/*

RUN tar -xzvf /usr/local/leanote-linux-amd64-v2.1.bin.tar.gz -C /usr/local
EXPOSE 9004
WORKDIR  /usr/local/leanote/bin
ENTRYPOINT ["sh","run.sh"]