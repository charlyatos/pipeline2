FROM openjdk:8
EXPOSE 8090
ADD build/libs/finalAPIconsultorios-0.0.1-SNAPSHOT.jar primerDeployJAVA
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=release","build/libs/finalAPIconsultorios-0.0.1-SNAPSHOT.jar"]