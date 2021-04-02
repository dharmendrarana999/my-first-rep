FROM tomcat

ADD target/first-web-app.war /usr/local/tomcat/webapps/.
