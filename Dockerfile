FROM ruby:2.4


RUN  apt-get update &&\
        apt-get install -y --no-install-recommends sqlite3 libsqlite3-dev libgmp3-dev libmariadbd-dev && \
        apt-get remove --purge --auto-remove -y && \
        useradd hitobito -m

# USER hitobito

COPY hitobito /home/hitobito/hitobito
COPY hitobito_youth /home/hitobito/hitobito_youth
COPY hitobito_pbs /home/hitobito/hitobito_pbs

WORKDIR /home/hitobito/hitobito

RUN cp Wagonfile.ci Wagonfile && \
        cp Gemfile.lock ../hitobito_youth/ && \
        cp Gemfile.lock ../hitobito_pbs/ && \
        bundle && \
        rake db:create && \
        rake db:setup:all

EXPOSE 3000 1080
ENTRYPOINT ["rails"]
CMD ["server", "-b", "0.0.0.0"]