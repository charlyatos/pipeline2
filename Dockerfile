FROM openjdk:8
EXPOSE 8090
COPY --from=build /libs/finalAPIconsultorios-0.0.1-SNAPSHOT.jar /bin/
#ADD build/libs/finalAPIconsultorios-0.0.1-SNAPSHOT.jar /finalAPIconsultorios-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","bin/finalAPIconsultorios-0.0.1-SNAPSHOT.jar"]