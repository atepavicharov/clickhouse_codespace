FROM ubuntu

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y sudo

# Based on https://clickhouse.com/docs/install/debian_ubuntu
# Install prerequisite packages
RUN sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# Download the ClickHouse GPG key and store it in the keyring
RUN curl -fsSL 'https://packages.clickhouse.com/rpm/lts/repodata/repomd.xml.key' | sudo gpg --dearmor -o /usr/share/keyrings/clickhouse-keyring.gpg

# Get the system architecture
RUN ARCH=$(dpkg --print-architecture) \ 
    && echo "deb [signed-by=/usr/share/keyrings/clickhouse-keyring.gpg arch=${ARCH}] https://packages.clickhouse.com/deb stable main" | sudo tee /etc/apt/sources.list.d/clickhouse.list

# Update apt package lists
# RUN sudo apt-get update

# Install ClickHouse server and client
# RUN sudo apt-get install -y clickhouse-server clickhouse-client
