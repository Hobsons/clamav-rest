FROM hobsonspipe/centos-java8

MAINTAINER lokori <antti.virtanen@iki.fi>

COPY . /root/

RUN yum install -y maven

RUN cd /root/ && mvn install -DskipTests

ENV HOME /root

RUN mkdir /var/clamav-rest \
&& cp /root/target/clamav-rest-1.0.2.jar /var/clamav-rest/

# Define working directory.
WORKDIR /var/clamav-rest/

# Open up the server 
EXPOSE 8080

ADD bootstrap.sh /
ENTRYPOINT ["/bootstrap.sh"]

