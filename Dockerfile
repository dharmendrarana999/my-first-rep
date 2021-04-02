FROM tomcat

ADD target/helloworld.war /usr/local/tomcat/webapps/.
