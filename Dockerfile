FROM gliderlabs/alpine:3.4
ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 80

COPY . /src
RUN chmod a+x /src/build.sh
RUN cd /src && ./build.sh "$(cat VERSION)"


RUN cd /src && ./build.sh "$(cat VERSION)-custom"
