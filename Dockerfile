FROM alpine:3.14 as builder

RUN wget https://github.com/Wind4/vlmcsd/releases/download/svn1113/binaries.tar.gz && \
	tar -zxvf binaries.tar.gz

FROM alpine:3.14

COPY --from=builder /binaries/Linux/intel/static/vlmcsd-x64-musl-static .

EXPOSE 1688

CMD ./vlmcsd-x64-musl-static -L 0.0.0.0:1688 -e -D
