FROM ubuntu:22.04

RUN apt update && apt install -y lsof procps

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#ENTRYPOINT ["/entrypoint.sh"]
