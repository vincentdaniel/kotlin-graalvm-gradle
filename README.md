# Kotlin Graal VM example with Gradle

## Jar vs Native image

Build and run the jar:
```
> ./gradlew shadowJar
> time java -jar build/libs/kotlin-graalvm-gradle-1.0-SNAPSHOT-all.jar test
Hello world - [test]
java -jar build/libs/kotlin-graalvm-gradle-1.0-SNAPSHOT-all.jar test  0.08s user 0.03s system 100% cpu 0.114 total
```

Build and run the native binary:
```
> ./gradlew nativeImage
> time ./build/graal/hello-world test
Hello world - [test]
./build/graal/hello-world test  0.00s user 0.00s system 65% cpu 0.006 total
```

## Docker with Jar vs Native image

Build and run a docker image using the jar:
```
> docker build -t kotlin-graalvm-jar -f Dockerfile-jar .
> docker run --rm kotlin-graalvm-jar:latest
Hello world - []
> docker run --rm kotlin-graalvm-jar:latest java -jar kotlin-graalvm-gradle-1.0-SNAPSHOT-all.jar test
Hello world - [test]
```

Build and run a docker image using the native binary:
```
> docker build -t kotlin-graalvm-native .
> docker run --rm kotlin-graalvm-native:latest
Hello world - []
> docker run --rm kotlin-graalvm-native:latest ./hello-world test
Hello world - [test]
```
