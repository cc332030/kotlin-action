FROM ibm-semeru-runtimes:open-17-jdk

RUN apt update && apt install -y \
    openssh-client gnupg gnupg2 \
    curl \
    unzip

ADD *.sh /

RUN ["sh", "init.sh"]

RUN ["kotlin", "-version"]

RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
