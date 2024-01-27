FROM tomcat:8
COPY ./target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

#first to get the war files do mvn clean install , then target folder will create, do cd target then u will get hello-world. war file ,
#and in docker file copy  ./target/*.war /usr/local/tomcat/webapps/

#steps: mvn clean install
#docker  build -t hello . ............hello is image name
# docker run -t -d -p 8082:8080 --name container1 hello .........hello is image name, container1 is container name, p is flag to expose the port 
#8082 is port on which application will run on tomcat server
#<publicip>:8082/hello-world-war-1.0.0, u will get image 
#display like this
#Hello Dhriti!
#It is now Sat Jan 27 05:14:25 UTC 2024
#You are coming from 49.37.178.23
