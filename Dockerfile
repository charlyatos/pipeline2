FROM openjdk:8
EXPOSE 8090
ADD build/libs/finalAPIconsultorios-0.0.1-SNAPSHOT.jar src/finalAPIconsultorios-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=release","src/finalAPIconsultorios-0.0.1-SNAPSHOT.jar"]