FROM centos:7
RUN yum install java-openjdk -y 
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz .
RUN tar -xvf apache-tomcat-9.0.78.tar.gz -C /opt/
WORKDIR /opt
#RUN rm -rvf apache-tomcat-9.0.78.tar.gz
#RUN mv apache-tomcat* /opt/apache-tomcat
RUN mv apache-tomcat* apache-tomcat
COPY ./student.war apache-tomcat/webapps
EXPOSE 8080/tcp
CMD [ "/opt/apache-tomcat/bin/catalina.sh", "run"]
