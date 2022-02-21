FROM openjdk:8
EXPOSE 8090
#ADD <La carpeta de donde tomara el JAR> <el directorio en donde lo agregara, en este caso al poner / lo guarda en la raiz>
ADD gradle/wrapper/gradle-wrapper.jar /
ENTRYPOINT ["java","-jar","/gradle-wrapper.jar"]