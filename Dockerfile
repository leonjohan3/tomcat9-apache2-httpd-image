FROM leonjohan3atyahoodotcom/ubuntu-generic:1.0.0

ENV TOMCAT9_APACHE2_HTTPD_IMAGE_VERSION=1.0.0

LABEL maintainer="leonjohan3@gmail.com" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
      description="Docker image that provides tomcat9 and apache2 httpd as a sidecar" \
      tomcat9_apache2_httpd_image.version="${TOMCAT9_APACHE2_HTTPD_IMAGE_VERSION}"

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y update \
    && apt-get -y upgrade -o Dpkg::Options::="--force-confold" \
    && apt-get -y update \
    && apt-get -y install default-jre libtcnative-1 apache2 tomcat9 \
    && apt-get -y clean \
    && chmod g+w /usr/share/tomcat9/lib \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && rm -r /usr/share/man \
    && rm -r /usr/share/doc \
    && unlink /usr/share/tomcat9/lib/tomcat-websocket.jar \
    && unlink /usr/share/tomcat9/lib/websocket-api.jar \
    && unlink /usr/share/tomcat9/lib/catalina-tribes.jar \
    && unlink /usr/share/tomcat9/lib/catalina-storeconfig.jar \
    && unlink /usr/share/tomcat9/lib/catalina-ha.jar \
    && unlink /usr/share/tomcat9/lib/catalina-ant.jar \
    && unlink /usr/share/tomcat9/lib/jasper.jar \
    && unlink /usr/share/tomcat9/lib/tomcat-i18n-es.jar \
    && unlink /usr/share/tomcat9/lib/tomcat-i18n-fr.jar \
    && unlink /usr/share/tomcat9/lib/tomcat-i18n-ja.jar \
    && unlink /usr/share/tomcat9/lib/tomcat-i18n-ru.jar
    
# Run as the default user (to be set in the leaf image)
