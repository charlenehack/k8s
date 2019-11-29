FROM docker.elastic.co/elasticsearch/elasticsearch:6.3.2
# 安装定制版ik分词插件
RUN sh -c '/bin/echo y' | /usr/share/elasticsearch/bin/elasticsearch-plugin install http://www1.wow-trend.com/elasticsearch-analysis-ik-6.3.2.zip
COPY config/* /usr/share/elasticsearch/config/analysis-ik/
