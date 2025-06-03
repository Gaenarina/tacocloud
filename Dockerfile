FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-slim
WORKDIR /app
COPY --from=build /target/lec25.3-0.0.1-SNAPSHOT.jar taco.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "taco.jar"]


#FROM maven:3.8.5-openjdk-17 AS build
#COPY . .
#RUN mvn clean package -DskipTests

#FROM openjdk:17-slim
#COPY --from=build /lec25.3-0.0.1-SNAPSHOT.jar taco.jar
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","taco.jar"]
