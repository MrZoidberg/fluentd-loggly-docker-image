FROM fluent/fluentd:latest
MAINTAINER Mikha Merkulov

ENV PATH /home/ubuntu/ruby/bin:$PATH

RUN gem install fluent-plugin-loggly

USER ubuntu
WORKDIR /home/ubuntu

COPY docker-entrypoint.sh /fluentd/entrypoint.sh
#RUN chown -R ubuntu:ubuntu /entrypoint.sh
#RUN chmod +x /entrypoint.sh

EXPOSE 24224

CMD ["/bin/bash", "/fluentd/entrypoint.sh"]
