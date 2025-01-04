#Which "official Java image" ?
# FROM maven:3.8.5-openjdk-17
FROM maven:latest
#working directory
WORKDIR /app
#copy from your Host(PC, laptop) to container
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
EXPOSE 8080
#run inside container
CMD ["mvn","spring-boot:run"]