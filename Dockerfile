FROM ubuntu:latest

ENV REFRESHED_AT 2015-7-28
RUN apt-get -yqq update
RUN apt-get -yqq install tomcat7 default-jdk

ENV CATALINA_HOME /usr/share/tomcat7
ENV CATALINA_BASE /var/lib/tomcat7
ENV CATALINA_PID  /var/run/tomcat7.pid
ENV CATALINA_SH   /usr/share/tomcat7/bin/catalina.sh
ENV CATALINA_TMPDIR /tmp/tomcat7-tomcat7-tmp
COPY ./ /var/lib/tomcat7/webapps

RUN mkdir -p $CATALINA_TMPDIR
VOLUME ["/var/lib/tomcat7/webapps/"]
EXPOSE 8080 9000
ENTRYPOINT ["/usr/share/tomcat7/bin/catalina.sh", "run" ]
