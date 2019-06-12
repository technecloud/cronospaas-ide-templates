<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>spring-boot-starter-parent</artifactId>
        <groupId>org.springframework.boot</groupId>
        <version>2.0.1.RELEASE</version>
        <relativePath>../pom.xml</relativePath>
    </parent>
    <modelVersion>4.0.0</modelVersion>
    <groupId>${appid}</groupId>
    <artifactId>${appid}</artifactId>
    <packaging>war</packaging>
    <name>${appname}</name>
    <version>1.0-SNAPSHOT</version>
    <url>http://maven.apache.org</url>
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.3</version>
                <configuration>
                    <source>1.8</source>
                    <target>1.8</target>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>2.6</version>
                <configuration>
                    <warSourceDirectory>src/main/webapp</warSourceDirectory>
                    <failOnMissingWebXml>false</failOnMissingWebXml>
                </configuration>
            </plugin>
        </plugins>
    </build>
    <repositories>
        <repository>
            <id>libs-release</id>
            <name>artifactory-cronapp-release</name>
            <url>https://artifactory.cronapp.io/libs-release</url>
        </repository>
        <repository>
            <id>libs-snapshot</id>
            <name>artifactory-cronapp-snapshot</name>
            <url>https://artifactory.cronapp.io/libs-snapshot</url>
        </repository>
    </repositories>
    <dependencies>
        <dependency>
            <groupId>com.h2database</groupId>
            <artifactId>h2</artifactId>
            <version>1.4.197</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter</artifactId>
            <scope>compile</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>compile</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
            <scope>compile</scope>
            <exclusions>
                <exclusion>
                    <artifactId>hibernate-entitymanager</artifactId>
                    <groupId>org.hibernate</groupId>
                </exclusion>
            </exclusions>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <scope>compile</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-tomcat</artifactId>
            <scope>provided</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
        </dependency>
        <dependency>
            <groupId>io.cronapp</groupId>
            <artifactId>cronapi-java</artifactId>
            <version>1.23.0-SNAPSHOT</version>
            <exclusions>
                <exclusion>
                    <artifactId>commons-lang3</artifactId>
                    <groupId>org.apache.commons</groupId>
                </exclusion>
                <exclusion>
                    <artifactId>junit</artifactId>
                    <groupId>junit</groupId>
                </exclusion>
            </exclusions>
        </dependency>
        <dependency>
            <groupId>io.cronapp</groupId>
            <artifactId>cronapp-framework-java</artifactId>
            <version>1.23.0-SNAPSHOT</version>
        </dependency>
        <dependency>
            <groupId>io.cronapp</groupId>
            <artifactId>cronapp-reports-exec</artifactId>
            <version>1.23.0-SNAPSHOT</version>
        </dependency>
        <dependency>
            <groupId>org.eclipse.persistence</groupId>
            <artifactId>eclipselink</artifactId>
            <version>2.6.0</version>
        </dependency>
    </dependencies>
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        <project.cronospass.resource mimetype="folder/src">src/test/java</project.cronospass.resource>
        <project.cronospass.resource mimetype="folder/libs">lib</project.cronospass.resource>
        <project.cronospass.resource mimetype="folder/web">src/main/webapp</project.cronospass.resource>
        <project.cronospass.resource mimetype="folder/servercontext">config</project.cronospass.resource>
        <project.cronospass.resource mimetype="folder/src">src/main/java</project.cronospass.resource>
    </properties>
</project>