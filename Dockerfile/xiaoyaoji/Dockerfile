FROM tomcat:jdk8-openjdk
COPY xiaoyaoji.war /tmp/
RUN unzip /tmp/xiaoyaoji.war -d /tmp/xiaoyaoji && \cp -a /tmp/xiaoyaoji/* /usr/local/tomcat/webapps/ROOT && \
    sed -i 's/127.0.0.1/mysql/' /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/config.properties && \
    rm -rf /tmp/*
