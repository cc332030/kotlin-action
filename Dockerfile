FROM ibm-semeru-runtimes:open-17-jdk-focal

RUN apt update && apt install -y \
    openssh-client gnupg gnupg2 \
    curl

ADD *.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
