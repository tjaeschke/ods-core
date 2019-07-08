FROM openshift/base-centos7

ARG RUNDECK_VERSION='2.11.8-1.59.GA'
ENV RDECK_BASE '/var/lib/rundeck'
ENV RDECK_CONFIG '/etc/rundeck'

# Http port
EXPOSE 4440

#RUN adduser -r -G root rundeck

# Where to store the DB and project definitions and logs
VOLUME ["/var/rundeck", "/var/lib/rundeck/logs"]

# Install java and xsltproc
RUN yum install -y java-1.8.0-openjdk

# Install rundeck
RUN yum install -y http://repo.rundeck.org/latest.rpm \
    && yum install -y rundeck-${RUNDECK_VERSION} rundeck-config-${RUNDECK_VERSION} \
    && yum clean all

COPY run.sh $RDECK_BASE/bin/

# Create rundeck folders and give appropriate permissions
RUN mkdir -p $RDECK_BASE \
    && chown -R rundeck:root /var/rundeck \
    && chown -R rundeck:root $RDECK_BASE \
    && chmod -R a+rw $RDECK_BASE \
    && chmod -R a+rw /var/log/rundeck \
    && chmod -R a+rw /tmp/rundeck \
    && mkdir -p /rundeck-config \
    && chown -R rundeck:root /rundeck-config \
    && chmod -R a+rw $RDECK_CONFIG \
    && chmod -R a+rwx /rundeck-config \
    && chmod a+x $RDECK_BASE/bin/run.sh

WORKDIR $RDECK_BASE

ENTRYPOINT ["./bin/run.sh"]
