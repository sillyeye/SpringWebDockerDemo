FROM gradle:jdk17 as builder
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN uname -m && gradle -v && java -version && gradle build --stacktrace

FROM ibm-semeru-runtimes:open-17-jre
RUN mkdir /app
COPY --from=builder /app/build/libs/WebDemo-0.0.1-SNAPSHOT.jar /app
WORKDIR /app

CMD ["java", "-jar", "WebDemo-0.0.1-SNAPSHOT.jar"]