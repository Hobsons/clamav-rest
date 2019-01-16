FROM hobsonspipe/centos-java8

MAINTAINER lokori <antti.virtanen@iki.fi>

COPY . /root/

RUN yum install -y maven

RUN cd /root/ && mvn install -DskipTests

ENV HOME /root
# Get the JAR file 
CMD mkdir /var/clamav-rest
COPY target/clamav-rest-1.0.2.jar /var/clamav-rest/

# Define working directory.
WORKDIR /var/clamav-rest/

# Open up the server 
EXPOSE 80

ADD bootstrap.sh /
ENTRYPOINT ["/bootstrap.sh"]

