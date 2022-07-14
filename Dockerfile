FROM ibm-semeru-runtimes:open-17-jdk

RUN apt update && apt install -y \
    openssh-client gnupg gnupg2 \
    curl \
    unzip

RUN C_GITHUB_URL=https://github.com/cc332030
RUN curl -sL $C_GITHUB_URL/kotlin/raw/main/script/init-kotlin/init-kotlin.sh | sh

ADD *.sh /

RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
