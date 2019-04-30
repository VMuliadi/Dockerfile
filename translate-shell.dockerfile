FROM alpine:3.9
ENV src_lang="id"
ENV dst_lang="en"
ENV words=""
LABEL MAINTAINER=vmuliadi@max-metal.us
RUN apk add git gawk make musl-dev && \
    git clone https://github.com/soimort/translate-shell && \
    cd translate-shell && \
    make install && \
    chmod +x translate
ENTRYPOINT translate-shell/translate ${src_lang}:${dst_lang} ${words}
