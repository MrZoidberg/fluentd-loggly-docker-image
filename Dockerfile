FROM fluent/fluentd:latest
MAINTAINER Mikha Merkulov

ENV PATH /home/ubuntu/ruby/bin:$PATH

RUN gem install fluent-plugin-loggly

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 24224

USER ubuntu
WORKDIR /home/ubuntu

ENTRYPOINT ["/entrypoint.sh"]
CMD ["fluentd", "-v", "-c", "/fluentd/etc/$FLUENTD_CONF", "-p", "/fluentd/plugins $FLUENTD_OPT"]
