#
# Tomcat 9 Dockerfile
#
# https://hub.docker.com/_/tomcat
#

FROM tomcat:9.0.26-jdk8-openjdk-slim

# Copy additional settings to tomcat
#COPY ./setenv.sh /usr/local/tomcat/bin/

# Copy WAR file to tomcat server
RUN rm -rvf /usr/local/tomcat/webapps/ROOT
COPY ./target/sample-0.0.1.war /usr/local/tomcat/webapps/ROOT.war


WORKDIR /usr/local/tomcat

EXPOSE 8080