FROM openjdk:8
EXPOSE 8090
#COPY --from=build /libs/finalAPIconsultorios-0.0.1-SNAPSHOT.jar /
ADD gradle/wrapper/gradle-wrapper.jar /
ENTRYPOINT ["java","-jar","/gradle-wrapper.jar"]