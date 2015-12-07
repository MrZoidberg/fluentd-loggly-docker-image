FROM fluent/fluentd:latest
MAINTAINER Mikha Merkulov
USER ubuntu
WORKDIR /home/ubuntu
ENV PATH /home/ubuntu/ruby/bin:$PATH

RUN gem install fluent-plugin-loggly

COPY docker-entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 24224

### docker run -p 24224 -v `pwd`/log: -v `pwd`/log:/home/ubuntu/log fluent/fluentd:latest
CMD ["fluentd", "-v", "-c", "/fluentd/etc/$FLUENTD_CONF", "-p", "/fluentd/plugins $FLUENTD_OPT"]
