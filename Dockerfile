FROM gliderlabs/alpine:3.4
ENTRYPOINT ["/bin/logspout"]
VOLUME /mnt/routes
EXPOSE 80

COPY . /src
RUN cd /src && ./build.sh "$(cat VERSION)"

COPY ./build.sh /src/build.sh
COPY ./modules.go /src/modules.go
RUN cd /src && ./build.sh "$(cat VERSION)-custom"
