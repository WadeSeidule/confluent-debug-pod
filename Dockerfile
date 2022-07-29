FROM python:3.8

# install dependancies
RUN apt-get update
RUN apt-get install -y zsh gettext-base wget software-properties-common apt-transport-https curl vim jq kafkacat

# oh my zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY ./pod.zshrc ./
RUN mv ./pod.zshrc ~/.zshrc

# confluent cli
COPY ./confluent-creds.netrc ./
COPY ./setup-confluent.sh ./
RUN curl -sL --http1.1 https://cnfl.io/cli | sh -s -- -b /usr/local/bin latest
RUN chmod +x ./setup-confluent.sh

# psql client - See https://www.postgresql.org/download/linux/ubuntu/
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" | tee  /etc/apt/sources.list.d/pgdg.list
RUN apt-get update
RUN apt-get -y install postgresql-client-12

# terraform cli - See https://learn.hashicorp.com/tutorials/terraform/install-cli
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && apt-get install terraform=1.1.7

ENTRYPOINT [ "/bin/zsh", "./setup-confluent.sh" ]