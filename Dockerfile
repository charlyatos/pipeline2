FROM openjdk:8
EXPOSE 8090
#COPY --from=build /libs/finalAPIconsultorios-0.0.1-SNAPSHOT.jar /
ADD build/libs/finalAPIconsultorios-0.0.1-SNAPSHOT.jar /
ENTRYPOINT ["java","-jar","/finalAPIconsultorios-0.0.1-SNAPSHOT.jar"]