FROM java:7

RUN \
  cd /tmp && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.tar.gz && \
  tar xvzf elasticsearch-1.3.2.tar.gz && \
  rm -f elasticsearch-1.3.2.tar.gz && \
  mv /tmp/elasticsearch-1.3.2 /elasticsearch

VOLUME ["/data"]

ADD elasticsearch.yml /elasticsearch/config/

WORKDIR /data

ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]

EXPOSE 9200 9300
