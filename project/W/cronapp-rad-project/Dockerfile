FROM maven:3.5-jdk-11 as maven_builder

WORKDIR /app

ADD pom.xml .

RUN mvn dependency:resolve

ADD . .

ADD . .

RUN mvn clean package

FROM tomcat:9.0.17-jre11

COPY --from=maven_builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war