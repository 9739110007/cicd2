FROM tomcat:8
COPY ./target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

#first to get the war files do mvn clean install , then target folder will create, do cd target then u will get hello-world. war file ,
#and in docker file copy  ./target/*.war /usr/local/tomcat/webapps/
