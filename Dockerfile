FROM superruzafa/tinytex

RUN apk update && \
    apk add \
        make \
        inotify-tools


RUN tlmgr update --self && \
    tlmgr install \
        pgf \
        standalone
