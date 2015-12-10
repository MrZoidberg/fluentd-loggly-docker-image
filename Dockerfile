FROM fluent/fluentd:latest
MAINTAINER Mikha Merkulov

ENV PATH /home/ubuntu/ruby/bin:$PATH

RUN gem install fluent-plugin-loggly

USER ubuntu
WORKDIR /home/ubuntu

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 24224

ENTRYPOINT ["/entrypoint.sh"]
CMD ["fluentd", "-v", "-c", "/fluentd/etc/$FLUENTD_CONF", "-p", "/fluentd/plugins $FLUENTD_OPT"]
