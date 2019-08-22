FROM openjdk:12.0 AS builder

ADD . .
RUN yum -y install gcc zlib-devel
RUN ./gradlew nativeImage

FROM oraclelinux:7-slim

COPY --from=builder /build/graal/hello-world .

CMD ./hello-world
