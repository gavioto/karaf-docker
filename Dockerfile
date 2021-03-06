FROM java:openjdk-7
MAINTAINER mkroli
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

RUN wget http://apache.openmirror.de/karaf/3.0.3/apache-karaf-3.0.3.tar.gz; \
    mkdir /opt/karaf; \
    tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-3.0.3.tar.gz; \
    rm apache-karaf-3.0.3.tar.gz; \
    mkdir /deploy; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/karaf/etc/org.apache.felix.fileinstall-deploy.cfg

VOLUME ["/deploy"]
EXPOSE 1099 8101 44444
ENTRYPOINT ["/opt/karaf/bin/karaf"]
