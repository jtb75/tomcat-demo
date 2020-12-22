FROM tomcat:8.0-alpine
LABEL maintainer="joe.buhr@gmail.com"
LABEL version="1.BUILDNUMBER"

ADD sample.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
