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
RUN sudo apt-get update

# For specific versions, install ClickHouse server and client by using:
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y clickhouse-server=23.12.2.59 clickhouse-client=23.12.2.59 clickhouse-common-static=23.12.2.59

# Install latest stable version of ClickHouse server and client
# RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y clickhouse-server clickhouse-client

# Install useful stuff
RUN sudo apt install -y nano && sudo apt install -y less && sudo apt-get install -y lsof

# Copy config files before running the server
COPY clickhouse_config/log_level.xml clickhouse_config/config.xml /etc/clickhouse-server/config.d
COPY clickhouse_config/users.xml /etc/clickhouse-server/users.d

# start clickhouse server
# RUN service clickhouse-server start
# create admin user
# RUN clickhouse-client --query "CREATE USER admin IDENTIFIED WITH sha256_password BY 'admin'";


# restart clickhouse server to pick new user settings
# RUN service clickhouse-server restart
