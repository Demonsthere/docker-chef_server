FROM ubuntu:12.04

MAINTAINER Jakub Błaszczyk <jakub.blaszczyj@sap.com>

ENV TERM=xterm

RUN apt-get update
RUN apt-get install -y wget cron net-tools

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl
RUN sysctl -w kernel.shmall=4194304
RUN sysctl -w kernel.shmmax=17179869184

RUN wget --no-check-certificate https://packages.chef.io/stable/ubuntu/12.04/chef-server_11.1.4-1_amd64.deb
RUN dpkg -i chef-server_*.deb
RUN rm chef-server_*.deb

ADD run_chef /
ADD chef-server.rb /etc/chef-server/
ADD keys/chef-validator.pem /etc/chef-server/

ENTRYPOINT ["sh", "run_chef"]