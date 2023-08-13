# Auto Generated Dockerfile
FROM ghcr.io/graalvm/native-image-community:17-ol9 as build

WORKDIR /app/build

COPY hello.jar .

RUN native-image -jar hello.jar -H:Name=hello --no-fallback -H:+StaticExecutableWithDynamicLibC

FROM gcr.io/distroless/base

WORKDIR /home/ballerina

EXPOSE  9090
COPY --from=build /app/build/hello .

CMD ["./hello"]

