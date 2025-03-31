# Etapa 1: Build da aplicação
FROM maven:3.8.6-openjdk-17 AS build
LABEL authors="julioczar"

WORKDIR /app
COPY . .

RUN mvn clean install

# Etapa 2: Imagem final para rodar a aplicação
FROM openjdk:17-jdk-slim

WORKDIR /app
COPY --from=build /app/target/chatzinho-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "app.jar" ]
