FROM ubuntu:latest
WORKDIR /app
RUN apt-get update && apt-get install -y curl gnupg2
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add
RUN curl -sSL https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list | tee /etc/apt/sources.list.d/microsoft-prod.list
RUN apt-get update && apt-get install -y powerbi-cli
RUN powerbi-cli --version
COPY . .
EXPOSE 8080
CMD ["powerbi-cli", "--help"]